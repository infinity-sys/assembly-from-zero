; bench.asm - sum the bytes >= 128 of a 1 MiB buffer, 100 times
; build: nasm -f elf64 [-dRANDOM] [-dCMOV] bench.asm
global _start
SIZE equ 1048576        ; 1 MiB of bytes
REPS equ 100            ; passes over the buffer

section .bss
buf:    resb SIZE

section .text
_start:
    mov rsi, buf        ; fill the buffer
    mov ecx, SIZE
    mov ebx, 12345      ; random seed
fill:
%ifdef RANDOM
    imul ebx, ebx, 1103515245
    add ebx, 12345      ; next random number
    mov eax, ebx
    shr eax, 24         ; its top byte: 0..255
%else
    mov eax, ecx        ; a pattern: runs of 128 big
    and eax, 255        ; bytes, then 128 small ones
%endif
    mov [rsi], al
    inc rsi
    dec ecx
    jnz fill

    xor eax, eax        ; sum = 0
    xor r8d, r8d        ; r8 = 0, for cmov
    mov r9d, REPS
again:
    mov rsi, buf
    mov ecx, SIZE
next:
    movzx edx, byte [rsi]   ; x = the byte
    cmp edx, 128
%ifdef CMOV
    cmovb edx, r8d      ; x < 128? x = 0
%else
    jb skip             ; x < 128? skip the add
%endif
    add rax, rdx        ; sum += x
skip:
    inc rsi
    dec ecx
    jnz next
    dec r9d
    jnz again
done:
    mov rdi, rax        ; exit status = sum (low byte)
    mov eax, 60
    syscall
