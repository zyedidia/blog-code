ENTRY(_start)

SECTIONS
{
    .text 0x40000000 : {
        KEEP(*(.text.boot))  
        *(.text*) 
        . = ALIGN(8);
    }
    .rodata : {
        . = ALIGN(8);
        __global_pointer$ = . + 0x800;
        *(.rodata*)
        *(.srodata*)
        . = ALIGN(8);
    }
    .data : { 
        . = ALIGN(8);
        *(.sdata*)
        *(.data*)
        . = ALIGN(8);
    } 
    .bss : {
        . = ALIGN(8);
        _bss_start = .;
        *(.sbss*)
        *(.bss*)
        *(COMMON)
        . = ALIGN(8);
        _bss_end = .;
    }

    .kstack : {
        . = ALIGN(16);
        . += 4K;
        _stack_start = .;
    }

    /DISCARD/ : { *(.comment .note .eh_frame) }
}

