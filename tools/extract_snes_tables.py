import struct

def extract_table(wram_path, offset, count):
    with open(wram_path, "rb") as f:
        f.seek(offset)
        data = f.read(count * 2)
    return struct.unpack(f"<{count}H", data)

wram_path = "/home/nivando-soares/asmdump/tools/out/frame1/wram.bin"

# Extract HOFS (Horizontal Scroll) and VOFS (Vertical Scroll)
# These are typically 224 words each
hofs = extract_table(wram_path, 0x0200, 224)
vofs = extract_table(wram_path, 0x0400, 224)

with open("/home/nivando-soares/asmdump/port/include/snes_tables.h", "w") as f:
    f.write("#ifndef SNES_TABLES_H\n#define SNES_TABLES_H\n\n")
    f.write("#include <stdint.h>\n\n")
    
    f.write("static const uint16_t snes_hofs[224] = {\n    ")
    for i, val in enumerate(hofs):
        f.write(f"0x{val:04X}, ")
        if (i + 1) % 8 == 0: f.write("\n    ")
    f.write("\n};\n\n")
    
    f.write("static const uint16_t snes_vofs[224] = {\n    ")
    for i, val in enumerate(vofs):
        f.write(f"0x{val:04X}, ")
        if (i + 1) % 8 == 0: f.write("\n    ")
    f.write("\n};\n\n")
    
    f.write("#endif\n")

print("SNES tables extracted to port/include/snes_tables.h")
