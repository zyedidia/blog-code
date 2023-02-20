module uart;

struct Dw8250(uintptr base) {
    // Line status register
    static uint lsr() {
        enum off = base + 0x14;
        return volatileLoad(cast(uint*) off);
    }

    // Transmit holding register
    static void thr(uint b) {
        enum off = base + 0x0;
        volatileStore(cast(uint*) off, b);
    }

    enum Lsr {
        thre = 5, // bit 5 of LSR is set if the THR is empty
    }

    static void tx(ubyte b) {
        // wait for THR to be empty
        while (((lsr >> Lsr.thre) & 1) != 1) {
        }
        thr = b;
    }
}

alias Uart = Dw8250!(0x10000000);
