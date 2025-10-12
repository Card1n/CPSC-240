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

;isfloat.asm
;is float checks if inputs are valid and if it contains white space

global isfloat
extern strtod

segment .text
isfloat:
    ;backup registers 12-14
    push rbp
    mov rbp, rsp
    push r12
    push r13
    push r14
    
    mov r12, rdi    ; r12 = string pointer
    
    ; Check for empty string
    cmp byte [r12], 0
    je not_float
    
    ; Use strtod to parse the string
    mov rdi, r12    ; string
    lea rsi, [rbp-8] ; endptr
    call strtod
    
    ; Check if endptr == start (no conversion)
    mov r13, [rbp-8]
    cmp r13, r12
    je not_float
    
    ; Skip trailing whitespace
skip_whitespace:
    mov al, [r13]
    cmp al, 0
    je is_float
    cmp al, 32      ; space
    je skip_next
    cmp al, 9       ; tab
    je skip_next
    cmp al, 10      ; newline
    je skip_next
    cmp al, 13      ; carriage return
    je skip_next
    jmp not_float
    
skip_next:
    inc r13
    jmp skip_whitespace
    
is_float:
    mov rax, 1
    jmp done
    
not_float:
    mov rax, 0
    
done:
    ;restore registers
    pop r14
    pop r13
    pop r12
    pop rbp
    ret
