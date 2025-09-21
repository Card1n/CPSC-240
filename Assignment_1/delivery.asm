; Program Name: "Delivery Calculator". This program demonstrates.  Copyright (C) 2025 Cardin Phan

; This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License  
; version 3 as published by the Free Software Foundation.                                                                    
; This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied         
; warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.      
; A copy of the GNU General Public License v3 is available here: <https:;www.gnu.org/licenses/>.

; Author Information:
; Name: Cardin Phan  
; CWID:884699653
; Section: CPSC 240-#13
; Email: phancardin@csu.fullerton.edu

; Program Information:
; Name: Delivery Calculator
; Languages: C++, X86 Assembly
; Start Date: 9/2/2025
; Completion Date:9/6/2025

; Program's Purpose:
; The "Delivery Calculator" will find the total driving time and average speed of trucks on delivery routes from three locations.

; Project Information:
; Files: main.c, delivery.asm, r.sh, data.inc
; Developing Computer: Unbuntu Virtual Machine

%include "data.inc"
extern printf
extern scanf
global delivery

segment .data
    ;outputs prompt asking for distance and average speed
    prompt_fm_distance db "Enter the miles driven from Fullerton to Mission Viejo: ",0
    prompt_fm_speed db "Enter the average speed (miles per hour) of that leg of the trip: ",0
    prompt_ml_distance db 10,"Enter the miles driven from Mission Viejo to Long Beach: ",0
    prompt_ml_speed db "Enter the average speed (miles per hour) of that leg of the trip: ",0
    prompt_lf_distance db 10,"Enter the miles driven from Long Beach to Fullerton: ",0
    prompt_lf_speed db "Enter the average speed (miles per hour) of that leg of the trip: ",0

    ;message displaying my info
    msg_author db "This software is maintained by Cardin Phan",10
               db "For assistance contact the developer at [Phancardin@csu.fullerton.edu].",10,10,0

    ;prompts to collect the data
    fmt_in        db " %lf",0
    fmt_time      db 10,"Total driving time was %.2f hours.",10,0
    fmt_speed     db "Average speed was %.2f m/h",10,0

segment .bss
    ;not used


segment .text

delivery:



;backs up registers before modifying them using macro----------------------------------
    backup


; prints author info
    lea     rdi, [rel msg_author]
    xor     eax, eax
    call    printf


;-----------Inputs values into xmm registers------------

;inputs prompt_fm_distance into xmm13
    mov     rdi, prompt_fm_distance ; prints the prompts and gets input
    xor     eax, eax
    call    printf

    mov     rax, 0 ;sets input to correct registry
    mov     rdi, fmt_in
    push    qword 0
    push    qword 0
    mov     rsi, rsp
    call    scanf
    movsd   xmm13, [rsp]
    pop     rax
    pop     rax

    ;inputs prompt_fm_speed into xmm8
    mov     rdi, prompt_fm_speed ; prints the prompts and gets input
    xor     eax, eax
    call    printf

    mov     rax, 0 ;sets input to correct registry
    mov     rdi, fmt_in
    push    qword 0
    push    qword 0
    mov     rsi, rsp
    call    scanf
    movsd   xmm8, [rsp]
    pop     rax
    pop     rax



;inputs prompt_ml_distance into xmm14
    mov     rdi, prompt_ml_distance ; prints the prompts and gets input
    xor     eax, eax
    call    printf

    mov     rax, 0 ;sets input to correct registry
    mov     rdi, fmt_in
    push    qword 0
    push    qword 0
    mov     rsi, rsp
    call    scanf
    movsd   xmm14, [rsp]
    pop     rax
    pop     rax

    ;inputs prompt_ml_speed into xmm9
    mov     rdi, prompt_ml_speed ; prints the prompts and gets input
    xor     eax, eax
    call    printf

    mov     rax, 0 ;sets input to correct registry
    mov     rdi, fmt_in
    push    qword 0
    push    qword 0
    mov     rsi, rsp
    call    scanf
    movsd   xmm9, [rsp]
    pop     rax
    pop     rax

    
;inputs prompt_lf_distance into xmm15
    mov     rdi, prompt_lf_distance ; prints the prompts and gets input
    xor     eax, eax
    call    printf

    mov     rax, 0 ;sets input to correct registry
    mov     rdi, fmt_in
    push    qword 0
    push    qword 0
    mov     rsi, rsp
    call    scanf
    movsd   xmm15, [rsp]
    pop     rax
    pop     rax

;inputs prompt_lf_speed into xmm10
    mov     rdi, prompt_lf_speed ; prints the prompts and gets input
    xor     eax, eax
    call    printf

    mov     rax, 0 ;sets input to correct registry
    mov     rdi, fmt_in
    push    qword 0
    push    qword 0
    mov     rsi, rsp
    call    scanf
    movsd   xmm10, [rsp]
    pop     rax
    pop     rax

    ;-----------Calculations------------
; total distance
    movapd xmm11, xmm13 ;sets xmm11 to total distance to continue editing
    addsd xmm11, xmm14
    addsd xmm11, xmm15
    ;xmm11 = total distance

; finds time on each route
    divsd xmm13, xmm8 ;fm hr
    divsd xmm14, xmm9 ;ml hr
    divsd xmm15, xmm10;lf hr

;total time
    addsd xmm13, xmm14
    addsd xmm13, xmm15 ; xmm13 = total time

;average speed of whole trip
    divsd xmm11, xmm13 ;xmm11 = avg whole trip
  
;prints the end output
    ;prints driving time (xmm13 holds total time)
    movsd   xmm0, xmm13
    lea     rdi, [rel fmt_time]
    mov     eax, 1
    call    printf

    ;prints average speed (xmm11 holds average speed)
    movsd   xmm0, xmm11
    lea     rdi, [rel fmt_speed]
    mov     eax, 1
    call    printf

    movsd xmm0, xmm11 ; returns average speed

;Restores registers to what it was before-------------------------------
    
    restore



ret
