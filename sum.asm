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

; sum.asm
; Purpose:
;   Computes the mean (average) of an array of 64-bit floating point values.
;   Parameters (SysV AMD64 calling convention):
;       rdi = pointer to array (double*)
;       rsi = number of elements in array (long)
;   Return:
;       xmm0 = mean of the array as double


section .data
zero_val:    dq 0.0

segment .text
global sum
; double sum(double *arr, long len)
; rdi -> arr
; rsi -> len
; sum.asm
sum:
    ;backups saved registers
    push rbp
    mov rbp, rsp
    push r12
    push r13
    push r14

    ; initialize
    movsd xmm0, [rel zero_val]   ; xmm0 = 0.0
    xor rcx, rcx                 ; rcx = index 0

    cmp rsi, 0
    je .done

.loop:
    ; load arr[rcx] into xmm1 and add to xmm0
    lea rax, [rdi + rcx*8]
    movsd xmm1, [rax]
    addsd xmm0, xmm1

    inc rcx
    cmp rcx, rsi
    jl .loop

.done:
    ;restore
    pop r14
    pop r13
    pop r12
    pop rbp
    ret
