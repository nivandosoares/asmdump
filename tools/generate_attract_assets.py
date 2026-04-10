import os
import subprocess

def convert_png_to_raw(png_path, raw_path):
    # Use ffmpeg to convert PNG to raw RGB24
    cmd = [
        "ffmpeg", "-y",
        "-i", png_path,
        "-f", "rawvideo",
        "-pix_fmt", "rgb24",
        raw_path
    ]
    subprocess.run(cmd, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)

# Frame range for the attract intro (Accolade logo + Title)
# Based on the intro_loop_sequence.json
frames = range(1646, 1750, 4) # Extract a small subset for the demo

output_h = "/home/nivando-soares/asmdump/port/include/attract_assets.h"

with open(output_h, "w") as f:
    f.write("#ifndef ATTRACT_ASSETS_H\n#define ATTRACT_ASSETS_H\n\n")
    f.write("#include <stdint.h>\n\n")
    
    for i in frames:
        png = f"/home/nivando-soares/asmdump/tools/out/intro_loop_frame_{i:05d}_frame.png"
        raw = f"/tmp/frame_{i}.raw"
        if os.path.exists(png):
            convert_png_to_raw(png, raw)
            with open(raw, "rb") as rf:
                data = rf.read()
                f.write(f"static const uint8_t attract_frame_{i}[] = {{\n    ")
                for j, b in enumerate(data):
                    f.write(f"0x{b:02x},")
                    if (j + 1) % 16 == 0: f.write("\n    ")
                f.write("\n};\n\n")
            os.remove(raw)

    f.write("static const uint8_t* attract_frames[] = {\n")
    for i in frames:
        f.write(f"    attract_frame_{i},\n")
    f.write("};\n\n")
    f.write(f"#define ATTRACT_FRAME_COUNT {len(list(frames))}\n")
    f.write("#endif\n")

print(f"Attract assets generated in {output_h}")
