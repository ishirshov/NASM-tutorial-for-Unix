%include "defines.inc"

section .bss
    sum resb 1

section .data
    msg db "The sum is:", 0x2, 0xA, 0xD
    len equ $ - msg

section .text
    global _start

_start:
    sys_call SYS_WRITE, STDOUT, msg, len

    ; Example with numbers
    mov eax, 3
    mov ebx, 4

    add eax, ebx
    add eax, '0'    ; Convert to ASCII
    mov [sum], eax

    ; Print out
    sys_call SYS_WRITE, STDOUT, sum, 1
    
    sys_exit
