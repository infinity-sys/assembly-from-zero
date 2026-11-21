; less.asm - is -1 less than 1? Ask two ways.
global _start

section .text
_start:
    mov rax, -1         ; a = -1
    mov rbx, 1          ; b = 1
    xor ecx, ecx        ; RCX = 0 (signed answer)
    xor edx, edx        ; RDX = 0 (unsigned answer)
    cmp rax, rbx        ; a - b: flags only
after_cmp:
    jge skip_s          ; signed: a >= b? skip
    mov ecx, 1          ; signed says a < b
skip_s:
    jae skip_u          ; unsigned: a >= b? skip
    mov edx, 1          ; unsigned says a < b
skip_u:
    mov eax, 60         ; exit(0)
    xor edi, edi
    syscall
