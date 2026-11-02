# table8.py - one byte, read two ways
for b in [0x00, 0x01, 0x7F, 0x80, 0x81, 0xFE, 0xFF]:
    signed = b - 256 if b >= 128 else b
    print(f"{b:08b}  0x{b:02X}  {b:3d}  {signed:4d}")
