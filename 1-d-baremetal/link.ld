ENTRY(_start)

SECTIONS
{
    .text 0x80000000 : {
        KEEP(*(.text.boot))  
        *(.text*) 
    }
    .rodata : {
        . = ALIGN(8);
        __global_pointer$ = . + 0x800;
        *(.rodata*)
        *(.srodata*)
    }
    .data : { 
        . = ALIGN(8);
        *(.sdata*)
        *(.data*)
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

