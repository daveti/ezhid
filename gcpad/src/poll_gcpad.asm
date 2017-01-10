
;
; Copyright (C) 2004 Arnim Laeuger
;
;  This program is free software; you can redistribute it and/or modify
;  it under the terms of the GNU General Public License as published by
;  the Free Software Foundation; either version 2 of the License, or
;  (at your option) any later version. See also the file COPYING which
;  came with this application.
;
;  This program is distributed in the hope that it will be useful,
;  but WITHOUT ANY WARRANTY; without even the implied warranty of
;  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;  GNU General Public License for more details.
;
;  You should have received a copy of the GNU General Public License
;  along with this program; if not, write to the Free Software
;  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
;
;
; $Id: poll_gcpad.asm,v 1.4 2004/01/29 22:25:52 arniml Exp $
;

	_DPS	=	0x0086
	_MPAGE	=	0x0092

	
	.module	poll_gcpad

	.globl	_poll_gcpad

	.area	CSEG



	;; ------------------------------------------------------------
	;; nop'pers
	;;
	;; A lcall to this subroutine spends a defined amount of
	;; instruction cycles.
	;; CLK24/4 = 167 ns
	;;
	;; acall :  3 cycles
	;; lcall :  4 cycles
	;; nop   :  x cycles
	;; ret   :  4 cycles
nop13:
	nop
	nop
	nop
nop10:
	nop
	nop
	nop
nop7:
	nop
	nop
nop5:
	nop
nop4:
	nop
	nop
nop2:
	nop
	nop
	ret



	;; ------------------------------------------------------------
	;; _poll_gcpad
	;;
	;; Poll the given Gamecube pad.
	;; The result is stored in RAM as pointed to by the Autopointer.
	;;
	;; Theory of operation:
	;; --------------------
	;; As we cannot process the information in realtime, the
	;; port pin is just sampled as fast as possible utilizing
	;; the autopointer. Starting from the buffer for EP7OUT, there
	;; are 6*64 = 384 bytes of RAM available (even 64 bytes more
	;; from EP4OUT).
	;;
	;; Parameters:
	;;   DPTR0 - AUTODATA register, Autopointer is set up well
	;;   DPTR1 - OE       register
	;;   R0    - PINS     register
	;;   R1    - OUT      register
	;;   R7    - PIN      value
