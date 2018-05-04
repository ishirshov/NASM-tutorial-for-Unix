section .bss
    res resb 1

section .data
    msg db "The result is:", 0x2, 0xA, 0xD
    len equ $ - msg

section .text
    global _start

_start:
    sub ah, ah
    mov al, '9'
    sub al, '3'
    aas
    or al, 30h
    mov [res], ax

    mov ecx, msg
    mov edx, len
    call print

    mov ecx, res
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