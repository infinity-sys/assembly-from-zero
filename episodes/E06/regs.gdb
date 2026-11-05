break 14
run
info registers rax rdi rsi rdx
x/14xb $rsi
stepi
p $rax
