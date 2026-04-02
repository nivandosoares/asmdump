from pathlib import Path

def extract_raw(ppm_path, out_path):
    with open(ppm_path, "rb") as f:
        # Skip header
        header = b""
        for _ in range(3):
            header += f.readline()
        data = f.read()
    with open(out_path, "wb") as f:
        f.write(data)

base = "/home/nivando-soares/asmdump/tools/out/frame1/"
extract_raw(base + "bg1_visible.ppm", "/home/nivando-soares/asmdump/port/src/bg1_raw.raw")
extract_raw(base + "bg2_visible.ppm", "/home/nivando-soares/asmdump/port/src/bg2_raw.raw")
extract_raw(base + "bg3_visible.ppm", "/home/nivando-soares/asmdump/port/src/bg3_raw.raw")
extract_raw(base + "sprites_screen.ppm", "/home/nivando-soares/asmdump/port/src/obj_raw.raw")

print("Raw layers extracted.")
