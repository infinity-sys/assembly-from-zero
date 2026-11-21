; ans.asm - E10 mini exam, the three solutions
global _start

section .text
_start:
    mov al, 0x60        ; 1: 0x60 + 0x50
    add al, 0x50
m1:
    mov rax, -1         ; 2: RAX after mov al, 0
    mov al, 0
m2:
    mov al, 0x81        ; 3: 0x81 sar 1
    sar al, 1
m3:
    mov eax, 60         ; exit(0)
    xor edi, edi
    syscall
