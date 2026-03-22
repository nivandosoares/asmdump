# Post-`1125` `00:8029` Continuation And Reactivation (`1126..1172`)

This note extends the late-attract `00:8029` read in two steps:

- close exact visual continuity for the next sampled block `1126..1133`
- then use a wider probe to find the first producer-side transition after that
  steady block, narrowed to a visual boundary window at `1164..1172`

Primary artifacts:

- `tools/out/activity_trace_1126_1133/activity_trace.json`
- `tools/out/activity_trace_1126_1133/activity_trace.md`
- `tools/out/visual_contract_range_1126_1133_activity/visual_contract_range.json`
- `tools/out/post_1117_compare_1126_1133/summary.json`
- `tools/out/post_1117_compare_1126_1133/summary.md`
- `tools/out/activity_trace_1134_1200/activity_trace.json`
- `tools/out/activity_trace_1134_1200/activity_trace.md`
- `tools/out/activity_trace_1164_1172/activity_trace.json`
- `tools/out/activity_trace_1164_1172/activity_trace.md`
- `tools/out/visual_contract_range_1164_1172_activity/visual_contract_range.json`
- `tools/out/post_1117_compare_1164_1172/summary.json`
- `tools/out/post_1117_compare_1164_1172/summary.md`

Builder path:

- `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=180 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/activity_trace_1126_1133/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=1134 TD2_BOOT_PROBE_TRACE_START_FRAME=1126 TD2_BOOT_PROBE_TRACE_END_FRAME=1133 TD2_BOOT_PROBE_TRACE_DMA=1 TD2_BOOT_PROBE_TRACE_VRAM=1 TD2_BOOT_PROBE_TRACE_MODE7=1 ./validation/run_mesen_probe_boot.sh`
- `python3 tools/build_mesen_activity_trace.py tools/out/activity_trace_1126_1133/td2_boot_probe.json tools/out/activity_trace_1126_1133/activity_trace.json --markdown-out tools/out/activity_trace_1126_1133/activity_trace.md`
- `python3 tools/extract_mesen_scene_range.py --rom game.smc --start-frame 1126 --end-frame 1133 --step 1 --out-dir tools/out/mesen_range_1126_1133_v1 --ld-library-path /home/nivando-soares/Mesen2/bin/linux-x64/Release --frame-timeout-seconds 180`
- `python3 tools/build_mesen_design_pack_range.py tools/out/mesen_range_1126_1133_v1 tools/out/design_mesen_range_1126_1133_v1 --clean-out`
- `python3 tools/build_mesen_visual_contract_range.py tools/out/design_mesen_range_1126_1133_v1 tools/out/visual_contract_range_1126_1133_activity --probe-json tools/out/activity_trace_1126_1133/td2_boot_probe.json --activity-trace-json tools/out/activity_trace_1126_1133/activity_trace.json --clean-out`
- `python3 tools/build_mesen_window_compare.py tools/out/post_1117_compare_1126_1133/summary.json tools/out/mesen_range_1126_1133_v1 --activity-trace-json tools/out/activity_trace_1126_1133/activity_trace.json --markdown-out tools/out/post_1117_compare_1126_1133/summary.md`
- `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=180 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/activity_trace_1134_1200/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=1201 TD2_BOOT_PROBE_TRACE_START_FRAME=1134 TD2_BOOT_PROBE_TRACE_END_FRAME=1200 TD2_BOOT_PROBE_TRACE_DMA=1 TD2_BOOT_PROBE_TRACE_VRAM=1 TD2_BOOT_PROBE_TRACE_MODE7=1 ./validation/run_mesen_probe_boot.sh`
- `python3 tools/build_mesen_activity_trace.py tools/out/activity_trace_1134_1200/td2_boot_probe.json tools/out/activity_trace_1134_1200/activity_trace.json --markdown-out tools/out/activity_trace_1134_1200/activity_trace.md`
- `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=180 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/activity_trace_1164_1172/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=1173 TD2_BOOT_PROBE_TRACE_START_FRAME=1164 TD2_BOOT_PROBE_TRACE_END_FRAME=1172 TD2_BOOT_PROBE_TRACE_DMA=1 TD2_BOOT_PROBE_TRACE_VRAM=1 TD2_BOOT_PROBE_TRACE_MODE7=1 ./validation/run_mesen_probe_boot.sh`
- `python3 tools/build_mesen_activity_trace.py tools/out/activity_trace_1164_1172/td2_boot_probe.json tools/out/activity_trace_1164_1172/activity_trace.json --markdown-out tools/out/activity_trace_1164_1172/activity_trace.md`
- `python3 tools/extract_mesen_scene_range.py --rom game.smc --start-frame 1164 --end-frame 1172 --step 1 --out-dir tools/out/mesen_range_1164_1172_v1 --ld-library-path /home/nivando-soares/Mesen2/bin/linux-x64/Release --frame-timeout-seconds 180`
- `python3 tools/build_mesen_design_pack_range.py tools/out/mesen_range_1164_1172_v1 tools/out/design_mesen_range_1164_1172_v1 --clean-out`
- `python3 tools/build_mesen_visual_contract_range.py tools/out/design_mesen_range_1164_1172_v1 tools/out/visual_contract_range_1164_1172_activity --probe-json tools/out/activity_trace_1164_1172/td2_boot_probe.json --activity-trace-json tools/out/activity_trace_1164_1172/activity_trace.json --clean-out`
- `python3 tools/build_mesen_window_compare.py tools/out/post_1117_compare_1164_1172/summary.json tools/out/mesen_range_1164_1172_v1 --activity-trace-json tools/out/activity_trace_1164_1172/activity_trace.json --markdown-out tools/out/post_1117_compare_1164_1172/summary.md`