_poll_gcpad:
	;; provide inverted PIN value
	mov	a, r7
	cpl	a
	mov	r6, a

	;; put Data port to output
	inc	_DPS
	movx	a, @dptr
	orl	a, r7
	movx	@dptr, a


	;;
	;; Send request "0100 0000 0000 0011 0000 0010 1"
	;;

	movx	a, @r1
	anl	a, r6

	movx	@r1, a		; ( 0)  -----
	;; Bit  0 - send 0	;         |
	orl	a, r7		; ( 1)   4us
	lcall	nop13		; (12)    |
	movx	@r1, a		; (24)  -----
	anl	a, r6		; ( 1)    |
	nop			; ( 2)    |
	nop			; ( 3)   1us
	nop			; ( 4)    |
	movx	@r1, a		; ( 6)  -----

	;; Bit  1 - send 1	;         |
	orl	a, r7		; ( 1)    |
	nop			; ( 2)   1us
	nop			; ( 3)    |
	nop			; ( 4)    |
	movx	@r1, a		; ( 6)  -----
	anl	a, r6		; ( 1)   4us
	lcall	nop13		; (22)    |
	movx	@r1, a		; (24)  -----

	;; Bit  2 - send 0	;         |
	orl	a, r7		; ( 1)   4us
	lcall	nop13		; (12)    |
	movx	@r1, a		; (24)  -----
	anl	a, r6		; ( 1)    |
	nop			; ( 2)    |
	nop			; ( 3)   1us
	nop			; ( 4)    |
	movx	@r1, a		; ( 6)  -----

	;; Bit  3 - send 0	;         |
	orl	a, r7		; ( 1)   4us
	lcall	nop13		; (12)    |
	movx	@r1, a		; (24)  -----
	anl	a, r6		; ( 1)    |
	nop			; ( 2)    |
	nop			; ( 3)   1us
	nop			; ( 4)    |
	movx	@r1, a		; ( 6)  -----

	;; Bit  4 - send 0	;         |
	orl	a, r7		; ( 1)   4us
	lcall	nop13		; (12)    |
	movx	@r1, a		; (24)  -----
	anl	a, r6		; ( 1)    |
	nop			; ( 2)    |
	nop			; ( 3)   1us
	nop			; ( 4)    |
	movx	@r1, a		; ( 6)  -----

	;; Bit  5 - send 0	;         |
	orl	a, r7		; ( 1)   4us
	lcall	nop13		; (12)    |
	movx	@r1, a		; (24)  -----
	anl	a, r6		; ( 1)    |
	nop			; ( 2)    |
	nop			; ( 3)   1us
	nop			; ( 4)    |
	movx	@r1, a		; ( 6)  -----

	;; Bit  6 - send 0	;         |
	orl	a, r7		; ( 1)   4us
	lcall	nop13		; (12)    |
	movx	@r1, a		; (24)  -----
	anl	a, r6		; ( 1)    |
	nop			; ( 2)    |
	nop			; ( 3)   1us
	nop			; ( 4)    |
	movx	@r1, a		; ( 6)  -----

	;; Bit  7 - send 0	;         |
	orl	a, r7		; ( 1)   4us
	lcall	nop13		; (12)    |
	movx	@r1, a		; (24)  -----
	anl	a, r6		; ( 1)    |
	nop			; ( 2)    |
	nop			; ( 3)   1us
	nop			; ( 4)    |
	movx	@r1, a		; ( 6)  -----

	;; Bit  8 - send 0	;         |
	orl	a, r7		; ( 1)   4us
	lcall	nop13		; (12)    |
	movx	@r1, a		; (24)  -----
	anl	a, r6		; ( 1)    |
	nop			; ( 2)    |
	nop			; ( 3)   1us
	nop			; ( 4)    |
	movx	@r1, a		; ( 6)  -----

	;; Bit  9 - send 0	;         |
	orl	a, r7		; ( 1)   4us
	lcall	nop13		; (12)    |
	movx	@r1, a		; (24)  -----
	anl	a, r6		; ( 1)    |
	nop			; ( 2)    |
	nop			; ( 3)   1us
	nop			; ( 4)    |
	movx	@r1, a		; ( 6)  -----

	;; Bit 10 - send 0	;         |
	orl	a, r7		; ( 1)   4us
	lcall	nop13		; (12)    |
	movx	@r1, a		; (24)  -----
	anl	a, r6		; ( 1)    |
	nop			; ( 2)    |
	nop			; ( 3)   1us
	nop			; ( 4)    |
	movx	@r1, a		; ( 6)  -----

	;; Bit 11 - send 0	;         |
	orl	a, r7		; ( 1)   4us
	lcall	nop13		; (12)    |
	movx	@r1, a		; (24)  -----
	anl	a, r6		; ( 1)    |
	nop			; ( 2)    |
	nop			; ( 3)   1us
	nop			; ( 4)    |
	movx	@r1, a		; ( 6)  -----

	;; Bit 12 - send 0	;         |
	orl	a, r7		; ( 1)   4us
	lcall	nop13		; (12)    |
	movx	@r1, a		; (24)  -----
	anl	a, r6		; ( 1)    |
	nop			; ( 2)    |
	nop			; ( 3)   1us
	nop			; ( 4)    |
	movx	@r1, a		; ( 6)  -----

	;; Bit 13 - send 0	;         |
	orl	a, r7		; ( 1)   4us
	lcall	nop13		; (12)    |
	movx	@r1, a		; (24)  -----
	anl	a, r6		; ( 1)    |
	nop			; ( 2)    |
	nop			; ( 3)   1us
	nop			; ( 4)    |
	movx	@r1, a		; ( 6)  -----

	;; Bit 14 - send 1	;         |
	orl	a, r7		; ( 1)    |
	nop			; ( 2)   1us
	nop			; ( 3)    |
	nop			; ( 4)    |
	movx	@r1, a		; ( 6)  -----
	anl	a, r6		; ( 1)   4us
	lcall	nop13		; (22)    |
	movx	@r1, a		; (24)  -----

	;; Bit 15 - send 1	;         |
	orl	a, r7		; ( 1)    |
	nop			; ( 2)   1us
	nop			; ( 3)    |
	nop			; ( 4)    |
	movx	@r1, a		; ( 6)  -----
	anl	a, r6		; ( 1)   4us
	lcall	nop13		; (22)    |
	movx	@r1, a		; (24)  -----

	;; Bit 16 - send 0	;         |
	orl	a, r7		; ( 1)   4us
	lcall	nop13		; (12)    |
	movx	@r1, a		; (24)  -----
	anl	a, r6		; ( 1)    |
	nop			; ( 2)    |
	nop			; ( 3)   1us
	nop			; ( 4)    |
	movx	@r1, a		; ( 6)  -----

	;; Bit 17 - send 0	;         |
	orl	a, r7		; ( 1)   4us
	lcall	nop13		; (12)    |
	movx	@r1, a		; (24)  -----
	anl	a, r6		; ( 1)    |
	nop			; ( 2)    |
	nop			; ( 3)   1us
	nop			; ( 4)    |
	movx	@r1, a		; ( 6)  -----

	;; Bit 18 - send 0	;         |
	orl	a, r7		; ( 1)   4us
	lcall	nop13		; (12)    |
	movx	@r1, a		; (24)  -----
	anl	a, r6		; ( 1)    |
	nop			; ( 2)    |
	nop			; ( 3)   1us
	nop			; ( 4)    |
	movx	@r1, a		; ( 6)  -----

	;; Bit 19 - send 0	;         |
	orl	a, r7		; ( 1)   4us
	lcall	nop13		; (12)    |
	movx	@r1, a		; (24)  -----
	anl	a, r6		; ( 1)    |
	nop			; ( 2)    |
	nop			; ( 3)   1us
	nop			; ( 4)    |
	movx	@r1, a		; ( 6)  -----

	;; Bit 20 - send 0	;         |
	orl	a, r7		; ( 1)   4us
	lcall	nop13		; (12)    |
	movx	@r1, a		; (24)  -----
	anl	a, r6		; ( 1)    |
	nop			; ( 2)    |
	nop			; ( 3)   1us
	nop			; ( 4)    |
	movx	@r1, a		; ( 6)  -----

	;; Bit 21 - send 0	;         |
	orl	a, r7		; ( 1)   4us
	lcall	nop13		; (12)    |
	movx	@r1, a		; (24)  -----
	anl	a, r6		; ( 1)    |
	nop			; ( 2)    |
	nop			; ( 3)   1us
	nop			; ( 4)    |
	movx	@r1, a		; ( 6)  -----

	;; Bit 22 - send 1	;         |
	orl	a, r7		; ( 1)    |
	nop			; ( 2)   1us
	nop			; ( 3)    |
	nop			; ( 4)    |
	movx	@r1, a		; ( 6)  -----
	anl	a, r6		; ( 1)   4us
	lcall	nop13		; (22)    |
	movx	@r1, a		; (24)  -----

	;; Bit 23 - send 0	;         |
	orl	a, r7		; ( 1)   4us
	lcall	nop13		; (12)    |
	movx	@r1, a		; (24)  -----
	anl	a, r6		; ( 1)    |
	nop			; ( 2)    |
	nop			; ( 3)   1us
	nop			; ( 4)    |
	movx	@r1, a		; ( 6)  -----

	;; Bit 24 - send 1	;         |
	orl	a, r7		; ( 1)    |
	nop			; ( 2)   1us
	nop			; ( 3)    |
	nop			; ( 4)    |
	movx	@r1, a		; ( 6)  -----


	;; put Data port back to input
	movx	a, @dptr
	anl	a, r6
	movx	@dptr, a

	;; switch to DPTR0
	inc	_DPS


	;;
	;; Receive Pad answer
	;;

	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	;; read   8 bytes,   8 * 4 CLK24 =   5.344 us
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	;; read  16 bytes,  16 * 4 CLK24 =  10.688 us
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	;; read  24 bytes,  24 * 4 CLK24 =  16.032 us
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	;; read  32 bytes,  32 * 4 CLK24 =  21.376 us
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	;; read  40 bytes,  40 * 4 CLK24 =  26.720 us
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	;; read  48 bytes,  48 * 4 CLK24 =  32.064 us
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	;; read  56 bytes,  56 * 4 CLK24 =  37.408 us
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	;; read  64 bytes,  64 * 4 CLK24 =  42.752 us
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	;; read  72 bytes,  72 * 4 CLK24 =  48.096 us
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	;; read  80 bytes,  80 * 4 CLK24 =  53.440 us
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	;; read  88 bytes,  88 * 4 CLK24 =  58.784 us
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	;; read  96 bytes,  96 * 4 CLK24 =  64.128 us
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	;; read 104 bytes, 104 * 4 CLK24 =  69.472 us
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	;; read 112 bytes, 112 * 4 CLK24 =  74.816 us
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	;; read 120 bytes, 120 * 4 CLK24 =  80.160 us
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	;; read 128 bytes, 128 * 4 CLK24 =  85.504 us
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	;; read 136 bytes, 136 * 4 CLK24 =  90.848 us
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	;; read 144 bytes, 144 * 4 CLK24 =  96.192 us
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	;; read 152 bytes, 152 * 4 CLK24 = 101.536 us
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	;; read 160 bytes, 160 * 4 CLK24 = 106.880 us
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	;; read 168 bytes, 168 * 4 CLK24 = 112.224 us
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	;; read 176 bytes, 176 * 4 CLK24 = 117.568 us
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	;; read 184 bytes, 184 * 4 CLK24 = 122.912 us
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	;; read 192 bytes, 192 * 4 CLK24 = 128.256 us
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	;; read 200 bytes, 200 * 4 CLK24 = 133.600 us
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	;; read 208 bytes, 208 * 4 CLK24 = 138.944 us
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	;; read 216 bytes, 216 * 4 CLK24 = 144.288 us
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	;; read 224 bytes, 224 * 4 CLK24 = 149.632 us
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	;; read 232 bytes, 232 * 4 CLK24 = 154.976 us
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	;; read 240 bytes, 240 * 4 CLK24 = 160.320 us
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	;; read 248 bytes, 248 * 4 CLK24 = 165.664 us
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	;; read 256 bytes, 256 * 4 CLK24 = 171.008 us
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	;; read 264 bytes, 264 * 4 CLK24 = 176.352 us
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	;; read 272 bytes, 272 * 4 CLK24 = 181.696 us
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	;; read 280 bytes, 280 * 4 CLK24 = 187.040 us
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	;; read 288 bytes, 288 * 4 CLK24 = 192.384 us
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	;; read 296 bytes, 296 * 4 CLK24 = 197.728 us
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	;; read 304 bytes, 304 * 4 CLK24 = 203.072 us
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	;; read 312 bytes, 312 * 4 CLK24 = 208.416 us
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	;; read 320 bytes, 320 * 4 CLK24 = 213.760 us
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	;; read 328 bytes, 328 * 4 CLK24 = 219.104 us
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	;; read 336 bytes, 336 * 4 CLK24 = 224.448 us
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	;; read 344 bytes, 344 * 4 CLK24 = 229.792 us
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	;; read 352 bytes, 352 * 4 CLK24 = 235.136 us
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	;; read 360 bytes, 360 * 4 CLK24 = 240.480 us
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	;; read 368 bytes, 368 * 4 CLK24 = 245.824 us
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	;; read 376 bytes, 376 * 4 CLK24 = 251.168 us
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	;; read 384 bytes, 384 * 4 CLK24 = 256.512 us
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	;; read 392 bytes, 392 * 4 CLK24 = 261.856 us
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	;; read 400 bytes, 400 * 4 CLK24 = 267.200 us
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	;; read 408 bytes, 408 * 4 CLK24 = 272.544 us
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	;; read 416 bytes, 416 * 4 CLK24 = 277.888 us
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	;; read 424 bytes, 424 * 4 CLK24 = 283.232 us
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	movx	a, @r0		; ( 2)
	movx	@dptr, a	; ( 4)
	;; read 432 bytes, 432 * 4 CLK24 = 288.576 us

	;; we sampled the complete stream from the Gamecube pad(s) (hopefully...)

	;; append 16 bytes with 1 to choke the scanner
	mov	a, r7
	mov	r2, #0x10
choke_loop:
	movx	@dptr, a
	djnz	r2, choke_loop


finished:
	;; finished
	ret
