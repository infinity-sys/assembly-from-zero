; mask.asm - set, clear, toggle and test one bit
global _start

section .text
_start:
    mov al, 0x41        ; 0100 0001
    or  al, 0x08        ; set bit 3
after_set:
    and al, 0xFE        ; clear bit 0
after_clear:
    xor al, 0x80        ; toggle bit 7
after_toggle:
    test al, 0x04       ; is bit 2 set?
after_test:
    mov rax, -1         ; all 64 bits on
    xor eax, eax        ; zero the whole RAX
after_zero:
    mov eax, 60
    xor edi, edi
    syscall
