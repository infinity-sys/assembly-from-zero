; max.asm - the larger of two signed numbers
global _start

section .text
_start:
    mov rax, 42         ; a = 42
    mov rbx, 17         ; b = 17
    cmp rax, rbx        ; a - b: flags only
    jge done            ; a >= b (signed)? skip
    mov rax, rbx        ; else the max is b
done:
    mov rdi, rax        ; exit status = max
    mov eax, 60         ; exit
    syscall
