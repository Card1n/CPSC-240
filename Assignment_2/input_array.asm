; Author: Cardin Phan
; Program Name: Array Manager

; File Info:
; File Name: input_array.asm
; File Purpose: reads through lines with fgets, & uses iteration to add data into arrays


%include "macros.inc"
global input_array
extern fgets
extern stdin
extern strlen
extern atof
extern isfloat


segment .bss
temp resb 32

segment .text
input_array:

    backup

    ; incoming parameters
    mov r13, rdi        ; r13 = incoming array pointer
    mov r14, rsi        ; r14 = max size
    mov r15, 0          ; r15 = count

begin_loop:
    ; sets fgets to read in 1 float number
    mov rax, 0
    mov rdi, temp
    mov rsi, 31
    mov rdx, [rel stdin]
    call fgets

    ; if fgets returned NULL, exit
    cmp rax, 0
    je exit

    ; check for valid float in temp
    mov rax, 0
    mov rdi, temp
    call isfloat

    ; rax = 0 means false
    ; rax != 0 means true
    cmp rax, 0
    je begin_loop   ; if not a float, restart loop

    ; convert to double in xmm0
    mov rax, 0
    mov rdi, temp
    call atof

    ; place xmm0 into array[r15]
    lea r8, [r13 + r15*8]
    movsd [r8], xmm0
    inc r15

    ; check if array is full
    cmp r15, r14
    jl begin_loop

exit:

    mov rax, r15

    restore

    ret
