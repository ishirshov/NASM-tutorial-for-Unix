%include "defines.inc"

section .bss
    fact resb 1

section .data
    msg db "Factorial 3 is:", 0xA, 0xD
    len equ $ - msg

section .text
    global _start

_start:
    mov bx, 3
    call fact_n

    add ax, 30h
    mov [fact], ax

    sys_call SYS_WRITE, STDOUT, msg, len     ; sys stdout macros
    sys_call SYS_WRITE, STDOUT, fact, 1

    sys_exit                ; sys exit macros

fact_n:
    cmp bl, 1   ; compare if N > 0
    jg recursion_fact       
    mov ax, 1   ; ax = 1
    ret

recursion_fact:
    dec bl
    call fact_n ; fact (n-1)
    inc bl
    mul bl      ; ax = al * bl
    ret