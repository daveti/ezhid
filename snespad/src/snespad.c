/*
 *
 * $Id: snespad.c,v 1.6 2004/03/06 12:24:05 arniml Exp $
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
 *
 * Credits:
 * ========
 *
 *  Vojtech Pavlik and SuSE
 *    For the Linux gamecon driver which was my only source of knowledge
 *    about the SNES gamepad protocol.
 *    Based on the work of:
 *  	Andree Borrmann         John Dahlstrom
 *  	David Kuder             Nathan Hand
 *
 */


#include "globals.h"
#include "all_ext.h"
#include "snespad.h"



/*
 * Interrupt functions must be declared in the main file.
 * Otherwise SDCC won't add them in the interrupt jump table
 */
void usb_isr(void) interrupt 8 using 1;
void resume_isr(void) interrupt 6 using 2;
void setup_usb_int(void);
void apply_reset_values(void) using 1;




/*****************************************************************************
 * core_apply_reset_values()
 *
 * Applies inital reset values to global variables where necessary.
 * This is not done directly in the variable declaration because these
 * values are required after an USB reset as well.
 *****************************************************************************/
void core_apply_reset_values() using 1
{
  pad1_new_state = FALSE;
  pad2_new_state = FALSE;

  /* clear pad state buffers */
  pad1_buffer[0] = 0;
  pad1_buffer[1] = 0;
  pad2_buffer[0] = 0;
  pad2_buffer[1] = 0;

  pad1_state     = 0;
  pad2_state     = 0;
}


static void process_pad_data(UInt16 *pad_data, UInt16 *pad_state, Byte *pad_buffer, Byte pad_flag) {
  UInt16 pdat    = *pad_data;
  Byte   pointer = 0;
  Byte   buttons = 0;

  if (pdat != *pad_state) {
    *pad_state = pdat;

    /* process buttons */
    if (pdat & PAD_BIT_A)
      buttons |= BUTTON_A;
    if (pdat & PAD_BIT_B)
      buttons |= BUTTON_B;
    if (pdat & PAD_BIT_X)
      buttons |= BUTTON_X;
    if (pdat & PAD_BIT_Y)
      buttons |= BUTTON_Y;
    if (pdat & PAD_BIT_SEL)
      buttons |= BUTTON_SEL;
    if (pdat & PAD_BIT_START)
      buttons |= BUTTON_START;
    if (pdat & PAD_BIT_TL)
      buttons |= BUTTON_TL;
    if (pdat & PAD_BIT_TR)
      buttons |= BUTTON_TR;
    pad_buffer[1] = buttons;

    /* process pointer */
    if (pdat & PAD_BIT_XLEFT)
      pointer |= POINTER_LEFT;
    if (pdat & PAD_BIT_XRIGHT)
      pointer |= POINTER_RIGHT;
    if (pdat & PAD_BIT_YDOWN)
      pointer |= POINTER_DOWN;
    if (pdat & PAD_BIT_YUP)
      pointer |= POINTER_UP;
    pad_buffer[0] = pointer;

    if (pad_flag == PAD1)
      pad1_new_state = TRUE;
    if (pad_flag == PAD2)
      pad2_new_state = TRUE;
  }
}


#pragma callee_saves delay_timer0, init_timer0_6us
static void init_timer0_6us(void)
{
  TL0 = TIMER0_LOW;
  TH0 = TIMER0_HIGH;
}

static void delay_timer0(void)
{
  TR0 = 1;
  while(!TF0) ;
  TR0 = FALSE;
  TF0 = FALSE;
  init_timer0_6us();
}

/*****************************************************************************
 * snespad_comm
 *
 * Implements the communication with the SNES pads.
 * See the macros in pad_port.h for the mapping of the communication lines
 * to the port pins.
 *****************************************************************************/
