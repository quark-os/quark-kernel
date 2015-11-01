#include "int/interrupts.h"
 
void kernel_main() {
	setupInterrupts();
	
	while(1)
	{
		asm("hlt");
	}
}
