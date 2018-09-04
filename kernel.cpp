#include <stdint.h>
#include <stddef.h>

void printf(const char* str) {
    uint16_t* video_buffer = (uint16_t*)0xb8000;

    for (size_t i = 0; str[i] != '\0'; ++i) {
        video_buffer[i] = 0x0F00 | str[i];
    }
}

extern "C" void kernel_main() {
    printf("NewbieOS: Hello World!");
    while(1);
}