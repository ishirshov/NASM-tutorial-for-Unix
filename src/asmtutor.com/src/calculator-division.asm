%include 'functions.asm'

SECTION .data
msg1    db  ' remainder ', 0h

SECTION .text
global _start


_start:
    mov     eax, 90
    mov     ebx, 9
    div     ebx         ; По аналогии с mul содержимое регистра EAX
                        ; делится на EBX (делитель).
    call    iprint

    mov     eax, msg1
    call    sprint

    mov     eax, edx
    call    iprintLF

    call    quit
