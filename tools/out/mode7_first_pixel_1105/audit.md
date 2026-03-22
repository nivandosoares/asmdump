# Mode 7 first-pixel audit

## Canonical Frame

- frame: `1105`
- plateau analysis: `/home/nivando-soares/asmdump/tools/out/mode7_plateau_1105/analysis.json`
- frame dir: `/home/nivando-soares/asmdump/tools/out/mesen_range_1102_1109_v1/frame_01105`
- design dir: `/home/nivando-soares/asmdump/tools/out/design_mesen_range_1102_1109_v1/frame_01105`
- BG diff bbox: `24,67 -> 232,138`
- target scanlines: `67, 102, 138`
- target columns: `0, 1, 24, 25, 128`

## Visible-State Delta

- no focused `Mode 7` state deltas between `ppu_state.json` and `ppu_state_visible.json`

## Model Compare

| model | state | sample order | x bias | y bias | full scene | bg-only |
|---|---|---|---:|---:|---:|---:|
| `base_current` | `base` | `sample-then-increment` | `0` | `0` | `2698` | `3982` |
| `visible_state_current` | `visible` | `sample-then-increment` | `0` | `0` | `2698` | `3982` |
| `sample_after_increment` | `base` | `increment-then-sample` | `0` | `0` | `2780` | `3613` |
| `x_origin_plus1` | `base` | `sample-then-increment` | `1` | `0` | `2780` | `3613` |
| `line_plus1` | `base` | `sample-then-increment` | `0` | `1` | `0` | `2271` |

## Coordinate Samples

### `base_current`

| scanline | screen x | source x | source y | outside map |
|---:|---:|---:|---:|---|
| `67` | `0` | `0` | `65` | `False` |
| `67` | `1` | `1` | `65` | `False` |
| `67` | `24` | `24` | `65` | `False` |
| `67` | `25` | `25` | `65` | `False` |
| `67` | `128` | `128` | `65` | `False` |
| `102` | `0` | `0` | `100` | `False` |
| `102` | `1` | `1` | `100` | `False` |
| `102` | `24` | `24` | `100` | `False` |
| `102` | `25` | `25` | `100` | `False` |
| `102` | `128` | `128` | `100` | `False` |
| `138` | `0` | `0` | `137` | `False` |
| `138` | `1` | `1` | `137` | `False` |
| `138` | `24` | `24` | `137` | `False` |
| `138` | `25` | `25` | `137` | `False` |
| `138` | `128` | `128` | `137` | `False` |

### `visible_state_current`

| scanline | screen x | source x | source y | outside map |
|---:|---:|---:|---:|---|
| `67` | `0` | `0` | `65` | `False` |
| `67` | `1` | `1` | `65` | `False` |
| `67` | `24` | `24` | `65` | `False` |
| `67` | `25` | `25` | `65` | `False` |
| `67` | `128` | `128` | `65` | `False` |
| `102` | `0` | `0` | `100` | `False` |
| `102` | `1` | `1` | `100` | `False` |
| `102` | `24` | `24` | `100` | `False` |
| `102` | `25` | `25` | `100` | `False` |
| `102` | `128` | `128` | `100` | `False` |
| `138` | `0` | `0` | `137` | `False` |
| `138` | `1` | `1` | `137` | `False` |
| `138` | `24` | `24` | `137` | `False` |
| `138` | `25` | `25` | `137` | `False` |
| `138` | `128` | `128` | `137` | `False` |

### `sample_after_increment`

| scanline | screen x | source x | source y | outside map |
|---:|---:|---:|---:|---|
| `67` | `0` | `1` | `65` | `False` |
| `67` | `1` | `2` | `65` | `False` |
| `67` | `24` | `25` | `65` | `False` |
| `67` | `25` | `26` | `65` | `False` |
| `67` | `128` | `129` | `65` | `False` |
| `102` | `0` | `1` | `100` | `False` |
| `102` | `1` | `2` | `100` | `False` |
| `102` | `24` | `25` | `100` | `False` |
| `102` | `25` | `26` | `100` | `False` |
| `102` | `128` | `129` | `100` | `False` |
| `138` | `0` | `1` | `137` | `False` |
| `138` | `1` | `2` | `137` | `False` |
| `138` | `24` | `25` | `137` | `False` |
| `138` | `25` | `26` | `137` | `False` |
| `138` | `128` | `129` | `137` | `False` |

### `x_origin_plus1`

| scanline | screen x | source x | source y | outside map |
|---:|---:|---:|---:|---|
| `67` | `0` | `1` | `65` | `False` |
| `67` | `1` | `2` | `65` | `False` |
| `67` | `24` | `25` | `65` | `False` |
| `67` | `25` | `26` | `65` | `False` |
| `67` | `128` | `129` | `65` | `False` |
| `102` | `0` | `1` | `100` | `False` |
| `102` | `1` | `2` | `100` | `False` |
| `102` | `24` | `25` | `100` | `False` |
| `102` | `25` | `26` | `100` | `False` |
| `102` | `128` | `129` | `100` | `False` |
| `138` | `0` | `1` | `137` | `False` |
| `138` | `1` | `2` | `137` | `False` |
| `138` | `24` | `25` | `137` | `False` |
| `138` | `25` | `26` | `137` | `False` |
| `138` | `128` | `129` | `137` | `False` |

### `line_plus1`

| scanline | screen x | source x | source y | outside map |
|---:|---:|---:|---:|---|
| `67` | `0` | `0` | `66` | `False` |
| `67` | `1` | `1` | `66` | `False` |
| `67` | `24` | `24` | `66` | `False` |
| `67` | `25` | `25` | `66` | `False` |
| `67` | `128` | `128` | `66` | `False` |
| `102` | `0` | `0` | `101` | `False` |
| `102` | `1` | `1` | `101` | `False` |
| `102` | `24` | `24` | `101` | `False` |
| `102` | `25` | `25` | `101` | `False` |
| `102` | `128` | `128` | `101` | `False` |
| `138` | `0` | `0` | `138` | `False` |
| `138` | `1` | `1` | `138` | `False` |
| `138` | `24` | `24` | `138` | `False` |
| `138` | `25` | `25` | `138` | `False` |
| `138` | `128` | `128` | `138` | `False` |

## Reading

- best BG-only model: `line_plus1` -> `2271` mismatched pixels
- best full-scene model: `line_plus1` -> `0` mismatched pixels
- equivalent render outputs:
  - `base_current` == `visible_state_current` (`3982` BG-only / `2698` full-scene)
  - `sample_after_increment` == `x_origin_plus1` (`3613` BG-only / `2780` full-scene)
