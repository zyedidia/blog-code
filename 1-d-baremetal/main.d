module main;

void kmain() {
    println("Hello world!");

    // Cause a bounds-check failure (disabled by default)
    static if (true) {
        char[10] array;
        int x = 12;
        println(array[x]);
    }
}
