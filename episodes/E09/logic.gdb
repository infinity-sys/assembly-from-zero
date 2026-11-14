set pagination off
set style enabled off
source show.py
break after_and
break after_or
break after_xor
break after_not
break after_and0
run
showal and 0x0F
continue
showal or  0x0F
continue
showal xor 0xFF
continue
showal not     
continue
showal and 0x30
continue
