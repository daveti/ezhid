/*
 *
 * $Id: snespad.h,v 1.3 2004/01/29 19:15:36 arniml Exp $
 *
 * Copyright (C) 2004 Arnim Laeuger
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

#include "pad_ports.h"

/*
 * Timer0 reload value
 * Timer0 counts CLK24/12, i.e. each increment is 500 ns
 * For 6 us there are 12 CLK24/12 increments
 */
#define TIMER0_HIGH 0xff
#define TIMER0_LOW  0xf4

/* Length of a SNES pad packet */
#define SNES_LENGTH 12

#define PAD1 0
#define PAD2 1

/* flags inside a SNES packet */
#define PAD_BIT_B      (1 << 11)
#define PAD_BIT_Y      (1 << 10)
#define PAD_BIT_SEL    (1 <<  9)
#define PAD_BIT_START  (1 <<  8)
#define PAD_BIT_YUP    (1 <<  7)
#define PAD_BIT_YDOWN  (1 <<  6)
#define PAD_BIT_XLEFT  (1 <<  5)
#define PAD_BIT_XRIGHT (1 <<  4)
#define PAD_BIT_A      (1 <<  3)
#define PAD_BIT_X      (1 <<  2)
#define PAD_BIT_TL     (1 <<  1)
#define PAD_BIT_TR     (1 <<  0)

/* button bits inside the report */
#define BUTTON_A       (1 <<  0)
#define BUTTON_B       (1 <<  1)
#define BUTTON_X       (1 <<  2)
#define BUTTON_Y       (1 <<  3)
#define BUTTON_SEL     (1 <<  4)
#define BUTTON_START   (1 <<  5)
#define BUTTON_TL      (1 <<  6)
#define BUTTON_TR      (1 <<  7)
/* pointer values inside the report */
#define POINTER_LEFT   0x03
#define POINTER_RIGHT  0x01
#define POINTER_UP     0x0c
#define POINTER_DOWN   0x04
