CC = i686-elf-gcc
CFLAGS = -Os -s -nostdlib -ffreestanding -T linker.ld -lgcc -I.
platform = i386
objects := quark.o \
	boot/entry.o \
	int/interrupts.o \
	int/lidt.o \
	int/inthandler.S \
	int/syscall.S

quark-i386: $(objects)
	$(CC) $(CFLAGS) -o quarkk $(objects)
	make quark-install
	make cleanobj

quark-install:
	cp quarkk /quark/charm-boot/quarkk
	mkiso /quark -o /quark/quark.iso

.PHONY : clean
clean:
	make cleanobj
	rm -f quarkk

.PHONY : cleanobj
cleanobj:
	rm -f *.o
	rm -f boot/*.o
	rm -f int/*.o
	
