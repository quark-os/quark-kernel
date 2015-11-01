.intel_syntax noprefix
.global _int_preempt

_int_preempt:
	pusha
	incb [0xB8000]
	mov al, 0x20
	out 0x20, al
	popa
	iret
