; noexit.asm - a classic mistake: no exit call
global _start

section .text
_start:
    mov edi, 42     ; we set an exit code...
                    ; ...but never call exit
