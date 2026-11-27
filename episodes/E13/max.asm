; max.asm - max(a, b) with no jump: cmovl
%ifndef A
%define A 3             ; a = 3 unless the build says
%endif
%ifndef B
%define B 9             ; b = 9 unless the build says
%endif
global _start

section .text
_start:
    mov rax, A          ; rax = a
    mov rbx, B          ; rbx = b
    cmp rax, rbx        ; a - b: flags only
    cmovl rax, rbx      ; a < b? rax = b (else: no change)
done:
    mov rdi, rax        ; exit status = max
    mov eax, 60         ; exit
    syscall
