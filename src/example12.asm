%include "defines.inc"

section .bss
    num resb 1

section .text
    global _start

_start:
    mov ecx, 10
    mov eax, '1'

l1:
    ; print out the number which stores in num var
    mov [num], eax
    push ecx        ; ECX register contains the loop count
                    ; when the loop is executed the ECX register is decremented
                    ; while ECX is not zero.
                    ; Push to stack current ECX value.

    mov ecx, num
    mov edx, 1
    call print_out

    pop ecx         ; Restore ECX value

    ; restore number 
    mov eax, [num]
    sub eax, '0'
    inc eax
    add eax, '0'
    loop l1

exit:
    mov eax, SYS_EXIT
    xor ebx, ebx
    int 80h

print_out:
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    int 80h
    ret