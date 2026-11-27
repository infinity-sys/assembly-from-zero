; less.asm - is a < b? 1 or 0, with no jump: setl
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
    setl al             ; AL = 1 if a < b, else 0
    movzx edi, al       ; RDI = AL, upper bits zero
done:
    mov eax, 60         ; exit, status = RDI
    syscall
