/*
 *
 * $Id: globals.h,v 1.2 2004/02/15 01:12:53 arniml Exp $
 *
 * Copyright (C) 2004, Arnim Laeuger
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


#ifndef __GLOBALS_H__
#define __GLOBALS_H__

#include "dtypes.h"


/* Pad buffer */
volatile data Byte pad1_buffer[8];
volatile data Byte pad2_buffer[8];
volatile data Byte pad3_buffer[8];
volatile data Byte pad4_buffer[8];

/* Report has changed */
volatile bit pad1_new_state;             /* apply_reset_values */
volatile bit pad2_new_state;             /* apply_reset_values */
volatile bit pad3_new_state;             /* apply_reset_values */
volatile bit pad4_new_state;             /* apply_reset_values */

/* temporary processing storage */
static data UInt16 tproc_buttons;
static data Byte   tproc_ajoy_x;
static data Byte   tproc_ajoy_y;
static data Byte   tproc_cjoy_x;
static data Byte   tproc_cjoy_y;
static data Byte   tproc_left_slide;
static data Byte   tproc_right_slide;

#endif /* __GLOBALS_H__ */
