set pagination off
set style enabled off
define showflags
  printf "AL="
  output/x $al
  printf "  eflags="
  output $eflags
  printf "\n"
end
break after_add_wrap
break after_add_ov
break after_sub
run
printf "0xFF + 1: "
showflags
continue
printf "0x7F + 1: "
showflags
continue
printf "0x00 - 1: "
showflags
continue
