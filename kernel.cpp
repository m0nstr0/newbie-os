void printf(const char* str) {
    unsigned short* video = (unsigned short*)0xb8000;
    for (int i = 0; str[i] != '\0'; ++i) {
        video[i] = (video[i] << 0xFF00) | str[i];
    }
}

extern "C" void kernel_main(void* multiboot_structure, unsigned int magic) {
    printf("NewbieOS: Hello World!");
    while(1);
}
