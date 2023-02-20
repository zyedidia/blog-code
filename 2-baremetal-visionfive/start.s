.section ".text.boot"

.globl _start
_start:
	csrr t0, mhartid
	li t1, 1
	bne t0, t1, _hlt # branch to _hlt if mhartid != 1
    .option push
    .option norelax
    la gp, __global_pointer$
    .option pop
    la sp, _stack_start
    call dstart
_hlt:
	wfi
	j _hlt
