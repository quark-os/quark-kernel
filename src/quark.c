#include "int/interrupts.h"
 
void kernel_main() {
	setupInterrupts();
	pmallocInit(2^16);
	
	while(1)
	{
		asm("hlt");
	}
}
