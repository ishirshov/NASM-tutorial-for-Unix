%include "defines.inc"

section .data
    achar db '0'

section .text
    global _start

_start:
    mov ecx, 10h
    rdmsr
    sys_exit