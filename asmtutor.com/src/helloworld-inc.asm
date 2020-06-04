%include 'functions.asm'

SECTION .data
msg1     db      'Hello, low level world!', 0Ah
msg2     db      'This is now we recycle in NASM', 0Ah

SECTION .text
global _start

_start:
    mov     eax, msg1
    call    sprint

    mov     eax, msg2
    call    sprint

    call    quit
