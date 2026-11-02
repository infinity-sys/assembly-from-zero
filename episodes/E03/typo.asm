; typo.asm - our first program: exit with code 42
global _start

section .text
_start:
    mvo eax, 60     ; 60 = the "exit" system call
    mov edi, 42     ; the exit code we want
    syscall         ; ask Linux to do it
