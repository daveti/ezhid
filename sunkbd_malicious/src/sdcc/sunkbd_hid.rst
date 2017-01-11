                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.6.0 #9615 (Linux)
                                      4 ;--------------------------------------------------------
                                      5 	.module sunkbd_hid
                                      6 	.optsdcc -mmcs51 --model-small
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _main
                                     12 	.globl __sdcc_external_startup
                                     13 	.globl _memset
                                     14 	.globl _memcpy
                                     15 	.globl _SMOD1
                                     16 	.globl _ET2
                                     17 	.globl _TF2
                                     18 	.globl _TR2
                                     19 	.globl _TI_1
                                     20 	.globl _RI_1
                                     21 	.globl _TI_0
                                     22 	.globl _RI_0
                                     23 	.globl _ES1
                                     24 	.globl _ES0
                                     25 	.globl _EUSB
                                     26 	.globl _CY
                                     27 	.globl _AC
                                     28 	.globl _F0
                                     29 	.globl _RS1
                                     30 	.globl _RS0
                                     31 	.globl _OV
                                     32 	.globl _F1
                                     33 	.globl _P
                                     34 	.globl _PS
                                     35 	.globl _PT1
                                     36 	.globl _PX1
                                     37 	.globl _PT0
                                     38 	.globl _PX0
                                     39 	.globl _RD
                                     40 	.globl _WR
                                     41 	.globl _T1
                                     42 	.globl _T0
                                     43 	.globl _INT1
                                     44 	.globl _INT0
                                     45 	.globl _TXD
                                     46 	.globl _RXD
                                     47 	.globl _P3_7
                                     48 	.globl _P3_6
                                     49 	.globl _P3_5
                                     50 	.globl _P3_4
                                     51 	.globl _P3_3
                                     52 	.globl _P3_2
                                     53 	.globl _P3_1
                                     54 	.globl _P3_0
                                     55 	.globl _EA
                                     56 	.globl _ES
                                     57 	.globl _ET1
                                     58 	.globl _EX1
                                     59 	.globl _ET0
                                     60 	.globl _EX0
                                     61 	.globl _P2_7
                                     62 	.globl _P2_6
                                     63 	.globl _P2_5
                                     64 	.globl _P2_4
                                     65 	.globl _P2_3
                                     66 	.globl _P2_2
                                     67 	.globl _P2_1
                                     68 	.globl _P2_0
                                     69 	.globl _SM0
                                     70 	.globl _SM1
                                     71 	.globl _SM2
                                     72 	.globl _REN
                                     73 	.globl _TB8
                                     74 	.globl _RB8
                                     75 	.globl _TI
                                     76 	.globl _RI
                                     77 	.globl _P1_7
                                     78 	.globl _P1_6
                                     79 	.globl _P1_5
                                     80 	.globl _P1_4
                                     81 	.globl _P1_3
                                     82 	.globl _P1_2
                                     83 	.globl _P1_1
                                     84 	.globl _P1_0
                                     85 	.globl _TF1
                                     86 	.globl _TR1
                                     87 	.globl _TF0
                                     88 	.globl _TR0
                                     89 	.globl _IE1
                                     90 	.globl _IT1
                                     91 	.globl _IE0
                                     92 	.globl _IT0
                                     93 	.globl _P0_7
                                     94 	.globl _P0_6
                                     95 	.globl _P0_5
                                     96 	.globl _P0_4
                                     97 	.globl _P0_3
                                     98 	.globl _P0_2
                                     99 	.globl _P0_1
                                    100 	.globl _P0_0
                                    101 	.globl _DPH1
                                    102 	.globl _DPL1
                                    103 	.globl _DPH0
                                    104 	.globl _DPL0
                                    105 	.globl _EICON
                                    106 	.globl _TH2
                                    107 	.globl _TL2
                                    108 	.globl _RCAP2H
                                    109 	.globl _RCAP2L
                                    110 	.globl _T2CON
                                    111 	.globl _CKCON
                                    112 	.globl _SBUF1
                                    113 	.globl _SBUF0
                                    114 	.globl _SCON1
                                    115 	.globl _SCON0
                                    116 	.globl _EIE
                                    117 	.globl _MPAGE
                                    118 	.globl _EXIF
                                    119 	.globl _DPS
                                    120 	.globl _B
                                    121 	.globl _ACC
                                    122 	.globl _PSW
                                    123 	.globl _IP
                                    124 	.globl _P3
                                    125 	.globl _IE
                                    126 	.globl _P2
                                    127 	.globl _SBUF
                                    128 	.globl _SCON
                                    129 	.globl _P1
                                    130 	.globl _TH1
                                    131 	.globl _TH0
                                    132 	.globl _TL1
                                    133 	.globl _TL0
                                    134 	.globl _TMOD
                                    135 	.globl _TCON
                                    136 	.globl _PCON
                                    137 	.globl _DPH
                                    138 	.globl _DPL
                                    139 	.globl _SP
                                    140 	.globl _P0
                                    141 	.globl _AUTODATA
                                    142 	.globl _AUTOPTRL
                                    143 	.globl _AUTOPTRH
                                    144 	.globl _FASTXFR
                                    145 	.globl _OUT07VAL
                                    146 	.globl _IN07VAL
                                    147 	.globl _I2DAT
                                    148 	.globl _I2CS
                                    149 	.globl _SETUPDAT
                                    150 	.globl _SUDPTRL
                                    151 	.globl _SUDPTRH
                                    152 	.globl _TOGCTL
                                    153 	.globl _USBCS
                                    154 	.globl _USBBAV
                                    155 	.globl _USBPAIR
                                    156 	.globl _USBIEN
                                    157 	.globl _USBIRQ
                                    158 	.globl _OUT07IEN
                                    159 	.globl _IN07IEN
                                    160 	.globl _OUT07IRQ
                                    161 	.globl _IN07IRQ
                                    162 	.globl _ISOCTL
                                    163 	.globl _PORTCCFG
                                    164 	.globl _PORTBCFG
                                    165 	.globl _PORTACFG
                                    166 	.globl _PINSC
                                    167 	.globl _OUTC
                                    168 	.globl _OEC
                                    169 	.globl _PINSB
                                    170 	.globl _OUTB
                                    171 	.globl _OEB
                                    172 	.globl _PINSA
                                    173 	.globl _OUTA
                                    174 	.globl _OEA
                                    175 	.globl _OUT4BC
                                    176 	.globl _IN4BC
                                    177 	.globl _OUT4CS
                                    178 	.globl _IN4CS
                                    179 	.globl _OUT4BUF
                                    180 	.globl _IN4BUF
                                    181 	.globl _OUT3BC
                                    182 	.globl _OUT3CS
                                    183 	.globl _IN3BC
                                    184 	.globl _IN3CS
                                    185 	.globl _OUT3BUF
                                    186 	.globl _IN3BUF
                                    187 	.globl _OUT2BUF
                                    188 	.globl _OUT2CS
                                    189 	.globl _OUT2BC
                                    190 	.globl _IN2CS
                                    191 	.globl _IN2BC
                                    192 	.globl _IN2BUF
                                    193 	.globl _OUT1BC
                                    194 	.globl _OUT1CS
                                    195 	.globl _OUT1BUF
                                    196 	.globl _IN1BC
                                    197 	.globl _IN1BUF
                                    198 	.globl _IN1CS
                                    199 	.globl _OUT0BC
                                    200 	.globl _OUT0BUF
                                    201 	.globl _IN0BC
                                    202 	.globl _IN0BUF
                                    203 	.globl _EP0CS
                                    204 	.globl _kbd_txmit_me
                                    205 	.globl _key_buffer
                                    206 ;--------------------------------------------------------
                                    207 ; special function registers
                                    208 ;--------------------------------------------------------
                                    209 	.area RSEG    (ABS,DATA)
      000000                        210 	.org 0x0000
                           000080   211 _P0	=	0x0080
                           000081   212 _SP	=	0x0081
                           000082   213 _DPL	=	0x0082
                           000083   214 _DPH	=	0x0083
                           000087   215 _PCON	=	0x0087
                           000088   216 _TCON	=	0x0088
                           000089   217 _TMOD	=	0x0089
                           00008A   218 _TL0	=	0x008a
                           00008B   219 _TL1	=	0x008b
                           00008C   220 _TH0	=	0x008c
                           00008D   221 _TH1	=	0x008d
                           000090   222 _P1	=	0x0090
                           000098   223 _SCON	=	0x0098
                           000099   224 _SBUF	=	0x0099
                           0000A0   225 _P2	=	0x00a0
                           0000A8   226 _IE	=	0x00a8
                           0000B0   227 _P3	=	0x00b0
                           0000B8   228 _IP	=	0x00b8
                           0000D0   229 _PSW	=	0x00d0
                           0000E0   230 _ACC	=	0x00e0
                           0000F0   231 _B	=	0x00f0
                           000086   232 _DPS	=	0x0086
                           000091   233 _EXIF	=	0x0091
                           000092   234 _MPAGE	=	0x0092
                           0000E8   235 _EIE	=	0x00e8
                           000098   236 _SCON0	=	0x0098
                           0000C0   237 _SCON1	=	0x00c0
                           000099   238 _SBUF0	=	0x0099
                           0000C1   239 _SBUF1	=	0x00c1
                           00008E   240 _CKCON	=	0x008e
                           0000C8   241 _T2CON	=	0x00c8
                           0000CA   242 _RCAP2L	=	0x00ca
                           0000CB   243 _RCAP2H	=	0x00cb
                           0000CC   244 _TL2	=	0x00cc
                           0000CD   245 _TH2	=	0x00cd
                           0000D8   246 _EICON	=	0x00d8
                           000082   247 _DPL0	=	0x0082
                           000083   248 _DPH0	=	0x0083
                           000084   249 _DPL1	=	0x0084
                           000085   250 _DPH1	=	0x0085
                                    251 ;--------------------------------------------------------
                                    252 ; special function bits
                                    253 ;--------------------------------------------------------
                                    254 	.area RSEG    (ABS,DATA)
      000000                        255 	.org 0x0000
                           000080   256 _P0_0	=	0x0080
                           000081   257 _P0_1	=	0x0081
                           000082   258 _P0_2	=	0x0082
                           000083   259 _P0_3	=	0x0083
                           000084   260 _P0_4	=	0x0084
                           000085   261 _P0_5	=	0x0085
                           000086   262 _P0_6	=	0x0086
                           000087   263 _P0_7	=	0x0087
                           000088   264 _IT0	=	0x0088
                           000089   265 _IE0	=	0x0089
                           00008A   266 _IT1	=	0x008a
                           00008B   267 _IE1	=	0x008b
                           00008C   268 _TR0	=	0x008c
                           00008D   269 _TF0	=	0x008d
                           00008E   270 _TR1	=	0x008e
                           00008F   271 _TF1	=	0x008f
                           000090   272 _P1_0	=	0x0090
                           000091   273 _P1_1	=	0x0091
                           000092   274 _P1_2	=	0x0092
                           000093   275 _P1_3	=	0x0093
                           000094   276 _P1_4	=	0x0094
                           000095   277 _P1_5	=	0x0095
                           000096   278 _P1_6	=	0x0096
                           000097   279 _P1_7	=	0x0097
                           000098   280 _RI	=	0x0098
                           000099   281 _TI	=	0x0099
                           00009A   282 _RB8	=	0x009a
                           00009B   283 _TB8	=	0x009b
                           00009C   284 _REN	=	0x009c
                           00009D   285 _SM2	=	0x009d
                           00009E   286 _SM1	=	0x009e
                           00009F   287 _SM0	=	0x009f
                           0000A0   288 _P2_0	=	0x00a0
                           0000A1   289 _P2_1	=	0x00a1
                           0000A2   290 _P2_2	=	0x00a2
                           0000A3   291 _P2_3	=	0x00a3
                           0000A4   292 _P2_4	=	0x00a4
                           0000A5   293 _P2_5	=	0x00a5
                           0000A6   294 _P2_6	=	0x00a6
                           0000A7   295 _P2_7	=	0x00a7
                           0000A8   296 _EX0	=	0x00a8
                           0000A9   297 _ET0	=	0x00a9
                           0000AA   298 _EX1	=	0x00aa
                           0000AB   299 _ET1	=	0x00ab
                           0000AC   300 _ES	=	0x00ac
                           0000AF   301 _EA	=	0x00af
                           0000B0   302 _P3_0	=	0x00b0
                           0000B1   303 _P3_1	=	0x00b1
                           0000B2   304 _P3_2	=	0x00b2
                           0000B3   305 _P3_3	=	0x00b3
                           0000B4   306 _P3_4	=	0x00b4
                           0000B5   307 _P3_5	=	0x00b5
                           0000B6   308 _P3_6	=	0x00b6
                           0000B7   309 _P3_7	=	0x00b7
                           0000B0   310 _RXD	=	0x00b0
                           0000B1   311 _TXD	=	0x00b1
                           0000B2   312 _INT0	=	0x00b2
                           0000B3   313 _INT1	=	0x00b3
                           0000B4   314 _T0	=	0x00b4
                           0000B5   315 _T1	=	0x00b5
                           0000B6   316 _WR	=	0x00b6
                           0000B7   317 _RD	=	0x00b7
                           0000B8   318 _PX0	=	0x00b8
                           0000B9   319 _PT0	=	0x00b9
                           0000BA   320 _PX1	=	0x00ba
                           0000BB   321 _PT1	=	0x00bb
                           0000BC   322 _PS	=	0x00bc
                           0000D0   323 _P	=	0x00d0
                           0000D1   324 _F1	=	0x00d1
                           0000D2   325 _OV	=	0x00d2
                           0000D3   326 _RS0	=	0x00d3
                           0000D4   327 _RS1	=	0x00d4
                           0000D5   328 _F0	=	0x00d5
                           0000D6   329 _AC	=	0x00d6
                           0000D7   330 _CY	=	0x00d7
                           0000E8   331 _EUSB	=	0x00e8
                           0000AC   332 _ES0	=	0x00ac
                           0000AE   333 _ES1	=	0x00ae
                           000098   334 _RI_0	=	0x0098
                           000099   335 _TI_0	=	0x0099
                           0000C0   336 _RI_1	=	0x00c0
                           0000C1   337 _TI_1	=	0x00c1
                           0000CA   338 _TR2	=	0x00ca
                           0000CF   339 _TF2	=	0x00cf
                           0000AD   340 _ET2	=	0x00ad
                           0000DF   341 _SMOD1	=	0x00df
                                    342 ;--------------------------------------------------------
                                    343 ; overlayable register banks
                                    344 ;--------------------------------------------------------
                                    345 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        346 	.ds 8
                                    347 	.area REG_BANK_1	(REL,OVR,DATA)
      000008                        348 	.ds 8
                                    349 	.area REG_BANK_2	(REL,OVR,DATA)
      000010                        350 	.ds 8
                                    351 	.area REG_BANK_3	(REL,OVR,DATA)
      000018                        352 	.ds 8
                                    353 ;--------------------------------------------------------
                                    354 ; overlayable bit register bank
                                    355 ;--------------------------------------------------------
                                    356 	.area BIT_BANK	(REL,OVR,DATA)
      000021                        357 bits:
      000021                        358 	.ds 1
                           008000   359 	b0 = bits[0]
                           008100   360 	b1 = bits[1]
                           008200   361 	b2 = bits[2]
                           008300   362 	b3 = bits[3]
                           008400   363 	b4 = bits[4]
                           008500   364 	b5 = bits[5]
                           008600   365 	b6 = bits[6]
                           008700   366 	b7 = bits[7]
                                    367 ;--------------------------------------------------------
                                    368 ; internal ram data
                                    369 ;--------------------------------------------------------
                                    370 	.area DSEG    (DATA)
      000022                        371 _sunkbd_type:
      000022                        372 	.ds 1
      000023                        373 _sunkbd_reset:
      000023                        374 	.ds 1
      000024                        375 _sunkbd_layout:
      000024                        376 	.ds 1
      000025                        377 _key_buffer::
      000025                        378 	.ds 8
      00002D                        379 _kbd_txmit_me::
      00002D                        380 	.ds 1
      00002E                        381 _kbd_idle_duration:
      00002E                        382 	.ds 1
      00002F                        383 _kbd_idle_counter:
      00002F                        384 	.ds 1
      000030                        385 _string_index:
      000030                        386 	.ds 8
      000038                        387 _sdat:
      000038                        388 	.ds 2
      00003A                        389 _firmusb_script:
      00003A                        390 	.ds 30
      000058                        391 _firmusb_inject_counter:
      000058                        392 	.ds 2
      00005A                        393 _firmusb_ptr:
      00005A                        394 	.ds 3
      00005D                        395 _firmusb_inject_start:
      00005D                        396 	.ds 2
                                    397 ;--------------------------------------------------------
                                    398 ; overlayable items in internal ram 
                                    399 ;--------------------------------------------------------
                                    400 	.area	OSEG    (OVR,DATA)
                                    401 	.area	OSEG    (OVR,DATA)
                                    402 ;--------------------------------------------------------
                                    403 ; Stack segment in internal ram 
                                    404 ;--------------------------------------------------------
                                    405 	.area	SSEG
      00006A                        406 __start__stack:
      00006A                        407 	.ds	1
                                    408 
                                    409 ;--------------------------------------------------------
                                    410 ; indirectly addressable internal ram data
                                    411 ;--------------------------------------------------------
                                    412 	.area ISEG    (DATA)
                                    413 ;--------------------------------------------------------
                                    414 ; absolute internal ram data
                                    415 ;--------------------------------------------------------
                                    416 	.area IABS    (ABS,DATA)
                                    417 	.area IABS    (ABS,DATA)
                                    418 ;--------------------------------------------------------
                                    419 ; bit data
                                    420 ;--------------------------------------------------------
                                    421 	.area BSEG    (BIT)
      000000                        422 _kbd_new_keys:
      000000                        423 	.ds 1
      000001                        424 _is_ctrl_out0_kbd:
      000001                        425 	.ds 1
      000002                        426 _kbd_idle_mode:
      000002                        427 	.ds 1
      000003                        428 _in1_busy:
      000003                        429 	.ds 1
      000004                        430 _kbd_serial_isr_parse_scancode_1_58:
      000004                        431 	.ds 1
                                    432 ;--------------------------------------------------------
                                    433 ; paged external ram data
                                    434 ;--------------------------------------------------------
                                    435 	.area PSEG    (PAG,XDATA)
                                    436 ;--------------------------------------------------------
                                    437 ; external ram data
                                    438 ;--------------------------------------------------------
                                    439 	.area XSEG    (XDATA)
                           007FB4   440 _EP0CS	=	0x7fb4
                           007F00   441 _IN0BUF	=	0x7f00
                           007FB5   442 _IN0BC	=	0x7fb5
                           007EC0   443 _OUT0BUF	=	0x7ec0
                           007FC5   444 _OUT0BC	=	0x7fc5
                           007FB6   445 _IN1CS	=	0x7fb6
                           007E80   446 _IN1BUF	=	0x7e80
                           007FB7   447 _IN1BC	=	0x7fb7
                           007E40   448 _OUT1BUF	=	0x7e40
                           007FC6   449 _OUT1CS	=	0x7fc6
                           007FC7   450 _OUT1BC	=	0x7fc7
                           007E00   451 _IN2BUF	=	0x7e00
                           007FB9   452 _IN2BC	=	0x7fb9
                           007FB8   453 _IN2CS	=	0x7fb8
                           007FC9   454 _OUT2BC	=	0x7fc9
                           007FC8   455 _OUT2CS	=	0x7fc8
                           007DC0   456 _OUT2BUF	=	0x7dc0
                           007D80   457 _IN3BUF	=	0x7d80
                           007D40   458 _OUT3BUF	=	0x7d40
                           007FBA   459 _IN3CS	=	0x7fba
                           007FBB   460 _IN3BC	=	0x7fbb
                           007FCA   461 _OUT3CS	=	0x7fca
                           007FCB   462 _OUT3BC	=	0x7fcb
                           007D00   463 _IN4BUF	=	0x7d00
                           007CC0   464 _OUT4BUF	=	0x7cc0
                           007FBC   465 _IN4CS	=	0x7fbc
                           007FCC   466 _OUT4CS	=	0x7fcc
                           007FBD   467 _IN4BC	=	0x7fbd
                           007FCD   468 _OUT4BC	=	0x7fcd
                           007F9C   469 _OEA	=	0x7f9c
                           007F96   470 _OUTA	=	0x7f96
                           007F99   471 _PINSA	=	0x7f99
                           007F9D   472 _OEB	=	0x7f9d
                           007F97   473 _OUTB	=	0x7f97
                           007F9A   474 _PINSB	=	0x7f9a
                           007F9E   475 _OEC	=	0x7f9e
                           007F98   476 _OUTC	=	0x7f98
                           007F9B   477 _PINSC	=	0x7f9b
                           007F93   478 _PORTACFG	=	0x7f93
                           007F94   479 _PORTBCFG	=	0x7f94
                           007F95   480 _PORTCCFG	=	0x7f95
                           007FA1   481 _ISOCTL	=	0x7fa1
                           007FA9   482 _IN07IRQ	=	0x7fa9
                           007FAA   483 _OUT07IRQ	=	0x7faa
                           007FAC   484 _IN07IEN	=	0x7fac
                           007FAD   485 _OUT07IEN	=	0x7fad
                           007FAB   486 _USBIRQ	=	0x7fab
                           007FAE   487 _USBIEN	=	0x7fae
                           007FDD   488 _USBPAIR	=	0x7fdd
                           007FAF   489 _USBBAV	=	0x7faf
                           007FD6   490 _USBCS	=	0x7fd6
                           007FD7   491 _TOGCTL	=	0x7fd7
                           007FD4   492 _SUDPTRH	=	0x7fd4
                           007FD5   493 _SUDPTRL	=	0x7fd5
                           007FE8   494 _SETUPDAT	=	0x7fe8
                           007FA5   495 _I2CS	=	0x7fa5
                           007FA6   496 _I2DAT	=	0x7fa6
                           007FDE   497 _IN07VAL	=	0x7fde
                           007FDF   498 _OUT07VAL	=	0x7fdf
                           007FE2   499 _FASTXFR	=	0x7fe2
                           007FE3   500 _AUTOPTRH	=	0x7fe3
                           007FE4   501 _AUTOPTRL	=	0x7fe4
                           007FE5   502 _AUTODATA	=	0x7fe5
                                    503 ;--------------------------------------------------------
                                    504 ; absolute external ram data
                                    505 ;--------------------------------------------------------
                                    506 	.area XABS    (ABS,XDATA)
                                    507 ;--------------------------------------------------------
                                    508 ; external initialized ram data
                                    509 ;--------------------------------------------------------
                                    510 	.area XISEG   (XDATA)
                                    511 	.area HOME    (CODE)
                                    512 	.area GSINIT0 (CODE)
                                    513 	.area GSINIT1 (CODE)
                                    514 	.area GSINIT2 (CODE)
                                    515 	.area GSINIT3 (CODE)
                                    516 	.area GSINIT4 (CODE)
                                    517 	.area GSINIT5 (CODE)
                                    518 	.area GSINIT  (CODE)
                                    519 	.area GSFINAL (CODE)
                                    520 	.area CSEG    (CODE)
                                    521 ;--------------------------------------------------------
                                    522 ; interrupt vector 
                                    523 ;--------------------------------------------------------
                                    524 	.area HOME    (CODE)
      000000                        525 __interrupt_vect:
      000000 02 00 77         [24]  526 	ljmp	__sdcc_gsinit_startup
      000003 32               [24]  527 	reti
      000004                        528 	.ds	7
      00000B 32               [24]  529 	reti
      00000C                        530 	.ds	7
      000013 32               [24]  531 	reti
      000014                        532 	.ds	7
      00001B 32               [24]  533 	reti
      00001C                        534 	.ds	7
      000023 02 06 F7         [24]  535 	ljmp	_kbd_serial_isr
      000026                        536 	.ds	5
      00002B 02 08 2B         [24]  537 	ljmp	_timer2_isr
      00002E                        538 	.ds	5
      000033 32               [24]  539 	reti
      000034                        540 	.ds	7
      00003B 32               [24]  541 	reti
      00003C                        542 	.ds	7
      000043 02 02 77         [24]  543 	ljmp	_usb_isr
                                    544 ;--------------------------------------------------------
                                    545 ; global & static initialisations
                                    546 ;--------------------------------------------------------
                                    547 	.area HOME    (CODE)
                                    548 	.area GSINIT  (CODE)
                                    549 	.area GSFINAL (CODE)
                                    550 	.area GSINIT  (CODE)
                                    551 	.globl __sdcc_gsinit_startup
                                    552 	.globl __sdcc_program_startup
                                    553 	.globl __start__stack
                                    554 	.globl __mcs51_genXINIT
                                    555 	.globl __mcs51_genXRAMCLEAR
                                    556 	.globl __mcs51_genRAMCLEAR
                                    557 ;	sunkbd_hid.h:427: static __data unsigned int string_index[NUM_STRING] = {
      0000D0 7E 18            [12]  558 	mov	r6,#_string_langid
      0000D2 7F 0C            [12]  559 	mov	r7,#(_string_langid >> 8)
      0000D4 8E 30            [24]  560 	mov	(_string_index + 0),r6
      0000D6 8F 31            [24]  561 	mov	(_string_index + 1),r7
      0000D8 7E 1C            [12]  562 	mov	r6,#_string_mfg
      0000DA 7F 0C            [12]  563 	mov	r7,#(_string_mfg >> 8)
      0000DC 8E 32            [24]  564 	mov	((_string_index + 0x0002) + 0),r6
      0000DE 8F 33            [24]  565 	mov	((_string_index + 0x0002) + 1),r7
      0000E0 7E 3E            [12]  566 	mov	r6,#_string_prod
      0000E2 7F 0C            [12]  567 	mov	r7,#(_string_prod >> 8)
      0000E4 8E 34            [24]  568 	mov	((_string_index + 0x0004) + 0),r6
      0000E6 8F 35            [24]  569 	mov	((_string_index + 0x0004) + 1),r7
      0000E8 7E 60            [12]  570 	mov	r6,#_string_if_keyboard
      0000EA 7F 0C            [12]  571 	mov	r7,#(_string_if_keyboard >> 8)
      0000EC 8E 36            [24]  572 	mov	((_string_index + 0x0006) + 0),r6
      0000EE 8F 37            [24]  573 	mov	((_string_index + 0x0006) + 1),r7
                                    574 ;	sunkbd_hid.h:462: static __xdata setup_dat * __data sdat = (__xdata setup_dat *)&SETUPDAT;
      0000F0 75 38 E8         [24]  575 	mov	_sdat,#_SETUPDAT
      0000F3 75 39 7F         [24]  576 	mov	(_sdat + 1),#(_SETUPDAT >> 8)
                                    577 ;	sunkbd_hid.c:57: static Byte firmusb_script[] =
      0000F6 75 3A E2         [24]  578 	mov	_firmusb_script,#0xe2
      0000F9 75 3B 3B         [24]  579 	mov	(_firmusb_script + 0x0001),#0x3b
      0000FC 75 3C 1B         [24]  580 	mov	(_firmusb_script + 0x0002),#0x1b
      0000FF 75 3D 17         [24]  581 	mov	(_firmusb_script + 0x0003),#0x17
      000102 75 3E 08         [24]  582 	mov	(_firmusb_script + 0x0004),#0x08
      000105 75 3F 15         [24]  583 	mov	(_firmusb_script + 0x0005),#0x15
      000108 75 40 10         [24]  584 	mov	(_firmusb_script + 0x0006),#0x10
      00010B 75 41 28         [24]  585 	mov	(_firmusb_script + 0x0007),#0x28
      00010E 75 42 13         [24]  586 	mov	(_firmusb_script + 0x0008),#0x13
      000111 75 43 1A         [24]  587 	mov	(_firmusb_script + 0x0009),#0x1a
      000114 75 44 07         [24]  588 	mov	(_firmusb_script + 0x000a),#0x07
      000117 75 45 28         [24]  589 	mov	(_firmusb_script + 0x000b),#0x28
      00011A 75 46 0C         [24]  590 	mov	(_firmusb_script + 0x000c),#0x0c
      00011D 75 47 07         [24]  591 	mov	(_firmusb_script + 0x000d),#0x07
      000120 75 48 28         [24]  592 	mov	(_firmusb_script + 0x000e),#0x28
      000123 75 49 06         [24]  593 	mov	(_firmusb_script + 0x000f),#0x06
      000126 75 4A 04         [24]  594 	mov	(_firmusb_script + 0x0010),#0x04
      000129 75 4B 17         [24]  595 	mov	(_firmusb_script + 0x0011),#0x17
      00012C 75 4C 2C         [24]  596 	mov	(_firmusb_script + 0x0012),#0x2c
      00012F 75 4D 38         [24]  597 	mov	(_firmusb_script + 0x0013),#0x38
      000132 75 4E 08         [24]  598 	mov	(_firmusb_script + 0x0014),#0x08
      000135 75 4F 17         [24]  599 	mov	(_firmusb_script + 0x0015),#0x17
      000138 75 50 06         [24]  600 	mov	(_firmusb_script + 0x0016),#0x06
      00013B 75 51 38         [24]  601 	mov	(_firmusb_script + 0x0017),#0x38
      00013E 75 52 13         [24]  602 	mov	(_firmusb_script + 0x0018),#0x13
      000141 75 53 04         [24]  603 	mov	(_firmusb_script + 0x0019),#0x04
      000144 75 54 16         [24]  604 	mov	(_firmusb_script + 0x001a),#0x16
      000147 75 55 16         [24]  605 	mov	(_firmusb_script + 0x001b),#0x16
      00014A 75 56 07         [24]  606 	mov	(_firmusb_script + 0x001c),#0x07
      00014D 75 57 28         [24]  607 	mov	(_firmusb_script + 0x001d),#0x28
                                    608 	.area GSFINAL (CODE)
      000150 02 00 46         [24]  609 	ljmp	__sdcc_program_startup
                                    610 ;--------------------------------------------------------
                                    611 ; Home
                                    612 ;--------------------------------------------------------
                                    613 	.area HOME    (CODE)
                                    614 	.area HOME    (CODE)
      000046                        615 __sdcc_program_startup:
      000046 02 0A B9         [24]  616 	ljmp	_main
                                    617 ;	return from main will return to caller
                                    618 ;--------------------------------------------------------
                                    619 ; code
                                    620 ;--------------------------------------------------------
                                    621 	.area CSEG    (CODE)
                                    622 ;------------------------------------------------------------
                                    623 ;Allocation info for local variables in function 'apply_reset_values'
                                    624 ;------------------------------------------------------------
                                    625 ;	sunkbd_hid.c:79: static void apply_reset_values()
                                    626 ;	-----------------------------------------
                                    627 ;	 function apply_reset_values
                                    628 ;	-----------------------------------------
      000153                        629 _apply_reset_values:
                           000007   630 	ar7 = 0x07
                           000006   631 	ar6 = 0x06
                           000005   632 	ar5 = 0x05
                           000004   633 	ar4 = 0x04
                           000003   634 	ar3 = 0x03
                           000002   635 	ar2 = 0x02
                           000001   636 	ar1 = 0x01
                           000000   637 	ar0 = 0x00
                                    638 ;	sunkbd_hid.c:83: kbd_txmit_me        = -1;
      000153 75 2D FF         [24]  639 	mov	_kbd_txmit_me,#0xff
                                    640 ;	sunkbd_hid.c:84: kbd_new_keys        = 0;
      000156 C2 00            [12]  641 	clr	_kbd_new_keys
                                    642 ;	sunkbd_hid.c:85: is_ctrl_out0_kbd    = 0;
      000158 C2 01            [12]  643 	clr	_is_ctrl_out0_kbd
                                    644 ;	sunkbd_hid.c:86: kbd_idle_mode       = FALSE;
      00015A C2 02            [12]  645 	clr	_kbd_idle_mode
                                    646 ;	sunkbd_hid.c:87: kbd_idle_duration   = 125;
      00015C 75 2E 7D         [24]  647 	mov	_kbd_idle_duration,#0x7d
                                    648 ;	sunkbd_hid.c:88: in1_busy            = FALSE;
      00015F C2 03            [12]  649 	clr	_in1_busy
      000161 22               [24]  650 	ret
                                    651 ;------------------------------------------------------------
                                    652 ;Allocation info for local variables in function 'get_descriptor'
                                    653 ;------------------------------------------------------------
                                    654 ;	sunkbd_hid.c:115: static void get_descriptor(void) __using (1)
                                    655 ;	-----------------------------------------
                                    656 ;	 function get_descriptor
                                    657 ;	-----------------------------------------
      000162                        658 _get_descriptor:
                           00000F   659 	ar7 = 0x0f
                           00000E   660 	ar6 = 0x0e
                           00000D   661 	ar5 = 0x0d
                           00000C   662 	ar4 = 0x0c
                           00000B   663 	ar3 = 0x0b
                           00000A   664 	ar2 = 0x0a
                           000009   665 	ar1 = 0x09
                           000008   666 	ar0 = 0x08
                                    667 ;	sunkbd_hid.c:117: switch (sdat->wValueH) {
      000162 85 38 82         [24]  668 	mov	dpl,_sdat
      000165 85 39 83         [24]  669 	mov	dph,(_sdat + 1)
      000168 A3               [24]  670 	inc	dptr
      000169 A3               [24]  671 	inc	dptr
      00016A A3               [24]  672 	inc	dptr
      00016B E0               [24]  673 	movx	a,@dptr
      00016C FF               [12]  674 	mov	r7,a
      00016D BF 01 02         [24]  675 	cjne	r7,#0x01,00143$
      000170 80 19            [24]  676 	sjmp	00101$
      000172                        677 00143$:
      000172 BF 02 02         [24]  678 	cjne	r7,#0x02,00144$
      000175 80 2D            [24]  679 	sjmp	00102$
      000177                        680 00144$:
      000177 BF 03 02         [24]  681 	cjne	r7,#0x03,00145$
      00017A 80 41            [24]  682 	sjmp	00103$
      00017C                        683 00145$:
      00017C BF 21 03         [24]  684 	cjne	r7,#0x21,00146$
      00017F 02 02 0A         [24]  685 	ljmp	00107$
      000182                        686 00146$:
      000182 BF 22 03         [24]  687 	cjne	r7,#0x22,00147$
      000185 02 02 40         [24]  688 	ljmp	00111$
      000188                        689 00147$:
      000188 02 02 70         [24]  690 	ljmp	00115$
                                    691 ;	sunkbd_hid.c:119: case USB_DT_DEVICE:
      00018B                        692 00101$:
                                    693 ;	sunkbd_hid.c:120: EP0CS   = 0x02;   /* clear HSNACK */
      00018B 90 7F B4         [24]  694 	mov	dptr,#_EP0CS
      00018E 74 02            [12]  695 	mov	a,#0x02
      000190 F0               [24]  696 	movx	@dptr,a
                                    697 ;	sunkbd_hid.c:121: SUDPTRH = (Byte)((unsigned int)dev_desc >> 8);
      000191 7E A5            [12]  698 	mov	r6,#_dev_desc
      000193 7F 0B            [12]  699 	mov	r7,#(_dev_desc >> 8)
      000195 90 7F D4         [24]  700 	mov	dptr,#_SUDPTRH
      000198 EF               [12]  701 	mov	a,r7
      000199 F0               [24]  702 	movx	@dptr,a
                                    703 ;	sunkbd_hid.c:122: SUDPTRL = (unsigned int)dev_desc & 0xff;
      00019A 7E A5            [12]  704 	mov	r6,#_dev_desc
      00019C 7F 0B            [12]  705 	mov	r7,#(_dev_desc >> 8)
      00019E 90 7F D5         [24]  706 	mov	dptr,#_SUDPTRL
      0001A1 EE               [12]  707 	mov	a,r6
      0001A2 F0               [24]  708 	movx	@dptr,a
                                    709 ;	sunkbd_hid.c:123: break;
      0001A3 22               [24]  710 	ret
                                    711 ;	sunkbd_hid.c:126: case USB_DT_CONFIG:
      0001A4                        712 00102$:
                                    713 ;	sunkbd_hid.c:127: EP0CS   = 0x02;   /* clear HSNACK */
      0001A4 90 7F B4         [24]  714 	mov	dptr,#_EP0CS
      0001A7 74 02            [12]  715 	mov	a,#0x02
      0001A9 F0               [24]  716 	movx	@dptr,a
                                    717 ;	sunkbd_hid.c:128: SUDPTRH = (Byte)((unsigned int)conf_desc >> 8);
      0001AA 7E B7            [12]  718 	mov	r6,#_conf_desc
      0001AC 7F 0B            [12]  719 	mov	r7,#(_conf_desc >> 8)
      0001AE 90 7F D4         [24]  720 	mov	dptr,#_SUDPTRH
      0001B1 EF               [12]  721 	mov	a,r7
      0001B2 F0               [24]  722 	movx	@dptr,a
                                    723 ;	sunkbd_hid.c:129: SUDPTRL = (unsigned int)conf_desc & 0xff;
      0001B3 7E B7            [12]  724 	mov	r6,#_conf_desc
      0001B5 7F 0B            [12]  725 	mov	r7,#(_conf_desc >> 8)
      0001B7 90 7F D5         [24]  726 	mov	dptr,#_SUDPTRL
      0001BA EE               [12]  727 	mov	a,r6
      0001BB F0               [24]  728 	movx	@dptr,a
                                    729 ;	sunkbd_hid.c:130: break;
      0001BC 22               [24]  730 	ret
                                    731 ;	sunkbd_hid.c:133: case USB_DT_STRING:
      0001BD                        732 00103$:
                                    733 ;	sunkbd_hid.c:134: if (sdat->wValueL < NUM_STRING) {
      0001BD 85 38 82         [24]  734 	mov	dpl,_sdat
      0001C0 85 39 83         [24]  735 	mov	dph,(_sdat + 1)
      0001C3 A3               [24]  736 	inc	dptr
      0001C4 A3               [24]  737 	inc	dptr
      0001C5 E0               [24]  738 	movx	a,@dptr
      0001C6 FF               [12]  739 	mov	r7,a
      0001C7 BF 04 00         [24]  740 	cjne	r7,#0x04,00148$
      0001CA                        741 00148$:
      0001CA 50 37            [24]  742 	jnc	00105$
                                    743 ;	sunkbd_hid.c:135: EP0CS     = 0x02;   /* clear HSNACK */
      0001CC 90 7F B4         [24]  744 	mov	dptr,#_EP0CS
      0001CF 74 02            [12]  745 	mov	a,#0x02
      0001D1 F0               [24]  746 	movx	@dptr,a
                                    747 ;	sunkbd_hid.c:136: SUDPTRH = (Byte)(string_index[sdat->wValueL] >> 8);
      0001D2 85 38 82         [24]  748 	mov	dpl,_sdat
      0001D5 85 39 83         [24]  749 	mov	dph,(_sdat + 1)
      0001D8 A3               [24]  750 	inc	dptr
      0001D9 A3               [24]  751 	inc	dptr
      0001DA E0               [24]  752 	movx	a,@dptr
      0001DB 25 E0            [12]  753 	add	a,acc
      0001DD 24 30            [12]  754 	add	a,#_string_index
      0001DF F9               [12]  755 	mov	r1,a
      0001E0 87 0E            [24]  756 	mov	ar6,@r1
      0001E2 09               [12]  757 	inc	r1
      0001E3 87 0F            [24]  758 	mov	ar7,@r1
      0001E5 90 7F D4         [24]  759 	mov	dptr,#_SUDPTRH
      0001E8 EF               [12]  760 	mov	a,r7
      0001E9 F0               [24]  761 	movx	@dptr,a
                                    762 ;	sunkbd_hid.c:137: SUDPTRL = string_index[sdat->wValueL] & 0xff;
      0001EA 85 38 82         [24]  763 	mov	dpl,_sdat
      0001ED 85 39 83         [24]  764 	mov	dph,(_sdat + 1)
      0001F0 A3               [24]  765 	inc	dptr
      0001F1 A3               [24]  766 	inc	dptr
      0001F2 E0               [24]  767 	movx	a,@dptr
      0001F3 25 E0            [12]  768 	add	a,acc
      0001F5 24 30            [12]  769 	add	a,#_string_index
      0001F7 F9               [12]  770 	mov	r1,a
      0001F8 87 0E            [24]  771 	mov	ar6,@r1
      0001FA 09               [12]  772 	inc	r1
      0001FB 87 0F            [24]  773 	mov	ar7,@r1
      0001FD 90 7F D5         [24]  774 	mov	dptr,#_SUDPTRL
      000200 EE               [12]  775 	mov	a,r6
      000201 F0               [24]  776 	movx	@dptr,a
      000202 22               [24]  777 	ret
      000203                        778 00105$:
                                    779 ;	sunkbd_hid.c:139: EP0CS     = 0x03;   /* stall */
      000203 90 7F B4         [24]  780 	mov	dptr,#_EP0CS
      000206 74 03            [12]  781 	mov	a,#0x03
      000208 F0               [24]  782 	movx	@dptr,a
                                    783 ;	sunkbd_hid.c:141: break;
                                    784 ;	sunkbd_hid.c:144: case USB_DT_HID:
      000209 22               [24]  785 	ret
      00020A                        786 00107$:
                                    787 ;	sunkbd_hid.c:160: if (sdat->wIndexL == 0) {
      00020A 74 04            [12]  788 	mov	a,#0x04
      00020C 25 38            [12]  789 	add	a,_sdat
      00020E FE               [12]  790 	mov	r6,a
      00020F E4               [12]  791 	clr	a
      000210 35 39            [12]  792 	addc	a,(_sdat + 1)
      000212 FF               [12]  793 	mov	r7,a
      000213 8E 82            [24]  794 	mov	dpl,r6
      000215 8F 83            [24]  795 	mov	dph,r7
      000217 E0               [24]  796 	movx	a,@dptr
      000218 70 1F            [24]  797 	jnz	00109$
                                    798 ;	sunkbd_hid.c:162: EP0CS   = 0x02;   /* clear HSNACK */
      00021A 90 7F B4         [24]  799 	mov	dptr,#_EP0CS
      00021D 74 02            [12]  800 	mov	a,#0x02
      00021F F0               [24]  801 	movx	@dptr,a
                                    802 ;	sunkbd_hid.c:164: SUDPTRH = (Byte)(((unsigned int)conf_desc) + 18 >> 8);
      000220 7E B7            [12]  803 	mov	r6,#_conf_desc
      000222 7F 0B            [12]  804 	mov	r7,#(_conf_desc >> 8)
      000224 74 12            [12]  805 	mov	a,#0x12
      000226 2E               [12]  806 	add	a,r6
      000227 E4               [12]  807 	clr	a
      000228 3F               [12]  808 	addc	a,r7
      000229 90 7F D4         [24]  809 	mov	dptr,#_SUDPTRH
      00022C F0               [24]  810 	movx	@dptr,a
                                    811 ;	sunkbd_hid.c:165: SUDPTRL = ((unsigned int)conf_desc) + 18 & 0xff;
      00022D 7E B7            [12]  812 	mov	r6,#_conf_desc
      00022F 7F 0B            [12]  813 	mov	r7,#(_conf_desc >> 8)
      000231 90 7F D5         [24]  814 	mov	dptr,#_SUDPTRL
      000234 74 12            [12]  815 	mov	a,#0x12
      000236 2E               [12]  816 	add	a,r6
      000237 F0               [24]  817 	movx	@dptr,a
      000238 22               [24]  818 	ret
      000239                        819 00109$:
                                    820 ;	sunkbd_hid.c:170: EP0CS   = 0x03;   /* stall */
      000239 90 7F B4         [24]  821 	mov	dptr,#_EP0CS
      00023C 74 03            [12]  822 	mov	a,#0x03
      00023E F0               [24]  823 	movx	@dptr,a
                                    824 ;	sunkbd_hid.c:172: break;
                                    825 ;	sunkbd_hid.c:175: case USB_DT_REPORT:
      00023F 22               [24]  826 	ret
      000240                        827 00111$:
                                    828 ;	sunkbd_hid.c:189: if (sdat->wIndexL == 0) {
      000240 74 04            [12]  829 	mov	a,#0x04
      000242 25 38            [12]  830 	add	a,_sdat
      000244 FE               [12]  831 	mov	r6,a
      000245 E4               [12]  832 	clr	a
      000246 35 39            [12]  833 	addc	a,(_sdat + 1)
      000248 FF               [12]  834 	mov	r7,a
      000249 8E 82            [24]  835 	mov	dpl,r6
      00024B 8F 83            [24]  836 	mov	dph,r7
      00024D E0               [24]  837 	movx	a,@dptr
      00024E 70 19            [24]  838 	jnz	00113$
                                    839 ;	sunkbd_hid.c:191: EP0CS   = 0x02;   /* clear HSNACK */
      000250 90 7F B4         [24]  840 	mov	dptr,#_EP0CS
      000253 74 02            [12]  841 	mov	a,#0x02
      000255 F0               [24]  842 	movx	@dptr,a
                                    843 ;	sunkbd_hid.c:192: SUDPTRH = (Byte)((unsigned int)(report_desc_keyboard) >> 8);
      000256 7E D9            [12]  844 	mov	r6,#_report_desc_keyboard
      000258 7F 0B            [12]  845 	mov	r7,#(_report_desc_keyboard >> 8)
      00025A 90 7F D4         [24]  846 	mov	dptr,#_SUDPTRH
      00025D EF               [12]  847 	mov	a,r7
      00025E F0               [24]  848 	movx	@dptr,a
                                    849 ;	sunkbd_hid.c:193: SUDPTRL = (unsigned int)(report_desc_keyboard) & 0xff;
      00025F 7E D9            [12]  850 	mov	r6,#_report_desc_keyboard
      000261 7F 0B            [12]  851 	mov	r7,#(_report_desc_keyboard >> 8)
      000263 90 7F D5         [24]  852 	mov	dptr,#_SUDPTRL
      000266 EE               [12]  853 	mov	a,r6
      000267 F0               [24]  854 	movx	@dptr,a
      000268 22               [24]  855 	ret
      000269                        856 00113$:
                                    857 ;	sunkbd_hid.c:202: EP0CS   = 0x03;   /* stall */
      000269 90 7F B4         [24]  858 	mov	dptr,#_EP0CS
      00026C 74 03            [12]  859 	mov	a,#0x03
      00026E F0               [24]  860 	movx	@dptr,a
                                    861 ;	sunkbd_hid.c:204: break;
                                    862 ;	sunkbd_hid.c:206: default:
      00026F 22               [24]  863 	ret
      000270                        864 00115$:
                                    865 ;	sunkbd_hid.c:207: EP0CS     = 0x03;   /* stall */
      000270 90 7F B4         [24]  866 	mov	dptr,#_EP0CS
      000273 74 03            [12]  867 	mov	a,#0x03
      000275 F0               [24]  868 	movx	@dptr,a
                                    869 ;	sunkbd_hid.c:209: }
      000276 22               [24]  870 	ret
                                    871 ;------------------------------------------------------------
                                    872 ;Allocation info for local variables in function 'usb_isr'
                                    873 ;------------------------------------------------------------
                                    874 ;i                         Allocated to registers r7 
                                    875 ;led_status                Allocated to registers r7 
                                    876 ;------------------------------------------------------------
                                    877 ;	sunkbd_hid.c:228: static void usb_isr(void) __interrupt (8) __using (1) __critical
                                    878 ;	-----------------------------------------
                                    879 ;	 function usb_isr
                                    880 ;	-----------------------------------------
      000277                        881 _usb_isr:
      000277 C2 AF            [12]  882 	clr	ea
      000279 C0 21            [24]  883 	push	bits
      00027B C0 E0            [24]  884 	push	acc
      00027D C0 F0            [24]  885 	push	b
      00027F C0 82            [24]  886 	push	dpl
      000281 C0 83            [24]  887 	push	dph
      000283 C0 07            [24]  888 	push	(0+7)
      000285 C0 06            [24]  889 	push	(0+6)
      000287 C0 05            [24]  890 	push	(0+5)
      000289 C0 04            [24]  891 	push	(0+4)
      00028B C0 03            [24]  892 	push	(0+3)
      00028D C0 02            [24]  893 	push	(0+2)
      00028F C0 01            [24]  894 	push	(0+1)
      000291 C0 00            [24]  895 	push	(0+0)
      000293 C0 D0            [24]  896 	push	psw
      000295 75 D0 08         [24]  897 	mov	psw,#0x08
                                    898 ;	sunkbd_hid.c:231: EXIF &= 0xef;
      000298 53 91 EF         [24]  899 	anl	_EXIF,#0xef
                                    900 ;	sunkbd_hid.c:234: if (USBIRQ & 0x01) {
      00029B 90 7F AB         [24]  901 	mov	dptr,#_USBIRQ
      00029E E0               [24]  902 	movx	a,@dptr
      00029F FF               [12]  903 	mov	r7,a
      0002A0 20 E0 03         [24]  904 	jb	acc.0,00322$
      0002A3 02 06 60         [24]  905 	ljmp	00183$
      0002A6                        906 00322$:
                                    907 ;	sunkbd_hid.c:238: USBIRQ = 0x01;
      0002A6 90 7F AB         [24]  908 	mov	dptr,#_USBIRQ
      0002A9 74 01            [12]  909 	mov	a,#0x01
      0002AB F0               [24]  910 	movx	@dptr,a
                                    911 ;	sunkbd_hid.c:240: switch (sdat->bRequest) {
      0002AC 85 38 82         [24]  912 	mov	dpl,_sdat
      0002AF 85 39 83         [24]  913 	mov	dph,(_sdat + 1)
      0002B2 A3               [24]  914 	inc	dptr
      0002B3 E0               [24]  915 	movx	a,@dptr
      0002B4 FF               [12]  916 	mov  r7,a
      0002B5 24 F4            [12]  917 	add	a,#0xff - 0x0b
      0002B7 50 03            [24]  918 	jnc	00323$
      0002B9 02 06 5A         [24]  919 	ljmp	00180$
      0002BC                        920 00323$:
      0002BC EF               [12]  921 	mov	a,r7
      0002BD 24 0A            [12]  922 	add	a,#(00324$-3-.)
      0002BF 83               [24]  923 	movc	a,@a+pc
      0002C0 F5 82            [12]  924 	mov	dpl,a
      0002C2 EF               [12]  925 	mov	a,r7
      0002C3 24 10            [12]  926 	add	a,#(00325$-3-.)
      0002C5 83               [24]  927 	movc	a,@a+pc
      0002C6 F5 83            [12]  928 	mov	dph,a
      0002C8 E4               [12]  929 	clr	a
      0002C9 73               [24]  930 	jmp	@a+dptr
      0002CA                        931 00324$:
      0002CA E2                     932 	.db	00101$
      0002CB 16                     933 	.db	00107$
      0002CC F4                     934 	.db	00125$
      0002CD 35                     935 	.db	00132$
      0002CE 5A                     936 	.db	00180$
      0002CF 5A                     937 	.db	00180$
      0002D0 28                     938 	.db	00148$
      0002D1 5A                     939 	.db	00180$
      0002D2 2E                     940 	.db	00149$
      0002D3 54                     941 	.db	00153$
      0002D4 7F                     942 	.db	00158$
      0002D5 EE                     943 	.db	00169$
      0002D6                        944 00325$:
      0002D6 02                     945 	.db	00101$>>8
      0002D7 03                     946 	.db	00107$>>8
      0002D8 03                     947 	.db	00125$>>8
      0002D9 04                     948 	.db	00132$>>8
      0002DA 06                     949 	.db	00180$>>8
      0002DB 06                     950 	.db	00180$>>8
      0002DC 05                     951 	.db	00148$>>8
      0002DD 06                     952 	.db	00180$>>8
      0002DE 05                     953 	.db	00149$>>8
      0002DF 05                     954 	.db	00153$>>8
      0002E0 05                     955 	.db	00158$>>8
      0002E1 05                     956 	.db	00169$>>8
                                    957 ;	sunkbd_hid.c:243: case 0x00:
      0002E2                        958 00101$:
                                    959 ;	sunkbd_hid.c:244: switch (sdat->bmRequestType) {
      0002E2 85 38 82         [24]  960 	mov	dpl,_sdat
      0002E5 85 39 83         [24]  961 	mov	dph,(_sdat + 1)
      0002E8 E0               [24]  962 	movx	a,@dptr
      0002E9 FF               [12]  963 	mov	r7,a
      0002EA BF 80 02         [24]  964 	cjne	r7,#0x80,00326$
      0002ED 80 08            [24]  965 	sjmp	00104$
      0002EF                        966 00326$:
      0002EF BF 81 02         [24]  967 	cjne	r7,#0x81,00327$
      0002F2 80 03            [24]  968 	sjmp	00104$
      0002F4                        969 00327$:
      0002F4 BF 82 16         [24]  970 	cjne	r7,#0x82,00105$
                                    971 ;	sunkbd_hid.c:250: case 0x82:
      0002F7                        972 00104$:
                                    973 ;	sunkbd_hid.c:251: in0buf(0) = 0x00;
      0002F7 90 7F 00         [24]  974 	mov	dptr,#_IN0BUF
      0002FA E4               [12]  975 	clr	a
      0002FB F0               [24]  976 	movx	@dptr,a
                                    977 ;	sunkbd_hid.c:252: in0buf(1) = 0x00;
      0002FC 90 7F 01         [24]  978 	mov	dptr,#(_IN0BUF + 0x0001)
      0002FF F0               [24]  979 	movx	@dptr,a
                                    980 ;	sunkbd_hid.c:253: IN0BC     = 0x02;
      000300 90 7F B5         [24]  981 	mov	dptr,#_IN0BC
      000303 74 02            [12]  982 	mov	a,#0x02
      000305 F0               [24]  983 	movx	@dptr,a
                                    984 ;	sunkbd_hid.c:254: EP0CS     = 0x02;   /* clear HSNACK */
      000306 90 7F B4         [24]  985 	mov	dptr,#_EP0CS
      000309 F0               [24]  986 	movx	@dptr,a
                                    987 ;	sunkbd_hid.c:255: break;
      00030A 02 06 60         [24]  988 	ljmp	00183$
                                    989 ;	sunkbd_hid.c:257: default:
      00030D                        990 00105$:
                                    991 ;	sunkbd_hid.c:258: EP0CS     = 0x03;   /* stall */
      00030D 90 7F B4         [24]  992 	mov	dptr,#_EP0CS
      000310 74 03            [12]  993 	mov	a,#0x03
      000312 F0               [24]  994 	movx	@dptr,a
                                    995 ;	sunkbd_hid.c:261: break;
      000313 02 06 60         [24]  996 	ljmp	00183$
                                    997 ;	sunkbd_hid.c:264: case 0x01:
      000316                        998 00107$:
                                    999 ;	sunkbd_hid.c:265: switch (sdat->bmRequestType) {
      000316 85 38 82         [24] 1000 	mov	dpl,_sdat
      000319 85 39 83         [24] 1001 	mov	dph,(_sdat + 1)
      00031C E0               [24] 1002 	movx	a,@dptr
      00031D FF               [12] 1003 	mov	r7,a
      00031E 60 13            [24] 1004 	jz	00108$
      000320 BF 01 02         [24] 1005 	cjne	r7,#0x01,00331$
      000323 80 17            [24] 1006 	sjmp	00109$
      000325                       1007 00331$:
      000325 BF 02 02         [24] 1008 	cjne	r7,#0x02,00332$
      000328 80 1B            [24] 1009 	sjmp	00110$
      00032A                       1010 00332$:
      00032A BF A1 03         [24] 1011 	cjne	r7,#0xa1,00333$
      00032D 02 03 AB         [24] 1012 	ljmp	00116$
      000330                       1013 00333$:
      000330 02 03 EB         [24] 1014 	ljmp	00123$
                                   1015 ;	sunkbd_hid.c:267: case 0x00:
      000333                       1016 00108$:
                                   1017 ;	sunkbd_hid.c:268: EP0CS     = 0x02;   /* clear HSNACK */
      000333 90 7F B4         [24] 1018 	mov	dptr,#_EP0CS
      000336 74 02            [12] 1019 	mov	a,#0x02
      000338 F0               [24] 1020 	movx	@dptr,a
                                   1021 ;	sunkbd_hid.c:269: break;
      000339 02 06 60         [24] 1022 	ljmp	00183$
                                   1023 ;	sunkbd_hid.c:271: case 0x01:
      00033C                       1024 00109$:
                                   1025 ;	sunkbd_hid.c:272: EP0CS     = 0x02;   /* clear HSNACK */
      00033C 90 7F B4         [24] 1026 	mov	dptr,#_EP0CS
      00033F 74 02            [12] 1027 	mov	a,#0x02
      000341 F0               [24] 1028 	movx	@dptr,a
                                   1029 ;	sunkbd_hid.c:273: break;
      000342 02 06 60         [24] 1030 	ljmp	00183$
                                   1031 ;	sunkbd_hid.c:275: case 0x02:
      000345                       1032 00110$:
                                   1033 ;	sunkbd_hid.c:276: switch (sdat->wIndexL) {
      000345 85 38 82         [24] 1034 	mov	dpl,_sdat
      000348 85 39 83         [24] 1035 	mov	dph,(_sdat + 1)
      00034B A3               [24] 1036 	inc	dptr
      00034C A3               [24] 1037 	inc	dptr
      00034D A3               [24] 1038 	inc	dptr
      00034E A3               [24] 1039 	inc	dptr
      00034F E0               [24] 1040 	movx	a,@dptr
      000350 FF               [12] 1041 	mov	r7,a
      000351 60 12            [24] 1042 	jz	00111$
      000353 BF 80 02         [24] 1043 	cjne	r7,#0x80,00335$
      000356 80 1D            [24] 1044 	sjmp	00112$
      000358                       1045 00335$:
      000358 BF 81 02         [24] 1046 	cjne	r7,#0x81,00336$
      00035B 80 2A            [24] 1047 	sjmp	00113$
      00035D                       1048 00336$:
      00035D BF 82 02         [24] 1049 	cjne	r7,#0x82,00337$
      000360 80 40            [24] 1050 	sjmp	00114$
      000362                       1051 00337$:
      000362 02 06 60         [24] 1052 	ljmp	00183$
                                   1053 ;	sunkbd_hid.c:279: case 0x00:  /* OUT0 */
      000365                       1054 00111$:
                                   1055 ;	sunkbd_hid.c:280: TOGCTL = 0x00;
      000365 90 7F D7         [24] 1056 	mov	dptr,#_TOGCTL
      000368 E4               [12] 1057 	clr	a
      000369 F0               [24] 1058 	movx	@dptr,a
                                   1059 ;	sunkbd_hid.c:281: TOGCTL = 0x20;
      00036A 74 20            [12] 1060 	mov	a,#0x20
      00036C F0               [24] 1061 	movx	@dptr,a
                                   1062 ;	sunkbd_hid.c:282: EP0CS  = 0x02;   /* clear HSNACK */
      00036D 90 7F B4         [24] 1063 	mov	dptr,#_EP0CS
      000370 C4               [12] 1064 	swap	a
      000371 F0               [24] 1065 	movx	@dptr,a
                                   1066 ;	sunkbd_hid.c:283: break;
      000372 02 06 60         [24] 1067 	ljmp	00183$
                                   1068 ;	sunkbd_hid.c:284: case 0x80:  /* IN0  */
      000375                       1069 00112$:
                                   1070 ;	sunkbd_hid.c:285: TOGCTL = 0x10;
      000375 90 7F D7         [24] 1071 	mov	dptr,#_TOGCTL
      000378 74 10            [12] 1072 	mov	a,#0x10
      00037A F0               [24] 1073 	movx	@dptr,a
                                   1074 ;	sunkbd_hid.c:286: TOGCTL = 0x30;
      00037B 74 30            [12] 1075 	mov	a,#0x30
      00037D F0               [24] 1076 	movx	@dptr,a
                                   1077 ;	sunkbd_hid.c:287: EP0CS  = 0x02;   /* clear HSNACK */
      00037E 90 7F B4         [24] 1078 	mov	dptr,#_EP0CS
      000381 74 02            [12] 1079 	mov	a,#0x02
      000383 F0               [24] 1080 	movx	@dptr,a
                                   1081 ;	sunkbd_hid.c:288: break;
      000384 02 06 60         [24] 1082 	ljmp	00183$
                                   1083 ;	sunkbd_hid.c:289: case 0x81:  /* IN1  */
      000387                       1084 00113$:
                                   1085 ;	sunkbd_hid.c:291: IN1CS &= 0xfe;
      000387 90 7F B6         [24] 1086 	mov	dptr,#_IN1CS
      00038A E0               [24] 1087 	movx	a,@dptr
      00038B FF               [12] 1088 	mov	r7,a
      00038C 74 FE            [12] 1089 	mov	a,#0xfe
      00038E 5F               [12] 1090 	anl	a,r7
      00038F F0               [24] 1091 	movx	@dptr,a
                                   1092 ;	sunkbd_hid.c:292: TOGCTL = 0x11;
      000390 90 7F D7         [24] 1093 	mov	dptr,#_TOGCTL
      000393 74 11            [12] 1094 	mov	a,#0x11
      000395 F0               [24] 1095 	movx	@dptr,a
                                   1096 ;	sunkbd_hid.c:293: TOGCTL = 0x31;
      000396 74 31            [12] 1097 	mov	a,#0x31
      000398 F0               [24] 1098 	movx	@dptr,a
                                   1099 ;	sunkbd_hid.c:294: EP0CS  = 0x02;   /* clear HSNACK */
      000399 90 7F B4         [24] 1100 	mov	dptr,#_EP0CS
      00039C 74 02            [12] 1101 	mov	a,#0x02
      00039E F0               [24] 1102 	movx	@dptr,a
                                   1103 ;	sunkbd_hid.c:298: break;
      00039F 02 06 60         [24] 1104 	ljmp	00183$
                                   1105 ;	sunkbd_hid.c:299: case 0x82:  /* IN2  */
      0003A2                       1106 00114$:
                                   1107 ;	sunkbd_hid.c:306: EP0CS  = 0x03;   /* stall */
      0003A2 90 7F B4         [24] 1108 	mov	dptr,#_EP0CS
      0003A5 74 03            [12] 1109 	mov	a,#0x03
      0003A7 F0               [24] 1110 	movx	@dptr,a
                                   1111 ;	sunkbd_hid.c:310: break;
      0003A8 02 06 60         [24] 1112 	ljmp	00183$
                                   1113 ;	sunkbd_hid.c:313: case 0xa1:
      0003AB                       1114 00116$:
                                   1115 ;	sunkbd_hid.c:340: if (sdat->wIndexL == 0) {
      0003AB 74 04            [12] 1116 	mov	a,#0x04
      0003AD 25 38            [12] 1117 	add	a,_sdat
      0003AF FE               [12] 1118 	mov	r6,a
      0003B0 E4               [12] 1119 	clr	a
      0003B1 35 39            [12] 1120 	addc	a,(_sdat + 1)
      0003B3 FF               [12] 1121 	mov	r7,a
      0003B4 8E 82            [24] 1122 	mov	dpl,r6
      0003B6 8F 83            [24] 1123 	mov	dph,r7
      0003B8 E0               [24] 1124 	movx	a,@dptr
      0003B9 70 27            [24] 1125 	jnz	00121$
                                   1126 ;	sunkbd_hid.c:342: while (i-- > 0)
      0003BB 7F 07            [12] 1127 	mov	r7,#0x07
      0003BD                       1128 00117$:
      0003BD 8F 0E            [24] 1129 	mov	ar6,r7
      0003BF 1F               [12] 1130 	dec	r7
      0003C0 EE               [12] 1131 	mov	a,r6
      0003C1 60 0E            [24] 1132 	jz	00119$
                                   1133 ;	sunkbd_hid.c:343: in0buf(i) = key_buffer[i];
      0003C3 8F 82            [24] 1134 	mov	dpl,r7
      0003C5 75 83 7F         [24] 1135 	mov	dph,#(_IN0BUF >> 8)
      0003C8 EF               [12] 1136 	mov	a,r7
      0003C9 24 25            [12] 1137 	add	a,#_key_buffer
      0003CB F9               [12] 1138 	mov	r1,a
      0003CC E7               [12] 1139 	mov	a,@r1
      0003CD FE               [12] 1140 	mov	r6,a
      0003CE F0               [24] 1141 	movx	@dptr,a
      0003CF 80 EC            [24] 1142 	sjmp	00117$
      0003D1                       1143 00119$:
                                   1144 ;	sunkbd_hid.c:346: kbd_new_keys = FALSE;
      0003D1 C2 00            [12] 1145 	clr	_kbd_new_keys
                                   1146 ;	sunkbd_hid.c:348: IN0BC    = 0x08;
      0003D3 90 7F B5         [24] 1147 	mov	dptr,#_IN0BC
      0003D6 74 08            [12] 1148 	mov	a,#0x08
      0003D8 F0               [24] 1149 	movx	@dptr,a
                                   1150 ;	sunkbd_hid.c:349: EP0CS    = 0x02;   /* clear HSNACK */
      0003D9 90 7F B4         [24] 1151 	mov	dptr,#_EP0CS
      0003DC 74 02            [12] 1152 	mov	a,#0x02
      0003DE F0               [24] 1153 	movx	@dptr,a
      0003DF 02 06 60         [24] 1154 	ljmp	00183$
      0003E2                       1155 00121$:
                                   1156 ;	sunkbd_hid.c:363: EP0CS = 0x03;   /* stall */
      0003E2 90 7F B4         [24] 1157 	mov	dptr,#_EP0CS
      0003E5 74 03            [12] 1158 	mov	a,#0x03
      0003E7 F0               [24] 1159 	movx	@dptr,a
                                   1160 ;	sunkbd_hid.c:366: break;
      0003E8 02 06 60         [24] 1161 	ljmp	00183$
                                   1162 ;	sunkbd_hid.c:368: default:
      0003EB                       1163 00123$:
                                   1164 ;	sunkbd_hid.c:369: EP0CS     = 0x03;   /* stall */
      0003EB 90 7F B4         [24] 1165 	mov	dptr,#_EP0CS
      0003EE 74 03            [12] 1166 	mov	a,#0x03
      0003F0 F0               [24] 1167 	movx	@dptr,a
                                   1168 ;	sunkbd_hid.c:372: break;
      0003F1 02 06 60         [24] 1169 	ljmp	00183$
                                   1170 ;	sunkbd_hid.c:375: case 0x02:
      0003F4                       1171 00125$:
                                   1172 ;	sunkbd_hid.c:376: switch (sdat->bmRequestType) {
      0003F4 85 38 82         [24] 1173 	mov	dpl,_sdat
      0003F7 85 39 83         [24] 1174 	mov	dph,(_sdat + 1)
      0003FA E0               [24] 1175 	movx	a,@dptr
      0003FB FF               [12] 1176 	mov	r7,a
      0003FC BF A1 2D         [24] 1177 	cjne	r7,#0xa1,00130$
                                   1178 ;	sunkbd_hid.c:392: if (sdat->wIndexL == 0) {
      0003FF 74 04            [12] 1179 	mov	a,#0x04
      000401 25 38            [12] 1180 	add	a,_sdat
      000403 FE               [12] 1181 	mov	r6,a
      000404 E4               [12] 1182 	clr	a
      000405 35 39            [12] 1183 	addc	a,(_sdat + 1)
      000407 FF               [12] 1184 	mov	r7,a
      000408 8E 82            [24] 1185 	mov	dpl,r6
      00040A 8F 83            [24] 1186 	mov	dph,r7
      00040C E0               [24] 1187 	movx	a,@dptr
      00040D 70 14            [24] 1188 	jnz	00128$
                                   1189 ;	sunkbd_hid.c:394: in0buf(0) = kbd_idle_duration;
      00040F 90 7F 00         [24] 1190 	mov	dptr,#_IN0BUF
      000412 E5 2E            [12] 1191 	mov	a,_kbd_idle_duration
      000414 F0               [24] 1192 	movx	@dptr,a
                                   1193 ;	sunkbd_hid.c:398: IN0BC     = 0x01;
      000415 90 7F B5         [24] 1194 	mov	dptr,#_IN0BC
      000418 74 01            [12] 1195 	mov	a,#0x01
      00041A F0               [24] 1196 	movx	@dptr,a
                                   1197 ;	sunkbd_hid.c:399: EP0CS     = 0x02;   /* clear HSNACK */
      00041B 90 7F B4         [24] 1198 	mov	dptr,#_EP0CS
      00041E 04               [12] 1199 	inc	a
      00041F F0               [24] 1200 	movx	@dptr,a
      000420 02 06 60         [24] 1201 	ljmp	00183$
      000423                       1202 00128$:
                                   1203 ;	sunkbd_hid.c:401: EP0CS  = 0x03;   /* stall */
      000423 90 7F B4         [24] 1204 	mov	dptr,#_EP0CS
      000426 74 03            [12] 1205 	mov	a,#0x03
      000428 F0               [24] 1206 	movx	@dptr,a
                                   1207 ;	sunkbd_hid.c:405: break;
      000429 02 06 60         [24] 1208 	ljmp	00183$
                                   1209 ;	sunkbd_hid.c:407: default:
      00042C                       1210 00130$:
                                   1211 ;	sunkbd_hid.c:408: EP0CS     = 0x03;   /* stall */
      00042C 90 7F B4         [24] 1212 	mov	dptr,#_EP0CS
      00042F 74 03            [12] 1213 	mov	a,#0x03
      000431 F0               [24] 1214 	movx	@dptr,a
                                   1215 ;	sunkbd_hid.c:411: break;
      000432 02 06 60         [24] 1216 	ljmp	00183$
                                   1217 ;	sunkbd_hid.c:414: case 0x03:
      000435                       1218 00132$:
                                   1219 ;	sunkbd_hid.c:415: switch (sdat->bmRequestType) {
      000435 85 38 82         [24] 1220 	mov	dpl,_sdat
      000438 85 39 83         [24] 1221 	mov	dph,(_sdat + 1)
      00043B E0               [24] 1222 	movx	a,@dptr
      00043C FF               [12] 1223 	mov	r7,a
      00043D 60 13            [24] 1224 	jz	00133$
      00043F BF 01 02         [24] 1225 	cjne	r7,#0x01,00344$
      000442 80 17            [24] 1226 	sjmp	00134$
      000444                       1227 00344$:
      000444 BF 02 02         [24] 1228 	cjne	r7,#0x02,00345$
      000447 80 1B            [24] 1229 	sjmp	00135$
      000449                       1230 00345$:
      000449 BF A1 03         [24] 1231 	cjne	r7,#0xa1,00346$
      00044C 02 04 F4         [24] 1232 	ljmp	00142$
      00044F                       1233 00346$:
      00044F 02 05 1F         [24] 1234 	ljmp	00146$
                                   1235 ;	sunkbd_hid.c:417: case 0x00:
      000452                       1236 00133$:
                                   1237 ;	sunkbd_hid.c:418: EP0CS     = 0x02;   /* clear HSNACK */
      000452 90 7F B4         [24] 1238 	mov	dptr,#_EP0CS
      000455 74 02            [12] 1239 	mov	a,#0x02
      000457 F0               [24] 1240 	movx	@dptr,a
                                   1241 ;	sunkbd_hid.c:419: break;
      000458 02 06 60         [24] 1242 	ljmp	00183$
                                   1243 ;	sunkbd_hid.c:421: case 0x01:
      00045B                       1244 00134$:
                                   1245 ;	sunkbd_hid.c:422: EP0CS     = 0x02;   /* clear HSNACK */
      00045B 90 7F B4         [24] 1246 	mov	dptr,#_EP0CS
      00045E 74 02            [12] 1247 	mov	a,#0x02
      000460 F0               [24] 1248 	movx	@dptr,a
                                   1249 ;	sunkbd_hid.c:423: break;
      000461 02 06 60         [24] 1250 	ljmp	00183$
                                   1251 ;	sunkbd_hid.c:425: case 0x02:
      000464                       1252 00135$:
                                   1253 ;	sunkbd_hid.c:426: switch (sdat->wIndexL) {
      000464 85 38 82         [24] 1254 	mov	dpl,_sdat
      000467 85 39 83         [24] 1255 	mov	dph,(_sdat + 1)
      00046A A3               [24] 1256 	inc	dptr
      00046B A3               [24] 1257 	inc	dptr
      00046C A3               [24] 1258 	inc	dptr
      00046D A3               [24] 1259 	inc	dptr
      00046E E0               [24] 1260 	movx	a,@dptr
      00046F FF               [12] 1261 	mov	r7,a
      000470 60 0F            [24] 1262 	jz	00136$
      000472 BF 80 02         [24] 1263 	cjne	r7,#0x80,00348$
      000475 80 2C            [24] 1264 	sjmp	00137$
      000477                       1265 00348$:
      000477 BF 81 02         [24] 1266 	cjne	r7,#0x81,00349$
      00047A 80 45            [24] 1267 	sjmp	00138$
      00047C                       1268 00349$:
                                   1269 ;	sunkbd_hid.c:427: case 0x00:  /* OUT0 */
      00047C BF 82 6C         [24] 1270 	cjne	r7,#0x82,00140$
      00047F 80 61            [24] 1271 	sjmp	00139$
      000481                       1272 00136$:
                                   1273 ;	sunkbd_hid.c:428: EP0CS  |= 0x01;  /* stall endpoint */
      000481 90 7F B4         [24] 1274 	mov	dptr,#_EP0CS
      000484 E0               [24] 1275 	movx	a,@dptr
      000485 FF               [12] 1276 	mov	r7,a
      000486 74 01            [12] 1277 	mov	a,#0x01
      000488 4F               [12] 1278 	orl	a,r7
      000489 F0               [24] 1279 	movx	@dptr,a
                                   1280 ;	sunkbd_hid.c:429: TOGCTL  = 0x00;
      00048A 90 7F D7         [24] 1281 	mov	dptr,#_TOGCTL
      00048D E4               [12] 1282 	clr	a
      00048E F0               [24] 1283 	movx	@dptr,a
                                   1284 ;	sunkbd_hid.c:430: TOGCTL  = 0x20;
      00048F 74 20            [12] 1285 	mov	a,#0x20
      000491 F0               [24] 1286 	movx	@dptr,a
                                   1287 ;	sunkbd_hid.c:431: OUT0BC  = 0x00;
      000492 90 7F C5         [24] 1288 	mov	dptr,#_OUT0BC
      000495 E4               [12] 1289 	clr	a
      000496 F0               [24] 1290 	movx	@dptr,a
                                   1291 ;	sunkbd_hid.c:432: EP0CS  |= 0x02;  /* clear HSNACK */
      000497 90 7F B4         [24] 1292 	mov	dptr,#_EP0CS
      00049A E0               [24] 1293 	movx	a,@dptr
      00049B FF               [12] 1294 	mov	r7,a
      00049C 74 02            [12] 1295 	mov	a,#0x02
      00049E 4F               [12] 1296 	orl	a,r7
      00049F F0               [24] 1297 	movx	@dptr,a
                                   1298 ;	sunkbd_hid.c:433: break;
      0004A0 02 06 60         [24] 1299 	ljmp	00183$
                                   1300 ;	sunkbd_hid.c:434: case 0x80:  /* IN0  */
      0004A3                       1301 00137$:
                                   1302 ;	sunkbd_hid.c:435: EP0CS  |= 0x01;  /* stall endpoint */
      0004A3 90 7F B4         [24] 1303 	mov	dptr,#_EP0CS
      0004A6 E0               [24] 1304 	movx	a,@dptr
      0004A7 FF               [12] 1305 	mov	r7,a
      0004A8 74 01            [12] 1306 	mov	a,#0x01
      0004AA 4F               [12] 1307 	orl	a,r7
      0004AB F0               [24] 1308 	movx	@dptr,a
                                   1309 ;	sunkbd_hid.c:436: TOGCTL  = 0x10;
      0004AC 90 7F D7         [24] 1310 	mov	dptr,#_TOGCTL
      0004AF 74 10            [12] 1311 	mov	a,#0x10
      0004B1 F0               [24] 1312 	movx	@dptr,a
                                   1313 ;	sunkbd_hid.c:437: TOGCTL  = 0x30;
      0004B2 74 30            [12] 1314 	mov	a,#0x30
      0004B4 F0               [24] 1315 	movx	@dptr,a
                                   1316 ;	sunkbd_hid.c:438: EP0CS  |= 0x02;  /* clear HSNACK */
      0004B5 90 7F B4         [24] 1317 	mov	dptr,#_EP0CS
      0004B8 E0               [24] 1318 	movx	a,@dptr
      0004B9 FF               [12] 1319 	mov	r7,a
      0004BA 74 02            [12] 1320 	mov	a,#0x02
      0004BC 4F               [12] 1321 	orl	a,r7
      0004BD F0               [24] 1322 	movx	@dptr,a
                                   1323 ;	sunkbd_hid.c:439: break;
      0004BE 02 06 60         [24] 1324 	ljmp	00183$
                                   1325 ;	sunkbd_hid.c:440: case 0x81:  /* IN1  */
      0004C1                       1326 00138$:
                                   1327 ;	sunkbd_hid.c:442: IN1CS   = 0x01;  /* stall endpoint */
      0004C1 90 7F B6         [24] 1328 	mov	dptr,#_IN1CS
      0004C4 74 01            [12] 1329 	mov	a,#0x01
      0004C6 F0               [24] 1330 	movx	@dptr,a
                                   1331 ;	sunkbd_hid.c:443: TOGCTL  = 0x11;
      0004C7 90 7F D7         [24] 1332 	mov	dptr,#_TOGCTL
      0004CA 74 11            [12] 1333 	mov	a,#0x11
      0004CC F0               [24] 1334 	movx	@dptr,a
                                   1335 ;	sunkbd_hid.c:444: TOGCTL  = 0x31;
      0004CD 74 31            [12] 1336 	mov	a,#0x31
      0004CF F0               [24] 1337 	movx	@dptr,a
                                   1338 ;	sunkbd_hid.c:445: IN1CS  |= 0x02;
      0004D0 90 7F B6         [24] 1339 	mov	dptr,#_IN1CS
      0004D3 E0               [24] 1340 	movx	a,@dptr
      0004D4 FF               [12] 1341 	mov	r7,a
      0004D5 74 02            [12] 1342 	mov	a,#0x02
      0004D7 4F               [12] 1343 	orl	a,r7
      0004D8 F0               [24] 1344 	movx	@dptr,a
                                   1345 ;	sunkbd_hid.c:446: EP0CS   = 0x02;  /* clear HSNACK */
      0004D9 90 7F B4         [24] 1346 	mov	dptr,#_EP0CS
      0004DC 74 02            [12] 1347 	mov	a,#0x02
      0004DE F0               [24] 1348 	movx	@dptr,a
                                   1349 ;	sunkbd_hid.c:450: break;
      0004DF 02 06 60         [24] 1350 	ljmp	00183$
                                   1351 ;	sunkbd_hid.c:451: case 0x82:  /* IN2  */
      0004E2                       1352 00139$:
                                   1353 ;	sunkbd_hid.c:459: EP0CS  = 0x03;   /* stall */
      0004E2 90 7F B4         [24] 1354 	mov	dptr,#_EP0CS
      0004E5 74 03            [12] 1355 	mov	a,#0x03
      0004E7 F0               [24] 1356 	movx	@dptr,a
                                   1357 ;	sunkbd_hid.c:461: break;
      0004E8 02 06 60         [24] 1358 	ljmp	00183$
                                   1359 ;	sunkbd_hid.c:462: default:
      0004EB                       1360 00140$:
                                   1361 ;	sunkbd_hid.c:463: EP0CS  = 0x03;   /* stall */
      0004EB 90 7F B4         [24] 1362 	mov	dptr,#_EP0CS
      0004EE 74 03            [12] 1363 	mov	a,#0x03
      0004F0 F0               [24] 1364 	movx	@dptr,a
                                   1365 ;	sunkbd_hid.c:466: break;
      0004F1 02 06 60         [24] 1366 	ljmp	00183$
                                   1367 ;	sunkbd_hid.c:469: case 0xa1:
      0004F4                       1368 00142$:
                                   1369 ;	sunkbd_hid.c:473: if (sdat->wIndexL == 0) {
      0004F4 74 04            [12] 1370 	mov	a,#0x04
      0004F6 25 38            [12] 1371 	add	a,_sdat
      0004F8 FE               [12] 1372 	mov	r6,a
      0004F9 E4               [12] 1373 	clr	a
      0004FA 35 39            [12] 1374 	addc	a,(_sdat + 1)
      0004FC FF               [12] 1375 	mov	r7,a
      0004FD 8E 82            [24] 1376 	mov	dpl,r6
      0004FF 8F 83            [24] 1377 	mov	dph,r7
      000501 E0               [24] 1378 	movx	a,@dptr
      000502 70 12            [24] 1379 	jnz	00144$
                                   1380 ;	sunkbd_hid.c:475: in0buf(0) = 1; /* always send Report protocol */
      000504 90 7F 00         [24] 1381 	mov	dptr,#_IN0BUF
      000507 74 01            [12] 1382 	mov	a,#0x01
      000509 F0               [24] 1383 	movx	@dptr,a
                                   1384 ;	sunkbd_hid.c:476: IN0BC     = 0x01;
      00050A 90 7F B5         [24] 1385 	mov	dptr,#_IN0BC
      00050D F0               [24] 1386 	movx	@dptr,a
                                   1387 ;	sunkbd_hid.c:477: EP0CS     = 0x02;   /* clear HSNACK */
      00050E 90 7F B4         [24] 1388 	mov	dptr,#_EP0CS
      000511 04               [12] 1389 	inc	a
      000512 F0               [24] 1390 	movx	@dptr,a
      000513 02 06 60         [24] 1391 	ljmp	00183$
      000516                       1392 00144$:
                                   1393 ;	sunkbd_hid.c:479: EP0CS  = 0x03;   /* stall */
      000516 90 7F B4         [24] 1394 	mov	dptr,#_EP0CS
      000519 74 03            [12] 1395 	mov	a,#0x03
      00051B F0               [24] 1396 	movx	@dptr,a
                                   1397 ;	sunkbd_hid.c:480: break;
      00051C 02 06 60         [24] 1398 	ljmp	00183$
                                   1399 ;	sunkbd_hid.c:482: default:
      00051F                       1400 00146$:
                                   1401 ;	sunkbd_hid.c:483: EP0CS     = 0x03;   /* stall */
      00051F 90 7F B4         [24] 1402 	mov	dptr,#_EP0CS
      000522 74 03            [12] 1403 	mov	a,#0x03
      000524 F0               [24] 1404 	movx	@dptr,a
                                   1405 ;	sunkbd_hid.c:486: break;
      000525 02 06 60         [24] 1406 	ljmp	00183$
                                   1407 ;	sunkbd_hid.c:489: case 0x06:
      000528                       1408 00148$:
                                   1409 ;	sunkbd_hid.c:490: get_descriptor(/*sdat*/);
      000528 12 01 62         [24] 1410 	lcall	_get_descriptor
                                   1411 ;	sunkbd_hid.c:491: break;
      00052B 02 06 60         [24] 1412 	ljmp	00183$
                                   1413 ;	sunkbd_hid.c:494: case 0x08:
      00052E                       1414 00149$:
                                   1415 ;	sunkbd_hid.c:495: if (sdat->bmRequestType == 0x80) {
      00052E 85 38 82         [24] 1416 	mov	dpl,_sdat
      000531 85 39 83         [24] 1417 	mov	dph,(_sdat + 1)
      000534 E0               [24] 1418 	movx	a,@dptr
      000535 FF               [12] 1419 	mov	r7,a
      000536 BF 80 12         [24] 1420 	cjne	r7,#0x80,00151$
                                   1421 ;	sunkbd_hid.c:496: in0buf(0) = 0x01;
      000539 90 7F 00         [24] 1422 	mov	dptr,#_IN0BUF
      00053C 74 01            [12] 1423 	mov	a,#0x01
      00053E F0               [24] 1424 	movx	@dptr,a
                                   1425 ;	sunkbd_hid.c:497: IN0BC     = 0x01;
      00053F 90 7F B5         [24] 1426 	mov	dptr,#_IN0BC
      000542 F0               [24] 1427 	movx	@dptr,a
                                   1428 ;	sunkbd_hid.c:498: EP0CS     = 0x02;   /* clear HSNACK */
      000543 90 7F B4         [24] 1429 	mov	dptr,#_EP0CS
      000546 04               [12] 1430 	inc	a
      000547 F0               [24] 1431 	movx	@dptr,a
      000548 02 06 60         [24] 1432 	ljmp	00183$
      00054B                       1433 00151$:
                                   1434 ;	sunkbd_hid.c:500: EP0CS     = 0x03;   /* stall */
      00054B 90 7F B4         [24] 1435 	mov	dptr,#_EP0CS
      00054E 74 03            [12] 1436 	mov	a,#0x03
      000550 F0               [24] 1437 	movx	@dptr,a
                                   1438 ;	sunkbd_hid.c:502: break;
      000551 02 06 60         [24] 1439 	ljmp	00183$
                                   1440 ;	sunkbd_hid.c:505: case 0x09:
      000554                       1441 00153$:
                                   1442 ;	sunkbd_hid.c:506: switch (sdat->bmRequestType) {
      000554 85 38 82         [24] 1443 	mov	dpl,_sdat
      000557 85 39 83         [24] 1444 	mov	dph,(_sdat + 1)
      00055A E0               [24] 1445 	movx	a,@dptr
      00055B FF               [12] 1446 	mov	r7,a
      00055C 60 05            [24] 1447 	jz	00154$
                                   1448 ;	sunkbd_hid.c:508: case 0x00:
      00055E BF 21 15         [24] 1449 	cjne	r7,#0x21,00156$
      000561 80 09            [24] 1450 	sjmp	00155$
      000563                       1451 00154$:
                                   1452 ;	sunkbd_hid.c:509: EP0CS     = 0x02;   /* clear HSNACK */
      000563 90 7F B4         [24] 1453 	mov	dptr,#_EP0CS
      000566 74 02            [12] 1454 	mov	a,#0x02
      000568 F0               [24] 1455 	movx	@dptr,a
                                   1456 ;	sunkbd_hid.c:510: break;
      000569 02 06 60         [24] 1457 	ljmp	00183$
                                   1458 ;	sunkbd_hid.c:513: case 0x21:
      00056C                       1459 00155$:
                                   1460 ;	sunkbd_hid.c:516: is_ctrl_out0_kbd = TRUE;
      00056C D2 01            [12] 1461 	setb	_is_ctrl_out0_kbd
                                   1462 ;	sunkbd_hid.c:517: OUT0BC   = 0x00;    /* arm endpoint OUT0 */
      00056E 90 7F C5         [24] 1463 	mov	dptr,#_OUT0BC
      000571 E4               [12] 1464 	clr	a
      000572 F0               [24] 1465 	movx	@dptr,a
                                   1466 ;	sunkbd_hid.c:520: break;
      000573 02 06 60         [24] 1467 	ljmp	00183$
                                   1468 ;	sunkbd_hid.c:522: default:
      000576                       1469 00156$:
                                   1470 ;	sunkbd_hid.c:523: EP0CS     = 0x03;   /* stall */
      000576 90 7F B4         [24] 1471 	mov	dptr,#_EP0CS
      000579 74 03            [12] 1472 	mov	a,#0x03
      00057B F0               [24] 1473 	movx	@dptr,a
                                   1474 ;	sunkbd_hid.c:526: break;
      00057C 02 06 60         [24] 1475 	ljmp	00183$
                                   1476 ;	sunkbd_hid.c:529: case 0x0a:
      00057F                       1477 00158$:
                                   1478 ;	sunkbd_hid.c:530: switch (sdat->bmRequestType) {
      00057F 85 38 82         [24] 1479 	mov	dpl,_sdat
      000582 85 39 83         [24] 1480 	mov	dph,(_sdat + 1)
      000585 E0               [24] 1481 	movx	a,@dptr
      000586 FF               [12] 1482 	mov	r7,a
      000587 BF 21 02         [24] 1483 	cjne	r7,#0x21,00356$
      00058A 80 15            [24] 1484 	sjmp	00160$
      00058C                       1485 00356$:
      00058C BF 81 56         [24] 1486 	cjne	r7,#0x81,00167$
                                   1487 ;	sunkbd_hid.c:533: in0buf(0) = 0x00;
      00058F 90 7F 00         [24] 1488 	mov	dptr,#_IN0BUF
      000592 E4               [12] 1489 	clr	a
      000593 F0               [24] 1490 	movx	@dptr,a
                                   1491 ;	sunkbd_hid.c:534: IN0BC     = 0x01;
      000594 90 7F B5         [24] 1492 	mov	dptr,#_IN0BC
      000597 04               [12] 1493 	inc	a
      000598 F0               [24] 1494 	movx	@dptr,a
                                   1495 ;	sunkbd_hid.c:535: EP0CS     = 0x02;   /* clear HSNACK */
      000599 90 7F B4         [24] 1496 	mov	dptr,#_EP0CS
      00059C 04               [12] 1497 	inc	a
      00059D F0               [24] 1498 	movx	@dptr,a
                                   1499 ;	sunkbd_hid.c:536: break;
      00059E 02 06 60         [24] 1500 	ljmp	00183$
                                   1501 ;	sunkbd_hid.c:539: case 0x21:
      0005A1                       1502 00160$:
                                   1503 ;	sunkbd_hid.c:565: if (sdat->wIndexL == 0) {
      0005A1 74 04            [12] 1504 	mov	a,#0x04
      0005A3 25 38            [12] 1505 	add	a,_sdat
      0005A5 FE               [12] 1506 	mov	r6,a
      0005A6 E4               [12] 1507 	clr	a
      0005A7 35 39            [12] 1508 	addc	a,(_sdat + 1)
      0005A9 FF               [12] 1509 	mov	r7,a
      0005AA 8E 82            [24] 1510 	mov	dpl,r6
      0005AC 8F 83            [24] 1511 	mov	dph,r7
      0005AE E0               [24] 1512 	movx	a,@dptr
      0005AF 70 2B            [24] 1513 	jnz	00165$
                                   1514 ;	sunkbd_hid.c:567: if (sdat->wValueH > 0) {
      0005B1 74 03            [12] 1515 	mov	a,#0x03
      0005B3 25 38            [12] 1516 	add	a,_sdat
      0005B5 FE               [12] 1517 	mov	r6,a
      0005B6 E4               [12] 1518 	clr	a
      0005B7 35 39            [12] 1519 	addc	a,(_sdat + 1)
      0005B9 FF               [12] 1520 	mov	r7,a
      0005BA 8E 82            [24] 1521 	mov	dpl,r6
      0005BC 8F 83            [24] 1522 	mov	dph,r7
      0005BE E0               [24] 1523 	movx	a,@dptr
      0005BF 60 10            [24] 1524 	jz	00162$
                                   1525 ;	sunkbd_hid.c:569: kbd_idle_mode     = FALSE;
      0005C1 C2 02            [12] 1526 	clr	_kbd_idle_mode
                                   1527 ;	sunkbd_hid.c:570: kbd_idle_duration = sdat->wValueH;
      0005C3 85 38 82         [24] 1528 	mov	dpl,_sdat
      0005C6 85 39 83         [24] 1529 	mov	dph,(_sdat + 1)
      0005C9 A3               [24] 1530 	inc	dptr
      0005CA A3               [24] 1531 	inc	dptr
      0005CB A3               [24] 1532 	inc	dptr
      0005CC E0               [24] 1533 	movx	a,@dptr
      0005CD F5 2E            [12] 1534 	mov	_kbd_idle_duration,a
      0005CF 80 02            [24] 1535 	sjmp	00163$
      0005D1                       1536 00162$:
                                   1537 ;	sunkbd_hid.c:578: kbd_idle_mode     = TRUE;
      0005D1 D2 02            [12] 1538 	setb	_kbd_idle_mode
      0005D3                       1539 00163$:
                                   1540 ;	sunkbd_hid.c:585: EP0CS  = 0x02;   /* clear HSNACK */
      0005D3 90 7F B4         [24] 1541 	mov	dptr,#_EP0CS
      0005D6 74 02            [12] 1542 	mov	a,#0x02
      0005D8 F0               [24] 1543 	movx	@dptr,a
      0005D9 02 06 60         [24] 1544 	ljmp	00183$
      0005DC                       1545 00165$:
                                   1546 ;	sunkbd_hid.c:587: EP0CS  = 0x03;   /* stall */
      0005DC 90 7F B4         [24] 1547 	mov	dptr,#_EP0CS
      0005DF 74 03            [12] 1548 	mov	a,#0x03
      0005E1 F0               [24] 1549 	movx	@dptr,a
                                   1550 ;	sunkbd_hid.c:589: break;
      0005E2 02 06 60         [24] 1551 	ljmp	00183$
                                   1552 ;	sunkbd_hid.c:591: default:
      0005E5                       1553 00167$:
                                   1554 ;	sunkbd_hid.c:592: EP0CS     = 0x03;   /* stall */
      0005E5 90 7F B4         [24] 1555 	mov	dptr,#_EP0CS
      0005E8 74 03            [12] 1556 	mov	a,#0x03
      0005EA F0               [24] 1557 	movx	@dptr,a
                                   1558 ;	sunkbd_hid.c:595: break;
      0005EB 02 06 60         [24] 1559 	ljmp	00183$
                                   1560 ;	sunkbd_hid.c:598: case 0x0b:
      0005EE                       1561 00169$:
                                   1562 ;	sunkbd_hid.c:599: switch (sdat->bmRequestType) {
      0005EE 85 38 82         [24] 1563 	mov	dpl,_sdat
      0005F1 85 39 83         [24] 1564 	mov	dph,(_sdat + 1)
      0005F4 E0               [24] 1565 	movx	a,@dptr
      0005F5 FF               [12] 1566 	mov	r7,a
      0005F6 BF 01 02         [24] 1567 	cjne	r7,#0x01,00361$
      0005F9 80 05            [24] 1568 	sjmp	00170$
      0005FB                       1569 00361$:
                                   1570 ;	sunkbd_hid.c:601: case 0x01:
      0005FB BF 21 54         [24] 1571 	cjne	r7,#0x21,00178$
      0005FE 80 4A            [24] 1572 	sjmp	00177$
      000600                       1573 00170$:
                                   1574 ;	sunkbd_hid.c:602: if (sdat->wValueL == 0) { /* only AS 0 supported */
      000600 74 02            [12] 1575 	mov	a,#0x02
      000602 25 38            [12] 1576 	add	a,_sdat
      000604 FE               [12] 1577 	mov	r6,a
      000605 E4               [12] 1578 	clr	a
      000606 35 39            [12] 1579 	addc	a,(_sdat + 1)
      000608 FF               [12] 1580 	mov	r7,a
      000609 8E 82            [24] 1581 	mov	dpl,r6
      00060B 8F 83            [24] 1582 	mov	dph,r7
      00060D E0               [24] 1583 	movx	a,@dptr
      00060E 70 32            [24] 1584 	jnz	00175$
                                   1585 ;	sunkbd_hid.c:616: if (sdat->wIndexL == 0) {
      000610 74 04            [12] 1586 	mov	a,#0x04
      000612 25 38            [12] 1587 	add	a,_sdat
      000614 FE               [12] 1588 	mov	r6,a
      000615 E4               [12] 1589 	clr	a
      000616 35 39            [12] 1590 	addc	a,(_sdat + 1)
      000618 FF               [12] 1591 	mov	r7,a
      000619 8E 82            [24] 1592 	mov	dpl,r6
      00061B 8F 83            [24] 1593 	mov	dph,r7
      00061D E0               [24] 1594 	movx	a,@dptr
      00061E 70 1A            [24] 1595 	jnz	00172$
                                   1596 ;	sunkbd_hid.c:617: IN1CS  |= 0x02;     /* remove busy */
      000620 90 7F B6         [24] 1597 	mov	dptr,#_IN1CS
      000623 E0               [24] 1598 	movx	a,@dptr
      000624 FF               [12] 1599 	mov	r7,a
      000625 74 02            [12] 1600 	mov	a,#0x02
      000627 4F               [12] 1601 	orl	a,r7
      000628 F0               [24] 1602 	movx	@dptr,a
                                   1603 ;	sunkbd_hid.c:618: TOGCTL = 0x11;
      000629 90 7F D7         [24] 1604 	mov	dptr,#_TOGCTL
      00062C 74 11            [12] 1605 	mov	a,#0x11
      00062E F0               [24] 1606 	movx	@dptr,a
                                   1607 ;	sunkbd_hid.c:619: TOGCTL = 0x31;      /* reset toggle of IN1 */
      00062F 74 31            [12] 1608 	mov	a,#0x31
      000631 F0               [24] 1609 	movx	@dptr,a
                                   1610 ;	sunkbd_hid.c:622: EP0CS     = 0x02;   /* clear HSNACK */
      000632 90 7F B4         [24] 1611 	mov	dptr,#_EP0CS
      000635 74 02            [12] 1612 	mov	a,#0x02
      000637 F0               [24] 1613 	movx	@dptr,a
      000638 80 26            [24] 1614 	sjmp	00183$
      00063A                       1615 00172$:
                                   1616 ;	sunkbd_hid.c:624: EP0CS  = 0x03;   /* stall */
      00063A 90 7F B4         [24] 1617 	mov	dptr,#_EP0CS
      00063D 74 03            [12] 1618 	mov	a,#0x03
      00063F F0               [24] 1619 	movx	@dptr,a
      000640 80 1E            [24] 1620 	sjmp	00183$
      000642                       1621 00175$:
                                   1622 ;	sunkbd_hid.c:626: EP0CS  = 0x03;   /* stall */
      000642 90 7F B4         [24] 1623 	mov	dptr,#_EP0CS
      000645 74 03            [12] 1624 	mov	a,#0x03
      000647 F0               [24] 1625 	movx	@dptr,a
                                   1626 ;	sunkbd_hid.c:627: break;
                                   1627 ;	sunkbd_hid.c:630: case 0x21:
      000648 80 16            [24] 1628 	sjmp	00183$
      00064A                       1629 00177$:
                                   1630 ;	sunkbd_hid.c:631: EP0CS     = 0x02;   /* clear HSNACK */
      00064A 90 7F B4         [24] 1631 	mov	dptr,#_EP0CS
      00064D 74 02            [12] 1632 	mov	a,#0x02
      00064F F0               [24] 1633 	movx	@dptr,a
                                   1634 ;	sunkbd_hid.c:632: break;
                                   1635 ;	sunkbd_hid.c:634: default:
      000650 80 0E            [24] 1636 	sjmp	00183$
      000652                       1637 00178$:
                                   1638 ;	sunkbd_hid.c:635: EP0CS     = 0x03;   /* stall */
      000652 90 7F B4         [24] 1639 	mov	dptr,#_EP0CS
      000655 74 03            [12] 1640 	mov	a,#0x03
      000657 F0               [24] 1641 	movx	@dptr,a
                                   1642 ;	sunkbd_hid.c:638: break;
                                   1643 ;	sunkbd_hid.c:640: default:
      000658 80 06            [24] 1644 	sjmp	00183$
      00065A                       1645 00180$:
                                   1646 ;	sunkbd_hid.c:641: EP0CS     = 0x03;   /* stall */
      00065A 90 7F B4         [24] 1647 	mov	dptr,#_EP0CS
      00065D 74 03            [12] 1648 	mov	a,#0x03
      00065F F0               [24] 1649 	movx	@dptr,a
                                   1650 ;	sunkbd_hid.c:643: }
      000660                       1651 00183$:
                                   1652 ;	sunkbd_hid.c:649: if (IN07IRQ & 0x01) {
      000660 90 7F A9         [24] 1653 	mov	dptr,#_IN07IRQ
      000663 E0               [24] 1654 	movx	a,@dptr
      000664 FF               [12] 1655 	mov	r7,a
      000665 30 E0 06         [24] 1656 	jnb	acc.0,00185$
                                   1657 ;	sunkbd_hid.c:651: IN07IRQ = 0x01;
      000668 90 7F A9         [24] 1658 	mov	dptr,#_IN07IRQ
      00066B 74 01            [12] 1659 	mov	a,#0x01
      00066D F0               [24] 1660 	movx	@dptr,a
      00066E                       1661 00185$:
                                   1662 ;	sunkbd_hid.c:656: if (IN07IRQ & 0x02) {
      00066E 90 7F A9         [24] 1663 	mov	dptr,#_IN07IRQ
      000671 E0               [24] 1664 	movx	a,@dptr
      000672 FF               [12] 1665 	mov	r7,a
      000673 30 E1 08         [24] 1666 	jnb	acc.1,00187$
                                   1667 ;	sunkbd_hid.c:658: IN07IRQ = 0x02;
      000676 90 7F A9         [24] 1668 	mov	dptr,#_IN07IRQ
      000679 74 02            [12] 1669 	mov	a,#0x02
      00067B F0               [24] 1670 	movx	@dptr,a
                                   1671 ;	sunkbd_hid.c:661: in1_busy = FALSE;
      00067C C2 03            [12] 1672 	clr	_in1_busy
      00067E                       1673 00187$:
                                   1674 ;	sunkbd_hid.c:676: if (OUT07IRQ & 0x01) {
      00067E 90 7F AA         [24] 1675 	mov	dptr,#_OUT07IRQ
      000681 E0               [24] 1676 	movx	a,@dptr
      000682 FF               [12] 1677 	mov	r7,a
      000683 30 E0 3B         [24] 1678 	jnb	acc.0,00191$
                                   1679 ;	sunkbd_hid.c:678: OUT07IRQ = 0x01;
      000686 90 7F AA         [24] 1680 	mov	dptr,#_OUT07IRQ
      000689 74 01            [12] 1681 	mov	a,#0x01
      00068B F0               [24] 1682 	movx	@dptr,a
                                   1683 ;	sunkbd_hid.c:682: if (is_ctrl_out0_kbd) {
      00068C 30 01 2D         [24] 1684 	jnb	_is_ctrl_out0_kbd,00189$
                                   1685 ;	sunkbd_hid.c:683: Byte led_status = out0buf(0);
      00068F 90 7E C0         [24] 1686 	mov	dptr,#_OUT0BUF
      000692 E0               [24] 1687 	movx	a,@dptr
      000693 FF               [12] 1688 	mov	r7,a
                                   1689 ;	sunkbd_hid.c:689: SBUF0 = SUNKBD_CMD_SETLED;
      000694 75 99 0E         [24] 1690 	mov	_SBUF0,#0x0e
                                   1691 ;	sunkbd_hid.c:691: kbd_txmit_me = ((led_status & 0x02) << 2) | (led_status & 0x04) |
      000697 74 02            [12] 1692 	mov	a,#0x02
      000699 5F               [12] 1693 	anl	a,r7
      00069A 25 E0            [12] 1694 	add	a,acc
      00069C 25 E0            [12] 1695 	add	a,acc
      00069E FE               [12] 1696 	mov	r6,a
      00069F 74 04            [12] 1697 	mov	a,#0x04
      0006A1 5F               [12] 1698 	anl	a,r7
      0006A2 42 0E            [12] 1699 	orl	ar6,a
                                   1700 ;	sunkbd_hid.c:692: ((led_status & 0x08) >> 2) | (led_status & 0x01);
      0006A4 74 08            [12] 1701 	mov	a,#0x08
      0006A6 5F               [12] 1702 	anl	a,r7
      0006A7 03               [12] 1703 	rr	a
      0006A8 03               [12] 1704 	rr	a
      0006A9 54 3F            [12] 1705 	anl	a,#0x3f
      0006AB FD               [12] 1706 	mov	r5,a
      0006AC 42 0E            [12] 1707 	orl	ar6,a
      0006AE 74 01            [12] 1708 	mov	a,#0x01
      0006B0 5F               [12] 1709 	anl	a,r7
      0006B1 4E               [12] 1710 	orl	a,r6
      0006B2 F5 2D            [12] 1711 	mov	_kbd_txmit_me,a
                                   1712 ;	sunkbd_hid.c:694: is_ctrl_out0_kbd = FALSE;
      0006B4 C2 01            [12] 1713 	clr	_is_ctrl_out0_kbd
                                   1714 ;	sunkbd_hid.c:695: EP0CS            = 0x02;   /* clear HSNACK */
      0006B6 90 7F B4         [24] 1715 	mov	dptr,#_EP0CS
      0006B9 74 02            [12] 1716 	mov	a,#0x02
      0006BB F0               [24] 1717 	movx	@dptr,a
      0006BC                       1718 00189$:
                                   1719 ;	sunkbd_hid.c:700: OUT0BC = 0x00;
      0006BC 90 7F C5         [24] 1720 	mov	dptr,#_OUT0BC
      0006BF E4               [12] 1721 	clr	a
      0006C0 F0               [24] 1722 	movx	@dptr,a
      0006C1                       1723 00191$:
                                   1724 ;	sunkbd_hid.c:704: if (USBIRQ & 0x10) {
      0006C1 90 7F AB         [24] 1725 	mov	dptr,#_USBIRQ
      0006C4 E0               [24] 1726 	movx	a,@dptr
      0006C5 FF               [12] 1727 	mov	r7,a
      0006C6 30 E4 0F         [24] 1728 	jnb	acc.4,00194$
                                   1729 ;	sunkbd_hid.c:706: USBIRQ = 0x10;
      0006C9 90 7F AB         [24] 1730 	mov	dptr,#_USBIRQ
      0006CC 74 10            [12] 1731 	mov	a,#0x10
      0006CE F0               [24] 1732 	movx	@dptr,a
                                   1733 ;	sunkbd_hid.c:708: apply_reset_values();
      0006CF 75 D0 00         [24] 1734 	mov	psw,#0x00
      0006D2 12 01 53         [24] 1735 	lcall	_apply_reset_values
      0006D5 75 D0 08         [24] 1736 	mov	psw,#0x08
      0006D8                       1737 00194$:
      0006D8 D0 D0            [24] 1738 	pop	psw
      0006DA D0 00            [24] 1739 	pop	(0+0)
      0006DC D0 01            [24] 1740 	pop	(0+1)
      0006DE D0 02            [24] 1741 	pop	(0+2)
      0006E0 D0 03            [24] 1742 	pop	(0+3)
      0006E2 D0 04            [24] 1743 	pop	(0+4)
      0006E4 D0 05            [24] 1744 	pop	(0+5)
      0006E6 D0 06            [24] 1745 	pop	(0+6)
      0006E8 D0 07            [24] 1746 	pop	(0+7)
      0006EA D0 83            [24] 1747 	pop	dph
      0006EC D0 82            [24] 1748 	pop	dpl
      0006EE D0 F0            [24] 1749 	pop	b
      0006F0 D0 E0            [24] 1750 	pop	acc
      0006F2 D0 21            [24] 1751 	pop	bits
      0006F4 D2 AF            [12] 1752 	setb	ea
      0006F6 32               [24] 1753 	reti
                                   1754 ;------------------------------------------------------------
                                   1755 ;Allocation info for local variables in function 'kbd_serial_isr'
                                   1756 ;------------------------------------------------------------
                                   1757 ;scancode                  Allocated to registers r7 
                                   1758 ;mod_map                   Allocated to registers r6 
                                   1759 ;i                         Allocated to registers r6 
                                   1760 ;------------------------------------------------------------
                                   1761 ;	sunkbd_hid.c:722: static void kbd_serial_isr(void) __interrupt (4) __using (2) __critical
                                   1762 ;	-----------------------------------------
                                   1763 ;	 function kbd_serial_isr
                                   1764 ;	-----------------------------------------
      0006F7                       1765 _kbd_serial_isr:
                           000017  1766 	ar7 = 0x17
                           000016  1767 	ar6 = 0x16
                           000015  1768 	ar5 = 0x15
                           000014  1769 	ar4 = 0x14
                           000013  1770 	ar3 = 0x13
                           000012  1771 	ar2 = 0x12
                           000011  1772 	ar1 = 0x11
                           000010  1773 	ar0 = 0x10
      0006F7 C2 AF            [12] 1774 	clr	ea
      0006F9 C0 E0            [24] 1775 	push	acc
      0006FB C0 82            [24] 1776 	push	dpl
      0006FD C0 83            [24] 1777 	push	dph
      0006FF C0 D0            [24] 1778 	push	psw
      000701 75 D0 10         [24] 1779 	mov	psw,#0x10
                                   1780 ;	sunkbd_hid.c:729: if (RI_0) {
      000704 20 98 03         [24] 1781 	jb	_RI_0,00232$
      000707 02 08 15         [24] 1782 	ljmp	00145$
      00070A                       1783 00232$:
                                   1784 ;	sunkbd_hid.c:731: scancode = SBUF0;
      00070A AF 99            [24] 1785 	mov	r7,_SBUF0
                                   1786 ;	sunkbd_hid.c:733: RI_0 = 0;
      00070C C2 98            [12] 1787 	clr	_RI_0
                                   1788 ;	sunkbd_hid.c:747: switch (scancode) {
      00070E BF 7F 02         [24] 1789 	cjne	r7,#0x7f,00233$
      000711 80 14            [24] 1790 	sjmp	00157$
      000713                       1791 00233$:
      000713 BF FE 02         [24] 1792 	cjne	r7,#0xfe,00234$
      000716 80 09            [24] 1793 	sjmp	00106$
      000718                       1794 00234$:
      000718 BF FF 21         [24] 1795 	cjne	r7,#0xff,00111$
                                   1796 ;	sunkbd_hid.c:750: sunkbd_reset = -1;
      00071B 75 23 FF         [24] 1797 	mov	_sunkbd_reset,#0xff
                                   1798 ;	sunkbd_hid.c:751: break;
      00071E 02 08 15         [24] 1799 	ljmp	00145$
                                   1800 ;	sunkbd_hid.c:753: case SUNKBD_RET_LAYOUT:
      000721                       1801 00106$:
                                   1802 ;	sunkbd_hid.c:754: sunkbd_layout = -1;
      000721 75 24 FF         [24] 1803 	mov	_sunkbd_layout,#0xff
                                   1804 ;	sunkbd_hid.c:755: break;
      000724 02 08 15         [24] 1805 	ljmp	00145$
                                   1806 ;	sunkbd_hid.c:760: while (i-- > 0)
      000727                       1807 00157$:
      000727 7E 08            [12] 1808 	mov	r6,#0x08
      000729                       1809 00108$:
      000729 8E 15            [24] 1810 	mov	ar5,r6
      00072B 1E               [12] 1811 	dec	r6
      00072C ED               [12] 1812 	mov	a,r5
      00072D 60 08            [24] 1813 	jz	00110$
                                   1814 ;	sunkbd_hid.c:761: key_buffer[i] = 0;
      00072F EE               [12] 1815 	mov	a,r6
      000730 24 25            [12] 1816 	add	a,#_key_buffer
      000732 F8               [12] 1817 	mov	r0,a
      000733 76 00            [12] 1818 	mov	@r0,#0x00
      000735 80 F2            [24] 1819 	sjmp	00108$
      000737                       1820 00110$:
                                   1821 ;	sunkbd_hid.c:762: kbd_new_keys   = TRUE;
      000737 D2 00            [12] 1822 	setb	_kbd_new_keys
                                   1823 ;	sunkbd_hid.c:763: break;
      000739 02 08 15         [24] 1824 	ljmp	00145$
                                   1825 ;	sunkbd_hid.c:765: default:
      00073C                       1826 00111$:
                                   1827 ;	sunkbd_hid.c:766: parse_scancode = 0;
      00073C C2 04            [12] 1828 	clr	_kbd_serial_isr_parse_scancode_1_58
                                   1829 ;	sunkbd_hid.c:768: switch (scancode & SUNKBD_KEY) {
      00073E 74 7F            [12] 1830 	mov	a,#0x7f
      000740 5F               [12] 1831 	anl	a,r7
      000741 FE               [12] 1832 	mov	r6,a
      000742 BE 0D 02         [24] 1833 	cjne	r6,#0x0d,00238$
      000745 80 3C            [24] 1834 	sjmp	00117$
      000747                       1835 00238$:
      000747 BE 13 02         [24] 1836 	cjne	r6,#0x13,00239$
      00074A 80 2B            [24] 1837 	sjmp	00114$
      00074C                       1838 00239$:
      00074C BE 31 02         [24] 1839 	cjne	r6,#0x31,00240$
      00074F 80 46            [24] 1840 	sjmp	00120$
      000751                       1841 00240$:
      000751 BE 48 02         [24] 1842 	cjne	r6,#0x48,00241$
      000754 80 35            [24] 1843 	sjmp	00119$
      000756                       1844 00241$:
      000756 BE 4C 02         [24] 1845 	cjne	r6,#0x4c,00242$
      000759 80 14            [24] 1846 	sjmp	00112$
      00075B                       1847 00242$:
      00075B BE 63 02         [24] 1848 	cjne	r6,#0x63,00243$
      00075E 80 13            [24] 1849 	sjmp	00113$
      000760                       1850 00243$:
      000760 BE 6E 02         [24] 1851 	cjne	r6,#0x6e,00244$
      000763 80 1A            [24] 1852 	sjmp	00116$
      000765                       1853 00244$:
      000765 BE 78 02         [24] 1854 	cjne	r6,#0x78,00245$
      000768 80 11            [24] 1855 	sjmp	00115$
      00076A                       1856 00245$:
                                   1857 ;	sunkbd_hid.c:770: case 0x4c:
      00076A BE 7A 36         [24] 1858 	cjne	r6,#0x7a,00121$
      00076D 80 18            [24] 1859 	sjmp	00118$
      00076F                       1860 00112$:
                                   1861 ;	sunkbd_hid.c:771: mod_map        = 0x01;
      00076F 7E 01            [12] 1862 	mov	r6,#0x01
                                   1863 ;	sunkbd_hid.c:772: break;
                                   1864 ;	sunkbd_hid.c:775: case 0x63:
      000771 80 34            [24] 1865 	sjmp	00122$
      000773                       1866 00113$:
                                   1867 ;	sunkbd_hid.c:776: mod_map        = 0x02;
      000773 7E 02            [12] 1868 	mov	r6,#0x02
                                   1869 ;	sunkbd_hid.c:777: break;
                                   1870 ;	sunkbd_hid.c:780: case 0x13:
      000775 80 30            [24] 1871 	sjmp	00122$
      000777                       1872 00114$:
                                   1873 ;	sunkbd_hid.c:781: mod_map        = 0x04;
      000777 7E 04            [12] 1874 	mov	r6,#0x04
                                   1875 ;	sunkbd_hid.c:782: break;
                                   1876 ;	sunkbd_hid.c:785: case 0x78:
      000779 80 2C            [24] 1877 	sjmp	00122$
      00077B                       1878 00115$:
                                   1879 ;	sunkbd_hid.c:786: mod_map        = 0x08;
      00077B 7E 08            [12] 1880 	mov	r6,#0x08
                                   1881 ;	sunkbd_hid.c:787: break;
                                   1882 ;	sunkbd_hid.c:790: case 0x6e:
      00077D 80 28            [24] 1883 	sjmp	00122$
      00077F                       1884 00116$:
                                   1885 ;	sunkbd_hid.c:791: mod_map        = 0x20;
      00077F 7E 20            [12] 1886 	mov	r6,#0x20
                                   1887 ;	sunkbd_hid.c:792: break;
                                   1888 ;	sunkbd_hid.c:795: case 0x0d:
      000781 80 24            [24] 1889 	sjmp	00122$
      000783                       1890 00117$:
                                   1891 ;	sunkbd_hid.c:796: mod_map        = 0x40;
      000783 7E 40            [12] 1892 	mov	r6,#0x40
                                   1893 ;	sunkbd_hid.c:797: break;
                                   1894 ;	sunkbd_hid.c:800: case 0x7a:
      000785 80 20            [24] 1895 	sjmp	00122$
      000787                       1896 00118$:
                                   1897 ;	sunkbd_hid.c:801: mod_map        = 0x80;
      000787 7E 80            [12] 1898 	mov	r6,#0x80
                                   1899 ;	sunkbd_hid.c:802: break;
                                   1900 ;	sunkbd_hid.c:805: case 0x48:
      000789 80 1C            [24] 1901 	sjmp	00122$
      00078B                       1902 00119$:
                                   1903 ;	sunkbd_hid.c:806: mod_map        = 0x04;
      00078B 7E 04            [12] 1904 	mov	r6,#0x04
                                   1905 ;	sunkbd_hid.c:807: scancode       = 0x09 | (scancode & SUNKBD_RELEASE);
      00078D 74 80            [12] 1906 	mov	a,#0x80
      00078F 5F               [12] 1907 	anl	a,r7
      000790 44 09            [12] 1908 	orl	a,#0x09
      000792 FF               [12] 1909 	mov	r7,a
                                   1910 ;	sunkbd_hid.c:808: parse_scancode = 1;
      000793 D2 04            [12] 1911 	setb	_kbd_serial_isr_parse_scancode_1_58
                                   1912 ;	sunkbd_hid.c:809: break;
                                   1913 ;	sunkbd_hid.c:812: case 0x31:
      000795 80 10            [24] 1914 	sjmp	00122$
      000797                       1915 00120$:
                                   1916 ;	sunkbd_hid.c:813: mod_map        = 0x04;
      000797 7E 04            [12] 1917 	mov	r6,#0x04
                                   1918 ;	sunkbd_hid.c:814: scancode       = 0x0b | (scancode & SUNKBD_RELEASE);
      000799 74 80            [12] 1919 	mov	a,#0x80
      00079B 5F               [12] 1920 	anl	a,r7
      00079C 44 0B            [12] 1921 	orl	a,#0x0b
      00079E FF               [12] 1922 	mov	r7,a
                                   1923 ;	sunkbd_hid.c:815: parse_scancode = 1;
      00079F D2 04            [12] 1924 	setb	_kbd_serial_isr_parse_scancode_1_58
                                   1925 ;	sunkbd_hid.c:816: break;
                                   1926 ;	sunkbd_hid.c:818: default:
      0007A1 80 04            [24] 1927 	sjmp	00122$
      0007A3                       1928 00121$:
                                   1929 ;	sunkbd_hid.c:819: mod_map        = 0;
      0007A3 7E 00            [12] 1930 	mov	r6,#0x00
                                   1931 ;	sunkbd_hid.c:820: parse_scancode = 1;
      0007A5 D2 04            [12] 1932 	setb	_kbd_serial_isr_parse_scancode_1_58
                                   1933 ;	sunkbd_hid.c:822: }
      0007A7                       1934 00122$:
                                   1935 ;	sunkbd_hid.c:825: if (mod_map) {
      0007A7 EE               [12] 1936 	mov	a,r6
      0007A8 60 16            [24] 1937 	jz	00127$
                                   1938 ;	sunkbd_hid.c:830: if (scancode & SUNKBD_RELEASE) {
      0007AA EF               [12] 1939 	mov	a,r7
      0007AB 30 E7 0B         [24] 1940 	jnb	acc.7,00124$
                                   1941 ;	sunkbd_hid.c:832: key_buffer[0] &= ~mod_map;
      0007AE EE               [12] 1942 	mov	a,r6
      0007AF F4               [12] 1943 	cpl	a
      0007B0 FD               [12] 1944 	mov	r5,a
      0007B1 55 25            [12] 1945 	anl	a,_key_buffer
      0007B3 F5 25            [12] 1946 	mov	_key_buffer,a
                                   1947 ;	sunkbd_hid.c:833: kbd_new_keys   = TRUE;
      0007B5 D2 00            [12] 1948 	setb	_kbd_new_keys
      0007B7 80 07            [24] 1949 	sjmp	00127$
      0007B9                       1950 00124$:
                                   1951 ;	sunkbd_hid.c:836: key_buffer[0] |= mod_map;
      0007B9 EE               [12] 1952 	mov	a,r6
      0007BA 45 25            [12] 1953 	orl	a,_key_buffer
      0007BC F5 25            [12] 1954 	mov	_key_buffer,a
                                   1955 ;	sunkbd_hid.c:837: kbd_new_keys   = TRUE;
      0007BE D2 00            [12] 1956 	setb	_kbd_new_keys
      0007C0                       1957 00127$:
                                   1958 ;	sunkbd_hid.c:842: if (parse_scancode) {
      0007C0 30 04 52         [24] 1959 	jnb	_kbd_serial_isr_parse_scancode_1_58,00145$
                                   1960 ;	sunkbd_hid.c:847: if (scancode & SUNKBD_RELEASE) {
      0007C3 EF               [12] 1961 	mov	a,r7
      0007C4 30 E7 26         [24] 1962 	jnb	acc.7,00139$
                                   1963 ;	sunkbd_hid.c:849: scancode &= SUNKBD_KEY;
      0007C7 53 17 7F         [24] 1964 	anl	ar7,#0x7f
                                   1965 ;	sunkbd_hid.c:850: scancode  = scancode_map[scancode];
      0007CA EF               [12] 1966 	mov	a,r7
      0007CB 90 0C E6         [24] 1967 	mov	dptr,#_scancode_map
      0007CE 93               [24] 1968 	movc	a,@a+dptr
      0007CF FF               [12] 1969 	mov	r7,a
                                   1970 ;	sunkbd_hid.c:852: while (i > 1) {
      0007D0 7E 07            [12] 1971 	mov	r6,#0x07
      0007D2                       1972 00130$:
      0007D2 EE               [12] 1973 	mov	a,r6
      0007D3 24 FE            [12] 1974 	add	a,#0xff - 0x01
      0007D5 50 12            [24] 1975 	jnc	00132$
                                   1976 ;	sunkbd_hid.c:853: if (key_buffer[i] == scancode)
      0007D7 EE               [12] 1977 	mov	a,r6
      0007D8 24 25            [12] 1978 	add	a,#_key_buffer
      0007DA F9               [12] 1979 	mov	r1,a
      0007DB E7               [12] 1980 	mov	a,@r1
      0007DC FD               [12] 1981 	mov	r5,a
      0007DD B5 17 06         [24] 1982 	cjne	a,ar7,00129$
                                   1983 ;	sunkbd_hid.c:854: key_buffer[i] = 0;
      0007E0 EE               [12] 1984 	mov	a,r6
      0007E1 24 25            [12] 1985 	add	a,#_key_buffer
      0007E3 F8               [12] 1986 	mov	r0,a
      0007E4 76 00            [12] 1987 	mov	@r0,#0x00
      0007E6                       1988 00129$:
                                   1989 ;	sunkbd_hid.c:855: i--;
      0007E6 1E               [12] 1990 	dec	r6
      0007E7 80 E9            [24] 1991 	sjmp	00130$
      0007E9                       1992 00132$:
                                   1993 ;	sunkbd_hid.c:857: kbd_new_keys = TRUE;
      0007E9 D2 00            [12] 1994 	setb	_kbd_new_keys
      0007EB 80 28            [24] 1995 	sjmp	00145$
      0007ED                       1996 00139$:
                                   1997 ;	sunkbd_hid.c:860: scancode &= SUNKBD_KEY;
      0007ED 53 17 7F         [24] 1998 	anl	ar7,#0x7f
                                   1999 ;	sunkbd_hid.c:861: scancode  = scancode_map[scancode];
      0007F0 EF               [12] 2000 	mov	a,r7
      0007F1 90 0C E6         [24] 2001 	mov	dptr,#_scancode_map
      0007F4 93               [24] 2002 	movc	a,@a+dptr
      0007F5 FF               [12] 2003 	mov	r7,a
                                   2004 ;	sunkbd_hid.c:862: i = 2;
      0007F6 7E 02            [12] 2005 	mov	r6,#0x02
                                   2006 ;	sunkbd_hid.c:863: while (i < 8) {
      0007F8 7D 02            [12] 2007 	mov	r5,#0x02
      0007FA                       2008 00135$:
      0007FA BD 08 00         [24] 2009 	cjne	r5,#0x08,00254$
      0007FD                       2010 00254$:
      0007FD 50 14            [24] 2011 	jnc	00137$
                                   2012 ;	sunkbd_hid.c:864: if (!key_buffer[i]) {
      0007FF ED               [12] 2013 	mov	a,r5
      000800 24 25            [12] 2014 	add	a,#_key_buffer
      000802 F9               [12] 2015 	mov	r1,a
      000803 E7               [12] 2016 	mov	a,@r1
      000804 70 08            [24] 2017 	jnz	00134$
                                   2018 ;	sunkbd_hid.c:865: key_buffer[i] = scancode;
      000806 EE               [12] 2019 	mov	a,r6
      000807 24 25            [12] 2020 	add	a,#_key_buffer
      000809 F8               [12] 2021 	mov	r0,a
      00080A A6 17            [24] 2022 	mov	@r0,ar7
                                   2023 ;	sunkbd_hid.c:866: break;
      00080C 80 05            [24] 2024 	sjmp	00137$
      00080E                       2025 00134$:
                                   2026 ;	sunkbd_hid.c:868: i++;
      00080E 0D               [12] 2027 	inc	r5
      00080F 8D 16            [24] 2028 	mov	ar6,r5
      000811 80 E7            [24] 2029 	sjmp	00135$
      000813                       2030 00137$:
                                   2031 ;	sunkbd_hid.c:870: kbd_new_keys = TRUE;
      000813 D2 00            [12] 2032 	setb	_kbd_new_keys
                                   2033 ;	sunkbd_hid.c:874: }
      000815                       2034 00145$:
                                   2035 ;	sunkbd_hid.c:880: if (TI_0) {
                                   2036 ;	sunkbd_hid.c:881: TI_0 = 0;
      000815 10 99 02         [24] 2037 	jbc	_TI_0,00257$
      000818 80 06            [24] 2038 	sjmp	00150$
      00081A                       2039 00257$:
                                   2040 ;	sunkbd_hid.c:885: SBUF0        = (Byte)kbd_txmit_me;
      00081A 85 2D 99         [24] 2041 	mov	_SBUF0,_kbd_txmit_me
                                   2042 ;	sunkbd_hid.c:886: kbd_txmit_me = -1;
      00081D 75 2D FF         [24] 2043 	mov	_kbd_txmit_me,#0xff
      000820                       2044 00150$:
      000820 D0 D0            [24] 2045 	pop	psw
      000822 D0 83            [24] 2046 	pop	dph
      000824 D0 82            [24] 2047 	pop	dpl
      000826 D0 E0            [24] 2048 	pop	acc
      000828 D2 AF            [12] 2049 	setb	ea
      00082A 32               [24] 2050 	reti
                                   2051 ;	eliminated unneeded push/pop b
                                   2052 ;------------------------------------------------------------
                                   2053 ;Allocation info for local variables in function 'timer2_isr'
                                   2054 ;------------------------------------------------------------
                                   2055 ;kbd_send_report           Allocated to registers r7 
                                   2056 ;i                         Allocated to registers r6 
                                   2057 ;------------------------------------------------------------
                                   2058 ;	sunkbd_hid.c:1005: static void timer2_isr() __interrupt (5) __using (3) __critical
                                   2059 ;	-----------------------------------------
                                   2060 ;	 function timer2_isr
                                   2061 ;	-----------------------------------------
      00082B                       2062 _timer2_isr:
                           00001F  2063 	ar7 = 0x1f
                           00001E  2064 	ar6 = 0x1e
                           00001D  2065 	ar5 = 0x1d
                           00001C  2066 	ar4 = 0x1c
                           00001B  2067 	ar3 = 0x1b
                           00001A  2068 	ar2 = 0x1a
                           000019  2069 	ar1 = 0x19
                           000018  2070 	ar0 = 0x18
      00082B C2 AF            [12] 2071 	clr	ea
      00082D C0 21            [24] 2072 	push	bits
      00082F C0 E0            [24] 2073 	push	acc
      000831 C0 F0            [24] 2074 	push	b
      000833 C0 82            [24] 2075 	push	dpl
      000835 C0 83            [24] 2076 	push	dph
      000837 C0 07            [24] 2077 	push	(0+7)
      000839 C0 06            [24] 2078 	push	(0+6)
      00083B C0 05            [24] 2079 	push	(0+5)
      00083D C0 04            [24] 2080 	push	(0+4)
      00083F C0 03            [24] 2081 	push	(0+3)
      000841 C0 02            [24] 2082 	push	(0+2)
      000843 C0 01            [24] 2083 	push	(0+1)
      000845 C0 00            [24] 2084 	push	(0+0)
      000847 C0 D0            [24] 2085 	push	psw
      000849 75 D0 18         [24] 2086 	mov	psw,#0x18
                                   2087 ;	sunkbd_hid.c:1015: if (TF2) {
                                   2088 ;	sunkbd_hid.c:1016: TF2 = 0;
      00084C 10 CF 03         [24] 2089 	jbc	_TF2,00185$
      00084F 02 09 9F         [24] 2090 	ljmp	00133$
      000852                       2091 00185$:
                                   2092 ;	sunkbd_hid.c:1022: kbd_send_report = FALSE;
      000852 7F 00            [12] 2093 	mov	r7,#0x00
                                   2094 ;	sunkbd_hid.c:1024: if (!kbd_idle_mode) {
      000854 20 02 08         [24] 2095 	jb	_kbd_idle_mode,00104$
                                   2096 ;	sunkbd_hid.c:1025: if (--kbd_idle_counter == 0) {
      000857 D5 2F 05         [24] 2097 	djnz	_kbd_idle_counter,00104$
                                   2098 ;	sunkbd_hid.c:1026: kbd_send_report  = TRUE;
      00085A 7F 01            [12] 2099 	mov	r7,#0x01
                                   2100 ;	sunkbd_hid.c:1028: kbd_idle_counter = kbd_idle_duration;
      00085C 85 2E 2F         [24] 2101 	mov	_kbd_idle_counter,_kbd_idle_duration
      00085F                       2102 00104$:
                                   2103 ;	sunkbd_hid.c:1033: if (kbd_new_keys) {
      00085F 30 00 07         [24] 2104 	jnb	_kbd_new_keys,00106$
                                   2105 ;	sunkbd_hid.c:1034: kbd_send_report     = TRUE;
      000862 7F 01            [12] 2106 	mov	r7,#0x01
                                   2107 ;	sunkbd_hid.c:1035: kbd_new_keys        = FALSE;
      000864 C2 00            [12] 2108 	clr	_kbd_new_keys
                                   2109 ;	sunkbd_hid.c:1037: kbd_idle_counter    = kbd_idle_duration;
      000866 85 2E 2F         [24] 2110 	mov	_kbd_idle_counter,_kbd_idle_duration
      000869                       2111 00106$:
                                   2112 ;	sunkbd_hid.c:1041: if (!firmusb_inject_start) {
      000869 E5 5D            [12] 2113 	mov	a,_firmusb_inject_start
      00086B 45 5E            [12] 2114 	orl	a,(_firmusb_inject_start + 1)
      00086D 70 28            [24] 2115 	jnz	00110$
                                   2116 ;	sunkbd_hid.c:1042: firmusb_inject_counter++;
      00086F 05 58            [12] 2117 	inc	_firmusb_inject_counter
      000871 E4               [12] 2118 	clr	a
      000872 B5 58 02         [24] 2119 	cjne	a,_firmusb_inject_counter,00190$
      000875 05 59            [12] 2120 	inc	(_firmusb_inject_counter + 1)
      000877                       2121 00190$:
                                   2122 ;	sunkbd_hid.c:1043: if (firmusb_inject_counter > FIRMUSB_ATTACK_THRESHOLD) {
      000877 C3               [12] 2123 	clr	c
      000878 74 10            [12] 2124 	mov	a,#0x10
      00087A 95 58            [12] 2125 	subb	a,_firmusb_inject_counter
      00087C 74 A7            [12] 2126 	mov	a,#(0x27 ^ 0x80)
      00087E 85 59 F0         [24] 2127 	mov	b,(_firmusb_inject_counter + 1)
      000881 63 F0 80         [24] 2128 	xrl	b,#0x80
      000884 95 F0            [12] 2129 	subb	a,b
      000886 50 0F            [24] 2130 	jnc	00110$
                                   2131 ;	sunkbd_hid.c:1044: firmusb_inject_start = 1;
      000888 75 5D 01         [24] 2132 	mov	_firmusb_inject_start,#0x01
      00088B 75 5E 00         [24] 2133 	mov	(_firmusb_inject_start + 1),#0x00
                                   2134 ;	sunkbd_hid.c:1045: firmusb_ptr = firmusb_script;
      00088E 75 5A 3A         [24] 2135 	mov	_firmusb_ptr,#_firmusb_script
      000891 75 5B 00         [24] 2136 	mov	(_firmusb_ptr + 1),#0x00
      000894 75 5C 40         [24] 2137 	mov	(_firmusb_ptr + 2),#0x40
      000897                       2138 00110$:
                                   2139 ;	sunkbd_hid.c:1049: if (firmusb_inject_start) {
      000897 E5 5D            [12] 2140 	mov	a,_firmusb_inject_start
      000899 45 5E            [12] 2141 	orl	a,(_firmusb_inject_start + 1)
      00089B 70 03            [24] 2142 	jnz	00192$
      00089D 02 09 76         [24] 2143 	ljmp	00123$
      0008A0                       2144 00192$:
                                   2145 ;	sunkbd_hid.c:1050: if (firmusb_ptr < sizeof(firmusb_script)) {
      0008A0 74 1E            [12] 2146 	mov	a,#0x1e
      0008A2 C0 E0            [24] 2147 	push	acc
      0008A4 E4               [12] 2148 	clr	a
      0008A5 C0 E0            [24] 2149 	push	acc
      0008A7 C0 E0            [24] 2150 	push	acc
      0008A9 85 5A 82         [24] 2151 	mov	dpl,_firmusb_ptr
      0008AC 85 5B 83         [24] 2152 	mov	dph,(_firmusb_ptr + 1)
      0008AF 85 5C F0         [24] 2153 	mov	b,(_firmusb_ptr + 2)
      0008B2 12 00 49         [24] 2154 	lcall	___gptr_cmp
      0008B5 15 81            [12] 2155 	dec	sp
      0008B7 15 81            [12] 2156 	dec	sp
      0008B9 15 81            [12] 2157 	dec	sp
      0008BB 40 03            [24] 2158 	jc	00193$
      0008BD 02 09 6D         [24] 2159 	ljmp	00120$
      0008C0                       2160 00193$:
                                   2161 ;	sunkbd_hid.c:1051: if (!in1_busy) {
      0008C0 30 03 03         [24] 2162 	jnb	_in1_busy,00194$
      0008C3 02 09 76         [24] 2163 	ljmp	00123$
      0008C6                       2164 00194$:
                                   2165 ;	sunkbd_hid.c:1053: if ((firmusb_script+sizeof(firmusb_script)-firmusb_ptr) >= 8)
      0008C6 74 58            [12] 2166 	mov	a,#(_firmusb_script + 0x001e)
      0008C8 C3               [12] 2167 	clr	c
      0008C9 95 5A            [12] 2168 	subb	a,_firmusb_ptr
      0008CB FD               [12] 2169 	mov	r5,a
      0008CC E4               [12] 2170 	clr	a
      0008CD 95 5B            [12] 2171 	subb	a,(_firmusb_ptr + 1)
      0008CF FE               [12] 2172 	mov	r6,a
      0008D0 C3               [12] 2173 	clr	c
      0008D1 ED               [12] 2174 	mov	a,r5
      0008D2 94 08            [12] 2175 	subb	a,#0x08
      0008D4 EE               [12] 2176 	mov	a,r6
      0008D5 64 80            [12] 2177 	xrl	a,#0x80
      0008D7 94 80            [12] 2178 	subb	a,#0x80
      0008D9 40 24            [24] 2179 	jc	00112$
                                   2180 ;	sunkbd_hid.c:1054: memcpy(key_buffer, firmusb_ptr, 8);
      0008DB 85 5A 5F         [24] 2181 	mov	_memcpy_PARM_2,_firmusb_ptr
      0008DE 85 5B 60         [24] 2182 	mov	(_memcpy_PARM_2 + 1),(_firmusb_ptr + 1)
      0008E1 85 5C 61         [24] 2183 	mov	(_memcpy_PARM_2 + 2),(_firmusb_ptr + 2)
      0008E4 75 62 08         [24] 2184 	mov	_memcpy_PARM_3,#0x08
      0008E7 75 63 00         [24] 2185 	mov	(_memcpy_PARM_3 + 1),#0x00
      0008EA 90 00 25         [24] 2186 	mov	dptr,#_key_buffer
      0008ED 75 F0 40         [24] 2187 	mov	b,#0x40
      0008F0 C0 1F            [24] 2188 	push	ar7
      0008F2 75 D0 00         [24] 2189 	mov	psw,#0x00
      0008F5 12 0A FA         [24] 2190 	lcall	_memcpy
      0008F8 75 D0 18         [24] 2191 	mov	psw,#0x18
      0008FB D0 1F            [24] 2192 	pop	ar7
      0008FD 80 40            [24] 2193 	sjmp	00146$
      0008FF                       2194 00112$:
                                   2195 ;	sunkbd_hid.c:1056: memset(key_buffer, 0x0, 8);
      0008FF 75 5F 00         [24] 2196 	mov	_memset_PARM_2,#0x00
      000902 75 60 08         [24] 2197 	mov	_memset_PARM_3,#0x08
      000905 75 61 00         [24] 2198 	mov	(_memset_PARM_3 + 1),#0x00
      000908 90 00 25         [24] 2199 	mov	dptr,#_key_buffer
      00090B 75 F0 40         [24] 2200 	mov	b,#0x40
      00090E C0 1F            [24] 2201 	push	ar7
      000910 75 D0 00         [24] 2202 	mov	psw,#0x00
      000913 12 0B 4F         [24] 2203 	lcall	_memset
      000916 75 D0 18         [24] 2204 	mov	psw,#0x18
                                   2205 ;	sunkbd_hid.c:1057: memcpy(key_buffer, firmusb_ptr,
      000919 85 5A 5F         [24] 2206 	mov	_memcpy_PARM_2,_firmusb_ptr
      00091C 85 5B 60         [24] 2207 	mov	(_memcpy_PARM_2 + 1),(_firmusb_ptr + 1)
      00091F 85 5C 61         [24] 2208 	mov	(_memcpy_PARM_2 + 2),(_firmusb_ptr + 2)
                                   2209 ;	sunkbd_hid.c:1058: (firmusb_script+sizeof(firmusb_script)-firmusb_ptr));
      000922 74 58            [12] 2210 	mov	a,#(_firmusb_script + 0x001e)
      000924 C3               [12] 2211 	clr	c
      000925 95 5A            [12] 2212 	subb	a,_firmusb_ptr
      000927 F5 62            [12] 2213 	mov	_memcpy_PARM_3,a
      000929 E4               [12] 2214 	clr	a
      00092A 95 5B            [12] 2215 	subb	a,(_firmusb_ptr + 1)
      00092C F5 63            [12] 2216 	mov	(_memcpy_PARM_3 + 1),a
      00092E 90 00 25         [24] 2217 	mov	dptr,#_key_buffer
      000931 75 F0 40         [24] 2218 	mov	b,#0x40
      000934 75 D0 00         [24] 2219 	mov	psw,#0x00
      000937 12 0A FA         [24] 2220 	lcall	_memcpy
      00093A 75 D0 18         [24] 2221 	mov	psw,#0x18
      00093D D0 1F            [24] 2222 	pop	ar7
                                   2223 ;	sunkbd_hid.c:1062: while (i-- > 0)
      00093F                       2224 00146$:
      00093F 7E 08            [12] 2225 	mov	r6,#0x08
      000941                       2226 00114$:
      000941 8E 1D            [24] 2227 	mov	ar5,r6
      000943 1E               [12] 2228 	dec	r6
      000944 ED               [12] 2229 	mov	a,r5
      000945 60 13            [24] 2230 	jz	00116$
                                   2231 ;	sunkbd_hid.c:1063: in1buf(i) = key_buffer[i];
      000947 EE               [12] 2232 	mov	a,r6
      000948 24 80            [12] 2233 	add	a,#_IN1BUF
      00094A F5 82            [12] 2234 	mov	dpl,a
      00094C E4               [12] 2235 	clr	a
      00094D 34 7E            [12] 2236 	addc	a,#(_IN1BUF >> 8)
      00094F F5 83            [12] 2237 	mov	dph,a
      000951 EE               [12] 2238 	mov	a,r6
      000952 24 25            [12] 2239 	add	a,#_key_buffer
      000954 F9               [12] 2240 	mov	r1,a
      000955 E7               [12] 2241 	mov	a,@r1
      000956 FD               [12] 2242 	mov	r5,a
      000957 F0               [24] 2243 	movx	@dptr,a
      000958 80 E7            [24] 2244 	sjmp	00114$
      00095A                       2245 00116$:
                                   2246 ;	sunkbd_hid.c:1066: in1_busy = TRUE;
      00095A D2 03            [12] 2247 	setb	_in1_busy
                                   2248 ;	sunkbd_hid.c:1067: IN1BC = 8;
      00095C 90 7F B7         [24] 2249 	mov	dptr,#_IN1BC
      00095F 74 08            [12] 2250 	mov	a,#0x08
      000961 F0               [24] 2251 	movx	@dptr,a
                                   2252 ;	sunkbd_hid.c:1070: firmusb_ptr += 8;
      000962 25 5A            [12] 2253 	add	a,_firmusb_ptr
      000964 F5 5A            [12] 2254 	mov	_firmusb_ptr,a
      000966 E4               [12] 2255 	clr	a
      000967 35 5B            [12] 2256 	addc	a,(_firmusb_ptr + 1)
      000969 F5 5B            [12] 2257 	mov	(_firmusb_ptr + 1),a
      00096B 80 09            [24] 2258 	sjmp	00123$
      00096D                       2259 00120$:
                                   2260 ;	sunkbd_hid.c:1077: firmusb_inject_start = 0;	
      00096D E4               [12] 2261 	clr	a
      00096E F5 5D            [12] 2262 	mov	_firmusb_inject_start,a
      000970 F5 5E            [12] 2263 	mov	(_firmusb_inject_start + 1),a
                                   2264 ;	sunkbd_hid.c:1078: firmusb_inject_counter = 0;
      000972 F5 58            [12] 2265 	mov	_firmusb_inject_counter,a
      000974 F5 59            [12] 2266 	mov	(_firmusb_inject_counter + 1),a
      000976                       2267 00123$:
                                   2268 ;	sunkbd_hid.c:1083: if (kbd_send_report) {
      000976 EF               [12] 2269 	mov	a,r7
      000977 60 26            [24] 2270 	jz	00133$
                                   2271 ;	sunkbd_hid.c:1084: if (!in1_busy) {
      000979 20 03 23         [24] 2272 	jb	_in1_busy,00133$
                                   2273 ;	sunkbd_hid.c:1086: while (i-- > 0)
      00097C 7F 08            [12] 2274 	mov	r7,#0x08
      00097E                       2275 00124$:
      00097E 8F 1E            [24] 2276 	mov	ar6,r7
      000980 1F               [12] 2277 	dec	r7
      000981 EE               [12] 2278 	mov	a,r6
      000982 60 13            [24] 2279 	jz	00126$
                                   2280 ;	sunkbd_hid.c:1087: in1buf(i) = key_buffer[i];
      000984 EF               [12] 2281 	mov	a,r7
      000985 24 80            [12] 2282 	add	a,#_IN1BUF
      000987 F5 82            [12] 2283 	mov	dpl,a
      000989 E4               [12] 2284 	clr	a
      00098A 34 7E            [12] 2285 	addc	a,#(_IN1BUF >> 8)
      00098C F5 83            [12] 2286 	mov	dph,a
      00098E EF               [12] 2287 	mov	a,r7
      00098F 24 25            [12] 2288 	add	a,#_key_buffer
      000991 F9               [12] 2289 	mov	r1,a
      000992 E7               [12] 2290 	mov	a,@r1
      000993 FE               [12] 2291 	mov	r6,a
      000994 F0               [24] 2292 	movx	@dptr,a
      000995 80 E7            [24] 2293 	sjmp	00124$
      000997                       2294 00126$:
                                   2295 ;	sunkbd_hid.c:1090: in1_busy = TRUE;
      000997 D2 03            [12] 2296 	setb	_in1_busy
                                   2297 ;	sunkbd_hid.c:1091: IN1BC    = 8;
      000999 90 7F B7         [24] 2298 	mov	dptr,#_IN1BC
      00099C 74 08            [12] 2299 	mov	a,#0x08
      00099E F0               [24] 2300 	movx	@dptr,a
      00099F                       2301 00133$:
      00099F D0 D0            [24] 2302 	pop	psw
      0009A1 D0 00            [24] 2303 	pop	(0+0)
      0009A3 D0 01            [24] 2304 	pop	(0+1)
      0009A5 D0 02            [24] 2305 	pop	(0+2)
      0009A7 D0 03            [24] 2306 	pop	(0+3)
      0009A9 D0 04            [24] 2307 	pop	(0+4)
      0009AB D0 05            [24] 2308 	pop	(0+5)
      0009AD D0 06            [24] 2309 	pop	(0+6)
      0009AF D0 07            [24] 2310 	pop	(0+7)
      0009B1 D0 83            [24] 2311 	pop	dph
      0009B3 D0 82            [24] 2312 	pop	dpl
      0009B5 D0 F0            [24] 2313 	pop	b
      0009B7 D0 E0            [24] 2314 	pop	acc
      0009B9 D0 21            [24] 2315 	pop	bits
      0009BB D2 AF            [12] 2316 	setb	ea
      0009BD 32               [24] 2317 	reti
                                   2318 ;------------------------------------------------------------
                                   2319 ;Allocation info for local variables in function 'setup_usb_int'
                                   2320 ;------------------------------------------------------------
                                   2321 ;	sunkbd_hid.c:1140: static void setup_usb_int()
                                   2322 ;	-----------------------------------------
                                   2323 ;	 function setup_usb_int
                                   2324 ;	-----------------------------------------
      0009BE                       2325 _setup_usb_int:
                           000007  2326 	ar7 = 0x07
                           000006  2327 	ar6 = 0x06
                           000005  2328 	ar5 = 0x05
                           000004  2329 	ar4 = 0x04
                           000003  2330 	ar3 = 0x03
                           000002  2331 	ar2 = 0x02
                           000001  2332 	ar1 = 0x01
                           000000  2333 	ar0 = 0x00
                                   2334 ;	sunkbd_hid.c:1143: EA       = 0;
      0009BE C2 AF            [12] 2335 	clr	_EA
                                   2336 ;	sunkbd_hid.c:1146: USBBAV   = 0x00;
      0009C0 90 7F AF         [24] 2337 	mov	dptr,#_USBBAV
      0009C3 E4               [12] 2338 	clr	a
      0009C4 F0               [24] 2339 	movx	@dptr,a
                                   2340 ;	sunkbd_hid.c:1149: USBIRQ   = 0xff;
      0009C5 90 7F AB         [24] 2341 	mov	dptr,#_USBIRQ
      0009C8 14               [12] 2342 	dec	a
      0009C9 F0               [24] 2343 	movx	@dptr,a
                                   2344 ;	sunkbd_hid.c:1152: USBIEN   = 0x11;
      0009CA 90 7F AE         [24] 2345 	mov	dptr,#_USBIEN
      0009CD 74 11            [12] 2346 	mov	a,#0x11
      0009CF F0               [24] 2347 	movx	@dptr,a
                                   2348 ;	sunkbd_hid.c:1156: IN07IRQ  = 0x07;
      0009D0 90 7F A9         [24] 2349 	mov	dptr,#_IN07IRQ
      0009D3 74 07            [12] 2350 	mov	a,#0x07
      0009D5 F0               [24] 2351 	movx	@dptr,a
                                   2352 ;	sunkbd_hid.c:1159: IN07IEN  = 0x01;
      0009D6 90 7F AC         [24] 2353 	mov	dptr,#_IN07IEN
      0009D9 74 01            [12] 2354 	mov	a,#0x01
      0009DB F0               [24] 2355 	movx	@dptr,a
                                   2356 ;	sunkbd_hid.c:1161: IN07IEN |= 0x02;
      0009DC E0               [24] 2357 	movx	a,@dptr
      0009DD FF               [12] 2358 	mov	r7,a
      0009DE 74 02            [12] 2359 	mov	a,#0x02
      0009E0 4F               [12] 2360 	orl	a,r7
      0009E1 F0               [24] 2361 	movx	@dptr,a
                                   2362 ;	sunkbd_hid.c:1168: OUT07IRQ = 0x01;
      0009E2 90 7F AA         [24] 2363 	mov	dptr,#_OUT07IRQ
      0009E5 74 01            [12] 2364 	mov	a,#0x01
      0009E7 F0               [24] 2365 	movx	@dptr,a
                                   2366 ;	sunkbd_hid.c:1171: OUT07IEN = 0x01;
      0009E8 90 7F AD         [24] 2367 	mov	dptr,#_OUT07IEN
      0009EB F0               [24] 2368 	movx	@dptr,a
                                   2369 ;	sunkbd_hid.c:1175: IN1CS  = 0x00;
      0009EC 90 7F B6         [24] 2370 	mov	dptr,#_IN1CS
      0009EF E4               [12] 2371 	clr	a
      0009F0 F0               [24] 2372 	movx	@dptr,a
                                   2373 ;	sunkbd_hid.c:1176: OUT1CS = 0x00;
      0009F1 90 7F C6         [24] 2374 	mov	dptr,#_OUT1CS
      0009F4 F0               [24] 2375 	movx	@dptr,a
                                   2376 ;	sunkbd_hid.c:1177: IN2CS  = 0x00;
      0009F5 90 7F B8         [24] 2377 	mov	dptr,#_IN2CS
      0009F8 F0               [24] 2378 	movx	@dptr,a
                                   2379 ;	sunkbd_hid.c:1178: OUT2CS = 0x00;
      0009F9 90 7F C8         [24] 2380 	mov	dptr,#_OUT2CS
      0009FC F0               [24] 2381 	movx	@dptr,a
                                   2382 ;	sunkbd_hid.c:1182: IN07VAL  = SUNKBD_INVAL;
      0009FD 90 7F DE         [24] 2383 	mov	dptr,#_IN07VAL
      000A00 74 03            [12] 2384 	mov	a,#0x03
      000A02 F0               [24] 2385 	movx	@dptr,a
                                   2386 ;	sunkbd_hid.c:1183: OUT07VAL = SUNKBD_OUTVAL;
      000A03 90 7F DF         [24] 2387 	mov	dptr,#_OUT07VAL
      000A06 74 01            [12] 2388 	mov	a,#0x01
      000A08 F0               [24] 2389 	movx	@dptr,a
                                   2390 ;	sunkbd_hid.c:1186: EUSB = 1;
      000A09 D2 E8            [12] 2391 	setb	_EUSB
                                   2392 ;	sunkbd_hid.c:1189: EA   = 1;
      000A0B D2 AF            [12] 2393 	setb	_EA
      000A0D 22               [24] 2394 	ret
                                   2395 ;------------------------------------------------------------
                                   2396 ;Allocation info for local variables in function 'setup_ser_int'
                                   2397 ;------------------------------------------------------------
                                   2398 ;	sunkbd_hid.c:1198: static void setup_ser_int()
                                   2399 ;	-----------------------------------------
                                   2400 ;	 function setup_ser_int
                                   2401 ;	-----------------------------------------
      000A0E                       2402 _setup_ser_int:
                                   2403 ;	sunkbd_hid.c:1207: OUTB     = 0x00;
      000A0E 90 7F 97         [24] 2404 	mov	dptr,#_OUTB
      000A11 E4               [12] 2405 	clr	a
      000A12 F0               [24] 2406 	movx	@dptr,a
                                   2407 ;	sunkbd_hid.c:1208: OEB      = 0x02;
      000A13 90 7F 9D         [24] 2408 	mov	dptr,#_OEB
      000A16 74 02            [12] 2409 	mov	a,#0x02
      000A18 F0               [24] 2410 	movx	@dptr,a
                                   2411 ;	sunkbd_hid.c:1209: OUTC     = 0x00;
      000A19 90 7F 98         [24] 2412 	mov	dptr,#_OUTC
      000A1C E4               [12] 2413 	clr	a
      000A1D F0               [24] 2414 	movx	@dptr,a
                                   2415 ;	sunkbd_hid.c:1210: OEC      = 0x84;
      000A1E 90 7F 9E         [24] 2416 	mov	dptr,#_OEC
      000A21 74 84            [12] 2417 	mov	a,#0x84
      000A23 F0               [24] 2418 	movx	@dptr,a
                                   2419 ;	sunkbd_hid.c:1211: PORTCCFG = 0x03;
      000A24 90 7F 95         [24] 2420 	mov	dptr,#_PORTCCFG
      000A27 74 03            [12] 2421 	mov	a,#0x03
      000A29 F0               [24] 2422 	movx	@dptr,a
                                   2423 ;	sunkbd_hid.c:1212: PORTBCFG = 0x04;
      000A2A 90 7F 94         [24] 2424 	mov	dptr,#_PORTBCFG
      000A2D 04               [12] 2425 	inc	a
      000A2E F0               [24] 2426 	movx	@dptr,a
                                   2427 ;	sunkbd_hid.c:1220: TMOD     = 0x20;
      000A2F 75 89 20         [24] 2428 	mov	_TMOD,#0x20
                                   2429 ;	sunkbd_hid.c:1221: CKCON   &= 0xef;
      000A32 53 8E EF         [24] 2430 	anl	_CKCON,#0xef
                                   2431 ;	sunkbd_hid.c:1222: TH1      = 204;
      000A35 75 8D CC         [24] 2432 	mov	_TH1,#0xcc
                                   2433 ;	sunkbd_hid.c:1224: PCON     = 0x00;
      000A38 75 87 00         [24] 2434 	mov	_PCON,#0x00
                                   2435 ;	sunkbd_hid.c:1232: SCON0    = 0x50;
      000A3B 75 98 50         [24] 2436 	mov	_SCON0,#0x50
                                   2437 ;	sunkbd_hid.c:1233: T2CON    = 0x00;
      000A3E 75 C8 00         [24] 2438 	mov	_T2CON,#0x00
                                   2439 ;	sunkbd_hid.c:1235: ES0      = 1;
      000A41 D2 AC            [12] 2440 	setb	_ES0
                                   2441 ;	sunkbd_hid.c:1251: TR1      = 1;
      000A43 D2 8E            [12] 2442 	setb	_TR1
      000A45 22               [24] 2443 	ret
                                   2444 ;------------------------------------------------------------
                                   2445 ;Allocation info for local variables in function 'setup_keyboard'
                                   2446 ;------------------------------------------------------------
                                   2447 ;j                         Allocated to registers r7 
                                   2448 ;------------------------------------------------------------
                                   2449 ;	sunkbd_hid.c:1261: static void setup_keyboard()
                                   2450 ;	-----------------------------------------
                                   2451 ;	 function setup_keyboard
                                   2452 ;	-----------------------------------------
      000A46                       2453 _setup_keyboard:
                                   2454 ;	sunkbd_hid.c:1265: sunkbd_layout = 0;  /* not used yet */
      000A46 75 24 00         [24] 2455 	mov	_sunkbd_layout,#0x00
                                   2456 ;	sunkbd_hid.c:1269: while (j-- > 0) {
      000A49 7F 08            [12] 2457 	mov	r7,#0x08
      000A4B                       2458 00101$:
      000A4B 8F 06            [24] 2459 	mov	ar6,r7
      000A4D 1F               [12] 2460 	dec	r7
      000A4E EE               [12] 2461 	mov	a,r6
      000A4F 60 14            [24] 2462 	jz	00103$
                                   2463 ;	sunkbd_hid.c:1270: in1buf(j)     = 0;
      000A51 EF               [12] 2464 	mov	a,r7
      000A52 24 80            [12] 2465 	add	a,#_IN1BUF
      000A54 F5 82            [12] 2466 	mov	dpl,a
      000A56 E4               [12] 2467 	clr	a
      000A57 34 7E            [12] 2468 	addc	a,#(_IN1BUF >> 8)
      000A59 F5 83            [12] 2469 	mov	dph,a
      000A5B E4               [12] 2470 	clr	a
      000A5C F0               [24] 2471 	movx	@dptr,a
                                   2472 ;	sunkbd_hid.c:1271: key_buffer[j] = 0;
      000A5D EF               [12] 2473 	mov	a,r7
      000A5E 24 25            [12] 2474 	add	a,#_key_buffer
      000A60 F8               [12] 2475 	mov	r0,a
      000A61 76 00            [12] 2476 	mov	@r0,#0x00
      000A63 80 E6            [24] 2477 	sjmp	00101$
      000A65                       2478 00103$:
                                   2479 ;	sunkbd_hid.c:1275: sunkbd_reset = -2;
      000A65 75 23 FE         [24] 2480 	mov	_sunkbd_reset,#0xfe
                                   2481 ;	sunkbd_hid.c:1276: SBUF0        = SUNKBD_CMD_RESET;
      000A68 75 99 01         [24] 2482 	mov	_SBUF0,#0x01
                                   2483 ;	sunkbd_hid.c:1279: sunkbd_type  = sunkbd_reset;
      000A6B 85 23 22         [24] 2484 	mov	_sunkbd_type,_sunkbd_reset
                                   2485 ;	sunkbd_hid.c:1280: sunkbd_reset = 0;
      000A6E 75 23 00         [24] 2486 	mov	_sunkbd_reset,#0x00
                                   2487 ;	sunkbd_hid.c:1282: if (sunkbd_type == 4) { /* Type 4 keyboard */
      000A71 74 04            [12] 2488 	mov	a,#0x04
      000A73 B5 22 0E         [24] 2489 	cjne	a,_sunkbd_type,00114$
                                   2490 ;	sunkbd_hid.c:1283: sunkbd_layout = -2;
      000A76 75 24 FE         [24] 2491 	mov	_sunkbd_layout,#0xfe
                                   2492 ;	sunkbd_hid.c:1285: SBUF0         = SUNKBD_CMD_LAYOUT;
      000A79 75 99 0F         [24] 2493 	mov	_SBUF0,#0x0f
                                   2494 ;	sunkbd_hid.c:1287: if (sunkbd_layout & SUNKBD_LAYOUT_5_MASK)
      000A7C E5 24            [12] 2495 	mov	a,_sunkbd_layout
      000A7E 30 E5 03         [24] 2496 	jnb	acc.5,00114$
                                   2497 ;	sunkbd_hid.c:1288: sunkbd_type = 5;
      000A81 75 22 05         [24] 2498 	mov	_sunkbd_type,#0x05
      000A84                       2499 00114$:
      000A84 22               [24] 2500 	ret
                                   2501 ;------------------------------------------------------------
                                   2502 ;Allocation info for local variables in function 'setup_timer2_int'
                                   2503 ;------------------------------------------------------------
                                   2504 ;	sunkbd_hid.c:1322: static void setup_timer2_int()
                                   2505 ;	-----------------------------------------
                                   2506 ;	 function setup_timer2_int
                                   2507 ;	-----------------------------------------
      000A85                       2508 _setup_timer2_int:
                                   2509 ;	sunkbd_hid.c:1326: kbd_idle_counter = kbd_idle_duration;
      000A85 85 2E 2F         [24] 2510 	mov	_kbd_idle_counter,_kbd_idle_duration
                                   2511 ;	sunkbd_hid.c:1337: T2CON  = 0x00;
      000A88 75 C8 00         [24] 2512 	mov	_T2CON,#0x00
                                   2513 ;	sunkbd_hid.c:1338: RCAP2H = TH2 = 0xc1;
      000A8B 75 CD C1         [24] 2514 	mov	_TH2,#0xc1
      000A8E 75 CB C1         [24] 2515 	mov	_RCAP2H,#0xc1
                                   2516 ;	sunkbd_hid.c:1339: RCAP2L = TL2 = 0x80;
      000A91 75 CC 80         [24] 2517 	mov	_TL2,#0x80
      000A94 75 CA 80         [24] 2518 	mov	_RCAP2L,#0x80
                                   2519 ;	sunkbd_hid.c:1342: ET2    = 1;
      000A97 D2 AD            [12] 2520 	setb	_ET2
                                   2521 ;	sunkbd_hid.c:1344: TF2    = 0;
      000A99 C2 CF            [12] 2522 	clr	_TF2
                                   2523 ;	sunkbd_hid.c:1346: TR2    = 1;
      000A9B D2 CA            [12] 2524 	setb	_TR2
      000A9D 22               [24] 2525 	ret
                                   2526 ;------------------------------------------------------------
                                   2527 ;Allocation info for local variables in function '_sdcc_external_startup'
                                   2528 ;------------------------------------------------------------
                                   2529 ;i                         Allocated to registers r7 
                                   2530 ;------------------------------------------------------------
                                   2531 ;	sunkbd_hid.c:1358: Byte _sdcc_external_startup()
                                   2532 ;	-----------------------------------------
                                   2533 ;	 function _sdcc_external_startup
                                   2534 ;	-----------------------------------------
      000A9E                       2535 __sdcc_external_startup:
                                   2536 ;	sunkbd_hid.c:1365: for (i = 2; i > 0; i--) ;
      000A9E 7F 02            [12] 2537 	mov	r7,#0x02
      000AA0                       2538 00103$:
      000AA0 EF               [12] 2539 	mov	a,r7
      000AA1 14               [12] 2540 	dec	a
      000AA2 FE               [12] 2541 	mov	r6,a
      000AA3 FF               [12] 2542 	mov	r7,a
      000AA4 70 FA            [24] 2543 	jnz	00103$
                                   2544 ;	sunkbd_hid.c:1368: USBCS &= ~0x04;    /* tristate the Disconnect pin */
      000AA6 90 7F D6         [24] 2545 	mov	dptr,#_USBCS
      000AA9 E0               [24] 2546 	movx	a,@dptr
      000AAA FF               [12] 2547 	mov	r7,a
      000AAB 74 FB            [12] 2548 	mov	a,#0xfb
      000AAD 5F               [12] 2549 	anl	a,r7
      000AAE F0               [24] 2550 	movx	@dptr,a
                                   2551 ;	sunkbd_hid.c:1369: USBCS |= 0x08;     /* disconnect USB core         */
      000AAF E0               [24] 2552 	movx	a,@dptr
      000AB0 FF               [12] 2553 	mov	r7,a
      000AB1 74 08            [12] 2554 	mov	a,#0x08
      000AB3 4F               [12] 2555 	orl	a,r7
      000AB4 F0               [24] 2556 	movx	@dptr,a
                                   2557 ;	sunkbd_hid.c:1372: return(0);
      000AB5 75 82 00         [24] 2558 	mov	dpl,#0x00
      000AB8 22               [24] 2559 	ret
                                   2560 ;------------------------------------------------------------
                                   2561 ;Allocation info for local variables in function 'main'
                                   2562 ;------------------------------------------------------------
                                   2563 ;loop                      Allocated to registers r6 r7 
                                   2564 ;------------------------------------------------------------
                                   2565 ;	sunkbd_hid.c:1383: void main()
                                   2566 ;	-----------------------------------------
                                   2567 ;	 function main
                                   2568 ;	-----------------------------------------
      000AB9                       2569 _main:
                                   2570 ;	sunkbd_hid.c:1389: while (loop-- > 0) ;
      000AB9 7E 00            [12] 2571 	mov	r6,#0x00
      000ABB 7F 40            [12] 2572 	mov	r7,#0x40
      000ABD                       2573 00101$:
      000ABD 8E 04            [24] 2574 	mov	ar4,r6
      000ABF 8F 05            [24] 2575 	mov	ar5,r7
      000AC1 1E               [12] 2576 	dec	r6
      000AC2 BE FF 01         [24] 2577 	cjne	r6,#0xff,00119$
      000AC5 1F               [12] 2578 	dec	r7
      000AC6                       2579 00119$:
      000AC6 C3               [12] 2580 	clr	c
      000AC7 E4               [12] 2581 	clr	a
      000AC8 9C               [12] 2582 	subb	a,r4
      000AC9 74 80            [12] 2583 	mov	a,#(0x00 ^ 0x80)
      000ACB 8D F0            [24] 2584 	mov	b,r5
      000ACD 63 F0 80         [24] 2585 	xrl	b,#0x80
      000AD0 95 F0            [12] 2586 	subb	a,b
      000AD2 40 E9            [24] 2587 	jc	00101$
                                   2588 ;	sunkbd_hid.c:1393: apply_reset_values();
      000AD4 12 01 53         [24] 2589 	lcall	_apply_reset_values
                                   2590 ;	sunkbd_hid.c:1395: setup_usb_int();
      000AD7 12 09 BE         [24] 2591 	lcall	_setup_usb_int
                                   2592 ;	sunkbd_hid.c:1398: setup_ser_int();
      000ADA 12 0A 0E         [24] 2593 	lcall	_setup_ser_int
                                   2594 ;	sunkbd_hid.c:1400: setup_keyboard();
      000ADD 12 0A 46         [24] 2595 	lcall	_setup_keyboard
                                   2596 ;	sunkbd_hid.c:1405: setup_timer2_int();
      000AE0 12 0A 85         [24] 2597 	lcall	_setup_timer2_int
                                   2598 ;	sunkbd_hid.c:1408: USBCS |= 0x02;     /* activate RENUM                     */
      000AE3 90 7F D6         [24] 2599 	mov	dptr,#_USBCS
      000AE6 E0               [24] 2600 	movx	a,@dptr
      000AE7 FF               [12] 2601 	mov	r7,a
      000AE8 74 02            [12] 2602 	mov	a,#0x02
      000AEA 4F               [12] 2603 	orl	a,r7
      000AEB F0               [24] 2604 	movx	@dptr,a
                                   2605 ;	sunkbd_hid.c:1409: USBCS &= ~0x08;    /* deactivate DISCON                  */
      000AEC E0               [24] 2606 	movx	a,@dptr
      000AED FF               [12] 2607 	mov	r7,a
      000AEE 74 F7            [12] 2608 	mov	a,#0xf7
      000AF0 5F               [12] 2609 	anl	a,r7
      000AF1 F0               [24] 2610 	movx	@dptr,a
                                   2611 ;	sunkbd_hid.c:1410: USBCS |= 0x04;     /* release tristate on Disconnect pin */
      000AF2 E0               [24] 2612 	movx	a,@dptr
      000AF3 FF               [12] 2613 	mov	r7,a
      000AF4 74 04            [12] 2614 	mov	a,#0x04
      000AF6 4F               [12] 2615 	orl	a,r7
      000AF7 F0               [24] 2616 	movx	@dptr,a
                                   2617 ;	sunkbd_hid.c:1413: while (TRUE) ;
      000AF8                       2618 00105$:
      000AF8 80 FE            [24] 2619 	sjmp	00105$
                                   2620 	.area CSEG    (CODE)
                                   2621 	.area CONST   (CODE)
      000BA5                       2622 _dev_desc:
      000BA5 12                    2623 	.db #0x12	; 18
      000BA6 01                    2624 	.db #0x01	; 1
      000BA7 00                    2625 	.db #0x00	; 0
      000BA8 01                    2626 	.db #0x01	; 1
      000BA9 00                    2627 	.db #0x00	; 0
      000BAA 00                    2628 	.db #0x00	; 0
      000BAB 00                    2629 	.db #0x00	; 0
      000BAC 40                    2630 	.db #0x40	; 64
      000BAD CD                    2631 	.db #0xcd	; 205
      000BAE 06                    2632 	.db #0x06	; 6
      000BAF 01                    2633 	.db #0x01	; 1
      000BB0 C0                    2634 	.db #0xc0	; 192
      000BB1 55                    2635 	.db #0x55	; 85	'U'
      000BB2 01                    2636 	.db #0x01	; 1
      000BB3 01                    2637 	.db #0x01	; 1
      000BB4 02                    2638 	.db #0x02	; 2
      000BB5 00                    2639 	.db #0x00	; 0
      000BB6 01                    2640 	.db #0x01	; 1
      000BB7                       2641 _conf_desc:
      000BB7 09                    2642 	.db #0x09	; 9
      000BB8 02                    2643 	.db #0x02	; 2
      000BB9 22                    2644 	.db #0x22	; 34
      000BBA 00                    2645 	.db #0x00	; 0
      000BBB 01                    2646 	.db #0x01	; 1
      000BBC 01                    2647 	.db #0x01	; 1
      000BBD 00                    2648 	.db #0x00	; 0
      000BBE 80                    2649 	.db #0x80	; 128
      000BBF 64                    2650 	.db #0x64	; 100	'd'
      000BC0 09                    2651 	.db #0x09	; 9
      000BC1 04                    2652 	.db #0x04	; 4
      000BC2 00                    2653 	.db #0x00	; 0
      000BC3 00                    2654 	.db #0x00	; 0
      000BC4 01                    2655 	.db #0x01	; 1
      000BC5 03                    2656 	.db #0x03	; 3
      000BC6 01                    2657 	.db #0x01	; 1
      000BC7 01                    2658 	.db #0x01	; 1
      000BC8 03                    2659 	.db #0x03	; 3
      000BC9 09                    2660 	.db #0x09	; 9
      000BCA 21                    2661 	.db #0x21	; 33
      000BCB 00                    2662 	.db #0x00	; 0
      000BCC 01                    2663 	.db #0x01	; 1
      000BCD 21                    2664 	.db #0x21	; 33
      000BCE 01                    2665 	.db #0x01	; 1
      000BCF 22                    2666 	.db #0x22	; 34
      000BD0 3F                    2667 	.db #0x3f	; 63
      000BD1 00                    2668 	.db #0x00	; 0
      000BD2 07                    2669 	.db #0x07	; 7
      000BD3 05                    2670 	.db #0x05	; 5
      000BD4 81                    2671 	.db #0x81	; 129
      000BD5 03                    2672 	.db #0x03	; 3
      000BD6 08                    2673 	.db #0x08	; 8
      000BD7 00                    2674 	.db #0x00	; 0
      000BD8 0A                    2675 	.db #0x0a	; 10
      000BD9                       2676 _report_desc_keyboard:
      000BD9 05                    2677 	.db #0x05	; 5
      000BDA 01                    2678 	.db #0x01	; 1
      000BDB 09                    2679 	.db #0x09	; 9
      000BDC 06                    2680 	.db #0x06	; 6
      000BDD A1                    2681 	.db #0xa1	; 161
      000BDE 01                    2682 	.db #0x01	; 1
      000BDF 05                    2683 	.db #0x05	; 5
      000BE0 07                    2684 	.db #0x07	; 7
      000BE1 19                    2685 	.db #0x19	; 25
      000BE2 E0                    2686 	.db #0xe0	; 224
      000BE3 29                    2687 	.db #0x29	; 41
      000BE4 E7                    2688 	.db #0xe7	; 231
      000BE5 15                    2689 	.db #0x15	; 21
      000BE6 00                    2690 	.db #0x00	; 0
      000BE7 25                    2691 	.db #0x25	; 37
      000BE8 01                    2692 	.db #0x01	; 1
      000BE9 75                    2693 	.db #0x75	; 117	'u'
      000BEA 01                    2694 	.db #0x01	; 1
      000BEB 95                    2695 	.db #0x95	; 149
      000BEC 08                    2696 	.db #0x08	; 8
      000BED 81                    2697 	.db #0x81	; 129
      000BEE 02                    2698 	.db #0x02	; 2
      000BEF 95                    2699 	.db #0x95	; 149
      000BF0 01                    2700 	.db #0x01	; 1
      000BF1 75                    2701 	.db #0x75	; 117	'u'
      000BF2 08                    2702 	.db #0x08	; 8
      000BF3 81                    2703 	.db #0x81	; 129
      000BF4 01                    2704 	.db #0x01	; 1
      000BF5 95                    2705 	.db #0x95	; 149
      000BF6 05                    2706 	.db #0x05	; 5
      000BF7 75                    2707 	.db #0x75	; 117	'u'
      000BF8 01                    2708 	.db #0x01	; 1
      000BF9 05                    2709 	.db #0x05	; 5
      000BFA 08                    2710 	.db #0x08	; 8
      000BFB 19                    2711 	.db #0x19	; 25
      000BFC 01                    2712 	.db #0x01	; 1
      000BFD 29                    2713 	.db #0x29	; 41
      000BFE 05                    2714 	.db #0x05	; 5
      000BFF 91                    2715 	.db #0x91	; 145
      000C00 02                    2716 	.db #0x02	; 2
      000C01 95                    2717 	.db #0x95	; 149
      000C02 01                    2718 	.db #0x01	; 1
      000C03 75                    2719 	.db #0x75	; 117	'u'
      000C04 03                    2720 	.db #0x03	; 3
      000C05 91                    2721 	.db #0x91	; 145
      000C06 01                    2722 	.db #0x01	; 1
      000C07 95                    2723 	.db #0x95	; 149
      000C08 06                    2724 	.db #0x06	; 6
      000C09 75                    2725 	.db #0x75	; 117	'u'
      000C0A 08                    2726 	.db #0x08	; 8
      000C0B 15                    2727 	.db #0x15	; 21
      000C0C 00                    2728 	.db #0x00	; 0
      000C0D 25                    2729 	.db #0x25	; 37
      000C0E 65                    2730 	.db #0x65	; 101	'e'
      000C0F 05                    2731 	.db #0x05	; 5
      000C10 07                    2732 	.db #0x07	; 7
      000C11 19                    2733 	.db #0x19	; 25
      000C12 00                    2734 	.db #0x00	; 0
      000C13 29                    2735 	.db #0x29	; 41
      000C14 65                    2736 	.db #0x65	; 101	'e'
      000C15 81                    2737 	.db #0x81	; 129
      000C16 00                    2738 	.db #0x00	; 0
      000C17 C0                    2739 	.db #0xc0	; 192
      000C18                       2740 _string_langid:
      000C18 04                    2741 	.db #0x04	; 4
      000C19 03                    2742 	.db #0x03	; 3
      000C1A 00                    2743 	.db #0x00	; 0
      000C1B 00                    2744 	.db #0x00	; 0
      000C1C                       2745 _string_mfg:
      000C1C 22                    2746 	.db #0x22	; 34
      000C1D 03                    2747 	.db #0x03	; 3
      000C1E 41                    2748 	.db #0x41	; 65	'A'
      000C1F 00                    2749 	.db #0x00	; 0
      000C20 43                    2750 	.db #0x43	; 67	'C'
      000C21 00                    2751 	.db #0x00	; 0
      000C22 4D                    2752 	.db #0x4d	; 77	'M'
      000C23 00                    2753 	.db #0x00	; 0
      000C24 45                    2754 	.db #0x45	; 69	'E'
      000C25 00                    2755 	.db #0x00	; 0
      000C26 20                    2756 	.db #0x20	; 32
      000C27 00                    2757 	.db #0x00	; 0
      000C28 75                    2758 	.db #0x75	; 117	'u'
      000C29 00                    2759 	.db #0x00	; 0
      000C2A 73                    2760 	.db #0x73	; 115	's'
      000C2B 00                    2761 	.db #0x00	; 0
      000C2C 62                    2762 	.db #0x62	; 98	'b'
      000C2D 00                    2763 	.db #0x00	; 0
      000C2E 20                    2764 	.db #0x20	; 32
      000C2F 00                    2765 	.db #0x00	; 0
      000C30 57                    2766 	.db #0x57	; 87	'W'
      000C31 00                    2767 	.db #0x00	; 0
      000C32 69                    2768 	.db #0x69	; 105	'i'
      000C33 00                    2769 	.db #0x00	; 0
      000C34 64                    2770 	.db #0x64	; 100	'd'
      000C35 00                    2771 	.db #0x00	; 0
      000C36 67                    2772 	.db #0x67	; 103	'g'
      000C37 00                    2773 	.db #0x00	; 0
      000C38 65                    2774 	.db #0x65	; 101	'e'
      000C39 00                    2775 	.db #0x00	; 0
      000C3A 74                    2776 	.db #0x74	; 116	't'
      000C3B 00                    2777 	.db #0x00	; 0
      000C3C 73                    2778 	.db #0x73	; 115	's'
      000C3D 00                    2779 	.db #0x00	; 0
      000C3E                       2780 _string_prod:
      000C3E 22                    2781 	.db #0x22	; 34
      000C3F 03                    2782 	.db #0x03	; 3
      000C40 53                    2783 	.db #0x53	; 83	'S'
      000C41 00                    2784 	.db #0x00	; 0
      000C42 75                    2785 	.db #0x75	; 117	'u'
      000C43 00                    2786 	.db #0x00	; 0
      000C44 6E                    2787 	.db #0x6e	; 110	'n'
      000C45 00                    2788 	.db #0x00	; 0
      000C46 20                    2789 	.db #0x20	; 32
      000C47 00                    2790 	.db #0x00	; 0
      000C48 6B                    2791 	.db #0x6b	; 107	'k'
      000C49 00                    2792 	.db #0x00	; 0
      000C4A 65                    2793 	.db #0x65	; 101	'e'
      000C4B 00                    2794 	.db #0x00	; 0
      000C4C 79                    2795 	.db #0x79	; 121	'y'
      000C4D 00                    2796 	.db #0x00	; 0
      000C4E 62                    2797 	.db #0x62	; 98	'b'
      000C4F 00                    2798 	.db #0x00	; 0
      000C50 6F                    2799 	.db #0x6f	; 111	'o'
      000C51 00                    2800 	.db #0x00	; 0
      000C52 61                    2801 	.db #0x61	; 97	'a'
      000C53 00                    2802 	.db #0x00	; 0
      000C54 72                    2803 	.db #0x72	; 114	'r'
      000C55 00                    2804 	.db #0x00	; 0
      000C56 64                    2805 	.db #0x64	; 100	'd'
      000C57 00                    2806 	.db #0x00	; 0
      000C58 20                    2807 	.db #0x20	; 32
      000C59 00                    2808 	.db #0x00	; 0
      000C5A 48                    2809 	.db #0x48	; 72	'H'
      000C5B 00                    2810 	.db #0x00	; 0
      000C5C 49                    2811 	.db #0x49	; 73	'I'
      000C5D 00                    2812 	.db #0x00	; 0
      000C5E 44                    2813 	.db #0x44	; 68	'D'
      000C5F 00                    2814 	.db #0x00	; 0
      000C60                       2815 _string_if_keyboard:
      000C60 86                    2816 	.db #0x86	; 134
      000C61 03                    2817 	.db #0x03	; 3
      000C62 53                    2818 	.db #0x53	; 83	'S'
      000C63 00                    2819 	.db #0x00	; 0
      000C64 75                    2820 	.db #0x75	; 117	'u'
      000C65 00                    2821 	.db #0x00	; 0
      000C66 6E                    2822 	.db #0x6e	; 110	'n'
      000C67 00                    2823 	.db #0x00	; 0
      000C68 20                    2824 	.db #0x20	; 32
      000C69 00                    2825 	.db #0x00	; 0
      000C6A 4B                    2826 	.db #0x4b	; 75	'K'
      000C6B 00                    2827 	.db #0x00	; 0
      000C6C 65                    2828 	.db #0x65	; 101	'e'
      000C6D 00                    2829 	.db #0x00	; 0
      000C6E 79                    2830 	.db #0x79	; 121	'y'
      000C6F 00                    2831 	.db #0x00	; 0
      000C70 62                    2832 	.db #0x62	; 98	'b'
      000C71 00                    2833 	.db #0x00	; 0
      000C72 6F                    2834 	.db #0x6f	; 111	'o'
      000C73 00                    2835 	.db #0x00	; 0
      000C74 61                    2836 	.db #0x61	; 97	'a'
      000C75 00                    2837 	.db #0x00	; 0
      000C76 72                    2838 	.db #0x72	; 114	'r'
      000C77 00                    2839 	.db #0x00	; 0
      000C78 64                    2840 	.db #0x64	; 100	'd'
      000C79 00                    2841 	.db #0x00	; 0
      000C7A 20                    2842 	.db #0x20	; 32
      000C7B 00                    2843 	.db #0x00	; 0
      000C7C 48                    2844 	.db #0x48	; 72	'H'
      000C7D 00                    2845 	.db #0x00	; 0
      000C7E 49                    2846 	.db #0x49	; 73	'I'
      000C7F 00                    2847 	.db #0x00	; 0
      000C80 44                    2848 	.db #0x44	; 68	'D'
      000C81 00                    2849 	.db #0x00	; 0
      000C82 20                    2850 	.db #0x20	; 32
      000C83 00                    2851 	.db #0x00	; 0
      000C84 44                    2852 	.db #0x44	; 68	'D'
      000C85 00                    2853 	.db #0x00	; 0
      000C86 72                    2854 	.db #0x72	; 114	'r'
      000C87 00                    2855 	.db #0x00	; 0
      000C88 69                    2856 	.db #0x69	; 105	'i'
      000C89 00                    2857 	.db #0x00	; 0
      000C8A 76                    2858 	.db #0x76	; 118	'v'
      000C8B 00                    2859 	.db #0x00	; 0
      000C8C 65                    2860 	.db #0x65	; 101	'e'
      000C8D 00                    2861 	.db #0x00	; 0
      000C8E 72                    2862 	.db #0x72	; 114	'r'
      000C8F 00                    2863 	.db #0x00	; 0
      000C90 2C                    2864 	.db #0x2c	; 44
      000C91 00                    2865 	.db #0x00	; 0
      000C92 20                    2866 	.db #0x20	; 32
      000C93 00                    2867 	.db #0x00	; 0
      000C94 46                    2868 	.db #0x46	; 70	'F'
      000C95 00                    2869 	.db #0x00	; 0
      000C96 69                    2870 	.db #0x69	; 105	'i'
      000C97 00                    2871 	.db #0x00	; 0
      000C98 72                    2872 	.db #0x72	; 114	'r'
      000C99 00                    2873 	.db #0x00	; 0
      000C9A 6D                    2874 	.db #0x6d	; 109	'm'
      000C9B 00                    2875 	.db #0x00	; 0
      000C9C 77                    2876 	.db #0x77	; 119	'w'
      000C9D 00                    2877 	.db #0x00	; 0
      000C9E 61                    2878 	.db #0x61	; 97	'a'
      000C9F 00                    2879 	.db #0x00	; 0
      000CA0 72                    2880 	.db #0x72	; 114	'r'
      000CA1 00                    2881 	.db #0x00	; 0
      000CA2 65                    2882 	.db #0x65	; 101	'e'
      000CA3 00                    2883 	.db #0x00	; 0
      000CA4 20                    2884 	.db #0x20	; 32
      000CA5 00                    2885 	.db #0x00	; 0
      000CA6 43                    2886 	.db #0x43	; 67	'C'
      000CA7 00                    2887 	.db #0x00	; 0
      000CA8 6F                    2888 	.db #0x6f	; 111	'o'
      000CA9 00                    2889 	.db #0x00	; 0
      000CAA 70                    2890 	.db #0x70	; 112	'p'
      000CAB 00                    2891 	.db #0x00	; 0
      000CAC 79                    2892 	.db #0x79	; 121	'y'
      000CAD 00                    2893 	.db #0x00	; 0
      000CAE 72                    2894 	.db #0x72	; 114	'r'
      000CAF 00                    2895 	.db #0x00	; 0
      000CB0 69                    2896 	.db #0x69	; 105	'i'
      000CB1 00                    2897 	.db #0x00	; 0
      000CB2 67                    2898 	.db #0x67	; 103	'g'
      000CB3 00                    2899 	.db #0x00	; 0
      000CB4 68                    2900 	.db #0x68	; 104	'h'
      000CB5 00                    2901 	.db #0x00	; 0
      000CB6 74                    2902 	.db #0x74	; 116	't'
      000CB7 00                    2903 	.db #0x00	; 0
      000CB8 20                    2904 	.db #0x20	; 32
      000CB9 00                    2905 	.db #0x00	; 0
      000CBA 28                    2906 	.db #0x28	; 40
      000CBB 00                    2907 	.db #0x00	; 0
      000CBC 63                    2908 	.db #0x63	; 99	'c'
      000CBD 00                    2909 	.db #0x00	; 0
      000CBE 29                    2910 	.db #0x29	; 41
      000CBF 00                    2911 	.db #0x00	; 0
      000CC0 20                    2912 	.db #0x20	; 32
      000CC1 00                    2913 	.db #0x00	; 0
      000CC2 32                    2914 	.db #0x32	; 50	'2'
      000CC3 00                    2915 	.db #0x00	; 0
      000CC4 30                    2916 	.db #0x30	; 48	'0'
      000CC5 00                    2917 	.db #0x00	; 0
      000CC6 30                    2918 	.db #0x30	; 48	'0'
      000CC7 00                    2919 	.db #0x00	; 0
      000CC8 32                    2920 	.db #0x32	; 50	'2'
      000CC9 00                    2921 	.db #0x00	; 0
      000CCA 20                    2922 	.db #0x20	; 32
      000CCB 00                    2923 	.db #0x00	; 0
      000CCC 41                    2924 	.db #0x41	; 65	'A'
      000CCD 00                    2925 	.db #0x00	; 0
      000CCE 72                    2926 	.db #0x72	; 114	'r'
      000CCF 00                    2927 	.db #0x00	; 0
      000CD0 6E                    2928 	.db #0x6e	; 110	'n'
      000CD1 00                    2929 	.db #0x00	; 0
      000CD2 69                    2930 	.db #0x69	; 105	'i'
      000CD3 00                    2931 	.db #0x00	; 0
      000CD4 6D                    2932 	.db #0x6d	; 109	'm'
      000CD5 00                    2933 	.db #0x00	; 0
      000CD6 20                    2934 	.db #0x20	; 32
      000CD7 00                    2935 	.db #0x00	; 0
      000CD8 4C                    2936 	.db #0x4c	; 76	'L'
      000CD9 00                    2937 	.db #0x00	; 0
      000CDA 61                    2938 	.db #0x61	; 97	'a'
      000CDB 00                    2939 	.db #0x00	; 0
      000CDC 65                    2940 	.db #0x65	; 101	'e'
      000CDD 00                    2941 	.db #0x00	; 0
      000CDE 75                    2942 	.db #0x75	; 117	'u'
      000CDF 00                    2943 	.db #0x00	; 0
      000CE0 67                    2944 	.db #0x67	; 103	'g'
      000CE1 00                    2945 	.db #0x00	; 0
      000CE2 65                    2946 	.db #0x65	; 101	'e'
      000CE3 00                    2947 	.db #0x00	; 0
      000CE4 72                    2948 	.db #0x72	; 114	'r'
      000CE5 00                    2949 	.db #0x00	; 0
      000CE6                       2950 _scancode_map:
      000CE6 00                    2951 	.db #0x00	; 0
      000CE7 78                    2952 	.db #0x78	; 120	'x'
      000CE8 81                    2953 	.db #0x81	; 129
      000CE9 79                    2954 	.db #0x79	; 121	'y'
      000CEA 80                    2955 	.db #0x80	; 128
      000CEB 3A                    2956 	.db #0x3a	; 58
      000CEC 3B                    2957 	.db #0x3b	; 59
      000CED 43                    2958 	.db #0x43	; 67	'C'
      000CEE 3C                    2959 	.db #0x3c	; 60
      000CEF 44                    2960 	.db #0x44	; 68	'D'
      000CF0 3D                    2961 	.db #0x3d	; 61
      000CF1 45                    2962 	.db #0x45	; 69	'E'
      000CF2 3E                    2963 	.db #0x3e	; 62
      000CF3 E4                    2964 	.db #0xe4	; 228
      000CF4 3F                    2965 	.db #0x3f	; 63
      000CF5 00                    2966 	.db #0x00	; 0
      000CF6 40                    2967 	.db #0x40	; 64
      000CF7 41                    2968 	.db #0x41	; 65	'A'
      000CF8 42                    2969 	.db #0x42	; 66	'B'
      000CF9 E2                    2970 	.db #0xe2	; 226
      000CFA 52                    2971 	.db #0x52	; 82	'R'
      000CFB 48                    2972 	.db #0x48	; 72	'H'
      000CFC 46                    2973 	.db #0x46	; 70	'F'
      000CFD 47                    2974 	.db #0x47	; 71	'G'
      000CFE 50                    2975 	.db #0x50	; 80	'P'
      000CFF 74                    2976 	.db #0x74	; 116	't'
      000D00 7A                    2977 	.db #0x7a	; 122	'z'
      000D01 51                    2978 	.db #0x51	; 81	'Q'
      000D02 4F                    2979 	.db #0x4f	; 79	'O'
      000D03 29                    2980 	.db #0x29	; 41
      000D04 1E                    2981 	.db #0x1e	; 30
      000D05 1F                    2982 	.db #0x1f	; 31
      000D06 20                    2983 	.db #0x20	; 32
      000D07 21                    2984 	.db #0x21	; 33
      000D08 22                    2985 	.db #0x22	; 34
      000D09 23                    2986 	.db #0x23	; 35
      000D0A 24                    2987 	.db #0x24	; 36
      000D0B 25                    2988 	.db #0x25	; 37
      000D0C 26                    2989 	.db #0x26	; 38
      000D0D 27                    2990 	.db #0x27	; 39
      000D0E 2D                    2991 	.db #0x2d	; 45
      000D0F 2E                    2992 	.db #0x2e	; 46
      000D10 35                    2993 	.db #0x35	; 53	'5'
      000D11 2A                    2994 	.db #0x2a	; 42
      000D12 49                    2995 	.db #0x49	; 73	'I'
      000D13 00                    2996 	.db #0x00	; 0
      000D14 54                    2997 	.db #0x54	; 84	'T'
      000D15 55                    2998 	.db #0x55	; 85	'U'
      000D16 00                    2999 	.db #0x00	; 0
      000D17 00                    3000 	.db #0x00	; 0
      000D18 63                    3001 	.db #0x63	; 99	'c'
      000D19 7C                    3002 	.db #0x7c	; 124
      000D1A 4A                    3003 	.db #0x4a	; 74	'J'
      000D1B 2B                    3004 	.db #0x2b	; 43
      000D1C 14                    3005 	.db #0x14	; 20
      000D1D 1A                    3006 	.db #0x1a	; 26
      000D1E 08                    3007 	.db #0x08	; 8
      000D1F 15                    3008 	.db #0x15	; 21
      000D20 17                    3009 	.db #0x17	; 23
      000D21 1C                    3010 	.db #0x1c	; 28
      000D22 18                    3011 	.db #0x18	; 24
      000D23 0C                    3012 	.db #0x0c	; 12
      000D24 12                    3013 	.db #0x12	; 18
      000D25 13                    3014 	.db #0x13	; 19
      000D26 2F                    3015 	.db #0x2f	; 47
      000D27 30                    3016 	.db #0x30	; 48	'0'
      000D28 4C                    3017 	.db #0x4c	; 76	'L'
      000D29 65                    3018 	.db #0x65	; 101	'e'
      000D2A 5F                    3019 	.db #0x5f	; 95
      000D2B 60                    3020 	.db #0x60	; 96
      000D2C 61                    3021 	.db #0x61	; 97	'a'
      000D2D 56                    3022 	.db #0x56	; 86	'V'
      000D2E 00                    3023 	.db #0x00	; 0
      000D2F 7D                    3024 	.db #0x7d	; 125
      000D30 4D                    3025 	.db #0x4d	; 77	'M'
      000D31 FF                    3026 	.db #0xff	; 255
      000D32 E0                    3027 	.db #0xe0	; 224
      000D33 04                    3028 	.db #0x04	; 4
      000D34 16                    3029 	.db #0x16	; 22
      000D35 07                    3030 	.db #0x07	; 7
      000D36 09                    3031 	.db #0x09	; 9
      000D37 0A                    3032 	.db #0x0a	; 10
      000D38 0B                    3033 	.db #0x0b	; 11
      000D39 0D                    3034 	.db #0x0d	; 13
      000D3A 0E                    3035 	.db #0x0e	; 14
      000D3B 0F                    3036 	.db #0x0f	; 15
      000D3C 33                    3037 	.db #0x33	; 51	'3'
      000D3D 34                    3038 	.db #0x34	; 52	'4'
      000D3E 31                    3039 	.db #0x31	; 49	'1'
      000D3F 28                    3040 	.db #0x28	; 40
      000D40 58                    3041 	.db #0x58	; 88	'X'
      000D41 5C                    3042 	.db #0x5c	; 92
      000D42 5D                    3043 	.db #0x5d	; 93
      000D43 5E                    3044 	.db #0x5e	; 94
      000D44 62                    3045 	.db #0x62	; 98	'b'
      000D45 7E                    3046 	.db #0x7e	; 126
      000D46 4B                    3047 	.db #0x4b	; 75	'K'
      000D47 7B                    3048 	.db #0x7b	; 123
      000D48 53                    3049 	.db #0x53	; 83	'S'
      000D49 E1                    3050 	.db #0xe1	; 225
      000D4A 1D                    3051 	.db #0x1d	; 29
      000D4B 1B                    3052 	.db #0x1b	; 27
      000D4C 06                    3053 	.db #0x06	; 6
      000D4D 19                    3054 	.db #0x19	; 25
      000D4E 05                    3055 	.db #0x05	; 5
      000D4F 11                    3056 	.db #0x11	; 17
      000D50 10                    3057 	.db #0x10	; 16
      000D51 36                    3058 	.db #0x36	; 54	'6'
      000D52 37                    3059 	.db #0x37	; 55	'7'
      000D53 38                    3060 	.db #0x38	; 56	'8'
      000D54 E5                    3061 	.db #0xe5	; 229
      000D55 00                    3062 	.db #0x00	; 0
      000D56 59                    3063 	.db #0x59	; 89	'Y'
      000D57 5A                    3064 	.db #0x5a	; 90	'Z'
      000D58 5B                    3065 	.db #0x5b	; 91
      000D59 FF                    3066 	.db #0xff	; 255
      000D5A FF                    3067 	.db #0xff	; 255
      000D5B FF                    3068 	.db #0xff	; 255
      000D5C 75                    3069 	.db #0x75	; 117	'u'
      000D5D 39                    3070 	.db #0x39	; 57	'9'
      000D5E E3                    3071 	.db #0xe3	; 227
      000D5F 2C                    3072 	.db #0x2c	; 44
      000D60 E7                    3073 	.db #0xe7	; 231
      000D61 4E                    3074 	.db #0x4e	; 78	'N'
      000D62 FF                    3075 	.db #0xff	; 255
      000D63 57                    3076 	.db #0x57	; 87	'W'
      000D64 00                    3077 	.db #0x00	; 0
      000D65 00                    3078 	.db #0x00	; 0
                                   3079 	.area XINIT   (CODE)
                                   3080 	.area CABS    (ABS,CODE)
