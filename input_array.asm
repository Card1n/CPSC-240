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
