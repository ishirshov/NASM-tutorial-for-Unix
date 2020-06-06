; Функция подсчитывает длину строку C формата
slen:
    push    ebx
    mov     ebx, eax

nextchar:
    cmp     byte [eax], 0
    jz      finished
    inc     eax
    jmp     nextchar

finished:
    sub     eax, ebx
    pop     ebx
    ret

; Функция вывод строку в стандартный поток вывода
sprint:
    push    edx         ; В начале использования функции сохраним все актуальные
    push    ecx         ; значения регистров EAX, EBX, ECX, EDX
    push    ebx
    push    eax         ; В частности необходимо сохранить оригинальный адрес строки
    call    slen

    mov     edx, eax    ; Используем значение EAX - длина строки 
    pop     eax         ; Восстанавливаем оригинальный адрес строки
    mov     ecx, eax
    mov     ebx, 1
    mov     eax, 4
    int     80h

    pop     ebx
    pop     ecx
    pop     edx
    ret

; Функция выводит строку с LF символом на конце '\n'
sprintLF:
    call    sprint

    push    eax         ; Поместим оригинальное значение в стек 
    mov     eax, 0Ah    ; LF символ так же будет помещен в стек

    push    eax         ; Хоть можно использовать LF напрямую из EAX регистра,
    mov     eax, esp    ; но в данном примере можно использовать адрес в стеке,
                        ; который указывает на символ

    call    sprint      
    pop     eax         ; Восстановить значение сообщение из стека, убрав LF символ
    pop     eax
    ret

; Функция вызывает SYS_EXIT
quit:
    mov     ebx, 0
    mov     eax, 1
    int     80h
    ret
