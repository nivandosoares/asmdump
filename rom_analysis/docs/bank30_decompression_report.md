# Bank 30 Decompression Report

This report records the decompression/classification pass over marker hits
discovered in bank `30` (`0x1E`), including the new `67FB` decoder pass.

## Inputs

- `tools/out/bank30_chunks.json`
- `tools/out/bank30_headers.json`
- `tools/out/bank30_chunk_validation.json`
- `.mesen-config/Mesen2/LuaScriptData/mesen_probe_boot/td2_boot_probe_l001210_exec.json`
- `tools/out/td2_boot_probe_l001210_summary.json`
- `tools/out/bank30_chunk_registry.json`

Detected markers:

- `42FB` at `1E:9681` (`offset 0x1681`)
- `67FB` at `1E:DA96` (`offset 0x5A96`)
- `26FB` at:
  - `1E:DF6C`
  - `1E:E039`
  - `1E:E73F`
  - `1E:E800`
  - `1E:EE7F`
- `67FB` at `1E:E91F` (`offset 0x691F`)

## Decompression Run

Commands executed:

```sh
make -C tools bank30-validate
python3 tools/decompress_td2_chunk.py game.smc tools/out/bank30_42fb_9681.bin --bank 30 --addr 0x9681 --json-out tools/out/bank30_42fb_9681.json
python3 tools/decompress_td2_chunk.py game.smc tools/out/bank30_67fb_da96.bin --bank 30 --addr 0xDA96 --json-out tools/out/bank30_67fb_da96.json
python3 tools/decompress_td2_chunk.py game.smc tools/out/bank30_26fb_df6c.bin --bank 30 --addr 0xDF6C --json-out tools/out/bank30_26fb_df6c.json
python3 tools/decompress_td2_chunk.py game.smc tools/out/bank30_26fb_e039.bin --bank 30 --addr 0xE039 --json-out tools/out/bank30_26fb_e039.json
python3 tools/decompress_td2_chunk.py game.smc tools/out/bank30_26fb_e73f.bin --bank 30 --addr 0xE73F --json-out tools/out/bank30_26fb_e73f.json
python3 tools/decompress_td2_chunk.py game.smc tools/out/bank30_26fb_e800.bin --bank 30 --addr 0xE800 --json-out tools/out/bank30_26fb_e800.json
python3 tools/decompress_td2_chunk.py game.smc tools/out/bank30_26fb_ee7f.bin --bank 30 --addr 0xEE7F --json-out tools/out/bank30_26fb_ee7f.json
python3 tools/decompress_td2_chunk.py game.smc tools/out/bank30_67fb_e91f.bin --bank 30 --addr 0xE91F --json-out tools/out/bank30_67fb_e91f.json
```

## Decoder Results

| Marker start | Status | Output size | Input consumed | Notes |
|---|---|---:|---:|---|
| `1E:9681` (`42FB`) | ok | `0` | `11` | Declared output is zero; likely control/sentinel record. |
| `1E:DA96` (`67FB`) | ok | `28620` | `6429` | Mode word `0x59E7` (word mode path). |
| `1E:DF6C` (`26FB`) | ok | `1798` | `205` | Decodes from this offset, but offset is inside `1E:DA96` input window. |
| `1E:E039` (`26FB`) | ok | `3264` | `1395` | Decodes from this offset, but offset is inside `1E:DA96` input window. |
| `1E:E73F` (`26FB`) | ok | `1798` | `193` | Decodes from this offset, but offset is inside `1E:DA96` input window. |
| `1E:E800` (`26FB`) | ok | `3168` | `1407` | Decodes from this offset, but offset is inside `1E:DA96` input window. |
| `1E:E91F` (`67FB`) | fail | - | - | Stream ended early before reaching declared output size. |
| `1E:EE7F` (`26FB`) | ok | `1798` | `887` | Decodes from this offset, but offset is inside `1E:DA96` input window. |

## Overlap Validation

The successful `67FB` decode at `1E:DA96` consumes `6429` source bytes:

- source window: `[0x5A96, 0x73B3)` in bank-30 offsets
- this window includes every later marker hit (`26FB` at `DF6C/E039/E73F/E800/EE7F`
  and `67FB` at `E91F`)

Practical reading: marker scan output in this region must be treated as
candidates, not confirmed top-level chunk boundaries.

## Bank 1 Pointer-Table Provenance

Bank-1 helper tables that feed `L001210` confirm direct references to five
bank-30 `26FB` starts:

Reference note: `rom_analysis/docs/bank1_l001210_pointer_tables.md`.

