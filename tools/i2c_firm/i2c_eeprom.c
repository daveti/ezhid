/*
 *
 * $Id: i2c_eeprom.c,v 1.5 2003/10/20 21:33:28 arniml Exp $
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

#undef PROBLEMATIC_CODE


/* global variable to exchange error status codes */
xdata Byte err_buf;


/*****************************************************************************
 * error(err)
 *
 * Copies the error code to the global variable and sends an I2C stop
 * condition.
 *
 * Input:
 *   err : error code
 *
 *****************************************************************************/
static void error(Byte err)
{
   err_buf = err;
   /* send stop on error */
   I2CS = 0x40;
}


/*****************************************************************************
 * wait_done_write(err_code)
 *
 * Waits for DONE.
 * Generates a global error upon BERR or missing ACK.
 *
 * Input:
 *   err_code : error code
 * Return value:
 *   1 upon success, 0 otherwise
 *
 *****************************************************************************/
static Byte wait_done_write(Byte err_code)
{
   Byte result;

   /* wait for bit 0 (DONE) to be '1' */
   do {
      result = I2CS;
   } while (!(result & 0x01));

   if ((result & 0x04) || !(result & 0x02)) {
      result = 0;
      error(err_code);
   } else
      result = 1;

   return(result);
}


/*****************************************************************************
 * wait_done_read(err_code)
 *
 * Waits for DONE.
 * Generates a global error upon BERR.
 *
 * Input:
 *   err_code : error code
 * Return value:
 *   1 upon success, 0 otherwise
 *
 *****************************************************************************/
static Byte wait_done_read(Byte err_code)
{
   Byte result;

   /* wait for bit 0 (DONE) to be '1' */
   do {
      result = I2CS;
   } while (!(result & 0x01));

   if (result & 0x04) {
      result = 0;
      error(err_code);
   } else
      result = 1;

   return(result);
}


/*****************************************************************************
 * wait_done()
 *
 * Waits for DONE.
 *
 *****************************************************************************/
static void wait_done()
{
   /* wait for bit 0 (DONE) to be '1' */
   while (!(I2CS & 0x01));
}


/*****************************************************************************
 * wait_stop()
 *
 * Waits for STOP condition.
 *
 *****************************************************************************/
static void stop_check()
{
   /* wait for bit 6 (STOP) to be '0' */
   while (I2CS & 0x40);
}


/*****************************************************************************
 * i2c_write_eeprom(i2c_addr, address, length, *buffer, pagesize,
 *                  has_16bit_addr)
 *
 * Writes the provided data to the I2C EEPROM.
 * This routine uses the specified pagesize to achieve maximum performance.
 * Beginning at the start address the current page is filled and consecutive
 * pages are written until all data has been processed.
 *
 * Input:
 *   i2c_addr       : I2C address of EEPROM
 *   address        : byte address of first location to be read
 *   length         : number of bytes to read from EEPROM
 *   buffer         : pointer to byte array containing the data
 *   i2c_pagesize   : pagesize of EEPROM
 *   has_16bit_addr : 1 if EEPROM uses 16 bit addressing,
 *                    0 is EEPROM uses  8 bit addressing
 * Return value:
 *   1 upon success, 0 otherwise
 *
 *****************************************************************************/
