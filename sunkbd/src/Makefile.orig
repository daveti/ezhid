
FEATURES=-DKEYBOARD -DMOUSE

#
# If you intend to build a firmware that will be programmed into the onboard
# I2C EEPROM set ROM_FW to -DROM_FIRMWARE. Leave ROM_FW blank if the firmware
# will be downloaded via USB.
#
ROM_FW=
#ROM_FW=-DROM_FIRMWARE


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
	sdcc -I.. -I../../../include ${FEATURES} ${ROM_FW} sunkbd_hid.c; \
	packihx < sunkbd_hid.ihx > ../sunkbd_hid.ihx

.PHONY: clean
clean:
	rm -f *~ *.o *_fw.h *.ihx
	rm -rf sdcc
