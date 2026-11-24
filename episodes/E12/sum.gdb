set pagination off
set style enabled off
set disassembly-flavor intel
source show.py
break top
run
showregs top1 rax rcx
continue
showregs top2 rax rcx
continue
showregs top3 rax rcx
delete
break done
continue
showregs done rax rcx
