#!/usr/bin/env python3
"""Simple palette viewer for extracted bank 3 palettes.

Usage: tools/view_palette.py tools/out/pal_bank3.json

The script reads a JSON array of 256 RGB entries or multiple named palettes and
renders a small grid PNG preview (requires Pillow).
"""
import sys
import json
from PIL import Image

if len(sys.argv) < 2:
    print("usage: view_palette.py <palette.json>")
    sys.exit(2)

path = sys.argv[1]
with open(path, 'r') as f:
    data = json.load(f)

# support either a flat list of rgb tuples or dict of palettes
if isinstance(data, dict):
    # pick first palette
    key = next(iter(data))
    pal = data[key]
else:
    pal = data

if not pal or len(pal) < 1:
    print('no palette entries')
    sys.exit(1)

# assume entries are [r,g,b] 0-255
cols = 16
rows = (len(pal) + cols - 1) // cols
cell = 32
img = Image.new('RGB', (cols*cell, rows*cell))
for i,entry in enumerate(pal):
    r,g,b = entry
    x = (i % cols) * cell
    y = (i // cols) * cell
    for yy in range(y, y+cell):
        for xx in range(x, x+cell):
            img.putpixel((xx,yy),(r,g,b))

out = path + '.png'
img.save(out)
print('wrote', out)
