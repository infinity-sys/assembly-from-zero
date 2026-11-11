; div0.asm - unsigned divide by zero: SIGFPE
global _start

section .text
_start:
    mov rax, 1
    xor rdx, rdx
    xor rbx, rbx               ; divisor = 0
    div rbx                    ; Floating point exception
    mov eax, 60
    xor edi, edi
    syscall