- `01:A789` + bank table `01:A7D3`:
  - index `28` -> `1E:DF6C`
  - index `29` -> `1E:E73F`
  - index `32` -> `1E:EE7F`
- `01:A842` + bank table `01:A888`:
  - index `28` -> `1E:E039`
  - index `29` -> `1E:E800`

This confirms those `26FB` starts are intentional entries even though they lie
inside the larger `67FB` decode window from `1E:DA96`.

## Runtime `L001210` Exec Probe

Runtime probe commands:

```sh
make -C tools l001210-probe L001210_PROBE_TOTAL_FRAMES=3600 MESEN_TIMEOUT_SECONDS=90
make -C tools l001210-trace-summary
```

Observed (`tools/out/td2_boot_probe_l001210_summary.json`):

- total `L001210` hits in the `3600`-frame no-input run: `34`
- unique source pointers: `16`
- bank-30 sources hit in this window: `8` hits total
  - `1E:DF6C` (`26FB`): frames `1280` and `2698`
  - `1E:E039` (`26FB`): frames `1282` and `2700`
  - `1E:E73F` (`26FB`): frames `1292` and `2709`
  - `1E:E800` (`26FB`): frames `1294` and `2712`
- no hits in this no-input window for:
  - `1E:9681` (`42FB`)
  - `1E:DA96` (`67FB`)
  - `1E:E91F` (`67FB`)
  - `1E:EE7F` (`26FB`)

Loop note:

- Each of the four active bank-30 entries above repeats exactly `1418` frames
  later, matching the measured no-input attract loop period.

Alternate scripted-input probe:

- command:
  - `TD2_BOOT_PROBE_TOTAL_FRAMES=4000 TD2_BOOT_PROBE_TRACE_L001210=1 TD2_BOOT_PROBE_INPUT_START_FRAME=240 TD2_BOOT_PROBE_INPUT=start,b MESEN_TIMEOUT_SECONDS=110 ./validation/run_mesen_probe_boot.sh ./game.smc`
  - `python3 tools/summarize_l001210_trace.py .mesen-config/Mesen2/LuaScriptData/mesen_probe_boot/td2_boot_probe_l001210_exec.json --json-out tools/out/td2_boot_probe_l001210_summary_startb.json`
- result:
  - only `2` total hits (`02:F51F`, `04:8000`, both `42FB`)
  - no bank-30 `L001210` sources observed in this path

## Tile Preview Probes

Generated grayscale probes (`4bpp`, plus `offset 0x6` variants):

- `tools/out/bank30_26fb_*_4bpp.ppm`
- `tools/out/bank30_26fb_*_4bpp_off6.ppm`
- `tools/out/bank30_26fb_*_2bpp_off6.ppm`
- `tools/out/bank30_67fb_da96_4bpp.ppm`
- `tools/out/bank30_67fb_da96_2bpp.ppm`

Observed decode geometry:

- `1798`-byte outputs decode as `56` tiles at `4bpp` (`128x32`) when probing both offset `0` and `0x6`.
- `3264` and `3168` outputs decode as `102` and `99` tiles respectively at `4bpp`.
- `67FB` output (`28620` bytes, word mode) looks table/map-like rather than planar tile data.

## Interpretation

1. `67FB` is now decoded and confirmed active at `1E:DA96`.
2. The `1E:DA96` output is a strong map/table candidate (high use of tilemap-style
   word flags, not clean planar-tile alignment).
3. The five `26FB` starts (`DF6C/E039/E73F/E800/EE7F`) are confirmed runtime
   table entries from bank-1 pointer maps.
4. Overlapping starts are therefore a real pattern in this content region.
5. Runtime now confirms active usage for `DF6C/E039/E73F/E800` on the no-input
   attract path.
6. `1E:E91F` remains unconfirmed (`67FB` decode fails with source exhaustion).
7. `1E:DA96` and `1E:EE7F` remain unobserved in this no-input runtime window.
8. Consolidated registry (`make -C tools bank30-registry`) now classifies all
   candidates into:
   - `runtime-confirmed`: `4`
   - unresolved queue: `4` (`P0`: `E91F`, `EE7F`; `P1`: `DA96`; `P2`: `9681`)

## Next Actions

1. Probe deterministic savestate-targeted paths to confirm reachability for
   `1E:DA96`, `1E:E91F`, and `1E:EE7F`.
   - current `start,b` scripted-input probe does not reach bank30 candidates.
2. Build a validated chunk map for bank `30` using:
   - decode success + consumed spans
   - pointer-table provenance
   - runtime `L001210` hit evidence
3. Tie bank-30 chunk outputs to Mesen design-pack tilemap entries for provenance
   (`frame/layer/tile index` -> `ROM chunk/offset`).
