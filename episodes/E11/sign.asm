; sign.asm - zero, positive or negative? (test)
global _start

section .text
_start:
    mov rax, -5         ; x = -5
    mov edi, 0          ; status 0: zero
    test rax, rax       ; x AND x: flags only
    jz done             ; ZF = 1: x is zero
    mov edi, 1          ; status 1: positive
    jns done            ; SF = 0: x is positive
    mov edi, 2          ; status 2: negative
done:
    mov eax, 60         ; exit(status)
    syscall
