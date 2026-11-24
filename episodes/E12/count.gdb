set pagination off
set style enabled off
set disassembly-flavor intel
source show.py
break top
run
showp top1
continue
showp top2
continue
showp top3
delete
break done
continue
showp done
