set pagination off
set style enabled off
define showflags
  printf "AL="
  output/x $al
  printf "  eflags="
  output $eflags
  printf "\n"
end
break after_inc5
break after_incff
break after_dec
break after_neg5
break after_neg0
run
printf "inc 5 after STC: "
showflags
continue
printf "inc 0xFF after CLC: "
showflags
continue
printf "dec 1: "
showflags
continue
printf "neg 5: "
showflags
continue
printf "neg 0: "
showflags
continue
