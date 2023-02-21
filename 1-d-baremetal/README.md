Requires the following tools:

* LDC 1.30.
* RISC-V GCC toolchain.
* `qemu-system-riscv64` for RISC-V simulation

Makefile targets:

* `make prog.bin`: create the raw binary file.
* `make prog.list`: create a disassembly file.
* `make run`: run the program in QEMU.

See the [blog
post](https://zyedidia.github.io/blog/posts/1-d-baremetal/) for
details.
