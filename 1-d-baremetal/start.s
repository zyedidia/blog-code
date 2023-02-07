.section ".text.boot"

.globl _start
_start:
    .option push
    .option norelax
    la gp, __global_pointer$
    .option pop
    la sp, _stack_start
    call dstart
_hlt:
	j _hlt
