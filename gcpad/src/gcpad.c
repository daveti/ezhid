/*
 *
 * $Id: gcpad.c,v 1.5 2004/09/27 20:54:36 arniml Exp $
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
 *  James Ward
 *    His excellent work on
 *      http://www.int03.co.uk/crema/hardware/gamecube/gc-control.html
 *    provided the most important information for realizing this firmware.
 *
 */


#include "globals.h"
#include "all_ext.h"
#include "gcpad.h"



/*
 * Interrupt functions must be declared in the main file.
 * Otherwise SDCC won't add them in the interrupt jump table
 */
void usb_isr(void) interrupt 8 using 1;
void resume_isr(void) interrupt 6 using 2;
void setup_usb_int(void);
void apply_reset_values(void) using 1;

void _poll_gcpad(void);



/*****************************************************************************
 * core_apply_reset_values()
 *
 * Applies inital reset values to global variables where necessary.
 * This is not done directly in the variable declaration because these
 * values are required after an USB reset as well.
 *****************************************************************************/
void core_apply_reset_values() using 1
{
  register Byte i;

  pad1_new_state   = FALSE;
  pad2_new_state   = FALSE;
  pad3_new_state   = FALSE;
  pad4_new_state   = FALSE;

  /* clear pad state buffers */
  i = 8;
  while (i-- > 0) {
    pad1_buffer[i] = 0;
    pad2_buffer[i] = 0;
    pad3_buffer[i] = 0;
    pad4_buffer[i] = 0;
  }
}


/*****************************************************************************
 * process_pad_data()
 *
 * Dissects the collected information scanned from the Gamecube pad and fills
 * in the pad_buffer according to the USB HID report format.
 *
 * Parameters:
 *   pad_buffer : Pointer to pad buffer containing 8 bytes.
 *                [0] - analog joystick X
 *                [1] - analog joystick Y
 *                [2] - C joystick X
 *                [3] - C joystick Y
 *                [4] - digital joystick
 *                [5] - left slider
 *                [6] - right slider
 *                [7] - various buttons
 *   pad_flag   : Indicates which pad is to be processed
 *****************************************************************************/
static void process_pad_data(Byte *pad_buffer, Byte pad_flag) {
  Byte proc;

  proc = 0;
  /* process buttons */
  if (tproc_buttons & PAD_BIT_A)
    proc |= BUTTON_A;
  if (tproc_buttons & PAD_BIT_B)
    proc |= BUTTON_B;
  if (tproc_buttons & PAD_BIT_X)
    proc |= BUTTON_X;
  if (tproc_buttons & PAD_BIT_Y)
    proc |= BUTTON_Y;
  if (tproc_buttons & PAD_BIT_Z)
    proc |= BUTTON_Z;
  if (tproc_buttons & PAD_BIT_START)
    proc |= BUTTON_START;
  if (tproc_buttons & PAD_BIT_TL)
    proc |= BUTTON_TL;
  if (tproc_buttons & PAD_BIT_TR)
    proc |= BUTTON_TR;
  pad_buffer[7] = proc;

  proc = 0;
  /* process digital joystick */
  if (tproc_buttons & PAD_BIT_DLEFT)
    proc |= DJOY_LEFT;
  if (tproc_buttons & PAD_BIT_DRIGHT)
    proc |= DJOY_RIGHT;
  if (tproc_buttons & PAD_BIT_DUP)
    proc |= DJOY_UP;
  if (tproc_buttons & PAD_BIT_DDOWN)
    proc |= DJOY_DOWN;
  pad_buffer[4] = proc;

  /* process analog joystick */
  pad_buffer[0] = tproc_ajoy_x;
  pad_buffer[1] = tproc_ajoy_y ^ 0xff;

  /* process C joystick */
  pad_buffer[2] = tproc_cjoy_x;
  pad_buffer[3] = tproc_cjoy_y ^ 0xff;

  /* process sliders */
  pad_buffer[5] = tproc_left_slide;
  pad_buffer[6] = tproc_right_slide;

  if (pad_flag == PAD1)
    pad1_new_state = TRUE;
  if (pad_flag == PAD2)
    pad2_new_state = TRUE;
  if (pad_flag == PAD3)
    pad3_new_state = TRUE;
  if (pad_flag == PAD4)
    pad4_new_state = TRUE;
}


