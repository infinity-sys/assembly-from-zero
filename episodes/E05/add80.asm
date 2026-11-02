; add80.asm - the E04 exercise: 0x80 + 0x80 in one byte
global _start

section .text
_start:
    mov al, 0x80    ; 128, or -128
    add al, 0x80    ; carry? overflow? both?
    mov eax, 60
    xor edi, edi
    syscall
