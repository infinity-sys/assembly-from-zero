; sizeerr.asm - how big is the memory operand?
global _start

section .data
table:  dq 10, 20, 30

section .text
_start:
    lea rsi, [table]
    mov [rsi], 1          ; byte? word? dword? qword?
