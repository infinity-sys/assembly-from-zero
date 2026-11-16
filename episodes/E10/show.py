import gdb
def flags(): return str(gdb.parse_and_eval("$eflags"))
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
ShowAL(); ShowRAX()
