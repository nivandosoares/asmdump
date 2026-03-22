# Lane 2 Handoff After Late `00:8029` Ownership Closure

This note is the explicit resume point for the next agent on Lane 2.

## Read First

- `rom_analysis/docs/intro_00_8029_post_1117_window_1118_1125.md`
- `rom_analysis/docs/intro_00_8029_post_1125_reactivation_1164_1172.md`
- `rom_analysis/docs/intro_00_8029_mode7_blob_cycle_1134_1200.md`
- `tools/out/post_1117_compare_1164_1172/summary.md`
- `tools/out/activity_trace_1134_1200/activity_trace.md`
- `tools/out/mode7_blob_cycle_1134_1200/report.md`

## Closed State

- exact late-attract continuity is now closed through `1133`
  - `00:8029/00:835F`
  - `bg1`
  - `61` visible sprites
  - `0` top-crop mismatch
  - `0` base-render mismatch
  - no `DMA` or direct `VRAM/CGRAM` writes in the steady block
- the first later boundary is now fixed at `1164/1165`
  - `1164` changes `state0204` and `dp0054`
  - `1165` begins the producer-side reactivation
  - this is not a callback-family handoff and not a composed-screen regression
- late-cycle ownership is now closed:
  - `01:B6E3 -> 01:9DC6 -> 00:95BD -> $096A/$0700 -> OAMDATA`
- late-cycle blob identity is now closed:
  - direct `VMDATA` bursts and paired `DMA0` bursts match the same ROM blob on
    every sampled burst frame
  - blob family: `AA10`, `AB58`, `ACA0`
  - visible Mode 7 destinations: `0x4920`, `0x49A0`
- tilemap-to-ROM provenance remains intentionally capped at `1117`
  - no new direct tilemap chunk anchor exists beyond that point

## Do Not Repeat

- do not reopen the `bg1_visible` export/viewer semantics question
- do not spend more time re-proving who owns the late `00:8029` producer cycle
- do not promote provenance beyond `1117` on continuity/carry alone
- do not infer late burst ownership from extracted end-of-frame `vram.bin`
  alone when write traces already exist

## Next Gate

Derive the later-frame selection/schedule rule strongly enough to express the
late `00:8029` producer cycle as a native replacement path.

The open question is no longer "which producer owns this?" It is:

- which later frames pick `AA10`, `AB58`, or `ACA0`
- which later frames target `0x4920` vs `0x49A0`
- how that schedule relates to `state0204`, `dp0054`, and the `01:B6E3`
  state-machine advance

## Recommended Next Experiment

1. Start from the existing `1134..1200` report instead of launching a new wide
   Mesen capture immediately.
2. Extend `tools/build_mode7_blob_cycle_report.py` or add a companion
   summarizer that emits transition rows:
   - `frame`
   - `state0204`
   - `dp0054`
   - burst/no-burst
   - blob label
   - `VMADD`
3. Use static reads around `01:B6E3`, `01:9DC6`, and any consumers of `$0054`
   or the `0x4920/0x49A0` pair before adding more probe volume.
4. Only after a concrete schedule hypothesis, run one bounded verification
   probe on a narrowed burst window.

## Minimal Validation If Tooling Changes

- `python3 -m py_compile tools/build_mode7_blob_cycle_report.py`
- `python3 tools/build_mode7_blob_cycle_report.py game.smc tools/out/activity_trace_1134_1200/td2_boot_probe.json tools/out/activity_trace_1134_1200/td2_boot_probe_dma_writes.json tools/out/activity_trace_1134_1200/td2_boot_probe_vram_writes.json tools/out/mode7_blob_cycle_1134_1200/report.json --blob AA10:0x1AAA10:0x100 --blob AB58:0x1AAB58:0x100 --blob ACA0:0x1AACA0:0x100 --markdown-out tools/out/mode7_blob_cycle_1134_1200/report.md`

## Checkpoint Trail

- `6cccf8e`: exact continuity extended through `1125`
- `e4eaada`: `1164/1165` producer boundary mapped
- `87e3167`: late `00:8029` blob-cycle ownership closed
