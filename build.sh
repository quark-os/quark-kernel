pwd
CC="i686-elf-gcc"
CFLAGS="-Os -s -nostdlib -ffreestanding -T src/linker.ld -lgcc -Isrc/"

for file in src/*.c src/*/*.c src/*/*.S
	do $CC $CFLAGS -c $file
done

$CC $CFLAGS *.o -o bin/quarkk
