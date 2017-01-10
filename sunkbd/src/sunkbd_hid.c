/*
 *
 * $Id: sunkbd_hid.c,v 1.27 2004/03/06 12:24:48 arniml Exp $
 *
 * Copyright (C) 2001 -- 2003, Arnim Laeuger
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
 *
 * Credits:
 * ========
 *
 *  + Vojtech Pavlik
 *      For providing a lot of hints about the keyboard protocol in his
 *      Sun keyboard driver (Linux Input Drivers package).
 *
 *  + Miguel de Icaza and David S. Miller
 *      For the Linux Sun mouse driver which was my only source of knowledge
 *      about Sun's mouse.
 *
 */


#include <8051.h>
#include "ezusb_reg.h"

#include "sunkbd_hid.h"


/*****************************************************************************
 * apply_reset_values()
 *
 * Applies inital reset values to global variables where necessary.
 * This is not done directly in the variable declaration because these
 * values are required after an USB reset as well.
 */
static void apply_reset_values()
{
   /* Keyboard related */
#if defined (KEYBOARD)
   kbd_txmit_me        = -1;
   kbd_new_keys        = 0;
   is_ctrl_out0_kbd    = 0;
   kbd_idle_mode       = FALSE;
   kbd_idle_duration   = 125;
   in1_busy            = FALSE;
#endif

   /* Mouse related */
#if defined (MOUSE)
   mouse_new_keys      = 0;
   is_ctrl_out0_mouse  = 0;
   mouse_idle_mode     = FALSE;
   mouse_idle_duration = 5;
   in2_busy            = FALSE;
#endif
}


/*****************************************************************************
 * get_descriptor()
 *
 * Sends the requested descriptor back to the host.
 * Currently supported descriptor types are:
 *   + device
 *   + configuration
 *   + string
 *   + HID
 *   + report
 *****************************************************************************/
#pragma save
#pragma nooverlay
static void get_descriptor(void) using 1
{
   switch (sdat->wValueH) {
         /* type: device */
      case USB_DT_DEVICE:
         EP0CS   = 0x02;   /* clear HSNACK */
         SUDPTRH = (Byte)((unsigned int)dev_desc >> 8);
         SUDPTRL = (unsigned int)dev_desc & 0xff;
         break;

         /* type: configuration */
      case USB_DT_CONFIG:
         EP0CS   = 0x02;   /* clear HSNACK */
         SUDPTRH = (Byte)((unsigned int)conf_desc >> 8);
         SUDPTRL = (unsigned int)conf_desc & 0xff;
         break;

         /* type: string */
      case USB_DT_STRING:
         if (sdat->wValueL < NUM_STRING) {
            EP0CS     = 0x02;   /* clear HSNACK */
            SUDPTRH = (Byte)(string_index[sdat->wValueL] >> 8);
            SUDPTRL = string_index[sdat->wValueL] & 0xff;
         } else {
            EP0CS     = 0x03;   /* stall */
         }
         break;

         /* type: HID */
      case USB_DT_HID:
#if defined (KEYBOARD) && defined (MOUSE)
         if (sdat->wIndexL == 0) {
            EP0CS   = 0x02;   /* clear HSNACK */
            /* send HID descriptor of keyboard */
            SUDPTRH = (Byte)(((unsigned int)conf_desc) + 18 >> 8);
            SUDPTRL = ((unsigned int)conf_desc) + 18 & 0xff;
         } else
            if (sdat->wIndexL == 1) {
               EP0CS   = 0x02;   /* clear HSNACK */
               /* send HID descriptor of mouse */
               SUDPTRH = (Byte)(((unsigned int)conf_desc) + 34 >> 8);
               SUDPTRL = ((unsigned int)conf_desc) + 34 & 0xff;
            } else
               EP0CS   = 0x03;   /* stall */
#else
         if (sdat->wIndexL == 0) {
#if defined (KEYBOARD) || defined (MOUSE)
               EP0CS   = 0x02;   /* clear HSNACK */
               /* send the HID descriptor (it's the only existing one) */
               SUDPTRH = (Byte)(((unsigned int)conf_desc) + 18 >> 8);
               SUDPTRL = ((unsigned int)conf_desc) + 18 & 0xff;
#else
               EP0CS   = 0x03;   /* stall */
#endif
         } else
            EP0CS   = 0x03;   /* stall */
#endif
         break;

         /* type: Report */
      case USB_DT_REPORT:
#if defined (KEYBOARD) && defined (MOUSE)
         if (sdat->wIndexL == 0) {
            EP0CS   = 0x02;   /* clear HSNACK */
            SUDPTRH = (Byte)((unsigned int)(report_desc_keyboard) >> 8);
            SUDPTRL = (unsigned int)(report_desc_keyboard) & 0xff;
         } else
            if (sdat->wIndexL == 1) {
               EP0CS   = 0x02;   /* clear HSNACK */
               SUDPTRH = (Byte)((unsigned int)(report_desc_mouse) >> 8);
               SUDPTRL = (unsigned int)(report_desc_mouse) & 0xff;
            } else
               EP0CS   = 0x03;   /* stall */
#else
         if (sdat->wIndexL == 0) {
#if defined (KEYBOARD)
            EP0CS   = 0x02;   /* clear HSNACK */
            SUDPTRH = (Byte)((unsigned int)(report_desc_keyboard) >> 8);
            SUDPTRL = (unsigned int)(report_desc_keyboard) & 0xff;
#elif defined (MOUSE)
            EP0CS   = 0x02;   /* clear HSNACK */
            SUDPTRH = (Byte)((unsigned int)(report_desc_mouse) >> 8);
            SUDPTRL = (unsigned int)(report_desc_mouse) & 0xff;
#else
            EP0CS   = 0x03;   /* stall */
#endif            
         } else
            EP0CS   = 0x03;   /* stall */
#endif
         break;

      default:
         EP0CS     = 0x03;   /* stall */
         break;
   }
}
#pragma restore


