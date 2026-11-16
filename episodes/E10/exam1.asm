; exam1.asm - exam practice I, part 1:
;             numbers and registers
global _start

section .data
x:  dq 0x1122334455667788

section .text
_start:
    mov al, 0xB7        ; Q1: 0xB7 in decimal?
q1:
    mov al, -10         ; Q2: -10 as one byte?
q2:
    mov rax, -1         ; Q3: RAX after each mov?
    mov ax, 0x1234
q3a:
    mov eax, 5
q3b:
    mov al, [x + 2]     ; Q4: which byte?
q4:
    mov eax, 60         ; exit(0)
    xor edi, edi
    syscall
