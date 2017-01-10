/*
 *
 * $Id: pad_ports.h,v 1.1 2004/01/29 19:05:58 arniml Exp $
 *
 * Copyright (C) 2004, Arnim Laeuger
 *
 */


/*
 * Macros for wiring of the pads.
 * Adapt to your schematic if you do not use the default one.
 * BUT: All pads must be connected to the same port!
 */
#define PADS_DATA_PORT     PINSC
#define PADS_DATA_PORT_ASM _PINSC
#define PADS_DATA_OUT      OUTC
#define PADS_DATA_OUT_ASM  _OUTC
#define PADS_DATA_OE       OEC
#define PADS_DATA_OE_ASM   _OEC

#define PAD1_DATA_PIN      (1 << 4)

#define PAD2_DATA_PIN      (1 << 5)

#define PAD3_DATA_PIN      (1 << 6)

#define PAD4_DATA_PIN      (1 << 7)
