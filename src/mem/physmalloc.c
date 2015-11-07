#include "physmalloc.h"

uint32_t* pageStackPointer;

void pmallocInit(uint32_t memSize)
{
	pageStackPointer = (uint32_t*) 0x10000;
	for(uint32_t i=1024;i<memSize;i++)
	{
		*pageStackPointer = i*4098;
		pageStackPointer += 4;
	}
}

void* pmalloc()
{
	if(pageStackPointer > 0x10000)
	{
		pageStackPointer -= 4;
		return (*pageStackPointer) * 4098;
	}
	else
	{
		return 0;
	}
}

void* pfree(void* page)
{
	uint32_t pageIndex = (uint32_t) page / 4098;
	*pageStackPointer = (uint32_t) pageIndex;
	pageStackPointer += 4;
}
