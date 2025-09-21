; Author: Cardin Phan
; Program Name: Array Manager

;magnitude.asm
;Purpose: Magnitude will find the square root of the mean of every number in the array squared

global magnitude
extern sqrt

segment .text
magnitude:
        push rbp
        mov rbp, rsp
        push r12
        push r13
        push r14
        mov r12, rdi
        mov r13, rsi
        pxor xmm0, xmm0
        mov r14, 0

loop_mag:
    cmp r14, r13
    jge done_mag
    mov rax, r14
    shl rax, 3
    add rax, r12
    movsd xmm1, [rax]
    mulsd xmm1, xmm1
    addsd xmm0, xmm1
    inc r14
    jmp loop_mag

done_mag:
    call sqrt
    pop r14
    pop r13
    pop r12
    pop rbp
    ret
