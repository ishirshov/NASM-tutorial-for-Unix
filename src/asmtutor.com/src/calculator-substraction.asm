%include 'functions.asm'

SECTION .text
global _start

_start:
    mov     eax, 10
    mov     ecx, 5
    sub     eax, ecx

    call    iprintLF

    call    quit
