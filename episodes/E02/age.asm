; age.asm - our first program: exit with my age
global _start

section .text
_start:
    mov eax, 60     ; 60 = the "exit" system call
    mov edi, 21     ; my age
    syscall         ; ask Linux to do it
