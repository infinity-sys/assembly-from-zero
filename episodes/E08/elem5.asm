; elem5.asm - E07 answer: load table[5] into RAX
global _start

section .data
table:  dq 10, 20, 30, 40, 50, 60

section .text
_start:
    lea rsi, [table]           ; base = start of the table
    mov rdi, 5                 ; the index
    mov rax, [rsi + rdi*8]     ; element 5 → 60
    mov eax, 60                ; exit
    xor edi, edi
    syscall
