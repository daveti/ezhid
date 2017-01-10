/*
 *
 * $Id: all_ext.h,v 1.2 2004/02/15 01:16:05 arniml Exp $
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

#ifndef __ALL_EXT_H__
#define __ALL_EXT_H__


#include "dtypes.h"


/* global variables already defined in globals.h */
#ifndef __GLOBALS_H__

/* Pad buffers */
extern volatile data Byte pad1_buffer[2];
extern volatile data Byte pad2_buffer[2];
/* reports have changed */
extern volatile bit pad1_new_state;             /* apply_reset_values */
extern volatile bit pad2_new_state;             /* apply_reset_values */

#endif


/* global variables already defined in usb_core.h */
#ifndef __USB_CORE_H__

/* busy semaphore for endpoints */
extern volatile bit in1_busy;                 /* apply_reset_values */
extern volatile bit in2_busy;                 /* apply_reset_values */

#endif



#endif /* __ALL_EXT_H__ */
