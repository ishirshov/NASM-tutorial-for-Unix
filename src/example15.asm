section .bss
    sum resb 5

section .data
    msg db 'The sum is:', 0xA, 0xD
    len equ $ - msg
    num_1 db '12345'
    num_2 db '23456'

section .text
    global _start

_start:
    mov esi, 4  ;pointing to the rightmost digit
    mov ecx, 5  ;num of digits
    clc
add_loop:
    mov al, [num_1 + esi]
    adc al, [num_2 + esi]
    aaa
    pushf
    or al, 30h
    popf

    mov [sum + esi], al
    dec esi
    loop add_loop

    mov ecx, msg
    mov edx, len
    call print

    mov ecx, sum
    mov edx, 5
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