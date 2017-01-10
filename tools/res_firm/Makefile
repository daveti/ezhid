
CFLAGS = -I.. -I../../../include

.PHONY: all
all: res_firm.ihx


sdcc:
	mkdir sdcc

sdcc/res_firm.rel: res_firm.c sdcc
	cd sdcc; \
	cp -p ../res_firm.c .; \
	sdcc $(CFLAGS) -c res_firm.c

res_firm.ihx: Makefile sdcc/res_firm.rel sdcc
	cd sdcc; \
	sdcc $(CFLAGS) $(LFLAGS) res_firm.rel; \
	cp -p res_firm.ihx ..


.PHONY: clean
clean:
	rm -f *~ *.o *.ihx
	rm -rf sdcc
