[bits 64]
global asm_exp

asm_exp:

    subsd xmm3, xmm3

    ; Put 1 in xmm7
    mov rax, 0b0_01_111_111_111_0000000000000000000000000000000000000000000000000000
    movq xmm7, rax

    movsd xmm6, xmm7; <- Counter here
    addsd xmm6, xmm7;

    movsd xmm5, xmm7; <- Factorial here

    movsd xmm4, xmm0; <- The power
    movsd xmm3, xmm7; <- Output 

    mov rcx, 1 ; Set counter
    .loop:
        movsd xmm2, xmm4
        divsd xmm2, xmm5
        addsd xmm3, xmm2

        mulsd xmm4, xmm0
        
        mulsd xmm5, xmm6
        addsd xmm6, xmm7

        inc rcx            ; Loop 
        cmp rcx, qword 100 ;
        je .exit           ;
        jmp .loop          ;

    .exit:
        movsd xmm0, xmm3
        ret