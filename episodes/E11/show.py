import gdb
def flags(): return str(gdb.parse_and_eval("$eflags"))
def sreg(r):
    v = int(gdb.parse_and_eval("$" + r)) & 0xFFFFFFFFFFFFFFFF
    return v - (1 << 64) if v >> 63 else v
class ShowAL(gdb.Command):
    """showal LABEL: AL in hex, 8 bits, unsigned, signed, and eflags."""
    def __init__(self): super().__init__("showal", gdb.COMMAND_USER)
    def invoke(self, arg, tty):
        v = int(gdb.parse_and_eval("$al")) & 0xFF
        b = format(v, "08b"); s = v - 256 if v > 127 else v
        print(f"{arg:<4} AL=0x{v:02x}  {b[:4]} {b[4:]}  u={v:<3} s={s:<4} eflags={flags()}")
class ShowRAX(gdb.Command):
    """showrax LABEL: RAX in hex (64 bits)."""
    def __init__(self): super().__init__("showrax", gdb.COMMAND_USER)
    def invoke(self, arg, tty):
        v = int(gdb.parse_and_eval("$rax")) & 0xFFFFFFFFFFFFFFFF
        print(f"{arg:<4} RAX=0x{v:016x}")
class ShowCmp(gdb.Command):
    """showcmp LABEL REG...: registers as signed decimals, and eflags."""
    def __init__(self): super().__init__("showcmp", gdb.COMMAND_USER)
    def invoke(self, arg, tty):
        a = arg.split(); regs = " ".join(f"{r.upper()}={sreg(r)}" for r in a[1:])
        print(f"{a[0]:<4} {regs}  eflags={flags()}")
class Trace(gdb.Command):
    """trace STOP: print each instruction as it runs, until label STOP."""
    def __init__(self): super().__init__("trace", gdb.COMMAND_USER)
    def invoke(self, arg, tty):
        stop = int(gdb.parse_and_eval(f"(long)&{arg}"))
        fr = gdb.selected_frame(); arch = fr.architecture()
        while True:
            pc = int(gdb.parse_and_eval("$pc"))
            ins = arch.disassemble(pc)[0]["asm"]
            sym = gdb.execute(f"info symbol {pc}", to_string=True).split(" in ")[0]
            print(f"run  {sym:<14} {' '.join(ins.split())}")
            if pc == stop: break
            gdb.execute("stepi", to_string=True)
ShowAL(); ShowRAX(); ShowCmp(); Trace()
