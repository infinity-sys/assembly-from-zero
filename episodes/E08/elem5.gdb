set pagination off
set style enabled off
break 12
run
printf "rsi = "
print/x $rsi
printf "rdi = "
print $rdi
printf "rax = "
print $rax
x/6gd &table
printf "element 5 at "
print/x $rsi + $rdi*8
