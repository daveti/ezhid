
#
# If you intend to build a firmware that will be programmed into the onboard
# I2C EEPROM set ROM_FW to -DROM_FIRMWARE. Leave ROM_FW blank if the firmware
# will be downloaded via USB.
#
ROM_FW=
#ROM_FW=-DROM_FIRMWARE

CFLAGS = -I.. -I../../../include $(ROM_FW)

.PHONY: all
all: gcpad.ihx


sdcc:
	mkdir sdcc

sdcc/initializer.rel: initializer.asm sdcc
	cd sdcc; \
	cp -p ../initializer.asm .; \
	asx8051 -losg initializer.asm


sdcc/poll_gcpad.rel: poll_gcpad.asm sdcc
	cd sdcc; \
	cp -p ../poll_gcpad.asm .; \
	asx8051 -losg poll_gcpad.asm


sdcc/usb_core.rel: usb_core.c usb_core.h all_ext.h ../../include/dtypes.h ../../include/ezusb_reg.h sdcc
	cd sdcc; \
	cp -p ../usb_core.c .; \
	sdcc $(CFLAGS) -c usb_core.c


sdcc/gcpad.rel: gcpad.c gcpad.h pad_ports.h all_ext.h globals.h ../../include/dtypes.h ../../include/ezusb_reg.h sdcc
	cd sdcc; \
	cp -p ../gcpad.c .; \
	sdcc $(CFLAGS) -c gcpad.c


gcpad.ihx: sdcc/gcpad.rel sdcc/usb_core.rel sdcc/initializer.rel sdcc/poll_gcpad.rel sdcc
	cd sdcc; \
	sdcc gcpad.rel usb_core.rel initializer.rel poll_gcpad.rel; \
	packihx < gcpad.ihx > ../gcpad.ihx; \
	cd ..


.PHONY: clean
clean:
	rm -f *~ *.o *_fw.h *.ihx
	rm -rf sdcc
