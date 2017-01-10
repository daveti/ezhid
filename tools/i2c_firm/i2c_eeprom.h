/*
 *
 * $Id: i2c_eeprom.h,v 1.1 2002/08/26 20:09:04 arniml Exp $
 *
 * Copyright (C) 2002, Arnim Laeuger
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
 */

#if !defined(TRUE)
#define TRUE (1==1)
#endif
#if !defined(FALSE)
#define FALSE (!TRUE)
#endif


typedef unsigned char Byte;
typedef          int  Int16;
typedef unsigned int  UInt16;
typedef          long Int32;
typedef unsigned long UInt32;


Byte i2c_write_eeprom(Byte i2c_addr, UInt16 address, UInt16 length, 
                      xdata Byte *buffer, Byte pagesize, Byte has_16bit_addr);
Byte i2c_read_eeprom(Byte i2c_addr, UInt16 address, UInt16 length,
                     xdata Byte *buffer, Byte has_16bit_addr);
