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

; Функция вызывает SYS_EXIT
quit:
    mov     ebx, 0
    mov     eax, 1
    int     80h
    ret
