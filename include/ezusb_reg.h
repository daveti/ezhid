
/*
 *
 * $Id: ezusb_reg.h,v 1.6 2004/01/27 20:23:26 arniml Exp $
 *
 * Change History:
 *
 * $Log: ezusb_reg.h,v $
 * Revision 1.6  2004/01/27 20:23:26  arniml
 * add ISOCTL
 *
 * Revision 1.5  2004/01/26 18:36:24  arniml
 * add new SFRs (triggered by n64pad)
 *
 * Revision 1.4  2003/12/23 22:44:21  arniml
 * update with additional SFR etc.
 *
 * Revision 1.3  2002/03/03 23:35:32  arniml
 * add TOGCTL
 *
 * Revision 1.2  2001/08/15 18:24:03  arniml
 * added some register definitions for serial port 1 and IN2 endpoint
 *
 * Revision 1.1.1.1  2001/07/14 15:32:37  arniml
 * initial import
 *
 *
 */

#ifndef __EZUSB_REG_H__
#define __EZUSB_REG_H__


__sbit  __at 0xe8 EUSB;
__sbit  __at 0xac ES0;
__sbit  __at 0xae ES1;
__sbit  __at 0x98 RI_0;
__sbit  __at 0x99 TI_0;
__sbit  __at 0xc0 RI_1;
__sbit  __at 0xc1 TI_1;
__sbit  __at 0xca TR2;
__sbit  __at 0xcf TF2;
__sbit  __at 0xad ET2;
__sbit  __at 0xdf SMOD1;

__sfr   __at 0x86 DPS;
__sfr   __at 0x91 EXIF;
__sfr   __at 0x92 MPAGE;
__sfr   __at 0xe8 EIE;
__sfr   __at 0x98 SCON0;
__sfr   __at 0xc0 SCON1;
__sfr   __at 0x99 SBUF0;
__sfr   __at 0xc1 SBUF1;
__sfr   __at 0x8e CKCON;
__sfr   __at 0xc8 T2CON;
__sfr   __at 0xca RCAP2L;
__sfr   __at 0xcb RCAP2H;
__sfr   __at 0xcc TL2;
__sfr   __at 0xcd TH2;
__sfr   __at 0xd8 EICON;
__sfr   __at 0x82 DPL0;
__sfr   __at 0x83 DPH0;
__sfr   __at 0x84 DPL1;
__sfr   __at 0x85 DPH1;


__xdata __at 0x7fb4 unsigned char EP0CS;
__xdata __at 0x7f00 unsigned char IN0BUF;
__xdata __at 0x7fb5 unsigned char IN0BC;
__xdata __at 0x7ec0 unsigned char OUT0BUF;
__xdata __at 0x7fc5 unsigned char OUT0BC;

__xdata __at 0x7fb6 unsigned char IN1CS;
__xdata __at 0x7e80 unsigned char IN1BUF;
__xdata __at 0x7fb7 unsigned char IN1BC;
__xdata __at 0x7e40 unsigned char OUT1BUF;
__xdata __at 0x7fc6 unsigned char OUT1CS;
__xdata __at 0x7fc7 unsigned char OUT1BC;

__xdata __at 0x7e00 unsigned char IN2BUF;
__xdata __at 0x7fb9 unsigned char IN2BC;
__xdata __at 0x7fb8 unsigned char IN2CS;
__xdata __at 0x7fc9 unsigned char OUT2BC;
__xdata __at 0x7fc8 unsigned char OUT2CS;
__xdata __at 0x7dc0 unsigned char OUT2BUF;

__xdata __at 0x7d80 unsigned char IN3BUF;
__xdata __at 0x7d40 unsigned char OUT3BUF;
__xdata __at 0x7fba unsigned char IN3CS;
__xdata __at 0x7fbb unsigned char IN3BC;
__xdata __at 0x7fca unsigned char OUT3CS;
__xdata __at 0x7fcb unsigned char OUT3BC;

__xdata __at 0x7d00 unsigned char IN4BUF;
__xdata __at 0x7cc0 unsigned char OUT4BUF;
__xdata __at 0x7fbc unsigned char IN4CS;
__xdata __at 0x7fcc unsigned char OUT4CS;
__xdata __at 0x7fbd unsigned char IN4BC;
__xdata __at 0x7fcd unsigned char OUT4BC;

__xdata __at 0x7f9c unsigned char OEA;
__xdata __at 0x7f96 unsigned char OUTA;
__xdata __at 0x7f99 unsigned char PINSA;
__xdata __at 0x7f9d unsigned char OEB;
__xdata __at 0x7f97 unsigned char OUTB;
__xdata __at 0x7f9a unsigned char PINSB;
__xdata __at 0x7f9e unsigned char OEC;
__xdata __at 0x7f98 unsigned char OUTC;
__xdata __at 0x7f9b unsigned char PINSC;
__xdata __at 0x7f93 unsigned char PORTACFG;
__xdata __at 0x7f94 unsigned char PORTBCFG;
__xdata __at 0x7f95 unsigned char PORTCCFG;

__xdata __at 0x7fa1 unsigned char ISOCTL;

__xdata __at 0x7fa9 unsigned char IN07IRQ;
__xdata __at 0x7faa unsigned char OUT07IRQ;
__xdata __at 0x7fac unsigned char IN07IEN;
__xdata __at 0x7fad unsigned char OUT07IEN;
__xdata __at 0x7fab unsigned char USBIRQ;
__xdata __at 0x7fae unsigned char USBIEN;

__xdata __at 0x7fdd unsigned char USBPAIR;
__xdata __at 0x7faf unsigned char USBBAV;
__xdata __at 0x7fd6 unsigned char USBCS;
__xdata __at 0x7fd7 unsigned char TOGCTL;
__xdata __at 0x7fd4 unsigned char SUDPTRH;
__xdata __at 0x7fd5 unsigned char SUDPTRL;
__xdata __at 0x7fe8 unsigned char SETUPDAT;
__xdata __at 0x7fa5 unsigned char I2CS;
__xdata __at 0x7fa6 unsigned char I2DAT;
__xdata __at 0x7fde unsigned char IN07VAL;
__xdata __at 0x7fdf unsigned char OUT07VAL;
__xdata __at 0x7fe2 unsigned char FASTXFR;
__xdata __at 0x7fe3 unsigned char AUTOPTRH;
__xdata __at 0x7fe4 unsigned char AUTOPTRL;
__xdata __at 0x7fe5 unsigned char AUTODATA;


#endif /* __EZUSB_REG_H__ */
