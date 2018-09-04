/*
    Multiboot2 header
*/
.section .multiboot
header_start:
    .align 8
    .long 0xe85250d6                                                   #multiboot magic
    .long 0x0                                                          #architecture
    .long header_start - header_end                                    #length
    .long -(0xe85250d6 + header_start - header_end)                    #checksum
    #end tag:
    .word 0x0
    .word 0x0
    .long 0x8
header_end:
    .byte 0x0
/*
    Loader section
*/
.section .text
.extern kernel_main
.global _start

_start:
    mov $stack, %esp
    #push %eax
    #push %ebx
    call kernel_main
    cli

_stop:
    hlt
    jmp _stop

.section .bss
.align 16
.space 16384
stack:
