; ans.asm - E09 answer: 13 * 10 with shl and add,
;           then the top 4 bits of 0xB7
global _start

section .text
_start:
    mov rax, 13         ; x = 13
    mov rbx, rax        ; a copy: RBX = 13
    shl rax, 3          ; RAX = 13 * 8
    shl rbx, 1          ; RBX = 13 * 2
    add rax, rbx        ; RAX = 13*8 + 13*2
after_mul10:
    mov al, 0xB7        ; 1011 0111
    shr al, 4           ; move the top 4 bits down
after_top4:
    mov eax, 60         ; exit(0)
    xor edi, edi
    syscall
