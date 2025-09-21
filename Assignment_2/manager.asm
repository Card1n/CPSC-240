; Program Name: "Array Manager". This program demonstrates.  Copyright (C) 2025 Cardin Phan

; This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License  
; version 3 as published by the Free Software Foundation.                                                                    
; This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied         
; warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.      
; A copy of the GNU General Public License v3 is available here: <https:;www.gnu.org/licenses/>.

; Author Information:
; Name: Cardin Phan  
; CWID: 884699653
; Section: CPSC 240-#13
; Email: phancardin@csu.fullerton.edu

; Program Information:
; Name: Array Manager
; Languages: C, X86 Assembly
; Start Date: 9/2/2025
; Completion Date:9/6/2025

; Program's Purpose:
; This array manager is meant to showcase how to make arrays in x86, and modify/calculate values from them using iterations and math. it will be used to find numbers like magnitude and mean of arrays.
; Project Information:
; Files: main.c, append.asm, input_array.asm, isfloat.asm, magnitude.asm, manager.asm, mean.asm, r.sh, macros.inc
; Developing Computer: Unbuntu Virtual Machine

; File Info:
; File Name: manager.asm
; File Purpose: Allocate arrays, call input_array twice (A and B), call display_array, call magnitude, call append_arrays, call mean, print results, free memory.

%include "macros.inc"
extern printf
extern input_array
extern display_array
extern magnitude
extern append
extern mean
extern clearerr
extern stdin
extern getchar
extern EOF


segment .data
    program_msg db "This program will manage your arrays of 64-bit floats", 10, 0
    input_A_msg db "For array A enter a sequence of 64-bit floats separated by white space.",10
                db "After the last input press enter followed by Control+D:", 10, 0
    received_A_msg db 10,"These number were received and placed into array A:", 10, 0
    mag_A_msg db 10,"The magnitude of array A is %.8f", 10,10, 0
    input_B_msg db "For array B enter a sequence of 64-bit floats separated by white space. After the last input press enter followed by Control+D:", 10, 0
    received_B_msg db 10,"These number were received and placed into array B:", 10, 0
    mag_B_msg db 10,"The magnitude of this array B is %.8f", 10,10, 0
    append_msg db "Arrays A and B have been appended and given the name A⊕ B.", 10, 0
    combined_msg db "A⊕ B contains", 10, 0
    combined_mag_msg db "The magnitude of A⊕ B is %.8f", 10,10, 0
    mean_msg db "The mean of A⊕ B is %.8f", 10,10, 0

segment .bss
    arrA resq 128
    arrB resq 128

segment .text
global manager
manager:

    backup

    ;welcome
    mov rdi, program_msg
    mov rax, 0
    call printf

    ; input array A
    mov rdi, input_A_msg
    mov rax, 0
    call printf
    
    mov rdi, arrA
    mov rsi, 128
    call input_array
    mov r12, rax         ; r12 = size A

    ; array A Prompt
    mov rdi, received_A_msg
    mov rax, 0
    call printf
    
    ; display A
    mov rdi, arrA
    mov rsi, r12
    call display_array

    ; magnitude of A
    mov rdi, arrA
    mov rsi, r12
    call magnitude
    mov rdi, mag_A_msg
    mov rax, 1
    call printf

    ;resets stdin for arrayB
    mov rax, 0
    mov rdi, [stdin]
    call clearerr

    ; input array B
    mov rdi, input_B_msg
    mov rax, 0
    call printf
    
    mov rdi, arrB
    mov rsi, 128
    call input_array
    mov r13, rax         ; r13 = size B

    ; array B Prompt
    mov rdi, received_B_msg
    mov rax, 0
    call printf
    
    ; display B
    mov rdi, arrB
    mov rsi, r13
    call display_array

    ; magnitude of B
    mov rdi, arrB
    mov rsi, r13
    call magnitude
    mov rdi, mag_B_msg
    mov rax, 1
    call printf

    ; append both arrays
    mov rdi, append_msg
    mov rax, 0
    call printf
    
    mov rdi, combined_msg
    mov rax, 0
    call printf
    
    mov rdi, arrA
    mov rsi, r12
    mov rdx, arrB
    mov rcx, r13
    call append
    mov r14, rax         ; r14 = combined array pointer
    
    ; combined size
    mov r15, r12
    add r15, r13         ; r15 = combined size

    mov rdi, r14
    mov rsi, r15
    call display_array

    ; magnitude of arrays
    mov rdi, r14
    mov rsi, r15
    call magnitude
    movsd xmm2, xmm0     ; Save magnitude for return value
    mov rdi, combined_mag_msg
    mov rax, 1
    call printf

    ; mean of arrays
    mov rdi, r14
    mov rsi, r15
    call mean
    mov rdi, mean_msg
    mov rax, 1
    call printf

  

    ; return the magnitude of the combined array
    movsd xmm0, xmm2

      restore
      
    ret
