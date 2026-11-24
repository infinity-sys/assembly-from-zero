# E12 · Loops in Assembly: Counting, while and for

Video: VIDEO_LINK_PLACEHOLDER

Build any program (Linux or WSL2; on macOS use the Docker lab from the main README):

```sh
nasm -f elf64 -g -F dwarf sum.asm -o sum.o && ld -o sum sum.o
./sum; echo $?
gdb -q -nx -batch -x sum.gdb ./sum          # RAX and RCX at the first 3 passes and at done
gdb -q -nx -batch -x sum_count.gdb ./sum    # how many instructions ran before done
```

The `.gdb` scripts load `show.py` (in this folder): `showregs` prints registers as
signed decimals; `showp` prints RAX, the pointer as msg + offset, and the byte at it;
`trace LABEL` prints each instruction just before it runs, until LABEL; `count LABEL`
runs one instruction at a time and prints how many ran before LABEL. Run them from this folder.

## E11 answer: abs(x) with one jump (abs.asm, abs.gdb)

`mov rax, -7`, `test rax, rax`, `jns done`, `neg rax`: the trace shows `jns` not taken and
`neg rax` running; `./abs; echo $?` prints 7. For x = +7, `jns` jumps and `neg` is skipped.

## The programs (real output, NASM 2.16.03, GDB 16.3, Debian 13 x86-64)

| File | Loop | Real result |
|---|---|---|
| sum.asm | count up: `add`, `inc`, `cmp rcx, 100`, `jle top` | RAX = 5050, RCX = 101 at done; 402 instructions; `echo $?` prints 186 |
| down.asm | count down: `add`, `dec rcx`, `jnz top` (no `cmp`: `dec` sets ZF) | RAX = 5050, RCX = 0; 302 instructions; exit 186 |
| loop.asm | `loop top` (RCX - 1, jump if RCX != 0, flags unchanged) | RAX = 5050, RCX = 0; 202 instructions; exit 186 |
| count.asm | while loop over a zero-terminated string | 13 bytes for `Hello, loops!`; `printf 'Hello, loops!' \| wc -c` also prints 13 |
| for.asm | for loop: init, `jmp cond`, body, step, test at the bottom | N = 10: exit 55; `nasm -f elf64 -dN=0 for.asm` gives a build whose body never runs: exit 0 |

Why 186? The exit status is only one byte: 5050 = 0x13BA, and the shell keeps 0xBA = 186.
Read big results in GDB, not with `echo $?`.

Build the N = 0 version of for.asm and trace it:

```sh
nasm -f elf64 -g -F dwarf -dN=0 for.asm -o for0.o && ld -o for0 for0.o
gdb -q -nx -batch -x for.gdb ./for0
```

## C loops in assembly

| C | Assembly shape |
|---|---|
| `do { body } while (cond);` | body, then test at the bottom: runs at least once (sum.asm) |
| `while (cond) { body }` | test at the top, `je done`, body, `jmp top`: can run zero times (count.asm) |
| `for (init; cond; step) body` | init, `jmp cond`, body, step, `cond:` test, jump back if true (for.asm) |

## Your turn (answer in E13)

Compute 10! = 1 x 2 x ... x 10 with a loop (`imul rax, rcx`, `dec rcx`, `jnz`), starting
with RAX = 1. Check RAX in GDB: it should be 3628800 (too big for the one-byte exit status).
