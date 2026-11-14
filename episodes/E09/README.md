# E09 · Bitwise Logic and Shifts: and, or, xor, not, shl, shr, sar

Video: VIDEO_LINK_PLACEHOLDER

Build any program (Linux or WSL2; on macOS use the Docker lab from the main README):

```sh
nasm -f elf64 -g -F dwarf logic.asm -o logic.o && ld -o logic logic.o
gdb -q -nx -batch -x logic.gdb ./logic
```

The `.gdb` scripts load `show.py` (in this folder), which prints AL in hex,
as 8 bits, and the flags. Run them from this folder.

| File | What it shows (real output, NASM 2.16.03, GDB 16.3, Debian 13 x86-64) |
|---|---|
| ans.asm, ans.gdb | E08 answer: 13 * 7 = 91 (RDX = 0, eflags `[ IF ]`, so CF = OF = 0); 91 / 5 = 18, RDX = 1 |
| logic.asm, logic.gdb | AL = 0xCA: and 0x0F = 0x0a; or 0x0F = 0xcf; xor 0xFF = 0x35; not = 0x35 (no flags written); and 0x30 = 0x00 with ZF |
| mask.asm, mask.gdb | 0x41: or 0x08 = 0x49 (set bit 3); and 0xFE = 0x48 (clear bit 0); xor 0x80 = 0xc8 (toggle bit 7); test 0x04 sets ZF and leaves AL; xor eax, eax makes RAX = 0 |
| shifts.asm, shifts.gdb | 5 shl 3 = 40; 200 shr 2 = 50; -20 sar 2 = -5; -20 shr 2 = 59; 0x81 shl 1 = 2 with CF; -7 sar 1 = -4 with CF |
| case.asm, case.gdb | five `xor byte [msg+k], 0x20`: 48 65 6c 6c 6f becomes 68 45 4c 4c 4f; `./case` prints `hELLO` |

After a shift by more than one bit, OF is undefined: read CF only.

## Your turn

1. Multiply 13 by 10 without `mul`: 13 shifted left by 3, plus 13 shifted left by 1
   (use a second register for the copy). Predict RAX.
2. Put 0xB7 in AL and move its top 4 bits down to the bottom with one shift. Predict AL.

Check both in GDB. Answers at the start of E10.
