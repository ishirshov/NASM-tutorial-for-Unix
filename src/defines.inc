%ifndef DEFINES_INC
    %define SYS_EXIT    1
    %define SYS_FORK    2
    %define SYS_READ    3
    %define SYS_WRITE   4
    %define SYS_OPEN    5
    %define SYS_CLOSE   6
    %define SYS_CREATE  8
    %define SYS_LSEEK   19
    %define SYS_BRK     45

    %define STDIN       0
    %define STDOUT      1
    %define STDERR      2

    %macro sys_call 4
        mov eax, %1 ; call name
        mov ebx, %2 ; file descriptor
        mov ecx, %3 ; address of input buffer
        mov edx, %4 ; size of input buffer 
        int 80h     ; invoke syscall
    %endmacro

    %macro sys_exit 0
        mov eax, SYS_EXIT
        xor ebx, ebx
        int 80h
    %endmacro

%endif