; swap.asm
section .text
global swap
; swap(double *a, double *b)
; rdi -> a, rsi -> b
swap:
    ; use xmm0 as temp, xmm1 as temp
    movsd xmm0, [rdi]    ; xmm0 = *a
    movsd xmm1, [rsi]    ; xmm1 = *b
    movsd [rdi], xmm1    ; *a = old *b
    movsd [rsi], xmm0    ; *b = old *a
    ret