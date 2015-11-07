pwd
CC="i686-elf-gcc"
CFLAGS="-Os -s -nostdlib -ffreestanding -T src/linker.ld -lgcc -Isrc/"

for file in src/*/*.S src/*.c src/*/*.c 
	do $CC $CFLAGS -c $file
done

$CC $CFLAGS *.o -o bin/quarkk
