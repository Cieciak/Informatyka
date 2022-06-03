[bits 64]
global goASM
global dummyRandom

goASM:          ; <- Tutaj znajduje się ciało funkcji goASM()
    mov rax, 12 ; <- Do rax wpisujemy 12
    ret         ; <- Wychodzimy z funkcji

;; Dlaczego?
; Funkcja goASM() zwraca inta
; W Linuxie kiedy funkcja zwraca liczbę całkowitą
; Wpisuje ją do rejestru rax (wynika to z tego, że ktoś kiedyś się tak umówił)

; Więc możemy zrobić coś takiego
dummyRandom:
    mov rax, r8  ; Te rejestry PRAWDOPODOBNIE zawierają jakieś losowe dane
    xor rax, r12 ; Więc weźmy ich xora i zwróćmy użytkownikowi
    ret
; I nie to nie tak generuje się liczby losowe (RDRAND)