# Tools

Current Sprint 0 tooling:

- `extract_bank3_palettes.py`: dumps bank 3 as sequential 16-color palettes in JSON form
- `extract_boot_palette_manifest.py`: resolves known bank 1 boot-time palette tables into named JSON entries
- `flatten_palette_manifest.py`: converts a structured palette manifest into the flat array format that the SDL viewer already loads
- `extract_boot_screen_manifest.py`: resolves the bank 1 `L008CA2` screen-build path into concrete VRAM/CGRAM upload jobs
- `build_boot_vram.py`: rebuilds a partial boot/title VRAM snapshot from the current manifest, applying supported jobs into a raw VRAM image
- `extract_compression_header_manifest.py`: scans a bank for `42FB`/`26FB`/`67FB`/`27FB` blocks and decodes their leading header fields
- `decompress_td2_chunk.py`: decompresses an individual TD2 chunk from the ROM; `42FB` and boot-path `26FB` are implemented
- `extract_snes_tiles.py`: decodes SNES 2bpp/4bpp tile banks or raw planar blobs into PPM sheets
- `scan_structured_bank.py`: scans a bank for recurring header markers like `42fb` / `26fb`
- `compare_frames.py`: compares `.png` and `.ppm` frames and optionally writes a diff image
- `Makefile`: repeatable targets for the current preview extraction set

Usage:

```sh
make -C tools previews
python3 tools/extract_bank3_palettes.py game.smc tools/out/bank3_palettes.json
python3 tools/extract_boot_palette_manifest.py game.smc tools/out/bank1_boot_palettes.json
python3 tools/flatten_palette_manifest.py tools/out/bank1_boot_palettes.json tools/out/bank1_boot_palettes_flat.json
python3 tools/extract_boot_screen_manifest.py game.smc tools/out/bank1_boot_screen.json
python3 tools/build_boot_vram.py game.smc tools/out/bank1_boot_screen.json tools/out/bank1_boot_vram_variant0.bin --json-out tools/out/bank1_boot_vram_variant0.json
python3 tools/build_boot_vram.py game.smc tools/out/bank1_boot_screen.json tools/out/bank1_boot_vram_variant0.bin --json-out tools/out/bank1_boot_vram_variant0.json --selector-1c78 1 --selector-1c7a 0
python3 tools/build_boot_vram.py game.smc tools/out/bank1_boot_screen.json tools/out/bank1_boot_vram_variant0_overlay.bin --json-out tools/out/bank1_boot_vram_variant0_overlay.json --apply-optional-overlay
python3 tools/extract_compression_header_manifest.py game.smc --bank 7 --json-out tools/out/bank7_compression_headers.json
python3 tools/decompress_td2_chunk.py game.smc tools/out/bank7_42fb_8000.bin --bank 7 --addr 0x8000 --json-out tools/out/bank7_42fb_8000.json
python3 tools/decompress_td2_chunk.py game.smc tools/out/bank7_26fb_817a.bin --bank 7 --addr 0x817A --json-out tools/out/bank7_26fb_817a.json
python3 tools/extract_snes_tiles.py game.smc tools/out/bank6_tiles_gray.ppm --bank 6 --bpp 4
python3 tools/extract_snes_tiles.py game.smc tools/out/bank6_tiles_palette0.ppm --bank 6 --bpp 4 --palette-json tools/out/bank3_palettes.json --palette-index 0
python3 tools/extract_snes_tiles.py tools/out/bank7_42fb_8000.bin tools/out/bank7_42fb_8000_gray.ppm --raw-binary --offset 0x6 --byte-length 0x1000 --bpp 4 --columns 16
python3 tools/extract_snes_tiles.py tools/out/bank7_26fb_817a.bin tools/out/bank7_26fb_817a_gray.ppm --raw-binary --bpp 4 --columns 16
python3 tools/extract_snes_tiles.py tools/out/bank1_boot_vram_variant0.bin tools/out/bank1_boot_vram_variant0_4bpp.ppm --raw-binary --bpp 4 --byte-length 0xC000 --columns 32
python3 tools/scan_structured_bank.py game.smc --bank 7 --json-out tools/out/bank7_chunks.json
python3 tools/extract_snes_tiles.py game.smc tools/out/bank7_chunk1_gray.ppm --bank 7 --bpp 4 --offset 0x017e --byte-length 0x64c
python3 tools/extract_snes_tiles.py game.smc tools/out/bank9_tiles_2bpp.ppm --bank 9 --bpp 2
```

Useful make targets:

- `make -C tools bank3-palettes`
- `make -C tools boot-palettes`
- `make -C tools boot-palettes-flat`
- `make -C tools boot-screen-manifest`
- `make -C tools boot-vram-preview`
- `make -C tools boot-vram-overlay-preview`
- `make -C tools bank6-preview`
- `make -C tools bank7-scan`
- `make -C tools bank7-headers`
- `make -C tools bank7-42fb0`
- `make -C tools bank7-42fb0-preview`
- `make -C tools bank7-26fb0`
- `make -C tools bank7-26fb0-preview`
- `make -C tools bank7-chunk1-preview`
- `make -C tools bank9-preview`

The JSON output is a nested array:

- outer array: palette index
- inner array: 16 colors
- color entry: `[r, g, b]`

This format is intentionally simple so the SDL runtime can parse it without a third-party JSON library.

Frame comparison:

```sh
python3 tools/compare_frames.py expected.png actual.ppm --diff-out diff.ppm
```

The flattened manifest is useful when you want to point the current SDL runtime at a named extraction result without changing its minimal JSON parser:

```sh
./port/build/td2_port --palette tools/out/bank1_boot_palettes_flat.json
```

The new raw-binary mode is useful once a chunk has already been decompressed or a synthetic VRAM image has been assembled:

```sh
./port/build/td2_port --image tools/out/bank7_42fb_8000_gray.ppm
./port/build/td2_port --image tools/out/bank7_26fb_817a_gray.ppm
./port/build/td2_port --image tools/out/bank1_boot_vram_variant0_4bpp.ppm
```

`build_boot_vram.py` also accepts `--selector-1c78` and `--selector-1c7a` if you want to override the local bank1 tilemap patch selectors instead of using the manifest defaults.
