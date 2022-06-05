[bits 64]
global abss
global complex_square

struc complex_number
    .real resq 1
    .imag resq 1
endstruc

section .data

two: dq 2.0

section .bss

output: resb complex_number_size

section .text

abss:                  ; Zwraca kwadrat z wartości absolutnej liczby zespolonej
    movapd xmm0, [rdi] ; <- Wczytaj wartość podaną przez C
    mulpd xmm0, xmm0   ; <- Podnieś do kwadratu
    haddpd xmm0, xmm0  ; <- Sumuj horyzontalnie double z xmm0
    ret

complex_square:
    movapd xmm2, [rsi]             ; <- Zapisz przesunięcie
    movapd xmm0, [rdi]             ; <- Wczytaj dane
    vshufpd xmm1, xmm0, xmm0, 0b01 ; <- Pozamieniaj miejscami
    mulpd xmm1, xmm0               ; <- Pomnóż by uzyskać ab
    haddpd xmm1, xmm1              ; <- Dodaj by dostać 2ab

    mulpd xmm0, xmm0               ; <- Podnieś do kwadratu
    hsubpd xmm0, xmm0              ; <- Odejmij by dostać a^2 - b^2

    movsd xmm1, xmm0               ; <- Wpisz a^2 - b^2 do dolnej części xmm1
    addpd xmm1, xmm2               ; <- Dodaj przesunięcie

    movdqa [output], xmm1          ; <- Wpisz xmm1 do zarezerwowanej przestrzeni
    mov rax, output                ; <- Zwróć adres
    ret