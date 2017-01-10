/*
 *
 * $Id: amikbd.c,v 1.7 2004/02/15 01:09:43 arniml Exp $
 *
 * Copyright (C) 2003, Arnim Laeuger
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


#include "amikbd.h"
#include "globals.h"
#include "all_ext.h"


/*
 * Interrupt functions must be declared in the main file.
 * Otherwise SDCC won't add them in the interrupt jump table
 */
void usb_isr(void) interrupt 8 using 1;
void resume_isr(void) interrupt 6 using 2;
void setup_usb_int(void);
void apply_reset_values(void);



/*****************************************************************************
 * amikbd_comm()
 *
 * Implements the serial communication with the Amiga keyboard.
 * The serial port is operated in bit-banging mode as the AN2131 lacks a
 * synchronous serial port which can be clocked externally.
 * See the macros in amikbd.h for the mapping of KCLK and KDAT to port pins.
 *****************************************************************************/
static void amikbd_comm(void)
{
  Byte keycode;
  Byte mod_map;
  Byte receive_cnt;
  Byte i;
  bit  parse_keycode;

  while (TRUE) {
    /* initialize vars */
    keycode   = 0;

    /* **************************************************
     * receive seven bits
     * **************************************************/
    for (receive_cnt = 7; receive_cnt > 0; receive_cnt--) {
      /* shift character to prepare the bit */
      keycode <<= 1;

      /* wait for KBD_CLOCK to be low */
      while (KBD_CLOCK_PORT & KBD_CLOCK_PIN) ;

      /* sample KBD_DATA and invert*/
      if (!(KBD_DATA_PORT & KBD_DATA_PIN))
        keycode |= 1;

      /* wait for KBD_CLOCK to be high */
      while (!(KBD_CLOCK_PORT & KBD_CLOCK_PIN)) ;
    }

    /* **************************************************
     * finally receive MSB
     * **************************************************/
    while (KBD_CLOCK_PORT & KBD_CLOCK_PIN) ;
    /* sample KBD_DATA and invert*/
    if (KBD_DATA_PORT & KBD_DATA_PIN)
      keycode |= AMIKBD_PRESSED;
    while (!(KBD_CLOCK_PORT & KBD_CLOCK_PIN)) ;


    /* **************************************************
     * Begin handshake for character reception
     * **************************************************/
    TL0 = TIMER0_LOW;
    TH0 = TIMER0_HIGH;
    KBD_DATA_OE |= KBD_DATA_PIN;   /* pull data line low */
    TR0 = TRUE;

    /* **************************************************
     * Process the keycode while handshaking.
     * **************************************************/

    switch (keycode)
      {
      case AMIKBD_RESET_WARNING:
      case AMIKBD_LAST_KEYCODE_BAD:
      case AMIKBD_BUFFER_OVERFLOW:
      case AMIKBD_UNUSED_1:
      case AMIKBD_SELFTEST_FAILED:
      case AMIKBD_INIT_PWRUP_KEYS:
      case AMIKBD_TERM_PWRUP_KEYS:
      case AMIKBD_UNUSED_2:
        break;

      default:
        parse_keycode = FALSE;
        switch (keycode & AMIKBD_KEY) {
            /* CAPS LOCK */
          case AMIKBD_CAPSLOCK:
            /* Whenever the keyboard signals a manipulation of the CAPS LOCK
               key we have to send a key-press event first.
               The key-release event is generated automatically from within
               the timer ISR. */
            keycode      |= AMIKBD_PRESSED;
            caps_operated = TRUE;
            mod_map       = 0;
            parse_keycode = TRUE;
            break;

            /* control */
          case 0x63:
            mod_map = 0x01;
            break;

            /* left shift */
          case 0x60:
            mod_map = 0x02;
            break;

            /* left alt */
          case 0x64:
            mod_map = 0x04;
            break;

            /* left amiga */
          case 0x66:
            mod_map = 0x08;
            break;

            /* right shift */
          case 0x61:
            mod_map = 0x20;
            break;

            /* right alt */
          case 0x65:
            mod_map = 0x40;
            break;

            /* right amiga */
          case 0x67:
            mod_map = 0x80;
            break;

          default:
            mod_map       = 0;
            parse_keycode = TRUE;
            break;

          }

        /* examine modifier and update the report */
        if (mod_map) {
          /* pressed or released? */
          if (keycode & AMIKBD_PRESSED) {
            /* pressed -> set corresponding bit in the report */
            key_buffer[0] |= mod_map;
            kbd_new_keys   = TRUE;
          } else {
            /* released -> clear corresponding bit in the report */
            key_buffer[0] &= ~mod_map;
            kbd_new_keys   = TRUE;
          }
        }

        /* if requested, convert the keycode and update the report */
        if (parse_keycode) {
          /* pressed or released? */
          if (keycode & AMIKBD_PRESSED) {
            /* pressed -> note key in the first free entry */
            keycode &= AMIKBD_KEY;
            keycode = keycode_map[keycode];
            i = 2;
            while (i < 8) {
              if (!key_buffer[i]) {
                key_buffer[i] = keycode;
                break;
              }
              i++;
            }
            kbd_new_keys = TRUE;

          } else {
            /* released -> search keycode in report and set entry to 0 */
            keycode = keycode_map[keycode];
            i = 7;
            while (i > 1) {
              if (key_buffer[i] == keycode)
                key_buffer[i] = 0;
              i--;
            }
            kbd_new_keys = TRUE;

          }

        }
        break;

      }

    /* wait until timer0 has elapsed
     * we spend more or less time here depending on the path through the above
     * switch-constructs */
    while (!TF0) ;
    KBD_DATA_OE &= ~KBD_DATA_PIN;  /* release data line */
    TR0 = FALSE;
    TF0 = FALSE;

  }
}


