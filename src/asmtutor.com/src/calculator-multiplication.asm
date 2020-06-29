%include 'functions.asm'

SECTION .text
global _start


_start:
    mov     eax, 100
    mov     ebx, 10
    mul     ebx         ; Умножить EAX на содержимое регистра EBX

    call    iprintLF

    call    quit
