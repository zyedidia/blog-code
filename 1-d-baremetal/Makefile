SRC=$(wildcard *.d) $(wildcard core/*.d)
OBJ=$(SRC:.d=.o)

all: prog.bin

%.o: %.d
	riscv64-unknown-elf-gdc -Os -march=rv64imac -mabi=lp64 -nophoboslib -fno-exceptions -fno-moduleinfo -fno-rtti -mcmodel=medany -MD -MF $*.dep -c $< -o $@
%.o: %.s
	riscv64-unknown-elf-as -march=rv64imac $< -c -o $@
prog.elf: start.o $(OBJ)
	riscv64-unknown-elf-gcc -nostartfiles -nostdlib -Tlink.ld $^ -o $@
%.bin: %.elf
	riscv64-unknown-elf-objcopy $< -O binary $@
%.list: %.elf
	riscv64-unknown-elf-objdump -D $< > $@
run: prog.bin
	qemu-system-riscv64 -nographic -bios none -machine virt -kernel prog.bin
clean:
	rm -f *.bin *.list *.o *.elf *.dep

-include *.dep
