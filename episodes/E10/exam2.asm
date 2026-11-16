; exam2.asm - exam practice I, part 2: flags
global _start

section .text
_start:
    mov al, 0x80        ; Q5: 0x80 + 0x80
    add al, 0x80
q5:
    mov al, 5           ; Q6: 5 - 7
    sub al, 7
q6:
    stc                 ; Q7: CF = 1 first
    mov al, 0x7F
    inc al              ; 0x7F + 1
q7:
    mov al, 0x96        ; Q8: 1001 0110
    shl al, 1
q8:
    mov eax, 60         ; exit(0)
    xor edi, edi
    syscall
