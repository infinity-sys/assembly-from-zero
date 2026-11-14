; shifts.asm - shl, shr, sar
global _start

section .text
_start:
    mov al, 5           ; 0000 0101
    shl al, 3           ; times 8
after_shl:
    mov al, 200         ; 1100 1000
    shr al, 2           ; unsigned / 4
after_shr:
    mov al, -20         ; 1110 1100
    sar al, 2           ; signed / 4
after_sar:
    mov al, -20
    shr al, 2           ; wrong for signed
after_shr_neg:
    mov al, 0x81        ; 1000 0001
    shl al, 1           ; bit 7 falls out
after_shl_cf:
    mov al, -7          ; 1111 1001
    sar al, 1           ; rounds down
after_sar7:
    mov eax, 60
    xor edi, edi
    syscall
