%include "defines.inc"

section .data
    achar db '0'

section .text
    global _start

_start:
    call display
    sys_exit

display:
    mov ecx, 256

next:
    push ecx    ; back to stack

    ; show current char in ascii encoding
    sys_call SYS_WRITE, STDOUT, achar, 1     ; sys stdout macros

    pop ecx     ; restore the counter back for the loop

    cmp byte [achar], '0'
    inc byte [achar]
    loop next
    ret
