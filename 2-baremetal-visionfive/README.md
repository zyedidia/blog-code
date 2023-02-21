Requires the following tools:

* LDC 1.30.
* RISC-V GCC toolchain.
* U-Boot `mkimage` program.
* A Go compiler for installing the `tools/vf2-imager` (make a VF2 firmware
  image) and `tools/vf2` (load the firmware image onto the board) tools.

Makefile targets:

* `make prog.bin`: create the raw binary file.
* `make prog.list`: create a disassembly file.
* `make prog.img`: create the firmware image.
* `make flash`: send the firmware image to the VisionFive 2 (requires that you
  flip the physical boot-mode switches on the board).

See the [blog
post](https://zyedidia.github.io/blog/posts/2-baremetal-visionfive/) for
details.
