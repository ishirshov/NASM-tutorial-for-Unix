%include    'functions.asm'

SECTION .bss
sinput:     RESB    255
;Справочная информация по выделяемой памяти:
;character:  RESB    1   ; 1 байт  - 8 бит
;short:      RESW    1   ; 2 байта - 16 бит
;integer:    RESD    1   ; 4 байта - 32 бит
;double:     RESQ    1   ; 8 байт  - 64 бита
;double64:   REST    1   ; 10 байт - 80 бит

SECTION .data
msg1        DB      'Please enter your name: ', 0h
msg2        DB      'Hello, ', 0h

SECTION .text
global _start

_start:
    mov     eax, msg1
    call    sprint

    mov     edx, 255
    mov     ecx, sinput
    mov     ebx, 0
    mov     eax, 3
    int     80h

    mov     eax, msg2
    call    sprint
    mov     eax, sinput
    call    sprint

    call    quit
