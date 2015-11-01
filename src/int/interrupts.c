#include <stdint.h>
#include "int/interrupts.h"

uint64_t* idt;

uint64_t encodeInterrupt(uint32_t offset);

void loadIDT(uint16_t, void*);

extern void _picinit();

extern void _genericISR();

extern void _int_preempt();

extern void _syscall();

void setupInterrupts()
{
	idt = 0;
	for(uint32_t i= 0; i < 256; i++)
	{
		writeInterrupt(i, encodeInterrupt((uint32_t) _genericISR));
	}
	writeInterrupt(0x80, encodeInterrupt((uint32_t) _syscall));
	writeInterrupt(0x20, encodeInterrupt((uint32_t) _int_preempt));
	loadIDT(0x1000, idt);
	_picinit();
}

void writeInterrupt(uint32_t index, uint64_t value)
{
	idt[index] = value;
}

uint64_t encodeInterrupt(uint32_t offset)
{
	uint64_t offsetLo = offset;
	uint64_t offsetHi = offset >> 16;
	uint64_t selector = 8;
	uint64_t type = 0x8E;
	uint64_t interrupt = 0;
	return offsetLo + (selector << 16) + (type << 40) + (offsetHi << 48);
}
