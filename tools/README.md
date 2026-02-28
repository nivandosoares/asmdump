# Tools

Current Sprint 0 tooling:

- `extract_bank3_palettes.py`: dumps bank 3 as sequential 16-color palettes in JSON form
- `extract_boot_palette_manifest.py`: resolves known bank 1 boot-time palette tables into named JSON entries
- `flatten_palette_manifest.py`: converts a structured palette manifest into the flat array format that the SDL viewer already loads
- `extract_boot_screen_manifest.py`: resolves the bank 1 `L008CA2` screen-build path into concrete VRAM/CGRAM upload jobs
- `build_boot_vram.py`: rebuilds a partial boot/title VRAM snapshot from the current manifest, applying supported jobs into a raw VRAM image using the bank 1 state-table selectors instead of a raw entry index
- `render_boot_screen.py`: composes a BG-only 256x224 boot/title preview from the rebuilt VRAM snapshot plus the boot palette manifest
- `build_bank1_credits_scene.py`: builds the bank 1 `L009D1C` copyright/credits scene directly from ROM helper-table assets and writes VRAM/CGRAM/PPU-state outputs plus a preview PPM
- `build_bank1_helper_scene.py`: builds other simple bank 1 helper-driven BG scenes from `L00A9A0/L00A9CB/L00A9F2` table entries and explicit PPU setup
- `mesen_ppu_extract`: headless C# bridge into `MesenCore.so` that dumps the current frame's SNES BG layer views, BG tilesets/CHR sheets, palette, per-sprite previews, sprite screen preview, and raw VRAM/CGRAM/OAM without going through the GUI
- `extract_mesen_scene_range.py`: batches `mesen_ppu_extract` across a frame range, writes per-frame scene folders, and emits a collapsed `sequence.txt` manifest for the SDL runtime
- `build_scene_sequence_manifest.py`: converts flat Mesen range dumps into runtime-ready `sequence.txt` manifests, either as `snes_bg` entries or exact sampled `image` entries from screenshots
- `render_mesen_snes_bg.py`: composes a 256x224 preview directly from Mesen VRAM/CGRAM/state dumps, including Mode 7 and optional OBJ composition from OAM dumps
- `summarize_mode7_trace.py`: summarizes the tracked register-write traces emitted by `mesen_probe_boot.lua` for Mode 7/TMAIN or DMA/HDMA windows
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
python3 tools/render_boot_screen.py tools/out/bank1_boot_vram_variant0.bin tools/out/bank1_boot_palettes.json tools/out/bank1_boot_screen_variant0.ppm --rom game.smc --json-out tools/out/bank1_boot_screen_variant0.json
python3 tools/build_bank1_credits_scene.py game.smc tools/out/bank1_credits_scene
python3 tools/build_bank1_helper_scene.py game.smc tools/out/bank1_l00a35a_scene --helper-index 4 --visible-layer bg1 --scene-name bank1_L00A35A_frontend --source-routine 01:A35A
./tools/run_mesen_ppu_extract.sh --rom game.smc --frame 300 --out-dir tools/out/mesen_frame300
python3 tools/extract_mesen_scene_range.py --rom game.smc --start-frame 654 --end-frame 710 --step 4 --out-dir tools/out/ballistic_sequence --ld-library-path /home/nivando-soares/Mesen2/bin/linux-x64/Release
python3 tools/build_scene_sequence_manifest.py tools/out/intro_loop.json tools/out/intro_loop_sequence.txt --json-out tools/out/intro_loop_sequence.json --end-frame-exclusive 2072 --prefer-screenshot
python3 tools/render_mesen_snes_bg.py .mesen-config/Mesen2/LuaScriptData/mesen_probe_boot/td2_boot_probe_vram.bin .mesen-config/Mesen2/LuaScriptData/mesen_probe_boot/td2_boot_probe_cgram.bin .mesen-config/Mesen2/LuaScriptData/mesen_probe_boot/td2_boot_probe_ppu_state.json tools/out/mesen_poweron_5s_bg_only.ppm --json-out tools/out/mesen_poweron_5s_bg_only.json
python3 tools/render_mesen_snes_bg.py tools/out/td2_boot_probe_startframe_vram_1200.bin tools/out/td2_boot_probe_startframe_cgram_1200.bin tools/out/td2_boot_probe_startframe_ppu_state_1200.json tools/out/td2_boot_probe_bg_obj_1200.ppm --oam tools/out/td2_boot_probe_startframe_oam_1200.bin --json-out tools/out/td2_boot_probe_bg_obj_1200.json
python3 tools/render_mesen_snes_bg.py tools/out/td2_boot_probe_startframe_vram_1200.bin tools/out/td2_boot_probe_startframe_cgram_1200.bin tools/out/td2_boot_probe_startframe_ppu_state_1200.json tools/out/td2_boot_probe_bg_obj_1200_ppu.ppm --oam tools/out/td2_boot_probe_startframe_oam_1200.bin --obj-renderer mode7-ppu --json-out tools/out/td2_boot_probe_bg_obj_1200_ppu.json
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
- `make -C tools boot-screen-preview`
- `make -C tools boot-screen-overlay-preview`
- `make -C tools bank6-preview`
- `make -C tools bank7-scan`
- `make -C tools bank7-headers`
- `make -C tools bank7-42fb0`
- `make -C tools bank7-42fb0-preview`
- `make -C tools bank7-26fb0`
- `make -C tools bank7-26fb0-preview`
- `make -C tools bank7-chunk1-preview`
- `make -C tools bank9-preview`
- `make -C tools bank1-credits-scene-preview`
- `make -C tools bank1-credits-scene-compare`
- `make -C tools bank1-a35a-scene-preview`
- `make -C tools mesen-ppu-frame MESEN_FRAME=300`
- `make -C tools intro-loop-dump`
- `make -C tools intro-loop-sequence`