/*****************************************************************************
 * timer2_isr()
 *
 * Timer 2 interrupt service routine
 * This routine is called every 4 ms. If the keytable has changed, a IN1
 * transfer is triggered immediately.
 * If nothing happened, behaviour depends on the IDLE mode and the idle
 * duration setting.
 *****************************************************************************/
static void timer2_isr() interrupt 5 using 3 critical
{
  bit kbd_send_report;
  register Byte i;

  if (TF2) {
    TF2 = 0;

    /*
     * Keyboard service
     */
    kbd_send_report = FALSE;

    /* send report for CAPS LOCK emulation */
    if (caps_send_release) {
      caps_send_release = FALSE;
      /* emulate a key-release */
      i = 8;
      while (i-- > 2)
        if (key_buffer[i] == USB_CAPSLOCK)
          key_buffer[i] = 0;
      kbd_send_report   = TRUE;
    }

    /* send report if we reached the idle duration */
    if (!kbd_idle_mode) {
      if (--kbd_idle_counter == 0) {
        kbd_send_report  = TRUE;
        /* reload counter */
        kbd_idle_counter = kbd_idle_duration;
      }
    }

    /* send report if the keys have been changed */
    if (kbd_new_keys) {
      kbd_send_report     = TRUE;
      kbd_new_keys        = FALSE;
      /* reload counter */
      kbd_idle_counter    = kbd_idle_duration;

      /* bookkeeping for CAPS LOCK emulation */
      if (caps_operated) {
        caps_operated     = FALSE;
        caps_send_release = TRUE;
      }
    }


    if (kbd_send_report) {
      if (!in1_busy) {
        i = 8;
        while (i-- > 0)
          in1buf(i) = key_buffer[i];

        /* transfer the key buffer to endpoint IN1 */
        in1_busy = TRUE;
        IN1BC    = 8;
      }
    }
  }
}


/*****************************************************************************
 * core_apply_reset_values()
 *
 * Applies inital reset values to global variables where necessary.
 * This is not done directly in the variable declaration because these
 * values are required after an USB reset as well.
 */
void core_apply_reset_values() using 1
{
  kbd_new_keys        = 0;
  kbd_idle_mode       = FALSE;
  kbd_idle_duration   = 125;

  caps_operated       = FALSE;
  caps_send_release   = FALSE;
}


/*****************************************************************************
 * setup_timer2_int()
 *
 * Setup timer 2 interrupt.
 *****************************************************************************/
