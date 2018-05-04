section .data
    choice        db 'y'
    number        dw 12345
    neg_number    dw -12456
    big_number    dq 123456789
    real_number1  dd 1.234
    real_number2  dq 123.456

section .text
    global _start

_start:
    mov edx, 1
    mov ecx, choice
    mov edx, 1
    mov eax, 4
    int 0x80

    mov eax, 1
    int 0x80
