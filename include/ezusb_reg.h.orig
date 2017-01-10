
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


sbit  at 0xe8 EUSB;
sbit  at 0xac ES0;
sbit  at 0xae ES1;
sbit  at 0x98 RI_0;
sbit  at 0x99 TI_0;
sbit  at 0xc0 RI_1;
sbit  at 0xc1 TI_1;
sbit  at 0xca TR2;
sbit  at 0xcf TF2;
sbit  at 0xad ET2;
sbit  at 0xdf SMOD1;

sfr   at 0x86 DPS;
sfr   at 0x91 EXIF;
sfr   at 0x92 MPAGE;
sfr   at 0xe8 EIE;
sfr   at 0x98 SCON0;
sfr   at 0xc0 SCON1;
sfr   at 0x99 SBUF0;
sfr   at 0xc1 SBUF1;
sfr   at 0x8e CKCON;
sfr   at 0xc8 T2CON;
sfr   at 0xca RCAP2L;
sfr   at 0xcb RCAP2H;
sfr   at 0xcc TL2;
sfr   at 0xcd TH2;
sfr   at 0xd8 EICON;
sfr   at 0x82 DPL0;
sfr   at 0x83 DPH0;
sfr   at 0x84 DPL1;
sfr   at 0x85 DPH1;


xdata at 0x7fb4 unsigned char EP0CS;
xdata at 0x7f00 unsigned char IN0BUF;
xdata at 0x7fb5 unsigned char IN0BC;
xdata at 0x7ec0 unsigned char OUT0BUF;
xdata at 0x7fc5 unsigned char OUT0BC;

xdata at 0x7fb6 unsigned char IN1CS;
xdata at 0x7e80 unsigned char IN1BUF;
xdata at 0x7fb7 unsigned char IN1BC;
xdata at 0x7e40 unsigned char OUT1BUF;
xdata at 0x7fc6 unsigned char OUT1CS;
xdata at 0x7fc7 unsigned char OUT1BC;

xdata at 0x7e00 unsigned char IN2BUF;
xdata at 0x7fb9 unsigned char IN2BC;
xdata at 0x7fb8 unsigned char IN2CS;
xdata at 0x7fc9 unsigned char OUT2BC;
xdata at 0x7fc8 unsigned char OUT2CS;
xdata at 0x7dc0 unsigned char OUT2BUF;

xdata at 0x7d80 unsigned char IN3BUF;
xdata at 0x7d40 unsigned char OUT3BUF;
xdata at 0x7fba unsigned char IN3CS;
xdata at 0x7fbb unsigned char IN3BC;
xdata at 0x7fca unsigned char OUT3CS;
xdata at 0x7fcb unsigned char OUT3BC;

xdata at 0x7d00 unsigned char IN4BUF;
xdata at 0x7cc0 unsigned char OUT4BUF;
xdata at 0x7fbc unsigned char IN4CS;
xdata at 0x7fcc unsigned char OUT4CS;
xdata at 0x7fbd unsigned char IN4BC;
xdata at 0x7fcd unsigned char OUT4BC;

xdata at 0x7f9c unsigned char OEA;
xdata at 0x7f96 unsigned char OUTA;
xdata at 0x7f99 unsigned char PINSA;
xdata at 0x7f9d unsigned char OEB;
xdata at 0x7f97 unsigned char OUTB;
xdata at 0x7f9a unsigned char PINSB;
xdata at 0x7f9e unsigned char OEC;
xdata at 0x7f98 unsigned char OUTC;
xdata at 0x7f9b unsigned char PINSC;
xdata at 0x7f93 unsigned char PORTACFG;
xdata at 0x7f94 unsigned char PORTBCFG;
xdata at 0x7f95 unsigned char PORTCCFG;

xdata at 0x7fa1 unsigned char ISOCTL;

xdata at 0x7fa9 unsigned char IN07IRQ;
xdata at 0x7faa unsigned char OUT07IRQ;
xdata at 0x7fac unsigned char IN07IEN;
xdata at 0x7fad unsigned char OUT07IEN;
xdata at 0x7fab unsigned char USBIRQ;
xdata at 0x7fae unsigned char USBIEN;

xdata at 0x7fdd unsigned char USBPAIR;
xdata at 0x7faf unsigned char USBBAV;
xdata at 0x7fd6 unsigned char USBCS;
xdata at 0x7fd7 unsigned char TOGCTL;
xdata at 0x7fd4 unsigned char SUDPTRH;
xdata at 0x7fd5 unsigned char SUDPTRL;
xdata at 0x7fe8 unsigned char SETUPDAT;
xdata at 0x7fa5 unsigned char I2CS;
xdata at 0x7fa6 unsigned char I2DAT;
xdata at 0x7fde unsigned char IN07VAL;
xdata at 0x7fdf unsigned char OUT07VAL;
xdata at 0x7fe2 unsigned char FASTXFR;
xdata at 0x7fe3 unsigned char AUTOPTRH;
xdata at 0x7fe4 unsigned char AUTOPTRL;
xdata at 0x7fe5 unsigned char AUTODATA;


#endif /* __EZUSB_REG_H__ */
