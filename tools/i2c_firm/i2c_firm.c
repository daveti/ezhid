/*
 *
 * $Id: i2c_firm.c,v 1.6 2003/10/20 21:33:28 arniml Exp $
 *
 * Copyright (C) 2002, 2003, Arnim Laeuger
 *
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2 of the License, or
 *  (at your option) any later version. See also the file COPYING which
 *  came with this application.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program; if not, write to the Free Software
 *  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 *
 */

#include <8051.h>

#include "ezusb_reg.h"
#include "i2c_eeprom.h"

/* if there's an LED at port C.3, the firmware can use it for 
   basic debugging */
#undef HAS_LED

#define EP0_BUFSIZE 64

#define setupdat(n) ((&SETUPDAT)[n])

/* reload count for IDLE situations */
#define IDLE_COUNT_RELOAD 40000
/* reload count for poll-during-write situations */
#define WRITE_COUNT_RELOAD 10000

#ifdef HAS_LED
/* global variable used for timing LED blinking */
static data UInt16 count;
#endif

#define RW_INTERNAL     0xA0  /* hardware implements this one */
#define RW_EEPROM       0xA2
#define RW_MEMORY       0xA3  /* not implemented yet          */
#define GET_EEPROM_SIZE	0xA5

/* global pointer */
#define in0buf(n)  (&IN0BUF)[n]

/*
 * Some EEPROM pagesizes taken from their databooks:
 *
 *  27xx00 :  1
 *  27xx01 :  8
 *  27xx16 : 16
 *  27xx32 : 32
 *  27xx64 : 32
 * 27xx128 : 64
 * 27xx256 : 64
 * 27xx515 : 64
 */

/*****************************************************************************
 * write_eeprom(i2c_addr, address, length, i2c_pagesize, has_16bit_addr)
 *
 * Writes the EEPROM with data received from the host via OUT0.
 *
 * Input:
 *   i2c_addr       : I2C address of EEPROM
 *   address        : byte address of first location to be read
 *   length         : number of bytes to read from EEPROM
 *   i2c_pagesize   : pagesize of EEPROM
 *   has_16bit_addr : 1 if EEPROM uses 16 bit addressing,
 *                    0 is EEPROM uses  8 bit addressing
 * Return value:
 *   1 upon success, 0 otherwise
 *
 *****************************************************************************/
static int write_eeprom(Byte i2c_addr, UInt16 address, UInt16 length,
                        Byte i2c_pagesize, Byte has_16bit_addr) {
   UInt16 num_receive;
   Byte result = 1;

   /* if pagesize is 0, set save default */
   if (i2c_pagesize == 0)
     i2c_pagesize = 1;

   while (length > 0) {
      /* wait for OUT0 to finish transaction */
#ifdef HAS_LED
      count = WRITE_COUNT_RELOAD;
#endif
      while (EP0CS & 0x08) {
#ifdef HAS_LED
         if (count-- == 0) {
            count = WRITE_COUNT_RELOAD;
            OUTC ^= 0x08;
         }
#endif
      }

      num_receive = (UInt16)OUT0BC;
      if (num_receive > 0) {
         result &= i2c_write_eeprom(i2c_addr, address, num_receive, &OUT0BUF,
                                    i2c_pagesize, has_16bit_addr);
         /* we have to receive the complete requested data although there
            might have been an error */
         length  -= num_receive;
         address += num_receive;
      }

      /* request new data from OUT0 */
      OUT0BC = 0;
   }

   /* clear OUT0 interrupt */
   OUT07IRQ = 0x01;

   return(result);
}


/*****************************************************************************
 * read_eeprom(i2c_addr, address, length, has_16bit_addr)
 *
 * Reads out EEPROM and sends data to the host via IN0.
 * The routine tries to fill complete packets for EP0 by calling the low-
 * level I2C routine consecutively.
 *
 * Input:
 *   i2c_addr       : I2C address of EEPROM
 *   address        : byte address of first location to be read
 *   length         : number of bytes to read from EEPROM
 *   has_16bit_addr : 1 if EEPROM uses 16 bit addressing,
 *                    0 is EEPROM uses  8 bit addressing
 * Return value:
 *   1 upon success, 0 otherwise
 *
 *****************************************************************************/
