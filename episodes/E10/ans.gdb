set pagination off
set style enabled off
source show.py
break after_mul10
break after_top4
run
printf "13 * 10: RAX=%d  RBX=%d\n", $rax, $rbx
continue
showal shr4
continue
