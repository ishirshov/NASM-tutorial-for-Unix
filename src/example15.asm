%include "defines.inc"

section .bss
    sum resb 5

section .data
    msg db 'The sum is:', 0xA, 0xD
    len equ $ - msg
    num_1 db '12345'
    num_2 db '23456'

section .text
    global _start

_start:
    mov esi, 4  ;pointing to the rightmost digit
    mov ecx, 5  ;num of digits
    clc
add_loop:
    mov al, [num_1 + esi]
    adc al, [num_2 + esi]
    aaa
    pushf
    or al, 30h
    popf

    mov [sum + esi], al
    dec esi
    loop add_loop

    sys_call SYS_WRITE, STDOUT, msg, len
    sys_call SYS_WRITE, STDOUT, sum, 5
    
    sys_exit
    