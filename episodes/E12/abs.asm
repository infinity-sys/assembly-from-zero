; abs.asm - E11 your turn: abs(x) with one jump
global _start

section .text
_start:
    mov rax, -7         ; x = -7
    test rax, rax       ; flags from x: SF = 1 if negative
    jns done            ; SF = 0: not negative, skip neg
    neg rax             ; negative: flip the sign
done:
    mov rdi, rax        ; exit status = abs(x)
    mov eax, 60         ; exit
    syscall
