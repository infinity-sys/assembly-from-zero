; count.asm - count the bytes of a text: a while loop
global _start

section .data
msg:    db "Hello, loops!", 0   ; the text, then a 0 byte

section .text
_start:
    mov rsi, msg        ; p = address of the first byte
    mov rax, 0          ; count = 0
top:
    cmp byte [rsi], 0   ; the byte at p: is it 0?
    je done             ; yes: end of text, leave
    inc rax             ; count++
    inc rsi             ; p++: the next byte
    jmp top             ; back to the test
done:
    mov rdi, rax        ; exit status = count
    mov eax, 60         ; exit
    syscall
