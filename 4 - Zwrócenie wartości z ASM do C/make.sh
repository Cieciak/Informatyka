nasm -f elf64 -o asm.o index.asm
gcc head.c asm.o -o index