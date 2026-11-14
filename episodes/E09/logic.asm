; logic.asm - and, or, xor, not on one byte
global _start

section .text
_start:
    mov al, 0xCA        ; 1100 1010
    and al, 0x0F        ; keep the low 4 bits
after_and:
    mov al, 0xCA
    or  al, 0x0F        ; force the low 4 bits on
after_or:
    mov al, 0xCA
    xor al, 0xFF        ; flip every bit
after_xor:
    mov al, 0xCA
    not al              ; flip every bit, no flags
after_not:
    mov al, 0xCA
    and al, 0x30        ; 0011 0000: no common bits
after_and0:
    mov eax, 60
    xor edi, edi
    syscall
