%include "defines.inc"

section .data
    msg db "The largest digit is:", 0x20, 0xA, 0xD
    len_msg equ $ - msg

    num_1 db '47'
    num_2 db '12'
    num_3 db '21'

section .bss
    largest_num resb 2

section .text
    global _start

_start:
    mov ecx, [num_1]
    cmp ecx, [num_2]
    jg check_third_num
    mov ecx, [num_2]

check_third_num:

    cmp ecx, [num_3]
    jg _exit
    mov ecx, [num_3]

_exit:
    mov [largest_num], ecx
    mov ecx, msg
    mov edx, len_msg
    mov ebx, STDOUT
    mov eax, SYS_WRITE
    int 80h

    mov ecx, largest_num
    mov edx, 2
    mov ebx, 1
    mov eax, 4
    int 80h

    mov eax, 1
    xor ebx, ebx
    int 80h
