
CFLAGS = -I.. -I../../../include

.PHONY: all
all: snespad.ihx


sdcc:
	mkdir sdcc

sdcc/initializer.rel: initializer.asm sdcc
	cd sdcc; \
	cp -p ../initializer.asm .; \
	asx8051 -losg initializer.asm


sdcc/usb_core.rel: usb_core.c usb_core.h all_ext.h ../../include/dtypes.h ../../include/ezusb_reg.h sdcc
	cd sdcc; \
	cp -p ../usb_core.c .; \
	sdcc $(CFLAGS) -c usb_core.c


sdcc/snespad.rel: snespad.c snespad.h pad_ports.h all_ext.h globals.h ../../include/dtypes.h ../../include/ezusb_reg.h sdcc
	cd sdcc; \
	cp -p ../snespad.c .; \
	sdcc $(CFLAGS) -c snespad.c


snespad.ihx: sdcc/snespad.rel sdcc/usb_core.rel sdcc/initializer.rel sdcc
	cd sdcc; \
	sdcc snespad.rel usb_core.rel initializer.rel; \
	packihx < snespad.ihx > ../snespad.ihx; \
	cd ..


.PHONY: clean
clean:
	rm -f *~ *.o *_fw.h *.ihx
	rm -rf sdcc
