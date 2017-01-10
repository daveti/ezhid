/*
 *
 * $Id: globals.h,v 1.4 2004/02/15 01:10:49 arniml Exp $
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


#ifndef __GLOBALS_H__
#define __GLOBALS_H__

#include "dtypes.h"


/* Key buffer */
volatile data Byte key_buffer[8];

/* Report has changed, in1buf should be transferred on the next opportunity */
volatile bit kbd_new_keys;             /* apply_reset_values */

/*
 * Remember IDLE mode
 */
volatile bit kbd_idle_mode;            /* apply_reset_values */
/*
 * Idle duration expressed as multiples of 4 ms
 * default is 125 * 4 ms = 500 ms
 */
volatile data Byte kbd_idle_duration;  /* apply_reset_values */
volatile data Byte kbd_idle_counter;

/*
 * Some variables used to emulate the proper caps-lock behaviour.
 */
static bit caps_operated;     /* apply_reset_values */
static bit caps_send_release; /* apply_reset_values */


#endif /* __GLOBALS_H__ */
