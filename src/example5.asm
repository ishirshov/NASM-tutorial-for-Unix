SYS_EXIT  equ 1
SYS_WRITE equ 4
STDIN     equ 0
STDOUT    equ 1

section .data
    msg_1 db 'Hello, programmers!', 0xA, 0xD
    len_1 equ $ - msg_1

    msg_2 db 'Welcome to the world of', 0x20
    len_2 equ $ - msg_2

    msg_3 db 'Linux assembly programming!', 0xA, 0xD
    len_3 equ $ - msg_3

section .text
    global _start

_start:
    mov ecx, msg_1
    mov edx, len_1
    call _print

    mov ecx, msg_2
    mov edx, len_2
    call _print

    mov ecx, msg_3
    mov edx, len_3
    call _print

    mov eax, SYS_EXIT
    int 80h

_print:
    mov eax, SYS_WRITE
    mov ebx, STDOUT

    int 80h
    ret