%include "defines.inc"

section	.data
    msg db "Allocated 16 kb of memory!", 0xA, 0xD
    len equ $ - msg

section .text
    global _start

_start:
    sys_call SYS_BRK, 0, 0, 0
    
    ; number of bytes to be reserved
    add eax, 16384
    mov ebx, eax
    sys_call SYS_BRK, ebx, 0, 0

    cmp	eax, 0
    jl	exit        ;exit, if error 
    mov	edi, eax    ;EDI = highest available address
    sub	edi, 4      ;pointing to the last DWORD  
    mov	ecx, 4096   ;number of DWORDs allocated
    xor	eax, eax    ;clear eax
    std             ;backward
    rep	stosd       ;repete for entire allocated area
    cld             ;put DF flag to normal state
	
    sys_call SYS_WRITE, STDOUT, msg, len

exit:
    sys_exit
