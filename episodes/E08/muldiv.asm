; muldiv.asm - mul, div, imul and RDX:RAX
global _start

section .text
_start:
    ; unsigned 7 * 6 = 42. Fits in RAX, so RDX=0, CF=OF=0
    mov rax, 7
    mov rbx, 6
    mul rbx
after_mul42:

    ; 2^63 * 2 = 2^64. RDX=1, RAX=0, CF=OF=1
    mov rax, 0x8000000000000000
    mov rbx, 2
    mul rbx
after_mul64:

    ; 8-bit: 20 * 20 = 400 = 0x0190. AH=1, so CF=OF=1
    mov al, 20
    mov bl, 20
    mul bl
after_mul8:

    ; unsigned 100 / 7 = 14 remainder 2
    mov rax, 100
    xor rdx, rdx
    mov rbx, 7
    div rbx
after_div:

    ; two-operand imul: -3 * 7 = -21, stays in RAX
    mov rax, -3
    imul rax, 7
after_imul:

    mov eax, 60
    xor edi, edi
    syscall
