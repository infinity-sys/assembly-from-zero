set pagination off
set style enabled off
source show.py
break after_set
break after_clear
break after_toggle
break after_test
break after_zero
run
showal or  0x08
continue
showal and 0xFE
continue
showal xor 0x80
continue
showal test 0x04
continue
printf "xor eax, eax: RAX="
output/x $rax
printf "  eflags="
output $eflags
printf "\n"
continue
