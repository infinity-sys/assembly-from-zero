set pagination off
set style enabled off
define show64
  printf "RAX="
  output/x $rax
  printf "  RDX="
  output/x $rdx
  printf "  eflags="
  output $eflags
  printf "\n"
end
break after_mul42
break after_mul64
break after_mul8
break after_div
break after_imul
run
printf "7 * 6: "
show64
continue
printf "2^63 * 2: "
show64
continue
printf "20 * 20 (8-bit, AX): "
printf "AX="
output/x $ax
printf "  AL="
output/x $al
printf "  AH="
output/x $ah
printf "  eflags="
output $eflags
printf "\n"
continue
printf "100 / 7: "
printf "RAX="
output $rax
printf "  RDX="
output $rdx
printf "\n"
continue
printf "-3 * 7 (imul): "
printf "RAX="
output $rax
printf "  eflags="
output $eflags
printf "\n"
continue
