; Функция atoi переводит символ в число
atoi:
    push    ebx
    push    ecx
    push    edx
    push    esi
    mov     esi, eax
    mov     eax, 0
    mov     ecx, 0

.multiplyLoop:
    xor     ebx, ebx
    mov     bl, [esi+ecx]
    cmp     bl, 48
    jl      .finished
    cmp     bl, 57
    jg      .finished

    sub     bl, 48
    add     eax, ebx
    mov     ebx, 10
    mul     ebx
    inc     ecx
    jmp     .multiplyLoop

.finished:
    mov     ebx, 10
    div     ebx
    pop     esi
    pop     edx
    pop     ecx
    pop     ebx
    ret

; Функция itoa переводит числа в строку и выводит на экран
iprint:
    push    eax
    push    ecx
    push    edx
    push    esi
    mov     ecx, 0      ; Счетчик количества байт для вывода

divideLoop:
    inc     ecx
    mov     edx, 0
    mov     esi, 10     ; Поместить делитель в регистр ESI
    idiv    esi         ; Выполнить деление со знаком. Целая часть будет находиться в 
                        ; EAX, остаток от деления в EDX 
    add     edx, 48     ; Остаток перевести в ASCII символ
    push    edx         ; Поместить символ в стек
    cmp     eax, 0      ; Проверить, может ли EAX еще раз поделить?
    jnz     divideLoop

printLoop:
    dec     ecx         ; Выводить символы по порядку
    mov     eax, esp    ; Поместить указатель на стек для печати
    call    sprint
    pop     eax         ; Убрать последний символ из стека для печати следующего
    cmp     ecx, 0      ; Если нечего больше печатать ECX==0 выйти из функции
    jnz     printLoop

    pop     esi
    pop     edx
    pop     ecx
    pop     eax
    ret

; Функция itoaLF вывод число как сторку с LF символом на конце
iprintLF:
    call    iprint

    push    eax
    mov     eax, 0Ah
    push    eax
    mov     eax, esp
    call    sprint
    pop     eax
    pop     eax
    ret

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
