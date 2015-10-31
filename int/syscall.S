.intel_syntax noprefix
.global _syscall

_syscall:
	pusha
	call [eax*4 + 0x100]
	popa
	iret
