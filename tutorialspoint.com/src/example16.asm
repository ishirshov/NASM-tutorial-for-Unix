%include "defines.inc"

section .data
    x db 2, 4, 3
    len equ $ - x

    sum db 0

section .text
    global _start

_start:
    mov eax, 3      ; number bytes to be summed
    mov ebx, 0      ; EBX will store the sum
    mov ecx, x      ; ECX will point to the current element to be summed

top:
    add ebx, [ecx]
    add ecx, 1      ; move pointer to next element
    dec eax         ; decrement counter
    jnz top         ; if counter not 0, then loop again

done:
    add ebx, '0'
    mov [sum], ebx  ; done, store result in "sum"

display:
    sys_call SYS_WRITE, STDOUT, sum, 1
    
    sys_exit