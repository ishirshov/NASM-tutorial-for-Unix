SECTION .data
msg     db      'Hello, brave new world!', 0Ah

SECTION .text
global _start

_start:
    
    mov     eax, msg    ; Копируем адрес строки msg в EAX
    call    strlen      ; Вызываем функцию для подсчета строки

    mov     edx, eax    ; Результат вычисления будет доступен в EAX
    mov     ecx, msg
    mov     ebx, 1
    mov     eax, 4
    int     80h

    xor     ebx, ebx
    mov     eax, 1
    int     80h

strlen:
    push    ebx             ; Переместим содержимое регистра в стек.
    mov     ebx, eax        ; Используем адрес строки для начала отсчета.

nextchar:
    cmp     byte [eax], 0
    jz      finished
    inc     eax
    jmp     nextchar

finished:
    sub     eax, ebx        ; Подсчитываем длину строки в байтах.
    pop     ebx             ; Возвращаем сохраненное значение из стека обратно в ebx.
    ret                     ; В LIFO стеке так же сохранен адрес возврата, ret использует
                            ; значение в стеке для возврата управления в место использования
                            ; call инструкции.
