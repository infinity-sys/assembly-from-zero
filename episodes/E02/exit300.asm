; exit300.asm - our first program: exit with 300?
global _start

section .text
_start:
    mov eax, 60     ; 60 = the "exit" system call
    mov edi, 300    ; too big for one byte
    syscall         ; ask Linux to do it
