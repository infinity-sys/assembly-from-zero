# E13 · Branchless Code: cmov and setcc

Video: https://youtu.be/CnGN_4R6YdU

Build any program (Linux or WSL2; on macOS use the Docker lab from the main README):

```sh
nasm -f elf64 -g -F dwarf max.asm -o max.o && ld -o max max.o
./max; echo $?
gdb -q -nx -batch -x max.gdb ./max          # each instruction as it runs, until done
```

The `.gdb` scripts load `show.py` (in this folder, the same as E12): `showregs` prints registers
as signed decimals; `trace LABEL` prints each instruction just before it runs, until LABEL;
`count LABEL` runs one instruction at a time and prints how many ran before LABEL. Run them from this folder.

`maxj.asm`, `max.asm` and `less.asm` take their inputs as constants A and B (default 3 and 9).
Pick others when you build, for example:

```sh
nasm -f elf64 -g -F dwarf -dA=9 -dB=3 max.asm -o max93.o && ld -o max93 max93.o
nasm -f elf64 -g -F dwarf -dA=300 -dB=9 less.asm -o less300.o && ld -o less300 less300.o
```

## E12 answer: 10! with a loop (fact.asm, fact.gdb, fact_count.gdb)

`mov rax, 1`, `mov rcx, 10`, then `imul rax, rcx`, `dec rcx`, `jnz top`. GDB shows RAX = 3628800 and
RCX = 0 at done, after 32 instructions (2 + 3 x 10). `./fact; echo $?` prints 0: 3628800 = 0x375F00,
and the exit status keeps only the lowest byte, 0x00.

## The programs (real output, NASM 2.16.03, GDB 16.3, GCC 14.2, perf 6.12, Debian 13 x86-64)

| File | Idea | Real result |
|---|---|---|
| maxj.asm | max(a, b) with `cmp` + `jge` | a = 3, b = 9: `jge` not taken, `mov rax, rbx` runs; a = 9, b = 3: `jge` jumps to done; both exit 9 |
| max.asm | max(a, b) with `cmp` + `cmovl` (no jump) | the same 4 instructions for both inputs; both exit 9 |
| less.asm | `cmp` + `setl al` + `movzx edi, al` | a = 3, b = 9: RAX = AL = RDI = 1, exit 1; a = 300, b = 9: RAX = 256 (setl wrote only AL), AL = 0, RDI = 0, exit 0 |
| bench.asm | sum of the bytes >= 128 in a 1 MiB buffer, 100 passes | see the timing table below |
| maxc.c | `long max(long a, long b) { return a > b ? a : b; }` | `gcc -O2 -c maxc.c`, `objdump -d -M intel maxc.o`: `cmp rsi,rdi`, `mov rax,rdi`, `cmovge rax,rsi`, `ret` |

## Timing: branch vs cmov (bench.asm)

```sh
nasm -f elf64 bench.asm -o b.o && ld -o br_pat b.o                     # branch, pattern data
nasm -f elf64 -dRANDOM bench.asm -o b.o && ld -o br_rnd b.o            # branch, random data
nasm -f elf64 -dCMOV bench.asm -o b.o && ld -o cm_pat b.o              # cmov, pattern data
nasm -f elf64 -dRANDOM -dCMOV bench.asm -o b.o && ld -o cm_rnd b.o     # cmov, random data
perf stat -r 10 ./br_rnd                                               # mean of 10 runs
```

Our run (Intel Xeon under KVM, perf stat -r 10, mean elapsed time; the one-time fill of the buffer is included):

| Build | Data | Code | Mean |
|---|---|---|---|
| br_pat | pattern (runs of 128 big, then 128 small bytes) | `jb skip` | 70 ms |
| br_rnd | random (top byte of a random number) | `jb skip` | 370 ms |
| cm_pat | pattern | `cmovb edx, r8d` | 35 ms |
| cm_rnd | random | `cmovb edx, r8d` | 32 ms |

Both random builds give the same sum in GDB (`gdb -q -nx -batch -x bench.gdb ./br_rnd`): RAX = 10032258300.
Your numbers will differ by machine; the pattern to look for is that the branch build is much slower on
random data, while the cmov build hardly changes. Measure on your own data before choosing.

## Your turn (answer in E14)

Write abs(x) with no jump at all. Hint: `neg` sets SF from its result, and `cmovns` moves only when SF = 0.
x = -7 and x = 7 should both exit with 7.
