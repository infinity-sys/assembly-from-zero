; loop.asm - the same sum with the loop instruction
global _start

section .text
_start:
    mov rax, 0          ; sum = 0
    mov rcx, 100        ; i = 100 (loop always uses RCX)
top:
    add rax, rcx        ; sum += i
    loop top            ; RCX--, then jump if RCX != 0
done:
    mov rdi, rax        ; exit status = sum
    mov eax, 60         ; exit
    syscall
