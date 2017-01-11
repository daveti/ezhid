;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (Linux)
;--------------------------------------------------------
	.module sunkbd_hid
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl __sdcc_external_startup
	.globl _memset
	.globl _memcpy
	.globl _SMOD1
	.globl _ET2
	.globl _TF2
	.globl _TR2
	.globl _TI_1
	.globl _RI_1
	.globl _TI_0
	.globl _RI_0
	.globl _ES1
	.globl _ES0
	.globl _EUSB
	.globl _CY
	.globl _AC
	.globl _F0
	.globl _RS1
	.globl _RS0
	.globl _OV
	.globl _F1
	.globl _P
	.globl _PS
	.globl _PT1
	.globl _PX1
	.globl _PT0
	.globl _PX0
	.globl _RD
	.globl _WR
	.globl _T1
	.globl _T0
	.globl _INT1
	.globl _INT0
	.globl _TXD
	.globl _RXD
	.globl _P3_7
	.globl _P3_6
	.globl _P3_5
	.globl _P3_4
	.globl _P3_3
	.globl _P3_2
	.globl _P3_1
	.globl _P3_0
	.globl _EA
	.globl _ES
	.globl _ET1
	.globl _EX1
	.globl _ET0
	.globl _EX0
	.globl _P2_7
	.globl _P2_6
	.globl _P2_5
	.globl _P2_4
	.globl _P2_3
	.globl _P2_2
	.globl _P2_1
	.globl _P2_0
	.globl _SM0
	.globl _SM1
	.globl _SM2
	.globl _REN
	.globl _TB8
	.globl _RB8
	.globl _TI
	.globl _RI
	.globl _P1_7
	.globl _P1_6
	.globl _P1_5
	.globl _P1_4
	.globl _P1_3
	.globl _P1_2
	.globl _P1_1
	.globl _P1_0
	.globl _TF1
	.globl _TR1
	.globl _TF0
	.globl _TR0
	.globl _IE1
	.globl _IT1
	.globl _IE0
	.globl _IT0
	.globl _P0_7
	.globl _P0_6
	.globl _P0_5
	.globl _P0_4
	.globl _P0_3
	.globl _P0_2
	.globl _P0_1
	.globl _P0_0
	.globl _DPH1
	.globl _DPL1
	.globl _DPH0
	.globl _DPL0
	.globl _EICON
	.globl _TH2
	.globl _TL2
	.globl _RCAP2H
	.globl _RCAP2L
	.globl _T2CON
	.globl _CKCON
	.globl _SBUF1
	.globl _SBUF0
	.globl _SCON1
	.globl _SCON0
	.globl _EIE
	.globl _MPAGE
	.globl _EXIF
	.globl _DPS
	.globl _B
	.globl _ACC
	.globl _PSW
	.globl _IP
	.globl _P3
	.globl _IE
	.globl _P2
	.globl _SBUF
	.globl _SCON
	.globl _P1
	.globl _TH1
	.globl _TH0
	.globl _TL1
	.globl _TL0
	.globl _TMOD
	.globl _TCON
	.globl _PCON
	.globl _DPH
	.globl _DPL
	.globl _SP
	.globl _P0
	.globl _AUTODATA
	.globl _AUTOPTRL
	.globl _AUTOPTRH
	.globl _FASTXFR
	.globl _OUT07VAL
	.globl _IN07VAL
	.globl _I2DAT
	.globl _I2CS
	.globl _SETUPDAT
	.globl _SUDPTRL
	.globl _SUDPTRH
	.globl _TOGCTL
	.globl _USBCS
	.globl _USBBAV
	.globl _USBPAIR
	.globl _USBIEN
	.globl _USBIRQ
	.globl _OUT07IEN
	.globl _IN07IEN
	.globl _OUT07IRQ
	.globl _IN07IRQ
	.globl _ISOCTL
	.globl _PORTCCFG
	.globl _PORTBCFG
	.globl _PORTACFG
	.globl _PINSC
	.globl _OUTC
	.globl _OEC
	.globl _PINSB
	.globl _OUTB
	.globl _OEB
	.globl _PINSA
	.globl _OUTA
	.globl _OEA
	.globl _OUT4BC
	.globl _IN4BC
	.globl _OUT4CS
	.globl _IN4CS
	.globl _OUT4BUF
	.globl _IN4BUF
	.globl _OUT3BC
	.globl _OUT3CS
	.globl _IN3BC
	.globl _IN3CS
	.globl _OUT3BUF
	.globl _IN3BUF
	.globl _OUT2BUF
	.globl _OUT2CS
	.globl _OUT2BC
	.globl _IN2CS
	.globl _IN2BC
	.globl _IN2BUF
	.globl _OUT1BC
	.globl _OUT1CS
	.globl _OUT1BUF
	.globl _IN1BC
	.globl _IN1BUF
	.globl _IN1CS
	.globl _OUT0BC
	.globl _OUT0BUF
	.globl _IN0BC
	.globl _IN0BUF
	.globl _EP0CS
	.globl _kbd_txmit_me
	.globl _key_buffer
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
_P0	=	0x0080
_SP	=	0x0081
_DPL	=	0x0082
_DPH	=	0x0083
_PCON	=	0x0087
_TCON	=	0x0088
_TMOD	=	0x0089
_TL0	=	0x008a
_TL1	=	0x008b
_TH0	=	0x008c
_TH1	=	0x008d
_P1	=	0x0090
_SCON	=	0x0098
_SBUF	=	0x0099
_P2	=	0x00a0
_IE	=	0x00a8
_P3	=	0x00b0
_IP	=	0x00b8
_PSW	=	0x00d0
_ACC	=	0x00e0
_B	=	0x00f0
_DPS	=	0x0086
_EXIF	=	0x0091
_MPAGE	=	0x0092
_EIE	=	0x00e8
_SCON0	=	0x0098
_SCON1	=	0x00c0
_SBUF0	=	0x0099
_SBUF1	=	0x00c1
_CKCON	=	0x008e
_T2CON	=	0x00c8
_RCAP2L	=	0x00ca
_RCAP2H	=	0x00cb
_TL2	=	0x00cc
_TH2	=	0x00cd
_EICON	=	0x00d8
_DPL0	=	0x0082
_DPH0	=	0x0083
_DPL1	=	0x0084
_DPH1	=	0x0085
;--------------------------------------------------------
; special function bits
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
_P0_0	=	0x0080
_P0_1	=	0x0081
_P0_2	=	0x0082
_P0_3	=	0x0083
_P0_4	=	0x0084
_P0_5	=	0x0085
_P0_6	=	0x0086
_P0_7	=	0x0087
_IT0	=	0x0088
_IE0	=	0x0089
_IT1	=	0x008a
_IE1	=	0x008b
_TR0	=	0x008c
_TF0	=	0x008d
_TR1	=	0x008e
_TF1	=	0x008f
_P1_0	=	0x0090
_P1_1	=	0x0091
_P1_2	=	0x0092
_P1_3	=	0x0093
_P1_4	=	0x0094
_P1_5	=	0x0095
_P1_6	=	0x0096
_P1_7	=	0x0097
_RI	=	0x0098
_TI	=	0x0099
_RB8	=	0x009a
_TB8	=	0x009b
_REN	=	0x009c
_SM2	=	0x009d
_SM1	=	0x009e
_SM0	=	0x009f
_P2_0	=	0x00a0
_P2_1	=	0x00a1
_P2_2	=	0x00a2
_P2_3	=	0x00a3
_P2_4	=	0x00a4
_P2_5	=	0x00a5
_P2_6	=	0x00a6
_P2_7	=	0x00a7
_EX0	=	0x00a8
_ET0	=	0x00a9
_EX1	=	0x00aa
_ET1	=	0x00ab
_ES	=	0x00ac
_EA	=	0x00af
_P3_0	=	0x00b0
_P3_1	=	0x00b1
_P3_2	=	0x00b2
_P3_3	=	0x00b3
_P3_4	=	0x00b4
_P3_5	=	0x00b5
_P3_6	=	0x00b6
_P3_7	=	0x00b7
_RXD	=	0x00b0
_TXD	=	0x00b1
_INT0	=	0x00b2
_INT1	=	0x00b3
_T0	=	0x00b4
_T1	=	0x00b5
_WR	=	0x00b6
_RD	=	0x00b7
_PX0	=	0x00b8
_PT0	=	0x00b9
_PX1	=	0x00ba
_PT1	=	0x00bb
_PS	=	0x00bc
_P	=	0x00d0
_F1	=	0x00d1
_OV	=	0x00d2
_RS0	=	0x00d3
_RS1	=	0x00d4
_F0	=	0x00d5
_AC	=	0x00d6
_CY	=	0x00d7
_EUSB	=	0x00e8
_ES0	=	0x00ac
_ES1	=	0x00ae
_RI_0	=	0x0098
_TI_0	=	0x0099
_RI_1	=	0x00c0
_TI_1	=	0x00c1
_TR2	=	0x00ca
_TF2	=	0x00cf
_ET2	=	0x00ad
_SMOD1	=	0x00df
;--------------------------------------------------------
; overlayable register banks
;--------------------------------------------------------
	.area REG_BANK_0	(REL,OVR,DATA)
	.ds 8
	.area REG_BANK_1	(REL,OVR,DATA)
	.ds 8
	.area REG_BANK_2	(REL,OVR,DATA)
	.ds 8
	.area REG_BANK_3	(REL,OVR,DATA)
	.ds 8
;--------------------------------------------------------
; overlayable bit register bank
;--------------------------------------------------------
	.area BIT_BANK	(REL,OVR,DATA)
bits:
	.ds 1
	b0 = bits[0]
	b1 = bits[1]
	b2 = bits[2]
	b3 = bits[3]
	b4 = bits[4]
	b5 = bits[5]
	b6 = bits[6]
	b7 = bits[7]
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	.area DSEG    (DATA)
_sunkbd_type:
	.ds 1
_sunkbd_reset:
	.ds 1
_sunkbd_layout:
	.ds 1
_key_buffer::
	.ds 8
_kbd_txmit_me::
	.ds 1
_kbd_idle_duration:
	.ds 1
_kbd_idle_counter:
	.ds 1
_string_index:
	.ds 8
_sdat:
	.ds 2
_firmusb_script:
	.ds 30
_firmusb_inject_counter:
	.ds 2
_firmusb_ptr:
	.ds 3
_firmusb_inject_start:
	.ds 2
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
	.area	OSEG    (OVR,DATA)
	.area	OSEG    (OVR,DATA)
;--------------------------------------------------------
; Stack segment in internal ram 
;--------------------------------------------------------
	.area	SSEG
__start__stack:
	.ds	1

;--------------------------------------------------------
; indirectly addressable internal ram data
;--------------------------------------------------------
	.area ISEG    (DATA)
;--------------------------------------------------------
; absolute internal ram data
;--------------------------------------------------------
	.area IABS    (ABS,DATA)
	.area IABS    (ABS,DATA)
;--------------------------------------------------------
; bit data
;--------------------------------------------------------
	.area BSEG    (BIT)
_kbd_new_keys:
	.ds 1
_is_ctrl_out0_kbd:
	.ds 1
_kbd_idle_mode:
	.ds 1
_in1_busy:
	.ds 1
_kbd_serial_isr_parse_scancode_1_58:
	.ds 1
;--------------------------------------------------------
; paged external ram data
;--------------------------------------------------------
	.area PSEG    (PAG,XDATA)
;--------------------------------------------------------
; external ram data
;--------------------------------------------------------
	.area XSEG    (XDATA)
