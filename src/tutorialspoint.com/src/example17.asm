%include "defines.inc"

section .bss
    res resb 1

section .data
    msg db "The sum is:", 0x2, 0xA, 0xD
    len equ $ - msg

section .text
    global _start

_start:
    mov ecx, '4'
    sub ecx, '0'

    mov edx, '5'
    sub edx, '0'
    
    call sum
    mov [res], eax

    sys_call SYS_WRITE, STDOUT, msg, len
    sys_call SYS_WRITE, STDOUT, res, 1

    sys_exit

sum:
    mov eax, ecx
    add eax, edx
    add eax, '0'
    ret