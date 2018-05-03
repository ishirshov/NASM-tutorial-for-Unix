section .data           ; Data segment section
    usr_msg db 'Please enter a number: '
    len_usr_msg equ $-usr_msg
    disp_msg db 'You have entered: '
    len_disp_msg equ $-disp_msg

section .bss            ; Section of uninitialized data
    num resb 5

section .text           ; Code segment
    global _start

_start:
    ; User prompt
    mov eax, 4              ; enable sys_write
    mov ebx, 1              ; descriptor of file (stdout)
    mov ecx, usr_msg        ; data
    mov edx, len_usr_msg    ; data
    int 80h                 ; call kernel

    ; Read and store the user input
    mov eax, 3              ; enable sys_read
    mov ebx, 2              ; this is stdin descriptor
    mov ecx, num            ; pass the buffer
    mov edx, 5              ; the length of the num
    int 80h                 ; call kernel

    ; Output the message
    mov eax, 4              
    mov ebx, 1              
    mov ecx, disp_msg       
    mov edx, len_disp_msg   
    int 80h                 

    ; Out the entered number
    mov eax, 4
    mov ebx, 1
    mov ecx, num
    mov edx, 5
    int 80h

    ; Exit
    mov eax, 1              ; sys_exit
    mov ebx, 0
    int 80h