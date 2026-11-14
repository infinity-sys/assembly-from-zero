import gdb
class ShowAL(gdb.Command):
    """showal LABEL: print AL in hex, 8-bit binary, signed, and eflags."""
    def __init__(self): super().__init__("showal", gdb.COMMAND_USER)
    def invoke(self, arg, tty):
        v = int(gdb.parse_and_eval("$al")) & 0xFF
        b = format(v, "08b"); s = v - 256 if v > 127 else v
        f = str(gdb.parse_and_eval("$eflags"))
        extra = f"  signed={s}" if "signed" in arg else ""
        lab = arg.replace("signed", "").strip()
        print(f"{lab:<11} AL=0x{v:02x}  {b[:4]} {b[4:]}{extra}  eflags={f}")
ShowAL()