static void snespad_comm(void)
{
  UInt16 pad1_data, pad2_data;
  Byte   i;

  init_timer0_6us();

  while (TRUE) {

    PAD_DATA_CLOCK_OUT   |= PAD_DATA_CLOCK_PIN;
    PAD_DATA_LATCH_OUT   |= PAD_DATA_LATCH_PIN;
    delay_timer0();
    delay_timer0();
    PAD_DATA_LATCH_OUT   &= ~PAD_DATA_LATCH_PIN;

    pad1_data = pad2_data = 0;

    for (i = 0; i < SNES_LENGTH; i++) {
      delay_timer0();
      PAD_DATA_CLOCK_OUT &= ~PAD_DATA_CLOCK_PIN;

      /* shift bits before reading a new one
         padX_data will end in the correct state after the for-loop */
      pad1_data <<= 1;
      pad2_data <<= 1;

      /* read Pad 1 serial data */
      if (!(PAD1_SERIAL_DATA_PORT & PAD1_SERIAL_DATA_PIN))
        pad1_data |= 1;
      /* read Pad 1 serial data */
      if (!(PAD2_SERIAL_DATA_PORT & PAD2_SERIAL_DATA_PIN))
        pad2_data |= 1;

      delay_timer0();
      PAD_DATA_CLOCK_OUT |= PAD_DATA_CLOCK_PIN;
    }

    /* process the retrieved serial data from the pads */
    process_pad_data(&pad1_data, &pad1_state, pad1_buffer, PAD1);
    process_pad_data(&pad2_data, &pad2_state, pad2_buffer, PAD2);

  }
}


/*****************************************************************************
 * setup_pads()
 *
 * Setup pad communication.
 *****************************************************************************/
static void setup_pads(void)
{
  /* the pins for Data Clock and Data Latch are set to output direction */
  PAD_DATA_CLOCK_OUT  |= PAD_DATA_CLOCK_PIN;
  PAD_DATA_CLOCK_OE   |= PAD_DATA_CLOCK_PIN;

  PAD_DATA_LATCH_OUT  |= PAD_DATA_LATCH_PIN;
  PAD_DATA_LATCH_OE   |= PAD_DATA_LATCH_PIN;

  /* the pins for Serial Data are set to input direction */
  PAD1_SERIAL_DATA_OE &= ~PAD1_SERIAL_DATA_PIN;
  PAD2_SERIAL_DATA_OE &= ~PAD2_SERIAL_DATA_PIN;
}


/*****************************************************************************
 * setup_timer0()
 *
 * Setup the timer0.
 * This timer will be used to time the pause times during pad shift
 * operations.
 *****************************************************************************/
static void setup_timer0(void)
{
  /* stop timer0 */
  TR0   = FALSE;
  /* disable timer0 interrupt */
  TF0   = FALSE;
  ET0   = FALSE;

  /* configure timer0:
   * + mode 1
   * + timer operation
   */
  TMOD  = 1;
}


/*****************************************************************************
 * _sdcc_external_startup()
 *
 * Earliest possibility to disconnect for re-enumeration.
 * This is not necessary when the firmware resides in the onboard I2C EEPROM
 * where the master control is handed back to the USB core to let it talk to
 * the host. Afterwards we perform a clean re-enumeration.
 *****************************************************************************/
Byte _sdcc_external_startup()
{
#if !defined (ROM_FIRMWARE)
  register Byte i;

  /* delay a bit to let the USB communication handshake to the downloader
     settle */
  for (i = 2; i > 0; i--) ;

  /* disconnect immediately */
  USBCS &= ~0x04;               /* tristate the Disconnect pin */
  USBCS |= 0x08;                /* disconnect USB core         */
#endif

  return(0);
}


/*****************************************************************************
 * main()
 *
 * Main function.
 * Call initializers, trigger re-enumeration and stay busy in endless loop.
 * All functionality is handled in the interrupt service routines.
 *****************************************************************************/
void main()
{
#if !defined (ROM_FIRMWARE)
  int loop;

  loop = 16384;
  while (loop-- > 0) ;
#endif

  /* initialize global variables */
  apply_reset_values();

  setup_usb_int();

  setup_timer0();

  setup_pads();

#if !defined (ROM_FIRMWARE)
  USBCS |= 0x02;                /* activate RENUM                     */
  USBCS &= ~0x08;               /* deactivate DISCON                  */
  USBCS |= 0x04;                /* release tristate on Disconnect pin */
#endif

  snespad_comm();

  while (TRUE) ;
}




/*****************************************************************************
 *
 * Change History:
 * ===============
 *
 * $Log: snespad.c,v $
 * Revision 1.6  2004/03/06 12:24:05  arniml
 * adjust pragmas to SDCC 2.4.0
 *
 * Revision 1.5  2004/02/15 01:15:51  arniml
 * declare "using 1" for all functions called in interrupts
 *
 * Revision 1.4  2004/01/29 19:15:09  arniml
 * add short delay before disconnecting, will remove the time-out seen by
 * the download application
 *
 * Revision 1.3  2004/01/22 21:13:30  arniml
 * fix process_pad_data() for Pad 2
 *
 * Revision 1.2  2004/01/18 20:53:28  arniml
 * first version with all basic features implemented
 *
 * Revision 1.1  2004/01/18 13:17:59  arniml
 * initial check-in
 *
 */
