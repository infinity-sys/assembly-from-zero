; fact.asm - the E12 answer: 10! = 1 x 2 x ... x 10
global _start

section .text
_start:
    mov rax, 1          ; product = 1
    mov rcx, 10         ; i = 10
top:
    imul rax, rcx       ; product *= i
    dec rcx             ; i--: ZF = 1 when i reaches 0
    jnz top             ; i != 0? go again
done:
    mov rdi, rax        ; exit status = product
    mov eax, 60         ; exit
    syscall
