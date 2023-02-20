SRC=$(wildcard *.d)
OBJ=$(SRC:.d=.o)

all: prog.bin

%.o: %.d
	ldc2 -Oz -betterC -mtriple=riscv64-unknown-elf -mattr=+m,+a,+c,+relax --code-model=medium --makedeps=$*.dep $< -c -of $@ --function-sections --data-sections
%.o: %.s
	riscv64-unknown-elf-as -march=rv64imac $< -c -o $@
prog.elf: start.o $(OBJ)
	riscv64-unknown-elf-ld -Tlink.ld $^ -o $@ --gc-sections
%.bin: %.elf
	riscv64-unknown-elf-objcopy $< -O binary $@
%.list: %.elf
	riscv64-unknown-elf-objdump -D $< > $@
%.img: %.bin
	vf2-imager -i $< -o $@
flash: prog.img
	vf2 $<
run: prog.bin
	qemu-system-riscv64 -nographic -bios none -machine virt -kernel prog.bin
clean:
	rm -f *.bin *.list *.o *.elf *.dep *.img

-include *.dep
