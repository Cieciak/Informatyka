## Jak to skompilować?

`nasm -f elf64 -o name.o name.asm` - Tworzymy plik obiektowy
`gcc -o name name.o` - Linkujemy go do pliku wykonywalnego

`nasm` można zainstalować  używając:
```sudo apt install nasm```

A `gcc` :
```sudo apt install gcc```

#### Kompilowanie wraz z kodem napisanym w `C`

1. Kompilujemy wszystkie pliki assemblera przy użyciu:
    `nasm -f elf64 -o *.o *.asm`
2. Podczas kompilacji kodu `C` dołączamy pliki obiektowe:
    `gcc -o output *.c *.o`

#### Opcja `-f` podczas 
Specyfikuje format pliku wyjściowego

    - bin       flat-form binary files (e.g. DOS .COM, .SYS)
    - ith       Intel hex
    - srec      Motorola S-records
    - aout      Linux a.out object files
    - aoutb     NetBSD/FreeBSD a.out object files
    - coff      COFF (i386) object files (e.g. DJGPP for DOS)
    - elf32     ELF32 (i386) object files (e.g. Linux)
    - elf64     ELF64 (x86_64) object files (e.g. Linux)
    - elfx32    ELFX32 (x86_64) object files (e.g. Linux)
    - as86      Linux as86 (bin86 version 0.3) object files
    - obj       MS-DOS 16-bit/32-bit OMF object files
    - win32     Microsoft Win32 (i386) object files
    - win64     Microsoft Win64 (x86-64) object files
    - rdf       Relocatable Dynamic Object File Format v2.0
    - ieee      IEEE-695 (LADsoft variant) object file format
    - macho32   NeXTstep/OpenStep/Rhapsody/Darwin/MacOS X (i386) object files
    - macho64   NeXTstep/OpenStep/Rhapsody/Darwin/MacOS X (x86_64) object files
    - dbg       Trace of all info passed to output stage
    - elf       ELF (short name for ELF32)
    - macho     MACHO (short name for MACHO32)
    - win       WIN (short name for WIN32)
