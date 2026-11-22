# E11 · Comparing and Jumping: cmp, test and Conditional Jumps

Video: https://youtu.be/vj2mEezMNQw

Build any program (Linux or WSL2; on macOS use the Docker lab from the main README):

```sh
nasm -f elf64 -g -F dwarf max.asm -o max.o && ld -o max max.o
./max; echo $?
gdb -q -nx -batch -x max.gdb ./max
```

The `.gdb` scripts load `show.py` (in this folder): `showal` prints AL in hex, as
8 bits, unsigned (u=), signed (s=) and the flags; `showrax` prints RAX in hex;
`showcmp` prints registers as signed decimals and the flags; `trace LABEL`
prints each instruction just before it runs, until LABEL. Run them from this folder.

## E10 mini exam solutions (ans.asm, ans.gdb)

1. `mov al, 0x60; add al, 0x50`: AL = 0xb0 (u=176, s=-80), eflags `[ SF IF OF ]`: no CF, OF set.
2. `mov rax, -1; mov al, 0`: RAX = 0xffffffffffffff00 (only the low byte changes).
3. `mov al, 0x81; sar al, 1`: AL = 0xc0 (-64), eflags `[ CF PF SF IF ]`: CF = the bit pushed out.

## The programs (real output, NASM 2.16.03, GDB 16.3, Debian 13 x86-64)

| File | What it shows | Real result |
|---|---|---|
| cmp.asm | `cmp` = `sub` without the result (RAX = 5, RBX = 7) | 5 - 7: `[ CF AF SF IF ]`; 5 - 5: `[ PF ZF IF ]`; 7 - 5: `[ IF ]`; RAX and RBX unchanged |
| max.asm | max(42, 17) with `cmp` + `jge` | the trace skips `mov rax, rbx`; `./max; echo $?` prints 42 |
| less.asm | is -1 less than 1? one `cmp`, two jumps | after cmp `[ SF IF ]`; signed `jge` not taken: RCX = 1 (less); unsigned `jae` taken: RDX = 0 (not below) |
| sign.asm | zero, positive or negative? `test rax, rax` + `jz` + `jns` | x = -5: both jumps fall through; `./sign; echo $?` prints 2 |

NASM assembles `mov rax, 42` as the shorter `mov eax, 42` (writing EAX zeros the top
half, so RAX is the same), and GDB shows `jz` as `je`: two names, one instruction.

## Conditional jumps after `cmp a, b`

| Condition | Signed | Unsigned | Flags |
|---|---|---|---|
| a == b | `je` (`jz`) | `je` (`jz`) | ZF = 1 |
| a != b | `jne` (`jnz`) | `jne` (`jnz`) | ZF = 0 |
| a < b | `jl` | `jb` | jl: SF != OF · jb: CF = 1 |
| a <= b | `jle` | `jbe` | |
| a > b | `jg` | `ja` | |
| a >= b | `jge` | `jae` | |

Less / greater = signed; below / above = unsigned.

## Your turn (answer in E12)

Write abs(x) with one jump: put -7 in RAX, make it positive if it is negative
(`test rax, rax`, `jns`, `neg`), and return it as the exit status. `echo $?` should print 7.
