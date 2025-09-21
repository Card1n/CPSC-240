; Author: Cardin Phan
; Program Name: Array Manager

; mean.asm
; Purpose:
;   Computes the mean (average) of an array of 64-bit floating point values.
;   Parameters (SysV AMD64 calling convention):
;       rdi = pointer to array (double*)
;       rsi = number of elements in array (long)
;   Return:
;       xmm0 = mean of the array as double


%include "macros.inc"
global mean

segment .text
mean:
    push rbp
    mov rbp, rsp
    push r12
    push r13
    push r14
    mov r12, rdi
    mov r13, rsi
    pxor xmm0, xmm0
    mov r14, 0

loop_mean:
    cmp r14, r13
    jge done_mean
    mov rax, r14
    shl rax, 3
    add rax, r12
    movsd xmm1, [rax]
    addsd xmm0, xmm1
    inc r14
    jmp loop_mean

done_mean:
    cvtsi2sd xmm1, r13
    divsd xmm0, xmm1
    pop r14
    pop r13
    pop r12
    pop rbp
    ret
