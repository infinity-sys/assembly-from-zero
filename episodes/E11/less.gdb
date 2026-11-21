set pagination off
set style enabled off
source show.py
break after_cmp
break skip_u
run
showcmp cmp rax rbx
continue
showcmp end rcx rdx
continue
