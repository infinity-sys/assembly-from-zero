# E10 · Exam Practice I: Numbers, Registers and Flags

Video: https://youtu.be/ajvPTHf-yJo

Build any program (Linux or WSL2; on macOS use the Docker lab from the main README):

```sh
nasm -f elf64 -g -F dwarf exam1.asm -o exam1.o && ld -o exam1 exam1.o
gdb -q -nx -batch -x exam1.gdb ./exam1
```

The `.gdb` scripts load `show.py` (in this folder): `showal` prints AL in hex, as
8 bits, unsigned (u=), signed (s=) and the flags; `showrax` prints RAX in hex.
Run them from this folder.

## E09 answer (ans.asm, ans.gdb)

1. 13 * 10 without `mul`: `shl rax, 3` (13 * 8 = 104) plus `shl rbx, 1` (13 * 2 = 26):
   RAX = 130, RBX = 26.
2. `mov al, 0xB7; shr al, 4`: AL = 0x0b (11). OF after a shift by 4 is undefined: ignore it.

## The eight questions (real output, NASM 2.16.03, GDB 16.3, Debian 13 x86-64)

| # | File | Question | Answer (GDB) |
|---|---|---|---|
| Q1 | exam1.asm | `mov al, 0xB7`: unsigned and signed? | 1011 0111: u=183, s=-73 |
| Q2 | exam1.asm | `mov al, -10`: which bits? | 1111 0110 = 0xf6 (246 - 256 = -10) |
| Q3 | exam1.asm | `mov rax, -1; mov ax, 0x1234`, then `mov eax, 5`: RAX? | 0xffffffffffff1234, then 0x5 (writing EAX zeros the top 32 bits) |
| Q4 | exam1.asm | `x: dq 0x1122334455667788; mov al, [x + 2]` | 0x66 (little endian) |
| Q5 | exam2.asm | `0x80 + 0x80` | AL=0x00, eflags `[ CF PF ZF IF OF ]` |
| Q6 | exam2.asm | `5 - 7` | AL=0xfe (-2), `[ CF AF SF IF ]`: a borrow, no OF |
| Q7 | exam2.asm | `stc; mov al, 0x7F; inc al` | AL=0x80, `[ CF AF SF IF OF ]`: inc does not write CF |
| Q8 | exam2.asm | `0x96 shl 1` | AL=0x2c (44), `[ CF IF OF ]` |

PF (parity) and AF (adjust) are not part of these questions.

## Your turn: mini exam (solutions in E11)

1. AL = 0x60, then `add al, 0x50`: AL, CF, OF?
2. RAX = -1, then `mov al, 0`: RAX in hex?
3. AL = 0x81, then `sar al, 1`: AL and CF?

Solve them by hand first, then check in GDB.
