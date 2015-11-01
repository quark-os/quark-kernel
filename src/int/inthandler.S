.intel_syntax noprefix
.global _genericISR

_genericISR:
	pusha
	movb [0xB8000], 'i'
	mov al, 0x20
	out 0x20, al
	popa
	iret
