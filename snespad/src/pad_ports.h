/*
 *
 * $Id: pad_ports.h,v 1.1 2004/01/18 20:57:44 arniml Exp $
 *
 * Copyright (C) 2004, Arnim Laeuger
 *
 */


/*
 * Macros for wiring of the pads.
 * Adapt to your schematic if you do not use the default one.
 */
#define PAD_DATA_LATCH_OUT    OUTA
#define PAD_DATA_LATCH_OE     OEA
#define PAD_DATA_LATCH_PIN    (1 << 7)

#define PAD_DATA_CLOCK_OUT    OUTA
#define PAD_DATA_CLOCK_OE     OEA
#define PAD_DATA_CLOCK_PIN    (1 << 6)

#define PAD1_SERIAL_DATA_OUT  OUTA
#define PAD1_SERIAL_DATA_OE   OEA
#define PAD1_SERIAL_DATA_PIN  (1 << 5)
#define PAD1_SERIAL_DATA_PORT PINSA

#define PAD2_SERIAL_DATA_OUT  OUTA
#define PAD2_SERIAL_DATA_OE   OEA
#define PAD2_SERIAL_DATA_PIN  (1 << 4)
#define PAD2_SERIAL_DATA_PORT PINSA
