%include 'functions.asm'

SECTION .text
global _start

_start:
    mov     ecx, 90
    mov     eax, 9
    add     eax, ecx

    call    iprintLF

    call    quit
