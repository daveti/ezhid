/*
 *
 * $Id: res_firm.c,v 1.1 2004/01/30 21:30:37 arniml Exp $
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
#include "ezusb_reg.h"

#include "dtypes.h"


void main(void)
{
  Byte i;

  for (i = 5; i > 0; i--) ;

  USBCS &= ~0x06;    /* tristate the Disconnect pin */
  USBCS |= 0x08;     /* disconnect USB core         */

  for (i = 255; i > 0; i--) ;

  /* NB: RENUM is 0 -> USB core handles further requests */
  USBCS &= ~0x08;    /* deactivate DISCON                  */
  USBCS |= 0x04;     /* release tristate on Disconnect pin */

  while (TRUE) ;
}
