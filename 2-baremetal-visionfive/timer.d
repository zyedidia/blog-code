module timer;

struct Timer {
    static ulong mtime() {
        return volatileLoad(cast(ulong*) (0x200_0000 + 0xBFF8));
    }

    enum mtime_freq = 4_000_000;

    static void delay_time(ulong t) {
        ulong rb = mtime;
        while (true) {
            ulong ra = mtime;
            if ((ra - rb) >= t)
                break;
        }
    }

    static void delay_us(ulong us) {
        delay_time(us * mtime_freq / 1_000_000);
    }
}
