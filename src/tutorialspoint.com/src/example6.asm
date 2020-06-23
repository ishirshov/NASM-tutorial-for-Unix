SYS_EXIT  equ 1
SYS_READ  equ 3
SYS_WRITE equ 4
STDIN     equ 0
STDOUT    equ 1


segment .data
    msg_1 db "Enter a digit:", 0x20
    len_1 equ $ - msg_1

    msg_2 db "Please enter as second digit:", 0x20
    len_2 equ $ - msg_2

    msg_3 db "The sum is:", 0x20
    len_3 equ $ - msg_3

segment .bss
    num_1 resb 2
    num_2 resb 2
    res   resb 1

section .text
    global _start

_start:
    mov ecx, msg_1
    mov edx, len_1
    call _print_to_std

    mov ecx, num_1
    mov edx, 2
    call _read_from_std

    mov ecx, msg_2
    mov edx, len_2
    call _print_to_std

    mov ecx, num_2
    mov edx, 2
    call _read_from_std

    mov ecx, msg_3
    mov edx, len_3
    call _print_to_std

    ; moving the first number to eax register and second number to ebx
    ; and subtracting ascii '0' to convert it into a decimal number
    mov eax, [num_1]
    sub eax, '0'

    mov ebx, [num_2]
    sub ebx, '0'

    ; eax = eax + ebx
    add eax, ebx
    ; add '0' to to convert the sum from decimal to ASCII
    add eax, '0'

    ; store result to memory
    mov [res], eax

    ; print result
    mov ecx, res
    mov edx, 1
    call _print_to_std

exit:
    mov eax, SYS_EXIT
    xor ebx, ebx
    int 0x80


_print_to_std:
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    
    int 0x80
    ret

_read_from_std:
    mov eax, SYS_READ
    mov ebx, STDIN

    int 0x80
    ret