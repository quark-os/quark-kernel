#ifndef _PHYS_MALLOC
#define _PHYS_MALLOC

#include <stdint.h>

void pmallocInit(uint32_t memSize);

void* pmalloc();

void* pfree(void* page);

#endif