static int read_eeprom(Byte i2c_addr, UInt16 address, UInt16 length,
                       Byte has_16bit_addr) {
   Byte num_send;
   Byte result = 1;

   while (length > 0) {
      /* determine number of bytes to read from EEPROM
         maximum is restricted by EP0 buffer size */
      num_send = length > EP0_BUFSIZE ? EP0_BUFSIZE : (Byte)(length & 0xff);

      /* wait for IN0 to finish transaction */
      while (EP0CS & 0x04) ;

      result &= i2c_read_eeprom(i2c_addr, address, num_send, &IN0BUF,
                                has_16bit_addr);
      /* we have to send the complete requested data although there
         might have been an error */
      length  -= num_send;
      address += num_send;

      /* send data over IN0 */
      IN0BC = num_send;
   }

   if (num_send == EP0_BUFSIZE) {
      /* send the last 0-byte packet */
      while (EP0CS & 0x04) ;
      IN0BC = 0;
   }

   /* wait until IN0 packet has been transmitted */
   while (EP0CS & 0x04) ;
   /* clear IN0 interrupt */
   IN07IRQ = 0x01;

   return(result);
}


/*****************************************************************************
 * detect_address(setupdat_4, *has_16bit, *address)
 *
 * Performs autodetection of EEPROM type and I2C address.
 * This works only for the on-board I2C EEPROM that is used by the boot-
 * loader after power up.
 * Only the case where a 16 bit EEPROM is coded explicitely into I2CS is
 * relied on. All other combinations lead to the assumptions that an 8 bit
 * EEPROM is connected.
 *
 * Input:
 *   setupdat_4 : contents of byte 4 in SETUPDAT
 * Output:
 *   has_16bit  : 1 if EEPROM uses 16 bit addressing,
 *                0 is EEPROM uses  8 bit addressing
 *   address    : I2C address of EEPROM
 *
 *****************************************************************************/
void detect_address(Byte setupdat_4, Byte *has_16bit, Byte *address)
{
   if ((setupdat_4 & 0x0f) == 0) {
      /* autodetect */

      switch (I2CS & 0x18) {
         case 0x10:
            /* 16 bit address */
            *has_16bit = 1;
            *address   = 0x01;
            break;

         default:
            /* default is 8 bit address */
            *has_16bit = 0;
            *address   = 0x00;
            break;
      }

   } else {
      /* retrieve from request */
      if (setupdat_4 & 0x01)
         *has_16bit = 0;
      else
         *has_16bit = 1;

      *address = setupdat_4 >> 4;
   }
}


/*****************************************************************************
 * main()
 *
 * Main function.
 * Initializes USB subsystem, stays in a polling loop waiting for control
 * messages over EP0.
 *****************************************************************************/
