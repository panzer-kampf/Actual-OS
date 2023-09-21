.set numbah, 0x1badb002
.set flags, (1<<0 | 1<<1)
.set checksum, -(numbah + flags)

.section .multiboot
	.long numbah
	.long flags
	.long checksum


.section .text
.extern kernelmain
.global loader

loader:
	mov $kernel_stack, %esp
	push %eax
	push %ebx
	call kernelmain

_stop:
	cli
	hlt
	jmp _stop


.section .bss
.space 2*1024*1024 #2Mb
kernel_stack:


