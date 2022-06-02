#### Co to jest?

W skrócie jest to czytelna dla człowieka wersja kodu binarnego.

# Podstawy

## Rejestry

`x86_64` posiada 16 rejestrów których można użyć, jednak czwórka z nich jest zarezerwowana lub zawiera ważne dane

|Rozmiar w bitach|   64|    32|16    |8      |
|----------------|-----|------|------|-------|
|        A       | RAX | EAX  | AX   | AH AL |
|        B       | RBX | EBX  | BX   | BH BL |
|        C       | RCX | ECX  | CX   | CH CL |
|        D       | RDX | EDX  | DX   | DH DL |
|        8       | R8  | R8D  | R8W  | R8B   |
|        9       | R9  | R9D  | R9W  | R9B   |
|       10       | R10 | R10D | R10W | R10B  |
|       11       | R11 | R11D | R11W | R11B  |
|       12       | R12 | R12D | R12W | R12B  |
|       13       | R13 | R13D | R13W | R13B  |
|       14       | R14 | R14D | R14W | R14B  |
|       15       | R15 | R15D | R15W | R15B  |

`AH` - Górna część `AX`
`AL` - Dolna częśc `AX`
I tak jest z `AX`, `BX`, `CX` i `DX`

Rejestry `R8` - `R15` są dostępne tylko na 64 bitowych procesorach

```
W ten sposób rejestry są ułożone:
   63                                                              0
RAX XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
                                   31                              0
EAX                                 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
                                                   15              0
AX                                                  XXXXXXXXXXXXXXXX
                                                   15      8
AH                                                  XXXXXXXX
                                                            7      0
AL                                                          XXXXXXXX

```
`EAX` to dolne 32 bity `RAX`
`AX` to dolne 16 bitów `EAX`
`AH` to górne 8 bitów `AX`
`AL` to dolne 8 bitów `AX`

## Instrukcje

Każdy processor ma określony zestaw instrukcji. (Można się do niego dostać przy użyciu `cpuid`).

Najpopularniejsze z nich to:
    - `MMX`, dla `x87`
    - `SSE`, dla liczb zmiennoprzecinkowych
    - `SSE 2`, rozszerzenie `SSE`
    - `AVX` i `AVX 512`