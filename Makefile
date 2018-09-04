GPPPARAMS = -m32 -ffreestanding -fno-rtti -fno-exceptions -O2 -Wall -Wextra -Werror
ASPARAMS = --32
LDPARAMS = -melf_i386

objects = loader.o kernel.o

%.o: %.cpp
	g++ $(GPPPARAMS) -o $@ -c $<

%.o: %.s
	as $(ASPARAMS) -o $@ $<

kernel.bin: linker.ld $(objects)
	ld $(LDPARAMS) -T $< -o $@ $(objects)

all: kernel.bin

install: kernel.bin
	mkdir -p iso/boot/grub
	mv $< iso/boot/
	echo 'set default=0' > iso/boot/grub/grub.cfg
	echo 'set timeout=0' >> iso/boot/grub/grub.cfg
	echo 'menuentry "NewbieOS" {' >> iso/boot/grub/grub.cfg
	echo ' multiboot2 /boot/kernel.bin' >> iso/boot/grub/grub.cfg
	echo ' boot' >> iso/boot/grub/grub.cfg
	echo '}' >> iso/boot/grub/grub.cfg
	grub-mkrescue --output=newbieos.iso iso