Byte i2c_write_eeprom(Byte i2c_addr, UInt16 address, UInt16 length, 
                      xdata Byte *buffer, Byte pagesize, Byte has_16bit_addr)
{
#ifdef PROBLEMATIC_CODE
   Byte num_write;
#else
   UInt16 num_write;
#endif
   Byte i;

   /* wait for end-of-stop from former stop condition */
   stop_check();

   while (length) {
      /* generate start condition and send control */
      I2CS  = 0x80;
      I2DAT = 0xa0 | (i2c_addr << 1);
      if (!wait_done_write(0x20))
         return(0);

      if (has_16bit_addr) {
         I2DAT = (Byte)(address >> 8);
         if (!wait_done_read(0x21))
            return(0);
      }
      I2DAT = (Byte)(address & 0xff);
      if (!wait_done_read(0x22))
         return(0);

      /* now transmit data
         in order to make use of pagewise writing, we have to
         align to pages */
#ifdef PROBLEMATIC_CODE
      num_write = (Byte)(address & 0xff) % pagesize;
      num_write = pagesize - num_write;
#else
      num_write = address % (UInt16)pagesize;
      num_write = (UInt16)pagesize - num_write;
#endif

      /* we'd like to fill the current page
         do we really need to write that much? */
#ifdef PROBLEMATIC_CODE
      if (length < (UInt16)num_write)
         num_write = (Byte)(length & 0xff);
#else
      if (length < num_write)
         num_write = length;
#endif

      i = (Byte)(num_write & 0xff);
      while (i-- > 0) {
         I2DAT = *(buffer++);
         if (!wait_done_write(0x23))
            return(0);
      }

      /* send stop and wait for completion of previous command */
      I2CS  = 0x40;
      stop_check();

      /* initiate a write and send immediate stop to poll the EEPROM
         if it has completed the write access */
      while (TRUE) {
         I2CS  = 0x80;
         I2DAT = 0xa0 | (i2c_addr << 1);
         wait_done();
         I2CS  = 0x40;
         stop_check();
         if (I2CS & 0x02)
            break;
      }

      /* update length information and write next page */
      length  -= num_write;
      address += num_write;
   }

   return(1);
}


/*****************************************************************************
 * i2c_read_eeprom(i2c_addr, address, length, *buffer, has_16bit_addr)
 *
 * Reads data from the I2C EEPROM.
 * Starting from the specified address, continuous bytes are read from the
 * EEPROM and copied to the buffer array.
 *
 * Input:
 *   i2c_addr       : I2C address of EEPROM
 *   address        : byte address of first location to be read
 *   length         : number of bytes to read from EEPROM
 *   buffer         : pointer to byte array containing the data
 *   has_16bit_addr : 1 if EEPROM uses 16 bit addressing,
 *                    0 is EEPROM uses  8 bit addressing
 * Output:
 *   fills in buffer with the retrieved data
 * Return value:
 *   1 upon success, 0 otherwise
 *
 *****************************************************************************/
Byte i2c_read_eeprom(Byte i2c_addr, UInt16 address, UInt16 length,
                     xdata Byte *buffer, Byte has_16bit_addr)
{

   /* wait for end-of-stop from former stop condition */
   stop_check();

   /* generate new start condition for control on write */
   I2CS  = 0x80;
   I2DAT = 0xa0 | (i2c_addr << 1);
   if (!wait_done_read(0x24))
      return(0);

   /* send new address */
   if (has_16bit_addr) {
      I2DAT = (Byte)(address >> 8);
      if (!wait_done_read(0x25))
         return(0);
   }
   I2DAT = (Byte)(address & 0xff);
   if (!wait_done_read(0x26))
         return(0);

   /* send stop */
   I2CS  = 0x40;
   stop_check();

   /* generate new start condition with control on read */
   I2CS  = 0x80;
   I2DAT = 0xa1 | (i2c_addr << 1);
   if (!wait_done_read(0x27))
      return(0);

   /* dummy read to I2DAT to initiate first read */
   *buffer = I2DAT;

   /* read all but the last 2 bytes */
   while (length-- > 0) {
      if (!wait_done_read(0x28))
         return(0);

      *(buffer++) = I2DAT;
   }
   if (!wait_done_read(0x29))
      return(0);

   /* read second-to-last byte with LastRD = 1 */
   I2CS  = 0x20;
   *(buffer++) = I2DAT;
   if (!wait_done_read(0x2a))
      return(0);

   /* read last byte and set stop condition */
   *buffer = I2DAT;
   if (!wait_done_read(0x2b))
      return(0);
   I2CS  = 0x40;
   stop_check();

   return(1);
}


/*
 * Change History:
 * ===============
 *
 * $Log: i2c_eeprom.c,v $
 * Revision 1.5  2003/10/20 21:33:28  arniml
 * in
 *
 * Revision 1.4  2003/10/19 13:48:05  arniml
 * move change history
 *
 * Revision 1.3  2003/09/21 09:50:24  arniml
 * fix typo
 *
 * Revision 1.2  2002/08/30 20:39:04  arniml
 * make PROBLEMATIC_CODE definable and thus usable for debugging
 *
 * Revision 1.1  2002/08/26 20:09:03  arniml
 * initial checkin
 *
 */
