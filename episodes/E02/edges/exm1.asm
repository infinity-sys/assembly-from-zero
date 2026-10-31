; exit42.asm - our first program: exit with code 42
global _start

section .text
_start:
    mov eax, 60     ; 60 = the "exit" system call
    mov edi, -1
    syscall         ; ask Linux to do it
