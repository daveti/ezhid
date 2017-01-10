/*
 *
 * $Id: globals.h,v 1.4 2004/02/15 01:16:05 arniml Exp $
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
volatile data Byte pad1_buffer[2];
volatile data Byte pad2_buffer[2];

/* Report has changed, in1buf should be transferred on the next opportunity */
volatile bit pad1_new_state;             /* apply_reset_values */
volatile bit pad2_new_state;             /* apply_reset_values */
static UInt16 pad1_state;       /* apply_reset_values */
static UInt16 pad2_state;       /* apply_reset_values */

#endif /* __GLOBALS_H__ */
