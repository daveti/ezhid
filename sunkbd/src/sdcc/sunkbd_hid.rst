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
                                     13 	.globl _SMOD1
                                     14 	.globl _ET2
                                     15 	.globl _TF2
                                     16 	.globl _TR2
                                     17 	.globl _TI_1
                                     18 	.globl _RI_1
                                     19 	.globl _TI_0
                                     20 	.globl _RI_0
                                     21 	.globl _ES1
                                     22 	.globl _ES0
                                     23 	.globl _EUSB
                                     24 	.globl _CY
                                     25 	.globl _AC
                                     26 	.globl _F0
                                     27 	.globl _RS1
                                     28 	.globl _RS0
                                     29 	.globl _OV
                                     30 	.globl _F1
                                     31 	.globl _P
                                     32 	.globl _PS
                                     33 	.globl _PT1
                                     34 	.globl _PX1
                                     35 	.globl _PT0
                                     36 	.globl _PX0
                                     37 	.globl _RD
                                     38 	.globl _WR
                                     39 	.globl _T1
                                     40 	.globl _T0
                                     41 	.globl _INT1
                                     42 	.globl _INT0
                                     43 	.globl _TXD
                                     44 	.globl _RXD
                                     45 	.globl _P3_7
                                     46 	.globl _P3_6
                                     47 	.globl _P3_5
                                     48 	.globl _P3_4
                                     49 	.globl _P3_3
                                     50 	.globl _P3_2
                                     51 	.globl _P3_1
                                     52 	.globl _P3_0
                                     53 	.globl _EA
                                     54 	.globl _ES
                                     55 	.globl _ET1
                                     56 	.globl _EX1
                                     57 	.globl _ET0
                                     58 	.globl _EX0
                                     59 	.globl _P2_7
                                     60 	.globl _P2_6
                                     61 	.globl _P2_5
                                     62 	.globl _P2_4
                                     63 	.globl _P2_3
                                     64 	.globl _P2_2
                                     65 	.globl _P2_1
                                     66 	.globl _P2_0
                                     67 	.globl _SM0
                                     68 	.globl _SM1
                                     69 	.globl _SM2
                                     70 	.globl _REN
                                     71 	.globl _TB8
                                     72 	.globl _RB8
                                     73 	.globl _TI
                                     74 	.globl _RI
                                     75 	.globl _P1_7
                                     76 	.globl _P1_6
                                     77 	.globl _P1_5
                                     78 	.globl _P1_4
                                     79 	.globl _P1_3
                                     80 	.globl _P1_2
                                     81 	.globl _P1_1
                                     82 	.globl _P1_0
                                     83 	.globl _TF1
                                     84 	.globl _TR1
                                     85 	.globl _TF0
                                     86 	.globl _TR0
                                     87 	.globl _IE1
                                     88 	.globl _IT1
                                     89 	.globl _IE0
                                     90 	.globl _IT0
                                     91 	.globl _P0_7
                                     92 	.globl _P0_6
                                     93 	.globl _P0_5
                                     94 	.globl _P0_4
                                     95 	.globl _P0_3
                                     96 	.globl _P0_2
                                     97 	.globl _P0_1
                                     98 	.globl _P0_0
                                     99 	.globl _DPH1
                                    100 	.globl _DPL1
                                    101 	.globl _DPH0
                                    102 	.globl _DPL0
                                    103 	.globl _EICON
                                    104 	.globl _TH2
                                    105 	.globl _TL2
                                    106 	.globl _RCAP2H
                                    107 	.globl _RCAP2L
                                    108 	.globl _T2CON
                                    109 	.globl _CKCON
                                    110 	.globl _SBUF1
                                    111 	.globl _SBUF0
                                    112 	.globl _SCON1
                                    113 	.globl _SCON0
                                    114 	.globl _EIE
                                    115 	.globl _MPAGE
                                    116 	.globl _EXIF
                                    117 	.globl _DPS
                                    118 	.globl _B
                                    119 	.globl _ACC
                                    120 	.globl _PSW
                                    121 	.globl _IP
                                    122 	.globl _P3
                                    123 	.globl _IE
                                    124 	.globl _P2
                                    125 	.globl _SBUF
                                    126 	.globl _SCON
                                    127 	.globl _P1
                                    128 	.globl _TH1
                                    129 	.globl _TH0
                                    130 	.globl _TL1
                                    131 	.globl _TL0
                                    132 	.globl _TMOD
                                    133 	.globl _TCON
                                    134 	.globl _PCON
                                    135 	.globl _DPH
                                    136 	.globl _DPL
                                    137 	.globl _SP
                                    138 	.globl _P0
                                    139 	.globl _AUTODATA
                                    140 	.globl _AUTOPTRL
                                    141 	.globl _AUTOPTRH
                                    142 	.globl _FASTXFR
                                    143 	.globl _OUT07VAL
                                    144 	.globl _IN07VAL
                                    145 	.globl _I2DAT
                                    146 	.globl _I2CS
                                    147 	.globl _SETUPDAT
                                    148 	.globl _SUDPTRL
                                    149 	.globl _SUDPTRH
                                    150 	.globl _TOGCTL
                                    151 	.globl _USBCS
                                    152 	.globl _USBBAV
                                    153 	.globl _USBPAIR
                                    154 	.globl _USBIEN
                                    155 	.globl _USBIRQ
                                    156 	.globl _OUT07IEN
                                    157 	.globl _IN07IEN
                                    158 	.globl _OUT07IRQ
                                    159 	.globl _IN07IRQ
                                    160 	.globl _ISOCTL
                                    161 	.globl _PORTCCFG
                                    162 	.globl _PORTBCFG
                                    163 	.globl _PORTACFG
                                    164 	.globl _PINSC
                                    165 	.globl _OUTC
                                    166 	.globl _OEC
                                    167 	.globl _PINSB
                                    168 	.globl _OUTB
                                    169 	.globl _OEB
                                    170 	.globl _PINSA
                                    171 	.globl _OUTA
                                    172 	.globl _OEA
                                    173 	.globl _OUT4BC
                                    174 	.globl _IN4BC
                                    175 	.globl _OUT4CS
                                    176 	.globl _IN4CS
                                    177 	.globl _OUT4BUF
                                    178 	.globl _IN4BUF
                                    179 	.globl _OUT3BC
                                    180 	.globl _OUT3CS
                                    181 	.globl _IN3BC
                                    182 	.globl _IN3CS
                                    183 	.globl _OUT3BUF
                                    184 	.globl _IN3BUF
                                    185 	.globl _OUT2BUF
                                    186 	.globl _OUT2CS
                                    187 	.globl _OUT2BC
                                    188 	.globl _IN2CS
                                    189 	.globl _IN2BC
                                    190 	.globl _IN2BUF
                                    191 	.globl _OUT1BC
                                    192 	.globl _OUT1CS
                                    193 	.globl _OUT1BUF
                                    194 	.globl _IN1BC
                                    195 	.globl _IN1BUF
                                    196 	.globl _IN1CS
                                    197 	.globl _OUT0BC
                                    198 	.globl _OUT0BUF
                                    199 	.globl _IN0BC
                                    200 	.globl _IN0BUF
                                    201 	.globl _EP0CS
                                    202 	.globl _kbd_txmit_me
                                    203 	.globl _key_buffer
                                    204 ;--------------------------------------------------------
                                    205 ; special function registers
                                    206 ;--------------------------------------------------------
                                    207 	.area RSEG    (ABS,DATA)
      000000                        208 	.org 0x0000
                           000080   209 _P0	=	0x0080
                           000081   210 _SP	=	0x0081
                           000082   211 _DPL	=	0x0082
                           000083   212 _DPH	=	0x0083
                           000087   213 _PCON	=	0x0087
                           000088   214 _TCON	=	0x0088
                           000089   215 _TMOD	=	0x0089
                           00008A   216 _TL0	=	0x008a
                           00008B   217 _TL1	=	0x008b
                           00008C   218 _TH0	=	0x008c
                           00008D   219 _TH1	=	0x008d
                           000090   220 _P1	=	0x0090
                           000098   221 _SCON	=	0x0098
                           000099   222 _SBUF	=	0x0099
                           0000A0   223 _P2	=	0x00a0
                           0000A8   224 _IE	=	0x00a8
                           0000B0   225 _P3	=	0x00b0
                           0000B8   226 _IP	=	0x00b8
                           0000D0   227 _PSW	=	0x00d0
                           0000E0   228 _ACC	=	0x00e0
                           0000F0   229 _B	=	0x00f0
                           000086   230 _DPS	=	0x0086
                           000091   231 _EXIF	=	0x0091
                           000092   232 _MPAGE	=	0x0092
                           0000E8   233 _EIE	=	0x00e8
                           000098   234 _SCON0	=	0x0098
                           0000C0   235 _SCON1	=	0x00c0
                           000099   236 _SBUF0	=	0x0099
                           0000C1   237 _SBUF1	=	0x00c1
                           00008E   238 _CKCON	=	0x008e
                           0000C8   239 _T2CON	=	0x00c8
                           0000CA   240 _RCAP2L	=	0x00ca
                           0000CB   241 _RCAP2H	=	0x00cb
                           0000CC   242 _TL2	=	0x00cc
                           0000CD   243 _TH2	=	0x00cd
                           0000D8   244 _EICON	=	0x00d8
                           000082   245 _DPL0	=	0x0082
                           000083   246 _DPH0	=	0x0083
                           000084   247 _DPL1	=	0x0084
                           000085   248 _DPH1	=	0x0085
                                    249 ;--------------------------------------------------------
                                    250 ; special function bits
                                    251 ;--------------------------------------------------------
                                    252 	.area RSEG    (ABS,DATA)
      000000                        253 	.org 0x0000
                           000080   254 _P0_0	=	0x0080
                           000081   255 _P0_1	=	0x0081
                           000082   256 _P0_2	=	0x0082
                           000083   257 _P0_3	=	0x0083
                           000084   258 _P0_4	=	0x0084
                           000085   259 _P0_5	=	0x0085
                           000086   260 _P0_6	=	0x0086
                           000087   261 _P0_7	=	0x0087
                           000088   262 _IT0	=	0x0088
                           000089   263 _IE0	=	0x0089
                           00008A   264 _IT1	=	0x008a
                           00008B   265 _IE1	=	0x008b
                           00008C   266 _TR0	=	0x008c
                           00008D   267 _TF0	=	0x008d
                           00008E   268 _TR1	=	0x008e
                           00008F   269 _TF1	=	0x008f
                           000090   270 _P1_0	=	0x0090
                           000091   271 _P1_1	=	0x0091
                           000092   272 _P1_2	=	0x0092
                           000093   273 _P1_3	=	0x0093
                           000094   274 _P1_4	=	0x0094
                           000095   275 _P1_5	=	0x0095
                           000096   276 _P1_6	=	0x0096
                           000097   277 _P1_7	=	0x0097
                           000098   278 _RI	=	0x0098
                           000099   279 _TI	=	0x0099
                           00009A   280 _RB8	=	0x009a
                           00009B   281 _TB8	=	0x009b
                           00009C   282 _REN	=	0x009c
                           00009D   283 _SM2	=	0x009d
                           00009E   284 _SM1	=	0x009e
                           00009F   285 _SM0	=	0x009f
                           0000A0   286 _P2_0	=	0x00a0
                           0000A1   287 _P2_1	=	0x00a1
                           0000A2   288 _P2_2	=	0x00a2
                           0000A3   289 _P2_3	=	0x00a3
                           0000A4   290 _P2_4	=	0x00a4
                           0000A5   291 _P2_5	=	0x00a5
                           0000A6   292 _P2_6	=	0x00a6
                           0000A7   293 _P2_7	=	0x00a7
                           0000A8   294 _EX0	=	0x00a8
                           0000A9   295 _ET0	=	0x00a9
                           0000AA   296 _EX1	=	0x00aa
                           0000AB   297 _ET1	=	0x00ab
                           0000AC   298 _ES	=	0x00ac
                           0000AF   299 _EA	=	0x00af
                           0000B0   300 _P3_0	=	0x00b0
                           0000B1   301 _P3_1	=	0x00b1
                           0000B2   302 _P3_2	=	0x00b2
                           0000B3   303 _P3_3	=	0x00b3
                           0000B4   304 _P3_4	=	0x00b4
                           0000B5   305 _P3_5	=	0x00b5
                           0000B6   306 _P3_6	=	0x00b6
                           0000B7   307 _P3_7	=	0x00b7
                           0000B0   308 _RXD	=	0x00b0
                           0000B1   309 _TXD	=	0x00b1
                           0000B2   310 _INT0	=	0x00b2
                           0000B3   311 _INT1	=	0x00b3
                           0000B4   312 _T0	=	0x00b4
                           0000B5   313 _T1	=	0x00b5
                           0000B6   314 _WR	=	0x00b6
                           0000B7   315 _RD	=	0x00b7
                           0000B8   316 _PX0	=	0x00b8
                           0000B9   317 _PT0	=	0x00b9
                           0000BA   318 _PX1	=	0x00ba
                           0000BB   319 _PT1	=	0x00bb
                           0000BC   320 _PS	=	0x00bc
                           0000D0   321 _P	=	0x00d0
                           0000D1   322 _F1	=	0x00d1
                           0000D2   323 _OV	=	0x00d2
                           0000D3   324 _RS0	=	0x00d3
                           0000D4   325 _RS1	=	0x00d4
                           0000D5   326 _F0	=	0x00d5
                           0000D6   327 _AC	=	0x00d6
                           0000D7   328 _CY	=	0x00d7
                           0000E8   329 _EUSB	=	0x00e8
                           0000AC   330 _ES0	=	0x00ac
                           0000AE   331 _ES1	=	0x00ae
                           000098   332 _RI_0	=	0x0098
                           000099   333 _TI_0	=	0x0099
                           0000C0   334 _RI_1	=	0x00c0
                           0000C1   335 _TI_1	=	0x00c1
                           0000CA   336 _TR2	=	0x00ca
                           0000CF   337 _TF2	=	0x00cf
                           0000AD   338 _ET2	=	0x00ad
                           0000DF   339 _SMOD1	=	0x00df
                                    340 ;--------------------------------------------------------
                                    341 ; overlayable register banks
                                    342 ;--------------------------------------------------------
                                    343 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        344 	.ds 8
                                    345 	.area REG_BANK_1	(REL,OVR,DATA)
      000008                        346 	.ds 8
                                    347 	.area REG_BANK_2	(REL,OVR,DATA)
      000010                        348 	.ds 8
                                    349 	.area REG_BANK_3	(REL,OVR,DATA)
      000018                        350 	.ds 8
                                    351 ;--------------------------------------------------------
                                    352 ; overlayable bit register bank
                                    353 ;--------------------------------------------------------
                                    354 	.area BIT_BANK	(REL,OVR,DATA)
      000021                        355 bits:
      000021                        356 	.ds 1
                           008000   357 	b0 = bits[0]
                           008100   358 	b1 = bits[1]
                           008200   359 	b2 = bits[2]
                           008300   360 	b3 = bits[3]
                           008400   361 	b4 = bits[4]
                           008500   362 	b5 = bits[5]
                           008600   363 	b6 = bits[6]
                           008700   364 	b7 = bits[7]
                                    365 ;--------------------------------------------------------
                                    366 ; internal ram data
                                    367 ;--------------------------------------------------------
                                    368 	.area DSEG    (DATA)
      000022                        369 _sunkbd_type:
      000022                        370 	.ds 1
      000023                        371 _sunkbd_reset:
      000023                        372 	.ds 1
      000024                        373 _sunkbd_layout:
      000024                        374 	.ds 1
      000025                        375 _key_buffer::
      000025                        376 	.ds 8
      00002D                        377 _kbd_txmit_me::
      00002D                        378 	.ds 1
      00002E                        379 _kbd_idle_duration:
      00002E                        380 	.ds 1
      00002F                        381 _kbd_idle_counter:
      00002F                        382 	.ds 1
      000030                        383 _string_index:
      000030                        384 	.ds 8
      000038                        385 _sdat:
      000038                        386 	.ds 2
                                    387 ;--------------------------------------------------------
                                    388 ; overlayable items in internal ram 
                                    389 ;--------------------------------------------------------
                                    390 	.area	OSEG    (OVR,DATA)
                                    391 	.area	OSEG    (OVR,DATA)
                                    392 ;--------------------------------------------------------
                                    393 ; Stack segment in internal ram 
                                    394 ;--------------------------------------------------------
                                    395 	.area	SSEG
      00003A                        396 __start__stack:
      00003A                        397 	.ds	1
                                    398 
                                    399 ;--------------------------------------------------------
                                    400 ; indirectly addressable internal ram data
                                    401 ;--------------------------------------------------------
                                    402 	.area ISEG    (DATA)
                                    403 ;--------------------------------------------------------
                                    404 ; absolute internal ram data
                                    405 ;--------------------------------------------------------
                                    406 	.area IABS    (ABS,DATA)
                                    407 	.area IABS    (ABS,DATA)
                                    408 ;--------------------------------------------------------
                                    409 ; bit data
                                    410 ;--------------------------------------------------------
                                    411 	.area BSEG    (BIT)
      000000                        412 _kbd_new_keys:
      000000                        413 	.ds 1
      000001                        414 _is_ctrl_out0_kbd:
      000001                        415 	.ds 1
      000002                        416 _kbd_idle_mode:
      000002                        417 	.ds 1
      000003                        418 _in1_busy:
      000003                        419 	.ds 1
      000004                        420 _kbd_serial_isr_parse_scancode_1_38:
      000004                        421 	.ds 1
                                    422 ;--------------------------------------------------------
                                    423 ; paged external ram data
                                    424 ;--------------------------------------------------------
                                    425 	.area PSEG    (PAG,XDATA)
                                    426 ;--------------------------------------------------------
                                    427 ; external ram data
                                    428 ;--------------------------------------------------------
                                    429 	.area XSEG    (XDATA)
                           007FB4   430 _EP0CS	=	0x7fb4
                           007F00   431 _IN0BUF	=	0x7f00
                           007FB5   432 _IN0BC	=	0x7fb5
                           007EC0   433 _OUT0BUF	=	0x7ec0
                           007FC5   434 _OUT0BC	=	0x7fc5
                           007FB6   435 _IN1CS	=	0x7fb6
                           007E80   436 _IN1BUF	=	0x7e80
                           007FB7   437 _IN1BC	=	0x7fb7
                           007E40   438 _OUT1BUF	=	0x7e40
                           007FC6   439 _OUT1CS	=	0x7fc6
                           007FC7   440 _OUT1BC	=	0x7fc7
                           007E00   441 _IN2BUF	=	0x7e00
                           007FB9   442 _IN2BC	=	0x7fb9
                           007FB8   443 _IN2CS	=	0x7fb8
                           007FC9   444 _OUT2BC	=	0x7fc9
                           007FC8   445 _OUT2CS	=	0x7fc8
                           007DC0   446 _OUT2BUF	=	0x7dc0
                           007D80   447 _IN3BUF	=	0x7d80
                           007D40   448 _OUT3BUF	=	0x7d40
                           007FBA   449 _IN3CS	=	0x7fba
                           007FBB   450 _IN3BC	=	0x7fbb
                           007FCA   451 _OUT3CS	=	0x7fca
                           007FCB   452 _OUT3BC	=	0x7fcb
                           007D00   453 _IN4BUF	=	0x7d00
                           007CC0   454 _OUT4BUF	=	0x7cc0
                           007FBC   455 _IN4CS	=	0x7fbc
                           007FCC   456 _OUT4CS	=	0x7fcc
                           007FBD   457 _IN4BC	=	0x7fbd
                           007FCD   458 _OUT4BC	=	0x7fcd
                           007F9C   459 _OEA	=	0x7f9c
                           007F96   460 _OUTA	=	0x7f96
                           007F99   461 _PINSA	=	0x7f99
                           007F9D   462 _OEB	=	0x7f9d
                           007F97   463 _OUTB	=	0x7f97
                           007F9A   464 _PINSB	=	0x7f9a
                           007F9E   465 _OEC	=	0x7f9e
                           007F98   466 _OUTC	=	0x7f98
                           007F9B   467 _PINSC	=	0x7f9b
                           007F93   468 _PORTACFG	=	0x7f93
                           007F94   469 _PORTBCFG	=	0x7f94
                           007F95   470 _PORTCCFG	=	0x7f95
                           007FA1   471 _ISOCTL	=	0x7fa1
                           007FA9   472 _IN07IRQ	=	0x7fa9
                           007FAA   473 _OUT07IRQ	=	0x7faa
                           007FAC   474 _IN07IEN	=	0x7fac
                           007FAD   475 _OUT07IEN	=	0x7fad
                           007FAB   476 _USBIRQ	=	0x7fab
                           007FAE   477 _USBIEN	=	0x7fae
                           007FDD   478 _USBPAIR	=	0x7fdd
                           007FAF   479 _USBBAV	=	0x7faf
                           007FD6   480 _USBCS	=	0x7fd6
                           007FD7   481 _TOGCTL	=	0x7fd7
                           007FD4   482 _SUDPTRH	=	0x7fd4
                           007FD5   483 _SUDPTRL	=	0x7fd5
                           007FE8   484 _SETUPDAT	=	0x7fe8
                           007FA5   485 _I2CS	=	0x7fa5
                           007FA6   486 _I2DAT	=	0x7fa6
                           007FDE   487 _IN07VAL	=	0x7fde
                           007FDF   488 _OUT07VAL	=	0x7fdf
                           007FE2   489 _FASTXFR	=	0x7fe2
                           007FE3   490 _AUTOPTRH	=	0x7fe3
                           007FE4   491 _AUTOPTRL	=	0x7fe4
                           007FE5   492 _AUTODATA	=	0x7fe5
                                    493 ;--------------------------------------------------------
                                    494 ; absolute external ram data
                                    495 ;--------------------------------------------------------
                                    496 	.area XABS    (ABS,XDATA)
                                    497 ;--------------------------------------------------------
                                    498 ; external initialized ram data
                                    499 ;--------------------------------------------------------
                                    500 	.area XISEG   (XDATA)
                                    501 	.area HOME    (CODE)
                                    502 	.area GSINIT0 (CODE)
                                    503 	.area GSINIT1 (CODE)
                                    504 	.area GSINIT2 (CODE)
                                    505 	.area GSINIT3 (CODE)
                                    506 	.area GSINIT4 (CODE)
                                    507 	.area GSINIT5 (CODE)
                                    508 	.area GSINIT  (CODE)
                                    509 	.area GSFINAL (CODE)
                                    510 	.area CSEG    (CODE)
                                    511 ;--------------------------------------------------------
                                    512 ; interrupt vector 
                                    513 ;--------------------------------------------------------
                                    514 	.area HOME    (CODE)
      000000                        515 __interrupt_vect:
      000000 02 00 49         [24]  516 	ljmp	__sdcc_gsinit_startup
      000003 32               [24]  517 	reti
      000004                        518 	.ds	7
      00000B 32               [24]  519 	reti
      00000C                        520 	.ds	7
      000013 32               [24]  521 	reti
      000014                        522 	.ds	7
      00001B 32               [24]  523 	reti
      00001C                        524 	.ds	7
      000023 02 06 6F         [24]  525 	ljmp	_kbd_serial_isr
      000026                        526 	.ds	5
      00002B 02 07 A3         [24]  527 	ljmp	_timer2_isr
      00002E                        528 	.ds	5
      000033 32               [24]  529 	reti
      000034                        530 	.ds	7
      00003B 32               [24]  531 	reti
      00003C                        532 	.ds	7
      000043 02 01 EF         [24]  533 	ljmp	_usb_isr
                                    534 ;--------------------------------------------------------
                                    535 ; global & static initialisations
                                    536 ;--------------------------------------------------------
                                    537 	.area HOME    (CODE)
                                    538 	.area GSINIT  (CODE)
                                    539 	.area GSFINAL (CODE)
                                    540 	.area GSINIT  (CODE)
                                    541 	.globl __sdcc_gsinit_startup
                                    542 	.globl __sdcc_program_startup
                                    543 	.globl __start__stack
                                    544 	.globl __mcs51_genXINIT
                                    545 	.globl __mcs51_genXRAMCLEAR
                                    546 	.globl __mcs51_genRAMCLEAR
                                    547 ;	sunkbd_hid.h:427: static __data unsigned int string_index[NUM_STRING] = {
      0000A2 7E AF            [12]  548 	mov	r6,#_string_langid
      0000A4 7F 09            [12]  549 	mov	r7,#(_string_langid >> 8)
      0000A6 8E 30            [24]  550 	mov	(_string_index + 0),r6
      0000A8 8F 31            [24]  551 	mov	(_string_index + 1),r7
      0000AA 7E B3            [12]  552 	mov	r6,#_string_mfg
      0000AC 7F 09            [12]  553 	mov	r7,#(_string_mfg >> 8)
      0000AE 8E 32            [24]  554 	mov	((_string_index + 0x0002) + 0),r6
      0000B0 8F 33            [24]  555 	mov	((_string_index + 0x0002) + 1),r7
      0000B2 7E D5            [12]  556 	mov	r6,#_string_prod
      0000B4 7F 09            [12]  557 	mov	r7,#(_string_prod >> 8)
      0000B6 8E 34            [24]  558 	mov	((_string_index + 0x0004) + 0),r6
      0000B8 8F 35            [24]  559 	mov	((_string_index + 0x0004) + 1),r7
      0000BA 7E F7            [12]  560 	mov	r6,#_string_if_keyboard
      0000BC 7F 09            [12]  561 	mov	r7,#(_string_if_keyboard >> 8)
      0000BE 8E 36            [24]  562 	mov	((_string_index + 0x0006) + 0),r6
      0000C0 8F 37            [24]  563 	mov	((_string_index + 0x0006) + 1),r7
                                    564 ;	sunkbd_hid.h:462: static __xdata setup_dat * __data sdat = (__xdata setup_dat *)&SETUPDAT;
      0000C2 75 38 E8         [24]  565 	mov	_sdat,#_SETUPDAT
      0000C5 75 39 7F         [24]  566 	mov	(_sdat + 1),#(_SETUPDAT >> 8)
                                    567 	.area GSFINAL (CODE)
      0000C8 02 00 46         [24]  568 	ljmp	__sdcc_program_startup
                                    569 ;--------------------------------------------------------
                                    570 ; Home
                                    571 ;--------------------------------------------------------
                                    572 	.area HOME    (CODE)
                                    573 	.area HOME    (CODE)
      000046                        574 __sdcc_program_startup:
      000046 02 08 FB         [24]  575 	ljmp	_main
                                    576 ;	return from main will return to caller
                                    577 ;--------------------------------------------------------
                                    578 ; code
                                    579 ;--------------------------------------------------------
                                    580 	.area CSEG    (CODE)
                                    581 ;------------------------------------------------------------
                                    582 ;Allocation info for local variables in function 'apply_reset_values'
                                    583 ;------------------------------------------------------------
                                    584 ;	sunkbd_hid.c:50: static void apply_reset_values()
                                    585 ;	-----------------------------------------
                                    586 ;	 function apply_reset_values
                                    587 ;	-----------------------------------------
      0000CB                        588 _apply_reset_values:
                           000007   589 	ar7 = 0x07
                           000006   590 	ar6 = 0x06
                           000005   591 	ar5 = 0x05
                           000004   592 	ar4 = 0x04
                           000003   593 	ar3 = 0x03
                           000002   594 	ar2 = 0x02
                           000001   595 	ar1 = 0x01
                           000000   596 	ar0 = 0x00
                                    597 ;	sunkbd_hid.c:54: kbd_txmit_me        = -1;
      0000CB 75 2D FF         [24]  598 	mov	_kbd_txmit_me,#0xff
                                    599 ;	sunkbd_hid.c:55: kbd_new_keys        = 0;
      0000CE C2 00            [12]  600 	clr	_kbd_new_keys
                                    601 ;	sunkbd_hid.c:56: is_ctrl_out0_kbd    = 0;
      0000D0 C2 01            [12]  602 	clr	_is_ctrl_out0_kbd
                                    603 ;	sunkbd_hid.c:57: kbd_idle_mode       = FALSE;
      0000D2 C2 02            [12]  604 	clr	_kbd_idle_mode
                                    605 ;	sunkbd_hid.c:58: kbd_idle_duration   = 125;
      0000D4 75 2E 7D         [24]  606 	mov	_kbd_idle_duration,#0x7d
                                    607 ;	sunkbd_hid.c:59: in1_busy            = FALSE;
      0000D7 C2 03            [12]  608 	clr	_in1_busy
      0000D9 22               [24]  609 	ret
                                    610 ;------------------------------------------------------------
                                    611 ;Allocation info for local variables in function 'get_descriptor'
                                    612 ;------------------------------------------------------------
                                    613 ;	sunkbd_hid.c:86: static void get_descriptor(void) __using (1)
                                    614 ;	-----------------------------------------
                                    615 ;	 function get_descriptor
                                    616 ;	-----------------------------------------
      0000DA                        617 _get_descriptor:
                           00000F   618 	ar7 = 0x0f
                           00000E   619 	ar6 = 0x0e
                           00000D   620 	ar5 = 0x0d
                           00000C   621 	ar4 = 0x0c
                           00000B   622 	ar3 = 0x0b
                           00000A   623 	ar2 = 0x0a
                           000009   624 	ar1 = 0x09
                           000008   625 	ar0 = 0x08
                                    626 ;	sunkbd_hid.c:88: switch (sdat->wValueH) {
      0000DA 85 38 82         [24]  627 	mov	dpl,_sdat
      0000DD 85 39 83         [24]  628 	mov	dph,(_sdat + 1)
      0000E0 A3               [24]  629 	inc	dptr
      0000E1 A3               [24]  630 	inc	dptr
      0000E2 A3               [24]  631 	inc	dptr
      0000E3 E0               [24]  632 	movx	a,@dptr
      0000E4 FF               [12]  633 	mov	r7,a
      0000E5 BF 01 02         [24]  634 	cjne	r7,#0x01,00143$
      0000E8 80 19            [24]  635 	sjmp	00101$
      0000EA                        636 00143$:
      0000EA BF 02 02         [24]  637 	cjne	r7,#0x02,00144$
      0000ED 80 2D            [24]  638 	sjmp	00102$
      0000EF                        639 00144$:
      0000EF BF 03 02         [24]  640 	cjne	r7,#0x03,00145$
      0000F2 80 41            [24]  641 	sjmp	00103$
      0000F4                        642 00145$:
      0000F4 BF 21 03         [24]  643 	cjne	r7,#0x21,00146$
      0000F7 02 01 82         [24]  644 	ljmp	00107$
      0000FA                        645 00146$:
      0000FA BF 22 03         [24]  646 	cjne	r7,#0x22,00147$
      0000FD 02 01 B8         [24]  647 	ljmp	00111$
      000100                        648 00147$:
      000100 02 01 E8         [24]  649 	ljmp	00115$
                                    650 ;	sunkbd_hid.c:90: case USB_DT_DEVICE:
      000103                        651 00101$:
                                    652 ;	sunkbd_hid.c:91: EP0CS   = 0x02;   /* clear HSNACK */
      000103 90 7F B4         [24]  653 	mov	dptr,#_EP0CS
      000106 74 02            [12]  654 	mov	a,#0x02
      000108 F0               [24]  655 	movx	@dptr,a
                                    656 ;	sunkbd_hid.c:92: SUDPTRH = (Byte)((unsigned int)dev_desc >> 8);
      000109 7E 3C            [12]  657 	mov	r6,#_dev_desc
      00010B 7F 09            [12]  658 	mov	r7,#(_dev_desc >> 8)
      00010D 90 7F D4         [24]  659 	mov	dptr,#_SUDPTRH
      000110 EF               [12]  660 	mov	a,r7
      000111 F0               [24]  661 	movx	@dptr,a
                                    662 ;	sunkbd_hid.c:93: SUDPTRL = (unsigned int)dev_desc & 0xff;
      000112 7E 3C            [12]  663 	mov	r6,#_dev_desc
      000114 7F 09            [12]  664 	mov	r7,#(_dev_desc >> 8)
      000116 90 7F D5         [24]  665 	mov	dptr,#_SUDPTRL
      000119 EE               [12]  666 	mov	a,r6
      00011A F0               [24]  667 	movx	@dptr,a
                                    668 ;	sunkbd_hid.c:94: break;
      00011B 22               [24]  669 	ret
                                    670 ;	sunkbd_hid.c:97: case USB_DT_CONFIG:
      00011C                        671 00102$:
                                    672 ;	sunkbd_hid.c:98: EP0CS   = 0x02;   /* clear HSNACK */
      00011C 90 7F B4         [24]  673 	mov	dptr,#_EP0CS
      00011F 74 02            [12]  674 	mov	a,#0x02
      000121 F0               [24]  675 	movx	@dptr,a
                                    676 ;	sunkbd_hid.c:99: SUDPTRH = (Byte)((unsigned int)conf_desc >> 8);
      000122 7E 4E            [12]  677 	mov	r6,#_conf_desc
      000124 7F 09            [12]  678 	mov	r7,#(_conf_desc >> 8)
      000126 90 7F D4         [24]  679 	mov	dptr,#_SUDPTRH
      000129 EF               [12]  680 	mov	a,r7
      00012A F0               [24]  681 	movx	@dptr,a
                                    682 ;	sunkbd_hid.c:100: SUDPTRL = (unsigned int)conf_desc & 0xff;
      00012B 7E 4E            [12]  683 	mov	r6,#_conf_desc
      00012D 7F 09            [12]  684 	mov	r7,#(_conf_desc >> 8)
      00012F 90 7F D5         [24]  685 	mov	dptr,#_SUDPTRL
      000132 EE               [12]  686 	mov	a,r6
      000133 F0               [24]  687 	movx	@dptr,a
                                    688 ;	sunkbd_hid.c:101: break;
      000134 22               [24]  689 	ret
                                    690 ;	sunkbd_hid.c:104: case USB_DT_STRING:
      000135                        691 00103$:
                                    692 ;	sunkbd_hid.c:105: if (sdat->wValueL < NUM_STRING) {
      000135 85 38 82         [24]  693 	mov	dpl,_sdat
      000138 85 39 83         [24]  694 	mov	dph,(_sdat + 1)
      00013B A3               [24]  695 	inc	dptr
      00013C A3               [24]  696 	inc	dptr
      00013D E0               [24]  697 	movx	a,@dptr
      00013E FF               [12]  698 	mov	r7,a
      00013F BF 04 00         [24]  699 	cjne	r7,#0x04,00148$
      000142                        700 00148$:
      000142 50 37            [24]  701 	jnc	00105$
                                    702 ;	sunkbd_hid.c:106: EP0CS     = 0x02;   /* clear HSNACK */
      000144 90 7F B4         [24]  703 	mov	dptr,#_EP0CS
      000147 74 02            [12]  704 	mov	a,#0x02
      000149 F0               [24]  705 	movx	@dptr,a
                                    706 ;	sunkbd_hid.c:107: SUDPTRH = (Byte)(string_index[sdat->wValueL] >> 8);
      00014A 85 38 82         [24]  707 	mov	dpl,_sdat
      00014D 85 39 83         [24]  708 	mov	dph,(_sdat + 1)
      000150 A3               [24]  709 	inc	dptr
      000151 A3               [24]  710 	inc	dptr
      000152 E0               [24]  711 	movx	a,@dptr
      000153 25 E0            [12]  712 	add	a,acc
      000155 24 30            [12]  713 	add	a,#_string_index
      000157 F9               [12]  714 	mov	r1,a
      000158 87 0E            [24]  715 	mov	ar6,@r1
      00015A 09               [12]  716 	inc	r1
      00015B 87 0F            [24]  717 	mov	ar7,@r1
      00015D 90 7F D4         [24]  718 	mov	dptr,#_SUDPTRH
      000160 EF               [12]  719 	mov	a,r7
      000161 F0               [24]  720 	movx	@dptr,a
                                    721 ;	sunkbd_hid.c:108: SUDPTRL = string_index[sdat->wValueL] & 0xff;
      000162 85 38 82         [24]  722 	mov	dpl,_sdat
      000165 85 39 83         [24]  723 	mov	dph,(_sdat + 1)
      000168 A3               [24]  724 	inc	dptr
      000169 A3               [24]  725 	inc	dptr
      00016A E0               [24]  726 	movx	a,@dptr
      00016B 25 E0            [12]  727 	add	a,acc
      00016D 24 30            [12]  728 	add	a,#_string_index
      00016F F9               [12]  729 	mov	r1,a
      000170 87 0E            [24]  730 	mov	ar6,@r1
      000172 09               [12]  731 	inc	r1
      000173 87 0F            [24]  732 	mov	ar7,@r1
      000175 90 7F D5         [24]  733 	mov	dptr,#_SUDPTRL
      000178 EE               [12]  734 	mov	a,r6
      000179 F0               [24]  735 	movx	@dptr,a
      00017A 22               [24]  736 	ret
      00017B                        737 00105$:
                                    738 ;	sunkbd_hid.c:110: EP0CS     = 0x03;   /* stall */
      00017B 90 7F B4         [24]  739 	mov	dptr,#_EP0CS
      00017E 74 03            [12]  740 	mov	a,#0x03
      000180 F0               [24]  741 	movx	@dptr,a
                                    742 ;	sunkbd_hid.c:112: break;
                                    743 ;	sunkbd_hid.c:115: case USB_DT_HID:
      000181 22               [24]  744 	ret
      000182                        745 00107$:
                                    746 ;	sunkbd_hid.c:131: if (sdat->wIndexL == 0) {
      000182 74 04            [12]  747 	mov	a,#0x04
      000184 25 38            [12]  748 	add	a,_sdat
      000186 FE               [12]  749 	mov	r6,a
      000187 E4               [12]  750 	clr	a
      000188 35 39            [12]  751 	addc	a,(_sdat + 1)
      00018A FF               [12]  752 	mov	r7,a
      00018B 8E 82            [24]  753 	mov	dpl,r6
      00018D 8F 83            [24]  754 	mov	dph,r7
      00018F E0               [24]  755 	movx	a,@dptr
      000190 70 1F            [24]  756 	jnz	00109$
                                    757 ;	sunkbd_hid.c:133: EP0CS   = 0x02;   /* clear HSNACK */
      000192 90 7F B4         [24]  758 	mov	dptr,#_EP0CS
      000195 74 02            [12]  759 	mov	a,#0x02
      000197 F0               [24]  760 	movx	@dptr,a
                                    761 ;	sunkbd_hid.c:135: SUDPTRH = (Byte)(((unsigned int)conf_desc) + 18 >> 8);
      000198 7E 4E            [12]  762 	mov	r6,#_conf_desc
      00019A 7F 09            [12]  763 	mov	r7,#(_conf_desc >> 8)
      00019C 74 12            [12]  764 	mov	a,#0x12
      00019E 2E               [12]  765 	add	a,r6
      00019F E4               [12]  766 	clr	a
      0001A0 3F               [12]  767 	addc	a,r7
      0001A1 90 7F D4         [24]  768 	mov	dptr,#_SUDPTRH
      0001A4 F0               [24]  769 	movx	@dptr,a
                                    770 ;	sunkbd_hid.c:136: SUDPTRL = ((unsigned int)conf_desc) + 18 & 0xff;
      0001A5 7E 4E            [12]  771 	mov	r6,#_conf_desc
      0001A7 7F 09            [12]  772 	mov	r7,#(_conf_desc >> 8)
      0001A9 90 7F D5         [24]  773 	mov	dptr,#_SUDPTRL
      0001AC 74 12            [12]  774 	mov	a,#0x12
      0001AE 2E               [12]  775 	add	a,r6
      0001AF F0               [24]  776 	movx	@dptr,a
      0001B0 22               [24]  777 	ret
      0001B1                        778 00109$:
                                    779 ;	sunkbd_hid.c:141: EP0CS   = 0x03;   /* stall */
      0001B1 90 7F B4         [24]  780 	mov	dptr,#_EP0CS
      0001B4 74 03            [12]  781 	mov	a,#0x03
      0001B6 F0               [24]  782 	movx	@dptr,a
                                    783 ;	sunkbd_hid.c:143: break;
                                    784 ;	sunkbd_hid.c:146: case USB_DT_REPORT:
      0001B7 22               [24]  785 	ret
      0001B8                        786 00111$:
                                    787 ;	sunkbd_hid.c:160: if (sdat->wIndexL == 0) {
      0001B8 74 04            [12]  788 	mov	a,#0x04
      0001BA 25 38            [12]  789 	add	a,_sdat
      0001BC FE               [12]  790 	mov	r6,a
      0001BD E4               [12]  791 	clr	a
      0001BE 35 39            [12]  792 	addc	a,(_sdat + 1)
      0001C0 FF               [12]  793 	mov	r7,a
      0001C1 8E 82            [24]  794 	mov	dpl,r6
      0001C3 8F 83            [24]  795 	mov	dph,r7
      0001C5 E0               [24]  796 	movx	a,@dptr
      0001C6 70 19            [24]  797 	jnz	00113$
                                    798 ;	sunkbd_hid.c:162: EP0CS   = 0x02;   /* clear HSNACK */
      0001C8 90 7F B4         [24]  799 	mov	dptr,#_EP0CS
      0001CB 74 02            [12]  800 	mov	a,#0x02
      0001CD F0               [24]  801 	movx	@dptr,a
                                    802 ;	sunkbd_hid.c:163: SUDPTRH = (Byte)((unsigned int)(report_desc_keyboard) >> 8);
      0001CE 7E 70            [12]  803 	mov	r6,#_report_desc_keyboard
      0001D0 7F 09            [12]  804 	mov	r7,#(_report_desc_keyboard >> 8)
      0001D2 90 7F D4         [24]  805 	mov	dptr,#_SUDPTRH
      0001D5 EF               [12]  806 	mov	a,r7
      0001D6 F0               [24]  807 	movx	@dptr,a
                                    808 ;	sunkbd_hid.c:164: SUDPTRL = (unsigned int)(report_desc_keyboard) & 0xff;
      0001D7 7E 70            [12]  809 	mov	r6,#_report_desc_keyboard
      0001D9 7F 09            [12]  810 	mov	r7,#(_report_desc_keyboard >> 8)
      0001DB 90 7F D5         [24]  811 	mov	dptr,#_SUDPTRL
      0001DE EE               [12]  812 	mov	a,r6
      0001DF F0               [24]  813 	movx	@dptr,a
      0001E0 22               [24]  814 	ret
      0001E1                        815 00113$:
                                    816 ;	sunkbd_hid.c:173: EP0CS   = 0x03;   /* stall */
      0001E1 90 7F B4         [24]  817 	mov	dptr,#_EP0CS
      0001E4 74 03            [12]  818 	mov	a,#0x03
      0001E6 F0               [24]  819 	movx	@dptr,a
                                    820 ;	sunkbd_hid.c:175: break;
                                    821 ;	sunkbd_hid.c:177: default:
      0001E7 22               [24]  822 	ret
      0001E8                        823 00115$:
                                    824 ;	sunkbd_hid.c:178: EP0CS     = 0x03;   /* stall */
      0001E8 90 7F B4         [24]  825 	mov	dptr,#_EP0CS
      0001EB 74 03            [12]  826 	mov	a,#0x03
      0001ED F0               [24]  827 	movx	@dptr,a
                                    828 ;	sunkbd_hid.c:180: }
      0001EE 22               [24]  829 	ret
                                    830 ;------------------------------------------------------------
                                    831 ;Allocation info for local variables in function 'usb_isr'
                                    832 ;------------------------------------------------------------
                                    833 ;i                         Allocated to registers r7 
                                    834 ;led_status                Allocated to registers r7 
                                    835 ;------------------------------------------------------------
                                    836 ;	sunkbd_hid.c:199: static void usb_isr(void) __interrupt (8) __using (1) __critical
                                    837 ;	-----------------------------------------
                                    838 ;	 function usb_isr
                                    839 ;	-----------------------------------------
      0001EF                        840 _usb_isr:
      0001EF C2 AF            [12]  841 	clr	ea
      0001F1 C0 21            [24]  842 	push	bits
      0001F3 C0 E0            [24]  843 	push	acc
      0001F5 C0 F0            [24]  844 	push	b
      0001F7 C0 82            [24]  845 	push	dpl
      0001F9 C0 83            [24]  846 	push	dph
      0001FB C0 07            [24]  847 	push	(0+7)
      0001FD C0 06            [24]  848 	push	(0+6)
      0001FF C0 05            [24]  849 	push	(0+5)
      000201 C0 04            [24]  850 	push	(0+4)
      000203 C0 03            [24]  851 	push	(0+3)
      000205 C0 02            [24]  852 	push	(0+2)
      000207 C0 01            [24]  853 	push	(0+1)
      000209 C0 00            [24]  854 	push	(0+0)
      00020B C0 D0            [24]  855 	push	psw
      00020D 75 D0 08         [24]  856 	mov	psw,#0x08
                                    857 ;	sunkbd_hid.c:202: EXIF &= 0xef;
      000210 53 91 EF         [24]  858 	anl	_EXIF,#0xef
                                    859 ;	sunkbd_hid.c:205: if (USBIRQ & 0x01) {
      000213 90 7F AB         [24]  860 	mov	dptr,#_USBIRQ
      000216 E0               [24]  861 	movx	a,@dptr
      000217 FF               [12]  862 	mov	r7,a
      000218 20 E0 03         [24]  863 	jb	acc.0,00322$
      00021B 02 05 D8         [24]  864 	ljmp	00183$
      00021E                        865 00322$:
                                    866 ;	sunkbd_hid.c:209: USBIRQ = 0x01;
      00021E 90 7F AB         [24]  867 	mov	dptr,#_USBIRQ
      000221 74 01            [12]  868 	mov	a,#0x01
      000223 F0               [24]  869 	movx	@dptr,a
                                    870 ;	sunkbd_hid.c:211: switch (sdat->bRequest) {
      000224 85 38 82         [24]  871 	mov	dpl,_sdat
      000227 85 39 83         [24]  872 	mov	dph,(_sdat + 1)
      00022A A3               [24]  873 	inc	dptr
      00022B E0               [24]  874 	movx	a,@dptr
      00022C FF               [12]  875 	mov  r7,a
      00022D 24 F4            [12]  876 	add	a,#0xff - 0x0b
      00022F 50 03            [24]  877 	jnc	00323$
      000231 02 05 D2         [24]  878 	ljmp	00180$
      000234                        879 00323$:
      000234 EF               [12]  880 	mov	a,r7
      000235 24 0A            [12]  881 	add	a,#(00324$-3-.)
      000237 83               [24]  882 	movc	a,@a+pc
      000238 F5 82            [12]  883 	mov	dpl,a
      00023A EF               [12]  884 	mov	a,r7
      00023B 24 10            [12]  885 	add	a,#(00325$-3-.)
      00023D 83               [24]  886 	movc	a,@a+pc
      00023E F5 83            [12]  887 	mov	dph,a
      000240 E4               [12]  888 	clr	a
      000241 73               [24]  889 	jmp	@a+dptr
      000242                        890 00324$:
      000242 5A                     891 	.db	00101$
      000243 8E                     892 	.db	00107$
      000244 6C                     893 	.db	00125$
      000245 AD                     894 	.db	00132$
      000246 D2                     895 	.db	00180$
      000247 D2                     896 	.db	00180$
      000248 A0                     897 	.db	00148$
      000249 D2                     898 	.db	00180$
      00024A A6                     899 	.db	00149$
      00024B CC                     900 	.db	00153$
      00024C F7                     901 	.db	00158$
      00024D 66                     902 	.db	00169$
      00024E                        903 00325$:
      00024E 02                     904 	.db	00101$>>8
      00024F 02                     905 	.db	00107$>>8
      000250 03                     906 	.db	00125$>>8
      000251 03                     907 	.db	00132$>>8
      000252 05                     908 	.db	00180$>>8
      000253 05                     909 	.db	00180$>>8
      000254 04                     910 	.db	00148$>>8
      000255 05                     911 	.db	00180$>>8
      000256 04                     912 	.db	00149$>>8
      000257 04                     913 	.db	00153$>>8
      000258 04                     914 	.db	00158$>>8
      000259 05                     915 	.db	00169$>>8
                                    916 ;	sunkbd_hid.c:214: case 0x00:
      00025A                        917 00101$:
                                    918 ;	sunkbd_hid.c:215: switch (sdat->bmRequestType) {
      00025A 85 38 82         [24]  919 	mov	dpl,_sdat
      00025D 85 39 83         [24]  920 	mov	dph,(_sdat + 1)
      000260 E0               [24]  921 	movx	a,@dptr
      000261 FF               [12]  922 	mov	r7,a
      000262 BF 80 02         [24]  923 	cjne	r7,#0x80,00326$
      000265 80 08            [24]  924 	sjmp	00104$
      000267                        925 00326$:
      000267 BF 81 02         [24]  926 	cjne	r7,#0x81,00327$
      00026A 80 03            [24]  927 	sjmp	00104$
      00026C                        928 00327$:
      00026C BF 82 16         [24]  929 	cjne	r7,#0x82,00105$
                                    930 ;	sunkbd_hid.c:221: case 0x82:
      00026F                        931 00104$:
                                    932 ;	sunkbd_hid.c:222: in0buf(0) = 0x00;
      00026F 90 7F 00         [24]  933 	mov	dptr,#_IN0BUF
      000272 E4               [12]  934 	clr	a
      000273 F0               [24]  935 	movx	@dptr,a
                                    936 ;	sunkbd_hid.c:223: in0buf(1) = 0x00;
      000274 90 7F 01         [24]  937 	mov	dptr,#(_IN0BUF + 0x0001)
      000277 F0               [24]  938 	movx	@dptr,a
                                    939 ;	sunkbd_hid.c:224: IN0BC     = 0x02;
      000278 90 7F B5         [24]  940 	mov	dptr,#_IN0BC
      00027B 74 02            [12]  941 	mov	a,#0x02
      00027D F0               [24]  942 	movx	@dptr,a
                                    943 ;	sunkbd_hid.c:225: EP0CS     = 0x02;   /* clear HSNACK */
      00027E 90 7F B4         [24]  944 	mov	dptr,#_EP0CS
      000281 F0               [24]  945 	movx	@dptr,a
                                    946 ;	sunkbd_hid.c:226: break;
      000282 02 05 D8         [24]  947 	ljmp	00183$
                                    948 ;	sunkbd_hid.c:228: default:
      000285                        949 00105$:
                                    950 ;	sunkbd_hid.c:229: EP0CS     = 0x03;   /* stall */
      000285 90 7F B4         [24]  951 	mov	dptr,#_EP0CS
      000288 74 03            [12]  952 	mov	a,#0x03
      00028A F0               [24]  953 	movx	@dptr,a
                                    954 ;	sunkbd_hid.c:232: break;
      00028B 02 05 D8         [24]  955 	ljmp	00183$
                                    956 ;	sunkbd_hid.c:235: case 0x01:
      00028E                        957 00107$:
                                    958 ;	sunkbd_hid.c:236: switch (sdat->bmRequestType) {
      00028E 85 38 82         [24]  959 	mov	dpl,_sdat
      000291 85 39 83         [24]  960 	mov	dph,(_sdat + 1)
      000294 E0               [24]  961 	movx	a,@dptr
      000295 FF               [12]  962 	mov	r7,a
      000296 60 13            [24]  963 	jz	00108$
      000298 BF 01 02         [24]  964 	cjne	r7,#0x01,00331$
      00029B 80 17            [24]  965 	sjmp	00109$
      00029D                        966 00331$:
      00029D BF 02 02         [24]  967 	cjne	r7,#0x02,00332$
      0002A0 80 1B            [24]  968 	sjmp	00110$
      0002A2                        969 00332$:
      0002A2 BF A1 03         [24]  970 	cjne	r7,#0xa1,00333$
      0002A5 02 03 23         [24]  971 	ljmp	00116$
      0002A8                        972 00333$:
      0002A8 02 03 63         [24]  973 	ljmp	00123$
                                    974 ;	sunkbd_hid.c:238: case 0x00:
      0002AB                        975 00108$:
                                    976 ;	sunkbd_hid.c:239: EP0CS     = 0x02;   /* clear HSNACK */
      0002AB 90 7F B4         [24]  977 	mov	dptr,#_EP0CS
      0002AE 74 02            [12]  978 	mov	a,#0x02
      0002B0 F0               [24]  979 	movx	@dptr,a
                                    980 ;	sunkbd_hid.c:240: break;
      0002B1 02 05 D8         [24]  981 	ljmp	00183$
                                    982 ;	sunkbd_hid.c:242: case 0x01:
      0002B4                        983 00109$:
                                    984 ;	sunkbd_hid.c:243: EP0CS     = 0x02;   /* clear HSNACK */
      0002B4 90 7F B4         [24]  985 	mov	dptr,#_EP0CS
      0002B7 74 02            [12]  986 	mov	a,#0x02
      0002B9 F0               [24]  987 	movx	@dptr,a
                                    988 ;	sunkbd_hid.c:244: break;
      0002BA 02 05 D8         [24]  989 	ljmp	00183$
                                    990 ;	sunkbd_hid.c:246: case 0x02:
      0002BD                        991 00110$:
                                    992 ;	sunkbd_hid.c:247: switch (sdat->wIndexL) {
      0002BD 85 38 82         [24]  993 	mov	dpl,_sdat
      0002C0 85 39 83         [24]  994 	mov	dph,(_sdat + 1)
      0002C3 A3               [24]  995 	inc	dptr
      0002C4 A3               [24]  996 	inc	dptr
      0002C5 A3               [24]  997 	inc	dptr
      0002C6 A3               [24]  998 	inc	dptr
      0002C7 E0               [24]  999 	movx	a,@dptr
      0002C8 FF               [12] 1000 	mov	r7,a
      0002C9 60 12            [24] 1001 	jz	00111$
      0002CB BF 80 02         [24] 1002 	cjne	r7,#0x80,00335$
      0002CE 80 1D            [24] 1003 	sjmp	00112$
      0002D0                       1004 00335$:
      0002D0 BF 81 02         [24] 1005 	cjne	r7,#0x81,00336$
      0002D3 80 2A            [24] 1006 	sjmp	00113$
      0002D5                       1007 00336$:
      0002D5 BF 82 02         [24] 1008 	cjne	r7,#0x82,00337$
      0002D8 80 40            [24] 1009 	sjmp	00114$
      0002DA                       1010 00337$:
      0002DA 02 05 D8         [24] 1011 	ljmp	00183$
                                   1012 ;	sunkbd_hid.c:250: case 0x00:  /* OUT0 */
      0002DD                       1013 00111$:
                                   1014 ;	sunkbd_hid.c:251: TOGCTL = 0x00;
      0002DD 90 7F D7         [24] 1015 	mov	dptr,#_TOGCTL
      0002E0 E4               [12] 1016 	clr	a
      0002E1 F0               [24] 1017 	movx	@dptr,a
                                   1018 ;	sunkbd_hid.c:252: TOGCTL = 0x20;
      0002E2 74 20            [12] 1019 	mov	a,#0x20
      0002E4 F0               [24] 1020 	movx	@dptr,a
                                   1021 ;	sunkbd_hid.c:253: EP0CS  = 0x02;   /* clear HSNACK */
      0002E5 90 7F B4         [24] 1022 	mov	dptr,#_EP0CS
      0002E8 C4               [12] 1023 	swap	a
      0002E9 F0               [24] 1024 	movx	@dptr,a
                                   1025 ;	sunkbd_hid.c:254: break;
      0002EA 02 05 D8         [24] 1026 	ljmp	00183$
                                   1027 ;	sunkbd_hid.c:255: case 0x80:  /* IN0  */
      0002ED                       1028 00112$:
                                   1029 ;	sunkbd_hid.c:256: TOGCTL = 0x10;
      0002ED 90 7F D7         [24] 1030 	mov	dptr,#_TOGCTL
      0002F0 74 10            [12] 1031 	mov	a,#0x10
      0002F2 F0               [24] 1032 	movx	@dptr,a
                                   1033 ;	sunkbd_hid.c:257: TOGCTL = 0x30;
      0002F3 74 30            [12] 1034 	mov	a,#0x30
      0002F5 F0               [24] 1035 	movx	@dptr,a
                                   1036 ;	sunkbd_hid.c:258: EP0CS  = 0x02;   /* clear HSNACK */
      0002F6 90 7F B4         [24] 1037 	mov	dptr,#_EP0CS
      0002F9 74 02            [12] 1038 	mov	a,#0x02
      0002FB F0               [24] 1039 	movx	@dptr,a
                                   1040 ;	sunkbd_hid.c:259: break;
      0002FC 02 05 D8         [24] 1041 	ljmp	00183$
                                   1042 ;	sunkbd_hid.c:260: case 0x81:  /* IN1  */
      0002FF                       1043 00113$:
                                   1044 ;	sunkbd_hid.c:262: IN1CS &= 0xfe;
      0002FF 90 7F B6         [24] 1045 	mov	dptr,#_IN1CS
      000302 E0               [24] 1046 	movx	a,@dptr
      000303 FF               [12] 1047 	mov	r7,a
      000304 74 FE            [12] 1048 	mov	a,#0xfe
      000306 5F               [12] 1049 	anl	a,r7
      000307 F0               [24] 1050 	movx	@dptr,a
                                   1051 ;	sunkbd_hid.c:263: TOGCTL = 0x11;
      000308 90 7F D7         [24] 1052 	mov	dptr,#_TOGCTL
      00030B 74 11            [12] 1053 	mov	a,#0x11
      00030D F0               [24] 1054 	movx	@dptr,a
                                   1055 ;	sunkbd_hid.c:264: TOGCTL = 0x31;
      00030E 74 31            [12] 1056 	mov	a,#0x31
      000310 F0               [24] 1057 	movx	@dptr,a
                                   1058 ;	sunkbd_hid.c:265: EP0CS  = 0x02;   /* clear HSNACK */
      000311 90 7F B4         [24] 1059 	mov	dptr,#_EP0CS
      000314 74 02            [12] 1060 	mov	a,#0x02
      000316 F0               [24] 1061 	movx	@dptr,a
                                   1062 ;	sunkbd_hid.c:269: break;
      000317 02 05 D8         [24] 1063 	ljmp	00183$
                                   1064 ;	sunkbd_hid.c:270: case 0x82:  /* IN2  */
      00031A                       1065 00114$:
                                   1066 ;	sunkbd_hid.c:277: EP0CS  = 0x03;   /* stall */
      00031A 90 7F B4         [24] 1067 	mov	dptr,#_EP0CS
      00031D 74 03            [12] 1068 	mov	a,#0x03
      00031F F0               [24] 1069 	movx	@dptr,a
                                   1070 ;	sunkbd_hid.c:281: break;
      000320 02 05 D8         [24] 1071 	ljmp	00183$
                                   1072 ;	sunkbd_hid.c:284: case 0xa1:
      000323                       1073 00116$:
                                   1074 ;	sunkbd_hid.c:311: if (sdat->wIndexL == 0) {
      000323 74 04            [12] 1075 	mov	a,#0x04
      000325 25 38            [12] 1076 	add	a,_sdat
      000327 FE               [12] 1077 	mov	r6,a
      000328 E4               [12] 1078 	clr	a
      000329 35 39            [12] 1079 	addc	a,(_sdat + 1)
      00032B FF               [12] 1080 	mov	r7,a
      00032C 8E 82            [24] 1081 	mov	dpl,r6
      00032E 8F 83            [24] 1082 	mov	dph,r7
      000330 E0               [24] 1083 	movx	a,@dptr
      000331 70 27            [24] 1084 	jnz	00121$
                                   1085 ;	sunkbd_hid.c:313: while (i-- > 0)
      000333 7F 07            [12] 1086 	mov	r7,#0x07
      000335                       1087 00117$:
      000335 8F 0E            [24] 1088 	mov	ar6,r7
      000337 1F               [12] 1089 	dec	r7
      000338 EE               [12] 1090 	mov	a,r6
      000339 60 0E            [24] 1091 	jz	00119$
                                   1092 ;	sunkbd_hid.c:314: in0buf(i) = key_buffer[i];
      00033B 8F 82            [24] 1093 	mov	dpl,r7
      00033D 75 83 7F         [24] 1094 	mov	dph,#(_IN0BUF >> 8)
      000340 EF               [12] 1095 	mov	a,r7
      000341 24 25            [12] 1096 	add	a,#_key_buffer
      000343 F9               [12] 1097 	mov	r1,a
      000344 E7               [12] 1098 	mov	a,@r1
      000345 FE               [12] 1099 	mov	r6,a
      000346 F0               [24] 1100 	movx	@dptr,a
      000347 80 EC            [24] 1101 	sjmp	00117$
      000349                       1102 00119$:
                                   1103 ;	sunkbd_hid.c:317: kbd_new_keys = FALSE;
      000349 C2 00            [12] 1104 	clr	_kbd_new_keys
                                   1105 ;	sunkbd_hid.c:319: IN0BC    = 0x08;
      00034B 90 7F B5         [24] 1106 	mov	dptr,#_IN0BC
      00034E 74 08            [12] 1107 	mov	a,#0x08
      000350 F0               [24] 1108 	movx	@dptr,a
                                   1109 ;	sunkbd_hid.c:320: EP0CS    = 0x02;   /* clear HSNACK */
      000351 90 7F B4         [24] 1110 	mov	dptr,#_EP0CS
      000354 74 02            [12] 1111 	mov	a,#0x02
      000356 F0               [24] 1112 	movx	@dptr,a
      000357 02 05 D8         [24] 1113 	ljmp	00183$
      00035A                       1114 00121$:
                                   1115 ;	sunkbd_hid.c:334: EP0CS = 0x03;   /* stall */
      00035A 90 7F B4         [24] 1116 	mov	dptr,#_EP0CS
      00035D 74 03            [12] 1117 	mov	a,#0x03
      00035F F0               [24] 1118 	movx	@dptr,a
                                   1119 ;	sunkbd_hid.c:337: break;
      000360 02 05 D8         [24] 1120 	ljmp	00183$
                                   1121 ;	sunkbd_hid.c:339: default:
      000363                       1122 00123$:
                                   1123 ;	sunkbd_hid.c:340: EP0CS     = 0x03;   /* stall */
      000363 90 7F B4         [24] 1124 	mov	dptr,#_EP0CS
      000366 74 03            [12] 1125 	mov	a,#0x03
      000368 F0               [24] 1126 	movx	@dptr,a
                                   1127 ;	sunkbd_hid.c:343: break;
      000369 02 05 D8         [24] 1128 	ljmp	00183$
                                   1129 ;	sunkbd_hid.c:346: case 0x02:
      00036C                       1130 00125$:
                                   1131 ;	sunkbd_hid.c:347: switch (sdat->bmRequestType) {
      00036C 85 38 82         [24] 1132 	mov	dpl,_sdat
      00036F 85 39 83         [24] 1133 	mov	dph,(_sdat + 1)
      000372 E0               [24] 1134 	movx	a,@dptr
      000373 FF               [12] 1135 	mov	r7,a
      000374 BF A1 2D         [24] 1136 	cjne	r7,#0xa1,00130$
                                   1137 ;	sunkbd_hid.c:363: if (sdat->wIndexL == 0) {
      000377 74 04            [12] 1138 	mov	a,#0x04
      000379 25 38            [12] 1139 	add	a,_sdat
      00037B FE               [12] 1140 	mov	r6,a
      00037C E4               [12] 1141 	clr	a
      00037D 35 39            [12] 1142 	addc	a,(_sdat + 1)
      00037F FF               [12] 1143 	mov	r7,a
      000380 8E 82            [24] 1144 	mov	dpl,r6
      000382 8F 83            [24] 1145 	mov	dph,r7
      000384 E0               [24] 1146 	movx	a,@dptr
      000385 70 14            [24] 1147 	jnz	00128$
                                   1148 ;	sunkbd_hid.c:365: in0buf(0) = kbd_idle_duration;
      000387 90 7F 00         [24] 1149 	mov	dptr,#_IN0BUF
      00038A E5 2E            [12] 1150 	mov	a,_kbd_idle_duration
      00038C F0               [24] 1151 	movx	@dptr,a
                                   1152 ;	sunkbd_hid.c:369: IN0BC     = 0x01;
      00038D 90 7F B5         [24] 1153 	mov	dptr,#_IN0BC
      000390 74 01            [12] 1154 	mov	a,#0x01
      000392 F0               [24] 1155 	movx	@dptr,a
                                   1156 ;	sunkbd_hid.c:370: EP0CS     = 0x02;   /* clear HSNACK */
      000393 90 7F B4         [24] 1157 	mov	dptr,#_EP0CS
      000396 04               [12] 1158 	inc	a
      000397 F0               [24] 1159 	movx	@dptr,a
      000398 02 05 D8         [24] 1160 	ljmp	00183$
      00039B                       1161 00128$:
                                   1162 ;	sunkbd_hid.c:372: EP0CS  = 0x03;   /* stall */
      00039B 90 7F B4         [24] 1163 	mov	dptr,#_EP0CS
      00039E 74 03            [12] 1164 	mov	a,#0x03
      0003A0 F0               [24] 1165 	movx	@dptr,a
                                   1166 ;	sunkbd_hid.c:376: break;
      0003A1 02 05 D8         [24] 1167 	ljmp	00183$
                                   1168 ;	sunkbd_hid.c:378: default:
      0003A4                       1169 00130$:
                                   1170 ;	sunkbd_hid.c:379: EP0CS     = 0x03;   /* stall */
      0003A4 90 7F B4         [24] 1171 	mov	dptr,#_EP0CS
      0003A7 74 03            [12] 1172 	mov	a,#0x03
      0003A9 F0               [24] 1173 	movx	@dptr,a
                                   1174 ;	sunkbd_hid.c:382: break;
      0003AA 02 05 D8         [24] 1175 	ljmp	00183$
                                   1176 ;	sunkbd_hid.c:385: case 0x03:
      0003AD                       1177 00132$:
                                   1178 ;	sunkbd_hid.c:386: switch (sdat->bmRequestType) {
      0003AD 85 38 82         [24] 1179 	mov	dpl,_sdat
      0003B0 85 39 83         [24] 1180 	mov	dph,(_sdat + 1)
      0003B3 E0               [24] 1181 	movx	a,@dptr
      0003B4 FF               [12] 1182 	mov	r7,a
      0003B5 60 13            [24] 1183 	jz	00133$
      0003B7 BF 01 02         [24] 1184 	cjne	r7,#0x01,00344$
      0003BA 80 17            [24] 1185 	sjmp	00134$
      0003BC                       1186 00344$:
      0003BC BF 02 02         [24] 1187 	cjne	r7,#0x02,00345$
      0003BF 80 1B            [24] 1188 	sjmp	00135$
      0003C1                       1189 00345$:
      0003C1 BF A1 03         [24] 1190 	cjne	r7,#0xa1,00346$
      0003C4 02 04 6C         [24] 1191 	ljmp	00142$
      0003C7                       1192 00346$:
      0003C7 02 04 97         [24] 1193 	ljmp	00146$
                                   1194 ;	sunkbd_hid.c:388: case 0x00:
      0003CA                       1195 00133$:
                                   1196 ;	sunkbd_hid.c:389: EP0CS     = 0x02;   /* clear HSNACK */
      0003CA 90 7F B4         [24] 1197 	mov	dptr,#_EP0CS
      0003CD 74 02            [12] 1198 	mov	a,#0x02
      0003CF F0               [24] 1199 	movx	@dptr,a
                                   1200 ;	sunkbd_hid.c:390: break;
      0003D0 02 05 D8         [24] 1201 	ljmp	00183$
                                   1202 ;	sunkbd_hid.c:392: case 0x01:
      0003D3                       1203 00134$:
                                   1204 ;	sunkbd_hid.c:393: EP0CS     = 0x02;   /* clear HSNACK */
      0003D3 90 7F B4         [24] 1205 	mov	dptr,#_EP0CS
      0003D6 74 02            [12] 1206 	mov	a,#0x02
      0003D8 F0               [24] 1207 	movx	@dptr,a
                                   1208 ;	sunkbd_hid.c:394: break;
      0003D9 02 05 D8         [24] 1209 	ljmp	00183$
                                   1210 ;	sunkbd_hid.c:396: case 0x02:
      0003DC                       1211 00135$:
                                   1212 ;	sunkbd_hid.c:397: switch (sdat->wIndexL) {
      0003DC 85 38 82         [24] 1213 	mov	dpl,_sdat
      0003DF 85 39 83         [24] 1214 	mov	dph,(_sdat + 1)
      0003E2 A3               [24] 1215 	inc	dptr
      0003E3 A3               [24] 1216 	inc	dptr
      0003E4 A3               [24] 1217 	inc	dptr
      0003E5 A3               [24] 1218 	inc	dptr
      0003E6 E0               [24] 1219 	movx	a,@dptr
      0003E7 FF               [12] 1220 	mov	r7,a
      0003E8 60 0F            [24] 1221 	jz	00136$
      0003EA BF 80 02         [24] 1222 	cjne	r7,#0x80,00348$
      0003ED 80 2C            [24] 1223 	sjmp	00137$
      0003EF                       1224 00348$:
      0003EF BF 81 02         [24] 1225 	cjne	r7,#0x81,00349$
      0003F2 80 45            [24] 1226 	sjmp	00138$
      0003F4                       1227 00349$:
                                   1228 ;	sunkbd_hid.c:398: case 0x00:  /* OUT0 */
      0003F4 BF 82 6C         [24] 1229 	cjne	r7,#0x82,00140$
      0003F7 80 61            [24] 1230 	sjmp	00139$
      0003F9                       1231 00136$:
                                   1232 ;	sunkbd_hid.c:399: EP0CS  |= 0x01;  /* stall endpoint */
      0003F9 90 7F B4         [24] 1233 	mov	dptr,#_EP0CS
      0003FC E0               [24] 1234 	movx	a,@dptr
      0003FD FF               [12] 1235 	mov	r7,a
      0003FE 74 01            [12] 1236 	mov	a,#0x01
      000400 4F               [12] 1237 	orl	a,r7
      000401 F0               [24] 1238 	movx	@dptr,a
                                   1239 ;	sunkbd_hid.c:400: TOGCTL  = 0x00;
      000402 90 7F D7         [24] 1240 	mov	dptr,#_TOGCTL
      000405 E4               [12] 1241 	clr	a
      000406 F0               [24] 1242 	movx	@dptr,a
                                   1243 ;	sunkbd_hid.c:401: TOGCTL  = 0x20;
      000407 74 20            [12] 1244 	mov	a,#0x20
      000409 F0               [24] 1245 	movx	@dptr,a
                                   1246 ;	sunkbd_hid.c:402: OUT0BC  = 0x00;
      00040A 90 7F C5         [24] 1247 	mov	dptr,#_OUT0BC
      00040D E4               [12] 1248 	clr	a
      00040E F0               [24] 1249 	movx	@dptr,a
                                   1250 ;	sunkbd_hid.c:403: EP0CS  |= 0x02;  /* clear HSNACK */
      00040F 90 7F B4         [24] 1251 	mov	dptr,#_EP0CS
      000412 E0               [24] 1252 	movx	a,@dptr
      000413 FF               [12] 1253 	mov	r7,a
      000414 74 02            [12] 1254 	mov	a,#0x02
      000416 4F               [12] 1255 	orl	a,r7
      000417 F0               [24] 1256 	movx	@dptr,a
                                   1257 ;	sunkbd_hid.c:404: break;
      000418 02 05 D8         [24] 1258 	ljmp	00183$
                                   1259 ;	sunkbd_hid.c:405: case 0x80:  /* IN0  */
      00041B                       1260 00137$:
                                   1261 ;	sunkbd_hid.c:406: EP0CS  |= 0x01;  /* stall endpoint */
      00041B 90 7F B4         [24] 1262 	mov	dptr,#_EP0CS
      00041E E0               [24] 1263 	movx	a,@dptr
      00041F FF               [12] 1264 	mov	r7,a
      000420 74 01            [12] 1265 	mov	a,#0x01
      000422 4F               [12] 1266 	orl	a,r7
      000423 F0               [24] 1267 	movx	@dptr,a
                                   1268 ;	sunkbd_hid.c:407: TOGCTL  = 0x10;
      000424 90 7F D7         [24] 1269 	mov	dptr,#_TOGCTL
      000427 74 10            [12] 1270 	mov	a,#0x10
      000429 F0               [24] 1271 	movx	@dptr,a
                                   1272 ;	sunkbd_hid.c:408: TOGCTL  = 0x30;
      00042A 74 30            [12] 1273 	mov	a,#0x30
      00042C F0               [24] 1274 	movx	@dptr,a
                                   1275 ;	sunkbd_hid.c:409: EP0CS  |= 0x02;  /* clear HSNACK */
      00042D 90 7F B4         [24] 1276 	mov	dptr,#_EP0CS
      000430 E0               [24] 1277 	movx	a,@dptr
      000431 FF               [12] 1278 	mov	r7,a
      000432 74 02            [12] 1279 	mov	a,#0x02
      000434 4F               [12] 1280 	orl	a,r7
      000435 F0               [24] 1281 	movx	@dptr,a
                                   1282 ;	sunkbd_hid.c:410: break;
      000436 02 05 D8         [24] 1283 	ljmp	00183$
                                   1284 ;	sunkbd_hid.c:411: case 0x81:  /* IN1  */
      000439                       1285 00138$:
                                   1286 ;	sunkbd_hid.c:413: IN1CS   = 0x01;  /* stall endpoint */
      000439 90 7F B6         [24] 1287 	mov	dptr,#_IN1CS
      00043C 74 01            [12] 1288 	mov	a,#0x01
      00043E F0               [24] 1289 	movx	@dptr,a
                                   1290 ;	sunkbd_hid.c:414: TOGCTL  = 0x11;
      00043F 90 7F D7         [24] 1291 	mov	dptr,#_TOGCTL
      000442 74 11            [12] 1292 	mov	a,#0x11
      000444 F0               [24] 1293 	movx	@dptr,a
                                   1294 ;	sunkbd_hid.c:415: TOGCTL  = 0x31;
      000445 74 31            [12] 1295 	mov	a,#0x31
      000447 F0               [24] 1296 	movx	@dptr,a
                                   1297 ;	sunkbd_hid.c:416: IN1CS  |= 0x02;
      000448 90 7F B6         [24] 1298 	mov	dptr,#_IN1CS
      00044B E0               [24] 1299 	movx	a,@dptr
      00044C FF               [12] 1300 	mov	r7,a
      00044D 74 02            [12] 1301 	mov	a,#0x02
      00044F 4F               [12] 1302 	orl	a,r7
      000450 F0               [24] 1303 	movx	@dptr,a
                                   1304 ;	sunkbd_hid.c:417: EP0CS   = 0x02;  /* clear HSNACK */
      000451 90 7F B4         [24] 1305 	mov	dptr,#_EP0CS
      000454 74 02            [12] 1306 	mov	a,#0x02
      000456 F0               [24] 1307 	movx	@dptr,a
                                   1308 ;	sunkbd_hid.c:421: break;
      000457 02 05 D8         [24] 1309 	ljmp	00183$
                                   1310 ;	sunkbd_hid.c:422: case 0x82:  /* IN2  */
      00045A                       1311 00139$:
                                   1312 ;	sunkbd_hid.c:430: EP0CS  = 0x03;   /* stall */
      00045A 90 7F B4         [24] 1313 	mov	dptr,#_EP0CS
      00045D 74 03            [12] 1314 	mov	a,#0x03
      00045F F0               [24] 1315 	movx	@dptr,a
                                   1316 ;	sunkbd_hid.c:432: break;
      000460 02 05 D8         [24] 1317 	ljmp	00183$
                                   1318 ;	sunkbd_hid.c:433: default:
      000463                       1319 00140$:
                                   1320 ;	sunkbd_hid.c:434: EP0CS  = 0x03;   /* stall */
      000463 90 7F B4         [24] 1321 	mov	dptr,#_EP0CS
      000466 74 03            [12] 1322 	mov	a,#0x03
      000468 F0               [24] 1323 	movx	@dptr,a
                                   1324 ;	sunkbd_hid.c:437: break;
      000469 02 05 D8         [24] 1325 	ljmp	00183$
                                   1326 ;	sunkbd_hid.c:440: case 0xa1:
      00046C                       1327 00142$:
                                   1328 ;	sunkbd_hid.c:444: if (sdat->wIndexL == 0) {
      00046C 74 04            [12] 1329 	mov	a,#0x04
      00046E 25 38            [12] 1330 	add	a,_sdat
      000470 FE               [12] 1331 	mov	r6,a
      000471 E4               [12] 1332 	clr	a
      000472 35 39            [12] 1333 	addc	a,(_sdat + 1)
      000474 FF               [12] 1334 	mov	r7,a
      000475 8E 82            [24] 1335 	mov	dpl,r6
      000477 8F 83            [24] 1336 	mov	dph,r7
      000479 E0               [24] 1337 	movx	a,@dptr
      00047A 70 12            [24] 1338 	jnz	00144$
                                   1339 ;	sunkbd_hid.c:446: in0buf(0) = 1; /* always send Report protocol */
      00047C 90 7F 00         [24] 1340 	mov	dptr,#_IN0BUF
      00047F 74 01            [12] 1341 	mov	a,#0x01
      000481 F0               [24] 1342 	movx	@dptr,a
                                   1343 ;	sunkbd_hid.c:447: IN0BC     = 0x01;
      000482 90 7F B5         [24] 1344 	mov	dptr,#_IN0BC
      000485 F0               [24] 1345 	movx	@dptr,a
                                   1346 ;	sunkbd_hid.c:448: EP0CS     = 0x02;   /* clear HSNACK */
      000486 90 7F B4         [24] 1347 	mov	dptr,#_EP0CS
      000489 04               [12] 1348 	inc	a
      00048A F0               [24] 1349 	movx	@dptr,a
      00048B 02 05 D8         [24] 1350 	ljmp	00183$
      00048E                       1351 00144$:
                                   1352 ;	sunkbd_hid.c:450: EP0CS  = 0x03;   /* stall */
      00048E 90 7F B4         [24] 1353 	mov	dptr,#_EP0CS
      000491 74 03            [12] 1354 	mov	a,#0x03
      000493 F0               [24] 1355 	movx	@dptr,a
                                   1356 ;	sunkbd_hid.c:451: break;
      000494 02 05 D8         [24] 1357 	ljmp	00183$
                                   1358 ;	sunkbd_hid.c:453: default:
      000497                       1359 00146$:
                                   1360 ;	sunkbd_hid.c:454: EP0CS     = 0x03;   /* stall */
      000497 90 7F B4         [24] 1361 	mov	dptr,#_EP0CS
      00049A 74 03            [12] 1362 	mov	a,#0x03
      00049C F0               [24] 1363 	movx	@dptr,a
                                   1364 ;	sunkbd_hid.c:457: break;
      00049D 02 05 D8         [24] 1365 	ljmp	00183$
                                   1366 ;	sunkbd_hid.c:460: case 0x06:
      0004A0                       1367 00148$:
                                   1368 ;	sunkbd_hid.c:461: get_descriptor(/*sdat*/);
      0004A0 12 00 DA         [24] 1369 	lcall	_get_descriptor
                                   1370 ;	sunkbd_hid.c:462: break;
      0004A3 02 05 D8         [24] 1371 	ljmp	00183$
                                   1372 ;	sunkbd_hid.c:465: case 0x08:
      0004A6                       1373 00149$:
                                   1374 ;	sunkbd_hid.c:466: if (sdat->bmRequestType == 0x80) {
      0004A6 85 38 82         [24] 1375 	mov	dpl,_sdat
      0004A9 85 39 83         [24] 1376 	mov	dph,(_sdat + 1)
      0004AC E0               [24] 1377 	movx	a,@dptr
      0004AD FF               [12] 1378 	mov	r7,a
      0004AE BF 80 12         [24] 1379 	cjne	r7,#0x80,00151$
                                   1380 ;	sunkbd_hid.c:467: in0buf(0) = 0x01;
      0004B1 90 7F 00         [24] 1381 	mov	dptr,#_IN0BUF
      0004B4 74 01            [12] 1382 	mov	a,#0x01
      0004B6 F0               [24] 1383 	movx	@dptr,a
                                   1384 ;	sunkbd_hid.c:468: IN0BC     = 0x01;
      0004B7 90 7F B5         [24] 1385 	mov	dptr,#_IN0BC
      0004BA F0               [24] 1386 	movx	@dptr,a
                                   1387 ;	sunkbd_hid.c:469: EP0CS     = 0x02;   /* clear HSNACK */
      0004BB 90 7F B4         [24] 1388 	mov	dptr,#_EP0CS
      0004BE 04               [12] 1389 	inc	a
      0004BF F0               [24] 1390 	movx	@dptr,a
      0004C0 02 05 D8         [24] 1391 	ljmp	00183$
      0004C3                       1392 00151$:
                                   1393 ;	sunkbd_hid.c:471: EP0CS     = 0x03;   /* stall */
      0004C3 90 7F B4         [24] 1394 	mov	dptr,#_EP0CS
      0004C6 74 03            [12] 1395 	mov	a,#0x03
      0004C8 F0               [24] 1396 	movx	@dptr,a
                                   1397 ;	sunkbd_hid.c:473: break;
      0004C9 02 05 D8         [24] 1398 	ljmp	00183$
                                   1399 ;	sunkbd_hid.c:476: case 0x09:
      0004CC                       1400 00153$:
                                   1401 ;	sunkbd_hid.c:477: switch (sdat->bmRequestType) {
      0004CC 85 38 82         [24] 1402 	mov	dpl,_sdat
      0004CF 85 39 83         [24] 1403 	mov	dph,(_sdat + 1)
      0004D2 E0               [24] 1404 	movx	a,@dptr
      0004D3 FF               [12] 1405 	mov	r7,a
      0004D4 60 05            [24] 1406 	jz	00154$
                                   1407 ;	sunkbd_hid.c:479: case 0x00:
      0004D6 BF 21 15         [24] 1408 	cjne	r7,#0x21,00156$
      0004D9 80 09            [24] 1409 	sjmp	00155$
      0004DB                       1410 00154$:
                                   1411 ;	sunkbd_hid.c:480: EP0CS     = 0x02;   /* clear HSNACK */
      0004DB 90 7F B4         [24] 1412 	mov	dptr,#_EP0CS
      0004DE 74 02            [12] 1413 	mov	a,#0x02
      0004E0 F0               [24] 1414 	movx	@dptr,a
                                   1415 ;	sunkbd_hid.c:481: break;
      0004E1 02 05 D8         [24] 1416 	ljmp	00183$
                                   1417 ;	sunkbd_hid.c:484: case 0x21:
      0004E4                       1418 00155$:
                                   1419 ;	sunkbd_hid.c:487: is_ctrl_out0_kbd = TRUE;
      0004E4 D2 01            [12] 1420 	setb	_is_ctrl_out0_kbd
                                   1421 ;	sunkbd_hid.c:488: OUT0BC   = 0x00;    /* arm endpoint OUT0 */
      0004E6 90 7F C5         [24] 1422 	mov	dptr,#_OUT0BC
      0004E9 E4               [12] 1423 	clr	a
      0004EA F0               [24] 1424 	movx	@dptr,a
                                   1425 ;	sunkbd_hid.c:491: break;
      0004EB 02 05 D8         [24] 1426 	ljmp	00183$
                                   1427 ;	sunkbd_hid.c:493: default:
      0004EE                       1428 00156$:
                                   1429 ;	sunkbd_hid.c:494: EP0CS     = 0x03;   /* stall */
      0004EE 90 7F B4         [24] 1430 	mov	dptr,#_EP0CS
      0004F1 74 03            [12] 1431 	mov	a,#0x03
      0004F3 F0               [24] 1432 	movx	@dptr,a
                                   1433 ;	sunkbd_hid.c:497: break;
      0004F4 02 05 D8         [24] 1434 	ljmp	00183$
                                   1435 ;	sunkbd_hid.c:500: case 0x0a:
      0004F7                       1436 00158$:
                                   1437 ;	sunkbd_hid.c:501: switch (sdat->bmRequestType) {
      0004F7 85 38 82         [24] 1438 	mov	dpl,_sdat
      0004FA 85 39 83         [24] 1439 	mov	dph,(_sdat + 1)
      0004FD E0               [24] 1440 	movx	a,@dptr
      0004FE FF               [12] 1441 	mov	r7,a
      0004FF BF 21 02         [24] 1442 	cjne	r7,#0x21,00356$
      000502 80 15            [24] 1443 	sjmp	00160$
      000504                       1444 00356$:
      000504 BF 81 56         [24] 1445 	cjne	r7,#0x81,00167$
                                   1446 ;	sunkbd_hid.c:504: in0buf(0) = 0x00;
      000507 90 7F 00         [24] 1447 	mov	dptr,#_IN0BUF
      00050A E4               [12] 1448 	clr	a
      00050B F0               [24] 1449 	movx	@dptr,a
                                   1450 ;	sunkbd_hid.c:505: IN0BC     = 0x01;
      00050C 90 7F B5         [24] 1451 	mov	dptr,#_IN0BC
      00050F 04               [12] 1452 	inc	a
      000510 F0               [24] 1453 	movx	@dptr,a
                                   1454 ;	sunkbd_hid.c:506: EP0CS     = 0x02;   /* clear HSNACK */
      000511 90 7F B4         [24] 1455 	mov	dptr,#_EP0CS
      000514 04               [12] 1456 	inc	a
      000515 F0               [24] 1457 	movx	@dptr,a
                                   1458 ;	sunkbd_hid.c:507: break;
      000516 02 05 D8         [24] 1459 	ljmp	00183$
                                   1460 ;	sunkbd_hid.c:510: case 0x21:
      000519                       1461 00160$:
                                   1462 ;	sunkbd_hid.c:536: if (sdat->wIndexL == 0) {
      000519 74 04            [12] 1463 	mov	a,#0x04
      00051B 25 38            [12] 1464 	add	a,_sdat
      00051D FE               [12] 1465 	mov	r6,a
      00051E E4               [12] 1466 	clr	a
      00051F 35 39            [12] 1467 	addc	a,(_sdat + 1)
      000521 FF               [12] 1468 	mov	r7,a
      000522 8E 82            [24] 1469 	mov	dpl,r6
      000524 8F 83            [24] 1470 	mov	dph,r7
      000526 E0               [24] 1471 	movx	a,@dptr
      000527 70 2B            [24] 1472 	jnz	00165$
                                   1473 ;	sunkbd_hid.c:538: if (sdat->wValueH > 0) {
      000529 74 03            [12] 1474 	mov	a,#0x03
      00052B 25 38            [12] 1475 	add	a,_sdat
      00052D FE               [12] 1476 	mov	r6,a
      00052E E4               [12] 1477 	clr	a
      00052F 35 39            [12] 1478 	addc	a,(_sdat + 1)
      000531 FF               [12] 1479 	mov	r7,a
      000532 8E 82            [24] 1480 	mov	dpl,r6
      000534 8F 83            [24] 1481 	mov	dph,r7
      000536 E0               [24] 1482 	movx	a,@dptr
      000537 60 10            [24] 1483 	jz	00162$
                                   1484 ;	sunkbd_hid.c:540: kbd_idle_mode     = FALSE;
      000539 C2 02            [12] 1485 	clr	_kbd_idle_mode
                                   1486 ;	sunkbd_hid.c:541: kbd_idle_duration = sdat->wValueH;
      00053B 85 38 82         [24] 1487 	mov	dpl,_sdat
      00053E 85 39 83         [24] 1488 	mov	dph,(_sdat + 1)
      000541 A3               [24] 1489 	inc	dptr
      000542 A3               [24] 1490 	inc	dptr
      000543 A3               [24] 1491 	inc	dptr
      000544 E0               [24] 1492 	movx	a,@dptr
      000545 F5 2E            [12] 1493 	mov	_kbd_idle_duration,a
      000547 80 02            [24] 1494 	sjmp	00163$
      000549                       1495 00162$:
                                   1496 ;	sunkbd_hid.c:549: kbd_idle_mode     = TRUE;
      000549 D2 02            [12] 1497 	setb	_kbd_idle_mode
      00054B                       1498 00163$:
                                   1499 ;	sunkbd_hid.c:556: EP0CS  = 0x02;   /* clear HSNACK */
      00054B 90 7F B4         [24] 1500 	mov	dptr,#_EP0CS
      00054E 74 02            [12] 1501 	mov	a,#0x02
      000550 F0               [24] 1502 	movx	@dptr,a
      000551 02 05 D8         [24] 1503 	ljmp	00183$
      000554                       1504 00165$:
                                   1505 ;	sunkbd_hid.c:558: EP0CS  = 0x03;   /* stall */
      000554 90 7F B4         [24] 1506 	mov	dptr,#_EP0CS
      000557 74 03            [12] 1507 	mov	a,#0x03
      000559 F0               [24] 1508 	movx	@dptr,a
                                   1509 ;	sunkbd_hid.c:560: break;
      00055A 02 05 D8         [24] 1510 	ljmp	00183$
                                   1511 ;	sunkbd_hid.c:562: default:
      00055D                       1512 00167$:
                                   1513 ;	sunkbd_hid.c:563: EP0CS     = 0x03;   /* stall */
      00055D 90 7F B4         [24] 1514 	mov	dptr,#_EP0CS
      000560 74 03            [12] 1515 	mov	a,#0x03
      000562 F0               [24] 1516 	movx	@dptr,a
                                   1517 ;	sunkbd_hid.c:566: break;
      000563 02 05 D8         [24] 1518 	ljmp	00183$
                                   1519 ;	sunkbd_hid.c:569: case 0x0b:
      000566                       1520 00169$:
                                   1521 ;	sunkbd_hid.c:570: switch (sdat->bmRequestType) {
      000566 85 38 82         [24] 1522 	mov	dpl,_sdat
      000569 85 39 83         [24] 1523 	mov	dph,(_sdat + 1)
      00056C E0               [24] 1524 	movx	a,@dptr
      00056D FF               [12] 1525 	mov	r7,a
      00056E BF 01 02         [24] 1526 	cjne	r7,#0x01,00361$
      000571 80 05            [24] 1527 	sjmp	00170$
      000573                       1528 00361$:
                                   1529 ;	sunkbd_hid.c:572: case 0x01:
      000573 BF 21 54         [24] 1530 	cjne	r7,#0x21,00178$
      000576 80 4A            [24] 1531 	sjmp	00177$
      000578                       1532 00170$:
                                   1533 ;	sunkbd_hid.c:573: if (sdat->wValueL == 0) { /* only AS 0 supported */
      000578 74 02            [12] 1534 	mov	a,#0x02
      00057A 25 38            [12] 1535 	add	a,_sdat
      00057C FE               [12] 1536 	mov	r6,a
      00057D E4               [12] 1537 	clr	a
      00057E 35 39            [12] 1538 	addc	a,(_sdat + 1)
      000580 FF               [12] 1539 	mov	r7,a
      000581 8E 82            [24] 1540 	mov	dpl,r6
      000583 8F 83            [24] 1541 	mov	dph,r7
      000585 E0               [24] 1542 	movx	a,@dptr
      000586 70 32            [24] 1543 	jnz	00175$
                                   1544 ;	sunkbd_hid.c:587: if (sdat->wIndexL == 0) {
      000588 74 04            [12] 1545 	mov	a,#0x04
      00058A 25 38            [12] 1546 	add	a,_sdat
      00058C FE               [12] 1547 	mov	r6,a
      00058D E4               [12] 1548 	clr	a
      00058E 35 39            [12] 1549 	addc	a,(_sdat + 1)
      000590 FF               [12] 1550 	mov	r7,a
      000591 8E 82            [24] 1551 	mov	dpl,r6
      000593 8F 83            [24] 1552 	mov	dph,r7
      000595 E0               [24] 1553 	movx	a,@dptr
      000596 70 1A            [24] 1554 	jnz	00172$
                                   1555 ;	sunkbd_hid.c:588: IN1CS  |= 0x02;     /* remove busy */
      000598 90 7F B6         [24] 1556 	mov	dptr,#_IN1CS
      00059B E0               [24] 1557 	movx	a,@dptr
      00059C FF               [12] 1558 	mov	r7,a
      00059D 74 02            [12] 1559 	mov	a,#0x02
      00059F 4F               [12] 1560 	orl	a,r7
      0005A0 F0               [24] 1561 	movx	@dptr,a
                                   1562 ;	sunkbd_hid.c:589: TOGCTL = 0x11;
      0005A1 90 7F D7         [24] 1563 	mov	dptr,#_TOGCTL
      0005A4 74 11            [12] 1564 	mov	a,#0x11
      0005A6 F0               [24] 1565 	movx	@dptr,a
                                   1566 ;	sunkbd_hid.c:590: TOGCTL = 0x31;      /* reset toggle of IN1 */
      0005A7 74 31            [12] 1567 	mov	a,#0x31
      0005A9 F0               [24] 1568 	movx	@dptr,a
                                   1569 ;	sunkbd_hid.c:593: EP0CS     = 0x02;   /* clear HSNACK */
      0005AA 90 7F B4         [24] 1570 	mov	dptr,#_EP0CS
      0005AD 74 02            [12] 1571 	mov	a,#0x02
      0005AF F0               [24] 1572 	movx	@dptr,a
      0005B0 80 26            [24] 1573 	sjmp	00183$
      0005B2                       1574 00172$:
                                   1575 ;	sunkbd_hid.c:595: EP0CS  = 0x03;   /* stall */
      0005B2 90 7F B4         [24] 1576 	mov	dptr,#_EP0CS
      0005B5 74 03            [12] 1577 	mov	a,#0x03
      0005B7 F0               [24] 1578 	movx	@dptr,a
      0005B8 80 1E            [24] 1579 	sjmp	00183$
      0005BA                       1580 00175$:
                                   1581 ;	sunkbd_hid.c:597: EP0CS  = 0x03;   /* stall */
      0005BA 90 7F B4         [24] 1582 	mov	dptr,#_EP0CS
      0005BD 74 03            [12] 1583 	mov	a,#0x03
      0005BF F0               [24] 1584 	movx	@dptr,a
                                   1585 ;	sunkbd_hid.c:598: break;
                                   1586 ;	sunkbd_hid.c:601: case 0x21:
      0005C0 80 16            [24] 1587 	sjmp	00183$
      0005C2                       1588 00177$:
                                   1589 ;	sunkbd_hid.c:602: EP0CS     = 0x02;   /* clear HSNACK */
      0005C2 90 7F B4         [24] 1590 	mov	dptr,#_EP0CS
      0005C5 74 02            [12] 1591 	mov	a,#0x02
      0005C7 F0               [24] 1592 	movx	@dptr,a
                                   1593 ;	sunkbd_hid.c:603: break;
                                   1594 ;	sunkbd_hid.c:605: default:
      0005C8 80 0E            [24] 1595 	sjmp	00183$
      0005CA                       1596 00178$:
                                   1597 ;	sunkbd_hid.c:606: EP0CS     = 0x03;   /* stall */
      0005CA 90 7F B4         [24] 1598 	mov	dptr,#_EP0CS
      0005CD 74 03            [12] 1599 	mov	a,#0x03
      0005CF F0               [24] 1600 	movx	@dptr,a
                                   1601 ;	sunkbd_hid.c:609: break;
                                   1602 ;	sunkbd_hid.c:611: default:
      0005D0 80 06            [24] 1603 	sjmp	00183$
      0005D2                       1604 00180$:
                                   1605 ;	sunkbd_hid.c:612: EP0CS     = 0x03;   /* stall */
      0005D2 90 7F B4         [24] 1606 	mov	dptr,#_EP0CS
      0005D5 74 03            [12] 1607 	mov	a,#0x03
      0005D7 F0               [24] 1608 	movx	@dptr,a
                                   1609 ;	sunkbd_hid.c:614: }
      0005D8                       1610 00183$:
                                   1611 ;	sunkbd_hid.c:620: if (IN07IRQ & 0x01) {
      0005D8 90 7F A9         [24] 1612 	mov	dptr,#_IN07IRQ
      0005DB E0               [24] 1613 	movx	a,@dptr
      0005DC FF               [12] 1614 	mov	r7,a
      0005DD 30 E0 06         [24] 1615 	jnb	acc.0,00185$
                                   1616 ;	sunkbd_hid.c:622: IN07IRQ = 0x01;
      0005E0 90 7F A9         [24] 1617 	mov	dptr,#_IN07IRQ
      0005E3 74 01            [12] 1618 	mov	a,#0x01
      0005E5 F0               [24] 1619 	movx	@dptr,a
      0005E6                       1620 00185$:
                                   1621 ;	sunkbd_hid.c:627: if (IN07IRQ & 0x02) {
      0005E6 90 7F A9         [24] 1622 	mov	dptr,#_IN07IRQ
      0005E9 E0               [24] 1623 	movx	a,@dptr
      0005EA FF               [12] 1624 	mov	r7,a
      0005EB 30 E1 08         [24] 1625 	jnb	acc.1,00187$
                                   1626 ;	sunkbd_hid.c:629: IN07IRQ = 0x02;
      0005EE 90 7F A9         [24] 1627 	mov	dptr,#_IN07IRQ
      0005F1 74 02            [12] 1628 	mov	a,#0x02
      0005F3 F0               [24] 1629 	movx	@dptr,a
                                   1630 ;	sunkbd_hid.c:632: in1_busy = FALSE;
      0005F4 C2 03            [12] 1631 	clr	_in1_busy
      0005F6                       1632 00187$:
                                   1633 ;	sunkbd_hid.c:647: if (OUT07IRQ & 0x01) {
      0005F6 90 7F AA         [24] 1634 	mov	dptr,#_OUT07IRQ
      0005F9 E0               [24] 1635 	movx	a,@dptr
      0005FA FF               [12] 1636 	mov	r7,a
      0005FB 30 E0 3B         [24] 1637 	jnb	acc.0,00191$
                                   1638 ;	sunkbd_hid.c:649: OUT07IRQ = 0x01;
      0005FE 90 7F AA         [24] 1639 	mov	dptr,#_OUT07IRQ
      000601 74 01            [12] 1640 	mov	a,#0x01
      000603 F0               [24] 1641 	movx	@dptr,a
                                   1642 ;	sunkbd_hid.c:653: if (is_ctrl_out0_kbd) {
      000604 30 01 2D         [24] 1643 	jnb	_is_ctrl_out0_kbd,00189$
                                   1644 ;	sunkbd_hid.c:654: Byte led_status = out0buf(0);
      000607 90 7E C0         [24] 1645 	mov	dptr,#_OUT0BUF
      00060A E0               [24] 1646 	movx	a,@dptr
      00060B FF               [12] 1647 	mov	r7,a
                                   1648 ;	sunkbd_hid.c:660: SBUF0 = SUNKBD_CMD_SETLED;
      00060C 75 99 0E         [24] 1649 	mov	_SBUF0,#0x0e
                                   1650 ;	sunkbd_hid.c:662: kbd_txmit_me = ((led_status & 0x02) << 2) | (led_status & 0x04) |
      00060F 74 02            [12] 1651 	mov	a,#0x02
      000611 5F               [12] 1652 	anl	a,r7
      000612 25 E0            [12] 1653 	add	a,acc
      000614 25 E0            [12] 1654 	add	a,acc
      000616 FE               [12] 1655 	mov	r6,a
      000617 74 04            [12] 1656 	mov	a,#0x04
      000619 5F               [12] 1657 	anl	a,r7
      00061A 42 0E            [12] 1658 	orl	ar6,a
                                   1659 ;	sunkbd_hid.c:663: ((led_status & 0x08) >> 2) | (led_status & 0x01);
      00061C 74 08            [12] 1660 	mov	a,#0x08
      00061E 5F               [12] 1661 	anl	a,r7
      00061F 03               [12] 1662 	rr	a
      000620 03               [12] 1663 	rr	a
      000621 54 3F            [12] 1664 	anl	a,#0x3f
      000623 FD               [12] 1665 	mov	r5,a
      000624 42 0E            [12] 1666 	orl	ar6,a
      000626 74 01            [12] 1667 	mov	a,#0x01
      000628 5F               [12] 1668 	anl	a,r7
      000629 4E               [12] 1669 	orl	a,r6
      00062A F5 2D            [12] 1670 	mov	_kbd_txmit_me,a
                                   1671 ;	sunkbd_hid.c:665: is_ctrl_out0_kbd = FALSE;
      00062C C2 01            [12] 1672 	clr	_is_ctrl_out0_kbd
                                   1673 ;	sunkbd_hid.c:666: EP0CS            = 0x02;   /* clear HSNACK */
      00062E 90 7F B4         [24] 1674 	mov	dptr,#_EP0CS
      000631 74 02            [12] 1675 	mov	a,#0x02
      000633 F0               [24] 1676 	movx	@dptr,a
      000634                       1677 00189$:
                                   1678 ;	sunkbd_hid.c:671: OUT0BC = 0x00;
      000634 90 7F C5         [24] 1679 	mov	dptr,#_OUT0BC
      000637 E4               [12] 1680 	clr	a
      000638 F0               [24] 1681 	movx	@dptr,a
      000639                       1682 00191$:
                                   1683 ;	sunkbd_hid.c:675: if (USBIRQ & 0x10) {
      000639 90 7F AB         [24] 1684 	mov	dptr,#_USBIRQ
      00063C E0               [24] 1685 	movx	a,@dptr
      00063D FF               [12] 1686 	mov	r7,a
      00063E 30 E4 0F         [24] 1687 	jnb	acc.4,00194$
                                   1688 ;	sunkbd_hid.c:677: USBIRQ = 0x10;
      000641 90 7F AB         [24] 1689 	mov	dptr,#_USBIRQ
      000644 74 10            [12] 1690 	mov	a,#0x10
      000646 F0               [24] 1691 	movx	@dptr,a
                                   1692 ;	sunkbd_hid.c:679: apply_reset_values();
      000647 75 D0 00         [24] 1693 	mov	psw,#0x00
      00064A 12 00 CB         [24] 1694 	lcall	_apply_reset_values
      00064D 75 D0 08         [24] 1695 	mov	psw,#0x08
      000650                       1696 00194$:
      000650 D0 D0            [24] 1697 	pop	psw
      000652 D0 00            [24] 1698 	pop	(0+0)
      000654 D0 01            [24] 1699 	pop	(0+1)
      000656 D0 02            [24] 1700 	pop	(0+2)
      000658 D0 03            [24] 1701 	pop	(0+3)
      00065A D0 04            [24] 1702 	pop	(0+4)
      00065C D0 05            [24] 1703 	pop	(0+5)
      00065E D0 06            [24] 1704 	pop	(0+6)
      000660 D0 07            [24] 1705 	pop	(0+7)
      000662 D0 83            [24] 1706 	pop	dph
      000664 D0 82            [24] 1707 	pop	dpl
      000666 D0 F0            [24] 1708 	pop	b
      000668 D0 E0            [24] 1709 	pop	acc
      00066A D0 21            [24] 1710 	pop	bits
      00066C D2 AF            [12] 1711 	setb	ea
      00066E 32               [24] 1712 	reti
                                   1713 ;------------------------------------------------------------
                                   1714 ;Allocation info for local variables in function 'kbd_serial_isr'
                                   1715 ;------------------------------------------------------------
                                   1716 ;scancode                  Allocated to registers r7 
                                   1717 ;mod_map                   Allocated to registers r6 
                                   1718 ;i                         Allocated to registers r6 
                                   1719 ;------------------------------------------------------------
                                   1720 ;	sunkbd_hid.c:693: static void kbd_serial_isr(void) __interrupt (4) __using (2) __critical
                                   1721 ;	-----------------------------------------
                                   1722 ;	 function kbd_serial_isr
                                   1723 ;	-----------------------------------------
      00066F                       1724 _kbd_serial_isr:
                           000017  1725 	ar7 = 0x17
                           000016  1726 	ar6 = 0x16
                           000015  1727 	ar5 = 0x15
                           000014  1728 	ar4 = 0x14
                           000013  1729 	ar3 = 0x13
                           000012  1730 	ar2 = 0x12
                           000011  1731 	ar1 = 0x11
                           000010  1732 	ar0 = 0x10
      00066F C2 AF            [12] 1733 	clr	ea
      000671 C0 E0            [24] 1734 	push	acc
      000673 C0 82            [24] 1735 	push	dpl
      000675 C0 83            [24] 1736 	push	dph
      000677 C0 D0            [24] 1737 	push	psw
      000679 75 D0 10         [24] 1738 	mov	psw,#0x10
                                   1739 ;	sunkbd_hid.c:700: if (RI_0) {
      00067C 20 98 03         [24] 1740 	jb	_RI_0,00232$
      00067F 02 07 8D         [24] 1741 	ljmp	00145$
      000682                       1742 00232$:
                                   1743 ;	sunkbd_hid.c:702: scancode = SBUF0;
      000682 AF 99            [24] 1744 	mov	r7,_SBUF0
                                   1745 ;	sunkbd_hid.c:704: RI_0 = 0;
      000684 C2 98            [12] 1746 	clr	_RI_0
                                   1747 ;	sunkbd_hid.c:718: switch (scancode) {
      000686 BF 7F 02         [24] 1748 	cjne	r7,#0x7f,00233$
      000689 80 14            [24] 1749 	sjmp	00157$
      00068B                       1750 00233$:
      00068B BF FE 02         [24] 1751 	cjne	r7,#0xfe,00234$
      00068E 80 09            [24] 1752 	sjmp	00106$
      000690                       1753 00234$:
      000690 BF FF 21         [24] 1754 	cjne	r7,#0xff,00111$
                                   1755 ;	sunkbd_hid.c:721: sunkbd_reset = -1;
      000693 75 23 FF         [24] 1756 	mov	_sunkbd_reset,#0xff
                                   1757 ;	sunkbd_hid.c:722: break;
      000696 02 07 8D         [24] 1758 	ljmp	00145$
                                   1759 ;	sunkbd_hid.c:724: case SUNKBD_RET_LAYOUT:
      000699                       1760 00106$:
                                   1761 ;	sunkbd_hid.c:725: sunkbd_layout = -1;
      000699 75 24 FF         [24] 1762 	mov	_sunkbd_layout,#0xff
                                   1763 ;	sunkbd_hid.c:726: break;
      00069C 02 07 8D         [24] 1764 	ljmp	00145$
                                   1765 ;	sunkbd_hid.c:731: while (i-- > 0)
      00069F                       1766 00157$:
      00069F 7E 08            [12] 1767 	mov	r6,#0x08
      0006A1                       1768 00108$:
      0006A1 8E 15            [24] 1769 	mov	ar5,r6
      0006A3 1E               [12] 1770 	dec	r6
      0006A4 ED               [12] 1771 	mov	a,r5
      0006A5 60 08            [24] 1772 	jz	00110$
                                   1773 ;	sunkbd_hid.c:732: key_buffer[i] = 0;
      0006A7 EE               [12] 1774 	mov	a,r6
      0006A8 24 25            [12] 1775 	add	a,#_key_buffer
      0006AA F8               [12] 1776 	mov	r0,a
      0006AB 76 00            [12] 1777 	mov	@r0,#0x00
      0006AD 80 F2            [24] 1778 	sjmp	00108$
      0006AF                       1779 00110$:
                                   1780 ;	sunkbd_hid.c:733: kbd_new_keys   = TRUE;
      0006AF D2 00            [12] 1781 	setb	_kbd_new_keys
                                   1782 ;	sunkbd_hid.c:734: break;
      0006B1 02 07 8D         [24] 1783 	ljmp	00145$
                                   1784 ;	sunkbd_hid.c:736: default:
      0006B4                       1785 00111$:
                                   1786 ;	sunkbd_hid.c:737: parse_scancode = 0;
      0006B4 C2 04            [12] 1787 	clr	_kbd_serial_isr_parse_scancode_1_38
                                   1788 ;	sunkbd_hid.c:739: switch (scancode & SUNKBD_KEY) {
      0006B6 74 7F            [12] 1789 	mov	a,#0x7f
      0006B8 5F               [12] 1790 	anl	a,r7
      0006B9 FE               [12] 1791 	mov	r6,a
      0006BA BE 0D 02         [24] 1792 	cjne	r6,#0x0d,00238$
      0006BD 80 3C            [24] 1793 	sjmp	00117$
      0006BF                       1794 00238$:
      0006BF BE 13 02         [24] 1795 	cjne	r6,#0x13,00239$
      0006C2 80 2B            [24] 1796 	sjmp	00114$
      0006C4                       1797 00239$:
      0006C4 BE 31 02         [24] 1798 	cjne	r6,#0x31,00240$
      0006C7 80 46            [24] 1799 	sjmp	00120$
      0006C9                       1800 00240$:
      0006C9 BE 48 02         [24] 1801 	cjne	r6,#0x48,00241$
      0006CC 80 35            [24] 1802 	sjmp	00119$
      0006CE                       1803 00241$:
      0006CE BE 4C 02         [24] 1804 	cjne	r6,#0x4c,00242$
      0006D1 80 14            [24] 1805 	sjmp	00112$
      0006D3                       1806 00242$:
      0006D3 BE 63 02         [24] 1807 	cjne	r6,#0x63,00243$
      0006D6 80 13            [24] 1808 	sjmp	00113$
      0006D8                       1809 00243$:
      0006D8 BE 6E 02         [24] 1810 	cjne	r6,#0x6e,00244$
      0006DB 80 1A            [24] 1811 	sjmp	00116$
      0006DD                       1812 00244$:
      0006DD BE 78 02         [24] 1813 	cjne	r6,#0x78,00245$
      0006E0 80 11            [24] 1814 	sjmp	00115$
      0006E2                       1815 00245$:
                                   1816 ;	sunkbd_hid.c:741: case 0x4c:
      0006E2 BE 7A 36         [24] 1817 	cjne	r6,#0x7a,00121$
      0006E5 80 18            [24] 1818 	sjmp	00118$
      0006E7                       1819 00112$:
                                   1820 ;	sunkbd_hid.c:742: mod_map        = 0x01;
      0006E7 7E 01            [12] 1821 	mov	r6,#0x01
                                   1822 ;	sunkbd_hid.c:743: break;
                                   1823 ;	sunkbd_hid.c:746: case 0x63:
      0006E9 80 34            [24] 1824 	sjmp	00122$
      0006EB                       1825 00113$:
                                   1826 ;	sunkbd_hid.c:747: mod_map        = 0x02;
      0006EB 7E 02            [12] 1827 	mov	r6,#0x02
                                   1828 ;	sunkbd_hid.c:748: break;
                                   1829 ;	sunkbd_hid.c:751: case 0x13:
      0006ED 80 30            [24] 1830 	sjmp	00122$
      0006EF                       1831 00114$:
                                   1832 ;	sunkbd_hid.c:752: mod_map        = 0x04;
      0006EF 7E 04            [12] 1833 	mov	r6,#0x04
                                   1834 ;	sunkbd_hid.c:753: break;
                                   1835 ;	sunkbd_hid.c:756: case 0x78:
      0006F1 80 2C            [24] 1836 	sjmp	00122$
      0006F3                       1837 00115$:
                                   1838 ;	sunkbd_hid.c:757: mod_map        = 0x08;
      0006F3 7E 08            [12] 1839 	mov	r6,#0x08
                                   1840 ;	sunkbd_hid.c:758: break;
                                   1841 ;	sunkbd_hid.c:761: case 0x6e:
      0006F5 80 28            [24] 1842 	sjmp	00122$
      0006F7                       1843 00116$:
                                   1844 ;	sunkbd_hid.c:762: mod_map        = 0x20;
      0006F7 7E 20            [12] 1845 	mov	r6,#0x20
                                   1846 ;	sunkbd_hid.c:763: break;
                                   1847 ;	sunkbd_hid.c:766: case 0x0d:
      0006F9 80 24            [24] 1848 	sjmp	00122$
      0006FB                       1849 00117$:
                                   1850 ;	sunkbd_hid.c:767: mod_map        = 0x40;
      0006FB 7E 40            [12] 1851 	mov	r6,#0x40
                                   1852 ;	sunkbd_hid.c:768: break;
                                   1853 ;	sunkbd_hid.c:771: case 0x7a:
      0006FD 80 20            [24] 1854 	sjmp	00122$
      0006FF                       1855 00118$:
                                   1856 ;	sunkbd_hid.c:772: mod_map        = 0x80;
      0006FF 7E 80            [12] 1857 	mov	r6,#0x80
                                   1858 ;	sunkbd_hid.c:773: break;
                                   1859 ;	sunkbd_hid.c:776: case 0x48:
      000701 80 1C            [24] 1860 	sjmp	00122$
      000703                       1861 00119$:
                                   1862 ;	sunkbd_hid.c:777: mod_map        = 0x04;
      000703 7E 04            [12] 1863 	mov	r6,#0x04
                                   1864 ;	sunkbd_hid.c:778: scancode       = 0x09 | (scancode & SUNKBD_RELEASE);
      000705 74 80            [12] 1865 	mov	a,#0x80
      000707 5F               [12] 1866 	anl	a,r7
      000708 44 09            [12] 1867 	orl	a,#0x09
      00070A FF               [12] 1868 	mov	r7,a
                                   1869 ;	sunkbd_hid.c:779: parse_scancode = 1;
      00070B D2 04            [12] 1870 	setb	_kbd_serial_isr_parse_scancode_1_38
                                   1871 ;	sunkbd_hid.c:780: break;
                                   1872 ;	sunkbd_hid.c:783: case 0x31:
      00070D 80 10            [24] 1873 	sjmp	00122$
      00070F                       1874 00120$:
                                   1875 ;	sunkbd_hid.c:784: mod_map        = 0x04;
      00070F 7E 04            [12] 1876 	mov	r6,#0x04
                                   1877 ;	sunkbd_hid.c:785: scancode       = 0x0b | (scancode & SUNKBD_RELEASE);
      000711 74 80            [12] 1878 	mov	a,#0x80
      000713 5F               [12] 1879 	anl	a,r7
      000714 44 0B            [12] 1880 	orl	a,#0x0b
      000716 FF               [12] 1881 	mov	r7,a
                                   1882 ;	sunkbd_hid.c:786: parse_scancode = 1;
      000717 D2 04            [12] 1883 	setb	_kbd_serial_isr_parse_scancode_1_38
                                   1884 ;	sunkbd_hid.c:787: break;
                                   1885 ;	sunkbd_hid.c:789: default:
      000719 80 04            [24] 1886 	sjmp	00122$
      00071B                       1887 00121$:
                                   1888 ;	sunkbd_hid.c:790: mod_map        = 0;
      00071B 7E 00            [12] 1889 	mov	r6,#0x00
                                   1890 ;	sunkbd_hid.c:791: parse_scancode = 1;
      00071D D2 04            [12] 1891 	setb	_kbd_serial_isr_parse_scancode_1_38
                                   1892 ;	sunkbd_hid.c:793: }
      00071F                       1893 00122$:
                                   1894 ;	sunkbd_hid.c:796: if (mod_map) {
      00071F EE               [12] 1895 	mov	a,r6
      000720 60 16            [24] 1896 	jz	00127$
                                   1897 ;	sunkbd_hid.c:801: if (scancode & SUNKBD_RELEASE) {
      000722 EF               [12] 1898 	mov	a,r7
      000723 30 E7 0B         [24] 1899 	jnb	acc.7,00124$
                                   1900 ;	sunkbd_hid.c:803: key_buffer[0] &= ~mod_map;
      000726 EE               [12] 1901 	mov	a,r6
      000727 F4               [12] 1902 	cpl	a
      000728 FD               [12] 1903 	mov	r5,a
      000729 55 25            [12] 1904 	anl	a,_key_buffer
      00072B F5 25            [12] 1905 	mov	_key_buffer,a
                                   1906 ;	sunkbd_hid.c:804: kbd_new_keys   = TRUE;
      00072D D2 00            [12] 1907 	setb	_kbd_new_keys
      00072F 80 07            [24] 1908 	sjmp	00127$
      000731                       1909 00124$:
                                   1910 ;	sunkbd_hid.c:807: key_buffer[0] |= mod_map;
      000731 EE               [12] 1911 	mov	a,r6
      000732 45 25            [12] 1912 	orl	a,_key_buffer
      000734 F5 25            [12] 1913 	mov	_key_buffer,a
                                   1914 ;	sunkbd_hid.c:808: kbd_new_keys   = TRUE;
      000736 D2 00            [12] 1915 	setb	_kbd_new_keys
      000738                       1916 00127$:
                                   1917 ;	sunkbd_hid.c:813: if (parse_scancode) {
      000738 30 04 52         [24] 1918 	jnb	_kbd_serial_isr_parse_scancode_1_38,00145$
                                   1919 ;	sunkbd_hid.c:818: if (scancode & SUNKBD_RELEASE) {
      00073B EF               [12] 1920 	mov	a,r7
      00073C 30 E7 26         [24] 1921 	jnb	acc.7,00139$
                                   1922 ;	sunkbd_hid.c:820: scancode &= SUNKBD_KEY;
      00073F 53 17 7F         [24] 1923 	anl	ar7,#0x7f
                                   1924 ;	sunkbd_hid.c:821: scancode  = scancode_map[scancode];
      000742 EF               [12] 1925 	mov	a,r7
      000743 90 0A 7D         [24] 1926 	mov	dptr,#_scancode_map
      000746 93               [24] 1927 	movc	a,@a+dptr
      000747 FF               [12] 1928 	mov	r7,a
                                   1929 ;	sunkbd_hid.c:823: while (i > 1) {
      000748 7E 07            [12] 1930 	mov	r6,#0x07
      00074A                       1931 00130$:
      00074A EE               [12] 1932 	mov	a,r6
      00074B 24 FE            [12] 1933 	add	a,#0xff - 0x01
      00074D 50 12            [24] 1934 	jnc	00132$
                                   1935 ;	sunkbd_hid.c:824: if (key_buffer[i] == scancode)
      00074F EE               [12] 1936 	mov	a,r6
      000750 24 25            [12] 1937 	add	a,#_key_buffer
      000752 F9               [12] 1938 	mov	r1,a
      000753 E7               [12] 1939 	mov	a,@r1
      000754 FD               [12] 1940 	mov	r5,a
      000755 B5 17 06         [24] 1941 	cjne	a,ar7,00129$
                                   1942 ;	sunkbd_hid.c:825: key_buffer[i] = 0;
      000758 EE               [12] 1943 	mov	a,r6
      000759 24 25            [12] 1944 	add	a,#_key_buffer
      00075B F8               [12] 1945 	mov	r0,a
      00075C 76 00            [12] 1946 	mov	@r0,#0x00
      00075E                       1947 00129$:
                                   1948 ;	sunkbd_hid.c:826: i--;
      00075E 1E               [12] 1949 	dec	r6
      00075F 80 E9            [24] 1950 	sjmp	00130$
      000761                       1951 00132$:
                                   1952 ;	sunkbd_hid.c:828: kbd_new_keys = TRUE;
      000761 D2 00            [12] 1953 	setb	_kbd_new_keys
      000763 80 28            [24] 1954 	sjmp	00145$
      000765                       1955 00139$:
                                   1956 ;	sunkbd_hid.c:831: scancode &= SUNKBD_KEY;
      000765 53 17 7F         [24] 1957 	anl	ar7,#0x7f
                                   1958 ;	sunkbd_hid.c:832: scancode  = scancode_map[scancode];
      000768 EF               [12] 1959 	mov	a,r7
      000769 90 0A 7D         [24] 1960 	mov	dptr,#_scancode_map
      00076C 93               [24] 1961 	movc	a,@a+dptr
      00076D FF               [12] 1962 	mov	r7,a
                                   1963 ;	sunkbd_hid.c:833: i = 2;
      00076E 7E 02            [12] 1964 	mov	r6,#0x02
                                   1965 ;	sunkbd_hid.c:834: while (i < 8) {
      000770 7D 02            [12] 1966 	mov	r5,#0x02
      000772                       1967 00135$:
      000772 BD 08 00         [24] 1968 	cjne	r5,#0x08,00254$
      000775                       1969 00254$:
      000775 50 14            [24] 1970 	jnc	00137$
                                   1971 ;	sunkbd_hid.c:835: if (!key_buffer[i]) {
      000777 ED               [12] 1972 	mov	a,r5
      000778 24 25            [12] 1973 	add	a,#_key_buffer
      00077A F9               [12] 1974 	mov	r1,a
      00077B E7               [12] 1975 	mov	a,@r1
      00077C 70 08            [24] 1976 	jnz	00134$
                                   1977 ;	sunkbd_hid.c:836: key_buffer[i] = scancode;
      00077E EE               [12] 1978 	mov	a,r6
      00077F 24 25            [12] 1979 	add	a,#_key_buffer
      000781 F8               [12] 1980 	mov	r0,a
      000782 A6 17            [24] 1981 	mov	@r0,ar7
                                   1982 ;	sunkbd_hid.c:837: break;
      000784 80 05            [24] 1983 	sjmp	00137$
      000786                       1984 00134$:
                                   1985 ;	sunkbd_hid.c:839: i++;
      000786 0D               [12] 1986 	inc	r5
      000787 8D 16            [24] 1987 	mov	ar6,r5
      000789 80 E7            [24] 1988 	sjmp	00135$
      00078B                       1989 00137$:
                                   1990 ;	sunkbd_hid.c:841: kbd_new_keys = TRUE;
      00078B D2 00            [12] 1991 	setb	_kbd_new_keys
                                   1992 ;	sunkbd_hid.c:845: }
      00078D                       1993 00145$:
                                   1994 ;	sunkbd_hid.c:851: if (TI_0) {
                                   1995 ;	sunkbd_hid.c:852: TI_0 = 0;
      00078D 10 99 02         [24] 1996 	jbc	_TI_0,00257$
      000790 80 06            [24] 1997 	sjmp	00150$
      000792                       1998 00257$:
                                   1999 ;	sunkbd_hid.c:856: SBUF0        = (Byte)kbd_txmit_me;
      000792 85 2D 99         [24] 2000 	mov	_SBUF0,_kbd_txmit_me
                                   2001 ;	sunkbd_hid.c:857: kbd_txmit_me = -1;
      000795 75 2D FF         [24] 2002 	mov	_kbd_txmit_me,#0xff
      000798                       2003 00150$:
      000798 D0 D0            [24] 2004 	pop	psw
      00079A D0 83            [24] 2005 	pop	dph
      00079C D0 82            [24] 2006 	pop	dpl
      00079E D0 E0            [24] 2007 	pop	acc
      0007A0 D2 AF            [12] 2008 	setb	ea
      0007A2 32               [24] 2009 	reti
                                   2010 ;	eliminated unneeded push/pop b
                                   2011 ;------------------------------------------------------------
                                   2012 ;Allocation info for local variables in function 'timer2_isr'
                                   2013 ;------------------------------------------------------------
                                   2014 ;kbd_send_report           Allocated to registers r7 
                                   2015 ;i                         Allocated to registers r7 
                                   2016 ;------------------------------------------------------------
                                   2017 ;	sunkbd_hid.c:976: static void timer2_isr() __interrupt (5) __using (3) __critical
                                   2018 ;	-----------------------------------------
                                   2019 ;	 function timer2_isr
                                   2020 ;	-----------------------------------------
      0007A3                       2021 _timer2_isr:
                           00001F  2022 	ar7 = 0x1f
                           00001E  2023 	ar6 = 0x1e
                           00001D  2024 	ar5 = 0x1d
                           00001C  2025 	ar4 = 0x1c
                           00001B  2026 	ar3 = 0x1b
                           00001A  2027 	ar2 = 0x1a
                           000019  2028 	ar1 = 0x19
                           000018  2029 	ar0 = 0x18
      0007A3 C2 AF            [12] 2030 	clr	ea
      0007A5 C0 E0            [24] 2031 	push	acc
      0007A7 C0 82            [24] 2032 	push	dpl
      0007A9 C0 83            [24] 2033 	push	dph
      0007AB C0 D0            [24] 2034 	push	psw
      0007AD 75 D0 18         [24] 2035 	mov	psw,#0x18
                                   2036 ;	sunkbd_hid.c:986: if (TF2) {
                                   2037 ;	sunkbd_hid.c:987: TF2 = 0;
      0007B0 10 CF 02         [24] 2038 	jbc	_TF2,00143$
      0007B3 80 40            [24] 2039 	sjmp	00116$
      0007B5                       2040 00143$:
                                   2041 ;	sunkbd_hid.c:993: kbd_send_report = FALSE;
      0007B5 7F 00            [12] 2042 	mov	r7,#0x00
                                   2043 ;	sunkbd_hid.c:995: if (!kbd_idle_mode) {
      0007B7 20 02 08         [24] 2044 	jb	_kbd_idle_mode,00104$
                                   2045 ;	sunkbd_hid.c:996: if (--kbd_idle_counter == 0) {
      0007BA D5 2F 05         [24] 2046 	djnz	_kbd_idle_counter,00104$
                                   2047 ;	sunkbd_hid.c:997: kbd_send_report  = TRUE;
      0007BD 7F 01            [12] 2048 	mov	r7,#0x01
                                   2049 ;	sunkbd_hid.c:999: kbd_idle_counter = kbd_idle_duration;
      0007BF 85 2E 2F         [24] 2050 	mov	_kbd_idle_counter,_kbd_idle_duration
      0007C2                       2051 00104$:
                                   2052 ;	sunkbd_hid.c:1004: if (kbd_new_keys) {
      0007C2 30 00 07         [24] 2053 	jnb	_kbd_new_keys,00106$
                                   2054 ;	sunkbd_hid.c:1005: kbd_send_report     = TRUE;
      0007C5 7F 01            [12] 2055 	mov	r7,#0x01
                                   2056 ;	sunkbd_hid.c:1006: kbd_new_keys        = FALSE;
      0007C7 C2 00            [12] 2057 	clr	_kbd_new_keys
                                   2058 ;	sunkbd_hid.c:1008: kbd_idle_counter    = kbd_idle_duration;
      0007C9 85 2E 2F         [24] 2059 	mov	_kbd_idle_counter,_kbd_idle_duration
      0007CC                       2060 00106$:
                                   2061 ;	sunkbd_hid.c:1011: if (kbd_send_report) {
      0007CC EF               [12] 2062 	mov	a,r7
      0007CD 60 26            [24] 2063 	jz	00116$
                                   2064 ;	sunkbd_hid.c:1012: if (!in1_busy) {
      0007CF 20 03 23         [24] 2065 	jb	_in1_busy,00116$
                                   2066 ;	sunkbd_hid.c:1014: while (i-- > 0)
      0007D2 7F 08            [12] 2067 	mov	r7,#0x08
      0007D4                       2068 00107$:
      0007D4 8F 1E            [24] 2069 	mov	ar6,r7
      0007D6 1F               [12] 2070 	dec	r7
      0007D7 EE               [12] 2071 	mov	a,r6
      0007D8 60 13            [24] 2072 	jz	00109$
                                   2073 ;	sunkbd_hid.c:1015: in1buf(i) = key_buffer[i];
      0007DA EF               [12] 2074 	mov	a,r7
      0007DB 24 80            [12] 2075 	add	a,#_IN1BUF
      0007DD F5 82            [12] 2076 	mov	dpl,a
      0007DF E4               [12] 2077 	clr	a
      0007E0 34 7E            [12] 2078 	addc	a,#(_IN1BUF >> 8)
      0007E2 F5 83            [12] 2079 	mov	dph,a
      0007E4 EF               [12] 2080 	mov	a,r7
      0007E5 24 25            [12] 2081 	add	a,#_key_buffer
      0007E7 F9               [12] 2082 	mov	r1,a
      0007E8 E7               [12] 2083 	mov	a,@r1
      0007E9 FE               [12] 2084 	mov	r6,a
      0007EA F0               [24] 2085 	movx	@dptr,a
      0007EB 80 E7            [24] 2086 	sjmp	00107$
      0007ED                       2087 00109$:
                                   2088 ;	sunkbd_hid.c:1018: in1_busy = TRUE;
      0007ED D2 03            [12] 2089 	setb	_in1_busy
                                   2090 ;	sunkbd_hid.c:1019: IN1BC    = 8;
      0007EF 90 7F B7         [24] 2091 	mov	dptr,#_IN1BC
      0007F2 74 08            [12] 2092 	mov	a,#0x08
      0007F4 F0               [24] 2093 	movx	@dptr,a
      0007F5                       2094 00116$:
      0007F5 D0 D0            [24] 2095 	pop	psw
      0007F7 D0 83            [24] 2096 	pop	dph
      0007F9 D0 82            [24] 2097 	pop	dpl
      0007FB D0 E0            [24] 2098 	pop	acc
      0007FD D2 AF            [12] 2099 	setb	ea
      0007FF 32               [24] 2100 	reti
                                   2101 ;	eliminated unneeded push/pop b
                                   2102 ;------------------------------------------------------------
                                   2103 ;Allocation info for local variables in function 'setup_usb_int'
                                   2104 ;------------------------------------------------------------
                                   2105 ;	sunkbd_hid.c:1068: static void setup_usb_int()
                                   2106 ;	-----------------------------------------
                                   2107 ;	 function setup_usb_int
                                   2108 ;	-----------------------------------------
      000800                       2109 _setup_usb_int:
                           000007  2110 	ar7 = 0x07
                           000006  2111 	ar6 = 0x06
                           000005  2112 	ar5 = 0x05
                           000004  2113 	ar4 = 0x04
                           000003  2114 	ar3 = 0x03
                           000002  2115 	ar2 = 0x02
                           000001  2116 	ar1 = 0x01
                           000000  2117 	ar0 = 0x00
                                   2118 ;	sunkbd_hid.c:1071: EA       = 0;
      000800 C2 AF            [12] 2119 	clr	_EA
                                   2120 ;	sunkbd_hid.c:1074: USBBAV   = 0x00;
      000802 90 7F AF         [24] 2121 	mov	dptr,#_USBBAV
      000805 E4               [12] 2122 	clr	a
      000806 F0               [24] 2123 	movx	@dptr,a
                                   2124 ;	sunkbd_hid.c:1077: USBIRQ   = 0xff;
      000807 90 7F AB         [24] 2125 	mov	dptr,#_USBIRQ
      00080A 14               [12] 2126 	dec	a
      00080B F0               [24] 2127 	movx	@dptr,a
                                   2128 ;	sunkbd_hid.c:1080: USBIEN   = 0x11;
      00080C 90 7F AE         [24] 2129 	mov	dptr,#_USBIEN
      00080F 74 11            [12] 2130 	mov	a,#0x11
      000811 F0               [24] 2131 	movx	@dptr,a
                                   2132 ;	sunkbd_hid.c:1084: IN07IRQ  = 0x07;
      000812 90 7F A9         [24] 2133 	mov	dptr,#_IN07IRQ
      000815 74 07            [12] 2134 	mov	a,#0x07
      000817 F0               [24] 2135 	movx	@dptr,a
                                   2136 ;	sunkbd_hid.c:1087: IN07IEN  = 0x01;
      000818 90 7F AC         [24] 2137 	mov	dptr,#_IN07IEN
      00081B 74 01            [12] 2138 	mov	a,#0x01
      00081D F0               [24] 2139 	movx	@dptr,a
                                   2140 ;	sunkbd_hid.c:1089: IN07IEN |= 0x02;
      00081E E0               [24] 2141 	movx	a,@dptr
      00081F FF               [12] 2142 	mov	r7,a
      000820 74 02            [12] 2143 	mov	a,#0x02
      000822 4F               [12] 2144 	orl	a,r7
      000823 F0               [24] 2145 	movx	@dptr,a
                                   2146 ;	sunkbd_hid.c:1096: OUT07IRQ = 0x01;
      000824 90 7F AA         [24] 2147 	mov	dptr,#_OUT07IRQ
      000827 74 01            [12] 2148 	mov	a,#0x01
      000829 F0               [24] 2149 	movx	@dptr,a
                                   2150 ;	sunkbd_hid.c:1099: OUT07IEN = 0x01;
      00082A 90 7F AD         [24] 2151 	mov	dptr,#_OUT07IEN
      00082D F0               [24] 2152 	movx	@dptr,a
                                   2153 ;	sunkbd_hid.c:1103: IN1CS  = 0x00;
      00082E 90 7F B6         [24] 2154 	mov	dptr,#_IN1CS
      000831 E4               [12] 2155 	clr	a
      000832 F0               [24] 2156 	movx	@dptr,a
                                   2157 ;	sunkbd_hid.c:1104: OUT1CS = 0x00;
      000833 90 7F C6         [24] 2158 	mov	dptr,#_OUT1CS
      000836 F0               [24] 2159 	movx	@dptr,a
                                   2160 ;	sunkbd_hid.c:1105: IN2CS  = 0x00;
      000837 90 7F B8         [24] 2161 	mov	dptr,#_IN2CS
      00083A F0               [24] 2162 	movx	@dptr,a
                                   2163 ;	sunkbd_hid.c:1106: OUT2CS = 0x00;
      00083B 90 7F C8         [24] 2164 	mov	dptr,#_OUT2CS
      00083E F0               [24] 2165 	movx	@dptr,a
                                   2166 ;	sunkbd_hid.c:1110: IN07VAL  = SUNKBD_INVAL;
      00083F 90 7F DE         [24] 2167 	mov	dptr,#_IN07VAL
      000842 74 03            [12] 2168 	mov	a,#0x03
      000844 F0               [24] 2169 	movx	@dptr,a
                                   2170 ;	sunkbd_hid.c:1111: OUT07VAL = SUNKBD_OUTVAL;
      000845 90 7F DF         [24] 2171 	mov	dptr,#_OUT07VAL
      000848 74 01            [12] 2172 	mov	a,#0x01
      00084A F0               [24] 2173 	movx	@dptr,a
                                   2174 ;	sunkbd_hid.c:1114: EUSB = 1;
      00084B D2 E8            [12] 2175 	setb	_EUSB
                                   2176 ;	sunkbd_hid.c:1117: EA   = 1;
      00084D D2 AF            [12] 2177 	setb	_EA
      00084F 22               [24] 2178 	ret
                                   2179 ;------------------------------------------------------------
                                   2180 ;Allocation info for local variables in function 'setup_ser_int'
                                   2181 ;------------------------------------------------------------
                                   2182 ;	sunkbd_hid.c:1126: static void setup_ser_int()
                                   2183 ;	-----------------------------------------
                                   2184 ;	 function setup_ser_int
                                   2185 ;	-----------------------------------------
      000850                       2186 _setup_ser_int:
                                   2187 ;	sunkbd_hid.c:1135: OUTB     = 0x00;
      000850 90 7F 97         [24] 2188 	mov	dptr,#_OUTB
      000853 E4               [12] 2189 	clr	a
      000854 F0               [24] 2190 	movx	@dptr,a
                                   2191 ;	sunkbd_hid.c:1136: OEB      = 0x02;
      000855 90 7F 9D         [24] 2192 	mov	dptr,#_OEB
      000858 74 02            [12] 2193 	mov	a,#0x02
      00085A F0               [24] 2194 	movx	@dptr,a
                                   2195 ;	sunkbd_hid.c:1137: OUTC     = 0x00;
      00085B 90 7F 98         [24] 2196 	mov	dptr,#_OUTC
      00085E E4               [12] 2197 	clr	a
      00085F F0               [24] 2198 	movx	@dptr,a
                                   2199 ;	sunkbd_hid.c:1138: OEC      = 0x84;
      000860 90 7F 9E         [24] 2200 	mov	dptr,#_OEC
      000863 74 84            [12] 2201 	mov	a,#0x84
      000865 F0               [24] 2202 	movx	@dptr,a
                                   2203 ;	sunkbd_hid.c:1139: PORTCCFG = 0x03;
      000866 90 7F 95         [24] 2204 	mov	dptr,#_PORTCCFG
      000869 74 03            [12] 2205 	mov	a,#0x03
      00086B F0               [24] 2206 	movx	@dptr,a
                                   2207 ;	sunkbd_hid.c:1140: PORTBCFG = 0x04;
      00086C 90 7F 94         [24] 2208 	mov	dptr,#_PORTBCFG
      00086F 04               [12] 2209 	inc	a
      000870 F0               [24] 2210 	movx	@dptr,a
                                   2211 ;	sunkbd_hid.c:1148: TMOD     = 0x20;
      000871 75 89 20         [24] 2212 	mov	_TMOD,#0x20
                                   2213 ;	sunkbd_hid.c:1149: CKCON   &= 0xef;
      000874 53 8E EF         [24] 2214 	anl	_CKCON,#0xef
                                   2215 ;	sunkbd_hid.c:1150: TH1      = 204;
      000877 75 8D CC         [24] 2216 	mov	_TH1,#0xcc
                                   2217 ;	sunkbd_hid.c:1152: PCON     = 0x00;
      00087A 75 87 00         [24] 2218 	mov	_PCON,#0x00
                                   2219 ;	sunkbd_hid.c:1160: SCON0    = 0x50;
      00087D 75 98 50         [24] 2220 	mov	_SCON0,#0x50
                                   2221 ;	sunkbd_hid.c:1161: T2CON    = 0x00;
      000880 75 C8 00         [24] 2222 	mov	_T2CON,#0x00
                                   2223 ;	sunkbd_hid.c:1163: ES0      = 1;
      000883 D2 AC            [12] 2224 	setb	_ES0
                                   2225 ;	sunkbd_hid.c:1179: TR1      = 1;
      000885 D2 8E            [12] 2226 	setb	_TR1
      000887 22               [24] 2227 	ret
                                   2228 ;------------------------------------------------------------
                                   2229 ;Allocation info for local variables in function 'setup_keyboard'
                                   2230 ;------------------------------------------------------------
                                   2231 ;j                         Allocated to registers r7 
                                   2232 ;------------------------------------------------------------
                                   2233 ;	sunkbd_hid.c:1189: static void setup_keyboard()
                                   2234 ;	-----------------------------------------
                                   2235 ;	 function setup_keyboard
                                   2236 ;	-----------------------------------------
      000888                       2237 _setup_keyboard:
                                   2238 ;	sunkbd_hid.c:1193: sunkbd_layout = 0;  /* not used yet */
      000888 75 24 00         [24] 2239 	mov	_sunkbd_layout,#0x00
                                   2240 ;	sunkbd_hid.c:1197: while (j-- > 0) {
      00088B 7F 08            [12] 2241 	mov	r7,#0x08
      00088D                       2242 00101$:
      00088D 8F 06            [24] 2243 	mov	ar6,r7
      00088F 1F               [12] 2244 	dec	r7
      000890 EE               [12] 2245 	mov	a,r6
      000891 60 14            [24] 2246 	jz	00103$
                                   2247 ;	sunkbd_hid.c:1198: in1buf(j)     = 0;
      000893 EF               [12] 2248 	mov	a,r7
      000894 24 80            [12] 2249 	add	a,#_IN1BUF
      000896 F5 82            [12] 2250 	mov	dpl,a
      000898 E4               [12] 2251 	clr	a
      000899 34 7E            [12] 2252 	addc	a,#(_IN1BUF >> 8)
      00089B F5 83            [12] 2253 	mov	dph,a
      00089D E4               [12] 2254 	clr	a
      00089E F0               [24] 2255 	movx	@dptr,a
                                   2256 ;	sunkbd_hid.c:1199: key_buffer[j] = 0;
      00089F EF               [12] 2257 	mov	a,r7
      0008A0 24 25            [12] 2258 	add	a,#_key_buffer
      0008A2 F8               [12] 2259 	mov	r0,a
      0008A3 76 00            [12] 2260 	mov	@r0,#0x00
      0008A5 80 E6            [24] 2261 	sjmp	00101$
      0008A7                       2262 00103$:
                                   2263 ;	sunkbd_hid.c:1203: sunkbd_reset = -2;
      0008A7 75 23 FE         [24] 2264 	mov	_sunkbd_reset,#0xfe
                                   2265 ;	sunkbd_hid.c:1204: SBUF0        = SUNKBD_CMD_RESET;
      0008AA 75 99 01         [24] 2266 	mov	_SBUF0,#0x01
                                   2267 ;	sunkbd_hid.c:1207: sunkbd_type  = sunkbd_reset;
      0008AD 85 23 22         [24] 2268 	mov	_sunkbd_type,_sunkbd_reset
                                   2269 ;	sunkbd_hid.c:1208: sunkbd_reset = 0;
      0008B0 75 23 00         [24] 2270 	mov	_sunkbd_reset,#0x00
                                   2271 ;	sunkbd_hid.c:1210: if (sunkbd_type == 4) { /* Type 4 keyboard */
      0008B3 74 04            [12] 2272 	mov	a,#0x04
      0008B5 B5 22 0E         [24] 2273 	cjne	a,_sunkbd_type,00114$
                                   2274 ;	sunkbd_hid.c:1211: sunkbd_layout = -2;
      0008B8 75 24 FE         [24] 2275 	mov	_sunkbd_layout,#0xfe
                                   2276 ;	sunkbd_hid.c:1213: SBUF0         = SUNKBD_CMD_LAYOUT;
      0008BB 75 99 0F         [24] 2277 	mov	_SBUF0,#0x0f
                                   2278 ;	sunkbd_hid.c:1215: if (sunkbd_layout & SUNKBD_LAYOUT_5_MASK)
      0008BE E5 24            [12] 2279 	mov	a,_sunkbd_layout
      0008C0 30 E5 03         [24] 2280 	jnb	acc.5,00114$
                                   2281 ;	sunkbd_hid.c:1216: sunkbd_type = 5;
      0008C3 75 22 05         [24] 2282 	mov	_sunkbd_type,#0x05
      0008C6                       2283 00114$:
      0008C6 22               [24] 2284 	ret
                                   2285 ;------------------------------------------------------------
                                   2286 ;Allocation info for local variables in function 'setup_timer2_int'
                                   2287 ;------------------------------------------------------------
                                   2288 ;	sunkbd_hid.c:1250: static void setup_timer2_int()
                                   2289 ;	-----------------------------------------
                                   2290 ;	 function setup_timer2_int
                                   2291 ;	-----------------------------------------
      0008C7                       2292 _setup_timer2_int:
                                   2293 ;	sunkbd_hid.c:1254: kbd_idle_counter = kbd_idle_duration;
      0008C7 85 2E 2F         [24] 2294 	mov	_kbd_idle_counter,_kbd_idle_duration
                                   2295 ;	sunkbd_hid.c:1265: T2CON  = 0x00;
      0008CA 75 C8 00         [24] 2296 	mov	_T2CON,#0x00
                                   2297 ;	sunkbd_hid.c:1266: RCAP2H = TH2 = 0xc1;
      0008CD 75 CD C1         [24] 2298 	mov	_TH2,#0xc1
      0008D0 75 CB C1         [24] 2299 	mov	_RCAP2H,#0xc1
                                   2300 ;	sunkbd_hid.c:1267: RCAP2L = TL2 = 0x80;
      0008D3 75 CC 80         [24] 2301 	mov	_TL2,#0x80
      0008D6 75 CA 80         [24] 2302 	mov	_RCAP2L,#0x80
                                   2303 ;	sunkbd_hid.c:1270: ET2    = 1;
      0008D9 D2 AD            [12] 2304 	setb	_ET2
                                   2305 ;	sunkbd_hid.c:1272: TF2    = 0;
      0008DB C2 CF            [12] 2306 	clr	_TF2
                                   2307 ;	sunkbd_hid.c:1274: TR2    = 1;
      0008DD D2 CA            [12] 2308 	setb	_TR2
      0008DF 22               [24] 2309 	ret
                                   2310 ;------------------------------------------------------------
                                   2311 ;Allocation info for local variables in function '_sdcc_external_startup'
                                   2312 ;------------------------------------------------------------
                                   2313 ;i                         Allocated to registers r7 
                                   2314 ;------------------------------------------------------------
                                   2315 ;	sunkbd_hid.c:1286: Byte _sdcc_external_startup()
                                   2316 ;	-----------------------------------------
                                   2317 ;	 function _sdcc_external_startup
                                   2318 ;	-----------------------------------------
      0008E0                       2319 __sdcc_external_startup:
                                   2320 ;	sunkbd_hid.c:1293: for (i = 2; i > 0; i--) ;
      0008E0 7F 02            [12] 2321 	mov	r7,#0x02
      0008E2                       2322 00103$:
      0008E2 EF               [12] 2323 	mov	a,r7
      0008E3 14               [12] 2324 	dec	a
      0008E4 FE               [12] 2325 	mov	r6,a
      0008E5 FF               [12] 2326 	mov	r7,a
      0008E6 70 FA            [24] 2327 	jnz	00103$
                                   2328 ;	sunkbd_hid.c:1296: USBCS &= ~0x04;    /* tristate the Disconnect pin */
      0008E8 90 7F D6         [24] 2329 	mov	dptr,#_USBCS
      0008EB E0               [24] 2330 	movx	a,@dptr
      0008EC FF               [12] 2331 	mov	r7,a
      0008ED 74 FB            [12] 2332 	mov	a,#0xfb
      0008EF 5F               [12] 2333 	anl	a,r7
      0008F0 F0               [24] 2334 	movx	@dptr,a
                                   2335 ;	sunkbd_hid.c:1297: USBCS |= 0x08;     /* disconnect USB core         */
      0008F1 E0               [24] 2336 	movx	a,@dptr
      0008F2 FF               [12] 2337 	mov	r7,a
      0008F3 74 08            [12] 2338 	mov	a,#0x08
      0008F5 4F               [12] 2339 	orl	a,r7
      0008F6 F0               [24] 2340 	movx	@dptr,a
                                   2341 ;	sunkbd_hid.c:1300: return(0);
      0008F7 75 82 00         [24] 2342 	mov	dpl,#0x00
      0008FA 22               [24] 2343 	ret
                                   2344 ;------------------------------------------------------------
                                   2345 ;Allocation info for local variables in function 'main'
                                   2346 ;------------------------------------------------------------
                                   2347 ;loop                      Allocated to registers r6 r7 
                                   2348 ;------------------------------------------------------------
                                   2349 ;	sunkbd_hid.c:1311: void main()
                                   2350 ;	-----------------------------------------
                                   2351 ;	 function main
                                   2352 ;	-----------------------------------------
      0008FB                       2353 _main:
                                   2354 ;	sunkbd_hid.c:1317: while (loop-- > 0) ;
      0008FB 7E 00            [12] 2355 	mov	r6,#0x00
      0008FD 7F 40            [12] 2356 	mov	r7,#0x40
      0008FF                       2357 00101$:
      0008FF 8E 04            [24] 2358 	mov	ar4,r6
      000901 8F 05            [24] 2359 	mov	ar5,r7
      000903 1E               [12] 2360 	dec	r6
      000904 BE FF 01         [24] 2361 	cjne	r6,#0xff,00119$
      000907 1F               [12] 2362 	dec	r7
      000908                       2363 00119$:
      000908 C3               [12] 2364 	clr	c
      000909 E4               [12] 2365 	clr	a
      00090A 9C               [12] 2366 	subb	a,r4
      00090B 74 80            [12] 2367 	mov	a,#(0x00 ^ 0x80)
      00090D 8D F0            [24] 2368 	mov	b,r5
      00090F 63 F0 80         [24] 2369 	xrl	b,#0x80
      000912 95 F0            [12] 2370 	subb	a,b
      000914 40 E9            [24] 2371 	jc	00101$
                                   2372 ;	sunkbd_hid.c:1321: apply_reset_values();
      000916 12 00 CB         [24] 2373 	lcall	_apply_reset_values
                                   2374 ;	sunkbd_hid.c:1323: setup_usb_int();
      000919 12 08 00         [24] 2375 	lcall	_setup_usb_int
                                   2376 ;	sunkbd_hid.c:1326: setup_ser_int();
      00091C 12 08 50         [24] 2377 	lcall	_setup_ser_int
                                   2378 ;	sunkbd_hid.c:1328: setup_keyboard();
      00091F 12 08 88         [24] 2379 	lcall	_setup_keyboard
                                   2380 ;	sunkbd_hid.c:1333: setup_timer2_int();
      000922 12 08 C7         [24] 2381 	lcall	_setup_timer2_int
                                   2382 ;	sunkbd_hid.c:1336: USBCS |= 0x02;     /* activate RENUM                     */
      000925 90 7F D6         [24] 2383 	mov	dptr,#_USBCS
      000928 E0               [24] 2384 	movx	a,@dptr
      000929 FF               [12] 2385 	mov	r7,a
      00092A 74 02            [12] 2386 	mov	a,#0x02
      00092C 4F               [12] 2387 	orl	a,r7
      00092D F0               [24] 2388 	movx	@dptr,a
                                   2389 ;	sunkbd_hid.c:1337: USBCS &= ~0x08;    /* deactivate DISCON                  */
      00092E E0               [24] 2390 	movx	a,@dptr
      00092F FF               [12] 2391 	mov	r7,a
      000930 74 F7            [12] 2392 	mov	a,#0xf7
      000932 5F               [12] 2393 	anl	a,r7
      000933 F0               [24] 2394 	movx	@dptr,a
                                   2395 ;	sunkbd_hid.c:1338: USBCS |= 0x04;     /* release tristate on Disconnect pin */
      000934 E0               [24] 2396 	movx	a,@dptr
      000935 FF               [12] 2397 	mov	r7,a
      000936 74 04            [12] 2398 	mov	a,#0x04
      000938 4F               [12] 2399 	orl	a,r7
      000939 F0               [24] 2400 	movx	@dptr,a
                                   2401 ;	sunkbd_hid.c:1341: while (TRUE) ;
      00093A                       2402 00105$:
      00093A 80 FE            [24] 2403 	sjmp	00105$
                                   2404 	.area CSEG    (CODE)
                                   2405 	.area CONST   (CODE)
      00093C                       2406 _dev_desc:
      00093C 12                    2407 	.db #0x12	; 18
      00093D 01                    2408 	.db #0x01	; 1
      00093E 00                    2409 	.db #0x00	; 0
      00093F 01                    2410 	.db #0x01	; 1
      000940 00                    2411 	.db #0x00	; 0
      000941 00                    2412 	.db #0x00	; 0
      000942 00                    2413 	.db #0x00	; 0
      000943 40                    2414 	.db #0x40	; 64
      000944 CD                    2415 	.db #0xcd	; 205
      000945 06                    2416 	.db #0x06	; 6
      000946 01                    2417 	.db #0x01	; 1
      000947 C0                    2418 	.db #0xc0	; 192
      000948 55                    2419 	.db #0x55	; 85	'U'
      000949 01                    2420 	.db #0x01	; 1
      00094A 01                    2421 	.db #0x01	; 1
      00094B 02                    2422 	.db #0x02	; 2
      00094C 00                    2423 	.db #0x00	; 0
      00094D 01                    2424 	.db #0x01	; 1
      00094E                       2425 _conf_desc:
      00094E 09                    2426 	.db #0x09	; 9
      00094F 02                    2427 	.db #0x02	; 2
      000950 22                    2428 	.db #0x22	; 34
      000951 00                    2429 	.db #0x00	; 0
      000952 01                    2430 	.db #0x01	; 1
      000953 01                    2431 	.db #0x01	; 1
      000954 00                    2432 	.db #0x00	; 0
      000955 80                    2433 	.db #0x80	; 128
      000956 64                    2434 	.db #0x64	; 100	'd'
      000957 09                    2435 	.db #0x09	; 9
      000958 04                    2436 	.db #0x04	; 4
      000959 00                    2437 	.db #0x00	; 0
      00095A 00                    2438 	.db #0x00	; 0
      00095B 01                    2439 	.db #0x01	; 1
      00095C 03                    2440 	.db #0x03	; 3
      00095D 01                    2441 	.db #0x01	; 1
      00095E 01                    2442 	.db #0x01	; 1
      00095F 03                    2443 	.db #0x03	; 3
      000960 09                    2444 	.db #0x09	; 9
      000961 21                    2445 	.db #0x21	; 33
      000962 00                    2446 	.db #0x00	; 0
      000963 01                    2447 	.db #0x01	; 1
      000964 21                    2448 	.db #0x21	; 33
      000965 01                    2449 	.db #0x01	; 1
      000966 22                    2450 	.db #0x22	; 34
      000967 3F                    2451 	.db #0x3f	; 63
      000968 00                    2452 	.db #0x00	; 0
      000969 07                    2453 	.db #0x07	; 7
      00096A 05                    2454 	.db #0x05	; 5
      00096B 81                    2455 	.db #0x81	; 129
      00096C 03                    2456 	.db #0x03	; 3
      00096D 08                    2457 	.db #0x08	; 8
      00096E 00                    2458 	.db #0x00	; 0
      00096F 0A                    2459 	.db #0x0a	; 10
      000970                       2460 _report_desc_keyboard:
      000970 05                    2461 	.db #0x05	; 5
      000971 01                    2462 	.db #0x01	; 1
      000972 09                    2463 	.db #0x09	; 9
      000973 06                    2464 	.db #0x06	; 6
      000974 A1                    2465 	.db #0xa1	; 161
      000975 01                    2466 	.db #0x01	; 1
      000976 05                    2467 	.db #0x05	; 5
      000977 07                    2468 	.db #0x07	; 7
      000978 19                    2469 	.db #0x19	; 25
      000979 E0                    2470 	.db #0xe0	; 224
      00097A 29                    2471 	.db #0x29	; 41
      00097B E7                    2472 	.db #0xe7	; 231
      00097C 15                    2473 	.db #0x15	; 21
      00097D 00                    2474 	.db #0x00	; 0
      00097E 25                    2475 	.db #0x25	; 37
      00097F 01                    2476 	.db #0x01	; 1
      000980 75                    2477 	.db #0x75	; 117	'u'
      000981 01                    2478 	.db #0x01	; 1
      000982 95                    2479 	.db #0x95	; 149
      000983 08                    2480 	.db #0x08	; 8
      000984 81                    2481 	.db #0x81	; 129
      000985 02                    2482 	.db #0x02	; 2
      000986 95                    2483 	.db #0x95	; 149
      000987 01                    2484 	.db #0x01	; 1
      000988 75                    2485 	.db #0x75	; 117	'u'
      000989 08                    2486 	.db #0x08	; 8
      00098A 81                    2487 	.db #0x81	; 129
      00098B 01                    2488 	.db #0x01	; 1
      00098C 95                    2489 	.db #0x95	; 149
      00098D 05                    2490 	.db #0x05	; 5
      00098E 75                    2491 	.db #0x75	; 117	'u'
      00098F 01                    2492 	.db #0x01	; 1
      000990 05                    2493 	.db #0x05	; 5
      000991 08                    2494 	.db #0x08	; 8
      000992 19                    2495 	.db #0x19	; 25
      000993 01                    2496 	.db #0x01	; 1
      000994 29                    2497 	.db #0x29	; 41
      000995 05                    2498 	.db #0x05	; 5
      000996 91                    2499 	.db #0x91	; 145
      000997 02                    2500 	.db #0x02	; 2
      000998 95                    2501 	.db #0x95	; 149
      000999 01                    2502 	.db #0x01	; 1
      00099A 75                    2503 	.db #0x75	; 117	'u'
      00099B 03                    2504 	.db #0x03	; 3
      00099C 91                    2505 	.db #0x91	; 145
      00099D 01                    2506 	.db #0x01	; 1
      00099E 95                    2507 	.db #0x95	; 149
      00099F 06                    2508 	.db #0x06	; 6
      0009A0 75                    2509 	.db #0x75	; 117	'u'
      0009A1 08                    2510 	.db #0x08	; 8
      0009A2 15                    2511 	.db #0x15	; 21
      0009A3 00                    2512 	.db #0x00	; 0
      0009A4 25                    2513 	.db #0x25	; 37
      0009A5 65                    2514 	.db #0x65	; 101	'e'
      0009A6 05                    2515 	.db #0x05	; 5
      0009A7 07                    2516 	.db #0x07	; 7
      0009A8 19                    2517 	.db #0x19	; 25
      0009A9 00                    2518 	.db #0x00	; 0
      0009AA 29                    2519 	.db #0x29	; 41
      0009AB 65                    2520 	.db #0x65	; 101	'e'
      0009AC 81                    2521 	.db #0x81	; 129
      0009AD 00                    2522 	.db #0x00	; 0
      0009AE C0                    2523 	.db #0xc0	; 192
      0009AF                       2524 _string_langid:
      0009AF 04                    2525 	.db #0x04	; 4
      0009B0 03                    2526 	.db #0x03	; 3
      0009B1 00                    2527 	.db #0x00	; 0
      0009B2 00                    2528 	.db #0x00	; 0
      0009B3                       2529 _string_mfg:
      0009B3 22                    2530 	.db #0x22	; 34
      0009B4 03                    2531 	.db #0x03	; 3
      0009B5 41                    2532 	.db #0x41	; 65	'A'
      0009B6 00                    2533 	.db #0x00	; 0
      0009B7 43                    2534 	.db #0x43	; 67	'C'
      0009B8 00                    2535 	.db #0x00	; 0
      0009B9 4D                    2536 	.db #0x4d	; 77	'M'
      0009BA 00                    2537 	.db #0x00	; 0
      0009BB 45                    2538 	.db #0x45	; 69	'E'
      0009BC 00                    2539 	.db #0x00	; 0
      0009BD 20                    2540 	.db #0x20	; 32
      0009BE 00                    2541 	.db #0x00	; 0
      0009BF 75                    2542 	.db #0x75	; 117	'u'
      0009C0 00                    2543 	.db #0x00	; 0
      0009C1 73                    2544 	.db #0x73	; 115	's'
      0009C2 00                    2545 	.db #0x00	; 0
      0009C3 62                    2546 	.db #0x62	; 98	'b'
      0009C4 00                    2547 	.db #0x00	; 0
      0009C5 20                    2548 	.db #0x20	; 32
      0009C6 00                    2549 	.db #0x00	; 0
      0009C7 57                    2550 	.db #0x57	; 87	'W'
      0009C8 00                    2551 	.db #0x00	; 0
      0009C9 69                    2552 	.db #0x69	; 105	'i'
      0009CA 00                    2553 	.db #0x00	; 0
      0009CB 64                    2554 	.db #0x64	; 100	'd'
      0009CC 00                    2555 	.db #0x00	; 0
      0009CD 67                    2556 	.db #0x67	; 103	'g'
      0009CE 00                    2557 	.db #0x00	; 0
      0009CF 65                    2558 	.db #0x65	; 101	'e'
      0009D0 00                    2559 	.db #0x00	; 0
      0009D1 74                    2560 	.db #0x74	; 116	't'
      0009D2 00                    2561 	.db #0x00	; 0
      0009D3 73                    2562 	.db #0x73	; 115	's'
      0009D4 00                    2563 	.db #0x00	; 0
      0009D5                       2564 _string_prod:
      0009D5 22                    2565 	.db #0x22	; 34
      0009D6 03                    2566 	.db #0x03	; 3
      0009D7 53                    2567 	.db #0x53	; 83	'S'
      0009D8 00                    2568 	.db #0x00	; 0
      0009D9 75                    2569 	.db #0x75	; 117	'u'
      0009DA 00                    2570 	.db #0x00	; 0
      0009DB 6E                    2571 	.db #0x6e	; 110	'n'
      0009DC 00                    2572 	.db #0x00	; 0
      0009DD 20                    2573 	.db #0x20	; 32
      0009DE 00                    2574 	.db #0x00	; 0
      0009DF 6B                    2575 	.db #0x6b	; 107	'k'
      0009E0 00                    2576 	.db #0x00	; 0
      0009E1 65                    2577 	.db #0x65	; 101	'e'
      0009E2 00                    2578 	.db #0x00	; 0
      0009E3 79                    2579 	.db #0x79	; 121	'y'
      0009E4 00                    2580 	.db #0x00	; 0
      0009E5 62                    2581 	.db #0x62	; 98	'b'
      0009E6 00                    2582 	.db #0x00	; 0
      0009E7 6F                    2583 	.db #0x6f	; 111	'o'
      0009E8 00                    2584 	.db #0x00	; 0
      0009E9 61                    2585 	.db #0x61	; 97	'a'
      0009EA 00                    2586 	.db #0x00	; 0
      0009EB 72                    2587 	.db #0x72	; 114	'r'
      0009EC 00                    2588 	.db #0x00	; 0
      0009ED 64                    2589 	.db #0x64	; 100	'd'
      0009EE 00                    2590 	.db #0x00	; 0
      0009EF 20                    2591 	.db #0x20	; 32
      0009F0 00                    2592 	.db #0x00	; 0
      0009F1 48                    2593 	.db #0x48	; 72	'H'
      0009F2 00                    2594 	.db #0x00	; 0
      0009F3 49                    2595 	.db #0x49	; 73	'I'
      0009F4 00                    2596 	.db #0x00	; 0
      0009F5 44                    2597 	.db #0x44	; 68	'D'
      0009F6 00                    2598 	.db #0x00	; 0
      0009F7                       2599 _string_if_keyboard:
      0009F7 86                    2600 	.db #0x86	; 134
      0009F8 03                    2601 	.db #0x03	; 3
      0009F9 53                    2602 	.db #0x53	; 83	'S'
      0009FA 00                    2603 	.db #0x00	; 0
      0009FB 75                    2604 	.db #0x75	; 117	'u'
      0009FC 00                    2605 	.db #0x00	; 0
      0009FD 6E                    2606 	.db #0x6e	; 110	'n'
      0009FE 00                    2607 	.db #0x00	; 0
      0009FF 20                    2608 	.db #0x20	; 32
      000A00 00                    2609 	.db #0x00	; 0
      000A01 4B                    2610 	.db #0x4b	; 75	'K'
      000A02 00                    2611 	.db #0x00	; 0
      000A03 65                    2612 	.db #0x65	; 101	'e'
      000A04 00                    2613 	.db #0x00	; 0
      000A05 79                    2614 	.db #0x79	; 121	'y'
      000A06 00                    2615 	.db #0x00	; 0
      000A07 62                    2616 	.db #0x62	; 98	'b'
      000A08 00                    2617 	.db #0x00	; 0
      000A09 6F                    2618 	.db #0x6f	; 111	'o'
      000A0A 00                    2619 	.db #0x00	; 0
      000A0B 61                    2620 	.db #0x61	; 97	'a'
      000A0C 00                    2621 	.db #0x00	; 0
      000A0D 72                    2622 	.db #0x72	; 114	'r'
      000A0E 00                    2623 	.db #0x00	; 0
      000A0F 64                    2624 	.db #0x64	; 100	'd'
      000A10 00                    2625 	.db #0x00	; 0
      000A11 20                    2626 	.db #0x20	; 32
      000A12 00                    2627 	.db #0x00	; 0
      000A13 48                    2628 	.db #0x48	; 72	'H'
      000A14 00                    2629 	.db #0x00	; 0
      000A15 49                    2630 	.db #0x49	; 73	'I'
      000A16 00                    2631 	.db #0x00	; 0
      000A17 44                    2632 	.db #0x44	; 68	'D'
      000A18 00                    2633 	.db #0x00	; 0
      000A19 20                    2634 	.db #0x20	; 32
      000A1A 00                    2635 	.db #0x00	; 0
      000A1B 44                    2636 	.db #0x44	; 68	'D'
      000A1C 00                    2637 	.db #0x00	; 0
      000A1D 72                    2638 	.db #0x72	; 114	'r'
      000A1E 00                    2639 	.db #0x00	; 0
      000A1F 69                    2640 	.db #0x69	; 105	'i'
      000A20 00                    2641 	.db #0x00	; 0
      000A21 76                    2642 	.db #0x76	; 118	'v'
      000A22 00                    2643 	.db #0x00	; 0
      000A23 65                    2644 	.db #0x65	; 101	'e'
      000A24 00                    2645 	.db #0x00	; 0
      000A25 72                    2646 	.db #0x72	; 114	'r'
      000A26 00                    2647 	.db #0x00	; 0
      000A27 2C                    2648 	.db #0x2c	; 44
      000A28 00                    2649 	.db #0x00	; 0
      000A29 20                    2650 	.db #0x20	; 32
      000A2A 00                    2651 	.db #0x00	; 0
      000A2B 46                    2652 	.db #0x46	; 70	'F'
      000A2C 00                    2653 	.db #0x00	; 0
      000A2D 69                    2654 	.db #0x69	; 105	'i'
      000A2E 00                    2655 	.db #0x00	; 0
      000A2F 72                    2656 	.db #0x72	; 114	'r'
      000A30 00                    2657 	.db #0x00	; 0
      000A31 6D                    2658 	.db #0x6d	; 109	'm'
      000A32 00                    2659 	.db #0x00	; 0
      000A33 77                    2660 	.db #0x77	; 119	'w'
      000A34 00                    2661 	.db #0x00	; 0
      000A35 61                    2662 	.db #0x61	; 97	'a'
      000A36 00                    2663 	.db #0x00	; 0
      000A37 72                    2664 	.db #0x72	; 114	'r'
      000A38 00                    2665 	.db #0x00	; 0
      000A39 65                    2666 	.db #0x65	; 101	'e'
      000A3A 00                    2667 	.db #0x00	; 0
      000A3B 20                    2668 	.db #0x20	; 32
      000A3C 00                    2669 	.db #0x00	; 0
      000A3D 43                    2670 	.db #0x43	; 67	'C'
      000A3E 00                    2671 	.db #0x00	; 0
      000A3F 6F                    2672 	.db #0x6f	; 111	'o'
      000A40 00                    2673 	.db #0x00	; 0
      000A41 70                    2674 	.db #0x70	; 112	'p'
      000A42 00                    2675 	.db #0x00	; 0
      000A43 79                    2676 	.db #0x79	; 121	'y'
      000A44 00                    2677 	.db #0x00	; 0
      000A45 72                    2678 	.db #0x72	; 114	'r'
      000A46 00                    2679 	.db #0x00	; 0
      000A47 69                    2680 	.db #0x69	; 105	'i'
      000A48 00                    2681 	.db #0x00	; 0
      000A49 67                    2682 	.db #0x67	; 103	'g'
      000A4A 00                    2683 	.db #0x00	; 0
      000A4B 68                    2684 	.db #0x68	; 104	'h'
      000A4C 00                    2685 	.db #0x00	; 0
      000A4D 74                    2686 	.db #0x74	; 116	't'
      000A4E 00                    2687 	.db #0x00	; 0
      000A4F 20                    2688 	.db #0x20	; 32
      000A50 00                    2689 	.db #0x00	; 0
      000A51 28                    2690 	.db #0x28	; 40
      000A52 00                    2691 	.db #0x00	; 0
      000A53 63                    2692 	.db #0x63	; 99	'c'
      000A54 00                    2693 	.db #0x00	; 0
      000A55 29                    2694 	.db #0x29	; 41
      000A56 00                    2695 	.db #0x00	; 0
      000A57 20                    2696 	.db #0x20	; 32
      000A58 00                    2697 	.db #0x00	; 0
      000A59 32                    2698 	.db #0x32	; 50	'2'
      000A5A 00                    2699 	.db #0x00	; 0
      000A5B 30                    2700 	.db #0x30	; 48	'0'
      000A5C 00                    2701 	.db #0x00	; 0
      000A5D 30                    2702 	.db #0x30	; 48	'0'
      000A5E 00                    2703 	.db #0x00	; 0
      000A5F 32                    2704 	.db #0x32	; 50	'2'
      000A60 00                    2705 	.db #0x00	; 0
      000A61 20                    2706 	.db #0x20	; 32
      000A62 00                    2707 	.db #0x00	; 0
      000A63 41                    2708 	.db #0x41	; 65	'A'
      000A64 00                    2709 	.db #0x00	; 0
      000A65 72                    2710 	.db #0x72	; 114	'r'
      000A66 00                    2711 	.db #0x00	; 0
      000A67 6E                    2712 	.db #0x6e	; 110	'n'
      000A68 00                    2713 	.db #0x00	; 0
      000A69 69                    2714 	.db #0x69	; 105	'i'
      000A6A 00                    2715 	.db #0x00	; 0
      000A6B 6D                    2716 	.db #0x6d	; 109	'm'
      000A6C 00                    2717 	.db #0x00	; 0
      000A6D 20                    2718 	.db #0x20	; 32
      000A6E 00                    2719 	.db #0x00	; 0
      000A6F 4C                    2720 	.db #0x4c	; 76	'L'
      000A70 00                    2721 	.db #0x00	; 0
      000A71 61                    2722 	.db #0x61	; 97	'a'
      000A72 00                    2723 	.db #0x00	; 0
      000A73 65                    2724 	.db #0x65	; 101	'e'
      000A74 00                    2725 	.db #0x00	; 0
      000A75 75                    2726 	.db #0x75	; 117	'u'
      000A76 00                    2727 	.db #0x00	; 0
      000A77 67                    2728 	.db #0x67	; 103	'g'
      000A78 00                    2729 	.db #0x00	; 0
      000A79 65                    2730 	.db #0x65	; 101	'e'
      000A7A 00                    2731 	.db #0x00	; 0
      000A7B 72                    2732 	.db #0x72	; 114	'r'
      000A7C 00                    2733 	.db #0x00	; 0
      000A7D                       2734 _scancode_map:
      000A7D 00                    2735 	.db #0x00	; 0
      000A7E 78                    2736 	.db #0x78	; 120	'x'
      000A7F 81                    2737 	.db #0x81	; 129
      000A80 79                    2738 	.db #0x79	; 121	'y'
      000A81 80                    2739 	.db #0x80	; 128
      000A82 3A                    2740 	.db #0x3a	; 58
      000A83 3B                    2741 	.db #0x3b	; 59
      000A84 43                    2742 	.db #0x43	; 67	'C'
      000A85 3C                    2743 	.db #0x3c	; 60
      000A86 44                    2744 	.db #0x44	; 68	'D'
      000A87 3D                    2745 	.db #0x3d	; 61
      000A88 45                    2746 	.db #0x45	; 69	'E'
      000A89 3E                    2747 	.db #0x3e	; 62
      000A8A E4                    2748 	.db #0xe4	; 228
      000A8B 3F                    2749 	.db #0x3f	; 63
      000A8C 00                    2750 	.db #0x00	; 0
      000A8D 40                    2751 	.db #0x40	; 64
      000A8E 41                    2752 	.db #0x41	; 65	'A'
      000A8F 42                    2753 	.db #0x42	; 66	'B'
      000A90 E2                    2754 	.db #0xe2	; 226
      000A91 52                    2755 	.db #0x52	; 82	'R'
      000A92 48                    2756 	.db #0x48	; 72	'H'
      000A93 46                    2757 	.db #0x46	; 70	'F'
      000A94 47                    2758 	.db #0x47	; 71	'G'
      000A95 50                    2759 	.db #0x50	; 80	'P'
      000A96 74                    2760 	.db #0x74	; 116	't'
      000A97 7A                    2761 	.db #0x7a	; 122	'z'
      000A98 51                    2762 	.db #0x51	; 81	'Q'
      000A99 4F                    2763 	.db #0x4f	; 79	'O'
      000A9A 29                    2764 	.db #0x29	; 41
      000A9B 1E                    2765 	.db #0x1e	; 30
      000A9C 1F                    2766 	.db #0x1f	; 31
      000A9D 20                    2767 	.db #0x20	; 32
      000A9E 21                    2768 	.db #0x21	; 33
      000A9F 22                    2769 	.db #0x22	; 34
      000AA0 23                    2770 	.db #0x23	; 35
      000AA1 24                    2771 	.db #0x24	; 36
      000AA2 25                    2772 	.db #0x25	; 37
      000AA3 26                    2773 	.db #0x26	; 38
      000AA4 27                    2774 	.db #0x27	; 39
      000AA5 2D                    2775 	.db #0x2d	; 45
      000AA6 2E                    2776 	.db #0x2e	; 46
      000AA7 35                    2777 	.db #0x35	; 53	'5'
      000AA8 2A                    2778 	.db #0x2a	; 42
      000AA9 49                    2779 	.db #0x49	; 73	'I'
      000AAA 00                    2780 	.db #0x00	; 0
      000AAB 54                    2781 	.db #0x54	; 84	'T'
      000AAC 55                    2782 	.db #0x55	; 85	'U'
      000AAD 00                    2783 	.db #0x00	; 0
      000AAE 00                    2784 	.db #0x00	; 0
      000AAF 63                    2785 	.db #0x63	; 99	'c'
      000AB0 7C                    2786 	.db #0x7c	; 124
      000AB1 4A                    2787 	.db #0x4a	; 74	'J'
      000AB2 2B                    2788 	.db #0x2b	; 43
      000AB3 14                    2789 	.db #0x14	; 20
      000AB4 1A                    2790 	.db #0x1a	; 26
      000AB5 08                    2791 	.db #0x08	; 8
      000AB6 15                    2792 	.db #0x15	; 21
      000AB7 17                    2793 	.db #0x17	; 23
      000AB8 1C                    2794 	.db #0x1c	; 28
      000AB9 18                    2795 	.db #0x18	; 24
      000ABA 0C                    2796 	.db #0x0c	; 12
      000ABB 12                    2797 	.db #0x12	; 18
      000ABC 13                    2798 	.db #0x13	; 19
      000ABD 2F                    2799 	.db #0x2f	; 47
      000ABE 30                    2800 	.db #0x30	; 48	'0'
      000ABF 4C                    2801 	.db #0x4c	; 76	'L'
      000AC0 65                    2802 	.db #0x65	; 101	'e'
      000AC1 5F                    2803 	.db #0x5f	; 95
      000AC2 60                    2804 	.db #0x60	; 96
      000AC3 61                    2805 	.db #0x61	; 97	'a'
      000AC4 56                    2806 	.db #0x56	; 86	'V'
      000AC5 00                    2807 	.db #0x00	; 0
      000AC6 7D                    2808 	.db #0x7d	; 125
      000AC7 4D                    2809 	.db #0x4d	; 77	'M'
      000AC8 FF                    2810 	.db #0xff	; 255
      000AC9 E0                    2811 	.db #0xe0	; 224
      000ACA 04                    2812 	.db #0x04	; 4
      000ACB 16                    2813 	.db #0x16	; 22
      000ACC 07                    2814 	.db #0x07	; 7
      000ACD 09                    2815 	.db #0x09	; 9
      000ACE 0A                    2816 	.db #0x0a	; 10
      000ACF 0B                    2817 	.db #0x0b	; 11
      000AD0 0D                    2818 	.db #0x0d	; 13
      000AD1 0E                    2819 	.db #0x0e	; 14
      000AD2 0F                    2820 	.db #0x0f	; 15
      000AD3 33                    2821 	.db #0x33	; 51	'3'
      000AD4 34                    2822 	.db #0x34	; 52	'4'
      000AD5 31                    2823 	.db #0x31	; 49	'1'
      000AD6 28                    2824 	.db #0x28	; 40
      000AD7 58                    2825 	.db #0x58	; 88	'X'
      000AD8 5C                    2826 	.db #0x5c	; 92
      000AD9 5D                    2827 	.db #0x5d	; 93
      000ADA 5E                    2828 	.db #0x5e	; 94
      000ADB 62                    2829 	.db #0x62	; 98	'b'
      000ADC 7E                    2830 	.db #0x7e	; 126
      000ADD 4B                    2831 	.db #0x4b	; 75	'K'
      000ADE 7B                    2832 	.db #0x7b	; 123
      000ADF 53                    2833 	.db #0x53	; 83	'S'
      000AE0 E1                    2834 	.db #0xe1	; 225
      000AE1 1D                    2835 	.db #0x1d	; 29
      000AE2 1B                    2836 	.db #0x1b	; 27
      000AE3 06                    2837 	.db #0x06	; 6
      000AE4 19                    2838 	.db #0x19	; 25
      000AE5 05                    2839 	.db #0x05	; 5
      000AE6 11                    2840 	.db #0x11	; 17
      000AE7 10                    2841 	.db #0x10	; 16
      000AE8 36                    2842 	.db #0x36	; 54	'6'
      000AE9 37                    2843 	.db #0x37	; 55	'7'
      000AEA 38                    2844 	.db #0x38	; 56	'8'
      000AEB E5                    2845 	.db #0xe5	; 229
      000AEC 00                    2846 	.db #0x00	; 0
      000AED 59                    2847 	.db #0x59	; 89	'Y'
      000AEE 5A                    2848 	.db #0x5a	; 90	'Z'
      000AEF 5B                    2849 	.db #0x5b	; 91
      000AF0 FF                    2850 	.db #0xff	; 255
      000AF1 FF                    2851 	.db #0xff	; 255
      000AF2 FF                    2852 	.db #0xff	; 255
      000AF3 75                    2853 	.db #0x75	; 117	'u'
      000AF4 39                    2854 	.db #0x39	; 57	'9'
      000AF5 E3                    2855 	.db #0xe3	; 227
      000AF6 2C                    2856 	.db #0x2c	; 44
      000AF7 E7                    2857 	.db #0xe7	; 231
      000AF8 4E                    2858 	.db #0x4e	; 78	'N'
      000AF9 FF                    2859 	.db #0xff	; 255
      000AFA 57                    2860 	.db #0x57	; 87	'W'
      000AFB 00                    2861 	.db #0x00	; 0
      000AFC 00                    2862 	.db #0x00	; 0
                                   2863 	.area XINIT   (CODE)
                                   2864 	.area CABS    (ABS,CODE)
