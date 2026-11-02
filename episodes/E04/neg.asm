; neg.asm - one byte, two meanings, two flags
global _start

section .text
_start:
    mov al, 0xFF    ; 255, or -1
    add al, 1       ; unsigned wraps: carry
    mov al, 0x7F    ; 127, the biggest signed byte
    add al, 1       ; signed wraps: overflow
    mov eax, 60     ; exit
    xor edi, edi    ; code 0
    syscall
