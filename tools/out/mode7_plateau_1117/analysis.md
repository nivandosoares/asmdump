# Canonical Mode 7 plateau analysis

## Plateau

- canonical frame: `1117`
- plateau frames: `1117..1117` (`1` frames)
- compare summary: `/home/nivando-soares/asmdump/tools/out/post_1093_compare_1102_1117/summary.json`
- canonical extracted frame: `/home/nivando-soares/asmdump/tools/out/mesen_range_1110_1117_v1/frame_01117`
- canonical design pack: `/home/nivando-soares/asmdump/tools/out/design_mesen_range_1110_1117_v1/frame_01117`

## Plateau identity

- `bg1_visible.ppm` sha1 ranges: `1` distinct
- base diff bbox: `24,68 -> 232,138`

## Canonical compares

- `mode7-ppu` with OAM vs `main_visible`: `2698` mismatched pixels
- `simple` with OAM vs `main_visible`: `2698` mismatched pixels
- no-OAM vs `main_visible`: `9717` mismatched pixels
- no-OAM vs `bg1_visible`: `3982` mismatched pixels
- `bg1_visible` diff bbox: `24,67 -> 232,138`

## Sprite overlap

- sprites touching plateau diff box: `4`
- sprite union inside plateau diff box: `128` / `14839` (`0.862592%`)

## Mode 7 Window Sampling

- BG bbox at base hscroll stays inside the map: `0` outside-map pixels
- BG bbox at best BG-only delta stays inside the map: `0` outside-map pixels
- BG bbox base offset range: `x=24..232`, `y=65..137`

## BG shift scan

- best whole-box horizontal shift: `-1`
- zero-shift mismatch: `3982`
- best-shift mismatch: `3611`

## Mode 7 HScroll Scan

- base `ppu.mode7.hscroll`: `0`
- best BG-only delta: `1` -> `3613` mismatched pixels
- best full-scene delta: `0` -> `2698` mismatched pixels

| hscroll delta | full scene | bg1 only |
|---:|---:|---:|
| `-2` | `4828` | `5572` |
| `-1` | `3828` | `4803` |
| `0` | `2698` | `3982` |
| `1` | `2780` | `3613` |
| `2` | `3829` | `4293` |

### Row best shifts

| shift | rows |
|---:|---:|
| `-1` | `38` |
| `-8` | `16` |
| `0` | `13` |
| `-2` | `4` |
| `-3` | `1` |
