; modes.asm - immediate, register and memory operands
global _start

section .data
table:  dq 10, 20, 30, 40, 50, 60  ; 6 qwords, 8 bytes each

section .text
_start:
    mov rax, 7                 ; immediate
    mov rbx, rax               ; register
    mov rcx, [table]           ; memory: 10
    lea rsi, [table]           ; rsi = address of table
    mov rdx, [rsi + 16]        ; base + disp: 30
    mov rdi, 3                 ; an index
    mov r8, [rsi + rdi*8]      ; base + index*8: 40
    mov r9, [rsi + rdi*8 + 8]  ; + disp: 50
    mov byte [rsi], 0xff       ; 1 byte only
    mov dword [rsi + 8], 0x11223344  ; 4 bytes

    mov eax, 60                ; exit
    xor edi, edi
    syscall
