SRC=$(wildcard *.d)
OBJ=$(SRC:.d=.o)

all: prog.bin

%.o: %.d
	ldc2 -Oz -betterC -mtriple=riscv64-unknown-elf -mattr=+m,+a,+c,+relax --code-model=medium --makedeps=$*.dep $< -c -of $@
%.o: %.s
	riscv64-unknown-elf-as -march=rv64imac $< -c -o $@
prog.elf: start.o $(OBJ)
	riscv64-unknown-elf-ld -Tlink.ld $^ -o $@
%.bin: %.elf
	riscv64-unknown-elf-objcopy $< -O binary $@
%.list: %.elf
	riscv64-unknown-elf-objdump -D $< > $@
run: prog.bin
	qemu-system-riscv64 -nographic -bios none -machine virt -kernel prog.bin
clean:
	rm -f *.bin *.list *.o *.elf

-include *.dep
