#!/usr/bin/env python3
"""Simple palette viewer for extracted bank 3 palettes.

Usage: tools/view_palette.py tools/out/pal_bank3.json [--index N]

The script reads a JSON array of 256 RGB entries or multiple palettes and
renders a small grid PNG preview (requires Pillow).
"""
import sys
import json
import argparse
from PIL import Image

parser = argparse.ArgumentParser(description='Palette viewer')
parser.add_argument('path', help='palette JSON path')
parser.add_argument('--index', type=int, default=0, help='palette index when file contains multiple palettes')
args = parser.parse_args()

path = args.path
with open(path, 'r') as f:
    data = json.load(f)

# determine palette structure
pal = None
if isinstance(data, dict):
    # pick first named palette
    key = next(iter(data))
    pal = data[key]
elif isinstance(data, list):
    if len(data) == 0:
        print('no palette entries')
        sys.exit(1)
    # detect whether this is a flat palette (list of [r,g,b]) or a list of palettes
    first = data[0]
    if isinstance(first, list) and len(first) > 0 and isinstance(first[0], list):
        # list of palettes -> choose index
        idx = args.index
        if idx < 0 or idx >= len(data):
            print(f'palette index {idx} out of range (0..{len(data)-1})')
            sys.exit(2)
        pal = data[idx]
    else:
        # assume flat list of colors
        pal = data
else:
    print('unsupported JSON format')
    sys.exit(1)

cols = 16
rows = (len(pal) + cols - 1) // cols
cell = 32
img = Image.new('RGB', (cols*cell, rows*cell))
for i, entry in enumerate(pal):
    # entry may be [r,g,b] or longer; take first three
    if not isinstance(entry, (list, tuple)) or len(entry) < 3:
        print(f'bad palette entry at index {i}: {entry}')
        sys.exit(1)
    r, g, b = entry[0], entry[1], entry[2]
    x = (i % cols) * cell
    y = (i // cols) * cell
    for yy in range(y, y+cell):
        for xx in range(x, x+cell):
            img.putpixel((xx,yy),(r,g,b))

out = path + (f'.{args.index}' if isinstance(data,list) and isinstance(data[0], list) and isinstance(data[0][0], list) else '') + '.png'
img.save(out)
print('wrote', out)
