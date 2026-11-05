# Assembly Programming: From Zero to Hero

Code for the Infinity Systems course: x86-64 assembly on Linux, with NASM, ld and GDB.

- Videos: https://www.youtube.com/playlist?list=PLbVPAHO6JVA0
- This repository: https://github.com/infinity-sys/assembly-from-zero

## The lab

Linux, or Windows with WSL2 (Ubuntu):

    sudo apt install nasm binutils gdb make

Fedora: `sudo dnf install nasm binutils gdb make` - Arch: `sudo pacman -S nasm binutils gdb make`

macOS (Apple's ld cannot link Linux programs), or any computer with Docker:

    docker build -t asm-lab .
    docker run --rm -it -v "$PWD":/lab asm-lab

## Episodes

| Episode | Folder | What is inside |
|---|---|---|
| E01 What Is Assembly? | episodes/E01 | exit42.asm (exits with 42), noexit.asm (no exit call: crashes with signal 11), add.c (compiled to lea + ret) |
| E02 Set Up Your Lab | episodes/E02 | Makefile (`make run`), Makefile.bad (spaces instead of a tab), exit42.asm, steps.gdb and steps2.gdb (stepi one instruction at a time), edges/ (exit codes 255, 256, 257, -1), the E01 answer (age.asm, exit300.asm), three broken programs for the exercise |

See exercises.md for every exercise.
