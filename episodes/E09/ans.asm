; ans.asm - E08 answer: (13 * 7) / 5
global _start

section .text
_start:
    mov rax, 13         ; a
    mov rbx, 7          ; b
    mul rbx             ; RDX:RAX = 13 * 7
after_mul:
    xor rdx, rdx        ; high half = 0
    mov rbx, 5          ; c
    div rbx             ; RAX = quot, RDX = rem
after_div:
    mov eax, 60         ; exit
    xor edi, edi
    syscall
