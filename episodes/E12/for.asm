; for.asm - for (i = 1; i <= N; i++) sum += i;
%ifndef N
%define N 10            ; build with -dN=0 to try N = 0
%endif
global _start

section .text
_start:
    mov rax, 0          ; sum = 0
    mov rcx, 1          ; init: i = 1
    jmp cond            ; test before the first run
body:
    add rax, rcx        ; body: sum += i
    inc rcx             ; step: i++
cond:
    cmp rcx, N          ; condition: i <= N?
    jle body            ; yes: run the body again
done:
    mov rdi, rax        ; exit status = sum
    mov eax, 60         ; exit
    syscall
