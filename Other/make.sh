nasm -f elf64 -o asmmath.o asmmath.asm
cc -o output ms.c asmmath.o