`mesen_ppu_extract` is the current bridge for the idea of using Mesen itself as an asset/layer extractor. It writes:

- `bg1.ppm` ... `bg4.ppm`, `main.ppm`, `sub.ppm`: full tilemap-viewer style outputs from Mesen's own `GetTilemap`
- `bg1_visible.ppm` ... `sub_visible.ppm`: 256-pixel viewport crops using the current scroll state
- `tiles_bg1.ppm` ... `tiles_bg4.ppm`: CHR/tile sheets exported through Mesen's own `GetTileView` using the active SNES BG format and current `CHR` base address
- `palette.json` and `palette.ppm`: RGB palette dump and swatch preview
- `sprites_screen.ppm`, `sprites.json`, and `sprite_previews/sprite_###.ppm`: Mesen's sprite preview screen, metadata list, and per-sprite preview sheets
- `vram.bin`, `cgram.bin`, `oam.bin`: raw memory dumps for the same frame
- `state.json`: PPU summary used for the extraction
- `ppu_state.json`: flat PPU-state export in the same key format consumed by `render_mesen_snes_bg.py` and the SDL runtime

Current practical reading for this tool:

- it is good for standalone layer/palette/sprite extraction
- it is now also good for standalone BG tileset extraction through Mesen's own tile-view renderer
- its `GetTilemap` outputs are viewer-oriented layer renders, not a final composed screenshot
- for frame `300`, the extracted PPU state lands on the expected credits scene state (`bgMode = 1`, `mainScreenLayers = 0x04`, `chrAddress = 0x2000/0x4000/0x6000`)
- the frame-`300` `*_visible.ppm` outputs do not match the final screenshot pixel-for-pixel, so they should be treated as standalone layer assets, not as golden-frame replacements

For the `Ballistic presents` splash, the frame-`654` extraction is a clean exact anchor:

- `tools/out/mesen_frame654_assets/bg1_visible.ppm` compares against `tools/out/td2_boot_probe_frame_654.png` with `0` mismatched pixels
- the scene is still `bgMode = 1`, `mainScreenLayers = 0x01`, and has `0` visible sprites
- this makes it suitable as the first frame of a sampled SDL intro sequence

`extract_mesen_scene_range.py` is the current bridge from deterministic Mesen intro captures into runtime playback:

- it extracts one folder per requested frame: `frame_00654/`, `frame_00658/`, ...
- each frame folder contains `vram.bin`, `cgram.bin`, `ppu_state.json`, and the rest of the usual Mesen bridge outputs
- it writes `sequence.txt`, a simple line-oriented manifest that `port/build/td2_port --sequence ...` can play directly
- it also writes `sequence.json`, which records the extracted frame list, adjacent-collapse decisions, and total playback duration

The first sampled Ballistic playback set currently lives in `tools/out/ballistic_sequence/`:

- `sequence.txt`: `15` `snes_bg` entries covering frames `654..710` in `4`-frame steps
- `sequence.json`: summary of those entries, with `60` frames of total playback

The next milestone, the full first no-input attract loop, now lives in `tools/out/intro_loop*`:

