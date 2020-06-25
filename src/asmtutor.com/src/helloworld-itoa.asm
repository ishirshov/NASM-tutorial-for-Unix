%include 'functions.asm'

SECTION .text
global _start

_start:
    mov     ecx, 0      ; Инициализация счетчика нулём

nextNumber:
    inc     ecx         ; Инкремент счетчика на 1

    mov     eax, ecx
    call    iprintLF    ; Вызов функции itoa
    cmp     ecx, 10     ; Текущий счетчик равен 10?
    jne     nextNumber

    call    quit

