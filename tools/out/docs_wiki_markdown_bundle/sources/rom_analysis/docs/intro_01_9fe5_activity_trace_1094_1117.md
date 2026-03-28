# Active Mesen Behavior Trace: `1094..1117`

This note captures the first lane-oriented "active behavior" read built from
`mesen_probe_boot.lua` trace outputs rather than only from frame dumps and
compare images.

## Goal

Map what the game is actively programming during the post-`1093` late-attract
window:

- `DMA/HDMA`
- direct `VRAM/CGRAM` writes
- `Mode 7` / related PPU register programming
- callback-family ownership at the same frames

This is meant to answer "what is the game doing?" before deciding whether the
next mismatch is:

- renderer behavior
- export/composition choice
- hidden upload activity
- callback-family transition

## Commands

Capture the active trace:

```sh
MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release \
MESEN_TIMEOUT_SECONDS=180 \
TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/activity_trace_1094_1117/td2_boot_probe \
TD2_BOOT_PROBE_TOTAL_FRAMES=1118 \
TD2_BOOT_PROBE_TRACE_START_FRAME=1094 \
TD2_BOOT_PROBE_TRACE_END_FRAME=1117 \
TD2_BOOT_PROBE_TRACE_DMA=1 \
TD2_BOOT_PROBE_TRACE_VRAM=1 \
TD2_BOOT_PROBE_TRACE_MODE7=1 \
./validation/run_mesen_probe_boot.sh
```

Build the normalized activity trace:

```sh
python3 tools/build_mesen_activity_trace.py \
  tools/out/activity_trace_1094_1117/td2_boot_probe.json \
  tools/out/activity_trace_1094_1117/activity_trace.json \
  --markdown-out tools/out/activity_trace_1094_1117/activity_trace.md
```

## Artifacts

- `tools/out/activity_trace_1094_1117/td2_boot_probe.json`
- `tools/out/activity_trace_1094_1117/td2_boot_probe_dma_writes.json`
- `tools/out/activity_trace_1094_1117/td2_boot_probe_vram_writes.json`
- `tools/out/activity_trace_1094_1117/td2_boot_probe_mode7_writes.json`
- `tools/out/activity_trace_1094_1117/activity_trace.json`
- `tools/out/activity_trace_1094_1117/activity_trace.md`

## Current Reading

### 1. There are no direct `VRAM/CGRAM` data writes in `1094..1117`

- `td2_boot_probe_vram_writes.json` records `0` writes.
- The normalized activity trace reports:
  - direct write events: `0`
  - direct write kinds: `{}`.

Practical reading:

- this window is not hiding a direct `VMDATAL/VMDATAH` or `CGDATA` upload path
- the next mismatch work should not assume a missed direct `VRAM/CGRAM`
  transfer in this block

### 2. `OAM` DMA remains active through `1113`, then stops

- The activity trace records exactly `20` DMA events across frames
  `1094..1113`.
- Every DMA event is the same:
  - `DMAEN = 0x02`
  - channel `1`
  - target `OAMDATA` (`00:2104`)
  - source `00:0700`
  - size `544` bytes
  - scanline `227`
- Frames `1114..1117` record no DMA event at all.

Practical reading:

- there is a clean late-window boundary at `1114`
- if visual behavior changes after `1113`, it is now reasonable to test that
  boundary against the disappearance of the per-frame OAM upload rather than
  treating `1102..1117` as one uniform block

### 3. The callback-family switch happens at `1102`

- Frame snapshots in `td2_boot_probe.json` show:
  - `1094..1101`: `active_main = 01:9FE5`
  - `1102..1117`: `active_main = 00:8029`
- `active_irq` stays `00:835F` across the whole traced window.

Practical reading:

- the late continuation is not a pure "same callback family keeps going"
- the next follow-up should split the post-`1093` lane at `1102`, not only at
  `1094`

### 4. The main state tuple stays stable across that callback switch

Across `1094..1117`, frame snapshots keep:

- `$0204 = 1`
- `$0206 = 13`
- `$040A = 17`
- `$0054 = 128`

Practical reading:

- the `1101 -> 1102` transition is not explained by the currently sampled
  state tuple alone
- this points back to callback ownership and active upload/programming behavior
  rather than an obvious coarse state change

### 5. `Mode 7` programming narrows after `1101`

The normalized activity trace shows:

- `1094..1101`
  - `4` Mode 7 events per frame
  - scanlines `225`, `226`, `227`, and `231`
  - includes a late `M7A/M7D` pair at scanline `231`
- `1102..1117`
  - `3` Mode 7 events per frame
  - scanlines `225`, `226`, `227` only
  - no `M7A/M7D` event remains
- the remaining repeated register set after `1101` is:
  - `M7HOFS`
  - `M7VOFS`
  - `$210F..$2114`

Practical reading:

- there is a second concrete boundary at `1102`
- the late window after the callback switch is not only "same writes under a
  different callback"; it is a smaller repeated register program

## Summary

The active-trace read narrows the late attract problem substantially:

- `1094..1101`
  - still under `01:9FE5`
  - per-frame `OAM` DMA continues
  - per-frame `M7A/M7D` scanline-`231` update still exists
- `1102..1113`
  - now under `00:8029`
  - per-frame `OAM` DMA still exists
  - the `M7A/M7D` update is gone
- `1114..1117`
  - still under `00:8029`
  - no per-frame `OAM` DMA remains
  - only the smaller repeated `Mode 7` register program continues

This is stronger than the earlier compare-only reading because it shows the
window is not one monolithic "post-`1093` continuation." It has at least two
real active-behavior boundaries:

- `1102`
- `1114`

## Next Best Step

Use those boundaries explicitly in the Lane 2 follow-up:

1. treat `1094..1101`, `1102..1113`, and `1114..1117` as separate compare and
   ownership subwindows
2. test whether the residual mismatch pattern tracks:
   - the `01:9FE5 -> 00:8029` callback switch at `1102`
   - the disappearance of the `00:0700 -> OAMDATA` DMA at `1114`
3. do not spend time searching for hidden direct `VRAM/CGRAM` uploads in this
   window unless a later targeted trace contradicts the current proof
