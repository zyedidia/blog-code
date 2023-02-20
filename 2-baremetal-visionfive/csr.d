module csr;

struct Csr {
    pragma(inline, true)
    static ulong time() {
        ulong r;
        asm {
            "csrr %0, time" : "=r"(r);
        }
        return r;
    }
}
