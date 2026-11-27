import gdb
def flags(): return str(gdb.parse_and_eval("$eflags"))
def sreg(r):
    v = int(gdb.parse_and_eval("$" + r)) & 0xFFFFFFFFFFFFFFFF
    return v - (1 << 64) if v >> 63 else v
class ShowRegs(gdb.Command):
    """showregs LABEL REG...: registers as signed decimals."""
    def __init__(self): super().__init__("showregs", gdb.COMMAND_USER)
    def invoke(self, arg, tty):
        a = arg.split()
        print(f"{a[0]:<5} " + "  ".join(f"{r.upper()}={sreg(r)}" for r in a[1:]))
class ShowP(gdb.Command):
    """showp LABEL: RAX (the count), p as msg + offset, and the byte at p."""
    def __init__(self): super().__init__("showp", gdb.COMMAND_USER)
    def invoke(self, arg, tty):
        rsi = int(gdb.parse_and_eval("$rsi")); msg = int(gdb.parse_and_eval("(long)&msg"))
        b = int(gdb.parse_and_eval("*(unsigned char*)$rsi"))
        ch = f"'{chr(b)}'" if 32 <= b < 127 else "   "
        print(f"{arg:<5} RAX={sreg('rax'):<3} p=msg+{rsi - msg:<3} byte at p = {b:<3} {ch}")
class Trace(gdb.Command):
    """trace STOP: print each instruction as it runs, until label STOP."""
    def __init__(self): super().__init__("trace", gdb.COMMAND_USER)
    def invoke(self, arg, tty):
        stop = int(gdb.parse_and_eval(f"(long)&{arg}"))
        arch = gdb.selected_frame().architecture()
        while True:
            pc = int(gdb.parse_and_eval("$pc"))
            ins = arch.disassemble(pc)[0]["asm"]
            sym = gdb.execute(f"info symbol {pc}", to_string=True).split(" in ")[0]
            print(f"run  {sym:<14} {' '.join(ins.split())}")
            if pc == stop: break
            gdb.execute("stepi", to_string=True)
class Count(gdb.Command):
    """count STOP: run one instruction at a time until label STOP; print how many ran."""
    def __init__(self): super().__init__("count", gdb.COMMAND_USER)
    def invoke(self, arg, tty):
        stop = int(gdb.parse_and_eval(f"(long)&{arg}")); n = 0
        while int(gdb.parse_and_eval("$pc")) != stop:
            gdb.execute("stepi", to_string=True); n += 1
        print(f"count {n} instructions ran before {arg}")
ShowRegs(); ShowP(); Trace(); Count()
