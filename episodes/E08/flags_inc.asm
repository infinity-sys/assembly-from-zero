; flags_inc.asm - inc, dec, neg; INC leaves CF
global _start

section .text
_start:
    ; INC does not change CF. STC, then inc 5
    stc
    mov al, 5
    inc al
after_inc5:

    ; INC of 0xFF → 0. ZF=1, CF stays 0
    clc
    mov al, 0xFF
    inc al
after_incff:

    ; DEC of 1 → 0. ZF=1
    mov al, 1
    dec al
after_dec:

    ; NEG 5 → 0xFB (-5). CF=1, SF=1
    mov al, 5
    neg al
after_neg5:

    ; NEG 0 → 0. CF=0, ZF=1
    mov al, 0
    neg al
after_neg0:

    mov eax, 60
    xor edi, edi
    syscall
