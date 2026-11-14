set pagination off
set style enabled off
break after_mul
break after_div
run
printf "after mul: RAX="
output $rax
printf "  RDX="
output $rdx
printf "  eflags="
output $eflags
printf "\n"
continue
printf "after div: RAX="
output $rax
printf "  RDX="
output $rdx
printf "\n"
continue
