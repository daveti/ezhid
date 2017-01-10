
CFLAGS = -I.. -I../../../include

.PHONY: all
all: amikbd.ihx


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


sdcc/amikbd.rel: amikbd.c amikbd.h all_ext.h globals.h ../../include/dtypes.h ../../include/ezusb_reg.h sdcc
	cd sdcc; \
	cp -p ../amikbd.c .; \
	sdcc $(CFLAGS) -c amikbd.c


amikbd.ihx: sdcc/amikbd.rel sdcc/usb_core.rel sdcc/initializer.rel sdcc
	cd sdcc; \
	sdcc amikbd.rel usb_core.rel initializer.rel; \
	packihx < amikbd.ihx > ../amikbd.ihx; \
	cd ..


.PHONY: clean
clean:
	rm -f *~ *.o *_fw.h *.ihx
	rm -rf sdcc
