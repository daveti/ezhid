/*
 *
 * $Id: usb_core.c,v 1.6 2004/03/06 12:21:42 arniml Exp $
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
 *
 * Change History:
 * ===============
 *
 * $Log: usb_core.c,v $
 * Revision 1.6  2004/03/06 12:21:42  arniml
 * adjust pragmas to SDCC 2.4.0
 *
 * Revision 1.5  2004/02/15 01:09:43  arniml
 * declare "using 1" for all functions called in interrupts
 *
 * Revision 1.4  2004/01/18 13:15:37  arniml
 * move apply_reset_values to this file
 *
 * Revision 1.3  2004/01/10 17:17:14  arniml
 * remove unused variable led_status, new SDCC 2.3.7 complains about this
 *
 * Revision 1.2  2003/12/26 11:17:02  arniml
 * basic functionality implemented
 *
 * Revision 1.1  2003/12/23 22:56:38  arniml
 * initial check-in
 *
 */


#include "usb_core.h"
#include "all_ext.h"


void core_apply_reset_values(void) using 1;

/*****************************************************************************
 * apply_reset_values()
 *
 * Applies the reset values to all global variables owned by usb_core.
 *****************************************************************************/
void apply_reset_values(void) using 1
{
  core_apply_reset_values();

  is_ctrl_out0_kbd    = 0;
  in1_busy            = FALSE;
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
    EP0CS   = 0x02;             /* clear HSNACK */
    SUDPTRH = (Byte)((unsigned int)dev_desc >> 8);
    SUDPTRL = (unsigned int)dev_desc & 0xff;
    break;

    /* type: configuration */
  case USB_DT_CONFIG:
    EP0CS   = 0x02;             /* clear HSNACK */
    SUDPTRH = (Byte)((unsigned int)conf_desc >> 8);
    SUDPTRL = (unsigned int)conf_desc & 0xff;
    break;

    /* type: string */
  case USB_DT_STRING:
    if (sdat->wValueL < NUM_STRING) {
      EP0CS     = 0x02;         /* clear HSNACK */
      SUDPTRH = (Byte)(string_index[sdat->wValueL] >> 8);
      SUDPTRL = string_index[sdat->wValueL] & 0xff;
    } else {
      EP0CS     = 0x03;         /* stall */
    }
    break;

    /* type: HID */
  case USB_DT_HID:
    EP0CS   = 0x02;   /* clear HSNACK */
    SUDPTRH = (Byte)(((unsigned int)conf_desc) + 18 >> 8);
    SUDPTRL = ((unsigned int)conf_desc) + 18 & 0xff;
    break;

    /* type: Report */
  case USB_DT_REPORT:
    if (sdat->wIndexL == 0) {
      EP0CS   = 0x02;   /* clear HSNACK */
      SUDPTRH = (Byte)((unsigned int)(report_desc_keyboard) >> 8);
      SUDPTRL = (unsigned int)(report_desc_keyboard) & 0xff;
    } else
      EP0CS   = 0x03;   /* stall */
    break;

  default:
    EP0CS     = 0x03;           /* stall */
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
 *   + ack OUT0 interrupts
 *   + ack additional INx and OUTx interrupts
 *   + put device into suspend upon SUSB interrupt
 *
 * According to the EZ-USB Technical Reference Manual it is essential to
 * clear HSNACK when stalling EP0 (see section 12.12).
 *****************************************************************************/
void usb_isr(void) interrupt 8 using 1
{
  Byte i;

  /* clear INT2 interrupt */
  EXIF &= 0xef;

  /* was this the SUDAV interrupt? */
  if (USBIRQ & 0x01) {

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
        EP0CS     = 0x02;       /* clear HSNACK */
        break;

      default:
        EP0CS     = 0x03;       /* stall */
        break;
      }
      break;

      /* bRequest == 0x01 */
    case 0x01:
      switch (sdat->bmRequestType) {
        /* ClearFeature(Device) TODO */
      case 0x00:
        EP0CS     = 0x02;       /* clear HSNACK */
        break;
        /* ClearFeature(Interface) TODO */
      case 0x01:
        EP0CS     = 0x02;       /* clear HSNACK */
        break;
        /* ClearFeature(Endpoint) */
      case 0x02:
        switch (sdat->wIndexL) {
          /* ClearFeature(EP) should reset TOGGLE bit
             (ref. USB spec 1.1, section 5.8.5) */
        case 0x00:              /* OUT0 */
          TOGCTL = 0x00;
          TOGCTL = 0x20;
          EP0CS  = 0x02;        /* clear HSNACK */
          break;
        case 0x80:              /* IN0  */
          TOGCTL = 0x10;
          TOGCTL = 0x30;
          EP0CS  = 0x02;        /* clear HSNACK */
          break;
        case 0x81:              /* IN1  */
          IN1CS &= 0xfe;        /* unstall endpoint */
          TOGCTL = 0x11;
          TOGCTL = 0x31;
          EP0CS  = 0x02;        /* clear HSNACK */;
          break;
        default:
          EP0CS = 0x03;         /* stall */
          break;
        }
        break;

	/* Get_Report TODO*/
      case 0xa1:
	/* return a report over IN0BUF */
	i = 7;
	if (sdat->wIndexL == 0) {
	  while (i-- > 0)
	    in0buf(i) = key_buffer[i];

	  /* remove flag */
	  kbd_new_keys = FALSE;
	  /* initiate transfer */
	  IN0BC    = 0x08;
	  EP0CS    = 0x02;   /* clear HSNACK */
	} else
	  EP0CS    = 0x03;   /* stall */
	break;

      default:
        EP0CS      = 0x03;   /* stall */
        break;
      }
      break;

      /* bRequest == 0x02 */
    case 0x02:
      switch (sdat->bmRequestType) {
	/* Get_Idle */
      case 0xa1:
	if (sdat->wIndexL == 0) {
	  in0buf(0) = kbd_idle_duration;
	  IN0BC     = 0x01;
	  EP0CS     = 0x02;     /* clear HSNACK */
	} else
	  EP0CS     = 0x03;     /* stall */
	break;

      default:
	EP0CS       = 0x03;     /* stall */
	break;
      }
      break;
      
      
      /* SetFeature */
    case 0x03:
      switch (sdat->bmRequestType) {
        /* SetFeature(Device) TODO */
      case 0x00:
        EP0CS     = 0x02;       /* clear HSNACK */
        break;
        /* SetFeature(Interface) TODO */
      case 0x01:
        EP0CS     = 0x02;       /* clear HSNACK */
        break;
        /* SetFeature(Endpoint) */
      case 0x02:
        switch (sdat->wIndexL) {
        case 0x00:              /* OUT0 */
          EP0CS  |= 0x01;       /* stall endpoint */
          TOGCTL  = 0x00;
          TOGCTL  = 0x20;
          OUT0BC  = 0x00;
          EP0CS  |= 0x02;       /* clear HSNACK */
          break;
        case 0x80:              /* IN0  */
          EP0CS  |= 0x01;       /* stall endpoint */
          TOGCTL  = 0x10;
          TOGCTL  = 0x30;
          EP0CS  |= 0x02;       /* clear HSNACK */
          break;
        case 0x81:              /* IN1  */
          IN1CS   = 0x01;       /* stall endpoint */
          TOGCTL  = 0x11;
          TOGCTL  = 0x31;
          IN1CS  |= 0x02;
          EP0CS   = 0x02;       /* clear HSNACK */;
          break;
        default:
          EP0CS  = 0x03;        /* stall */
          break;
        }
        break;

	/* Get_Protocol TODO */
      case 0xa1:
	if (sdat->wIndexL == 0) {
	  in0buf(0) = 1;      /* always send Report protocol */
	  IN0BC     = 0x01;
	  EP0CS     = 0x02;   /* clear HSNACK */
	} else
	  EP0CS     = 0x03;   /* stall */
	break;

      default:
        EP0CS       = 0x03;   /* stall */
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
        EP0CS     = 0x02;       /* clear HSNACK */
      } else {
        EP0CS     = 0x03;       /* stall */
      }
      break;

      /* SetConfiguration */
    case 0x09:
      switch (sdat->bmRequestType) {
        /* SetConfiguration */
      case 0x00:
        EP0CS     = 0x02;       /* clear HSNACK */
        break;

	/* Set_Report */
      case 0x21:
	/* indicate that the next OUT0 is part of a control transfer */
	is_ctrl_out0_kbd = TRUE;
	OUT0BC   = 0x00;    /* arm endpoint OUT0 */
	/* HSNACK is cleared after the DATA stage, see below */
	break;

      default:
        EP0CS     = 0x03;       /* stall */
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
        EP0CS     = 0x02;       /* clear HSNACK */
        break;

	/* Set_Idle */
      case 0x21:
	if (sdat->wIndexL == 0) {

	  if (sdat->wValueH > 0) {
	    kbd_idle_mode     = FALSE;
	    kbd_idle_duration = sdat->wValueH;
	  } else {
	    kbd_idle_mode     = TRUE;
	  }

	  EP0CS   = 0x02;   /* clear HSNACK */
	} else
	  EP0CS   = 0x03;   /* stall */
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
          if (sdat->wIndexL == 0) {
            TOGCTL = 0x11;
            TOGCTL = 0x31;      /* reset toggle of IN1 */
            IN1CS |= 0x02;      /* remove busy */

            EP0CS  = 0x02;      /* clear HSNACK */
          } else
            EP0CS  = 0x03;      /* stall */
        } else
          EP0CS  = 0x03;        /* stall */
        break;

        /* Set_Protocol TODO */
      case 0x21:
        EP0CS     = 0x02;       /* clear HSNACK */
        break;

      default:
        EP0CS     = 0x03;       /* stall */
        break;
      }
      break;

    default:
      EP0CS     = 0x03;         /* stall */
      break;
    }


  }

  /* was this an IN0 interrupt? */
  if (IN07IRQ & 0x01) {
    /* clear IN0 interrupt */
    IN07IRQ = 0x01;
  }

  /* was this a OUT0 interrupt? */
  if (OUT07IRQ & 0x01) {
    /* clear OUT0 interrupt */
    OUT07IRQ = 0x01;

    /* is this packet the keyboard DATA stage of a control transfer? */
    if (is_ctrl_out0_kbd) {
#ifdef COMMENT
      Byte led_status = out0buf(0);
#endif
      /*
       * assume that this is a request to alter the LED status
       * send the command to the keyboard and queue the status information
       */

      /* unfortunately, there is no way to inform the Amiga keyboard :-( */
#ifdef COMMENT
      SBUF0 = SUNKBD_CMD_SETLED;

      kbd_txmit_me = ((led_status & 0x02) << 2) | (led_status & 0x04) |
	             ((led_status & 0x08) >> 2) | (led_status & 0x01);
#endif

      is_ctrl_out0_kbd = FALSE;
      EP0CS            = 0x02;   /* clear HSNACK */
    }

    /* arm endpoint again */
    OUT0BC = 0x00;
  }


  /* was this the URES interrupt? */
  if (USBIRQ & 0x10) {
    /* clear request */
    USBIRQ = 0x10;

    /* global variables must be re-initialized here,
       in addition everything else must be put back into reset state */
    /* <ADD YOUR CODE HERE> */
  }

  /* was this the SUSP interrupt? */
  if (USBIRQ & 0x08) {
    /* clear request */
    USBIRQ = 0x08;
    /* enter idle mode */
    PCON |= 0x01;
  }

  /* was this an IN1 interrupt? */
  if (IN07IRQ & 0x02) {
    /* clear IN1 interrupt */
    IN07IRQ = 0x02;

    /* clear busy flag */
    in1_busy = FALSE;
  }

}


