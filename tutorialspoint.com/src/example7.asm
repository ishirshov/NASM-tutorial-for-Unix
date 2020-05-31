%define SYS_WRITE 4
%define SYS_EXIT  1
%define STDOUT    1

section .data
    msg db "The result is:", 0x20, 0xA, 0xD
    len_msg equ $ - msg

section .bss
    res resb 1

section .text
    global _start

_start:
    mov al, '3'
    sub al, '0'

    mov bl, '3'
    sub bl, '0'
    mul bl
    add al, '0'

    mov [res], al
    mov ecx, msg
    mov edx, len_msg
    call _print

    mov ecx, res
    mov edx, 1
    call _print

    mov eax, SYS_EXIT
    xor ebx, ebx
    int 80h

_print:
    mov eax, SYS_WRITE
    mov ebx, STDOUT

    int 80h
    ret

