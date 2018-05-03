%include "defines.inc"

section .data
    odd_msg db 'Odd Number!'
    odd_len equ $ - odd_msg

    evn_msg db 'Even Number!'
    evn_len equ $ - evn_msg

section .text
    global _start

_start:
    mov ax, 09h
    and ax, 1
    jz evnn
    mov ecx, odd_msg
    mov edx, odd_len
    jmp print_stdout

evnn:
    mov ah, 09h
    mov ecx, evn_msg
    mov edx, evn_len

print_stdout:
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    int 80h

exit:
    mov eax, SYS_EXIT
    xor ebx, ebx
    int 80h