/*****************************************************************************
 * determine_bit_by_majority()
 *
 * Scans from the current position of the autopointer to the next transition
 * from 1 -> 0. In between, the occurences of 0 and 1 are counted which form
 * the base of the majority decision.
 * If there are more than or equal 1 than 0 in the range then we look
 * at a 1. In case there are more 0 than 1 we look at a 0.
 * An error is detected when there is no 0 -> 1 or 1 -> 0 transition for
 * 16 consecutive bits.
 *
 * Parameters:
 *   data_pin : Mask for the bit position containing the pad data.
 * Return value:
 *   0 - 0 detected
 *   1 - 1 detected
 *  -1 - error, invalid stream
 *****************************************************************************/
#define CHOKE 8
static SByte determine_bit_by_majority(Byte data_pin) {
  SByte result = -1;
  Byte  num_0, num_1;
  Byte  choke;

  /* the first '0' bit has been read */
  num_0 = 1;
  /* advance to the next transition 0 -> 1 */
  choke = CHOKE;
  while (!(AUTODATA & data_pin)) {
    num_0++;
    if (--choke == 0)
      break;
  }

  if (choke != 0) {
    num_1 = 1;
    /* advance to the next transition 1 -> 0 */
    choke = CHOKE;
    while (AUTODATA & data_pin) {
      num_1++;
      if (--choke == 0)
        break;
    }

    if (choke != 0) {
      /* one bit scanned, determine whether it is a 0 or a 1 */
      if (num_1 >= num_0)
        result = 1;
      else
        result = 0;
      /* phew... */
    }

  }

  return(result);
}


/*****************************************************************************
 * scan_gcpad_stream()
 *
 * Scans through the complete sampled data stream and tries to extract
 * 64 bits. The first 16 button bits are transferred 1:1 to the result word
 * while the analog and C joystick x- and y-axis data is bit-swapped on the
 * fly.
 * 
 * Parameters:
 *   data_pin : Mask for the bit position containing the pad data.
 * Return value:
 *   None.
 *   The global variables tproc_* are filled in with the data
 *   The resulting data word is 0 when an invalid stream was detected by the
 *   underlying majority detector.
 *****************************************************************************/
