%include "defines.inc"

section .bss
    fd_out resb 1   ; File descriptor is ID of file
    fd_in resb 1
    buffer resb 30

section .data
    file_name db "test.txt", 0x0

    msg_done db "Written to file", 0xA, 0xD
    len_done equ $ - msg_done

    msg_err db "File cannot be open!", 0xA, 0xD
    len_err equ $ - msg_err

    message db "Checking kernel's file API", 0xA, 0xD
    msg_len equ $ - message

section .text
    global _start

is_open:
    cmp eax, 0
    jle error_occured
    mov [fd_out], eax
    ret

error_occured:
    sys_call SYS_WRITE, STDERR, msg_err, len_err
    jmp exit

_start:
    ; 0000 = 4 octets
    ; 0 octet - setuid, setgid, sticky bit
    ; 1 octet - Owner permissions
    ; 2 octet - Group permissions
    ; 3 octet - Other permissions

    ; Description:
    ; 0	No permission	---
    ; 1	Execute permission	--x
    ; 2	Write permission	-w-
    ; 3	Execute and write permission: 1 (execute) + 2 (write) = 3	-wx
    ; 4	Read permission	r--
    ; 5	Read and execute permission: 4 (read) + 1 (execute) = 5	r-x
    ; 6	Read and write permission: 4 (read) + 2 (write) = 6	rw-
    ; 7	All permissions: 4 (read) + 2 (write) + 1 (execute) = 7	rwx
    sys_call SYS_CREATE, file_name, 0777, 0
    call is_open ; Check if file is open

    sys_call SYS_WRITE, [fd_out], message, msg_len

    ; Trying to close file
    sys_call SYS_CLOSE, [fd_out], 0, 0
    sys_call SYS_WRITE, STDOUT, msg_done, len_done

    ; And re-open
    ; read-only (0), write-only (1), and read-write (2).
    sys_call SYS_OPEN, file_name, 0, 0777
    call is_open ; Check if file is open
    mov [fd_in], eax

    sys_call SYS_READ, [fd_in], buffer, msg_len
    sys_call SYS_CLOSE, [fd_out], 0, 0

    ; Print out result
    sys_call SYS_WRITE, STDOUT, buffer, msg_len

    ; The reference position could be:
    ; 
    ; 0 - Beginning of file
    ; 1 - Current position
    ; 2 - End of file
    ;sys_call SYS_LSEEK, eax, 5, 0

exit:
    sys_exit