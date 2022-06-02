[bits 64]
global main

main:

    ; MOV - Instrukcja ta przenosi wartości pomiędzy rejestrami.

    mov rax, 100   ; <- Ta instrukcja wpisze 100 bezpośrednio do rejestru RAX
    mov rbx, rax   ; <- To wpisze do RBX zawartość RAX

    mov eax, ebx   ; <- Działa tak długo jak destynacja i źródło są tej samej wielkości
                   ;    Ale w przypadku kiedy wartości są 32 bitowe, górne 32 bity zą zerowane

    mov ah, bl     ; <- Nie muszą być to te same miejsca w rejestrze

    ; NOT - Odwraca bity w rejestrze
    not al

    ; AND - Bitowa operacja AND na rejestrach (wynik jest zapisywany w pierwszym rejestrze)

    and al, 0b0101_0101 ; <- al = al && 0b0101_0101

    and bh, bl          ; <- Na rejestrach też można (tak długo jak są tej samej wielkości)

    ; OR - Jak wyżej tylko OR
    ; XOR - To samo

    ; ADD - Dodaje
    add rax, rdx

    ; SUB - Odejmuje
    sub rbx, rcx

    ; MUL - Mnoży
    mul rax, rax

    ; INC - Dodaj 1 do rejestru
    inc al

    ; DEC - Odejmij 1 od rejestru
    dec eax

    ;;;;;;;;;;;;;;;;;;;;;;;
    ;;
    ;; Instrukcje warunkowe
    ;;
    ;;;;;;;;;;;;;;;;;;;;;;;

    ; CMP - Instrukcja porównania
    ; Po jej wykonaniu odpowiednie bity w rejestrze flag zostają ustawione
    ; Podczas podawania wartości bezpośrednio podajemy jej rozmiar
    cmp al, byte 30

    cmp eax, dword 343453

    cmp ah, cl

    ; JMP - Skok bezwarunkowy
    jmp .etykieta ; <- Skoczy do etykiety o tej nazwie

    ; JE - Skocz jeśli równe
    je .etykieta ; <- Skoczy do etykiety kiedy instrukcja cmp ustawi flage EQ (jest równe) na 1
    jne .etykieta; <- Skoczy do etykiety kiedy instrukcja cmp ustawi flage EQ (jest równe) na 0

    ; JS - Skocz jeśli mniejsze
    js .etykieta ; <- Skoczy do etykiety kiedy instrukcja cmp ustawi flage SF (jest mniejsze) na 1
    jns .etykieta; <- Skoczy do etykiety kiedy instrukcja cmp ustawi flage SF (jest mniejsze) na 0

    ; JG - Skocz jeśli większe
    jg .etykieta ; <- Skoczy do etykiety kiedy instrukcja cmp ustawi flage GF (jest większe) na 1
    jng .etykieta; <- Skoczy do etykiety kiedy instrukcja cmp ustawi flage GF (jest większe) na 0

    .etykieta:

    ret