static void scan_gcpad_stream(Byte data_pin) {
  UInt16 or_mask;
  Byte   bit_pos, choke;
  SByte  bit_val;
  bit    fail = FALSE;

  /* load autopointer with beginning of EP7OUT buffer */
  AUTOPTRL = #0x40;
  AUTOPTRH = #0x7b;

  /* find first transition 1 -> 0 */
  choke = 32;
  while (AUTODATA & data_pin)
    if (--choke == 0)
      fail = TRUE;

  /* we might have found the beginning of a valid answer stream */

  /* scan the first 16 bits containing the buttons
     and the digital joystick */
  tproc_buttons = 0;
  or_mask       = 0x0001;
  for (bit_pos = 0; (bit_pos <= 15) && !fail; bit_pos++) {
    bit_val = determine_bit_by_majority(data_pin);
    if (bit_val >= 0) {
      if (bit_val == 1)
        tproc_buttons |= or_mask;
    } else
      /* break on error */
      fail = TRUE;

    or_mask <<= 1;
  }

  /* scan the next 8 bits containing the analog joystick x-axis */
  tproc_ajoy_x = 0;
  or_mask      = 0x0080; /* swap bits */
  for (bit_pos = 0; (bit_pos <= 7) && !fail; bit_pos ++) {
    bit_val = determine_bit_by_majority(data_pin);
    if (bit_val >= 0) {
      if (bit_val == 1)
        tproc_ajoy_x |= or_mask;
    } else
      /* break on error */
      fail = TRUE;

    or_mask >>= 1;       /* swap bits */
  }

  /* scan the next 8 bits containing the analog joystick y-axis */
  tproc_ajoy_y = 0;
  or_mask      = 0x0080; /* swap bits */
  for (bit_pos = 0; (bit_pos <= 7) && !fail; bit_pos ++) {
    bit_val = determine_bit_by_majority(data_pin);
    if (bit_val >= 0) {
      if (bit_val == 1)
        tproc_ajoy_y |= or_mask;
    } else
      /* break on error */
      fail = TRUE;

    or_mask >>= 1;       /* swap bits */
  }

  /* scan the next 8 bits containing the C joystick x-axis */
  tproc_cjoy_x = 0;
  or_mask      = 0x0080; /* swap bits */
  for (bit_pos = 0; (bit_pos <= 7) && !fail; bit_pos ++) {
    bit_val = determine_bit_by_majority(data_pin);
    if (bit_val >= 0) {
      if (bit_val == 1)
        tproc_cjoy_x |= or_mask;
    } else
      /* break on error */
      fail = TRUE;

    or_mask >>= 1;       /* swap bits */
  }

  /* scan the next 8 bits containing the C joystick y-axis */
  tproc_cjoy_y = 0;
  or_mask      = 0x0080; /* swap bits */
  for (bit_pos = 0; (bit_pos <= 7) && !fail; bit_pos ++) {
    bit_val = determine_bit_by_majority(data_pin);
    if (bit_val >= 0) {
      if (bit_val == 1)
        tproc_cjoy_y |= or_mask;
    } else
      /* break on error */
      fail = TRUE;

    or_mask >>= 1;       /* swap bits */
  }

  /* scan the next 8 bits containing the left slider */
  tproc_left_slide = 0;
  or_mask          = 0x0080; /* swap bits */
  for (bit_pos = 0; (bit_pos <= 7) && !fail; bit_pos ++) {
    bit_val = determine_bit_by_majority(data_pin);
    if (bit_val >= 0) {
      if (bit_val == 1)
        tproc_left_slide |= or_mask;
    } else
      /* break on error */
      fail = TRUE;

    or_mask >>= 1;            /* swap bits */
  }

  /* scan the next 8 bits containing the right slider */
  tproc_right_slide = 0;
  or_mask           = 0x0080; /* swap bits */
  for (bit_pos = 0; (bit_pos <= 7) && !fail; bit_pos ++) {
    bit_val = determine_bit_by_majority(data_pin);
    if (bit_val >= 0) {
      if (bit_val == 1)
        tproc_right_slide |= or_mask;
    } else
      /* break on error */
      fail = TRUE;

    or_mask >>= 1;            /* swap bits */
  }

  if (fail) {
    tproc_buttons    = 0;
    tproc_ajoy_x     = tproc_ajoy_y = 0;
    tproc_cjoy_x     = tproc_cjoy_y = 0;
    tproc_left_slide = tproc_right_slide = 0;
  }
}


/*****************************************************************************
 * poll_gcpads()
 *
 * Wrapper function for the raw sampling routine _poll_gcpad.
 * The assembler routine expects several preconditions that are set-up.
 *   + autopointer points to start of RAM for the sample data
 *   + DPTR0 points to AUTODATA
 *   + DPTR1 points to the OEx register
 *   + r0    points to the PINSx register
 *   + r1    points to the OUTx register
 *   + MPAGE is set-up properly to enable movx @r0, ...
 *
 * Here, it is determined that all four Gamecube pads are read in parallel by
 * or'ing their masks together.
 *****************************************************************************/
