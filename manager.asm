; Program Name: "00000000000". This program demonstrates.  Copyright (C) 2025 Cardin Phan

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

; Program Information: 00000000000000
; Name: 00000000000
; Languages: C, X86 Assembly
; Start Date: 9/10/2025
; Completion Date:9/12/2025

; Program's Purpose: 00000000000
; 
; Project Information: 
; Files: 
; Developing Computer: Unbuntu Virtual Machine

; File Info: 000000000000
; File Name: manager.asm
; File Purpose: 0000000000000

%include "macros.inc"
extern printf
extern fgets
extern scanf
extern input_array
extern display_array
extern sum
extern sort
extern swap
extern clearerr
extern stdin
extern getchar
extern EOF
extern strlen


segment .data

    input_name db "Please enter your name: ", 0
    thankyou_name db "Thank you %s.", 10,0 
    future_occupation db "Please enter your future occupation: ", 0
    thankyou_occupation db "Thank you.  We like %ss", 10, 0
    instruct_msg db "Please enter float numbers separated by ws.  Press enter followed by cont-d to terminate.", 10, 0
    array_input db "Thank you. You entered these numbers:", 10, 0
    sum_msg db "The sum of values in this array is %.1f", 10, 0
    sort_msg db "The array will now be sorted", 10, 0
    array_output db "These are the current values of the array:", 10, 0
    final_msg_name db "This program will terminate.", 10
              db "Have a nice day %s", 10,0
    final_msg_job db "Invite a Senior %s to come with you next time.", 10, 0
    

segment .bss
    arrA resq 128
    name resb 64
    job resb 64
    final_result resq 1 

segment .text
global manager
manager:

    backup


    ; input name
    mov rdi, input_name
    mov rax, 0
    call printf

    ;reads name
    mov rdi, name
    mov rsi, 64
    mov rdx, [rel stdin]
    call fgets

    ;block that clears new line from name
    mov rax, 0
    mov rdi, name
    call strlen
    dec rax
    mov byte [name + rax], 0

    ; prints name
    mov rdi, thankyou_name
    mov rsi, name
    mov rax, 0
    call printf

    ; input job
    mov rdi, future_occupation
    mov rax, 0
    call printf

    ;reads occupation
    mov rdi, job
    mov rsi, 64
    mov rdx, [rel stdin]
    call fgets

    ;block that removes new line from job occupation
    mov rax, 0
    mov rdi, job
    call strlen
    dec rax
    mov byte [job + rax], 0

    ; prints job
    mov rdi, thankyou_occupation
    mov rsi, job
    mov rax, 0
    call printf


    ;asking for float numbers
    mov rdi, instruct_msg
    mov rax, 0
    call printf

    ;inputs array
    mov rdi, arrA
    mov rsi, 128
    call input_array
    mov r12, rax ; r12 = count of valid floats

    ;displays confirmation msg
    mov rdi, array_input
    mov rax, 0
    call printf

    mov rdi, arrA
    mov rsi, r12
    call display_array


    ;calcuates sum of array
    mov rdi, arrA
    mov rsi, r12
    call sum ;-------------------------------------------------------calls on sum
    movsd [final_result], xmm0

    ;displays the sum of the array
    mov rdi, sum_msg
    mov rax, 1
    call printf


    ;sends message saying array will be sorted
    mov rdi, sort_msg
    mov rax, 0
    call printf

    ;calls sort function inputting arrA
    mov rdi, arrA
    mov rsi, r12
    call sort

    ;displays message for array output
    mov rdi, array_output
    mov rax, 0
    call printf

    ;calls on displayarray function
    mov rdi, arrA
    mov rsi, r12
    call display_array ; ---------------------------------------------calls on display_array OR output array


    ;termination messages
    mov rdi, final_msg_name
    mov rsi, name
    mov rax, 0
    call printf

    mov rdi, final_msg_job
    mov rsi, job
    mov rax, 0
    call printf

  

    ; return the magnitude of the combined array
    movsd xmm0, [final_result]

      restore

    ret
