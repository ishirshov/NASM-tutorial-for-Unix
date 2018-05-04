%include "defines.inc"

section .bss
    result resb 1

section .text
    global _start

_start:
    mov al, 5
    mov bl, 3
    or al, bl
    add al, byte '0'

    mov [result], al
    mov ecx, result
    mov edx, 1

print_stdout:
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    int 80h

exit:
    mov eax, SYS_EXIT
    xor ebx, ebx
    int 80h
