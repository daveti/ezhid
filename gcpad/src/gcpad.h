/*
 *
 * $Id: gcpad.h,v 1.1 2004/01/29 19:05:58 arniml Exp $
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


/* Length of a GameCube pad packet */
#define N64_LENGTH 64

#define PAD1 0
#define PAD2 1
#define PAD3 2
#define PAD4 3

/* flags inside a GameCube packet */
#define PAD_BIT_DLEFT  (1 << 15)
#define PAD_BIT_DRIGHT (1 << 14)
#define PAD_BIT_DDOWN  (1 << 13)
#define PAD_BIT_DUP    (1 << 12)
#define PAD_BIT_Z      (1 << 11)
#define PAD_BIT_TR     (1 << 10)
#define PAD_BIT_TL     (1 <<  9)
#define PAD_BIT_A      (1 <<  7)
#define PAD_BIT_B      (1 <<  6)
#define PAD_BIT_Y      (1 <<  5)
#define PAD_BIT_X      (1 <<  4)
#define PAD_BIT_START  (1 <<  3)

/* button bits inside the report */
#define BUTTON_A       (1 <<  0)
#define BUTTON_B       (1 <<  1)
#define BUTTON_X       (1 <<  2)
#define BUTTON_Y       (1 <<  3)
#define BUTTON_Z       (1 <<  4)
#define BUTTON_START   (1 <<  5)
#define BUTTON_TL      (1 <<  6)
#define BUTTON_TR      (1 <<  7)
/* pointer values inside the report */
#define DJOY_LEFT      0x03
#define DJOY_RIGHT     0x01
#define DJOY_UP        0x0c
#define DJOY_DOWN      0x04
