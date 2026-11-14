; case.asm - toggle the case of letters
global _start

section .data
msg: db "Hello", 10     ; 5 letters + newline

section .text
_start:
    xor byte [msg], 0x20      ; H -> h
    xor byte [msg+1], 0x20    ; e -> E
    xor byte [msg+2], 0x20    ; l -> L
    xor byte [msg+3], 0x20    ; l -> L
    xor byte [msg+4], 0x20    ; o -> O
    mov eax, 1                ; write
    mov edi, 1                ; stdout
    lea rsi, [msg]
    mov edx, 6                ; 6 bytes
    syscall
    mov eax, 60               ; exit
    xor edi, edi
    syscall
