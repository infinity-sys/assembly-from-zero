; sum.asm - 1 + 2 + ... + 100, counting up
global _start

section .text
_start:
    mov rax, 0          ; sum = 0
    mov rcx, 1          ; i = 1
top:
    add rax, rcx        ; sum += i
    inc rcx             ; i++
    cmp rcx, 100        ; i - 100: flags only
    jle top             ; i <= 100? go again
done:
    mov rdi, rax        ; exit status = sum
    mov eax, 60         ; exit
    syscall