static void setup_timer2_int()
{
   /* set idle counter */
   kbd_idle_counter = kbd_idle_duration;

   /*
    * configure timer2:
    * + timer with auto reload
    * + rate is 250 Hz
    */
   T2CON  = 0x00;
   RCAP2H = TH2 = 0xc1;
   RCAP2L = TL2 = 0x80;

   /* enable timer 2 interrupt */
   ET2    = 1;
   /* clear timer 2 interrupt */
   TF2    = 0;
   /* start timer 2 */
   TR2    = 1;
}


/*****************************************************************************
 * setup_keyboard()
 *
 * Setup keyboard communication.
 *****************************************************************************/
static void setup_keyboard(void)
{
  Byte i;

  /* the pins for KBD_CLOCK and KBD_DATA are set to input direction */
  KBD_CLOCK_OE  &= ~KBD_CLOCK_PIN;
  KBD_DATA_OE   &= ~KBD_DATA_PIN;

  /* the KBD_DATA pin should be in '0' state for the handshakes */
  KBD_DATA_OUT  &= ~KBD_DATA_PIN;
  
  /*
   * Setup keyboard buffer and related things
   */
  i = 7;
  do {
    key_buffer[i] = 0;
  } while (i-- > 0);
  
}


/*****************************************************************************
 * setup_timer0()
 *
 * Setup the timer0.
 * This timer will be used to time the handshake duration after a keycode
 * has been received.
 *****************************************************************************/
static void setup_timer0(void)
{
  /* stop timer0 */
  TR0   = FALSE;
  /* disable timer0 interrupt */
  TF0   = FALSE;
  ET0   = FALSE;

  /* configure timer0:
   * + mode 1
   * + timer operation
   */
  TMOD  = 1;
}


/*****************************************************************************
 * _sdcc_external_startup()
 *
 * Earliest possibility to disconnect for re-enumeration.
 * This is not necessary when the firmware resides in the onboard I2C EEPROM
 * where the master control is handed back to the USB core to let it talk to
 * the host. Afterwards we perform a clean re-enumeration.
 *****************************************************************************/
Byte _sdcc_external_startup()
{
#if !defined (ROM_FIRMWARE)
  register Byte i;

  /* delay a bit to let the USB communication handshake to the downloader
     settle */
  for (i = 2; i > 0; i--) ;

  /* disconnect immediately */
  USBCS &= ~0x04;               /* tristate the Disconnect pin */
  USBCS |= 0x08;                /* disconnect USB core         */
#endif

  return(0);
}


/*****************************************************************************
 * main()
 *
 * Main function.
 * Call initializers, trigger re-enumeration and stay busy in endless loop.
 * All functionality is handled in the interrupt service routines.
 *****************************************************************************/
void main()
{
#if !defined (ROM_FIRMWARE)
  int loop;

  loop = 16384;
  while (loop-- > 0) ;
#endif

  /* initialize global variables */
  apply_reset_values();

  setup_usb_int();

  setup_keyboard();

  setup_timer2_int();

  setup_timer0();

#if !defined (ROM_FIRMWARE)
  USBCS |= 0x02;                /* activate RENUM                     */
  USBCS &= ~0x08;               /* deactivate DISCON                  */
  USBCS |= 0x04;                /* release tristate on Disconnect pin */
#endif

  amikbd_comm();

  while (TRUE) ;
}




/*****************************************************************************
 *
 * Change History:
 * ===============
 *
 * $Log: amikbd.c,v $
 * Revision 1.7  2004/02/15 01:09:43  arniml
 * declare "using 1" for all functions called in interrupts
 *
 * Revision 1.6  2004/01/29 19:08:24  arniml
 * add short delay before disconnecting, will remove the time-out seen by
 * the download application
 *
 * Revision 1.5  2004/01/18 13:14:43  arniml
 * move apply_reset_values to usb_code.c
 *
 * Revision 1.4  2003/12/31 13:33:40  arniml
 * + emulate CAPS LOCK behaviour
 * + move change history
 *
 * Revision 1.3  2003/12/29 20:24:00  arniml
 * change commenting
 *
 * Revision 1.2  2003/12/26 11:18:21  arniml
 * basic functionality implemented
 *
 * Revision 1.1  2003/12/23 22:56:38  arniml
 * initial check-in
 */
