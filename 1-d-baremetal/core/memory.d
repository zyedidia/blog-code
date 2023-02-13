module core.memory;

import gcc.attributes;

@optimize("-fno-tree-loop-distribute-patterns") {
    extern (C) size_t strlen(const(char)* s) nothrow {
        size_t n;
        for (n = 0; *s != '\0'; ++s) {
            ++n;
        }
        return n;
    }

    extern (C) void* memset(void* v, int c, size_t n) nothrow {
        for (char* p = cast(char*) v; n > 0; ++p, --n) {
            *p = cast(char) c;
        }
        return v;
    }
}

