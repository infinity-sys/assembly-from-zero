; data.asm - bytes we choose, nothing else
db 0x41             ; one byte: 65, the letter A
db 66, 'C', 10      ; decimal 66, a character, newline
dw 0x1234           ; a word: 2 bytes
dd 0x12345678       ; a dword: 4 bytes
dq 1                ; a qword: 8 bytes
