.intel_syntax noprefix
.global _picinit

_picinit:
	mov al, 0x11
	out 0x20, al
	out 0xA0, al
	
	mov al, 0x20
	out 0x21, al
	mov al, 0x28
	out 0xA1, al
	
	mov al, 4
	out 0x21, al
	mov al, 2
	out 0xA1, al
	
	mov al, 1
	out 0x21, al
	out 0xA1, al
	
	mov al, 0
	out 0x21, al
	out 0x21, al
	
	sti
	
	ret
