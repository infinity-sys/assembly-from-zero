; hello.asm - print one line, then exit
global _start

section .data
msg:    db "Hello, World!", 10  ; 13 chars + newline
len     equ $ - msg             ; 14

section .text
_start:
    mov eax, 1      ; syscall 1 = write
    mov edi, 1      ; fd 1 = stdout
    mov rsi, msg    ; address of the text
    mov edx, len    ; how many bytes
    syscall         ; write(1, msg, 14)

    mov eax, 60     ; syscall 60 = exit
    xor edi, edi    ; status 0
    syscall         ; exit(0)
