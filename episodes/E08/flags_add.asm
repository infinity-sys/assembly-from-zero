; flags_add.asm - add, sub and the four flags
global _start

section .text
_start:
    ; 0xFF + 1 = 0x00: unsigned wrap
    mov al, 0xFF
    add al, 1
after_add_wrap:

    ; 0x7F + 1 = 0x80: signed overflow
    mov al, 0x7F
    add al, 1
after_add_ov:

    ; 0x00 - 1 = 0xFF: borrow
    mov al, 0
    sub al, 1
after_sub:

    mov eax, 60
    xor edi, edi
    syscall
