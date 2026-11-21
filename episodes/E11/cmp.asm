; cmp.asm - cmp subtracts, keeps only the flags
global _start

section .text
_start:
    mov rax, 5          ; a = 5
    mov rbx, 7          ; b = 7
    cmp rax, rbx        ; 5 - 7: flags only
c1:
    cmp rax, 5          ; 5 - 5
c2:
    cmp rbx, rax        ; 7 - 5
c3:
    mov eax, 60         ; exit(0)
    xor edi, edi
    syscall
