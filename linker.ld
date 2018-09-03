ENTRY(_start)
OUTPUT_FORMAT(elf32-i386)
OUTPUT_ARCH(i386:i386)

SECTIONS 
{
    . = 0x00100000;

    .boot : 
    {
        *(.multiboot)
    }

    .text : 
    {
        *(.text)
    }

    .data : 
    {
        *(.data)
    }

    .bss : 
    {
        *(.bss)
    }
}