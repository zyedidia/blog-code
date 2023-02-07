module dstart;

extern (C) {
    extern __gshared uint _bss_start, _bss_end;

    void dstart() {
        uint* bss = &_bss_start;
        uint* bss_end = &_bss_end;
        while (bss < bss_end) {
            *bss++ = 0;
        }
        import main;
        kmain();
    }
}
