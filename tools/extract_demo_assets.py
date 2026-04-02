from pathlib import Path

def extract_patch(ppm_path, x, y, w, h):
    with open(ppm_path, "rb") as f:
        # Skip header
        header = b""
        for _ in range(3):
            header += f.readline()
        data = f.read()
    
    # 256x224 RGB
    patch = bytearray()
    for row in range(y, y + h):
        offset = (row * 256 + x) * 3
        patch += data[offset : offset + w * 3]
    return patch

# Extract Road Texture (from BG2)
road_patch = extract_patch("/home/nivando-soares/asmdump/tools/out/mid_race_extract_f0/bg2_visible.ppm", 96, 160, 64, 64)
with open("/home/nivando-soares/asmdump/port/src/road_tex.raw", "wb") as f:
    f.write(road_patch)

# Extract Car Sprite (from OBJ)
car_patch = extract_patch("/home/nivando-soares/asmdump/tools/out/mid_race_extract_f0/sprites_screen.ppm", 96, 150, 64, 64)
with open("/home/nivando-soares/asmdump/port/src/car_sprite.raw", "wb") as f:
    f.write(car_patch)

# Extract Dashboard (from BG1)
dash_patch = extract_patch("/home/nivando-soares/asmdump/tools/out/mid_race_extract_f0/bg1_visible.ppm", 0, 160, 256, 64)
with open("/home/nivando-soares/asmdump/port/src/dash_tex.raw", "wb") as f:
    f.write(dash_patch)

# Extract Sky (from BG3)
sky_patch = extract_patch("/home/nivando-soares/asmdump/tools/out/mid_race_extract_f0/bg3_visible.ppm", 0, 0, 256, 100)
with open("/home/nivando-soares/asmdump/port/src/sky_tex.raw", "wb") as f:
    f.write(sky_patch)

print("Assets extracted to port/src/")