- `tools/out/intro_loop.json`: raw single-run Mesen range dump summary for frames `654..2070`, sampled every `4` frames
- `tools/out/intro_loop_sequence.txt`: exact sampled `image` manifest for SDL playback
- `tools/out/intro_loop_sequence.json`: collapsed playback summary
- `tools/out/intro_loop_sequence_images/`: `355` converted `PPM` frames sourced from Mesen screenshots

Current validated reading for that loop:

- the attract callback cycle repeats every `1418` frames
- the cycle begins at frame `654`, where the active main callback first becomes `01:A39C`
- it repeats at frames `2072` and `3490`
- the exact sampled manifest currently collapses `355` captured frames down to `226` playback entries while preserving `1418` frames of total runtime duration

The wrapper expects the local Mesen Linux release at `/home/nivando-soares/Mesen2/bin/linux-x64/Release` by default. Override with `MESEN_RELEASE_DIR=/path/to/release` when needed.

The JSON output is a nested array:

- outer array: palette index
- inner array: 16 colors
- color entry: `[r, g, b]`

This format is intentionally simple so the SDL runtime can parse it without a third-party JSON library.

Frame comparison:

```sh
python3 tools/compare_frames.py expected.png actual.ppm --diff-out diff.ppm
```

Current practical reading for the attract-mode validation targets:

- frame `1200`: `--oam` with the default `--obj-renderer simple` improves the compare from `9.125628%` to `7.934570%`
- frame `1200`: `--obj-renderer mode7-ppu` is available as an experimental path, but currently lands at `8.032227%`
- frame `1080`: the current OBJ decode/composition path is still not reliable and remains worse than BG-only

The flattened manifest is useful when you want to point the current SDL runtime at a named extraction result without changing its minimal JSON parser:

```sh
./port/build/td2_port --palette tools/out/bank1_boot_palettes_flat.json
```

The new raw-binary mode is useful once a chunk has already been decompressed or a synthetic VRAM image has been assembled:

```sh
./port/build/td2_port --image tools/out/bank7_42fb_8000_gray.ppm
./port/build/td2_port --image tools/out/bank7_26fb_817a_gray.ppm
./port/build/td2_port --image tools/out/bank1_boot_vram_variant0_4bpp.ppm
./port/build/td2_port --image tools/out/bank1_boot_screen_variant0.ppm
```

`build_boot_vram.py` still accepts `--selector-1c78` and `--selector-1c7a`, but the rest of the job selection now follows the actual bank 1 state tables:

- `bank9_boot_vram_pages` and `bank8_bulk_vram_block` select by `$1CCA`
- `compressed_bank7_group_a` and `compressed_bank7_group_b` select by `$1CAC`, or force entry `8` on the negative-layout path
- the `CGRAM 0x00` palette selection follows the same `compressed_index + $1CAE` rule as `L008CA2`

`render_boot_screen.py` currently renders BG layers only. OBJ palette loads at `CGRAM 0x90+` are tracked in its JSON summary, but OAM/sprite composition is not implemented yet.

`build_boot_vram.py` now accepts `42FB` as well as `26FB` on the `L0006C9` path. That matters because bank 1 helper `L00A9CB(0)` uses a `42FB` chunk for the copyright/credits scene instead of a raw block or `26FB` stream.

`render_mesen_snes_bg.py` is useful for validating a live Mesen capture against a raw VRAM/CGRAM/state dump. The current known-good scene is the power-on copyright/credits screen at frame `300`:

```sh
TD2_BOOT_PROBE_TOTAL_FRAMES=301 \
TD2_BOOT_PROBE_SCREENSHOT_FRAME=300 \
TD2_BOOT_PROBE_DUMP_PPU_MEMORY=1 \
./validation/run_mesen_probe_boot.sh

python3 tools/render_mesen_snes_bg.py \
  .mesen-config/Mesen2/LuaScriptData/mesen_probe_boot/td2_boot_probe_vram.bin \
  .mesen-config/Mesen2/LuaScriptData/mesen_probe_boot/td2_boot_probe_cgram.bin \
  .mesen-config/Mesen2/LuaScriptData/mesen_probe_boot/td2_boot_probe_ppu_state.json \
  tools/out/mesen_poweron_5s_bg_only.ppm \
  --json-out tools/out/mesen_poweron_5s_bg_only.json

python3 tools/compare_frames.py \
  .mesen-config/Mesen2/LuaScriptData/mesen_probe_boot/td2_boot_probe_frame.png \
  tools/out/mesen_poweron_5s_bg_only.ppm \
  --diff-out tools/out/mesen_poweron_5s_bg_only_diff.ppm
```

