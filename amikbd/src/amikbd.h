/*
 *
 * $Id: amikbd.h,v 1.4 2004/01/29 19:08:50 arniml Exp $
 *
 * Copyright (C) 2003 Arnim Laeuger
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
#include "dtypes.h"
#include "ezusb_reg.h"


/*
 * Macros for the keyboard wiring
 * Adapt to your schematic if you do not use the default one.
 */

/* Keyboard clock is PC4 */
#define KBD_CLOCK_PORT PINSC
#define KBD_CLOCK_PIN  (1 << 4)
#define KBD_CLOCK_OE   OEC

/* Keyboard data is PC5 */
#define KBD_DATA_PORT  PINSC
#define KBD_DATA_OUT   OUTC
#define KBD_DATA_PIN   (1 << 5)
#define KBD_DATA_OE    OEC


/*
 * Timer0 reload value
 * Timer0 counts CLK24/12, i.e. each increment is 500 ns
 * For 85 us there are 170 CLK24/12 increments
 */
#define TIMER0_HIGH    0xff
#define TIMER0_LOW     0x56


#define AMIKBD_PRESSED          0x80
#define AMIKBD_KEY              0x7f
/* some special keycodes from the Amiga keyboard */
#define AMIKBD_RESET_WARNING    0x78
#define AMIKBD_LAST_KEYCODE_BAD 0xf9
#define AMIKBD_BUFFER_OVERFLOW  0xfa
#define AMIKBD_UNUSED_1         0xfb
#define AMIKBD_SELFTEST_FAILED  0xfc
#define AMIKBD_INIT_PWRUP_KEYS  0xfd
#define AMIKBD_TERM_PWRUP_KEYS  0xfe
#define AMIKBD_UNUSED_2         0xff


/*
 * mapping from Amiga keyboard keycodes to USB HID/HUT
 */
static code Byte keycode_map[] = {
  0x35, 0x1e, 0x1f, 0x20, 0x21, 0x22, 0x23, 0x24, 0x25, 0x26, 0x27, 0x2d, 0x2e, 0x31, 0x00, 0x62,
  0x14, 0x1a, 0x08, 0x15, 0x17, 0x1c, 0x18, 0x0c, 0x12, 0x13, 0x2f, 0x30, 0x00, 0x59, 0x5a, 0x5b,
  0x04, 0x16, 0x07, 0x09, 0x0a, 0x0b, 0x0d, 0x0e, 0x0f, 0x33, 0x34, 0x32, 0x00, 0x5c, 0x5d, 0x5e,
  0x00, 0x1d, 0x1b, 0x06, 0x19, 0x05, 0x11, 0x10, 0x36, 0x37, 0x38, 0x00, 0x63, 0x5f, 0x60, 0x61,
  0x2c, 0x2a, 0x2b, 0x58, 0x28, 0x29, 0x4c, 0x00, 0x00, 0x00, 0x56, 0x00, 0x52, 0x51, 0x4f, 0x50,
  0x3a, 0x3b, 0x3c, 0x3d, 0x3e, 0x3f, 0x40, 0x41, 0x42, 0x43, 0x2f, 0x30, 0x54, 0x55, 0x57, 0x75,
  0x00, 0x00, 0x39, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
};

#define AMIKBD_CAPSLOCK         0x62
#define USB_CAPSLOCK            0x39
