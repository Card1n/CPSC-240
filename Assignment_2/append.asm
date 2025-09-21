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
; File Name: append.asm
; File Purpose: This file will combine two A and B arrays together


; double * append(double*A, long lena, double*B, long lenb)


; declarations
%include "macros.inc"
global append
extern malloc
segment .bss
;empty

segment .text
append:
    backup
    ;sets array values to registers for modification
    mov r12, rdi    ; Array a
    mov r13, rsi    ; sizeA
    mov r14, rdx   ; array b
    mov r15, rcx   ; sizeB

    mov r8, r13
    add r8, r15 ; r8 is total elements in combined
    imul r8, r8, 8 ; r8 is total bytes in combined

    ;allocate mem for combined
    mov rax, 0
    mov rdi, r8
    call malloc ; rax hold statring address
    mov r8, rax ;r8 set as combined array

    ;loop to copy array A into combined array
    mov rbx, 0
    top:
    cmp rbx, r13
    jge loopdone
    mov rax, rbx
    shl rax, 3
    movsd xmm0, [r12 + rax]
    movsd [r8 + rax], xmm0
    inc rbx
    jmp top
    
    loopdone:
    ;loop to copy array B into combined array
    mov r9, 0
    start:
    cmp r9, r15
    jge continue
    mov rax, r9
    shl rax, 3
    movsd xmm0, [r14 + rax]
    mov rax, r13
    add rax, r9
    shl rax, 3
    movsd [r8 + rax], xmm0
    inc r9
    jmp start

    continue:
    
    mov rax, r8
    restore
    ret
