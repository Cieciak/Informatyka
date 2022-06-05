nasm -f elf64 -o math.o math.asm
gcc complex.c math.o -static -o output