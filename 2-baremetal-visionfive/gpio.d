module gpio;

struct Jh7110Gpio(uintptr base) {
    enum doen_reg = cast(uint*)(base + 0x0);
    enum dout_reg = cast(uint*)(base + 0x40);

    enum dout_mask = 0x7f;
    enum doen_mask = 0x3f;

    static void set(uint pin) {
        if (pin > 63) {
            return;
        }

        uint offset = pin / 4;
        uint shift = 8 * (pin % 4);

        uint dout = volatileLoad(&dout_reg[offset]);
        uint doen = volatileLoad(&doen_reg[offset]);

        volatileStore(&dout_reg[offset], dout & ~(dout_mask << shift) | (1 << shift));
        // enable is active low
        volatileStore(&doen_reg[offset], doen & ~(doen_mask << shift));
    }

    static void clear(uint pin) {
        if (pin > 63) {
            return;
        }

        uint offset = pin / 4;
        uint shift = 8 * (pin % 4);

        uint dout = volatileLoad(&dout_reg[offset]);
        volatileStore(&dout_reg[offset], dout & ~(dout_mask << shift));
    }

    static void write(uint pin, bool value) {
        if (value) {
            set(pin);
        } else {
            clear(pin);
        }
    }
}

alias Gpio = Jh7110Gpio!(0x13040000);
