
FEATURES=-DKEYBOARD -DMOUSE

#
# If you intend to build a firmware that will be programmed into the onboard
# I2C EEPROM set ROM_FW to -DROM_FIRMWARE. Leave ROM_FW blank if the firmware
# will be downloaded via USB.
#
ROM_FW=
#ROM_FW=-DROM_FIRMWARE

# This makefile supports for sdcc v3.6.0
# and generates binary fw directly
# Jan 9, 2017
# daveti


sdcc:
	mkdir sdcc

.PHONY: kbd
kbd:
	make FEATURES=-DKEYBOARD sunkbd_hid.ihx

.PHONY: mouse
mouse:
	make FEATURES=-DMOUSE sunkbd_hid.ihx

.PHONY: kbdmouse
kbdmouse:
	make "FEATURES=-DKEYBOARD -DMOUSE" sunkbd_hid.ihx

sunkbd_hid.ihx: Makefile sunkbd_hid.c sunkbd_hid.h ../../include/ezusb_reg.h sdcc
	cd sdcc; \
	cp ../sunkbd_hid.c .; \
	cp ../sunkbd_hid.h .; \
	sdcc-sdcc -I.. -I../../../include ${FEATURES} ${ROM_FW} sunkbd_hid.c; \
	sdcc-packihx < sunkbd_hid.ihx > ../sunkbd_hid.ihx; \
	sdcc-sdcc sunkbd_hid.rel -o sunkbd_hid.hex; \
	sdcc-makebin -p sunkbd_hid.hex sunkbd_hid.fw

.PHONY: clean
clean:
	rm -f *~ *.o *_fw.h *.ihx
	rm -rf sdcc
