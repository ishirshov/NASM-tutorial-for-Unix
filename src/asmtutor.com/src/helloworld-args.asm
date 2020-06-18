%include 'functions.asm'

SECTION .text
global _start

_start:
    pop     ecx         ; Первое значение из стека будет указывать на
                        ; количество аргументов переданных при вызове программы

nextArg:
    cmp     ecx, 0h     ; Проверить количество необработанных аргументов
    jz      noMoreArgs  ; Количество аргументов равно нулю?
    pop     eax
    call    sprintLF
    dec     ecx         ; Уменьшить счетчик необработанных аргументов
    jmp     nextArg

noMoreArgs:
    call    quit