static void poll_gcpads(void) {
  /* disable interrupts */
  EA = 0;

  /* set up autopointer: 0x7b40, start of bulk endpoint buffers */
  AUTOPTRL = #0x40;
  AUTOPTRH = #0x7b;
  _asm
  mov  dptr, #_AUTODATA
  
  /* put OE register into DPTR1 */
  inc  _DPS
  mov  dptr, #PADS_DATA_OE_ASM
  inc  _DPS

  /* put PINS register into R0 */
  mov  r0, #PADS_DATA_PORT_ASM

  /* put OUT register into R1 */
  mov  r1, #PADS_DATA_OUT_ASM

  /* put upper byte of i/o port address into MPAGE */
  mov  _MPAGE, #(PADS_DATA_OUT_ASM >> 8)

  /* put PIN value into R7 */
  mov  r7, #(PAD1_DATA_PIN | PAD2_DATA_PIN | PAD3_DATA_PIN | PAD4_DATA_PIN)

  lcall _poll_gcpad

  _endasm;

  /* enable interrupts */
  EA = 1;
}


/*****************************************************************************
 * gcpad_comm
 *
 * Implements the communication with the Gamecube pads.
 * See the macros in pad_port.h for the mapping of the communication lines
 * to the port pins.
 *****************************************************************************/
static void gcpad_comm(void)
{

  while (TRUE) {

    /* poll all connected Gamecube pads in parallel */
    poll_gcpads();

    /* scan the raw data stream of Pad 1 */
    scan_gcpad_stream(PAD1_DATA_PIN);

    if (!pad1_new_state) {
      /* process the retrieved serial data from the pads */
      process_pad_data(pad1_buffer, PAD1);
    }

    /* scan the raw data stream of Pad 2 */
    scan_gcpad_stream(PAD2_DATA_PIN);

    if (!pad2_new_state) {
      /* process the retrieved serial data from the pads */
      process_pad_data(pad2_buffer, PAD2);
    }

    /* scan the raw data stream of Pad 3 */
    scan_gcpad_stream(PAD3_DATA_PIN);

    if (!pad3_new_state) {
      /* process the retrieved serial data from the pads */
      process_pad_data(pad3_buffer, PAD3);
    }

    /* scan the raw data stream of Pad 4 */
    scan_gcpad_stream(PAD4_DATA_PIN);

    if (!pad4_new_state) {
      /* process the retrieved serial data from the pads */
      process_pad_data(pad4_buffer, PAD4);
    }
  }

}


/*****************************************************************************
 * setup_pads()
 *
 * Setup pad communication.
 *****************************************************************************/
static void setup_pads(void)
{
  PADS_DATA_OE  &= ~(PAD1_DATA_PIN | PAD2_DATA_PIN |
                     PAD3_DATA_PIN | PAD4_DATA_PIN);
  PADS_DATA_OUT |=  (PAD1_DATA_PIN | PAD2_DATA_PIN |
                     PAD3_DATA_PIN | PAD4_DATA_PIN);
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

  setup_pads();

  /* No cycle stretching for MOVX!
     This affects even MOVX accesses to internal registers! */
  CKCON &= ~0x07;

#if !defined (ROM_FIRMWARE)
  USBCS |= 0x02;                /* activate RENUM                     */
  USBCS &= ~0x08;               /* deactivate DISCON                  */
  USBCS |= 0x04;                /* release tristate on Disconnect pin */
#endif

  gcpad_comm();

  while (TRUE) ;
}




/*****************************************************************************
 *
 * Change History:
 * ===============
 *
 * $Log: gcpad.c,v $
 * Revision 1.5  2004/09/27 20:54:36  arniml
 * fix comment
 *
 * Revision 1.4  2004/02/15 01:12:23  arniml
 * declare "using 1" for all functions called in interrupts
 *
 * Revision 1.3  2004/01/29 20:28:20  arniml
 * add credits
 *
 * Revision 1.2  2004/01/29 20:21:20  arniml
 * basic functionality implemented
 *
 * Revision 1.1  2004/01/29 19:05:58  arniml
 * initial check-in
 *
 */
