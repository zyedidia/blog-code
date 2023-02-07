module uart;

struct Ns16650a(ubyte* base) {
    static void tx(ubyte b) {
        volatileStore(base, b);
    }
}

alias Uart = Ns16650a!(cast(ubyte*) 0x10000000);