That comparison currently produces an exact match. The live dump shows:

- `ppu.bgMode = 1`
- `ppu.mainScreenLayers = 0x04`
- raw layer state values:
  - `ppu.layers[0].tilemapAddress = 0`
  - `ppu.layers[1].tilemapAddress = 2048`
  - `ppu.layers[2].tilemapAddress = 4096`
  - `ppu.layers[0].chrAddress = 8192`
  - `ppu.layers[1].chrAddress = 16384`
  - `ppu.layers[2].chrAddress = 24576`

One quirk is important: for this scene, Mesen reports raw `vscroll = 1023` for the visible layer, but the visible output matches an effective scroll of `0`. `render_mesen_snes_bg.py` normalizes that value accordingly.

The same renderer now covers the later Mode 7 attract frames as BG-only validation targets:

```sh
python3 tools/render_mesen_snes_bg.py \
  tools/out/td2_boot_probe_vram_1080.bin \
  tools/out/td2_boot_probe_cgram_1080.bin \
  tools/out/td2_boot_probe_ppu_state_1080.json \
  tools/out/td2_boot_probe_bg_1080.ppm \
  --json-out tools/out/td2_boot_probe_bg_1080.json

python3 tools/render_mesen_snes_bg.py \
  tools/out/td2_boot_probe_vram_1200.bin \
  tools/out/td2_boot_probe_cgram_1200.bin \
  tools/out/td2_boot_probe_ppu_state_1200.json \
  tools/out/td2_boot_probe_bg_1200.ppm \
  --json-out tools/out/td2_boot_probe_bg_1200.json
```

Current validation status:

- frame `300`: exact match against the captured screenshot
- frame `1080`: `12.341309%` mismatch against the captured screenshot
- frame `1200`: `9.125628%` mismatch against the captured screenshot

The remaining mismatch on the Mode 7 frames is currently treated as missing OBJ or other overlay composition, because the shared Python and SDL Mode 7 BG renderers match each other exactly.

For deeper frame-state analysis, the Mesen probe can now emit a register trace and a second `startFrame` snapshot:

```sh
TD2_BOOT_PROBE_TOTAL_FRAMES=1081 \
TD2_BOOT_PROBE_SCREENSHOT_FRAME=1080 \
TD2_BOOT_PROBE_DUMP_PPU_MEMORY=1 \
TD2_BOOT_PROBE_TRACE_MODE7=1 \
./validation/run_mesen_probe_boot.sh

python3 tools/summarize_mode7_trace.py \
  .mesen-config/Mesen2/LuaScriptData/mesen_probe_boot/td2_boot_probe_mode7_writes.json \
  --json-out tools/out/td2_boot_probe_mode7_writes_summary.json
```

The `startFrame` dump uses the same naming pattern with a `td2_boot_probe_startframe_*` prefix and is useful when late-vblank writes would otherwise blur the frame boundary.

The same frame-`300` scene is now also reconstructible directly from ROM without using live VRAM/CGRAM dumps:

```sh
make -C tools bank1-credits-scene-preview

python3 tools/compare_frames.py \
  .mesen-config/Mesen2/LuaScriptData/mesen_probe_boot/td2_boot_probe_frame.png \
  tools/out/bank1_credits_scene.ppm \
  --diff-out tools/out/bank1_credits_scene_vs_mesen_diff.ppm
```

That comparison currently also produces an exact match. The ROM-driven scene builder writes:

- `tools/out/bank1_credits_scene_vram.bin`
- `tools/out/bank1_credits_scene_cgram.bin`
- `tools/out/bank1_credits_scene_ppu_state.json`
- `tools/out/bank1_credits_scene.ppm`
- `tools/out/bank1_credits_scene.json`

The next identified front-end builder after the credits scene is `L00A35A`, which sets `TMAIN = 0x01` and uses helper index `4`. The generic helper-scene builder can materialize its static setup:

```sh
make -C tools bank1-a35a-scene-preview
```

That currently writes:

- `tools/out/bank1_l00a35a_scene_vram.bin`
- `tools/out/bank1_l00a35a_scene_cgram.bin`
- `tools/out/bank1_l00a35a_scene_ppu_state.json`
- `tools/out/bank1_l00a35a_scene.ppm`
- `tools/out/bank1_l00a35a_scene.json`

This should be treated as the scene's static setup, not a guarantee of exact frame parity. The follow-up callback under `L00A35A` animates the front-end after the one-shot helper build.
