; noexit.asm - hello, but we forgot to exit
global _start

section .data
msg:    db "Hello, World!", 10
len     equ $ - msg

section .text
_start:
    mov eax, 1
    mov edi, 1
    mov rsi, msg
    mov edx, len
    syscall
    ; no exit here!
