module main;

import gpio;
import timer;

void kmain() {
    bool val = true;
    enum pin = 61;

    while (true) {
        // We can re-use the println implementation from last post
        println("blink: ", val ? "on" : "off");
        Gpio.write(pin, val);
        val = !val;
        // delay 500 ms
        Timer.delay_us(500 * 1000);
    }
}
