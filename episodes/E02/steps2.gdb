break _start
run
info registers rax rdi
stepi
info registers rax
stepi
info registers rdi
x/2xb $pc
stepi
