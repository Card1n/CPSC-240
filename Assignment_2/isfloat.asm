; Author: Cardin Phan
; Program Name: Array Manager

global isfloat
extern strtod

segment .text
isfloat:
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
    lea rsi, [rbp-8] ; endptr (on stack)
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
    pop r14
    pop r13
    pop r12
    pop rbp
    ret
