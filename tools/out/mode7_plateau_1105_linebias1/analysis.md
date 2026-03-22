# Canonical Mode 7 plateau analysis

## Plateau

- canonical frame: `1105`
- plateau frames: `1105..1117` (`13` frames)
- compare summary: `/home/nivando-soares/asmdump/tools/out/post_1093_compare_1102_1117_linebias1/summary.json`
- canonical extracted frame: `/home/nivando-soares/asmdump/tools/out/mesen_range_1102_1109_v1/frame_01105`
- canonical design pack: `/home/nivando-soares/asmdump/tools/out/design_mesen_range_1102_1109_v1/frame_01105`

## Plateau identity

- `bg1_visible.ppm` sha1 ranges: `1` distinct
- base diff bbox: `none` (composed-screen compare is exact)

## Canonical compares

- `mode7-ppu` with OAM vs `main_visible`: `0` mismatched pixels
- `simple` with OAM vs `main_visible`: `0` mismatched pixels
- no-OAM vs `main_visible`: `7019` mismatched pixels
- no-OAM vs `bg1_visible`: `2271` mismatched pixels
- `bg1_visible` diff bbox: `24,67 -> 231,120`

## Sprite overlap

- sprites touching plateau diff box: `n/a` (composed-screen diff box is absent)
- sprite union inside plateau diff box: `n/a`

## Mode 7 Window Sampling

- BG bbox at base hscroll stays inside the map: `0` outside-map pixels
- BG bbox at best BG-only delta stays inside the map: `0` outside-map pixels
- BG bbox base offset range: `x=24..231`, `y=65..118`

## BG shift scan

- best whole-box horizontal shift: `-1`
- zero-shift mismatch: `2271`
- best-shift mismatch: `2169`

## Mode 7 HScroll Scan

- base `ppu.mode7.hscroll`: `0`
- best BG-only delta: `0` -> `2271` mismatched pixels
- best full-scene delta: `0` -> `0` mismatched pixels

| hscroll delta | full scene | bg1 only |
|---:|---:|---:|
| `-2` | `3992` | `4695` |
| `-1` | `2509` | `3579` |
| `0` | `0` | `2271` |
| `1` | `2509` | `2503` |
| `2` | `3992` | `3667` |

### Row best shifts

| shift | rows |
|---:|---:|
| `-1` | `30` |
| `0` | `18` |
| `-8` | `2` |
| `-5` | `2` |
| `-4` | `1` |
| `1` | `1` |

