; twice.asm - the E06 answer: my name twice, one write
global _start

section .data
msg:    db "Ahmed", 10, "Ahmed", 10  ; 6 + 6 bytes
len     equ $ - msg                  ; 12

section .text
_start:
    mov eax, 1          ; syscall 1 = write
    mov edi, 1          ; fd 1 = stdout
    mov rsi, msg        ; address of the bytes
    mov edx, len        ; 12 bytes
    syscall             ; one write

    mov eax, 60         ; syscall 60 = exit
    xor edi, edi        ; status 0
    syscall