## Exact Continuity Through `1133`

The next sampled block after the old `1118..1125` checkpoint stays fully flat:

- sampled frames:
  - `1126..1133`
- per-frame compare stays exact:
  - top `224` lines of `main.ppm` vs `main_visible.ppm` -> `0` mismatched
    pixels
  - default base render vs `main_visible.ppm` -> `0` mismatched pixels
- callback/activity surface also stays flat:
  - main callback `00:8029`
  - IRQ callback `00:835F`
  - `bgMode = 7`
  - main-screen layer `bg1`
  - visible OBJ count `61`
  - DMA events `0`
  - direct `VRAM/CGRAM` events `0`
  - `Mode 7` events `3` per frame
  - `Mode 7` writes `16` per frame

Reading:

- the exact late-attract continuity now extends at least through `1133`
- there is still no callback-family handoff or renderer regression immediately
  after the earlier `1125` edge

## Wide Frontier Probe (`1134..1200`)

The next useful step was no longer another blind extraction block, but a wider
probe to find the first real producer-side change.

Stable stretch:

- `1134..1163`
  - main callback `00:8029`
  - IRQ callback `00:835F`
  - `state0204 = 1`
  - `state0206 = 13`
  - `state040a = 17`
  - `dp0054 = 128`
  - DMA events `0`
  - direct `VRAM/CGRAM` events `0`
  - `Mode 7` events `3` per frame
  - `Mode 7` writes `16` per frame

First boundary:

- `1164`
  - callback family still unchanged
  - `state0204` steps to `2`
  - `dp0054` steps to `136`
  - DMA/direct activity is still `0`

Producer-side reactivation:

- starts at `1165` without leaving `00:8029`
- `1165..1200` now carries OAM DMA every frame sampled by the probe
- the first observed VRAM producer burst frames are:
  - `1165` -> DMA source `1A:AB58`
  - `1170` -> DMA source `1A:ACA0`
  - `1172` -> DMA source `1A:AA10`
- those burst frames also add direct `VRAM` data writes and raise the
  per-frame `Mode 7` write count from `16` to `274`

Reading:

- the next important boundary after `1133` is not a callback switch
- it is a producer-side reactivation inside the same `00:8029` family, with
  new `OAM` and `VRAM` work beginning at `1165`

## Reactivation Window (`1164..1172`)

The narrowed boundary window shows that the new producer activity still does
not break the already-solved composed-screen compare:

- sampled frames:
  - `1164..1172`
- exact compare still holds:
  - top-crop mismatch: `0` for every frame
  - default base-render mismatch: `0` for every frame
- the visible presentation surface remains stable:
  - `bgMode = 7`
  - main-screen layer `bg1`
  - visible OBJ count `61`
  - main callback `00:8029`
- activity shifts sharply at the producer layer:
  - `1164`: `dma=0`, direct=`0`, `mode7 writes=16`
  - `1165`: `dma=2`, direct=`3`, `mode7 writes=274`
  - `1166..1169`: `dma=1`, direct=`0`, `mode7 writes=16`
  - `1170`: `dma=2`, direct=`3`, `mode7 writes=274`
  - `1171`: `dma=1`, direct=`0`, `mode7 writes=16`
  - `1172`: `dma=2`, direct=`3`, `mode7 writes=274`
- direct-source reading in this narrowed window:
  - `1165`: VRAM DMA `1A:AB58`, OAM DMA `00:0700`
  - `1170`: VRAM DMA `1A:ACA0`, OAM DMA `00:0700`
  - `1172`: VRAM DMA `1A:AA10`, OAM DMA `00:0700`

Secondary compare reading:

- bottom-crop mismatch drifts from `21300` at `1164..1168` down to `21258` by
  `1172`
- the visible-state compare remains unavailable because this window also lacks
  `ppu_state_visible.json`

Reading:

- the late `00:8029` tail now has a new internal phase boundary at `1164/1165`
- that boundary is producer-visible (`DMA/VRAM/OAM`), not yet a composed-screen
  regression

## Practical Reading

- Lane 2 exact visual continuity is now closed through `1133`
- the first later-window change after that stable block is the `1164/1165`
  producer-side reactivation, not a callback-family handoff
- the next useful Lane 2 step is to follow that `00:8029` reactivation cycle
  forward and tie the rotating `1A:AA10/AB58/ACA0` VRAM producers plus the
  renewed `00:0700` OAM DMA path back to ROM-side/native-replacement ownership
- tilemap-to-ROM provenance still remains intentionally capped at `1117` until
  a stronger direct provenance anchor appears
