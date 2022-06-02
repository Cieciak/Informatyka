[bits 64]          ; <- Mówimy NASM że używamy 64-bitowego zestawu instrukcji
global main        ; <- Sprawia że etykieta main staje się dostępna na zewnątrz

main:              ; <- Nazwa znana z C / C++
    mov rcx, 1_000 ; <- Do 64-bitowego rejestru wpisujemy wartośc 1000
    ret            ; <- Powrót z subrutyny