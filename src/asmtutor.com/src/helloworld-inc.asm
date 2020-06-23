%include 'functions.asm'

; Так как строки в памяти расположены линейно, т.е. друг
; за дружкой sprint выводит строки пока не обнаружит символ
; конца строки.
SECTION .data
msg1     db      'Hello, low level world!', 0Ah, 0h         ; Нультерминальный символ
msg2     db      'This is now we recycle in NASM', 0Ah, 0h  ; Нультерминальный символ

SECTION .text
global _start

_start:
    mov     eax, msg1
    call    sprint

    mov     eax, msg2
    call    sprint

    call    quit
