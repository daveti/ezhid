
CFLAGS = -I.. -I../../../include
LFLAGS = --xram-loc 0x1000

.PHONY: all
all: i2c_firm.ihx


sdcc:
	mkdir sdcc

sdcc/i2c_eeprom.rel: i2c_eeprom.c i2c_eeprom.h sdcc
	cd sdcc; \
	cp -p ../i2c_eeprom.c .; \
	sdcc $(CFLAGS) -c i2c_eeprom.c

sdcc/i2c_firm.rel: i2c_firm.c i2c_eeprom.h sdcc
	cd sdcc; \
	cp -p ../i2c_firm.c .; \
	sdcc $(CFLAGS) -c i2c_firm.c

i2c_firm.ihx: Makefile sdcc/i2c_firm.rel sdcc/i2c_eeprom.rel i2c_eeprom.h sdcc
	cd sdcc; \
	sdcc $(CFLAGS) $(LFLAGS) i2c_firm.rel i2c_eeprom.rel; \
	cp -p i2c_firm.ihx ..


.PHONY: clean
clean:
	rm -f *~ *.o *.ihx
	rm -rf sdcc
