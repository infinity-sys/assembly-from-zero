; ans.asm - the E05 exercise: mov rax, -1 then mov eax, 1
global _start

section .text
_start:
    mov rax, -1     ; all 64 bits = 1
    mov eax, 1      ; a 32-bit write
    mov rax, -1     ; all ones again
    mov ax, 1       ; bonus: a 16-bit write
    mov eax, 60
    xor edi, edi
    syscall
