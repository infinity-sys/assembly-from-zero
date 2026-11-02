; nostart.asm - our first program: exit with code 42
global main

section .text
main:
    mov eax, 60     ; 60 = the "exit" system call
    mov edi, 42     ; the exit code we want
    syscall         ; ask Linux to do it
