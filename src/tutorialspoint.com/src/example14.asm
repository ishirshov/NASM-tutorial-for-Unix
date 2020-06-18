%include "defines.inc"

section .bss
    res resb 1

section .data
    msg db "The result is:", 0x2, 0xA, 0xD
    len equ $ - msg

section .text
    global _start

_start:
    sub ah, ah
    mov al, '9'
    sub al, '3'
    aas
    or al, 30h
    mov [res], ax

    sys_call SYS_WRITE, STDOUT, msg, len
    sys_call SYS_WRITE, STDOUT, res, 1
    
    sys_exit