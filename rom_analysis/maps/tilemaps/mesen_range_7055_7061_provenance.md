# Tilemap-to-ROM Provenance

- frame range: `7055..7061`
- row count: `6`
- unmapped rows: `0`

| Frame | Layer | Tile index ranges | CHR base | Candidate ROM chunk | Evidence |
|---:|---|---|---:|---|---|
| `7055` | `bg1` | 0x000-0x2C8 | `0x2000` | `0D:C4DC` (26FB) | carryover-from-last-hit@7051 (`frame_delta = 4`); `bg1/bg2/bg3` tilemaps and `vram.bin` match frame `7051`, but `cgram.bin`, `ppu_state.json`, and `oam.bin` differ and visible sprites drop `10 -> 0`, so this is tilemap carry only. |
| `7055` | `bg2` | 0x000 | `0x3000` | `0D:C4DC` (26FB) | Same tilemap-only carry model as `7055/bg1`, anchored to runtime hit `7051`. |
| `7055` | `bg3` | 0x000 | `0x6000` | `0D:C4DC` (26FB) | Same tilemap-only carry model as `7055/bg1`, anchored to runtime hit `7051`. |
| `7061` | `bg1` | 0x000-0x2C8 | `0x2000` | `07:BF49` (42FB) | carryover-from-last-hit@7059 (`frame_delta = 2`); `bg1/bg2/bg3` tilemaps, `vram.bin`, and `oam.bin` match frame `7059`, while `cgram.bin` and `ppu_state.json` differ. |
| `7061` | `bg2` | 0x000 | `0x3000` | `07:BF49` (42FB) | Same carry model as `7061/bg1`, anchored to runtime hit `7059`. |
| `7061` | `bg3` | 0x000 | `0x6000` | `07:BF49` (42FB) | Same carry model as `7061/bg1`, anchored to runtime hit `7059`. |

Frame comparisons:

- `7055` vs `7051`: `bg1/bg2/bg3` tilemaps and `vram.bin` match exactly, but
  `cgram.bin`, `ppu_state.json`, and `oam.bin` differ; visible sprites go
  `10 -> 0`.
- `7061` vs `7059`: `bg1/bg2/bg3` tilemaps, `vram.bin`, and `oam.bin` match
  exactly; `cgram.bin` and `ppu_state.json` differ; visible sprites stay
  `0 -> 0`.
- Exact-hit anchors are reconstructed from singleton source rows in
  `tools/out/l001210_probe_7051_inputfix_summary.json` because the per-hit
  `td2_boot_probe_l001210_exec.json` for this later-scene run is not preserved
  locally.
