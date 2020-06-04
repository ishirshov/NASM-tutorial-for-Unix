SECTION .data
msg     db      'Hello, brave new world!', 0Ah

SECTION .text
global _start

_start:
    
    mov eax, msg        ; Используем адрес строки msg для подсчета длины

nextchar:
    cmp byte [eax], 0   ; Ищем терминальный символ 0 в конце строки
    jz  finished        ; Если ZF флаг был установлен то переходим к метке finished
    inc eax             ; Применяем адресную арифметику для смещения "указателя" на текущий символ строки
    jmp nextchar        ; Безусловный переход в метке nextchar

finished:
    sub eax, msg        ; Подсчет длины строки в байтах используя начальный адрес строки

    mov edx, eax        ; В EAX находится длина строки в байтах 
    mov ecx, msg
    mov ebx, 1
    mov eax, 4
    int 80h

    mov ebx, 0
    mov eax, 1
    int 80h