void main()
{
   Byte result;
   Byte has_16bit_addr, i2c_address;

   /* clear autovector enable */
   USBBAV   = 0x00;
   /* disable all USB interrupts */
   USBIEN   = 0x00;
   /* clear SUDAV interrupt and all other interrupts */
   USBIRQ   = 0xff;

   /* enable IN0 interrupt */
   IN07IEN  = 0x01;
   /* clear OUT0 interrupt */
   OUT07IRQ = 0x01;

   /* validate endpoints */
   IN07VAL  = 0x01;
   OUT07VAL = 0x01;

   /* arm OUT0
      this one is really important, without it life would be troublesome
      because OUT0 packages get shifted and lost */
   OUT0BC = 0;


#ifdef HAS_LED
   /* initilize port C, bit 3
      a LED is expected here... */
   OUTC |= 0x08;
   PORTCCFG &= ~0x08;
   OEC  |= 0x08;

   count = IDLE_COUNT_RELOAD;
#endif

   while (TRUE) {
      if (USBIRQ & 0x01) {
         USBIRQ = 0x01;

         /* decode bRequest */
         switch (setupdat(1)) {

           /*************************************************************
            * bRequest == RW_EEPROM
            *************************************************************/
           case RW_EEPROM:

             /* decode bmRequestType */
             switch (setupdat(0)) {

               /* bmRequestType == vendor in */
               case 0xc0:
                 /* clear HSNACK
                    communication works only if HSNACK is cleared
                    _before_ processing the bulk transfers */
                 EP0CS |= 0x02;

                 /* determine I2C address size */
                 detect_address(setupdat(4), &has_16bit_addr, &i2c_address);

                 result = read_eeprom(i2c_address,
                                      (UInt16)setupdat(3) << 8 | setupdat(2),
                                      (UInt16)setupdat(7) << 8 | setupdat(6),
                                      has_16bit_addr);
#ifdef HAS_LED
                 if (result)
                   OUTC ^= 0x08;
                 count = IDLE_COUNT_RELOAD;
#endif

                 break;

               /* bmRequestType == vendor out */
               case 0x40:
                 /* clear HSNAK
                    communication works only if HSNACK is cleared
                    _before_ processing the bulk transfers */
                 EP0CS |= 0x02;

                 /* determine I2C address size */
                 detect_address(setupdat(4), &has_16bit_addr, &i2c_address);

                 result = write_eeprom(i2c_address,
                                       (UInt16)setupdat(3) << 8 | setupdat(2),
                                       (UInt16)setupdat(7) << 8 | setupdat(6),
                                       setupdat(5),
                                       has_16bit_addr);
#ifdef HAS_LED
                 if (result)
                   OUTC ^= 0x08;
                 count = IDLE_COUNT_RELOAD;
#endif

                 break;

                 /* unknown */
               default:
                 EP0CS |= 0x03;  /* stall */
                 break;
             }
             break;

           /*************************************************************
            * bRequest == GET_EEPROM_SIZE
            ************************************************************/
           case GET_EEPROM_SIZE :

             /* bmRequestType == vendor in */
             if (setupdat(0) == 0xc0) {
               /* clear HSNACK
                  communication works only if HSNACK is cleared
                  _before_ processing the bulk transfers */
               EP0CS |= 0x02;

               /* determine I2C address size
                  force autodetect */
               detect_address(0, &has_16bit_addr, &i2c_address);

               /* wait for IN0 to finish transaction */
               while (EP0CS & 0x04) ;
               in0buf(0) = has_16bit_addr;
               /* send the byte back to the host */
               IN0BC = 1;

             } else {
               EP0CS |= 0x03;  /* stall */
             }
             break;

           default :
             EP0CS |= 0x03;  /* stall */
             break;
         }
      } else {
#ifdef HAS_LED
         if (count-- == 0) {
            count = IDLE_COUNT_RELOAD;
            OUTC ^= 0x08;
         }
#endif
      }
   }
}


/*
 * Change History:
 * ===============
 *
 * $Log: i2c_firm.c,v $
 * Revision 1.6  2003/10/20 21:33:28  arniml
 * in
 *
 * Revision 1.5  2003/10/19 13:48:26  arniml
 * move change history
 *
 * Revision 1.4  2003/10/19 06:56:18  arniml
 * - use LED only upon #define
 * - stall EP0 for unsupported commands
 *
 * Revision 1.3  2003/10/18 00:09:28  arniml
 * - set default for pagesize if request defines 0
 * - change request for RW_EEPROM ot 0xA2
 * - experimental support for GET_EEPROM_SIZE request
 *
 * Revision 1.2  2003/09/21 09:18:09  arniml
 * Added type casts for setupdat when calling read_|write_eeprom.
 * There were warnings from the compiler and the resulting code did not work
 * in the intended way.
 * Former versions of SDCC didn't complain about that.
 *
 * Revision 1.1  2002/08/26 20:09:05  arniml
 * initial checkin
 *
 */
