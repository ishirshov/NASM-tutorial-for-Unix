section .bss
    res resb 1

section .data
    msg db "The result is:", 0x20, 0xA, 0xD
    len equ $ - msg

section .text
    global _start

_start:
    mov ax, '8'
    sub ax, '0'

    mov bl, '2'
    sub bl, '0'
    div bl
    add ax, '0'

    mov [res], ax
    mov ecx, msg
    mov edx, len
    call _print

    mov ecx, res
    mov edx, 1
    call _print

    mov eax, 1
    xor ebx, ebx
    int 80h

_print:
    mov eax, 4
    mov ebx, 1

    int 80h
    ret