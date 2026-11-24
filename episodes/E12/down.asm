; down.asm - the same sum, counting down: dec + jnz
global _start

section .text
_start:
    mov rax, 0          ; sum = 0
    mov rcx, 100        ; i = 100
top:
    add rax, rcx        ; sum += i
    dec rcx             ; i--: ZF = 1 when i reaches 0
    jnz top             ; i != 0? go again
done:
    mov rdi, rax        ; exit status = sum
    mov eax, 60         ; exit
    syscall
