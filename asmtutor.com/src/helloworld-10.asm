%include 'functions.asm'

SECTION .text
global _start

_start:
    mov     ecx, 0      ; Инициализация счетчика нулём

nextNumber:
    inc     ecx         ; Инкремент счетчика на 1

    mov     eax, ecx
    add     eax, 48     ; Необходимо перевести число в строку ASCII добавив 48
    push    eax
    mov     eax, esp
    call    sprintLF    ; Вывод числа с LF символом на конце

    pop     eax         ; Почистить стек от предыдущего значения EAX
    cmp     ecx, 10     ; Текущий счетчик равен 10?
    jne     nextNumber

    call    quit

