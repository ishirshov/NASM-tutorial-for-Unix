%include 'functions.asm'

SECTION .text
global _start

_start:
    mov     ecx, 0      ; Инициализация счетчика нулём

nextNumber:
    inc     ecx         ; Инкремент счетчика на 1

    mov     eax, ecx
    add     eax, 48     ; Перевести число в символ ASCII (см. Таблицу кодировки ASCII)
    push    eax         ; Сохранить символ в стеке
    mov     eax, esp    ; Использовать указатель на вершину стека
    call    sprintLF

    pop     eax         ; Удалить старый символ из стека
    cmp     ecx, 10     ; Текущий счетчик равен 10?
    jne     nextNumber

    call    quit

