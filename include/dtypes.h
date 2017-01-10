/*
 *
 * $Id: dtypes.h,v 1.3 2004/01/27 20:22:31 arniml Exp $
 *
 *
 * Copyright (C) 2003, 2004 Arnim Laeuger
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


#ifndef __DTYPES_H__
#define __DTYPES_H__


#if !defined (TRUE)
#define TRUE (1==1)
#endif
#if !defined (FALSE)
#define FALSE (!TRUE)
#endif

#define in0buf(n)  (&IN0BUF)[n]
#define out0buf(n) (&OUT0BUF)[n]
#define in1buf(n)  (&IN1BUF)[n]
#define in2buf(n)  (&IN2BUF)[n]
#define in3buf(n)  (&IN3BUF)[n]
#define in4buf(n)  (&IN4BUF)[n]


/* our main data type */
typedef unsigned char Byte;
typedef signed   char SByte;

typedef          int  Int16;
typedef unsigned int  UInt16;
typedef          long Int32;
typedef unsigned long UInt32;

/* mapping for the setup packet */
struct setup_dat {
      Byte bmRequestType;
      Byte bRequest;
      Byte wValueL;
      Byte wValueH;
      Byte wIndexL;
      Byte wIndexH;
      Byte wLengthL;
      Byte wLengthH;
};
typedef struct setup_dat setup_dat;

#endif /* __DTYPES_H__ */
