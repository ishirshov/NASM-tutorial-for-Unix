section .data
    name db 'Zara Ali '
    len_name equ $-name

section .text
    global _start

_start:
    mov edx, len_name
    mov ecx, name
    call _print

    mov [name], dword 'Nuha'

    mov edx, len_name - 1
    mov ecx, name
    call _print

    call _exit

_print:
    mov ebx, 1
    mov eax, 4
    int 0x80
    ret

_exit:
    mov eax, 1
    int 0x80
    ret