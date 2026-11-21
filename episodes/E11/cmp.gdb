set pagination off
set style enabled off
source show.py
break c1
break c2
break c3
run
showcmp c1 rax rbx
continue
showcmp c2 rax rbx
continue
showcmp c3 rax rbx
continue
