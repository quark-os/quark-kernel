.intel_syntax noprefix
.global _genericISR

_genericISR:
	pusha
	movb [0xB8000], 'i'
	popa
	iret
