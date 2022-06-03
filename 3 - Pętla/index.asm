; W tym przykładzie po uruchomieniu będzie widać wynik
; po uruchomieniu kodu minie chwila czasu zanim pętla się wykona

[bits 64]
global main

main:

    mov rcx, 10_000_000_000

    .loop_start:         ; Przez kompilator ta etykieta zostanie uznana za main.loop_start, 
                         ; co umożliwia używanie wielu etykiet o tej samej nazwie
                         
        nop              ; <- Nie zrób nic

        dec rcx          ; <- Zmniej rac o 1
        cmp rcx, qword 0 ; <- Porównaj z qwordem (64 bit) reprezetującym wartość 0
        je .loop_exit    ; <- Jeśli równe skocz do .loop_exit
        jmp .loop_start  ; <- Skocz do .loop_start

    .loop_exit:

    ret