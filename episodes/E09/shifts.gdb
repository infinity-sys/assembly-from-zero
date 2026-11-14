set pagination off
set style enabled off
source show.py
break after_shl
break after_shr
break after_sar
break after_shr_neg
break after_shl_cf
break after_sar7
run
showal 5 shl 3 signed
continue
showal 200 shr 2 signed
continue
showal -20 sar 2 signed
continue
showal -20 shr 2 signed
continue
showal 0x81 shl 1 signed
continue
showal -7 sar 1 signed
continue
