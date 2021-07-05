
.PHONY: all clean dump

all:
	make -C src all
	cp src/blink.bin .

clean:
	make -C src clean
	rm -f blink.bin

dump:
	make -C src dump