_EP0CS	=	0x7fb4
_IN0BUF	=	0x7f00
_IN0BC	=	0x7fb5
_OUT0BUF	=	0x7ec0
_OUT0BC	=	0x7fc5
_IN1CS	=	0x7fb6
_IN1BUF	=	0x7e80
_IN1BC	=	0x7fb7
_OUT1BUF	=	0x7e40
_OUT1CS	=	0x7fc6
_OUT1BC	=	0x7fc7
_IN2BUF	=	0x7e00
_IN2BC	=	0x7fb9
_IN2CS	=	0x7fb8
_OUT2BC	=	0x7fc9
_OUT2CS	=	0x7fc8
_OUT2BUF	=	0x7dc0
_IN3BUF	=	0x7d80
_OUT3BUF	=	0x7d40
_IN3CS	=	0x7fba
_IN3BC	=	0x7fbb
_OUT3CS	=	0x7fca
_OUT3BC	=	0x7fcb
_IN4BUF	=	0x7d00
_OUT4BUF	=	0x7cc0
_IN4CS	=	0x7fbc
_OUT4CS	=	0x7fcc
_IN4BC	=	0x7fbd
_OUT4BC	=	0x7fcd
_OEA	=	0x7f9c
_OUTA	=	0x7f96
_PINSA	=	0x7f99
_OEB	=	0x7f9d
_OUTB	=	0x7f97
_PINSB	=	0x7f9a
_OEC	=	0x7f9e
_OUTC	=	0x7f98
_PINSC	=	0x7f9b
_PORTACFG	=	0x7f93
_PORTBCFG	=	0x7f94
_PORTCCFG	=	0x7f95
_ISOCTL	=	0x7fa1
_IN07IRQ	=	0x7fa9
_OUT07IRQ	=	0x7faa
_IN07IEN	=	0x7fac
_OUT07IEN	=	0x7fad
_USBIRQ	=	0x7fab
_USBIEN	=	0x7fae
_USBPAIR	=	0x7fdd
_USBBAV	=	0x7faf
_USBCS	=	0x7fd6
_TOGCTL	=	0x7fd7
_SUDPTRH	=	0x7fd4
_SUDPTRL	=	0x7fd5
_SETUPDAT	=	0x7fe8
_I2CS	=	0x7fa5
_I2DAT	=	0x7fa6
_IN07VAL	=	0x7fde
_OUT07VAL	=	0x7fdf
_FASTXFR	=	0x7fe2
_AUTOPTRH	=	0x7fe3
_AUTOPTRL	=	0x7fe4
_AUTODATA	=	0x7fe5
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area XABS    (ABS,XDATA)
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
	.area XISEG   (XDATA)
	.area HOME    (CODE)
	.area GSINIT0 (CODE)
	.area GSINIT1 (CODE)
	.area GSINIT2 (CODE)
	.area GSINIT3 (CODE)
	.area GSINIT4 (CODE)
	.area GSINIT5 (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area CSEG    (CODE)
;--------------------------------------------------------
; interrupt vector 
;--------------------------------------------------------
	.area HOME    (CODE)
__interrupt_vect:
	ljmp	__sdcc_gsinit_startup
	reti
	.ds	7
	reti
	.ds	7
	reti
	.ds	7
	reti
	.ds	7
	ljmp	_kbd_serial_isr
	.ds	5
	ljmp	_timer2_isr
	.ds	5
	reti
	.ds	7
	reti
	.ds	7
	ljmp	_usb_isr
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME    (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area GSINIT  (CODE)
	.globl __sdcc_gsinit_startup
	.globl __sdcc_program_startup
	.globl __start__stack
	.globl __mcs51_genXINIT
	.globl __mcs51_genXRAMCLEAR
	.globl __mcs51_genRAMCLEAR
;	sunkbd_hid.h:427: static __data unsigned int string_index[NUM_STRING] = {
	mov	r6,#_string_langid
	mov	r7,#(_string_langid >> 8)
	mov	(_string_index + 0),r6
	mov	(_string_index + 1),r7
	mov	r6,#_string_mfg
	mov	r7,#(_string_mfg >> 8)
	mov	((_string_index + 0x0002) + 0),r6
	mov	((_string_index + 0x0002) + 1),r7
	mov	r6,#_string_prod
	mov	r7,#(_string_prod >> 8)
	mov	((_string_index + 0x0004) + 0),r6
	mov	((_string_index + 0x0004) + 1),r7
	mov	r6,#_string_if_keyboard
	mov	r7,#(_string_if_keyboard >> 8)
	mov	((_string_index + 0x0006) + 0),r6
	mov	((_string_index + 0x0006) + 1),r7
;	sunkbd_hid.h:462: static __xdata setup_dat * __data sdat = (__xdata setup_dat *)&SETUPDAT;
	mov	_sdat,#_SETUPDAT
	mov	(_sdat + 1),#(_SETUPDAT >> 8)
;	sunkbd_hid.c:57: static Byte firmusb_script[] =
	mov	_firmusb_script,#0xe2
	mov	(_firmusb_script + 0x0001),#0x3b
	mov	(_firmusb_script + 0x0002),#0x1b
	mov	(_firmusb_script + 0x0003),#0x17
	mov	(_firmusb_script + 0x0004),#0x08
	mov	(_firmusb_script + 0x0005),#0x15
	mov	(_firmusb_script + 0x0006),#0x10
	mov	(_firmusb_script + 0x0007),#0x28
	mov	(_firmusb_script + 0x0008),#0x13
	mov	(_firmusb_script + 0x0009),#0x1a
	mov	(_firmusb_script + 0x000a),#0x07
	mov	(_firmusb_script + 0x000b),#0x28
	mov	(_firmusb_script + 0x000c),#0x0c
	mov	(_firmusb_script + 0x000d),#0x07
	mov	(_firmusb_script + 0x000e),#0x28
	mov	(_firmusb_script + 0x000f),#0x06
	mov	(_firmusb_script + 0x0010),#0x04
	mov	(_firmusb_script + 0x0011),#0x17
	mov	(_firmusb_script + 0x0012),#0x2c
	mov	(_firmusb_script + 0x0013),#0x38
	mov	(_firmusb_script + 0x0014),#0x08
	mov	(_firmusb_script + 0x0015),#0x17
	mov	(_firmusb_script + 0x0016),#0x06
	mov	(_firmusb_script + 0x0017),#0x38
	mov	(_firmusb_script + 0x0018),#0x13
	mov	(_firmusb_script + 0x0019),#0x04
	mov	(_firmusb_script + 0x001a),#0x16
	mov	(_firmusb_script + 0x001b),#0x16
	mov	(_firmusb_script + 0x001c),#0x07
	mov	(_firmusb_script + 0x001d),#0x28
	.area GSFINAL (CODE)
	ljmp	__sdcc_program_startup
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME    (CODE)
	.area HOME    (CODE)
__sdcc_program_startup:
	ljmp	_main
;	return from main will return to caller
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CSEG    (CODE)
;------------------------------------------------------------
;Allocation info for local variables in function 'apply_reset_values'
;------------------------------------------------------------
;	sunkbd_hid.c:79: static void apply_reset_values()
;	-----------------------------------------
;	 function apply_reset_values
;	-----------------------------------------
_apply_reset_values:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
;	sunkbd_hid.c:83: kbd_txmit_me        = -1;
	mov	_kbd_txmit_me,#0xff
;	sunkbd_hid.c:84: kbd_new_keys        = 0;
	clr	_kbd_new_keys
;	sunkbd_hid.c:85: is_ctrl_out0_kbd    = 0;
	clr	_is_ctrl_out0_kbd
;	sunkbd_hid.c:86: kbd_idle_mode       = FALSE;
	clr	_kbd_idle_mode
;	sunkbd_hid.c:87: kbd_idle_duration   = 125;
	mov	_kbd_idle_duration,#0x7d
;	sunkbd_hid.c:88: in1_busy            = FALSE;
	clr	_in1_busy
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'get_descriptor'
;------------------------------------------------------------
;	sunkbd_hid.c:115: static void get_descriptor(void) __using (1)
;	-----------------------------------------
;	 function get_descriptor
;	-----------------------------------------
_get_descriptor:
	ar7 = 0x0f
	ar6 = 0x0e
	ar5 = 0x0d
	ar4 = 0x0c
	ar3 = 0x0b
	ar2 = 0x0a
	ar1 = 0x09
	ar0 = 0x08
;	sunkbd_hid.c:117: switch (sdat->wValueH) {
	mov	dpl,_sdat
	mov	dph,(_sdat + 1)
	inc	dptr
	inc	dptr
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	cjne	r7,#0x01,00143$
	sjmp	00101$
00143$:
	cjne	r7,#0x02,00144$
	sjmp	00102$
00144$:
	cjne	r7,#0x03,00145$
	sjmp	00103$
00145$:
	cjne	r7,#0x21,00146$
	ljmp	00107$
00146$:
	cjne	r7,#0x22,00147$
	ljmp	00111$
00147$:
	ljmp	00115$
;	sunkbd_hid.c:119: case USB_DT_DEVICE:
00101$:
;	sunkbd_hid.c:120: EP0CS   = 0x02;   /* clear HSNACK */
	mov	dptr,#_EP0CS
	mov	a,#0x02
	movx	@dptr,a
;	sunkbd_hid.c:121: SUDPTRH = (Byte)((unsigned int)dev_desc >> 8);
	mov	r6,#_dev_desc
	mov	r7,#(_dev_desc >> 8)
	mov	dptr,#_SUDPTRH
	mov	a,r7
	movx	@dptr,a
;	sunkbd_hid.c:122: SUDPTRL = (unsigned int)dev_desc & 0xff;
	mov	r6,#_dev_desc
	mov	r7,#(_dev_desc >> 8)
	mov	dptr,#_SUDPTRL
	mov	a,r6
	movx	@dptr,a
;	sunkbd_hid.c:123: break;
	ret
;	sunkbd_hid.c:126: case USB_DT_CONFIG:
00102$:
;	sunkbd_hid.c:127: EP0CS   = 0x02;   /* clear HSNACK */
	mov	dptr,#_EP0CS
	mov	a,#0x02
	movx	@dptr,a
;	sunkbd_hid.c:128: SUDPTRH = (Byte)((unsigned int)conf_desc >> 8);
	mov	r6,#_conf_desc
	mov	r7,#(_conf_desc >> 8)
	mov	dptr,#_SUDPTRH
	mov	a,r7
	movx	@dptr,a
;	sunkbd_hid.c:129: SUDPTRL = (unsigned int)conf_desc & 0xff;
	mov	r6,#_conf_desc
	mov	r7,#(_conf_desc >> 8)
	mov	dptr,#_SUDPTRL
	mov	a,r6
	movx	@dptr,a
;	sunkbd_hid.c:130: break;
	ret
;	sunkbd_hid.c:133: case USB_DT_STRING:
00103$:
;	sunkbd_hid.c:134: if (sdat->wValueL < NUM_STRING) {
	mov	dpl,_sdat
	mov	dph,(_sdat + 1)
	inc	dptr
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	cjne	r7,#0x04,00148$
00148$:
	jnc	00105$
;	sunkbd_hid.c:135: EP0CS     = 0x02;   /* clear HSNACK */
	mov	dptr,#_EP0CS
	mov	a,#0x02
	movx	@dptr,a
;	sunkbd_hid.c:136: SUDPTRH = (Byte)(string_index[sdat->wValueL] >> 8);
	mov	dpl,_sdat
	mov	dph,(_sdat + 1)
	inc	dptr
	inc	dptr
	movx	a,@dptr
	add	a,acc
	add	a,#_string_index
	mov	r1,a
	mov	ar6,@r1
	inc	r1
	mov	ar7,@r1
	mov	dptr,#_SUDPTRH
	mov	a,r7
	movx	@dptr,a
;	sunkbd_hid.c:137: SUDPTRL = string_index[sdat->wValueL] & 0xff;
	mov	dpl,_sdat
	mov	dph,(_sdat + 1)
	inc	dptr
	inc	dptr
	movx	a,@dptr
	add	a,acc
	add	a,#_string_index
	mov	r1,a
	mov	ar6,@r1
	inc	r1
	mov	ar7,@r1
	mov	dptr,#_SUDPTRL
	mov	a,r6
	movx	@dptr,a
	ret
00105$:
;	sunkbd_hid.c:139: EP0CS     = 0x03;   /* stall */
	mov	dptr,#_EP0CS
	mov	a,#0x03
	movx	@dptr,a
;	sunkbd_hid.c:141: break;
;	sunkbd_hid.c:144: case USB_DT_HID:
	ret
00107$:
;	sunkbd_hid.c:160: if (sdat->wIndexL == 0) {
	mov	a,#0x04
	add	a,_sdat
	mov	r6,a
	clr	a
	addc	a,(_sdat + 1)
	mov	r7,a
	mov	dpl,r6
	mov	dph,r7
	movx	a,@dptr
	jnz	00109$
;	sunkbd_hid.c:162: EP0CS   = 0x02;   /* clear HSNACK */
	mov	dptr,#_EP0CS
	mov	a,#0x02
	movx	@dptr,a
;	sunkbd_hid.c:164: SUDPTRH = (Byte)(((unsigned int)conf_desc) + 18 >> 8);
	mov	r6,#_conf_desc
	mov	r7,#(_conf_desc >> 8)
	mov	a,#0x12
	add	a,r6
	clr	a
	addc	a,r7
	mov	dptr,#_SUDPTRH
	movx	@dptr,a
;	sunkbd_hid.c:165: SUDPTRL = ((unsigned int)conf_desc) + 18 & 0xff;
	mov	r6,#_conf_desc
	mov	r7,#(_conf_desc >> 8)
	mov	dptr,#_SUDPTRL
	mov	a,#0x12
	add	a,r6
	movx	@dptr,a
	ret
00109$:
;	sunkbd_hid.c:170: EP0CS   = 0x03;   /* stall */
	mov	dptr,#_EP0CS
	mov	a,#0x03
	movx	@dptr,a
;	sunkbd_hid.c:172: break;
;	sunkbd_hid.c:175: case USB_DT_REPORT:
	ret
00111$:
;	sunkbd_hid.c:189: if (sdat->wIndexL == 0) {
	mov	a,#0x04
	add	a,_sdat
	mov	r6,a
	clr	a
	addc	a,(_sdat + 1)
	mov	r7,a
	mov	dpl,r6
	mov	dph,r7
	movx	a,@dptr
	jnz	00113$
;	sunkbd_hid.c:191: EP0CS   = 0x02;   /* clear HSNACK */
	mov	dptr,#_EP0CS
	mov	a,#0x02
	movx	@dptr,a
;	sunkbd_hid.c:192: SUDPTRH = (Byte)((unsigned int)(report_desc_keyboard) >> 8);
	mov	r6,#_report_desc_keyboard
	mov	r7,#(_report_desc_keyboard >> 8)
	mov	dptr,#_SUDPTRH
	mov	a,r7
	movx	@dptr,a
;	sunkbd_hid.c:193: SUDPTRL = (unsigned int)(report_desc_keyboard) & 0xff;
	mov	r6,#_report_desc_keyboard
	mov	r7,#(_report_desc_keyboard >> 8)
	mov	dptr,#_SUDPTRL
	mov	a,r6
	movx	@dptr,a
	ret
00113$:
;	sunkbd_hid.c:202: EP0CS   = 0x03;   /* stall */
	mov	dptr,#_EP0CS
	mov	a,#0x03
	movx	@dptr,a
;	sunkbd_hid.c:204: break;
;	sunkbd_hid.c:206: default:
	ret
00115$:
;	sunkbd_hid.c:207: EP0CS     = 0x03;   /* stall */
	mov	dptr,#_EP0CS
	mov	a,#0x03
	movx	@dptr,a
;	sunkbd_hid.c:209: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'usb_isr'
;------------------------------------------------------------
;i                         Allocated to registers r7 
;led_status                Allocated to registers r7 
;------------------------------------------------------------
;	sunkbd_hid.c:228: static void usb_isr(void) __interrupt (8) __using (1) __critical
;	-----------------------------------------
;	 function usb_isr
;	-----------------------------------------
_usb_isr:
	clr	ea
	push	bits
	push	acc
	push	b
	push	dpl
	push	dph
	push	(0+7)
	push	(0+6)
	push	(0+5)
	push	(0+4)
	push	(0+3)
	push	(0+2)
	push	(0+1)
	push	(0+0)
	push	psw
	mov	psw,#0x08
;	sunkbd_hid.c:231: EXIF &= 0xef;
	anl	_EXIF,#0xef
;	sunkbd_hid.c:234: if (USBIRQ & 0x01) {
	mov	dptr,#_USBIRQ
	movx	a,@dptr
	mov	r7,a
	jb	acc.0,00322$
	ljmp	00183$
00322$:
;	sunkbd_hid.c:238: USBIRQ = 0x01;
	mov	dptr,#_USBIRQ
	mov	a,#0x01
	movx	@dptr,a
;	sunkbd_hid.c:240: switch (sdat->bRequest) {
	mov	dpl,_sdat
	mov	dph,(_sdat + 1)
	inc	dptr
	movx	a,@dptr
	mov  r7,a
	add	a,#0xff - 0x0b
	jnc	00323$
	ljmp	00180$
00323$:
	mov	a,r7
	add	a,#(00324$-3-.)
	movc	a,@a+pc
	mov	dpl,a
	mov	a,r7
	add	a,#(00325$-3-.)
	movc	a,@a+pc
	mov	dph,a
	clr	a
	jmp	@a+dptr
00324$:
	.db	00101$
	.db	00107$
	.db	00125$
	.db	00132$
	.db	00180$
	.db	00180$
	.db	00148$
	.db	00180$
	.db	00149$
	.db	00153$
	.db	00158$
	.db	00169$
00325$:
	.db	00101$>>8
	.db	00107$>>8
	.db	00125$>>8
	.db	00132$>>8
	.db	00180$>>8
	.db	00180$>>8
	.db	00148$>>8
	.db	00180$>>8
	.db	00149$>>8
	.db	00153$>>8
	.db	00158$>>8
	.db	00169$>>8
;	sunkbd_hid.c:243: case 0x00:
00101$:
;	sunkbd_hid.c:244: switch (sdat->bmRequestType) {
	mov	dpl,_sdat
	mov	dph,(_sdat + 1)
	movx	a,@dptr
	mov	r7,a
	cjne	r7,#0x80,00326$
	sjmp	00104$
00326$:
	cjne	r7,#0x81,00327$
	sjmp	00104$
00327$:
	cjne	r7,#0x82,00105$
;	sunkbd_hid.c:250: case 0x82:
00104$:
;	sunkbd_hid.c:251: in0buf(0) = 0x00;
	mov	dptr,#_IN0BUF
	clr	a
	movx	@dptr,a
;	sunkbd_hid.c:252: in0buf(1) = 0x00;
	mov	dptr,#(_IN0BUF + 0x0001)
	movx	@dptr,a
;	sunkbd_hid.c:253: IN0BC     = 0x02;
	mov	dptr,#_IN0BC
	mov	a,#0x02
	movx	@dptr,a
;	sunkbd_hid.c:254: EP0CS     = 0x02;   /* clear HSNACK */
	mov	dptr,#_EP0CS
	movx	@dptr,a
;	sunkbd_hid.c:255: break;
	ljmp	00183$
;	sunkbd_hid.c:257: default:
00105$:
;	sunkbd_hid.c:258: EP0CS     = 0x03;   /* stall */
	mov	dptr,#_EP0CS
	mov	a,#0x03
	movx	@dptr,a
;	sunkbd_hid.c:261: break;
	ljmp	00183$
;	sunkbd_hid.c:264: case 0x01:
00107$:
;	sunkbd_hid.c:265: switch (sdat->bmRequestType) {
	mov	dpl,_sdat
	mov	dph,(_sdat + 1)
	movx	a,@dptr
	mov	r7,a
	jz	00108$
	cjne	r7,#0x01,00331$
	sjmp	00109$
00331$:
	cjne	r7,#0x02,00332$
	sjmp	00110$
00332$:
	cjne	r7,#0xa1,00333$
	ljmp	00116$
00333$:
	ljmp	00123$
;	sunkbd_hid.c:267: case 0x00:
00108$:
;	sunkbd_hid.c:268: EP0CS     = 0x02;   /* clear HSNACK */
	mov	dptr,#_EP0CS
	mov	a,#0x02
	movx	@dptr,a
;	sunkbd_hid.c:269: break;
	ljmp	00183$
;	sunkbd_hid.c:271: case 0x01:
00109$:
;	sunkbd_hid.c:272: EP0CS     = 0x02;   /* clear HSNACK */
	mov	dptr,#_EP0CS
	mov	a,#0x02
	movx	@dptr,a
;	sunkbd_hid.c:273: break;
	ljmp	00183$
;	sunkbd_hid.c:275: case 0x02:
00110$:
;	sunkbd_hid.c:276: switch (sdat->wIndexL) {
	mov	dpl,_sdat
	mov	dph,(_sdat + 1)
	inc	dptr
	inc	dptr
	inc	dptr
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	jz	00111$
	cjne	r7,#0x80,00335$
	sjmp	00112$
00335$:
	cjne	r7,#0x81,00336$
	sjmp	00113$
00336$:
	cjne	r7,#0x82,00337$
	sjmp	00114$
00337$:
	ljmp	00183$
;	sunkbd_hid.c:279: case 0x00:  /* OUT0 */
00111$:
;	sunkbd_hid.c:280: TOGCTL = 0x00;
	mov	dptr,#_TOGCTL
	clr	a
	movx	@dptr,a
;	sunkbd_hid.c:281: TOGCTL = 0x20;
	mov	a,#0x20
	movx	@dptr,a
;	sunkbd_hid.c:282: EP0CS  = 0x02;   /* clear HSNACK */
	mov	dptr,#_EP0CS
	swap	a
	movx	@dptr,a
;	sunkbd_hid.c:283: break;
	ljmp	00183$
;	sunkbd_hid.c:284: case 0x80:  /* IN0  */
00112$:
;	sunkbd_hid.c:285: TOGCTL = 0x10;
	mov	dptr,#_TOGCTL
	mov	a,#0x10
	movx	@dptr,a
;	sunkbd_hid.c:286: TOGCTL = 0x30;
	mov	a,#0x30
	movx	@dptr,a
;	sunkbd_hid.c:287: EP0CS  = 0x02;   /* clear HSNACK */
	mov	dptr,#_EP0CS
	mov	a,#0x02
	movx	@dptr,a
;	sunkbd_hid.c:288: break;
	ljmp	00183$
;	sunkbd_hid.c:289: case 0x81:  /* IN1  */
00113$:
;	sunkbd_hid.c:291: IN1CS &= 0xfe;
	mov	dptr,#_IN1CS
	movx	a,@dptr
	mov	r7,a
	mov	a,#0xfe
	anl	a,r7
	movx	@dptr,a
;	sunkbd_hid.c:292: TOGCTL = 0x11;
	mov	dptr,#_TOGCTL
	mov	a,#0x11
	movx	@dptr,a
;	sunkbd_hid.c:293: TOGCTL = 0x31;
	mov	a,#0x31
	movx	@dptr,a
;	sunkbd_hid.c:294: EP0CS  = 0x02;   /* clear HSNACK */
	mov	dptr,#_EP0CS
	mov	a,#0x02
	movx	@dptr,a
;	sunkbd_hid.c:298: break;
	ljmp	00183$
;	sunkbd_hid.c:299: case 0x82:  /* IN2  */
00114$:
;	sunkbd_hid.c:306: EP0CS  = 0x03;   /* stall */
	mov	dptr,#_EP0CS
	mov	a,#0x03
	movx	@dptr,a
;	sunkbd_hid.c:310: break;
	ljmp	00183$
;	sunkbd_hid.c:313: case 0xa1:
00116$:
;	sunkbd_hid.c:340: if (sdat->wIndexL == 0) {
	mov	a,#0x04
	add	a,_sdat
	mov	r6,a
	clr	a
	addc	a,(_sdat + 1)
	mov	r7,a
	mov	dpl,r6
	mov	dph,r7
	movx	a,@dptr
	jnz	00121$
;	sunkbd_hid.c:342: while (i-- > 0)
	mov	r7,#0x07
00117$:
	mov	ar6,r7
	dec	r7
	mov	a,r6
	jz	00119$
;	sunkbd_hid.c:343: in0buf(i) = key_buffer[i];
	mov	dpl,r7
	mov	dph,#(_IN0BUF >> 8)
	mov	a,r7
	add	a,#_key_buffer
	mov	r1,a
	mov	a,@r1
	mov	r6,a
	movx	@dptr,a
	sjmp	00117$
00119$:
;	sunkbd_hid.c:346: kbd_new_keys = FALSE;
	clr	_kbd_new_keys
;	sunkbd_hid.c:348: IN0BC    = 0x08;
	mov	dptr,#_IN0BC
	mov	a,#0x08
	movx	@dptr,a
;	sunkbd_hid.c:349: EP0CS    = 0x02;   /* clear HSNACK */
	mov	dptr,#_EP0CS
	mov	a,#0x02
	movx	@dptr,a
	ljmp	00183$
00121$:
;	sunkbd_hid.c:363: EP0CS = 0x03;   /* stall */
	mov	dptr,#_EP0CS
	mov	a,#0x03
	movx	@dptr,a
;	sunkbd_hid.c:366: break;
	ljmp	00183$
;	sunkbd_hid.c:368: default:
00123$:
;	sunkbd_hid.c:369: EP0CS     = 0x03;   /* stall */
	mov	dptr,#_EP0CS
	mov	a,#0x03
	movx	@dptr,a
;	sunkbd_hid.c:372: break;
	ljmp	00183$
;	sunkbd_hid.c:375: case 0x02:
00125$:
;	sunkbd_hid.c:376: switch (sdat->bmRequestType) {
	mov	dpl,_sdat
	mov	dph,(_sdat + 1)
	movx	a,@dptr
	mov	r7,a
	cjne	r7,#0xa1,00130$
;	sunkbd_hid.c:392: if (sdat->wIndexL == 0) {
	mov	a,#0x04
	add	a,_sdat
	mov	r6,a
	clr	a
	addc	a,(_sdat + 1)
	mov	r7,a
	mov	dpl,r6
	mov	dph,r7
	movx	a,@dptr
	jnz	00128$
;	sunkbd_hid.c:394: in0buf(0) = kbd_idle_duration;
	mov	dptr,#_IN0BUF
	mov	a,_kbd_idle_duration
	movx	@dptr,a
;	sunkbd_hid.c:398: IN0BC     = 0x01;
	mov	dptr,#_IN0BC
	mov	a,#0x01
	movx	@dptr,a
;	sunkbd_hid.c:399: EP0CS     = 0x02;   /* clear HSNACK */
	mov	dptr,#_EP0CS
	inc	a
	movx	@dptr,a
	ljmp	00183$
00128$:
;	sunkbd_hid.c:401: EP0CS  = 0x03;   /* stall */
	mov	dptr,#_EP0CS
	mov	a,#0x03
	movx	@dptr,a
;	sunkbd_hid.c:405: break;
	ljmp	00183$
;	sunkbd_hid.c:407: default:
00130$:
;	sunkbd_hid.c:408: EP0CS     = 0x03;   /* stall */
	mov	dptr,#_EP0CS
	mov	a,#0x03
	movx	@dptr,a
;	sunkbd_hid.c:411: break;
	ljmp	00183$
;	sunkbd_hid.c:414: case 0x03:
00132$:
;	sunkbd_hid.c:415: switch (sdat->bmRequestType) {
	mov	dpl,_sdat
	mov	dph,(_sdat + 1)
	movx	a,@dptr
	mov	r7,a
	jz	00133$
	cjne	r7,#0x01,00344$
	sjmp	00134$
00344$:
	cjne	r7,#0x02,00345$
	sjmp	00135$
00345$:
	cjne	r7,#0xa1,00346$
	ljmp	00142$
00346$:
	ljmp	00146$
;	sunkbd_hid.c:417: case 0x00:
00133$:
;	sunkbd_hid.c:418: EP0CS     = 0x02;   /* clear HSNACK */
	mov	dptr,#_EP0CS
	mov	a,#0x02
	movx	@dptr,a
;	sunkbd_hid.c:419: break;
	ljmp	00183$
;	sunkbd_hid.c:421: case 0x01:
00134$:
;	sunkbd_hid.c:422: EP0CS     = 0x02;   /* clear HSNACK */
	mov	dptr,#_EP0CS
	mov	a,#0x02
	movx	@dptr,a
;	sunkbd_hid.c:423: break;
	ljmp	00183$
;	sunkbd_hid.c:425: case 0x02:
00135$:
;	sunkbd_hid.c:426: switch (sdat->wIndexL) {
	mov	dpl,_sdat
	mov	dph,(_sdat + 1)
	inc	dptr
	inc	dptr
	inc	dptr
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	jz	00136$
	cjne	r7,#0x80,00348$
	sjmp	00137$
00348$:
	cjne	r7,#0x81,00349$
	sjmp	00138$
00349$:
;	sunkbd_hid.c:427: case 0x00:  /* OUT0 */
	cjne	r7,#0x82,00140$
	sjmp	00139$
00136$:
;	sunkbd_hid.c:428: EP0CS  |= 0x01;  /* stall endpoint */
	mov	dptr,#_EP0CS
	movx	a,@dptr
	mov	r7,a
	mov	a,#0x01
	orl	a,r7
	movx	@dptr,a
;	sunkbd_hid.c:429: TOGCTL  = 0x00;
	mov	dptr,#_TOGCTL
	clr	a
	movx	@dptr,a
;	sunkbd_hid.c:430: TOGCTL  = 0x20;
	mov	a,#0x20
	movx	@dptr,a
;	sunkbd_hid.c:431: OUT0BC  = 0x00;
	mov	dptr,#_OUT0BC
	clr	a
	movx	@dptr,a
;	sunkbd_hid.c:432: EP0CS  |= 0x02;  /* clear HSNACK */
	mov	dptr,#_EP0CS
	movx	a,@dptr
	mov	r7,a
	mov	a,#0x02
	orl	a,r7
	movx	@dptr,a
;	sunkbd_hid.c:433: break;
	ljmp	00183$
;	sunkbd_hid.c:434: case 0x80:  /* IN0  */
00137$:
;	sunkbd_hid.c:435: EP0CS  |= 0x01;  /* stall endpoint */
	mov	dptr,#_EP0CS
	movx	a,@dptr
	mov	r7,a
	mov	a,#0x01
	orl	a,r7
	movx	@dptr,a
;	sunkbd_hid.c:436: TOGCTL  = 0x10;
	mov	dptr,#_TOGCTL
	mov	a,#0x10
	movx	@dptr,a
;	sunkbd_hid.c:437: TOGCTL  = 0x30;
	mov	a,#0x30
	movx	@dptr,a
;	sunkbd_hid.c:438: EP0CS  |= 0x02;  /* clear HSNACK */
	mov	dptr,#_EP0CS
	movx	a,@dptr
	mov	r7,a
	mov	a,#0x02
	orl	a,r7
	movx	@dptr,a
;	sunkbd_hid.c:439: break;
	ljmp	00183$
;	sunkbd_hid.c:440: case 0x81:  /* IN1  */
00138$:
;	sunkbd_hid.c:442: IN1CS   = 0x01;  /* stall endpoint */
	mov	dptr,#_IN1CS
	mov	a,#0x01
	movx	@dptr,a
;	sunkbd_hid.c:443: TOGCTL  = 0x11;
	mov	dptr,#_TOGCTL
	mov	a,#0x11
	movx	@dptr,a
;	sunkbd_hid.c:444: TOGCTL  = 0x31;
	mov	a,#0x31
	movx	@dptr,a
;	sunkbd_hid.c:445: IN1CS  |= 0x02;
	mov	dptr,#_IN1CS
	movx	a,@dptr
	mov	r7,a
	mov	a,#0x02
	orl	a,r7
	movx	@dptr,a
;	sunkbd_hid.c:446: EP0CS   = 0x02;  /* clear HSNACK */
	mov	dptr,#_EP0CS
	mov	a,#0x02
	movx	@dptr,a
;	sunkbd_hid.c:450: break;
	ljmp	00183$
;	sunkbd_hid.c:451: case 0x82:  /* IN2  */
00139$:
;	sunkbd_hid.c:459: EP0CS  = 0x03;   /* stall */
	mov	dptr,#_EP0CS
	mov	a,#0x03
	movx	@dptr,a
;	sunkbd_hid.c:461: break;
	ljmp	00183$
;	sunkbd_hid.c:462: default:
00140$:
;	sunkbd_hid.c:463: EP0CS  = 0x03;   /* stall */
	mov	dptr,#_EP0CS
	mov	a,#0x03
	movx	@dptr,a
;	sunkbd_hid.c:466: break;
	ljmp	00183$
;	sunkbd_hid.c:469: case 0xa1:
00142$:
;	sunkbd_hid.c:473: if (sdat->wIndexL == 0) {
	mov	a,#0x04
	add	a,_sdat
	mov	r6,a
	clr	a
	addc	a,(_sdat + 1)
	mov	r7,a
	mov	dpl,r6
	mov	dph,r7
	movx	a,@dptr
	jnz	00144$
;	sunkbd_hid.c:475: in0buf(0) = 1; /* always send Report protocol */
	mov	dptr,#_IN0BUF
	mov	a,#0x01
	movx	@dptr,a
;	sunkbd_hid.c:476: IN0BC     = 0x01;
	mov	dptr,#_IN0BC
	movx	@dptr,a
;	sunkbd_hid.c:477: EP0CS     = 0x02;   /* clear HSNACK */
	mov	dptr,#_EP0CS
	inc	a
	movx	@dptr,a
	ljmp	00183$
00144$:
;	sunkbd_hid.c:479: EP0CS  = 0x03;   /* stall */
	mov	dptr,#_EP0CS
	mov	a,#0x03
	movx	@dptr,a
;	sunkbd_hid.c:480: break;
	ljmp	00183$
;	sunkbd_hid.c:482: default:
00146$:
;	sunkbd_hid.c:483: EP0CS     = 0x03;   /* stall */
	mov	dptr,#_EP0CS
	mov	a,#0x03
	movx	@dptr,a
;	sunkbd_hid.c:486: break;
	ljmp	00183$
;	sunkbd_hid.c:489: case 0x06:
00148$:
;	sunkbd_hid.c:490: get_descriptor(/*sdat*/);
	lcall	_get_descriptor
;	sunkbd_hid.c:491: break;
	ljmp	00183$
;	sunkbd_hid.c:494: case 0x08:
00149$:
;	sunkbd_hid.c:495: if (sdat->bmRequestType == 0x80) {
	mov	dpl,_sdat
	mov	dph,(_sdat + 1)
	movx	a,@dptr
	mov	r7,a
	cjne	r7,#0x80,00151$
;	sunkbd_hid.c:496: in0buf(0) = 0x01;
	mov	dptr,#_IN0BUF
	mov	a,#0x01
	movx	@dptr,a
;	sunkbd_hid.c:497: IN0BC     = 0x01;
	mov	dptr,#_IN0BC
	movx	@dptr,a
;	sunkbd_hid.c:498: EP0CS     = 0x02;   /* clear HSNACK */
	mov	dptr,#_EP0CS
	inc	a
	movx	@dptr,a
	ljmp	00183$
00151$:
;	sunkbd_hid.c:500: EP0CS     = 0x03;   /* stall */
	mov	dptr,#_EP0CS
	mov	a,#0x03
	movx	@dptr,a
;	sunkbd_hid.c:502: break;
	ljmp	00183$
;	sunkbd_hid.c:505: case 0x09:
00153$:
;	sunkbd_hid.c:506: switch (sdat->bmRequestType) {
	mov	dpl,_sdat
	mov	dph,(_sdat + 1)
	movx	a,@dptr
	mov	r7,a
	jz	00154$
;	sunkbd_hid.c:508: case 0x00:
	cjne	r7,#0x21,00156$
	sjmp	00155$
00154$:
;	sunkbd_hid.c:509: EP0CS     = 0x02;   /* clear HSNACK */
	mov	dptr,#_EP0CS
	mov	a,#0x02
	movx	@dptr,a
;	sunkbd_hid.c:510: break;
	ljmp	00183$
;	sunkbd_hid.c:513: case 0x21:
00155$:
;	sunkbd_hid.c:516: is_ctrl_out0_kbd = TRUE;
	setb	_is_ctrl_out0_kbd
;	sunkbd_hid.c:517: OUT0BC   = 0x00;    /* arm endpoint OUT0 */
	mov	dptr,#_OUT0BC
	clr	a
	movx	@dptr,a
;	sunkbd_hid.c:520: break;
	ljmp	00183$
;	sunkbd_hid.c:522: default:
00156$:
;	sunkbd_hid.c:523: EP0CS     = 0x03;   /* stall */
	mov	dptr,#_EP0CS
	mov	a,#0x03
	movx	@dptr,a
;	sunkbd_hid.c:526: break;
	ljmp	00183$
;	sunkbd_hid.c:529: case 0x0a:
00158$:
;	sunkbd_hid.c:530: switch (sdat->bmRequestType) {
	mov	dpl,_sdat
	mov	dph,(_sdat + 1)
	movx	a,@dptr
	mov	r7,a
	cjne	r7,#0x21,00356$
	sjmp	00160$
00356$:
	cjne	r7,#0x81,00167$
;	sunkbd_hid.c:533: in0buf(0) = 0x00;
	mov	dptr,#_IN0BUF
	clr	a
	movx	@dptr,a
;	sunkbd_hid.c:534: IN0BC     = 0x01;
	mov	dptr,#_IN0BC
	inc	a
	movx	@dptr,a
;	sunkbd_hid.c:535: EP0CS     = 0x02;   /* clear HSNACK */
	mov	dptr,#_EP0CS
	inc	a
	movx	@dptr,a
;	sunkbd_hid.c:536: break;
	ljmp	00183$
;	sunkbd_hid.c:539: case 0x21:
00160$:
;	sunkbd_hid.c:565: if (sdat->wIndexL == 0) {
	mov	a,#0x04
	add	a,_sdat
	mov	r6,a
	clr	a
	addc	a,(_sdat + 1)
	mov	r7,a
	mov	dpl,r6
	mov	dph,r7
	movx	a,@dptr
	jnz	00165$
;	sunkbd_hid.c:567: if (sdat->wValueH > 0) {
	mov	a,#0x03
	add	a,_sdat
	mov	r6,a
	clr	a
	addc	a,(_sdat + 1)
	mov	r7,a
	mov	dpl,r6
	mov	dph,r7
	movx	a,@dptr
	jz	00162$
;	sunkbd_hid.c:569: kbd_idle_mode     = FALSE;
	clr	_kbd_idle_mode
;	sunkbd_hid.c:570: kbd_idle_duration = sdat->wValueH;
	mov	dpl,_sdat
	mov	dph,(_sdat + 1)
	inc	dptr
	inc	dptr
	inc	dptr
	movx	a,@dptr
	mov	_kbd_idle_duration,a
	sjmp	00163$
00162$:
;	sunkbd_hid.c:578: kbd_idle_mode     = TRUE;
	setb	_kbd_idle_mode
00163$:
;	sunkbd_hid.c:585: EP0CS  = 0x02;   /* clear HSNACK */
	mov	dptr,#_EP0CS
	mov	a,#0x02
	movx	@dptr,a
	ljmp	00183$
00165$:
;	sunkbd_hid.c:587: EP0CS  = 0x03;   /* stall */
	mov	dptr,#_EP0CS
	mov	a,#0x03
	movx	@dptr,a
;	sunkbd_hid.c:589: break;
	ljmp	00183$
;	sunkbd_hid.c:591: default:
00167$:
;	sunkbd_hid.c:592: EP0CS     = 0x03;   /* stall */
	mov	dptr,#_EP0CS
	mov	a,#0x03
	movx	@dptr,a
;	sunkbd_hid.c:595: break;
	ljmp	00183$
;	sunkbd_hid.c:598: case 0x0b:
00169$:
;	sunkbd_hid.c:599: switch (sdat->bmRequestType) {
	mov	dpl,_sdat
	mov	dph,(_sdat + 1)
	movx	a,@dptr
	mov	r7,a
	cjne	r7,#0x01,00361$
	sjmp	00170$
00361$:
;	sunkbd_hid.c:601: case 0x01:
	cjne	r7,#0x21,00178$
	sjmp	00177$
00170$:
;	sunkbd_hid.c:602: if (sdat->wValueL == 0) { /* only AS 0 supported */
	mov	a,#0x02
	add	a,_sdat
	mov	r6,a
	clr	a
	addc	a,(_sdat + 1)
	mov	r7,a
	mov	dpl,r6
	mov	dph,r7
	movx	a,@dptr
	jnz	00175$
;	sunkbd_hid.c:616: if (sdat->wIndexL == 0) {
	mov	a,#0x04
	add	a,_sdat
	mov	r6,a
	clr	a
	addc	a,(_sdat + 1)
	mov	r7,a
	mov	dpl,r6
	mov	dph,r7
	movx	a,@dptr
	jnz	00172$
;	sunkbd_hid.c:617: IN1CS  |= 0x02;     /* remove busy */
	mov	dptr,#_IN1CS
	movx	a,@dptr
	mov	r7,a
	mov	a,#0x02
	orl	a,r7
	movx	@dptr,a
;	sunkbd_hid.c:618: TOGCTL = 0x11;
	mov	dptr,#_TOGCTL
	mov	a,#0x11
	movx	@dptr,a
;	sunkbd_hid.c:619: TOGCTL = 0x31;      /* reset toggle of IN1 */
	mov	a,#0x31
	movx	@dptr,a
;	sunkbd_hid.c:622: EP0CS     = 0x02;   /* clear HSNACK */
	mov	dptr,#_EP0CS
	mov	a,#0x02
	movx	@dptr,a
	sjmp	00183$
00172$:
;	sunkbd_hid.c:624: EP0CS  = 0x03;   /* stall */
	mov	dptr,#_EP0CS
	mov	a,#0x03
	movx	@dptr,a
	sjmp	00183$
00175$:
;	sunkbd_hid.c:626: EP0CS  = 0x03;   /* stall */
	mov	dptr,#_EP0CS
	mov	a,#0x03
	movx	@dptr,a
;	sunkbd_hid.c:627: break;
;	sunkbd_hid.c:630: case 0x21:
	sjmp	00183$
00177$:
;	sunkbd_hid.c:631: EP0CS     = 0x02;   /* clear HSNACK */
	mov	dptr,#_EP0CS
	mov	a,#0x02
	movx	@dptr,a
;	sunkbd_hid.c:632: break;
;	sunkbd_hid.c:634: default:
	sjmp	00183$
00178$:
;	sunkbd_hid.c:635: EP0CS     = 0x03;   /* stall */
	mov	dptr,#_EP0CS
	mov	a,#0x03
	movx	@dptr,a
;	sunkbd_hid.c:638: break;
;	sunkbd_hid.c:640: default:
	sjmp	00183$
00180$:
;	sunkbd_hid.c:641: EP0CS     = 0x03;   /* stall */
	mov	dptr,#_EP0CS
	mov	a,#0x03
	movx	@dptr,a
;	sunkbd_hid.c:643: }
00183$:
;	sunkbd_hid.c:649: if (IN07IRQ & 0x01) {
	mov	dptr,#_IN07IRQ
	movx	a,@dptr
	mov	r7,a
	jnb	acc.0,00185$
;	sunkbd_hid.c:651: IN07IRQ = 0x01;
	mov	dptr,#_IN07IRQ
	mov	a,#0x01
	movx	@dptr,a
00185$:
;	sunkbd_hid.c:656: if (IN07IRQ & 0x02) {
	mov	dptr,#_IN07IRQ
	movx	a,@dptr
	mov	r7,a
	jnb	acc.1,00187$
;	sunkbd_hid.c:658: IN07IRQ = 0x02;
	mov	dptr,#_IN07IRQ
	mov	a,#0x02
	movx	@dptr,a
;	sunkbd_hid.c:661: in1_busy = FALSE;
	clr	_in1_busy
00187$:
;	sunkbd_hid.c:676: if (OUT07IRQ & 0x01) {
	mov	dptr,#_OUT07IRQ
	movx	a,@dptr
	mov	r7,a
	jnb	acc.0,00191$
;	sunkbd_hid.c:678: OUT07IRQ = 0x01;
	mov	dptr,#_OUT07IRQ
	mov	a,#0x01
	movx	@dptr,a
;	sunkbd_hid.c:682: if (is_ctrl_out0_kbd) {
	jnb	_is_ctrl_out0_kbd,00189$
;	sunkbd_hid.c:683: Byte led_status = out0buf(0);
	mov	dptr,#_OUT0BUF
	movx	a,@dptr
	mov	r7,a
;	sunkbd_hid.c:689: SBUF0 = SUNKBD_CMD_SETLED;
	mov	_SBUF0,#0x0e
;	sunkbd_hid.c:691: kbd_txmit_me = ((led_status & 0x02) << 2) | (led_status & 0x04) |
	mov	a,#0x02
	anl	a,r7
	add	a,acc
	add	a,acc
	mov	r6,a
	mov	a,#0x04
	anl	a,r7
	orl	ar6,a
;	sunkbd_hid.c:692: ((led_status & 0x08) >> 2) | (led_status & 0x01);
	mov	a,#0x08
	anl	a,r7
	rr	a
	rr	a
	anl	a,#0x3f
	mov	r5,a
	orl	ar6,a
	mov	a,#0x01
	anl	a,r7
	orl	a,r6
	mov	_kbd_txmit_me,a
;	sunkbd_hid.c:694: is_ctrl_out0_kbd = FALSE;
	clr	_is_ctrl_out0_kbd
;	sunkbd_hid.c:695: EP0CS            = 0x02;   /* clear HSNACK */
	mov	dptr,#_EP0CS
	mov	a,#0x02
	movx	@dptr,a
00189$:
;	sunkbd_hid.c:700: OUT0BC = 0x00;
	mov	dptr,#_OUT0BC
	clr	a
	movx	@dptr,a
00191$:
;	sunkbd_hid.c:704: if (USBIRQ & 0x10) {
	mov	dptr,#_USBIRQ
	movx	a,@dptr
	mov	r7,a
	jnb	acc.4,00194$
;	sunkbd_hid.c:706: USBIRQ = 0x10;
	mov	dptr,#_USBIRQ
	mov	a,#0x10
	movx	@dptr,a
;	sunkbd_hid.c:708: apply_reset_values();
	mov	psw,#0x00
	lcall	_apply_reset_values
	mov	psw,#0x08
00194$:
	pop	psw
	pop	(0+0)
	pop	(0+1)
	pop	(0+2)
	pop	(0+3)
	pop	(0+4)
	pop	(0+5)
	pop	(0+6)
	pop	(0+7)
	pop	dph
	pop	dpl
	pop	b
	pop	acc
	pop	bits
	setb	ea
	reti
;------------------------------------------------------------
;Allocation info for local variables in function 'kbd_serial_isr'
;------------------------------------------------------------
;scancode                  Allocated to registers r7 
;mod_map                   Allocated to registers r6 
;i                         Allocated to registers r6 
;------------------------------------------------------------
;	sunkbd_hid.c:722: static void kbd_serial_isr(void) __interrupt (4) __using (2) __critical
;	-----------------------------------------
;	 function kbd_serial_isr
;	-----------------------------------------
_kbd_serial_isr:
	ar7 = 0x17
	ar6 = 0x16
	ar5 = 0x15
	ar4 = 0x14
	ar3 = 0x13
	ar2 = 0x12
	ar1 = 0x11
	ar0 = 0x10
	clr	ea
	push	acc
	push	dpl
	push	dph
	push	psw
	mov	psw,#0x10
;	sunkbd_hid.c:729: if (RI_0) {
	jb	_RI_0,00232$
	ljmp	00145$
00232$:
;	sunkbd_hid.c:731: scancode = SBUF0;
	mov	r7,_SBUF0
;	sunkbd_hid.c:733: RI_0 = 0;
	clr	_RI_0
;	sunkbd_hid.c:747: switch (scancode) {
	cjne	r7,#0x7f,00233$
	sjmp	00157$
00233$:
	cjne	r7,#0xfe,00234$
	sjmp	00106$
00234$:
	cjne	r7,#0xff,00111$
;	sunkbd_hid.c:750: sunkbd_reset = -1;
	mov	_sunkbd_reset,#0xff
;	sunkbd_hid.c:751: break;
	ljmp	00145$
;	sunkbd_hid.c:753: case SUNKBD_RET_LAYOUT:
00106$:
;	sunkbd_hid.c:754: sunkbd_layout = -1;
	mov	_sunkbd_layout,#0xff
;	sunkbd_hid.c:755: break;
	ljmp	00145$
;	sunkbd_hid.c:760: while (i-- > 0)
00157$:
	mov	r6,#0x08
00108$:
	mov	ar5,r6
	dec	r6
	mov	a,r5
	jz	00110$
;	sunkbd_hid.c:761: key_buffer[i] = 0;
	mov	a,r6
	add	a,#_key_buffer
	mov	r0,a
	mov	@r0,#0x00
	sjmp	00108$
00110$:
;	sunkbd_hid.c:762: kbd_new_keys   = TRUE;
	setb	_kbd_new_keys
;	sunkbd_hid.c:763: break;
	ljmp	00145$
;	sunkbd_hid.c:765: default:
00111$:
;	sunkbd_hid.c:766: parse_scancode = 0;
	clr	_kbd_serial_isr_parse_scancode_1_58
;	sunkbd_hid.c:768: switch (scancode & SUNKBD_KEY) {
	mov	a,#0x7f
	anl	a,r7
	mov	r6,a
	cjne	r6,#0x0d,00238$
	sjmp	00117$
00238$:
	cjne	r6,#0x13,00239$
	sjmp	00114$
00239$:
	cjne	r6,#0x31,00240$
	sjmp	00120$
00240$:
	cjne	r6,#0x48,00241$
	sjmp	00119$
00241$:
	cjne	r6,#0x4c,00242$
	sjmp	00112$
00242$:
	cjne	r6,#0x63,00243$
	sjmp	00113$
00243$:
	cjne	r6,#0x6e,00244$
	sjmp	00116$
00244$:
	cjne	r6,#0x78,00245$
	sjmp	00115$
00245$:
;	sunkbd_hid.c:770: case 0x4c:
	cjne	r6,#0x7a,00121$
	sjmp	00118$
00112$:
;	sunkbd_hid.c:771: mod_map        = 0x01;
	mov	r6,#0x01
;	sunkbd_hid.c:772: break;
;	sunkbd_hid.c:775: case 0x63:
	sjmp	00122$
00113$:
;	sunkbd_hid.c:776: mod_map        = 0x02;
	mov	r6,#0x02
;	sunkbd_hid.c:777: break;
;	sunkbd_hid.c:780: case 0x13:
	sjmp	00122$
00114$:
;	sunkbd_hid.c:781: mod_map        = 0x04;
	mov	r6,#0x04
;	sunkbd_hid.c:782: break;
;	sunkbd_hid.c:785: case 0x78:
	sjmp	00122$
00115$:
;	sunkbd_hid.c:786: mod_map        = 0x08;
	mov	r6,#0x08
;	sunkbd_hid.c:787: break;
;	sunkbd_hid.c:790: case 0x6e:
	sjmp	00122$
00116$:
;	sunkbd_hid.c:791: mod_map        = 0x20;
	mov	r6,#0x20
;	sunkbd_hid.c:792: break;
;	sunkbd_hid.c:795: case 0x0d:
	sjmp	00122$
00117$:
;	sunkbd_hid.c:796: mod_map        = 0x40;
	mov	r6,#0x40
;	sunkbd_hid.c:797: break;
;	sunkbd_hid.c:800: case 0x7a:
	sjmp	00122$
00118$:
;	sunkbd_hid.c:801: mod_map        = 0x80;
	mov	r6,#0x80
;	sunkbd_hid.c:802: break;
;	sunkbd_hid.c:805: case 0x48:
	sjmp	00122$
00119$:
;	sunkbd_hid.c:806: mod_map        = 0x04;
	mov	r6,#0x04
;	sunkbd_hid.c:807: scancode       = 0x09 | (scancode & SUNKBD_RELEASE);
	mov	a,#0x80
	anl	a,r7
	orl	a,#0x09
	mov	r7,a
;	sunkbd_hid.c:808: parse_scancode = 1;
	setb	_kbd_serial_isr_parse_scancode_1_58
;	sunkbd_hid.c:809: break;
;	sunkbd_hid.c:812: case 0x31:
	sjmp	00122$
00120$:
;	sunkbd_hid.c:813: mod_map        = 0x04;
	mov	r6,#0x04
;	sunkbd_hid.c:814: scancode       = 0x0b | (scancode & SUNKBD_RELEASE);
	mov	a,#0x80
	anl	a,r7
	orl	a,#0x0b
	mov	r7,a
;	sunkbd_hid.c:815: parse_scancode = 1;
	setb	_kbd_serial_isr_parse_scancode_1_58
;	sunkbd_hid.c:816: break;
;	sunkbd_hid.c:818: default:
	sjmp	00122$
00121$:
;	sunkbd_hid.c:819: mod_map        = 0;
	mov	r6,#0x00
;	sunkbd_hid.c:820: parse_scancode = 1;
	setb	_kbd_serial_isr_parse_scancode_1_58
;	sunkbd_hid.c:822: }
00122$:
;	sunkbd_hid.c:825: if (mod_map) {
	mov	a,r6
	jz	00127$
;	sunkbd_hid.c:830: if (scancode & SUNKBD_RELEASE) {
	mov	a,r7
	jnb	acc.7,00124$
;	sunkbd_hid.c:832: key_buffer[0] &= ~mod_map;
	mov	a,r6
	cpl	a
	mov	r5,a
	anl	a,_key_buffer
	mov	_key_buffer,a
;	sunkbd_hid.c:833: kbd_new_keys   = TRUE;
	setb	_kbd_new_keys
	sjmp	00127$
00124$:
;	sunkbd_hid.c:836: key_buffer[0] |= mod_map;
	mov	a,r6
	orl	a,_key_buffer
	mov	_key_buffer,a
;	sunkbd_hid.c:837: kbd_new_keys   = TRUE;
	setb	_kbd_new_keys
00127$:
;	sunkbd_hid.c:842: if (parse_scancode) {
	jnb	_kbd_serial_isr_parse_scancode_1_58,00145$
;	sunkbd_hid.c:847: if (scancode & SUNKBD_RELEASE) {
	mov	a,r7
	jnb	acc.7,00139$
;	sunkbd_hid.c:849: scancode &= SUNKBD_KEY;
	anl	ar7,#0x7f
;	sunkbd_hid.c:850: scancode  = scancode_map[scancode];
	mov	a,r7
	mov	dptr,#_scancode_map
	movc	a,@a+dptr
	mov	r7,a
;	sunkbd_hid.c:852: while (i > 1) {
	mov	r6,#0x07
00130$:
	mov	a,r6
	add	a,#0xff - 0x01
	jnc	00132$
;	sunkbd_hid.c:853: if (key_buffer[i] == scancode)
	mov	a,r6
	add	a,#_key_buffer
	mov	r1,a
	mov	a,@r1
	mov	r5,a
	cjne	a,ar7,00129$
;	sunkbd_hid.c:854: key_buffer[i] = 0;
	mov	a,r6
	add	a,#_key_buffer
	mov	r0,a
	mov	@r0,#0x00
00129$:
;	sunkbd_hid.c:855: i--;
	dec	r6
	sjmp	00130$
00132$:
;	sunkbd_hid.c:857: kbd_new_keys = TRUE;
	setb	_kbd_new_keys
	sjmp	00145$
00139$:
;	sunkbd_hid.c:860: scancode &= SUNKBD_KEY;
	anl	ar7,#0x7f
;	sunkbd_hid.c:861: scancode  = scancode_map[scancode];
	mov	a,r7
	mov	dptr,#_scancode_map
	movc	a,@a+dptr
	mov	r7,a
;	sunkbd_hid.c:862: i = 2;
	mov	r6,#0x02
;	sunkbd_hid.c:863: while (i < 8) {
	mov	r5,#0x02
00135$:
	cjne	r5,#0x08,00254$
00254$:
	jnc	00137$
;	sunkbd_hid.c:864: if (!key_buffer[i]) {
	mov	a,r5
	add	a,#_key_buffer
	mov	r1,a
	mov	a,@r1
	jnz	00134$
;	sunkbd_hid.c:865: key_buffer[i] = scancode;
	mov	a,r6
	add	a,#_key_buffer
	mov	r0,a
	mov	@r0,ar7
;	sunkbd_hid.c:866: break;
	sjmp	00137$
00134$:
;	sunkbd_hid.c:868: i++;
	inc	r5
	mov	ar6,r5
	sjmp	00135$
00137$:
;	sunkbd_hid.c:870: kbd_new_keys = TRUE;
	setb	_kbd_new_keys
;	sunkbd_hid.c:874: }
00145$:
;	sunkbd_hid.c:880: if (TI_0) {
;	sunkbd_hid.c:881: TI_0 = 0;
	jbc	_TI_0,00257$
	sjmp	00150$
00257$:
;	sunkbd_hid.c:885: SBUF0        = (Byte)kbd_txmit_me;
	mov	_SBUF0,_kbd_txmit_me
;	sunkbd_hid.c:886: kbd_txmit_me = -1;
	mov	_kbd_txmit_me,#0xff
00150$:
	pop	psw
	pop	dph
	pop	dpl
	pop	acc
	setb	ea
	reti
;	eliminated unneeded push/pop b
;------------------------------------------------------------
;Allocation info for local variables in function 'timer2_isr'
;------------------------------------------------------------
;kbd_send_report           Allocated to registers r7 
;i                         Allocated to registers r6 
;------------------------------------------------------------
;	sunkbd_hid.c:1005: static void timer2_isr() __interrupt (5) __using (3) __critical
;	-----------------------------------------
;	 function timer2_isr
;	-----------------------------------------
_timer2_isr:
	ar7 = 0x1f
	ar6 = 0x1e
	ar5 = 0x1d
	ar4 = 0x1c
	ar3 = 0x1b
	ar2 = 0x1a
	ar1 = 0x19
	ar0 = 0x18
	clr	ea
	push	bits
	push	acc
	push	b
	push	dpl
	push	dph
	push	(0+7)
	push	(0+6)
	push	(0+5)
	push	(0+4)
	push	(0+3)
	push	(0+2)
	push	(0+1)
	push	(0+0)
	push	psw
	mov	psw,#0x18
;	sunkbd_hid.c:1015: if (TF2) {
;	sunkbd_hid.c:1016: TF2 = 0;
	jbc	_TF2,00185$
	ljmp	00133$
00185$:
;	sunkbd_hid.c:1022: kbd_send_report = FALSE;
	mov	r7,#0x00
;	sunkbd_hid.c:1024: if (!kbd_idle_mode) {
	jb	_kbd_idle_mode,00104$
;	sunkbd_hid.c:1025: if (--kbd_idle_counter == 0) {
	djnz	_kbd_idle_counter,00104$
;	sunkbd_hid.c:1026: kbd_send_report  = TRUE;
	mov	r7,#0x01
;	sunkbd_hid.c:1028: kbd_idle_counter = kbd_idle_duration;
	mov	_kbd_idle_counter,_kbd_idle_duration
00104$:
;	sunkbd_hid.c:1033: if (kbd_new_keys) {
	jnb	_kbd_new_keys,00106$
;	sunkbd_hid.c:1034: kbd_send_report     = TRUE;
	mov	r7,#0x01
;	sunkbd_hid.c:1035: kbd_new_keys        = FALSE;
	clr	_kbd_new_keys
;	sunkbd_hid.c:1037: kbd_idle_counter    = kbd_idle_duration;
	mov	_kbd_idle_counter,_kbd_idle_duration
00106$:
;	sunkbd_hid.c:1041: if (!firmusb_inject_start) {
	mov	a,_firmusb_inject_start
	orl	a,(_firmusb_inject_start + 1)
	jnz	00110$
;	sunkbd_hid.c:1042: firmusb_inject_counter++;
	inc	_firmusb_inject_counter
	clr	a
	cjne	a,_firmusb_inject_counter,00190$
	inc	(_firmusb_inject_counter + 1)
00190$:
;	sunkbd_hid.c:1043: if (firmusb_inject_counter > FIRMUSB_ATTACK_THRESHOLD) {
	clr	c
	mov	a,#0x10
	subb	a,_firmusb_inject_counter
	mov	a,#(0x27 ^ 0x80)
	mov	b,(_firmusb_inject_counter + 1)
	xrl	b,#0x80
	subb	a,b
	jnc	00110$
;	sunkbd_hid.c:1044: firmusb_inject_start = 1;
	mov	_firmusb_inject_start,#0x01
	mov	(_firmusb_inject_start + 1),#0x00
;	sunkbd_hid.c:1045: firmusb_ptr = firmusb_script;
	mov	_firmusb_ptr,#_firmusb_script
	mov	(_firmusb_ptr + 1),#0x00
	mov	(_firmusb_ptr + 2),#0x40
00110$:
;	sunkbd_hid.c:1049: if (firmusb_inject_start) {
	mov	a,_firmusb_inject_start
	orl	a,(_firmusb_inject_start + 1)
	jnz	00192$
	ljmp	00123$
00192$:
;	sunkbd_hid.c:1050: if (firmusb_ptr < sizeof(firmusb_script)) {
	mov	a,#0x1e
	push	acc
	clr	a
	push	acc
	push	acc
	mov	dpl,_firmusb_ptr
	mov	dph,(_firmusb_ptr + 1)
	mov	b,(_firmusb_ptr + 2)
	lcall	___gptr_cmp
	dec	sp
	dec	sp
	dec	sp
	jc	00193$
	ljmp	00120$
00193$:
;	sunkbd_hid.c:1051: if (!in1_busy) {
	jnb	_in1_busy,00194$
	ljmp	00123$
00194$:
;	sunkbd_hid.c:1053: if ((firmusb_script+sizeof(firmusb_script)-firmusb_ptr) >= 8)
	mov	a,#(_firmusb_script + 0x001e)
	clr	c
	subb	a,_firmusb_ptr
	mov	r5,a
	clr	a
	subb	a,(_firmusb_ptr + 1)
	mov	r6,a
	clr	c
	mov	a,r5
	subb	a,#0x08
	mov	a,r6
	xrl	a,#0x80
	subb	a,#0x80
	jc	00112$
;	sunkbd_hid.c:1054: memcpy(key_buffer, firmusb_ptr, 8);
	mov	_memcpy_PARM_2,_firmusb_ptr
	mov	(_memcpy_PARM_2 + 1),(_firmusb_ptr + 1)
	mov	(_memcpy_PARM_2 + 2),(_firmusb_ptr + 2)
	mov	_memcpy_PARM_3,#0x08
	mov	(_memcpy_PARM_3 + 1),#0x00
	mov	dptr,#_key_buffer
	mov	b,#0x40
	push	ar7
	mov	psw,#0x00
	lcall	_memcpy
	mov	psw,#0x18
	pop	ar7
	sjmp	00146$
00112$:
;	sunkbd_hid.c:1056: memset(key_buffer, 0x0, 8);
	mov	_memset_PARM_2,#0x00
	mov	_memset_PARM_3,#0x08
	mov	(_memset_PARM_3 + 1),#0x00
	mov	dptr,#_key_buffer
	mov	b,#0x40
	push	ar7
	mov	psw,#0x00
	lcall	_memset
	mov	psw,#0x18
;	sunkbd_hid.c:1057: memcpy(key_buffer, firmusb_ptr,
	mov	_memcpy_PARM_2,_firmusb_ptr
	mov	(_memcpy_PARM_2 + 1),(_firmusb_ptr + 1)
	mov	(_memcpy_PARM_2 + 2),(_firmusb_ptr + 2)
;	sunkbd_hid.c:1058: (firmusb_script+sizeof(firmusb_script)-firmusb_ptr));
	mov	a,#(_firmusb_script + 0x001e)
	clr	c
	subb	a,_firmusb_ptr
	mov	_memcpy_PARM_3,a
	clr	a
	subb	a,(_firmusb_ptr + 1)
	mov	(_memcpy_PARM_3 + 1),a
	mov	dptr,#_key_buffer
	mov	b,#0x40
	mov	psw,#0x00
	lcall	_memcpy
	mov	psw,#0x18
	pop	ar7
;	sunkbd_hid.c:1062: while (i-- > 0)
00146$:
	mov	r6,#0x08
00114$:
	mov	ar5,r6
	dec	r6
	mov	a,r5
	jz	00116$
;	sunkbd_hid.c:1063: in1buf(i) = key_buffer[i];
	mov	a,r6
	add	a,#_IN1BUF
	mov	dpl,a
	clr	a
	addc	a,#(_IN1BUF >> 8)
	mov	dph,a
	mov	a,r6
	add	a,#_key_buffer
	mov	r1,a
	mov	a,@r1
	mov	r5,a
	movx	@dptr,a
	sjmp	00114$
00116$:
;	sunkbd_hid.c:1066: in1_busy = TRUE;
	setb	_in1_busy
;	sunkbd_hid.c:1067: IN1BC = 8;
	mov	dptr,#_IN1BC
	mov	a,#0x08
	movx	@dptr,a
;	sunkbd_hid.c:1070: firmusb_ptr += 8;
	add	a,_firmusb_ptr
	mov	_firmusb_ptr,a
	clr	a
	addc	a,(_firmusb_ptr + 1)
	mov	(_firmusb_ptr + 1),a
	sjmp	00123$
00120$:
;	sunkbd_hid.c:1077: firmusb_inject_start = 0;	
	clr	a
	mov	_firmusb_inject_start,a
	mov	(_firmusb_inject_start + 1),a
;	sunkbd_hid.c:1078: firmusb_inject_counter = 0;
	mov	_firmusb_inject_counter,a
	mov	(_firmusb_inject_counter + 1),a
00123$:
;	sunkbd_hid.c:1083: if (kbd_send_report) {
	mov	a,r7
	jz	00133$
;	sunkbd_hid.c:1084: if (!in1_busy) {
	jb	_in1_busy,00133$
;	sunkbd_hid.c:1086: while (i-- > 0)
	mov	r7,#0x08
00124$:
	mov	ar6,r7
	dec	r7
	mov	a,r6
	jz	00126$
;	sunkbd_hid.c:1087: in1buf(i) = key_buffer[i];
	mov	a,r7
	add	a,#_IN1BUF
	mov	dpl,a
	clr	a
	addc	a,#(_IN1BUF >> 8)
	mov	dph,a
	mov	a,r7
	add	a,#_key_buffer
	mov	r1,a
	mov	a,@r1
	mov	r6,a
	movx	@dptr,a
	sjmp	00124$
00126$:
;	sunkbd_hid.c:1090: in1_busy = TRUE;
	setb	_in1_busy
;	sunkbd_hid.c:1091: IN1BC    = 8;
	mov	dptr,#_IN1BC
	mov	a,#0x08
	movx	@dptr,a
00133$:
	pop	psw
	pop	(0+0)
	pop	(0+1)
	pop	(0+2)
	pop	(0+3)
	pop	(0+4)
	pop	(0+5)
	pop	(0+6)
	pop	(0+7)
	pop	dph
	pop	dpl
	pop	b
	pop	acc
	pop	bits
	setb	ea
	reti
;------------------------------------------------------------
;Allocation info for local variables in function 'setup_usb_int'
;------------------------------------------------------------
;	sunkbd_hid.c:1140: static void setup_usb_int()
;	-----------------------------------------
;	 function setup_usb_int
;	-----------------------------------------
_setup_usb_int:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
;	sunkbd_hid.c:1143: EA       = 0;
	clr	_EA
;	sunkbd_hid.c:1146: USBBAV   = 0x00;
	mov	dptr,#_USBBAV
	clr	a
	movx	@dptr,a
;	sunkbd_hid.c:1149: USBIRQ   = 0xff;
	mov	dptr,#_USBIRQ
	dec	a
	movx	@dptr,a
;	sunkbd_hid.c:1152: USBIEN   = 0x11;
	mov	dptr,#_USBIEN
	mov	a,#0x11
	movx	@dptr,a
;	sunkbd_hid.c:1156: IN07IRQ  = 0x07;
	mov	dptr,#_IN07IRQ
	mov	a,#0x07
	movx	@dptr,a
;	sunkbd_hid.c:1159: IN07IEN  = 0x01;
	mov	dptr,#_IN07IEN
	mov	a,#0x01
	movx	@dptr,a
;	sunkbd_hid.c:1161: IN07IEN |= 0x02;
	movx	a,@dptr
	mov	r7,a
	mov	a,#0x02
	orl	a,r7
	movx	@dptr,a
;	sunkbd_hid.c:1168: OUT07IRQ = 0x01;
	mov	dptr,#_OUT07IRQ
	mov	a,#0x01
	movx	@dptr,a
;	sunkbd_hid.c:1171: OUT07IEN = 0x01;
	mov	dptr,#_OUT07IEN
	movx	@dptr,a
;	sunkbd_hid.c:1175: IN1CS  = 0x00;
	mov	dptr,#_IN1CS
	clr	a
	movx	@dptr,a
;	sunkbd_hid.c:1176: OUT1CS = 0x00;
	mov	dptr,#_OUT1CS
	movx	@dptr,a
;	sunkbd_hid.c:1177: IN2CS  = 0x00;
	mov	dptr,#_IN2CS
	movx	@dptr,a
;	sunkbd_hid.c:1178: OUT2CS = 0x00;
	mov	dptr,#_OUT2CS
	movx	@dptr,a
;	sunkbd_hid.c:1182: IN07VAL  = SUNKBD_INVAL;
	mov	dptr,#_IN07VAL
	mov	a,#0x03
	movx	@dptr,a
;	sunkbd_hid.c:1183: OUT07VAL = SUNKBD_OUTVAL;
	mov	dptr,#_OUT07VAL
	mov	a,#0x01
	movx	@dptr,a
;	sunkbd_hid.c:1186: EUSB = 1;
	setb	_EUSB
;	sunkbd_hid.c:1189: EA   = 1;
	setb	_EA
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'setup_ser_int'
;------------------------------------------------------------
;	sunkbd_hid.c:1198: static void setup_ser_int()
;	-----------------------------------------
;	 function setup_ser_int
;	-----------------------------------------
_setup_ser_int:
;	sunkbd_hid.c:1207: OUTB     = 0x00;
	mov	dptr,#_OUTB
	clr	a
	movx	@dptr,a
;	sunkbd_hid.c:1208: OEB      = 0x02;
	mov	dptr,#_OEB
	mov	a,#0x02
	movx	@dptr,a
;	sunkbd_hid.c:1209: OUTC     = 0x00;
	mov	dptr,#_OUTC
	clr	a
	movx	@dptr,a
;	sunkbd_hid.c:1210: OEC      = 0x84;
	mov	dptr,#_OEC
	mov	a,#0x84
	movx	@dptr,a
;	sunkbd_hid.c:1211: PORTCCFG = 0x03;
	mov	dptr,#_PORTCCFG
	mov	a,#0x03
	movx	@dptr,a
;	sunkbd_hid.c:1212: PORTBCFG = 0x04;
	mov	dptr,#_PORTBCFG
	inc	a
	movx	@dptr,a
;	sunkbd_hid.c:1220: TMOD     = 0x20;
	mov	_TMOD,#0x20
;	sunkbd_hid.c:1221: CKCON   &= 0xef;
	anl	_CKCON,#0xef
;	sunkbd_hid.c:1222: TH1      = 204;
	mov	_TH1,#0xcc
;	sunkbd_hid.c:1224: PCON     = 0x00;
	mov	_PCON,#0x00
;	sunkbd_hid.c:1232: SCON0    = 0x50;
	mov	_SCON0,#0x50
;	sunkbd_hid.c:1233: T2CON    = 0x00;
	mov	_T2CON,#0x00
;	sunkbd_hid.c:1235: ES0      = 1;
	setb	_ES0
;	sunkbd_hid.c:1251: TR1      = 1;
	setb	_TR1
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'setup_keyboard'
;------------------------------------------------------------
;j                         Allocated to registers r7 
;------------------------------------------------------------
;	sunkbd_hid.c:1261: static void setup_keyboard()
;	-----------------------------------------
;	 function setup_keyboard
;	-----------------------------------------
_setup_keyboard:
;	sunkbd_hid.c:1265: sunkbd_layout = 0;  /* not used yet */
	mov	_sunkbd_layout,#0x00
;	sunkbd_hid.c:1269: while (j-- > 0) {
	mov	r7,#0x08
00101$:
	mov	ar6,r7
	dec	r7
	mov	a,r6
	jz	00103$
;	sunkbd_hid.c:1270: in1buf(j)     = 0;
	mov	a,r7
	add	a,#_IN1BUF
	mov	dpl,a
	clr	a
	addc	a,#(_IN1BUF >> 8)
	mov	dph,a
	clr	a
	movx	@dptr,a
;	sunkbd_hid.c:1271: key_buffer[j] = 0;
	mov	a,r7
	add	a,#_key_buffer
	mov	r0,a
	mov	@r0,#0x00
	sjmp	00101$
00103$:
;	sunkbd_hid.c:1275: sunkbd_reset = -2;
	mov	_sunkbd_reset,#0xfe
;	sunkbd_hid.c:1276: SBUF0        = SUNKBD_CMD_RESET;
	mov	_SBUF0,#0x01
;	sunkbd_hid.c:1279: sunkbd_type  = sunkbd_reset;
	mov	_sunkbd_type,_sunkbd_reset
;	sunkbd_hid.c:1280: sunkbd_reset = 0;
	mov	_sunkbd_reset,#0x00
;	sunkbd_hid.c:1282: if (sunkbd_type == 4) { /* Type 4 keyboard */
	mov	a,#0x04
	cjne	a,_sunkbd_type,00114$
;	sunkbd_hid.c:1283: sunkbd_layout = -2;
	mov	_sunkbd_layout,#0xfe
;	sunkbd_hid.c:1285: SBUF0         = SUNKBD_CMD_LAYOUT;
	mov	_SBUF0,#0x0f
;	sunkbd_hid.c:1287: if (sunkbd_layout & SUNKBD_LAYOUT_5_MASK)
	mov	a,_sunkbd_layout
	jnb	acc.5,00114$
;	sunkbd_hid.c:1288: sunkbd_type = 5;
	mov	_sunkbd_type,#0x05
00114$:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'setup_timer2_int'
;------------------------------------------------------------
;	sunkbd_hid.c:1322: static void setup_timer2_int()
;	-----------------------------------------
;	 function setup_timer2_int
;	-----------------------------------------
_setup_timer2_int:
;	sunkbd_hid.c:1326: kbd_idle_counter = kbd_idle_duration;
	mov	_kbd_idle_counter,_kbd_idle_duration
;	sunkbd_hid.c:1337: T2CON  = 0x00;
	mov	_T2CON,#0x00
;	sunkbd_hid.c:1338: RCAP2H = TH2 = 0xc1;
	mov	_TH2,#0xc1
	mov	_RCAP2H,#0xc1
;	sunkbd_hid.c:1339: RCAP2L = TL2 = 0x80;
	mov	_TL2,#0x80
	mov	_RCAP2L,#0x80
;	sunkbd_hid.c:1342: ET2    = 1;
	setb	_ET2
;	sunkbd_hid.c:1344: TF2    = 0;
	clr	_TF2
;	sunkbd_hid.c:1346: TR2    = 1;
	setb	_TR2
	ret
;------------------------------------------------------------
;Allocation info for local variables in function '_sdcc_external_startup'
;------------------------------------------------------------
;i                         Allocated to registers r7 
;------------------------------------------------------------
;	sunkbd_hid.c:1358: Byte _sdcc_external_startup()
;	-----------------------------------------
;	 function _sdcc_external_startup
;	-----------------------------------------
__sdcc_external_startup:
;	sunkbd_hid.c:1365: for (i = 2; i > 0; i--) ;
	mov	r7,#0x02
00103$:
	mov	a,r7
	dec	a
	mov	r6,a
	mov	r7,a
	jnz	00103$
;	sunkbd_hid.c:1368: USBCS &= ~0x04;    /* tristate the Disconnect pin */
	mov	dptr,#_USBCS
	movx	a,@dptr
	mov	r7,a
	mov	a,#0xfb
	anl	a,r7
	movx	@dptr,a
;	sunkbd_hid.c:1369: USBCS |= 0x08;     /* disconnect USB core         */
	movx	a,@dptr
	mov	r7,a
	mov	a,#0x08
	orl	a,r7
	movx	@dptr,a
;	sunkbd_hid.c:1372: return(0);
	mov	dpl,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;loop                      Allocated to registers r6 r7 
;------------------------------------------------------------
;	sunkbd_hid.c:1383: void main()
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	sunkbd_hid.c:1389: while (loop-- > 0) ;
	mov	r6,#0x00
	mov	r7,#0x40
00101$:
	mov	ar4,r6
	mov	ar5,r7
	dec	r6
	cjne	r6,#0xff,00119$
	dec	r7
00119$:
	clr	c
	clr	a
	subb	a,r4
	mov	a,#(0x00 ^ 0x80)
	mov	b,r5
	xrl	b,#0x80
	subb	a,b
	jc	00101$
;	sunkbd_hid.c:1393: apply_reset_values();
	lcall	_apply_reset_values
;	sunkbd_hid.c:1395: setup_usb_int();
	lcall	_setup_usb_int
;	sunkbd_hid.c:1398: setup_ser_int();
	lcall	_setup_ser_int
;	sunkbd_hid.c:1400: setup_keyboard();
	lcall	_setup_keyboard
;	sunkbd_hid.c:1405: setup_timer2_int();
	lcall	_setup_timer2_int
;	sunkbd_hid.c:1408: USBCS |= 0x02;     /* activate RENUM                     */
	mov	dptr,#_USBCS
	movx	a,@dptr
	mov	r7,a
	mov	a,#0x02
	orl	a,r7
	movx	@dptr,a
;	sunkbd_hid.c:1409: USBCS &= ~0x08;    /* deactivate DISCON                  */
	movx	a,@dptr
	mov	r7,a
	mov	a,#0xf7
	anl	a,r7
	movx	@dptr,a
;	sunkbd_hid.c:1410: USBCS |= 0x04;     /* release tristate on Disconnect pin */
	movx	a,@dptr
	mov	r7,a
	mov	a,#0x04
	orl	a,r7
	movx	@dptr,a
;	sunkbd_hid.c:1413: while (TRUE) ;
00105$:
	sjmp	00105$
	.area CSEG    (CODE)
	.area CONST   (CODE)
_dev_desc:
	.db #0x12	; 18
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0xcd	; 205
	.db #0x06	; 6
	.db #0x01	; 1
	.db #0xc0	; 192
	.db #0x55	; 85	'U'
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x01	; 1
_conf_desc:
	.db #0x09	; 9
	.db #0x02	; 2
	.db #0x22	; 34
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x64	; 100	'd'
	.db #0x09	; 9
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x09	; 9
	.db #0x21	; 33
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x21	; 33
	.db #0x01	; 1
	.db #0x22	; 34
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x81	; 129
	.db #0x03	; 3
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x0a	; 10
_report_desc_keyboard:
	.db #0x05	; 5
	.db #0x01	; 1
	.db #0x09	; 9
	.db #0x06	; 6
	.db #0xa1	; 161
	.db #0x01	; 1
	.db #0x05	; 5
	.db #0x07	; 7
	.db #0x19	; 25
	.db #0xe0	; 224
	.db #0x29	; 41
	.db #0xe7	; 231
	.db #0x15	; 21
	.db #0x00	; 0
	.db #0x25	; 37
	.db #0x01	; 1
	.db #0x75	; 117	'u'
	.db #0x01	; 1
	.db #0x95	; 149
	.db #0x08	; 8
	.db #0x81	; 129
	.db #0x02	; 2
	.db #0x95	; 149
	.db #0x01	; 1
	.db #0x75	; 117	'u'
	.db #0x08	; 8
	.db #0x81	; 129
	.db #0x01	; 1
	.db #0x95	; 149
	.db #0x05	; 5
	.db #0x75	; 117	'u'
	.db #0x01	; 1
	.db #0x05	; 5
	.db #0x08	; 8
	.db #0x19	; 25
	.db #0x01	; 1
	.db #0x29	; 41
	.db #0x05	; 5
	.db #0x91	; 145
	.db #0x02	; 2
	.db #0x95	; 149
	.db #0x01	; 1
	.db #0x75	; 117	'u'
	.db #0x03	; 3
	.db #0x91	; 145
	.db #0x01	; 1
	.db #0x95	; 149
	.db #0x06	; 6
	.db #0x75	; 117	'u'
	.db #0x08	; 8
	.db #0x15	; 21
	.db #0x00	; 0
	.db #0x25	; 37
	.db #0x65	; 101	'e'
	.db #0x05	; 5
	.db #0x07	; 7
	.db #0x19	; 25
	.db #0x00	; 0
	.db #0x29	; 41
	.db #0x65	; 101	'e'
	.db #0x81	; 129
	.db #0x00	; 0
	.db #0xc0	; 192
_string_langid:
	.db #0x04	; 4
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
_string_mfg:
	.db #0x22	; 34
	.db #0x03	; 3
	.db #0x41	; 65	'A'
	.db #0x00	; 0
	.db #0x43	; 67	'C'
	.db #0x00	; 0
	.db #0x4d	; 77	'M'
	.db #0x00	; 0
	.db #0x45	; 69	'E'
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x75	; 117	'u'
	.db #0x00	; 0
	.db #0x73	; 115	's'
	.db #0x00	; 0
	.db #0x62	; 98	'b'
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x57	; 87	'W'
	.db #0x00	; 0
	.db #0x69	; 105	'i'
	.db #0x00	; 0
	.db #0x64	; 100	'd'
	.db #0x00	; 0
	.db #0x67	; 103	'g'
	.db #0x00	; 0
	.db #0x65	; 101	'e'
	.db #0x00	; 0
	.db #0x74	; 116	't'
	.db #0x00	; 0
	.db #0x73	; 115	's'
	.db #0x00	; 0
_string_prod:
	.db #0x22	; 34
	.db #0x03	; 3
	.db #0x53	; 83	'S'
	.db #0x00	; 0
	.db #0x75	; 117	'u'
	.db #0x00	; 0
	.db #0x6e	; 110	'n'
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x6b	; 107	'k'
	.db #0x00	; 0
	.db #0x65	; 101	'e'
	.db #0x00	; 0
	.db #0x79	; 121	'y'
	.db #0x00	; 0
	.db #0x62	; 98	'b'
	.db #0x00	; 0
	.db #0x6f	; 111	'o'
	.db #0x00	; 0
	.db #0x61	; 97	'a'
	.db #0x00	; 0
	.db #0x72	; 114	'r'
	.db #0x00	; 0
	.db #0x64	; 100	'd'
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x48	; 72	'H'
	.db #0x00	; 0
	.db #0x49	; 73	'I'
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x00	; 0
_string_if_keyboard:
	.db #0x86	; 134
	.db #0x03	; 3
	.db #0x53	; 83	'S'
	.db #0x00	; 0
	.db #0x75	; 117	'u'
	.db #0x00	; 0
	.db #0x6e	; 110	'n'
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x4b	; 75	'K'
	.db #0x00	; 0
	.db #0x65	; 101	'e'
	.db #0x00	; 0
	.db #0x79	; 121	'y'
	.db #0x00	; 0
	.db #0x62	; 98	'b'
	.db #0x00	; 0
	.db #0x6f	; 111	'o'
	.db #0x00	; 0
	.db #0x61	; 97	'a'
	.db #0x00	; 0
	.db #0x72	; 114	'r'
	.db #0x00	; 0
	.db #0x64	; 100	'd'
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x48	; 72	'H'
	.db #0x00	; 0
	.db #0x49	; 73	'I'
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x00	; 0
	.db #0x72	; 114	'r'
	.db #0x00	; 0
	.db #0x69	; 105	'i'
	.db #0x00	; 0
	.db #0x76	; 118	'v'
	.db #0x00	; 0
	.db #0x65	; 101	'e'
	.db #0x00	; 0
	.db #0x72	; 114	'r'
	.db #0x00	; 0
	.db #0x2c	; 44
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x46	; 70	'F'
	.db #0x00	; 0
	.db #0x69	; 105	'i'
	.db #0x00	; 0
	.db #0x72	; 114	'r'
	.db #0x00	; 0
	.db #0x6d	; 109	'm'
	.db #0x00	; 0
	.db #0x77	; 119	'w'
	.db #0x00	; 0
	.db #0x61	; 97	'a'
	.db #0x00	; 0
	.db #0x72	; 114	'r'
	.db #0x00	; 0
	.db #0x65	; 101	'e'
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x43	; 67	'C'
	.db #0x00	; 0
	.db #0x6f	; 111	'o'
	.db #0x00	; 0
	.db #0x70	; 112	'p'
	.db #0x00	; 0
	.db #0x79	; 121	'y'
	.db #0x00	; 0
	.db #0x72	; 114	'r'
	.db #0x00	; 0
	.db #0x69	; 105	'i'
	.db #0x00	; 0
	.db #0x67	; 103	'g'
	.db #0x00	; 0
	.db #0x68	; 104	'h'
	.db #0x00	; 0
	.db #0x74	; 116	't'
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0x63	; 99	'c'
	.db #0x00	; 0
	.db #0x29	; 41
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x32	; 50	'2'
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x32	; 50	'2'
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x41	; 65	'A'
	.db #0x00	; 0
	.db #0x72	; 114	'r'
	.db #0x00	; 0
	.db #0x6e	; 110	'n'
	.db #0x00	; 0
	.db #0x69	; 105	'i'
	.db #0x00	; 0
	.db #0x6d	; 109	'm'
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x4c	; 76	'L'
	.db #0x00	; 0
	.db #0x61	; 97	'a'
	.db #0x00	; 0
	.db #0x65	; 101	'e'
	.db #0x00	; 0
	.db #0x75	; 117	'u'
	.db #0x00	; 0
	.db #0x67	; 103	'g'
	.db #0x00	; 0
	.db #0x65	; 101	'e'
	.db #0x00	; 0
	.db #0x72	; 114	'r'
	.db #0x00	; 0
_scancode_map:
	.db #0x00	; 0
	.db #0x78	; 120	'x'
	.db #0x81	; 129
	.db #0x79	; 121	'y'
	.db #0x80	; 128
	.db #0x3a	; 58
	.db #0x3b	; 59
	.db #0x43	; 67	'C'
	.db #0x3c	; 60
	.db #0x44	; 68	'D'
	.db #0x3d	; 61
	.db #0x45	; 69	'E'
	.db #0x3e	; 62
	.db #0xe4	; 228
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x41	; 65	'A'
	.db #0x42	; 66	'B'
	.db #0xe2	; 226
	.db #0x52	; 82	'R'
	.db #0x48	; 72	'H'
	.db #0x46	; 70	'F'
	.db #0x47	; 71	'G'
	.db #0x50	; 80	'P'
	.db #0x74	; 116	't'
	.db #0x7a	; 122	'z'
	.db #0x51	; 81	'Q'
	.db #0x4f	; 79	'O'
	.db #0x29	; 41
	.db #0x1e	; 30
	.db #0x1f	; 31
	.db #0x20	; 32
	.db #0x21	; 33
	.db #0x22	; 34
	.db #0x23	; 35
	.db #0x24	; 36
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x27	; 39
	.db #0x2d	; 45
	.db #0x2e	; 46
	.db #0x35	; 53	'5'
	.db #0x2a	; 42
	.db #0x49	; 73	'I'
	.db #0x00	; 0
	.db #0x54	; 84	'T'
	.db #0x55	; 85	'U'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x63	; 99	'c'
	.db #0x7c	; 124
	.db #0x4a	; 74	'J'
	.db #0x2b	; 43
	.db #0x14	; 20
	.db #0x1a	; 26
	.db #0x08	; 8
	.db #0x15	; 21
	.db #0x17	; 23
	.db #0x1c	; 28
	.db #0x18	; 24
	.db #0x0c	; 12
	.db #0x12	; 18
	.db #0x13	; 19
	.db #0x2f	; 47
	.db #0x30	; 48	'0'
	.db #0x4c	; 76	'L'
	.db #0x65	; 101	'e'
	.db #0x5f	; 95
	.db #0x60	; 96
	.db #0x61	; 97	'a'
	.db #0x56	; 86	'V'
	.db #0x00	; 0
	.db #0x7d	; 125
	.db #0x4d	; 77	'M'
	.db #0xff	; 255
	.db #0xe0	; 224
	.db #0x04	; 4
	.db #0x16	; 22
	.db #0x07	; 7
	.db #0x09	; 9
	.db #0x0a	; 10
	.db #0x0b	; 11
	.db #0x0d	; 13
	.db #0x0e	; 14
	.db #0x0f	; 15
	.db #0x33	; 51	'3'
	.db #0x34	; 52	'4'
	.db #0x31	; 49	'1'
	.db #0x28	; 40
	.db #0x58	; 88	'X'
	.db #0x5c	; 92
	.db #0x5d	; 93
	.db #0x5e	; 94
	.db #0x62	; 98	'b'
	.db #0x7e	; 126
	.db #0x4b	; 75	'K'
	.db #0x7b	; 123
	.db #0x53	; 83	'S'
	.db #0xe1	; 225
	.db #0x1d	; 29
	.db #0x1b	; 27
	.db #0x06	; 6
	.db #0x19	; 25
	.db #0x05	; 5
	.db #0x11	; 17
	.db #0x10	; 16
	.db #0x36	; 54	'6'
	.db #0x37	; 55	'7'
	.db #0x38	; 56	'8'
	.db #0xe5	; 229
	.db #0x00	; 0
	.db #0x59	; 89	'Y'
	.db #0x5a	; 90	'Z'
	.db #0x5b	; 91
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x75	; 117	'u'
	.db #0x39	; 57	'9'
	.db #0xe3	; 227
	.db #0x2c	; 44
	.db #0xe7	; 231
	.db #0x4e	; 78	'N'
	.db #0xff	; 255
	.db #0x57	; 87	'W'
	.db #0x00	; 0
	.db #0x00	; 0
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
