%include 'functions.asm'

SECTION .text
global _start


_start:
    pop     ecx         ; Количество аргументов в стеке
    pop     edx         ; Пропускаем первый аргумент, т.к. первый
                        ; аргумент равен названию программы

    dec     ecx
    mov     edx, 0

nextArg:
    cmp     ecx, 0h     ; Проверка счетчика аргументов на пустоту
    jz      noMoreArgs  ; Если нет больше аргументов для обработки
                        ; выполнить выход
    pop     eax         ; Выбрать следующий аргумент из стека
    call    atoi        ; Преобразовать char в int
    add     edx, eax
    dec     ecx
    jmp     nextArg

noMoreArgs:
    mov     eax, edx
    call    iprintLF
    call    quit
