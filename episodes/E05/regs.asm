; regs.asm - watch the registers, one instruction at a time
global _start

section .text
_start:
    mov rax, 0x1122334455667788
    mov al, 0xAA        ; write 8 bits
    mov ax, 0xBBBB      ; write 16 bits
    mov eax, 0xCCCCCCCC ; write 32 bits
    mov rbx, rax        ; copy all 64 bits
    mov eax, 60
    xor edi, edi
    syscall
