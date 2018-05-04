%include "defines.inc"

section .bss
    sum resb 1

section .data
    msg db "The sum is:", 0x2, 0xA, 0xD
    len equ $ - msg

section .text
    global _start

_start:
    mov ecx, msg
    mov edx, len
    call print

    ; Example with numbers
    mov eax, 3
    mov ebx, 4

    add eax, ebx
    add eax, '0'    ; Convert to ASCII
    mov [sum], eax

    ; Print out
    mov ecx, sum
    mov edx, 1
    call print
    jmp exit

print:
    mov ebx, 1
    mov eax, 4 
    int 80h
    ret

exit:
    mov eax, 1
    xor ebx, ebx
    int 80h