/*****************************************************************************
 * usb_isr()
 *
 * USB interrupt service routine
 * Performs five major tasks:
 *   + parse the SETUP packets upon SUDAV interrupt and answer them
 *   + ack IN0 interrupts
 *   + ack IN1 interrupts
 *   + ack IN2 interrupts
 *   + ack OUT0 interrupts and send the SETLED command to the keyboard
 *
 * According to the EZ-USB Technical Reference Manual it is essential to
 * clear HSNACK when stalling EP0 (see section 12.12).
 *****************************************************************************/
static void usb_isr(void) interrupt 8 using 1 critical
{
   /* clear INT2 interrupt */
   EXIF &= 0xef;

   /* was this the SUDAV interrupt? */
   if (USBIRQ & 0x01) {
      register Byte i;

      /* clear SUDAV interrupt */
      USBIRQ = 0x01;

      switch (sdat->bRequest) {

         /* bRequest == 0x00 */
         case 0x00:
            switch (sdat->bmRequestType) {
               /* GetStatus(Device) TODO */
               case 0x80:
                  /* GetStatus(Interface) */
               case 0x81:
                  /* GetStatus(Endpoint) TODO*/
               case 0x82:
                  in0buf(0) = 0x00;
                  in0buf(1) = 0x00;
                  IN0BC     = 0x02;
                  EP0CS     = 0x02;   /* clear HSNACK */
                  break;

               default:
                  EP0CS     = 0x03;   /* stall */
                  break;
            }
            break;

            /* bRequest == 0x01 */
         case 0x01:
            switch (sdat->bmRequestType) {
                  /* ClearFeature(Device) TODO */
               case 0x00:
                  EP0CS     = 0x02;   /* clear HSNACK */
                  break;
                  /* ClearFeature(Interface) TODO */
               case 0x01:
                  EP0CS     = 0x02;   /* clear HSNACK */
                  break;
                  /* ClearFeature(Endpoint) */
               case 0x02:
                  switch (sdat->wIndexL) {
                     /* ClearFeature(EP) should reset TOGGLE bit
                        (ref. USB spec 1.1, section 5.8.5) */
                     case 0x00:  /* OUT0 */
                        TOGCTL = 0x00;
                        TOGCTL = 0x20;
                        EP0CS  = 0x02;   /* clear HSNACK */
                        break;
                     case 0x80:  /* IN0  */
                        TOGCTL = 0x10;
                        TOGCTL = 0x30;
                        EP0CS  = 0x02;   /* clear HSNACK */
                        break;
                     case 0x81:  /* IN1  */
#if defined (KEYBOARD)
                        IN1CS &= 0xfe;
                        TOGCTL = 0x11;
                        TOGCTL = 0x31;
                        EP0CS  = 0x02;   /* clear HSNACK */
#else
                        EP0CS  = 0x03;   /* stall */
#endif
                        break;
                     case 0x82:  /* IN2  */
#if defined (MOUSE)
                        IN2CS &= 0xfe;  /* stall endpoint */
                        TOGCTL = 0x12;
                        TOGCTL = 0x32;
                        EP0CS  = 0x02;  /* clear HSNACK */
#else
                        EP0CS  = 0x03;   /* stall */
#endif
                        break;
                  }
                  break;

                  /* Get_Report TODO*/
               case 0xa1:
                  /* return a report over IN0BUF */
                  i = 7;
#if defined (KEYBOARD) && defined (MOUSE)
                  if (sdat->wIndexL == 0) {
                     while (i-- > 0)
                        in0buf(i) = key_buffer[i];

                     /* remove flag */
                     kbd_new_keys = FALSE;
                     /* initiate transfer */
                     IN0BC    = 0x08;
                     EP0CS    = 0x02;   /* clear HSNACK */
                  } else
                     if (sdat->wIndexL == 1) {
                        while (i-- > 0)
                           in0buf(i) = mouse_buffer[i];

                        /* remove flag */
                        mouse_new_keys = FALSE;
                        /* initiate transfer */
                        IN0BC = 0x08;
                        EP0CS = 0x02;   /* clear HSNACK */
                     }
                     else
                        EP0CS = 0x03;   /* stall */
#else
                  if (sdat->wIndexL == 0) {
#if defined (KEYBOARD)
                     while (i-- > 0)
                        in0buf(i) = key_buffer[i];

                     /* remove flag */
                     kbd_new_keys = FALSE;
                     /* initiate transfer */
                     IN0BC    = 0x08;
                     EP0CS    = 0x02;   /* clear HSNACK */
#elif defined (MOUSE)
                     while (i-- > 0)
                        in0buf(i) = mouse_buffer[i];

                     /* remove flag */
                     mouse_new_keys = FALSE;
                     /* initiate transfer */
                     IN0BC = 0x08;
                     EP0CS = 0x02;   /* clear HSNACK */
#else
                     EP0CS = 0x03;   /* stall */
#endif
                  } else
                     EP0CS = 0x03;   /* stall */
#endif

                  break;

               default:
                  EP0CS     = 0x03;   /* stall */
                  break;
            }
            break;

            /* bRequest == 0x02 */
         case 0x02:
            switch (sdat->bmRequestType) {
               /* Get_Idle */
               case 0xa1:
#if defined (KEYBOARD) && defined (MOUSE)
                  if (sdat->wIndexL == 0) {
                     in0buf(0) = kbd_idle_duration;
                     IN0BC     = 0x01;
                     EP0CS     = 0x02;   /* clear HSNACK */
                  } else
                     if (sdat->wIndexL == 1) {
                        in0buf(0) = mouse_idle_duration;
                        IN0BC     = 0x01;
                        EP0CS     = 0x02;   /* clear HSNACK */
                     } else
                        EP0CS  = 0x03;   /* stall */
#elif defined (KEYBOARD) || defined (MOUSE)
                  if (sdat->wIndexL == 0) {
#if defined (KEYBOARD)
                     in0buf(0) = kbd_idle_duration;
#elif defined (MOUSE)
                     in0buf(0) = mouse_idle_duration;
#endif
                     IN0BC     = 0x01;
                     EP0CS     = 0x02;   /* clear HSNACK */
                  } else
                     EP0CS  = 0x03;   /* stall */
#else
                  EP0CS  = 0x03;   /* stall */
#endif
                  break;

               default:
                  EP0CS     = 0x03;   /* stall */
                  break;
            }
            break;

            /* SetFeature */
         case 0x03:
            switch (sdat->bmRequestType) {
                  /* SetFeature(Device) TODO */
               case 0x00:
                  EP0CS     = 0x02;   /* clear HSNACK */
                  break;
                  /* SetFeature(Interface) TODO */
               case 0x01:
                  EP0CS     = 0x02;   /* clear HSNACK */
                  break;
                  /* SetFeature(Endpoint) */
               case 0x02:
                  switch (sdat->wIndexL) {
                     case 0x00:  /* OUT0 */
                        EP0CS  |= 0x01;  /* stall endpoint */
                        TOGCTL  = 0x00;
                        TOGCTL  = 0x20;
                        OUT0BC  = 0x00;
                        EP0CS  |= 0x02;  /* clear HSNACK */
                        break;
                     case 0x80:  /* IN0  */
                        EP0CS  |= 0x01;  /* stall endpoint */
                        TOGCTL  = 0x10;
                        TOGCTL  = 0x30;
                        EP0CS  |= 0x02;  /* clear HSNACK */
                        break;
                     case 0x81:  /* IN1  */
#if defined (KEYBOARD)
                        IN1CS   = 0x01;  /* stall endpoint */
                        TOGCTL  = 0x11;
                        TOGCTL  = 0x31;
                        IN1CS  |= 0x02;
                        EP0CS   = 0x02;  /* clear HSNACK */
#else
                        EP0CS  = 0x03;   /* stall */
#endif
                        break;
                     case 0x82:  /* IN2  */
#if defined (MOUSE)
                        IN2CS   = 0x01;  /* stall endpoint */
                        TOGCTL  = 0x12;
                        TOGCTL  = 0x32;
                        IN2CS  |= 0x02;
                        EP0CS   = 0x02;  /* clear HSNACK */
#else
                        EP0CS  = 0x03;   /* stall */
#endif
                        break;
                     default:
                        EP0CS  = 0x03;   /* stall */
                        break;
                  }
                  break;

                  /* Get_Protocol TODO */
               case 0xa1:
#if defined (KEYBOARD) && defined (MOUSE)
                  if ((sdat->wIndexL == 0) || (sdat->wIndexL == 1)) {
#else
                  if (sdat->wIndexL == 0) {
#endif
                     in0buf(0) = 1; /* always send Report protocol */
                     IN0BC     = 0x01;
                     EP0CS     = 0x02;   /* clear HSNACK */
                  } else
                     EP0CS  = 0x03;   /* stall */
                  break;

               default:
                  EP0CS     = 0x03;   /* stall */
                  break;
            }
            break;

            /* GetDescriptor */
         case 0x06:
            get_descriptor(/*sdat*/);
            break;

            /* GetConfiguration */
         case 0x08:
            if (sdat->bmRequestType == 0x80) {
               in0buf(0) = 0x01;
               IN0BC     = 0x01;
               EP0CS     = 0x02;   /* clear HSNACK */
            } else {
               EP0CS     = 0x03;   /* stall */
            }
            break;

            /* SetConfiguration */
         case 0x09:
            switch (sdat->bmRequestType) {
                  /* SetConfiguration */
               case 0x00:
                  EP0CS     = 0x02;   /* clear HSNACK */
                  break;

                  /* Set_Report */
               case 0x21:
#if defined (KEYBOARD)
                  /* indicate that the next OUT0 is part of a control transfer */
                  is_ctrl_out0_kbd = TRUE;
                  OUT0BC   = 0x00;    /* arm endpoint OUT0 */
                  /* HSNACK is cleared after the DATA stage, see below */
#endif
                  break;

               default:
                  EP0CS     = 0x03;   /* stall */
                  break;
            }
            break;

            /* bRequest == 0x0a */
         case 0x0a:
            switch (sdat->bmRequestType) {
               /* GetInterface */
               case 0x81:
                  in0buf(0) = 0x00;
                  IN0BC     = 0x01;
                  EP0CS     = 0x02;   /* clear HSNACK */
                  break;

                  /* Set_Idle */
               case 0x21:
#if defined (KEYBOARD) && defined (MOUSE)
                  if (sdat->wIndexL == 0) {

                     if (sdat->wValueH > 0) {
                        kbd_idle_mode     = FALSE;
                        kbd_idle_duration = sdat->wValueH;
                     } else {
                        kbd_idle_mode     = TRUE;
                     }

                     EP0CS  = 0x02;   /* clear HSNACK */
                  } else
                     if (sdat->wIndexL == 1) {

                        if (sdat->wValueH > 0) {
                           mouse_idle_mode     = FALSE;
                           mouse_idle_duration = sdat->wValueH;
                        } else {
                           mouse_idle_mode     = TRUE;
                        }

                        EP0CS  = 0x02;   /* clear HSNACK */
                     } else
                        EP0CS  = 0x03;   /* stall */
#else
                  if (sdat->wIndexL == 0) {

                     if (sdat->wValueH > 0) {
#if defined (KEYBOARD)
                        kbd_idle_mode     = FALSE;
                        kbd_idle_duration = sdat->wValueH;
#endif
#if defined (MOUSE)
                        mouse_idle_mode     = FALSE;
                        mouse_idle_duration = sdat->wValueH;
#endif
                     } else {
#if defined (KEYBOARD)
                        kbd_idle_mode     = TRUE;
#endif
#if defined (MOUSE)
                        mouse_idle_mode     = TRUE;
#endif
                     }

                     EP0CS  = 0x02;   /* clear HSNACK */
                  } else
                     EP0CS  = 0x03;   /* stall */
#endif
                  break;

               default:
                  EP0CS     = 0x03;   /* stall */
                  break;
            }
            break;

            /* bRequest == 0x0b */
         case 0x0b:
            switch (sdat->bmRequestType) {
                  /* SetInterface */
               case 0x01:
                  if (sdat->wValueL == 0) { /* only AS 0 supported */
#if defined (KEYBOARD) && defined (MOUSE)
                     if ((sdat->wIndexL == 0) || (sdat->wIndexL == 1)) {
                        if (sdat->wIndexL == 0) {
                           IN1CS  |= 0x02;  /* remove busy */
                           TOGCTL = 0x11;
                           TOGCTL = 0x31;   /* reset toggle of IN1 */
                        }
                        if (sdat->wIndexL == 1) {
                           IN2CS  |= 0x02;  /* remove busy */
                           TOGCTL = 0x12;
                           TOGCTL = 0x32;   /* reset toggle of IN2 */
                        }
#else
                     if (sdat->wIndexL == 0) {
                        IN1CS  |= 0x02;     /* remove busy */
                        TOGCTL = 0x11;
                        TOGCTL = 0x31;      /* reset toggle of IN1 */
#endif

                        EP0CS     = 0x02;   /* clear HSNACK */
                     } else
                        EP0CS  = 0x03;   /* stall */
                  } else
                     EP0CS  = 0x03;   /* stall */
                  break;

                  /* Set_Protocol TODO */
               case 0x21:
                  EP0CS     = 0x02;   /* clear HSNACK */
                  break;

               default:
                  EP0CS     = 0x03;   /* stall */
                  break;
            }
            break;

         default:
            EP0CS     = 0x03;   /* stall */
            break;
      }


   }

   /* was this an IN0 interrupt? */
   if (IN07IRQ & 0x01) {
      /* clear IN0 interrupt */
      IN07IRQ = 0x01;
   }

#if defined (KEYBOARD)
   /* was this an IN1 interrupt? */
   if (IN07IRQ & 0x02) {
      /* clear IN1 interrupt */
      IN07IRQ = 0x02;

      /* clear busy flag */
      in1_busy = FALSE;
   }
#endif
#if defined (MOUSE)
   /* was this an IN2 interrupt? */
   if (IN07IRQ & 0x04) {
      /* clear IN2 interrupt */
      IN07IRQ = 0x04;

      /* clear busy flag */
      in2_busy = FALSE;
   }
#endif

   /* was this a OUT0 interrupt? */
   if (OUT07IRQ & 0x01) {
      /* clear OUT0 interrupt */
      OUT07IRQ = 0x01;

#if defined (KEYBOARD)
      /* is this packet the keyboard DATA stage of a control transfer? */
      if (is_ctrl_out0_kbd) {
         Byte led_status = out0buf(0);
         /*
          * assume that this is a request to alter the LED status
          * send the command to the keyboard and queue the status information
          */

         SBUF0 = SUNKBD_CMD_SETLED;

         kbd_txmit_me = ((led_status & 0x02) << 2) | (led_status & 0x04) |
                        ((led_status & 0x08) >> 2) | (led_status & 0x01);

         is_ctrl_out0_kbd = FALSE;
         EP0CS            = 0x02;   /* clear HSNACK */
      }
#endif

      /* arm endpoint again */
      OUT0BC = 0x00;
   }

   /* was this the URES interrupt? */
   if (USBIRQ & 0x10) {
      /* clear request */
      USBIRQ = 0x10;
      /* initialize global variables */
      apply_reset_values();
   }
}


/*****************************************************************************
 * kbd_serial_isr()
 *
 * Serial interrupt service routine
 * The receiver part examines the scancode/status from the keyboard and
 * converts it to USB HID/HUT information.
 * The transmitter cares for the txmit queue.
 *****************************************************************************/
#if defined (KEYBOARD)
static void kbd_serial_isr(void) interrupt 4 using 2 critical
{
   Byte scancode;
   Byte mod_map;
   bit  parse_scancode;
   register Byte i;

   if (RI_0) {
      /* read the received character */
      scancode = SBUF0;
      /* clear pending interrupt */
      RI_0 = 0;

      if (sunkbd_reset < 0) {
         /* SUNKBD_RET_RESET is 0xff, thus sunkbd_reset will stay at -1 */
         sunkbd_reset = (char)scancode;
         return;
      }

      if (sunkbd_layout == -1) {
         sunkbd_layout = (char)scancode;
         return;
      }

      /* differentiate upon the scan codes */
      switch (scancode) {

         case SUNKBD_RET_RESET:
            sunkbd_reset = -1;
            break;

         case SUNKBD_RET_LAYOUT:
            sunkbd_layout = -1;
            break;

         case SUNKBD_RET_ALLUP:
            /* clear the keyboard buffer */
            i = 8;
            while (i-- > 0)
               key_buffer[i] = 0;
            kbd_new_keys   = TRUE;
            break;

         default:
            parse_scancode = 0;
            /* modifier keys account for byte 0 in the report */
            switch (scancode & SUNKBD_KEY) {
                  /* left control */
               case 0x4c:
                  mod_map        = 0x01;
                  break;

                  /* left shift */
               case 0x63:
                  mod_map        = 0x02;
                  break;

                  /* left alt */
               case 0x13:
                  mod_map        = 0x04;
                  break;

                  /* left gui */
               case 0x78:
                  mod_map        = 0x08;
                  break;

                  /* right shift */
               case 0x6e:
                  mod_map        = 0x20;
                  break;

                  /* right alt */
               case 0x0d:
                  mod_map        = 0x40;
                  break;

                  /* right gui */
               case 0x7a:
                  mod_map        = 0x80;
                  break;

                  /* OPEN key, convert to LALT+F11 */
               case 0x48:
                  mod_map        = 0x04;
                  scancode       = 0x09 | (scancode & SUNKBD_RELEASE);
                  parse_scancode = 1;
                  break;

                  /* FRONT key, convert to LALT+F12 */
               case 0x31:
                  mod_map        = 0x04;
                  scancode       = 0x0b | (scancode & SUNKBD_RELEASE);
                  parse_scancode = 1;
                  break;

               default:
                  mod_map        = 0;
                  parse_scancode = 1;
                  break;
            }

            /* examine modifier and update the report */
            if (mod_map) {
               /*
                * modifier key
                * was it pressed or released?
                */
               if (scancode & SUNKBD_RELEASE) {
                  /* released -> clear corresponding bit in the report */
                  key_buffer[0] &= ~mod_map;
                  kbd_new_keys   = TRUE;
               } else {
                  /* pressed -> set corresponding bit in the report */
                  key_buffer[0] |= mod_map;
                  kbd_new_keys   = TRUE;
               }
            }

            /* if requested, convert the scan code and update report */
            if (parse_scancode) {
               /*
                * normal key
                * was it pressed or released?
                */
               if (scancode & SUNKBD_RELEASE) {
                  /* released -> search scancode in report and set entry to 0 */
                  scancode &= SUNKBD_KEY;
                  scancode  = scancode_map[scancode];
                  i = 7;
                  while (i > 1) {
                     if (key_buffer[i] == scancode)
                        key_buffer[i] = 0;
                     i--;
                  }
                  kbd_new_keys = TRUE;
               } else {
                  /* pressed -> note scancode in the first free entry */
                  scancode &= SUNKBD_KEY;
                  scancode  = scancode_map[scancode];
                  i = 2;
                  while (i < 8) {
                     if (!key_buffer[i]) {
                        key_buffer[i] = scancode;
                        break;
                     }
                     i++;
                  }
                  kbd_new_keys = TRUE;
               }
            }
            break;
      }

   }


   /* ack transmitter interrupts */
   if (TI_0) {
      TI_0 = 0;

      if (kbd_txmit_me >= 0) {
         /* transmit queued data */
         SBUF0        = (Byte)kbd_txmit_me;
         kbd_txmit_me = -1;
      }
   }
}
#endif


/*****************************************************************************
 * mouse_serial_isr()
 *
 * Serial interrupt service routine for serial port 1.
 *****************************************************************************/
#if defined (MOUSE)

/* From sunmouse.c:
 * You ask me, why does this cap the lower bound at -127 and not
 * -128?  Because the xf86 mouse code is crap and treats -128
 * as an illegal value and resets it's protocol state machine
 * when it sees this value.
 */
#define CLIP(__X)	(((__X) > 127) ? 127 : (((__X) < -127) ? -127 : (__X)))

static void mouse_serial_isr(void) interrupt 7 using 2 critical
{
   register Byte        mousecode, mc;
   register signed char delta;
   int clipped;

   if (RI_1) {
      /* read the received byte from the mouse */
      mousecode = SBUF1;
      /* clear pending interrupt */
      RI_1      = 0;

      if ((mouse_state == 100) && (mousecode == 0x87))
         /* reset state */
         mouse_state = 0;

      delta = (signed char)mousecode;

      switch (mouse_state) {
            /* the three buttons */
         case 0:
            /* skip corrupted data */
            if ((mousecode & 0xf0) == 0x80) {
               mousecode = (~mousecode) & 0x07;
               /* map the buttons */
               mc = 0;
               if (mousecode & 0x01)
                  /* right */
                  mc |= 0x02;
               if (mousecode & 0x02)
                  /* middle */
                  mc |= 0x04;
               if (mousecode & 0x04)
                  /* left */
                  mc |= 0x01;
               mbuf0 = mc;

               mouse_state++;
            }
            break;

            /* delta-x 1 */
         case 1:
           mbuf1 = delta;
            mouse_state++;
            break;

            /* delta-y 1 */
         case 2:
           mbuf2 = -delta;
            mouse_state++;
            break;

            /* delta-x 2 */
         case 3:
            clipped          = (int)mbuf1 + delta;
            clipped          = CLIP(clipped);
            mbuf1 = clipped;
            mouse_state++;
            break;

            /* delta-y 2 */
         case 4:
            clipped          = (int)mbuf2 - delta;
            clipped          = CLIP(clipped);
            mbuf2 = clipped;
            mouse_state = 0;

            /* trigger transmission */
            if (!mouse_new_keys) {
              mouse_buffer[0] = mbuf0;
              mouse_buffer[1] = mbuf1;
              mouse_buffer[2] = mbuf2;

              mouse_new_keys = TRUE;
            }
            break;

         default:
            /* stay in invalid state */
            mouse_state = 100;
            break;
      }
   }
}
#endif


/*****************************************************************************
 * timer2_isr()
 *
 * Timer 2 interrupt service routine
 * This routine is called every 4 ms. If the keytable has changed, a IN1
 * transfer is triggered immediately. IN2 is used for a change of the mouse
 * table. If none happened, bahviour depends on the IDLE mode and the idle
 * duration setting.
 *****************************************************************************/
static void timer2_isr() interrupt 5 using 3 critical
{
#if defined (KEYBOARD)
   register Byte kbd_send_report;
#endif
#if defined (MOUSE)
   register Byte mouse_send_report;
#endif
   register Byte i;

   if (TF2) {
      TF2 = 0;

      /*
       * Keyboard service
       */
#if defined (KEYBOARD)
      kbd_send_report = FALSE;
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
#endif


      /*
       * Mouse service
       */
#if defined (MOUSE)
      mouse_send_report = FALSE;
      /* send report if we reached the idle duration */
      if (!mouse_idle_mode) {
         if (--mouse_idle_counter == 0) {
            mouse_send_report  = TRUE;
            /* reload counter */
            mouse_idle_counter = mouse_idle_duration;
         }
      }

      /* send report if the keys have been changed */
      if (mouse_new_keys) {
         mouse_send_report     = TRUE;
         mouse_new_keys        = FALSE;
         /* reload counter */
         mouse_idle_counter    = mouse_idle_duration;
      }

      if (mouse_send_report) {
         if (!in2_busy) {
            i = 8;
            while (i-- > 0)
               in2buf(i) = mouse_buffer[i];

            /* transfer the mouse buffer to endpoint IN2 */
            in2_busy = TRUE;
            IN2BC    = 8;
         }
      }
#endif
   }
}


/*****************************************************************************
 * setup_usb_int()
 *
 * Setup the USB interrupts.
 *****************************************************************************/
static void setup_usb_int()
{
   /* disable global interrupt */
   EA       = 0;

   /* clear autovector enable */
   USBBAV   = 0x00;
#if !defined (ROM_FIRMWARE)
   /* clear SUDAV interrupt and all other interrupts */
   USBIRQ   = 0xff;
#endif
   /* enable SUDAV and URES interrupts */
   USBIEN   = 0x11;

#if !defined (ROM_FIRMWARE)
   /* clear IN0, IN1 and IN2 interrupts */
   IN07IRQ  = 0x07;
#endif
   /* enable IN0 interrupt */
   IN07IEN  = 0x01;
#if defined (KEYBOARD)
   IN07IEN |= 0x02;
#endif
#if defined (MOUSE)
   IN07IEN |= 0x04;
#endif
#if !defined (ROM_FIRMWARE)
   /* clear OUT0 interrupt */
   OUT07IRQ = 0x01;
#endif
   /* enable OUT0 interrupt */
   OUT07IEN = 0x01;

#if !defined (ROM_FIRMWARE)
   /* unstall endpoints */
   IN1CS  = 0x00;
   OUT1CS = 0x00;
   IN2CS  = 0x00;
   OUT2CS = 0x00;
#endif

   /* validate endpoints */
   IN07VAL  = SUNKBD_INVAL;
   OUT07VAL = SUNKBD_OUTVAL;

   /* enable external 2 interrupt */
   EUSB = 1;

   /* enable global interrupt */
   EA   = 1;
}


/*****************************************************************************
 * setup_ser_int()
 *
 * Setup the serial port 0 and its interrupt.
 *****************************************************************************/
static void setup_ser_int()
{
   /*
    * configure GPIO:
    * + output '0' at OUTB.1
    * + output '0' at OUTC.7, .2
    * + alternate function on OUTC.1, .0
    * + alternate function on OUTB.2
    */
   OUTB     = 0x00;
   OEB      = 0x02;
   OUTC     = 0x00;
   OEC      = 0x84;
   PORTCCFG = 0x03;
   PORTBCFG = 0x04;

   /*
    * configure timer 1:
    * + mode 2
    * + clock divider 12
    * + reload value 204
    */
   TMOD     = 0x20;
   CKCON   &= 0xef;
   TH1      = 204;

   PCON     = 0x00;

   /*
    * configure serial port 0:
    * + mode 1
    * + enable receiver
    */
#if defined (KEYBOARD)
   SCON0    = 0x50;
   T2CON    = 0x00;
   /* enable serial port 0 interrupt */
   ES0      = 1;
#endif

   /*
    * configure serial port 1:
    * + mode 1
    * + enable receiver
    */
#if defined (MOUSE)
   SCON1    = 0x50;
   T2CON    = 0x00;
   /* enable serial port 1 interrupt */
   ES1      = 1;
#endif

   /* start timer 1 */
   TR1      = 1;
}


/*****************************************************************************
 * setup_keyboard()
 *
 * Initializes the keyboard and its gobal variables.
 *****************************************************************************/
#if defined (KEYBOARD)
static void setup_keyboard()
{
   register Byte j;

   sunkbd_layout = 0;  /* not used yet */

   /* reset key buffer */
   j = 8;
   while (j-- > 0) {
      in1buf(j)     = 0;
      key_buffer[j] = 0;
   }

   /* send a RESET command and wait for the answer */
   sunkbd_reset = -2;
   SBUF0        = SUNKBD_CMD_RESET;

   while (sunkbd_reset < 0) ;
   sunkbd_type  = sunkbd_reset;
   sunkbd_reset = 0;

   if (sunkbd_type == 4) { /* Type 4 keyboard */
      sunkbd_layout = -2;

      SBUF0         = SUNKBD_CMD_LAYOUT;
      while (sunkbd_layout < 0) ;
      if (sunkbd_layout & SUNKBD_LAYOUT_5_MASK)
         sunkbd_type = 5;
   }
}
#endif


/*****************************************************************************
 * setup_mouse()
 *
 * Initializes the gobal variables for the mouse.
 *****************************************************************************/
#if defined (MOUSE)
static void setup_mouse()
{
   register Byte j;

   /* reset state */
   mouse_state = 0;

   /* reset mouse buffer */
   j = 8;
   while (j-- > 0) {
      in2buf(j)       = 0;
      mouse_buffer[j] = 0;
   }
}
#endif


/*****************************************************************************
 * setup_timer2_int()
 *
 * Setup timer 2 interrupt.
 *****************************************************************************/
static void setup_timer2_int()
{
   /* set idle counter */
#if defined (KEYBOARD)
   kbd_idle_counter = kbd_idle_duration;
#endif
#if defined (MOUSE)
   mouse_idle_counter = mouse_idle_duration;
#endif

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
   USBCS &= ~0x04;    /* tristate the Disconnect pin */
   USBCS |= 0x08;     /* disconnect USB core         */
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


   setup_ser_int();
#if defined (KEYBOARD)
   setup_keyboard();
#endif
#if defined (MOUSE)
   setup_mouse();
#endif
   setup_timer2_int();

#if !defined (ROM_FIRMWARE)
   USBCS |= 0x02;     /* activate RENUM                     */
   USBCS &= ~0x08;    /* deactivate DISCON                  */
   USBCS |= 0x04;     /* release tristate on Disconnect pin */
#endif

   while (TRUE) ;
}




/*****************************************************************************
 *
 * Change History:
 * ===============
 *
 * $Log: sunkbd_hid.c,v $
 * Revision 1.27  2004/03/06 12:24:48  arniml
 * adjust pragmas to SDCC 2.4.0
 *
 * Revision 1.26  2004/02/15 01:19:29  arniml
 * declare "using 1" for all functions called in interrupts
 *
 * Revision 1.25  2004/02/07 12:57:03  arniml
 * double-buffer mouse information and use mouse_new_state as a simple
 * semaphore for mouse_buffer[]
 *
 * Revision 1.24  2004/01/29 19:17:51  arniml
 * add short delay before disconnecting, will remove the time-out seen by
 * the download application
 *
 * Revision 1.23  2004/01/14 22:42:48  arniml
 * Return the proper HID descriptor when running combined firmware with
 * keyboard and mouse.
 *
 * Revision 1.22  2003/12/30 15:54:26  arniml
 * in
 *
 * Revision 1.21  2003/12/30 15:50:25  arniml
 * + add proper functionality for scancode SUNKBD_RET_ALLUP
 * + move change history to bottom of file
 *
 * Revision 1.20  2003/12/26 11:25:03  arniml
 * add hint about missing key interpretation
 *
 * Revision 1.19  2002/10/03 11:35:22  arniml
 * + use wIndexL instead of wValueL for ClearFeature
 * + fixed busy removal at various instances
 *
 * Revision 1.18  2002/09/15 16:43:51  arniml
 * remove unneccesary "using 1" for get_descriptor()
 *
 * Revision 1.17  2002/09/02 22:53:12  arniml
 * extend data toggle control to the ClearFeature(EP) request
 * (ref. USB spec 1.1, section 5.8.5)
 *
 * Revision 1.16  2002/09/01 21:25:35  arniml
 * when stalling EP0 HSNACK has to be set as well
 * (refer to EZ-USB TRM section 12.12)
 *
 * Revision 1.15  2002/05/05 19:14:07  arniml
 * + correct handling of NOOVERLAY pragma:
 *   SAVE options before, RESTORE them afterwards
 * + use macros instead of pointer variables to access USB buffers
 *
 * Revision 1.14  2002/03/04 00:03:29  arniml
 * Move apply_reset_values()
 *
 * Revision 1.13  2002/03/03 23:43:02  arniml
 * + Apply reset values to most global variables explicitely in a dedicated
 *   function. This is necessary for USB reset situations.
 * + Handle SetFeature/Endpoint, ClearFeature/Endpoint and SetInterface
 *   properly (mainly reset toggle).
 * + Support USB reset interrupt.
 *
 * Revision 1.12  2002/02/25 23:24:53  arniml
 * set IN07VAL and OUT07VAL during USB ISR setup
 *
 * Revision 1.11  2002/01/21 20:33:07  arniml
 * Bug #496252:
 * Ok, do _not_ perform re-enumeration when running bootloadable firmware.
 * Just do not clear the SUDAV interrupt so that we have a change to process
 * the very first OUT request from the host (which arrived while the USB core
 * bootloaded us).
 *
 * Revision 1.10  2002/01/20 21:54:16  arniml
 * Bug #496252:
 * Refine disconnect and re-enumeration strategy when running bootloaded
 * firmware. Let the device come up with RENUM=0 which allows the USB core
 * to react immediately to incominh host requests.
 * Re-enumeration is done in any case after a short time period.
 *
 * Revision 1.9  2002/01/20 14:34:06  arniml
 * Bug #496252:
 * Remove re-enumeration when the firmware is bootloaded from the onboard
 * I2C EEPROM. This results in another flavor distinction:
 * a) downloaded via USB
 * b) bootloaded from I2C
 *
 * Revision 1.8  2001/09/20 08:43:32  arniml
 * commenting
 *
 * Revision 1.7  2001/09/18 10:53:27  arniml
 * Change re-enumeration strategy to fit it for download and eeprom bootload
 * situations.
 * My Asus P5A-B board now detects the USB keyboard automatically!
 *
 * Revision 1.6  2001/09/15 15:52:27  arniml
 * make DOWNLOAD the default
 *
 * Revision 1.5  2001/09/15 14:27:32  arniml
 * now supports usage for a bootloadable eeprom
 *
 * Revision 1.4  2001/08/19 19:46:44  arniml
 * enhance clipping of mouse deltas
 *
 * Revision 1.3  2001/08/15 18:29:43  arniml
 * add an interface for type 5 mouse support
 * keyboard and mouse support is configurable by #defines
 *
 * Revision 1.2  2001/07/17 21:37:28  arniml
 * add proper initialization of keyboard layout
 *   TODO: report Type
 * remove comments on unintentionally commented in1_busy semaphore for
 * IN1 endpoint
 *
 * Revision 1.1.1.1  2001/07/14 15:32:41  arniml
 * initial import
 */