void resume_isr(void) interrupt 6 using 2
{
  /* clear resume interrupt */
  EICON &= ~0x10;
}


/*****************************************************************************
 * setup_usb_int()
 *
 * Setup the USB interrupts.
 *****************************************************************************/
void setup_usb_int()
{
  /* disable global interrupt */
  EA       = 0;

  /* clear autovector enable */
  USBBAV   = 0x00;
#if !defined (ROM_FIRMWARE)
  /* clear SUDAV interrupt and all other interrupts */
  USBIRQ   = 0xff;
#endif
  /* enable SUDAV, SUSP and URES interrupts */
  USBIEN   = 0x19;

#if !defined (ROM_FIRMWARE)
  /* clear IN0 and IN1 interrupts */
  IN07IRQ  = 0x03;
#endif
  /* enable IN0 and IN1 interrupts */
  IN07IEN  = 0x03;
#if !defined (ROM_FIRMWARE)
  /* clear OUT0 interrupt */
  OUT07IRQ = 0x01;
#endif
  /* enable OUT0 interrupt */
  OUT07IEN = 0x01;

#if !defined (ROM_FIRMWARE)
  /* unstall endpoints */
  IN1CS    = 0x00;
#endif

  /* validate endpoints */
  IN07VAL  = 3;
  OUT07VAL = 1;

  /* enable external 2 interrupt */
  EUSB     = 1;

  /* clear pending resume interrupt */
  EICON   &= ~0x10;
  /* enable resume interrupt */
  EICON   |= 0x20;

  /* enable global interrupt */
  EA       = 1;
}
