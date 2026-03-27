# Validation

This directory contains the first validation harness artifact for Sprint 0.

Current asset:

- `mesen_capture.lua`: a Mesen-S/Mesen 2 Lua script that can override input for a fixed window, emit per-frame screenshots, and write a JSON input log
- `run_mesen_capture.sh`: a launcher that creates an isolated Mesen config inside the repo, enables Lua file I/O, and runs the script in `--testRunner` mode
- `mesen_probe_boot.lua`: a lightweight state probe that records boot/title selectors like `$1C78/$1C7A/$1CCA/...` once per frame
- `run_mesen_probe_boot.sh`: convenience wrapper around the generic launcher for the boot probe
- `mesen_dump_bg_range.lua`: single-run range dumper for `VRAM + CGRAM + PPU state` and optional screenshots on selected frames
- `run_mesen_dump_bg_range.sh`: convenience wrapper around the generic launcher for that range dumper
- `mesen_scanline_step_test.lua`: an experimental scanline-step probe that uses `emu.step(..., ppuScanline)` plus `codeBreak` to sample `emu.getState()` once per visible scanline on a target frame; it now also accepts the same seeded savestate/input-window pattern used by the gameplay harnesses, records gameplay-facing layer scroll/callback fields alongside the old `ppu.mode7.*` values, and emits `frame_events` snapshots for traced `start`/`end` frame boundaries

Expected workflow:

1. Boot the ROM in Mesen-S.
2. Navigate manually to a deterministic starting point, or load a known savestate at the start of track 1.
3. Load `validation/mesen_capture.lua`.
4. Let the script wait through its configured warm-up frames.
5. The script will hold the configured input pattern for 300 frames and dump PNGs plus a JSON log.

For automated headless runs with Mesen2's test runner:

```sh
./validation/run_mesen_capture.sh
```

For short review windows where you want a reproducible bundle of visual
artifacts instead of a one-off capture, use:

```sh
python3 tools/run_mesen_guided_export.py \
  intro_mode7_rotation \
  1094 \
  1101 \
  --input-windows '6800:start;6900-6920:start,a' \
  --question 'Is this window rotating the same Mode 7 source blob or switching producers?'
```

That wrapper assembles the repo's current high-signal review surfaces in one
place:

- bridge-extracted frame folders under `tools/out/<slug>_<start>_<end>_frames/`
- design packs under `tools/out/<slug>_<start>_<end>_design/`
- a boot probe with `DMA/VRAM/Mode7` traces plus producer-side
  `write_point_trace`
- normalized activity trace JSON/Markdown
- visual contracts for the whole range
- a Markdown note skeleton under `rom_analysis/docs/`

Useful options:

- `--savestate <path>`: seed the probe from a deterministic state
- `--with-provenance --chunk-validation tools/out/bank13_chunk_validation.json`:
  also build a tilemap provenance artifact from the generated
  `td2_boot_probe_l001210_exec.json`
- `--dry-run`: print the exact commands and paths without executing Mesen
- `--skip-*`: reuse existing extracted frames or probes while rebuilding later
  stages

The default probe configuration is intentionally review-oriented rather than
minimal: it enables `DMA`, direct `VRAM`, `Mode 7`, and
`OAM/VRAM/CGRAM` register write tracing so the resulting visual-contract bundle
is useful for later callback/state attribution instead of only pixel review.

For the experimental instrumented-Mesen backend path, use:

```sh
MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release \
MESEN_TIMEOUT_SECONDS=90 \
./validation/run_mesen_lab_backend.sh \
  ./game.smc \
  --load-state ./.mesen-config/Mesen2/SaveStates/game_11.mss \
  --run-range 18030:18032 \
  --probe-set frame_core_probe,dma_vram_probe,mode7_probe \
  --export-dir tools/out/mesen_lab_mvp_18030_18032
```

That launcher:

- prepares the same isolated `XDG_CONFIG_HOME=.mesen-config` setup used by the
  Lua-based runners
- calls the local `Mesen --labRunner` backend mode directly instead of the Lua
  test runner
- normalizes `--load-state`, `--export-dir`, and `--manifest-out` paths
- enforces an outer shell timeout via `MESEN_TIMEOUT_SECONDS`

Current MVP capture semantics for `--labRunner` are explicit on purpose:

- the runner aligns to a frame boundary first
- each exported frame stores both `startBoundary` and `endBoundary`
- the event snapshot is taken at the end boundary with
  `ShowPreviousFrameEvents = true`
- `frame.json` therefore preserves both state surfaces instead of pretending
  the step landed on a single canonical instant

Current bundle layout:

- `manifest.json`
- `summary.json`
- `frame_XXXXXX/frame.json`
- `frame_XXXXXX/events.json`
- optional `frame_XXXXXX/vram.bin`, `cgram.bin`, `oam.bin` for
  `dma_vram_probe`

See also:

- `rom_analysis/docs/mesen_instrumented_backend_architecture.md`

For the targeted non-square OBJ vertical-mirror regression, build the runtime
and run:

```sh
make -C tools obj-vertical-flip-check
```

That check generates a tiny 16x32 vertically mirrored sprite fixture under
`tools/out/obj_vertical_flip_check/` and verifies four paths against the same
golden PPM:

- Python `render_mesen_snes_bg.py` simple OBJ renderer
- Python `render_mesen_snes_bg.py --obj-renderer mode7-ppu`
- SDL runtime direct `--snes-bg-*` render in non-Mode-7
- SDL runtime direct `--snes-bg-*` render in Mode 7

For the BG4 plus tile-priority regression, run:

```sh
make -C tools bg-layer-priority-check
```

That check generates a tiny four-layer mode-0 scene under
`tools/out/bg_layer_priority_check/` and verifies:

- BG4-only visibility
- low-priority layer ordering
- high-priority tile ordering over lower-priority foreground tiles
- the same result in both `render_mesen_snes_bg.py` and the SDL runtime

For routine repo hygiene before switching lanes, run:

```sh
make -C tools clean-generated-dry-run
make -C tools clean-generated
```

`tools/out/` is now git-ignored by default. Existing tracked proof artifacts in
that tree still behave normally, but newly promoted evidence from `tools/out/`
should be added explicitly with `git add -f`.

`run_mesen_capture.sh` now resolves the emulator in this order:

- `MESEN_BIN`
- `MESEN_RELEASE_DIR/Mesen`
- `Mesen` or `mesen` on `PATH`

The shared launcher now also normalizes these paths before invoking
`Mesen --testRunner`:

- ROM path and Lua script path: relative to the caller's current directory
- optional savestate path: relative to the caller's current directory
- repo-facing output prefixes like `tools/out/...`: relative to the repo root

This matters because the Mesen test runner resolves Lua relative file I/O under
the isolated config tree (`.mesen-config/Mesen2`), not the repo cwd. Without
that normalization, nested repo-relative prefixes can time out after silent
write failures inside the config directory.

For the bridge extractor path, `tools/run_mesen_ppu_extract.sh` uses
`MESEN_RELEASE_DIR` to locate `MesenCore.so` and can also derive that directory
from `MESEN_BIN` or `PATH`.

`mesen_capture.lua` now accepts the same lightweight env-style overrides used by
the other probes:

- `TD2_CAPTURE_WARMUP_FRAMES`
- `TD2_CAPTURE_FRAMES`
- `TD2_CAPTURE_SCREENSHOT_EVERY`
- `TD2_CAPTURE_PLAYER`
- `TD2_CAPTURE_OUTPUT_PREFIX`
- `TD2_CAPTURE_INPUT`
- `TD2_CAPTURE_INPUT_START_FRAME`
- `TD2_CAPTURE_INPUT_END_FRAME`
- `TD2_CAPTURE_INPUT_WINDOWS`

`TD2_CAPTURE_INPUT_WINDOWS` uses the same semicolon-separated `start-end:buttons`
or `frame:buttons` format as the boot probe, for example:

```sh
MESEN_TIMEOUT_SECONDS=60 \
TD2_CAPTURE_OUTPUT_PREFIX=tools/out/track1_seed_sweep_v1/start_then_b_hold/capture \
TD2_CAPTURE_INPUT_WINDOWS='60:start;61-359:b' \
./validation/run_mesen_capture.sh ./game.smc ./validation/mesen_capture.lua ./.mesen-config/Mesen2/SaveStates/game_11.mss
```

To seed the run from a deterministic savestate instead of power-on:

```sh
./validation/run_mesen_capture.sh ./game.smc ./validation/mesen_capture.lua /absolute/path/to/start_state.mss
```

To inspect the boot/title selectors directly:

```sh
./validation/run_mesen_probe_boot.sh
```

`mesen_probe_boot.lua` now also accepts callback-relative input windows through
`TD2_BOOT_PROBE_TRIGGER_INPUT_WINDOWS`.

That format is:

- `point_id+offset:buttons`
- `point_id+start-end:buttons`

where `point_id` matches a labeled entry from `TD2_BOOT_PROBE_TRACE_EXEC_POINTS`.

Example:

```sh
MESEN_TIMEOUT_SECONDS=60 \
TD2_BOOT_PROBE_TRACE_EXEC_POINTS='c1d2=01:C1D2' \
TD2_BOOT_PROBE_INPUT_WINDOWS='1200:start;1280:start;1505-1510:start' \
TD2_BOOT_PROBE_TRIGGER_INPUT_WINDOWS='c1d2+1-6:right,down;c1d2+8-13:start' \
./validation/run_mesen_probe_boot.sh ./game.smc
```

The probe JSON now records both `trigger_input_windows` and the first traced
frame for each exec-point id under `exec_point_trace.first_frames`.

For direct state-window comparison between two recovered boot probes, use
`tools/compare_boot_probe_windows.py`:

```sh
python3 tools/compare_boot_probe_windows.py \
  tools/out/select_opponent_clock_path_v2/td2_boot_probe.json \
  tools/out/select_opponent_clock_path_v7_be43_confirm/td2_boot_probe.json \
  tools/out/snes_select_opponent_post_9016_state_compare.json \
  --markdown-out tools/out/snes_select_opponent_post_9016_state_compare.md \
  --label-a default_rival \
  --label-b no_opponent_clock \
  --start-frame 2044 \
  --end-frame 2199
```

That compare is useful when both lanes already share the same callback family
and you want to narrow the remaining WRAM split instead of rerunning Mesen
blindly.

For producer-side visual ownership tracing, the same probe can now carry
write-breakpoint hits for `VRAM/CGRAM/OAM`-related registers. The resulting
`td2_boot_probe.json` can be fed into
`tools/build_mesen_visual_contract.py --probe-json ...`:

```sh
MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release \
MESEN_TIMEOUT_SECONDS=75 \
TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/visual_contract_probe_986/td2_boot_probe \
TD2_BOOT_PROBE_TOTAL_FRAMES=987 \
TD2_BOOT_PROBE_TRACE_START_FRAME=982 \
TD2_BOOT_PROBE_TRACE_END_FRAME=986 \
TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' \
TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=8192 \
./validation/run_mesen_probe_boot.sh
```

Then merge that probe payload into a visual contract:

```sh
python3 tools/build_mesen_visual_contract.py \
  tools/out/design_mesen_range_7051_inputfix_v1/frame_07051 \
  tools/out/visual_contract_7051_with_probe.json \
  --provenance-json rom_analysis/maps/tilemaps/mesen_range_7051_provenance.jsonc \
  --probe-json tools/out/visual_contract_probe_7051/td2_boot_probe.json
```

`td2_boot_probe.json` now also preserves `trace_start_frame` and
`trace_end_frame` in the main payload, so merged visual contracts can retain an
exact `producerTrace.traceWindow` instead of only the per-domain frame spans.

For active behavior mapping beyond coarse `write_point_trace` counts, the same
probe can also emit:

- `*_dma_writes.json`
- `*_vram_writes.json`
- `*_mode7_writes.json`

Those traces can be normalized into one frame/callback-oriented activity report
with `tools/build_mesen_activity_trace.py`:

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

python3 tools/build_mesen_activity_trace.py \
  tools/out/activity_trace_1094_1117/td2_boot_probe.json \
  tools/out/activity_trace_1094_1117/activity_trace.json \
  --markdown-out tools/out/activity_trace_1094_1117/activity_trace.md
```

This path is useful when the question is no longer just "which domain wrote
something?" but:

- which callback family owned the writes
- which scanline they landed on
- whether the window is doing `DMA`, direct `VRAM/CGRAM` writes, or only
  repeated register programming
- whether a later mismatch boundary aligns with a real behavior change
  (`callback` switch, `OAM` DMA shutdown, `Mode 7` register-set reduction, and
  so on)

The visual-contract builders can now also merge that normalized activity layer
directly with `--activity-trace-json`, so a range summary can carry
`callback/state + BG/OBJ surface + DMA/direct/Mode7 activity` in the same
artifact:

```sh
python3 tools/build_mesen_visual_contract_range.py \
  tools/out/design_mesen_range_1102_1109_v1 \
  tools/out/visual_contract_range_1102_1109_activity \
  --provenance-json rom_analysis/maps/tilemaps/mesen_range_1102_1109_provenance.jsonc \
  --probe-json tools/out/activity_trace_1094_1117/td2_boot_probe.json \
  --activity-trace-json tools/out/activity_trace_1094_1117/activity_trace.json \
  --clean-out
```

For the post-`1093` compare rubric itself, use:

```sh
python3 tools/build_mesen_window_compare.py \
  tools/out/post_1093_compare_1102_1117/summary.json \
  tools/out/mesen_range_1102_1109_v1 \
  tools/out/mesen_range_1110_1117_v1 \
  --activity-trace-json tools/out/activity_trace_1094_1117/activity_trace.json \
  --markdown-out tools/out/post_1093_compare_1102_1117/summary.md
```

The Python `Mode 7` compare path now defaults to the promoted scanline-start
rule `line + 1`:

- `tools/render_mesen_snes_bg.py`
- `tools/build_mesen_window_compare.py`
- `tools/build_mode7_plateau_analysis.py`

Use the default for normal Lane 2 evidence generation. Only pass
`--mode7-line-bias 0` when you want the old current-line counterfactual for a
targeted validation or source-comparison run.

That promotion is intentionally scoped to the Python/tooling path for now. The
same rule is not yet committed into the SDL runtime because
`port/src/td2_ppu.c` currently carries unrelated dirty work and should not be
mixed with this checkpoint.

That builder automates the same questions that were previously being answered
by hand:

- whether `main_visible.ppm` is still the top crop of `main.ppm`
- whether a visible-state `ppu_state_visible.json` render helps or hurts
- whether the compare boundary lines up with a real activity boundary like
  `callback` change or `OAM DMA` shutdown

For the narrower static-plateau follow-up after the compare summary already
exists, use:

```sh
python3 tools/build_mode7_plateau_analysis.py \
  tools/out/post_1093_compare_1102_1117/summary.json \
  tools/out/design_mesen_range_1102_1109_v1 \
  tools/out/design_mesen_range_1110_1117_v1 \
  tools/out/mode7_plateau_1105/analysis.json \
  --markdown-out tools/out/mode7_plateau_1105/analysis.md
```

For the exact-hit `pixel 0 / X-origin / scanline-start` follow-up on the same
canonical plateau, use:

```sh
python3 tools/build_mode7_first_pixel_audit.py \
  tools/out/mode7_plateau_1105/analysis.json \
  tools/out/mode7_first_pixel_1105/audit.json \
  --markdown-out tools/out/mode7_first_pixel_1105/audit.md
```

That builder compares a small set of direct model candidates against both:

- `main_visible.ppm`
- `layers/bg1_visible.ppm`

The current exact-hit set is:

- base current renderer
- visible-state current renderer
- increment-before-sample
- `pixel 0` origin `+1`
- scanline `Y + 1`

For the bounded "is there still another small local tweak hiding in the
`bg1_visible` export?" follow-up after the composed screen is already exact,
use:

```sh
python3 tools/build_mode7_bg1_export_audit.py \
  tools/out/mode7_plateau_1105_default/analysis.json \
  tools/out/mode7_bg1_export_audit_1105/audit.json \
  --markdown-out tools/out/mode7_bg1_export_audit_1105/audit.md
```

That audit scans a small implementation-adjacent grid over:

- `yLineBias`
- `xOriginBias`
- `hscrollBias`
- sample-before vs sample-after increment

and keeps the composed-screen constraint explicit by comparing each candidate
against both:

- `main_visible.ppm`
- `layers/bg1_visible.ppm`

Current reading from the promoted `1105` / `1117` audit pair:

- `36` models scanned per endpoint
- `5` models keep the composed scene at `0`
- none of those `5` improves the `bg1_visible` mismatch below `2271`

That is strong evidence that the remaining late-attract layer gap is better
read as export-surface semantics than another small `Mode 7` renderer tweak.

That export-side ambiguity is now closed more directly too:

- `tools/mesen_ppu_extract/Program.cs` writes `layers/bg1.ppm` from
  `GetTilemap(...)` and then derives `layers/bg1_visible.ppm` via
  `NormalizeScroll(...) + CropVisibleRegion(...)`
- `tools/build_mesen_visible_crop_audit.py` proves that path against promoted
  late-attract design packs:

```sh
python3 tools/build_mesen_visible_crop_audit.py \
  tools/out/mode7_bg1_visible_crop_audit_1102_1105_1117/audit.json \
  tools/out/design_mesen_range_1102_1109_v1/frame_01102 \
  tools/out/design_mesen_range_1102_1109_v1/frame_01105 \
  tools/out/design_mesen_range_1110_1117_v1/frame_01117 \
  --markdown-out tools/out/mode7_bg1_visible_crop_audit_1102_1105_1117/audit.md
```

Current result from that audit:

- `1102/1105/1117` all land at `0` mismatched pixels
- raw layer scroll `0,8191` normalizes to `0,0`

Use that reading operationally:

- `main_visible.ppm` stays the renderer-parity surface
- `layers/*_visible.ppm` should be treated as viewer/export surfaces unless a
  task is explicitly about the bridge extractor itself

This path is useful when the remaining question is no longer "is there another
hidden upload?" and has narrowed to:

- whether `ppu_state_visible.json` actually differs on the canonical frame
- whether `sample-after-increment` collapses to the same output as `X-origin +1`
- whether the missing composed-screen rule is horizontal or actually a
  scanline-start term

This path is useful once a late-attract window has already collapsed to one
static scene and the remaining question is more specific:

- whether the fixed diff box is mostly `BG` or mostly sprite coverage
- whether the extracted visible `bg1` surface is also static across the plateau
- whether a small horizontal shift improves the BG-only compare enough to
  justify investigating `Mode 7` sampling next
- whether the plateau bbox ever touches the `Mode 7` outside-map path at all,
  which is the quickest way to keep or demote `M7SEL` edge/fill behavior as a
  live suspect

A current headless proof that uses only repo-relative prefixes is:

```sh
MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release \
MESEN_TIMEOUT_SECONDS=30 \
TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/frame300_live_probe_cap2048/td2_boot_probe \
TD2_BOOT_PROBE_TOTAL_FRAMES=301 \
TD2_BOOT_PROBE_TRACE_START_FRAME=0 \
TD2_BOOT_PROBE_TRACE_END_FRAME=300 \
TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' \
TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=2048 \
./validation/run_mesen_probe_boot.sh

python3 tools/build_mesen_visual_contract.py \
  port/assets/test_dump_frame300/design_pack \
  tools/out/visual_contract_frame300_live_probe_cap2048.json \
  --probe-json tools/out/frame300_live_probe_cap2048/td2_boot_probe.json
```

That proof currently yields live `vram`, `cgram`, `oam`, and `obj_state`
producer domains. Narrower late windows can still return `write_point_trace`
`0` hits if no writes occur there, so an empty trace is now a window-selection
signal rather than a launcher failure.

A promoted later-window proof chain now also exists at frames `986`, `990`,
`994`, `998`, `1005`, `1013`, `1021`, `1029`, `1037`, `1045`, `1053`,
`1061`, `1069`, `1077`, `1085`, and `1093`:

```sh
MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release \
make -C tools mesen-design-pack MESEN_FRAME=986

MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release \
MESEN_TIMEOUT_SECONDS=120 \
TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/visual_contract_probe_986_live/td2_boot_probe \
TD2_BOOT_PROBE_TOTAL_FRAMES=987 \
TD2_BOOT_PROBE_TRACE_START_FRAME=982 \
TD2_BOOT_PROBE_TRACE_END_FRAME=986 \
TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' \
TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=8192 \
./validation/run_mesen_probe_boot.sh

python3 tools/build_mesen_visual_contract.py \
  tools/out/design_frame986 \
  tools/out/visual_contract_frame986_live_probe.json \
  --probe-json tools/out/visual_contract_probe_986_live/td2_boot_probe.json
```

Current reading for that `986` proof:

- `tools/out/visual_contract_probe_986_live/td2_boot_probe.json` records
  `3246` write hits with `0` drops
- the merged contract shows:
  - exact `producerTrace.traceWindow = 982..986`
  - OAM writes across frames `982..986`
  - VRAM writes at frames `984` and `986`
  - no `CGRAM` or `OBJSEL` writes in that bounded late window
- `tools/out/design_frame986/sprites/sprites_visible.json` reports `0`
  visible sprites, which matches the late-overlay-cleared reading for frame
  `986`

The same proof path now also reaches `990` and `994`. If `994` times out while
another Mesen job is running, extract the raw frame standalone first with
`--frame-timeout-seconds 120` and then build the design pack:

```sh
MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release \
make -C tools mesen-design-pack MESEN_FRAME=990

MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release \
MESEN_TIMEOUT_SECONDS=120 \
TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/visual_contract_probe_990_live/td2_boot_probe \
TD2_BOOT_PROBE_TOTAL_FRAMES=991 \
TD2_BOOT_PROBE_TRACE_START_FRAME=986 \
TD2_BOOT_PROBE_TRACE_END_FRAME=990 \
TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' \
TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=8192 \
./validation/run_mesen_probe_boot.sh

python3 tools/build_mesen_visual_contract.py \
  tools/out/design_frame990 \
  tools/out/visual_contract_frame990_live_probe.json \
  --probe-json tools/out/visual_contract_probe_990_live/td2_boot_probe.json

MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release \
./tools/run_mesen_ppu_extract.sh \
  --rom ./game.smc \
  --frame 994 \
  --frame-timeout-seconds 120 \
  --out-dir ./tools/out/mesen_frame994

python3 tools/build_mesen_design_pack.py \
  tools/out/mesen_frame994 \
  tools/out/design_frame994 \
  --clean-out

MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release \
MESEN_TIMEOUT_SECONDS=120 \
TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/visual_contract_probe_994_live/td2_boot_probe \
TD2_BOOT_PROBE_TOTAL_FRAMES=995 \
TD2_BOOT_PROBE_TRACE_START_FRAME=990 \
TD2_BOOT_PROBE_TRACE_END_FRAME=994 \
TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' \
TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=8192 \
./validation/run_mesen_probe_boot.sh

python3 tools/build_mesen_visual_contract.py \
  tools/out/design_frame994 \
  tools/out/visual_contract_frame994_live_probe.json \
  --probe-json tools/out/visual_contract_probe_994_live/td2_boot_probe.json
```

Current reading for those `990/994` proofs:

- frame `990`:
  - `tools/out/visual_contract_probe_990_live/td2_boot_probe.json` records
    `3762` write hits with `0` drops
  - the merged contract keeps exact
    `producerTrace.traceWindow = 986..990`
  - producer domains:
    - OAM writes across frames `986..990`
    - VRAM writes across frames `986/988/989/990`
  - `tools/out/design_frame990/sprites/sprites_visible.json` reports `5`
    visible sprites
  - `tools/out/mesen_frame990/main_visible.ppm` is `1516` pixels from the
    local frame-`990` screenshot and `2` pixels from
    `tools/out/bank1_bootstrap_queue_990_bridgeobj.ppm`
- frame `994`:
  - `tools/out/visual_contract_probe_994_live/td2_boot_probe.json` records
    `4020` write hits with `0` drops
  - the merged contract keeps exact
    `producerTrace.traceWindow = 990..994`
  - producer domains:
    - OAM writes across frames `990..994`
    - VRAM writes across frames `990..994`
  - `tools/out/design_frame994/sprites/sprites_visible.json` reports `19`
    visible sprites
  - `tools/out/mesen_frame994/main_visible.ppm` is `2622` pixels from the
    local frame-`994` screenshot and `96` pixels from
    `tools/out/bank1_bootstrap_queue_994_bridgeobj.ppm`
- both windows stay on the same late callback family:
  - main callback `01:9FE5`
  - IRQ callback `00:835F`

The same ownership path now also reaches the start of the direct
bridge-extracted block at `998`:

```sh
MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release \
make -C tools mesen-design-pack MESEN_FRAME=998

MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release \
MESEN_TIMEOUT_SECONDS=120 \
TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/visual_contract_probe_998_live/td2_boot_probe \
TD2_BOOT_PROBE_TOTAL_FRAMES=999 \
TD2_BOOT_PROBE_TRACE_START_FRAME=994 \
TD2_BOOT_PROBE_TRACE_END_FRAME=998 \
TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' \
TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=8192 \
./validation/run_mesen_probe_boot.sh

python3 tools/build_mesen_visual_contract.py \
  tools/out/design_frame998 \
  tools/out/visual_contract_frame998_live_probe.json \
  --probe-json tools/out/visual_contract_probe_998_live/td2_boot_probe.json

python3 tools/render_mesen_snes_bg.py \
  tools/out/mesen_frame998/vram.bin \
  tools/out/mesen_frame998/cgram.bin \
  tools/out/mesen_frame998/ppu_state.json \
  tools/out/mesen_frame998_mode7ppu.ppm \
  --oam tools/out/mesen_frame998/oam.bin \
  --obj-renderer mode7-ppu \
  --json-out tools/out/mesen_frame998_mode7ppu.json
```

Current reading for that `998` proof:

- `tools/out/visual_contract_probe_998_live/td2_boot_probe.json` records
  `4020` write hits with `0` drops
- the merged contract keeps exact
  `producerTrace.traceWindow = 994..998`
- producer domains:
  - OAM writes across frames `994..998`
  - VRAM writes across frames `994..998`
- `tools/out/design_frame998/sprites/sprites_visible.json` reports `32`
  visible sprites
- `tools/out/mesen_frame998/main_visible.ppm` is `3119` pixels from the local
  frame-`998` screenshot
- `tools/out/mesen_frame998_mode7ppu.ppm` is `4` pixels from
  `tools/out/mesen_frame998/main_visible.ppm`
- the callback family still does not change:
  - main callback `01:9FE5`
  - IRQ callback `00:835F`

The same ownership path now also closes the first direct bridge-extracted
`998..1005` block at frame `1005`:

```sh
MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release \
make -C tools mesen-design-pack MESEN_FRAME=1005

MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release \
MESEN_TIMEOUT_SECONDS=150 \
TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/visual_contract_probe_1005_live/td2_boot_probe \
TD2_BOOT_PROBE_TOTAL_FRAMES=1006 \
TD2_BOOT_PROBE_TRACE_START_FRAME=998 \
TD2_BOOT_PROBE_TRACE_END_FRAME=1005 \
TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' \
TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=8192 \
./validation/run_mesen_probe_boot.sh

python3 tools/build_mesen_visual_contract.py \
  tools/out/design_frame1005 \
  tools/out/visual_contract_frame1005_live_probe.json \
  --probe-json tools/out/visual_contract_probe_1005_live/td2_boot_probe.json

MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release \
MESEN_TIMEOUT_SECONDS=150 \
TD2_BG_RANGE_START_FRAME=1005 \
TD2_BG_RANGE_END_FRAME=1005 \
TD2_BG_RANGE_STEP=1 \
TD2_BG_RANGE_DUMP_SCREENSHOTS=1 \
TD2_BG_RANGE_OUTPUT_PREFIX=tools/out/intro_loop \
./validation/run_mesen_dump_bg_range.sh

python3 tools/render_mesen_snes_bg.py \
  tools/out/mesen_frame1005/vram.bin \
  tools/out/mesen_frame1005/cgram.bin \
  tools/out/mesen_frame1005/ppu_state.json \
  tools/out/mesen_frame1005_mode7ppu.ppm \
  --oam tools/out/mesen_frame1005/oam.bin \
  --obj-renderer mode7-ppu \
  --json-out tools/out/mesen_frame1005_mode7ppu.json
```

Current reading for that `1005` proof:

- `tools/out/visual_contract_probe_1005_live/td2_boot_probe.json` records
  `6432` write hits with `0` drops
- the merged contract keeps exact
  `producerTrace.traceWindow = 998..1005`
- producer domains:
  - OAM writes across frames `998..1005`
  - VRAM writes across frames `998..1005`
- `tools/out/design_frame1005/sprites/sprites_visible.json` reports `53`
  visible sprites
- `tools/out/intro_loop_frame_01005_frame.png` is `4466` pixels from
  `tools/out/mesen_frame1005/main_visible.ppm`
- `tools/out/mesen_frame1005_mode7ppu.ppm` is `4` pixels from
  `tools/out/mesen_frame1005/main_visible.ppm`
- the callback family still does not change:
  - main callback `01:9FE5`
  - IRQ callback `00:835F`

The same ownership path now also closes the next direct bridge-extracted
`1006..1013` block at frame `1013`:

```sh
MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release \
make -C tools mesen-design-pack MESEN_FRAME=1013

MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release \
MESEN_TIMEOUT_SECONDS=150 \
TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/visual_contract_probe_1013_live/td2_boot_probe \
TD2_BOOT_PROBE_TOTAL_FRAMES=1014 \
TD2_BOOT_PROBE_TRACE_START_FRAME=1006 \
TD2_BOOT_PROBE_TRACE_END_FRAME=1013 \
TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' \
TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=8192 \
./validation/run_mesen_probe_boot.sh

python3 tools/build_mesen_visual_contract.py \
  tools/out/design_frame1013 \
  tools/out/visual_contract_frame1013_live_probe.json \
  --probe-json tools/out/visual_contract_probe_1013_live/td2_boot_probe.json

python3 tools/render_mesen_snes_bg.py \
  tools/out/mesen_frame1013/vram.bin \
  tools/out/mesen_frame1013/cgram.bin \
  tools/out/mesen_frame1013/ppu_state.json \
  tools/out/mesen_frame1013_mode7ppu.ppm \
  --oam tools/out/mesen_frame1013/oam.bin \
  --obj-renderer mode7-ppu \
  --json-out tools/out/mesen_frame1013_mode7ppu.json
```

Current reading for that `1013` proof:

- `tools/out/visual_contract_probe_1013_live/td2_boot_probe.json` records
  `6174` write hits with `0` drops
- the merged contract keeps exact
  `producerTrace.traceWindow = 1006..1013`
- producer domains:
  - OAM writes across frames `1006..1013`
  - VRAM writes across frames `1006..1012`
- `tools/out/design_frame1013/sprites/sprites_visible.json` reports `61`
  visible sprites
- `tools/out/intro_loop_frame_01013_frame.png` is `4638` pixels from
  `tools/out/mesen_frame1013/main_visible.ppm`
- `tools/out/mesen_frame1013_mode7ppu.ppm` is `10` pixels from
  `tools/out/mesen_frame1013/main_visible.ppm`
- the callback family still does not change:
  - main callback `01:9FE5`
  - IRQ callback `00:835F`

The same ownership path now also closes the direct bridge-extracted
`1014..1021` block at frame `1021`:

```sh
MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release \
make -C tools mesen-design-pack MESEN_FRAME=1021

MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release \
MESEN_TIMEOUT_SECONDS=150 \
TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/visual_contract_probe_1021_live/td2_boot_probe \
TD2_BOOT_PROBE_TOTAL_FRAMES=1022 \
TD2_BOOT_PROBE_TRACE_START_FRAME=1014 \
TD2_BOOT_PROBE_TRACE_END_FRAME=1021 \
TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' \
TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=8192 \
./validation/run_mesen_probe_boot.sh

python3 tools/build_mesen_visual_contract.py \
  tools/out/design_frame1021 \
  tools/out/visual_contract_frame1021_live_probe.json \
  --probe-json tools/out/visual_contract_probe_1021_live/td2_boot_probe.json

python3 tools/render_mesen_snes_bg.py \
  tools/out/mesen_frame1021/vram.bin \
  tools/out/mesen_frame1021/cgram.bin \
  tools/out/mesen_frame1021/ppu_state.json \
  tools/out/mesen_frame1021_mode7ppu.ppm \
  --oam tools/out/mesen_frame1021/oam.bin \
  --obj-renderer mode7-ppu \
  --json-out tools/out/mesen_frame1021_mode7ppu.json
```

Current reading for that `1021` proof:

- `tools/out/visual_contract_probe_1021_live/td2_boot_probe.json` records
  `5400` write hits with `0` drops
- the merged contract keeps exact
  `producerTrace.traceWindow = 1014..1021`
- producer domains:
  - OAM writes across frames `1014..1021`
  - VRAM writes at frames `1014/1015/1017/1019`
- `tools/out/design_frame1021/sprites/sprites_visible.json` reports `61`
  visible sprites
- `tools/out/intro_loop_frame_01021_frame.png` is `3557` pixels from
  `tools/out/mesen_frame1021/main_visible.ppm`
- `tools/out/mesen_frame1021_mode7ppu.ppm` is `10` pixels from
  `tools/out/mesen_frame1021/main_visible.ppm`
- the callback family still does not change:
  - main callback `01:9FE5`
  - IRQ callback `00:835F`

The same ownership path now also closes the direct bridge-extracted
`1022..1029` block at frame `1029`:

```sh
MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release \
make -C tools mesen-design-pack MESEN_FRAME=1029

MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release \
MESEN_TIMEOUT_SECONDS=150 \
TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/visual_contract_probe_1029_live/td2_boot_probe \
TD2_BOOT_PROBE_TOTAL_FRAMES=1030 \
TD2_BOOT_PROBE_TRACE_START_FRAME=1022 \
TD2_BOOT_PROBE_TRACE_END_FRAME=1029 \
TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' \
TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=8192 \
./validation/run_mesen_probe_boot.sh

python3 tools/build_mesen_visual_contract.py \
  tools/out/design_frame1029 \
  tools/out/visual_contract_frame1029_live_probe.json \
  --probe-json tools/out/visual_contract_probe_1029_live/td2_boot_probe.json

python3 tools/render_mesen_snes_bg.py \
  tools/out/mesen_frame1029/vram.bin \
  tools/out/mesen_frame1029/cgram.bin \
  tools/out/mesen_frame1029/ppu_state.json \
  tools/out/mesen_frame1029_mode7ppu.ppm \
  --oam tools/out/mesen_frame1029/oam.bin \
  --obj-renderer mode7-ppu \
  --json-out tools/out/mesen_frame1029_mode7ppu.json
```

Current reading for that `1029` proof:

- `tools/out/visual_contract_probe_1029_live/td2_boot_probe.json` records
  `3822` write hits with `0` drops
- the merged contract keeps exact
  `producerTrace.traceWindow = 1022..1029`
- producer domains:
  - OAM writes across `1022/1023/1024/1025/1027/1028/1029`
  - no bounded `VRAM`, `CGRAM`, or `OBJSEL` writes were observed
- `tools/out/design_frame1029/sprites/sprites_visible.json` reports `61`
  visible sprites
- `tools/out/intro_loop_frame_01029_frame.png` is `1` pixel from
  `tools/out/mesen_frame1029/main_visible.ppm`
- `tools/out/mesen_frame1029_mode7ppu.ppm` is `11` pixels from
  `tools/out/mesen_frame1029/main_visible.ppm`
- the callback family still does not change:
  - main callback `01:9FE5`
  - IRQ callback `00:835F`

The same ownership path now also closes the direct bridge-extracted
`1030..1037` block at frame `1037`:

```sh
MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release \
make -C tools mesen-design-pack MESEN_FRAME=1037

MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release \
MESEN_TIMEOUT_SECONDS=150 \
TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/visual_contract_probe_1037_live/td2_boot_probe \
TD2_BOOT_PROBE_TOTAL_FRAMES=1038 \
TD2_BOOT_PROBE_TRACE_START_FRAME=1030 \
TD2_BOOT_PROBE_TRACE_END_FRAME=1037 \
TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' \
TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=8192 \
./validation/run_mesen_probe_boot.sh

python3 tools/build_mesen_visual_contract.py \
  tools/out/design_frame1037 \
  tools/out/visual_contract_frame1037_live_probe.json \
  --probe-json tools/out/visual_contract_probe_1037_live/td2_boot_probe.json

python3 tools/render_mesen_snes_bg.py \
  tools/out/mesen_frame1037/vram.bin \
  tools/out/mesen_frame1037/cgram.bin \
  tools/out/mesen_frame1037/ppu_state.json \
  tools/out/mesen_frame1037_mode7ppu.ppm \
  --oam tools/out/mesen_frame1037/oam.bin \
  --obj-renderer mode7-ppu \
  --json-out tools/out/mesen_frame1037_mode7ppu.json
```

Current reading for that `1037` proof:

- `tools/out/visual_contract_probe_1037_live/td2_boot_probe.json` records
  `4948` write hits with `0` drops
- the merged contract keeps exact
  `producerTrace.traceWindow = 1030..1037`
- producer domains:
  - OAM writes across `1030..1037`
  - VRAM writes at `1030` and `1034`
- `tools/out/design_frame1037/sprites/sprites_visible.json` reports `61`
  visible sprites
- `tools/out/intro_loop_frame_01037_frame.png` is `29` pixels from
  `tools/out/mesen_frame1037/main_visible.ppm`
- `tools/out/mesen_frame1037_mode7ppu.ppm` is `8` pixels from
  `tools/out/mesen_frame1037/main_visible.ppm`
- the callback family still does not change:
  - main callback `01:9FE5`
  - IRQ callback `00:835F`

The same ownership path now also closes the direct bridge-extracted
`1038..1045` block at frame `1045`:

```sh
MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release \
make -C tools mesen-design-pack MESEN_FRAME=1045

# Do not run this probe and the screenshot dumper in parallel against the same
# isolated config; that bounded attempt ended with exit 255 locally.
MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release \
MESEN_TIMEOUT_SECONDS=150 \
TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/visual_contract_probe_1045_live/td2_boot_probe \
TD2_BOOT_PROBE_TOTAL_FRAMES=1046 \
TD2_BOOT_PROBE_TRACE_START_FRAME=1038 \
TD2_BOOT_PROBE_TRACE_END_FRAME=1045 \
TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' \
TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=8192 \
./validation/run_mesen_probe_boot.sh

python3 tools/build_mesen_visual_contract.py \
  tools/out/design_frame1045 \
  tools/out/visual_contract_frame1045_live_probe.json \
  --probe-json tools/out/visual_contract_probe_1045_live/td2_boot_probe.json

python3 tools/render_mesen_snes_bg.py \
  tools/out/mesen_frame1045/vram.bin \
  tools/out/mesen_frame1045/cgram.bin \
  tools/out/mesen_frame1045/ppu_state.json \
  tools/out/mesen_frame1045_mode7ppu.ppm \
  --oam tools/out/mesen_frame1045/oam.bin \
  --obj-renderer mode7-ppu \
  --json-out tools/out/mesen_frame1045_mode7ppu.json
```

Current reading for that `1045` proof:

- `tools/out/visual_contract_probe_1045_live/td2_boot_probe.json` records
  `4948` write hits with `0` drops
- the merged contract keeps exact
  `producerTrace.traceWindow = 1038..1045`
- producer domains:
  - OAM writes across `1038..1045`
  - VRAM writes at `1038` and `1042`
- `tools/out/design_frame1045/sprites/sprites_visible.json` reports `61`
  visible sprites
- `tools/out/intro_loop_frame_01045_frame.png` is `34` pixels from
  `tools/out/mesen_frame1045/main_visible.ppm`
- `tools/out/mesen_frame1045_mode7ppu.ppm` is `15` pixels from
  `tools/out/mesen_frame1045/main_visible.ppm`
- the callback family still does not change:
  - main callback `01:9FE5`
  - IRQ callback `00:835F`

The same ownership path now also closes the direct bridge-extracted
`1046..1053` block at frame `1053`:

```sh
MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release \
make -C tools mesen-design-pack MESEN_FRAME=1053

MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release \
MESEN_TIMEOUT_SECONDS=150 \
TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/visual_contract_probe_1053_live/td2_boot_probe \
TD2_BOOT_PROBE_TOTAL_FRAMES=1054 \
TD2_BOOT_PROBE_TRACE_START_FRAME=1046 \
TD2_BOOT_PROBE_TRACE_END_FRAME=1053 \
TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' \
TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=8192 \
./validation/run_mesen_probe_boot.sh

python3 tools/build_mesen_visual_contract.py \
  tools/out/design_frame1053 \
  tools/out/visual_contract_frame1053_live_probe.json \
  --probe-json tools/out/visual_contract_probe_1053_live/td2_boot_probe.json

python3 tools/render_mesen_snes_bg.py \
  tools/out/mesen_frame1053/vram.bin \
  tools/out/mesen_frame1053/cgram.bin \
  tools/out/mesen_frame1053/ppu_state.json \
  tools/out/mesen_frame1053_mode7ppu.ppm \
  --oam tools/out/mesen_frame1053/oam.bin \
  --obj-renderer mode7-ppu \
  --json-out tools/out/mesen_frame1053_mode7ppu.json
```

Current reading for that `1053` proof:

- `tools/out/visual_contract_probe_1053_live/td2_boot_probe.json` records
  `4948` write hits with `0` drops
- the merged contract keeps exact
  `producerTrace.traceWindow = 1046..1053`
- producer domains:
  - OAM writes across `1046..1053`
  - VRAM writes at `1046` and `1050`
- `tools/out/design_frame1053/sprites/sprites_visible.json` reports `61`
  visible sprites
- `tools/out/intro_loop_frame_01053_frame.png` is `31` pixels from
  `tools/out/mesen_frame1053/main_visible.ppm`
- `tools/out/mesen_frame1053_mode7ppu.ppm` is `14` pixels from
  `tools/out/mesen_frame1053/main_visible.ppm`
- the callback family still does not change:
  - main callback `01:9FE5`
  - IRQ callback `00:835F`

The same ownership path now also closes the direct bridge-extracted
`1054..1061` block at frame `1061`:

```sh
MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release \
make -C tools mesen-design-pack MESEN_FRAME=1061

MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release \
MESEN_TIMEOUT_SECONDS=150 \
TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/visual_contract_probe_1061_live/td2_boot_probe \
TD2_BOOT_PROBE_TOTAL_FRAMES=1062 \
TD2_BOOT_PROBE_TRACE_START_FRAME=1054 \
TD2_BOOT_PROBE_TRACE_END_FRAME=1061 \
TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' \
TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=8192 \
./validation/run_mesen_probe_boot.sh

python3 tools/build_mesen_visual_contract.py \
  tools/out/design_frame1061 \
  tools/out/visual_contract_frame1061_live_probe.json \
  --probe-json tools/out/visual_contract_probe_1061_live/td2_boot_probe.json

python3 tools/render_mesen_snes_bg.py \
  tools/out/mesen_frame1061/vram.bin \
  tools/out/mesen_frame1061/cgram.bin \
  tools/out/mesen_frame1061/ppu_state.json \
  tools/out/mesen_frame1061_mode7ppu.ppm \
  --oam tools/out/mesen_frame1061/oam.bin \
  --obj-renderer mode7-ppu \
  --json-out tools/out/mesen_frame1061_mode7ppu.json
```

Current reading for that `1061` proof:

- `tools/out/visual_contract_probe_1061_live/td2_boot_probe.json` records
  `4948` write hits with `0` drops
- the merged contract keeps exact
  `producerTrace.traceWindow = 1054..1061`
- producer domains:
  - OAM writes across `1054..1061`
  - VRAM writes at `1054` and `1058`
- `tools/out/design_frame1061/sprites/sprites_visible.json` reports `61`
  visible sprites
- `tools/out/intro_loop_frame_01061_frame.png` is `36` pixels from
  `tools/out/mesen_frame1061/main_visible.ppm`
- `tools/out/mesen_frame1061_mode7ppu.ppm` is `22` pixels from
  `tools/out/mesen_frame1061/main_visible.ppm`
- the callback family still does not change:
  - main callback `01:9FE5`
  - IRQ callback `00:835F`

The same ownership path now also closes the direct bridge-extracted
`1062..1069` block at frame `1069`:

```sh
MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release \
make -C tools mesen-design-pack MESEN_FRAME=1069

MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release \
MESEN_TIMEOUT_SECONDS=150 \
TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/visual_contract_probe_1069_live/td2_boot_probe \
TD2_BOOT_PROBE_TOTAL_FRAMES=1070 \
TD2_BOOT_PROBE_TRACE_START_FRAME=1062 \
TD2_BOOT_PROBE_TRACE_END_FRAME=1069 \
TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' \
TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=8192 \
./validation/run_mesen_probe_boot.sh

python3 tools/build_mesen_visual_contract.py \
  tools/out/design_frame1069 \
  tools/out/visual_contract_frame1069_live_probe.json \
  --probe-json tools/out/visual_contract_probe_1069_live/td2_boot_probe.json

python3 tools/render_mesen_snes_bg.py \
  tools/out/mesen_frame1069/vram.bin \
  tools/out/mesen_frame1069/cgram.bin \
  tools/out/mesen_frame1069/ppu_state.json \
  tools/out/mesen_frame1069_mode7ppu.ppm \
  --oam tools/out/mesen_frame1069/oam.bin \
  --obj-renderer mode7-ppu \
  --json-out tools/out/mesen_frame1069_mode7ppu.json
```

Current reading for that `1069` proof:

- `tools/out/visual_contract_probe_1069_live/td2_boot_probe.json` records
  `4948` write hits with `0` drops
- the merged contract keeps exact
  `producerTrace.traceWindow = 1062..1069`
- producer domains:
  - OAM writes across `1062..1069`
  - VRAM writes at `1062` and `1066`
- `tools/out/design_frame1069/sprites/sprites_visible.json` reports `61`
  visible sprites
- `tools/out/intro_loop_frame_01069_frame.png` is `48` pixels from
  `tools/out/mesen_frame1069/main_visible.ppm`
- `tools/out/mesen_frame1069_mode7ppu.ppm` is `25` pixels from
  `tools/out/mesen_frame1069/main_visible.ppm`
- the callback family still does not change:
  - main callback `01:9FE5`
  - IRQ callback `00:835F`

The same ownership path now also closes the direct bridge-extracted
`1070..1077` block at frame `1077`:

```sh
MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release \
make -C tools mesen-design-pack MESEN_FRAME=1077

MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release \
MESEN_TIMEOUT_SECONDS=150 \
TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/visual_contract_probe_1077_live/td2_boot_probe \
TD2_BOOT_PROBE_TOTAL_FRAMES=1078 \
TD2_BOOT_PROBE_TRACE_START_FRAME=1070 \
TD2_BOOT_PROBE_TRACE_END_FRAME=1077 \
TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' \
TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=8192 \
./validation/run_mesen_probe_boot.sh

python3 tools/build_mesen_visual_contract.py \
  tools/out/design_frame1077 \
  tools/out/visual_contract_frame1077_live_probe.json \
  --probe-json tools/out/visual_contract_probe_1077_live/td2_boot_probe.json

python3 tools/render_mesen_snes_bg.py \
  tools/out/mesen_frame1077/vram.bin \
  tools/out/mesen_frame1077/cgram.bin \
  tools/out/mesen_frame1077/ppu_state.json \
  tools/out/mesen_frame1077_mode7ppu.ppm \
  --oam tools/out/mesen_frame1077/oam.bin \
  --obj-renderer mode7-ppu \
  --json-out tools/out/mesen_frame1077_mode7ppu.json
```

Current reading for that `1077` proof:

- `tools/out/visual_contract_probe_1077_live/td2_boot_probe.json` records
  `4948` write hits with `0` drops
- the merged contract keeps exact
  `producerTrace.traceWindow = 1070..1077`
- producer domains:
  - OAM writes across `1070..1077`
  - VRAM writes at `1070` and `1074`
- `tools/out/design_frame1077/sprites/sprites_visible.json` reports `61`
  visible sprites
- `tools/out/intro_loop_frame_01077_frame.png` is `36` pixels from
  `tools/out/mesen_frame1077/main_visible.ppm`
- `tools/out/mesen_frame1077_mode7ppu.ppm` is `52` pixels from
  `tools/out/mesen_frame1077/main_visible.ppm`
- the callback family still does not change:
  - main callback `01:9FE5`
  - IRQ callback `00:835F`

The same ownership path now also closes the direct bridge-extracted
`1078..1085` block at frame `1085`:

```sh
MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release \
make -C tools mesen-design-pack MESEN_FRAME=1085

MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release \
MESEN_TIMEOUT_SECONDS=150 \
TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/visual_contract_probe_1085_live/td2_boot_probe \
TD2_BOOT_PROBE_TOTAL_FRAMES=1086 \
TD2_BOOT_PROBE_TRACE_START_FRAME=1078 \
TD2_BOOT_PROBE_TRACE_END_FRAME=1085 \
TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' \
TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=8192 \
./validation/run_mesen_probe_boot.sh

python3 tools/build_mesen_visual_contract.py \
  tools/out/design_frame1085 \
  tools/out/visual_contract_frame1085_live_probe.json \
  --probe-json tools/out/visual_contract_probe_1085_live/td2_boot_probe.json

python3 tools/render_mesen_snes_bg.py \
  tools/out/mesen_frame1085/vram.bin \
  tools/out/mesen_frame1085/cgram.bin \
  tools/out/mesen_frame1085/ppu_state.json \
  tools/out/mesen_frame1085_mode7ppu.ppm \
  --oam tools/out/mesen_frame1085/oam.bin \
  --obj-renderer mode7-ppu \
  --json-out tools/out/mesen_frame1085_mode7ppu.json
```

Current reading for that `1085` proof:

- `tools/out/visual_contract_probe_1085_live/td2_boot_probe.json` records
  `4368` write hits with `0` drops
- the merged contract keeps exact
  `producerTrace.traceWindow = 1078..1085`
- producer domains:
  - OAM writes across `1078..1085`
  - no sampled VRAM writes fired in that bounded window
- `tools/out/design_frame1085/sprites/sprites_visible.json` reports `61`
  visible sprites
- `tools/out/intro_loop_frame_01085_frame.png` is `74` pixels from
  `tools/out/mesen_frame1085/main_visible.ppm`
- `tools/out/mesen_frame1085_mode7ppu.ppm` is `69` pixels from
  `tools/out/mesen_frame1085/main_visible.ppm`
- the callback family still does not change:
  - main callback `01:9FE5`
  - IRQ callback `00:835F`

The same ownership path now also closes the direct bridge-extracted
`1086..1093` block at frame `1093`:

```sh
MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release \
make -C tools mesen-design-pack MESEN_FRAME=1093

MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release \
MESEN_TIMEOUT_SECONDS=150 \
TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/visual_contract_probe_1093_live/td2_boot_probe \
TD2_BOOT_PROBE_TOTAL_FRAMES=1094 \
TD2_BOOT_PROBE_TRACE_START_FRAME=1086 \
TD2_BOOT_PROBE_TRACE_END_FRAME=1093 \
TD2_BOOT_PROBE_TRACE_WRITE_POINTS='objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,cgadd=00:2121,cgdata=00:2122' \
TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=8192 \
./validation/run_mesen_probe_boot.sh

python3 tools/build_mesen_visual_contract.py \
  tools/out/design_frame1093 \
  tools/out/visual_contract_frame1093_live_probe.json \
  --probe-json tools/out/visual_contract_probe_1093_live/td2_boot_probe.json

python3 tools/render_mesen_snes_bg.py \
  tools/out/mesen_frame1093/vram.bin \
  tools/out/mesen_frame1093/cgram.bin \
  tools/out/mesen_frame1093/ppu_state.json \
  tools/out/mesen_frame1093_mode7ppu.ppm \
  --oam tools/out/mesen_frame1093/oam.bin \
  --obj-renderer mode7-ppu \
  --json-out tools/out/mesen_frame1093_mode7ppu.json
```

Current reading for that `1093` proof:

- `tools/out/visual_contract_probe_1093_live/td2_boot_probe.json` records
  `4368` write hits with `0` drops
- the merged contract keeps exact
  `producerTrace.traceWindow = 1086..1093`
- producer domains:
  - OAM writes across `1086..1093`
  - no sampled VRAM writes fired in that bounded window
- `tools/out/design_frame1093/sprites/sprites_visible.json` reports `61`
  visible sprites
- `tools/out/intro_loop_frame_01093_frame.png` is `207` pixels from
  `tools/out/mesen_frame1093/main_visible.ppm`
- `tools/out/mesen_frame1093_mode7ppu.ppm` is `129` pixels from
  `tools/out/mesen_frame1093/main_visible.ppm`
- the callback family still does not change:
  - main callback `01:9FE5`
  - IRQ callback `00:835F`

To dump a whole intro range in one emulator run:

```sh
MESEN_TIMEOUT_SECONDS=75 \
TD2_BG_RANGE_START_FRAME=654 \
TD2_BG_RANGE_END_FRAME=2070 \
TD2_BG_RANGE_STEP=4 \
TD2_BG_RANGE_DUMP_SCREENSHOTS=1 \
TD2_BG_RANGE_OUTPUT_PREFIX=tools/out/intro_loop \
./validation/run_mesen_dump_bg_range.sh
```

The same dumper can now replay a simple fixed input window while it captures a
seeded gameplay range:

```sh
MESEN_TIMEOUT_SECONDS=60 \
TD2_BG_RANGE_START_FRAME=86 \
TD2_BG_RANGE_END_FRAME=93 \
TD2_BG_RANGE_STEP=1 \
TD2_BG_RANGE_DUMP_OAM=1 \
TD2_BG_RANGE_DUMP_SCREENSHOTS=1 \
TD2_BG_RANGE_INPUT_START_FRAME=60 \
TD2_BG_RANGE_INPUT_END_FRAME=359 \
TD2_BG_RANGE_INPUT=b \
TD2_BG_RANGE_OUTPUT_PREFIX=tools/out/track1_seed_0086_0093 \
./validation/run_mesen_dump_bg_range.sh ./game.smc ./.mesen-config/Mesen2/SaveStates/game_11.mss
```

For multi-stage seeded gameplay schedules, `mesen_dump_bg_range.lua` also
accepts `TD2_BG_RANGE_INPUT_WINDOWS` in the same `start-end:buttons` or
`frame:buttons` format:

```sh
MESEN_TIMEOUT_SECONDS=60 \
TD2_BG_RANGE_START_FRAME=61 \
TD2_BG_RANGE_END_FRAME=68 \
TD2_BG_RANGE_STEP=1 \
TD2_BG_RANGE_DUMP_OAM=1 \
TD2_BG_RANGE_INPUT_WINDOWS='60:start;61-359:a' \
TD2_BG_RANGE_OUTPUT_PREFIX=tools/out/track1_start_then_a_0061_0068_v1 \
./validation/run_mesen_dump_bg_range.sh ./game.smc ./.mesen-config/Mesen2/SaveStates/game_11.mss
```

That produces flat files like:

- `tools/out/intro_loop_frame_00654_vram.bin`
- `tools/out/intro_loop_frame_00654_cgram.bin`
- `tools/out/intro_loop_frame_00654_ppu_state.json`
- `tools/out/intro_loop_frame_00654_frame.png`
- `tools/out/intro_loop.json`

The boot probe writes a JSON timeline and a final screenshot under the script data folder, using the prefix `td2_boot_probe`.
Set `TD2_BOOT_PROBE_OUTPUT_PREFIX` to move that output into a repo-owned or
per-run location instead of the shared `LuaScriptData` directory.
You can also drive it with simple scripted input via environment variables, for example:

```sh
TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/bootprobe_run/td2_boot_probe \
TD2_BOOT_PROBE_TOTAL_FRAMES=3600 \
TD2_BOOT_PROBE_INPUT_START_FRAME=240 \
TD2_BOOT_PROBE_INPUT=start,b \
./validation/run_mesen_probe_boot.sh
```

To limit that legacy pattern to a frame window, set `TD2_BOOT_PROBE_INPUT_END_FRAME`:

```sh
TD2_BOOT_PROBE_TOTAL_FRAMES=1800 \
TD2_BOOT_PROBE_INPUT_START_FRAME=240 \
TD2_BOOT_PROBE_INPUT_END_FRAME=359 \
TD2_BOOT_PROBE_INPUT=start,b \
./validation/run_mesen_probe_boot.sh
```

For richer deterministic sequences, use `TD2_BOOT_PROBE_INPUT_WINDOWS` with
semicolon-separated windows in `start-end:buttons` or `frame:buttons` form:

```sh
TD2_BOOT_PROBE_TOTAL_FRAMES=1800 \
TD2_BOOT_PROBE_INPUT_WINDOWS="240:start;241-360:b;654:start" \
./validation/run_mesen_probe_boot.sh
```

To capture the deterministic power-on copyright/credits scene around the `5` second mark:

```sh
TD2_BOOT_PROBE_TOTAL_FRAMES=301 \
TD2_BOOT_PROBE_SCREENSHOT_FRAME=300 \
./validation/run_mesen_probe_boot.sh
```

To also dump the raw PPU memory and filtered `emu.getState()` snapshot for that same scene:

```sh
TD2_BOOT_PROBE_TOTAL_FRAMES=301 \
TD2_BOOT_PROBE_SCREENSHOT_FRAME=300 \
TD2_BOOT_PROBE_DUMP_PPU_MEMORY=1 \
./validation/run_mesen_probe_boot.sh
```

That writes:

- `tools/out/bootprobe_run/td2_boot_probe.json` when
  `TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/bootprobe_run/td2_boot_probe`
- `tools/out/bootprobe_run/td2_boot_probe_frame.png`
- `tools/out/bootprobe_run/td2_boot_probe_vram.bin`
- `tools/out/bootprobe_run/td2_boot_probe_cgram.bin`
- `tools/out/bootprobe_run/td2_boot_probe_oam.bin`
- `tools/out/bootprobe_run/td2_boot_probe_ppu_state.json`

If `TD2_BOOT_PROBE_OUTPUT_PREFIX` is unset, the legacy fallback still writes to
`.mesen-config/Mesen2/LuaScriptData/mesen_probe_boot/td2_boot_probe.*`.

To trace chunk-dispatch usage at `00:9210` (`L001210`) with entry-time `$0C/$0E/$10`:

```sh
TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/td2_boot_probe \
TD2_BOOT_PROBE_TOTAL_FRAMES=3600 \
TD2_BOOT_PROBE_TRACE_L001210=1 \
./validation/run_mesen_probe_boot.sh

python3 tools/summarize_l001210_trace.py \
  tools/out/td2_boot_probe_l001210_exec.json \
  --json-out tools/out/td2_boot_probe_l001210_summary.json

python3 tools/run_l001210_probe_matrix.py \
  --out-dir tools/out/l001210_probe_matrix \
  --total-frames 2200 \
  --timeout-seconds 90
```

To recover the later direct-hit cluster on the restored timed-input scenario:

```sh
TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/td2_boot_probe \
TD2_BOOT_PROBE_TOTAL_FRAMES=7065 \
TD2_BOOT_PROBE_TRACE_L001210=1 \
TD2_BOOT_PROBE_L001210_MAX_HITS=256 \
TD2_BOOT_PROBE_INPUT_WINDOWS='6800:start;6900-6920:start,a' \
MESEN_TIMEOUT_SECONDS=180 \
./validation/run_mesen_probe_boot.sh ./game.smc

python3 tools/summarize_l001210_trace.py \
  tools/out/td2_boot_probe_l001210_exec.json \
  --json-out tools/out/l001210_probe_7051_inputfix_summary.json
```

This is the current headless proof lane for the later direct-hit cluster:

- frame `7051` -> `0D:C4DC`
- frame `7059` -> `07:BF49`
- frame `7064` -> `07:C112`

The bridge extractor now also reopens the planned interior carry check on the
same timed-input scenario:

```sh
MESEN_RELEASE_DIR=/path/to/mesen/release \
./tools/run_mesen_ppu_extract.sh --rom game.smc --frame 7055 \
  --out-dir tools/out/mesen_range_7055_7061_inputfix_v2/frame_07055 \
  --frame-timeout-seconds 180 \
  --input-windows '6800:start;6900-6920:start,a'

MESEN_RELEASE_DIR=/path/to/mesen/release \
./tools/run_mesen_ppu_extract.sh --rom game.smc --frame 7061 \
  --out-dir tools/out/mesen_range_7055_7061_inputfix_v2/frame_07061 \
  --frame-timeout-seconds 180 \
  --input-windows '6800:start;6900-6920:start,a'
```

- `7055` shares the same BG tilemaps and `vram.bin` as `7051`, but it does not
  share the same sprite/OAM composition (`10` visible sprites -> `0`)
- `7061` shares the same BG tilemaps as `7059`, and its visible sprite set
  remains empty at both frames

To save a deterministic savestate snapshot at a specific probe frame:

```sh
TD2_BOOT_PROBE_TOTAL_FRAMES=1120 \
TD2_BOOT_PROBE_SAVE_SAVESTATE_FRAME=1093 \
TD2_BOOT_PROBE_SAVE_SAVESTATE=tools/out/l001210_state_1093.bin \
./validation/run_mesen_probe_boot.sh ./game.smc
```

Then use that state as a matrix start point:

```sh
python3 tools/run_l001210_probe_matrix.py \
  --out-dir tools/out/l001210_probe_matrix_from_1093 \
  --total-frames 2000 \
  --timeout-seconds 120 \
  --savestate tools/out/l001210_state_1093.bin
```

Current environment note:

- the headless `--testRunner` build can load a savestate when provided,
  but probe-side save attempts currently report:
  - `saved_savestate_error = "no supported savestate API found on emu table"`
- so the save-from-probe flow is documented but currently blocked until
  that API surface is available.

To force selector values for targeted branch testing windows:

```sh
TD2_BOOT_PROBE_TOTAL_FRAMES=4000 \
TD2_BOOT_PROBE_TRACE_L001210=1 \
TD2_BOOT_PROBE_FORCE_SELECTORS_START_FRAME=0 \
TD2_BOOT_PROBE_FORCE_SELECTORS_END_FRAME=3999 \
TD2_BOOT_PROBE_FORCE_1C78=1 \
TD2_BOOT_PROBE_FORCE_1C80=0 \
TD2_BOOT_PROBE_FORCE_1CA8=2 \
TD2_BOOT_PROBE_FORCE_1C86=1 \
TD2_BOOT_PROBE_FORCE_1D10=16640 \
TD2_BOOT_PROBE_FORCE_SELECTORS_ON_B1F9=1 \
./validation/run_mesen_probe_boot.sh ./game.smc
```

`TD2_BOOT_PROBE_FORCE_SELECTORS_ON_B1F9=1` re-applies the same forced values at
the `01:B1F9` exec point so the dynamic-index branch sees the requested values.
`TD2_BOOT_PROBE_FORCE_1C86` and `TD2_BOOT_PROBE_FORCE_1D10` are useful for
testing the `01:9568/01:95AD -> 01:B1F9` branch gates.

To force the active main callback pointer for a frame window:

```sh
TD2_BOOT_PROBE_TOTAL_FRAMES=3200 \
TD2_BOOT_PROBE_TRACE_L001210=1 \
TD2_BOOT_PROBE_FORCE_MAIN_CALLBACK_START_FRAME=1200 \
TD2_BOOT_PROBE_FORCE_MAIN_CALLBACK_END_FRAME=2399 \
TD2_BOOT_PROBE_FORCE_MAIN_CALLBACK_ADDR=38248 \
TD2_BOOT_PROBE_FORCE_MAIN_CALLBACK_BANK=1 \
./validation/run_mesen_probe_boot.sh ./game.smc
```

`38248` is `0x9568` in decimal. Use `38317` (`0x95AD`) to target the sibling
callback branch.

To trace exact exec points in a targeted branch experiment:

```sh
TD2_BOOT_PROBE_TOTAL_FRAMES=2200 \
TD2_BOOT_PROBE_TRACE_L001210=1 \
TD2_BOOT_PROBE_FORCE_MAIN_CALLBACK_START_FRAME=1200 \
TD2_BOOT_PROBE_FORCE_MAIN_CALLBACK_END_FRAME=1800 \
TD2_BOOT_PROBE_FORCE_MAIN_CALLBACK_ADDR=38248 \
TD2_BOOT_PROBE_FORCE_MAIN_CALLBACK_BANK=1 \
TD2_BOOT_PROBE_FORCE_SELECTORS_START_FRAME=1200 \
TD2_BOOT_PROBE_FORCE_SELECTORS_END_FRAME=1800 \
TD2_BOOT_PROBE_FORCE_1C86=1 \
TD2_BOOT_PROBE_FORCE_1C78=1 \
TD2_BOOT_PROBE_FORCE_1C80=0 \
TD2_BOOT_PROBE_FORCE_1CA8=2 \
TD2_BOOT_PROBE_FORCE_1D10=16640 \
TD2_BOOT_PROBE_TRACE_EXEC_POINTS='b1f9=01:B1F9,after_050f=01:B202,after_083f=01:B206,b226=01:B226,b256=01:B256,b273=01:B273,b59b=01:B59B,050f=00:050F,083f=00:083F' \
TD2_BOOT_PROBE_EXEC_POINT_MAX_HITS=32 \
./validation/run_mesen_probe_boot.sh ./game.smc
```

`TD2_BOOT_PROBE_TRACE_EXEC_POINTS` accepts a comma- or semicolon-separated list
of `label=BB:AAAA` or bare `BB:AAAA` SNES addresses. Matching exec hits are
captured into `td2_boot_probe.json` under `exec_point_trace`, and the capture
window is bounded by `TD2_BOOT_PROBE_TRACE_START_FRAME` /
`TD2_BOOT_PROBE_TRACE_END_FRAME`.
Use `TD2_BOOT_PROBE_EXEC_POINT_MAX_HITS_PER_POINT` to cap repeated loop hits
per watched address when you only need the first `N` sightings of each point.

To trace exact write points in the same forced branch window:

```sh
TD2_BOOT_PROBE_TOTAL_FRAMES=2200 \
TD2_BOOT_PROBE_TRACE_START_FRAME=1200 \
TD2_BOOT_PROBE_TRACE_END_FRAME=1202 \
TD2_BOOT_PROBE_TRACE_L001210=1 \
TD2_BOOT_PROBE_FORCE_MAIN_CALLBACK_START_FRAME=1200 \
TD2_BOOT_PROBE_FORCE_MAIN_CALLBACK_END_FRAME=1800 \
TD2_BOOT_PROBE_FORCE_MAIN_CALLBACK_ADDR=38248 \
TD2_BOOT_PROBE_FORCE_MAIN_CALLBACK_BANK=1 \
TD2_BOOT_PROBE_FORCE_SELECTORS_START_FRAME=1200 \
TD2_BOOT_PROBE_FORCE_SELECTORS_END_FRAME=1800 \
TD2_BOOT_PROBE_FORCE_1C86=1 \
TD2_BOOT_PROBE_FORCE_1C78=1 \
TD2_BOOT_PROBE_FORCE_1C80=0 \
TD2_BOOT_PROBE_FORCE_1CA8=2 \
TD2_BOOT_PROBE_FORCE_1D10=16640 \
TD2_BOOT_PROBE_TRACE_WRITE_POINTS='hdmaen=00:420C,mosaic=00:2106,bgmode=00:2105,bg1sc=00:2107,bg2sc=00:2108,bg3sc=00:2109,bg12nba=00:210B,objsel=00:2101,tmain=00:212C,cgadsub=00:2131,cgwsel=00:2130,tmw=00:212E,setini=00:2133,tsub=00:212D,tsw=00:212F,w12sel=00:2123,w34sel=00:2124,wobjsel=00:2125,mem0966=7E:0966,mem0968=7E:0968,mem0974=7E:0974,mem0f42=00:0F42' \
TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS=128 \
./validation/run_mesen_probe_boot.sh ./game.smc
```

`TD2_BOOT_PROBE_TRACE_WRITE_POINTS` uses the same address syntax as
`TD2_BOOT_PROBE_TRACE_EXEC_POINTS` and records matching writes in
`td2_boot_probe.json` under `write_point_trace`.

When that trace is enabled, the probe also writes:

- `.mesen-config/Mesen2/LuaScriptData/mesen_probe_boot/td2_boot_probe_l001210_exec.json`

Recent payload additions in each `hits[]` entry:

- selector snapshot fields: `selector_1c78`, `selector_1c80`, `selector_1ca8`,
  `selector_1c86`, `selector_1cac`, `selector_1cae`
- additional state field: `state_1d10`
- caller site tagging: `caller_id`, `caller_pc_snes`, `caller_pc_linear`
- caller CPU regs: `caller_reg_a/x/y/pc/sp/ps/d/dbr/k`
- derived helper-table provenance for `01:A9BD`/`01:A9E1`:
  - `caller_l00a9_table`
  - `caller_l00a9_table_index`
  - `caller_l00a9_source_snes`
  - `caller_l00a9_source_linear`
  - `caller_l00a9_source_matches`

Recent top-level additions in `td2_boot_probe.json`:

- callback forcing config echo:
  - `force_main_callback_start_frame`
  - `force_main_callback_end_frame`
  - `force_main_callback_addr`
  - `force_main_callback_bank`
- `B1F9` execution counters:
  - `b1f9_exec_count`
  - `b1f9_exec_frames`
  - `b1f9_stage_counts` (`b226`, `b256`, `b273`, `b59b`)
  - `b1f9_stage_frames`
- exec-point trace bundle:
  - `trace_exec_points`
  - `exec_point_max_hits`
  - `exec_point_max_hits_per_point`
  - `exec_point_trace.hit_count`
  - `exec_point_trace.dropped_hits`
  - `exec_point_trace.hits[]` with CPU regs, stack bytes/return decode, plus selector/state snapshots
- write-point trace bundle:
  - `trace_write_points`
  - `write_point_max_hits`
  - `write_point_trace.hit_count`
  - `write_point_trace.dropped_hits`
  - `write_point_trace.hits[]` with value, scanline, and selector/state snapshots

To enforce CI-style pixel gates on a rendered intro sequence:

```sh
python3 tools/check_regression_gates.py \
  validation/regression_gates_intro.jsonc \
  --render-dir port/build/regression_frames \
  --json-out tools/out/regression_gates_intro_report.json
```

To validate callback/state checkpoints as machine-readable contracts:

```sh
python3 tools/validate_callback_contracts.py \
  rom_analysis/docs/callback_state_contracts.jsonc \
  tools/out/td2_boot_probe.json \
  --json-out tools/out/callback_state_contracts_report.json
```

In the current environment, the frame-`300` screenshot is the colored copyright/credits scene with blue/red text on black.
The interesting RE result is that the tracked bank 1 selectors are still at the trivial early values on that frame:

- `$1C78 = 1`
- `$1C7A = 0`
- `$1CAC/$1CCA/$1CCC/$1CCE/$1CD0/$1CE2/$1CE4/$1CE6/$1CEA = 0`

That means this scene exists later than raw power-on but still before the richer bank 1 front-end selector state the current boot-state tooling is trying to model.

The PPU dump for the same scene is now a solved validation target:

- `tools/render_mesen_snes_bg.py` can reconstruct the frame exactly from `vram.bin + cgram.bin + ppu_state.json`
- `tools/compare_frames.py` against `td2_boot_probe_frame.png` currently reports `0` mismatched pixels
- the dumped live state shows `ppu.bgMode = 1` and `ppu.mainScreenLayers = 0x04`

This makes the frame-`300` credits scene the best current “golden” screen for validating a PC-side BG text compositor.

That target is no longer dump-only. `tools/build_bank1_credits_scene.py` now rebuilds the same screen directly from ROM by following the `L009D1C` helper trio (`L00A9A0(0)`, `L00A9CB(0)`, `L00A9F2(0)`) and currently compares against the captured frame with `0` mismatched pixels.

A bounded 2026-03-22 re-test in the current worktree keeps that reading intact for the
capture/build side, but not for the SDL runtime:

- `python3 tools/build_bank1_credits_scene.py game.smc tools/out/bank1_credits_scene_regolden_20260322`
- `python3 tools/compare_frames.py tools/out/td2_boot_probe_frame_300.png tools/out/bank1_credits_scene_regolden_20260322.ppm --diff-out tools/out/bank1_credits_scene_regolden_20260322_vs_mesen_diff.ppm`
  - `0` mismatched pixels
- `python3 tools/render_mesen_snes_bg.py tools/out/bank1_credits_scene_regolden_20260322_vram.bin tools/out/bank1_credits_scene_regolden_20260322_cgram.bin tools/out/bank1_credits_scene_regolden_20260322_ppu_state.json tools/out/bank1_credits_scene_regolden_20260322_python.ppm`
- `python3 tools/compare_frames.py tools/out/td2_boot_probe_frame_300.png tools/out/bank1_credits_scene_regolden_20260322_python.ppm --diff-out tools/out/bank1_credits_scene_regolden_20260322_python_vs_mesen_diff.ppm`
  - `0` mismatched pixels
- `SDL_VIDEODRIVER=dummy ./port/build/td2_port --headless --snes-bg-prefix ./tools/out/bank1_credits_scene_regolden_20260322 --frames 1 --dump-prefix ./port/build/credits_regolden_20260322`
- `python3 tools/compare_frames.py tools/out/td2_boot_probe_frame_300.png port/build/credits_regolden_20260322_00000.ppm --diff-out tools/out/credits_regolden_20260322_vs_mesen_diff.ppm`
  - `7244` mismatched pixels (`12.632533%`)
  - mismatch bbox: `16,56 -> 222,167`
  - the generated diff is byte-identical to the pre-existing `tools/out/bank1_credits_scene_vs_runtime_diff.ppm`

Practical reading:

- frame `300` remains the promoted golden target for live capture, ROM-side scene rebuild, and the Python SNES BG renderer
- frame `300` is **not** yet a zero-diff SDL runtime parity gate; the current runtime output still lands on the same historical credits-scene diff surface

Later no-input power-on probing now shows the next attract/front-end signatures as well:

- frame `654`: this is now the first clean `Ballistic presents` anchor on the no-input path
  - the active main callback has just switched to `01:A39C`
  - `bg1_visible.ppm` from the Mesen bridge compares against the captured screenshot with `0` mismatched pixels
  - visible sprites are still `0`, so this state is a pure BG scene
- frame `900`: `ppu.bgMode = 1`, `ppu.mainScreenLayers = 0x01`, which matches `L00A35A`
  - the active main callback on the sampled frame is `01:A39C`
  - `$20 = 8`, so the scene is already inside the callback-driven animation path
- frame `1200`: `ppu.bgMode = 7`, `ppu.mainScreenLayers = 0x11`, which matches `L00A00C`
  - by that sampled frame, the active main callback has already fallen back to bank 0 idle `00:8029`

These are useful map points, but they are not yet golden targets in the same sense as frame `300`:

- frame `654` is now good enough to seed sampled intro playback in the PC port
- frame `900` is already animated enough that the current end-of-frame PPU dump mismatches its screenshot by `9.163993%`
- frame `1080` and frame `1200` now render through the shared Mode 7 BG path in `tools/render_mesen_snes_bg.py`
  - frame `1080` mismatches the captured screenshot by `12.341309%`
  - frame `1200` mismatches the captured screenshot by `9.125628%`
  - the remaining delta is consistent with missing OBJ or other non-BG overlay composition rather than a broken Mode 7 transform

The script writes an isolated config to `.mesen-config/Mesen2/settings.json` and capture output under the script data folder inside that config root.
By default it resolves the emulator in this order:

- `MESEN_BIN`
- `MESEN_RELEASE_DIR/Mesen`
- `Mesen` or `mesen` on `PATH`

One useful probe result for the `Ballistic presents` splash is the callback handoff:

- the active main callback first becomes `01:A39C` at frame `654`
- the probe timeline then shows `$20` changing every `4` frames from frame `656` onward:
  - `656 -> 13`
  - `660 -> 12`
  - `664 -> 11`
  - ...
  - `708 -> 0`

That makes frames `654..710` the first clean validation window for the Ballistic splash.

Longer no-input probing now also pins down the repeat period of the first attract loop:

- the callback cycle beginning with `01:A39C` at frame `654` repeats at frame `2072`
- it repeats again at frame `3490`
- the loop period is therefore `1418` frames

That repeat period is what the current exact sampled intro manifest uses:

- dump range: frames `654..2070`, sampled every `4` frames
- runtime end-exclusive frame: `2072`
- this yields the first full exact no-input loop manifest under `tools/out/intro_loop_sequence.txt`

The current runtime milestone goes one step further than that sampled manifest:

- `tools/out/ballistic_native_sequence.txt` is the measured Ballistic reference clip
- `tools/out/ballistic_rom_sequence.txt` is the ROM-derived Ballistic runtime clip
- `tools/out/ballistic_callback_sequence.txt` is the direct runtime Ballistic callback clip
- `tools/out/intro_loop_hybrid_sequence.txt` now splices:
  - the direct callback clip for `654..958`
  - the queue-driven `snes_bg` window for `978..985`
  - sampled `image` playback for the remaining attract states
- the ROM-derived clip currently compares exactly at:
  - frame offset `0` vs source frame `654`
  - frame offset `60` vs source frame `714`
  - frame offset `300` vs source frame `954`
- the direct callback clip also compares exactly at:
  - frame offset `0`
  - frame offset `60`
  - frame offset `300`
- current exact validation checks for the hybrid path are:
  - frame offset `0` vs source frame `654`
  - frame offset `320` vs source frame `974`
  - frame offset `676` vs source frame `1330`
- current promoted-hybrid validation around the native post-Ballistic splice is:
  - frame offset `324` vs source frame `978`: `2` mismatched pixels (`0.003488%`)
  - frame offset `328` vs source frame `982`: `2` mismatched pixels (`0.003488%`)
  - frame offset `332` vs source frame `986`: exact sampled fallback

Current boundary for the next native intro replacement:

- `958..974` is still the unstable bootstrap zone for the `L00A00C -> 01:9D69 -> 01:9FE5` handoff
- frame `978` is the first clean extracted-state target after that handoff:
  - direct runtime reconstruction from `VRAM + CGRAM + PPU state` currently lands at `4` mismatched pixels (`0.006975%`)
- the SDL runtime now also accepts optional `OAM` for extracted SNES scenes:
  - against a full Mesen frame dump, frame `978` with auto-loaded sibling `oam.bin` lands at `2` mismatched pixels (`0.003488%`) versus `main_visible.ppm`
  - frame `990` still lands at `623` mismatched pixels (`1.086426%`) versus `main_visible.ppm`
  - practical reading: OAM support is now in the runtime, but it is not the whole explanation for the later Mode 7 attract drift
- the same extracted-state path then starts drifting again:
  - frame `986`: `23` mismatched pixels (`0.040109%`)
  - frame `990`: `1295` mismatched pixels (`2.258301%`)
  - frame `994`: `2781` mismatched pixels (`4.849679%`)
- practical next step:
  - treat `958..977` as a deeper bootstrap-builder problem rather than a simple scene dump
  - keep queue-driven `978` and `982` as the first promoted post-Ballistic replacements inside the hybrid loop
  - frame `986` is still the first unresolved edge after those replacements
  - `tools/out/intro_native_978_derived_sequence.txt` is now the splice source for the promoted replacement window

That bootstrap reading is now backed by two extra checks:

- rerunning the probe at frames `958` and `974` with `TD2_BOOT_PROBE_DUMP_PPU_MEMORY=1` shows that start-of-frame dumps do not rescue the scene:
  - `tools/out/bootprobe_958/startframe.ppm` vs `tools/out/bootprobe_958/td2_boot_probe_frame.png`: `100.000000%`
  - `tools/out/bootprobe_958/endframe.ppm` vs `tools/out/bootprobe_958/td2_boot_probe_frame.png`: `100.000000%`
  - `tools/out/bootprobe_974/startframe.ppm` vs `tools/out/bootprobe_974/td2_boot_probe_frame.png`: `100.000000%`
  - `tools/out/bootprobe_974/endframe.ppm` vs `tools/out/bootprobe_974/td2_boot_probe_frame.png`: `100.000000%`
- frame `958` and frame `974` screenshots are still identical, so the visible bootstrap window is static even though the extracted PPU state is not usable
- the experimental ROM-side builder at `tools/build_bank1_l00a00c_scene.py` currently applies:
  - `04:9AED` via `L001210 -> 42FB -> L00065F`
  - `04:9BF5` via `L001210 -> 26FB -> L00073E`
  - optional `L00A9F2(1)` onto a seeded `954` CGRAM base
- the current seeded prototype output is `tools/out/bank1_l00a00c_scene.ppm`, and it is still `100.000000%` mismatched against both frame `958` and frame `974`
- practical reading:
  - the remaining gap is not just "wrong capture boundary"
  - the bootstrap likely depends on additional carried-over or mutated state beyond the obvious direct uploads

The new bootstrap delta summaries make that sharper:

- `tools/out/intro_bootstrap_954_958_delta.json`
  - screenshot mismatch: `13.741629%`
  - `VRAM` delta: `6808` bytes
  - `CGRAM` delta: `0` bytes
  - reading: the first visible bootstrap step carries Ballistic CGRAM forward unchanged
- `tools/out/intro_bootstrap_958_974_delta.json`
  - screenshot mismatch: `0.000000%`
  - `VRAM` delta: `5875` bytes, all odd-byte changes
  - `CGRAM` delta: `278` bytes
  - active main callback changes from `00:8029` to `01:9D69`
  - key state variables first become nonzero:
    - `$0202 = 1`
    - `$0208 = 13`
    - `$020A = 0x9CC3`
    - `$040A = 0xFFFF`
  - reading: `01:9D69` is the first live bootstrap callback that populates the state feeding `L009DC6`

The probe can now also dump low WRAM around those staging queues with `TD2_BOOT_PROBE_DUMP_WRAM_MEMORY=1`:

- `td2_boot_probe_wram.bin`
- `td2_boot_probe_startframe_wram.bin`

That extra dump tightened the bootstrap reading:

- frame `958`
  - `dp_0054 = 0x00`
  - `state_09A2 = 0`
  - `state_09A4 = 0x0200`
- frame `974`
  - `dp_0054 = 0x10`
  - `state_09A2 = 0`
  - `state_09A4 = 0x0200`
  - practical reading: exactly `2` `0600` DMA descriptors are armed for the next NMI pass
- `tools/out/intro_bootstrap_958_974_queue.json`
  - decodes that WRAM window into queue structures
  - carries both raw probe context and a ready-to-consume active slice:
    - `probe_after.dp_0054 = 16`
    - `regions.0600_dma_queue.active_dma_descriptor_count_after = 2`
    - `regions.0600_dma_queue.active_after_entries`
  - the two active `0600` descriptors at frame `974` are:
    - command `0x01`, source `1A:9948`, size `0x1040`, VRAM destination `0x4000`
    - command `0x01`, source `1A:A988`, size `0x0040`, VRAM destination `0x4900`
  - `0700..091F` is confirmed as the staged OAM buffer copied by the NMI `DMA1 -> $2104` upload
  - the repeated `0xE100` head word in that region is the OAM fill/sentinel pattern, not a tile queue entry
- `tools/out/intro_bootstrap_978_982_queue.json`
  - frame `978` still runs `01:9FE5` with `4` active descriptors
  - frame `982` still runs `01:9FE5` with `5` active descriptors
  - the new active descriptor is:
    - `1A:AB58 -> VRAM 0x49A0`, size `0x0100`
  - applying that queue onto the derived frame-`978` seed yields `tools/out/bank1_bootstrap_queue_982.ppm`
  - current compare vs the real frame `982` target: `2` mismatched pixels (`0.003488%`)
- `tools/out/intro_bootstrap_982_986_queue.json`
  - frame `986` still runs `01:9FE5` but grows the active queue to `7` descriptors
  - the two new active descriptors are:
    - `1A:AA10 -> VRAM 0x4920`, size `0x0100`
    - `1A:ACA0 -> VRAM 0x49A0`, size `0x0100`
  - applying that queue onto the derived frame-`982` seed yields `tools/out/bank1_bootstrap_queue_986.ppm`
  - current compare vs the real frame `986` target: `958` mismatched pixels (`1.670619%`)
  - disabling OBJ on the same derived scene yields `tools/out/bank1_bootstrap_queue_986_noobj.ppm`
  - current compare with OBJ disabled: `21` mismatched pixels (`0.036621%`)
  - overriding OBJ with the clean Mesen bridge OAM yields `tools/out/bank1_bootstrap_queue_986_bridgeoverride.ppm`
  - current compare with bridge OAM override: `21` mismatched pixels (`0.036621%`)
  - practical reading: queued VRAM plus staged OAM is enough for the frame-`986` BG path too; the remaining regression is concentrated in Mode 7 OBJ composition
  - the concrete late-frame OAM finding is:
    - `make -C tools intro-oam-deltas` now writes machine-readable reports under `tools/out/intro_oam_deltas/`
    - probe OAM and bridge OAM still match exactly at frames `978` and `982`
    - at frame `986`, the full `544`-byte OAM dumps diverge by `37` bytes (`35` low-table, `2` high-table)
    - the `986` sprite-level delta is `9` changed visible sprites in the probe dump versus `0` visible sprites in the bridge dump
    - at frame `990`, the full `544`-byte OAM dumps diverge by `92` bytes (`86` low-table, `6` high-table)
    - the `990` sprite-level delta is `23` changed visible sprites in the probe dump versus `5` visible sprites in the bridge dump
    - the bad Mode 7 OBJ overlay tracks the probe OAM dump, not the bridge OAM dump
- `tools/out/intro_bootstrap_986_990_queue.json`
  - frame `990` still runs `01:9FE5` and carries the next WRAM queue delta forward from the bridge-accurate `986` seed
  - applying that queue onto `tools/out/bank1_bootstrap_queue_986_bridgeoverride_vram.bin` with clean bridge OAM yields `tools/out/bank1_bootstrap_queue_990_bridgeobj.ppm`
  - current compare vs the real frame `990` screenshot: `1518` mismatched pixels (`2.647182%`)
  - current compare vs Mesen `main_visible.ppm`: `2` mismatched pixels (`0.003488%`)
  - practical reading: the queue-driven attract path can now advance natively through frame `990` when measured against extracted Mesen scene output, but the final-screen gap after frame `982` is still open
  - the current committed `994` scene variants (`fromraw990` vs `bridgeobj`) now compare at `0` OAM bytes / `0` sprite deltas, so the remaining `994` screenshot gap is already downstream of raw OAM in the committed artifact set
- bridge-visible late attract modeling now goes further than the queue replay path:
  - bridge frame extracts for `991..997` show that the visible Mode 7 buffers at `0x4920` and `0x49A0` rotate among three ROM chunks (`1A:AA10`, `1A:AB58`, `1A:ACA0`) instead of exposing the last traced DMA stream directly
  - `tools/build_mode7_source_scene.py` captures that model by seeding from bridge frame `990` VRAM and patching those two visible regions from ROM
  - resulting validation against Mesen `main_visible.ppm`:
    - `tools/out/bank1_mode7_visible_991.ppm`: `4` mismatched pixels
    - `tools/out/bank1_mode7_visible_992.ppm`: `4` mismatched pixels
    - `tools/out/bank1_mode7_visible_993.ppm`: `4` mismatched pixels
    - `tools/out/bank1_mode7_visible_994.ppm`: `4` mismatched pixels
    - `tools/out/bank1_mode7_visible_995.ppm`: `4` mismatched pixels
    - `tools/out/bank1_mode7_visible_996.ppm`: `4` mismatched pixels
    - `tools/out/bank1_mode7_visible_997.ppm`: `4` mismatched pixels
  - practical reading: the derived bridge-visible model now closes `991..997`, but the callback-level explanation for that visible-buffer rotation is still open
- the next aligned sampled block is now carried directly from extracted SNES state:
  - `tools/out/mesen_range_998_1005_v1/sequence.txt`
  - `tools/out/mesen_range_1006_1013_v1/sequence.txt`
  - `tools/out/mesen_range_1014_1021_v1/sequence.txt`
  - `tools/out/mesen_range_1022_1029_v1/sequence.txt`
  - `tools/out/mesen_range_1030_1037_v1/sequence.txt`
  - `tools/out/mesen_range_1038_1045_v1/sequence.txt`
  - `tools/out/mesen_range_1046_1053_v1/sequence.txt`
  - `tools/out/mesen_range_1054_1061_v1/sequence.txt`
  - `tools/out/mesen_range_1062_1069_v1/sequence.txt`
  - `tools/out/mesen_range_1070_1077_v1/sequence.txt`
  - `tools/out/mesen_range_1078_1085_v1/sequence.txt`
  - `tools/out/mesen_range_1086_1093_v1/sequence.txt`
  - probe-confirmed callback continuity:
    - frame `998`: `active_main = 01:9FE5`, `$0202 = 1`, `$0204 = 2`, `$0208 = 13`, `$020A = $9CC3`, `$0054 = 152`
    - frame `1005`: `active_main = 01:9FE5`, `$0202 = 1`, `$0204 = 3`, `$0208 = 13`, `$020A = $9CC3`, `$0054 = 208`
    - frame `1013`: `active_main = 01:9FE5`, `$0202 = 1`, `$0204 = 1`, `$0208 = 13`, `$020A = $9CC3`, `$0054 = 8`
    - frame `1014`: `active_main = 01:9FE5`, `$0202 = 1`, `$0204 = 2`, `$0208 = 13`, `$020A = $9CC3`, `$0054 = 16`
    - frame `1021`: `active_main = 01:9FE5`, `$0202 = 1`, `$0204 = 1`, `$0208 = 13`, `$020A = $9CC3`, `$0054 = 32`
    - frame `1022`: `active_main = 01:9FE5`, `$0202 = 1`, `$0204 = 1`, `$0208 = 13`, `$020A = $9CC3`, `$0054 = 32`
    - frame `1029`: `active_main = 01:9FE5`, `$0202 = 1`, `$0204 = 1`, `$0208 = 13`, `$020A = $9CC3`, `$0054 = 40`
    - frame `1037`: `active_main = 01:9FE5`, `$0202 = 1`, `$0204 = 1`, `$0208 = 13`, `$020A = $9CC3`, `$0054 = 56`
    - frame `1045`: `active_main = 01:9FE5`, `$0202 = 1`, `$0204 = 1`, `$0208 = 13`, `$020A = $9CC3`, `$0054 = 72`
    - frame `1053`: `active_main = 01:9FE5`, `$0202 = 1`, `$0204 = 1`, `$0208 = 13`, `$020A = $9CC3`, `$0054 = 88`
    - frame `1061`: `active_main = 01:9FE5`, `$0202 = 1`, `$0204 = 1`, `$0206 = 9`, `$0208 = 13`, `$020A = $9CC3`, `$040A = 14`, `$0054 = 104`
    - frame `1069`: `active_main = 01:9FE5`, `$0202 = 1`, `$0204 = 1`, `$0206 = 11`, `$0208 = 13`, `$020A = $9CC3`, `$040A = 16`, `$0054 = 120`
    - frame `1077`: `active_main = 01:9FE5`, `$0202 = 1`, `$0204 = 1`, `$0206 = 13`, `$0208 = 13`, `$020A = $9CC3`, `$040A = 17`, `$0054 = 128`
    - frame `1085`: `active_main = 01:9FE5`, `$0202 = 1`, `$0204 = 1`, `$0206 = 13`, `$0208 = 13`, `$020A = $9CC3`, `$040A = 17`, `$0054 = 128`
    - frame `1093`: `active_main = 01:9FE5`, `$0202 = 1`, `$0204 = 1`, `$0206 = 13`, `$0208 = 13`, `$020A = $9CC3`, `$040A = 17`, `$0054 = 128`
  - SDL playback from `tools/out/intro_loop_hybrid_bridge_visible_sequence.txt` compares against Mesen `main_visible.ppm` at:
    - frame `998`: `4` mismatched pixels
    - frame `999`: `4` mismatched pixels
    - frame `1000`: `2` mismatched pixels
    - frame `1001`: `4` mismatched pixels
    - frame `1002`: `4` mismatched pixels
    - frame `1003`: `4` mismatched pixels
    - frame `1004`: `4` mismatched pixels
    - frame `1005`: `4` mismatched pixels
    - frame `1006`: `6` mismatched pixels
    - frame `1007`: `6` mismatched pixels
    - frame `1008`: `6` mismatched pixels
    - frame `1009`: `6` mismatched pixels
    - frame `1010`: `6` mismatched pixels
    - frame `1011`: `8` mismatched pixels
    - frame `1012`: `8` mismatched pixels
    - frame `1013`: `10` mismatched pixels
    - frames `1014..1021`: `10` mismatched pixels each
    - frames `1022..1023`: `10` mismatched pixels each
    - frames `1024..1025`: `8` mismatched pixels each
    - frames `1026..1029`: `11` mismatched pixels each
    - frames `1030..1037`: `0, 0, 0, 0, 4, 3, 0, 0` mismatched pixels each
    - frames `1038..1045`: `6, 6, 9, 12, 13, 11, 16, 15` mismatched pixels each
    - frames `1046..1053`: `13, 13, 16, 18, 18, 18, 17, 14` mismatched pixels each
    - frames `1054..1061`: `14, 14, 15, 16, 19, 20, 21, 22` mismatched pixels each
    - frames `1062..1069`: `25, 26, 26, 21, 26, 23, 23, 25` mismatched pixels each
    - frames `1070..1077`: `29, 27, 26, 28, 34, 33, 39, 32` mismatched pixels each
    - frames `1078..1085`: `41, 41, 47, 47, 58, 63, 60, 69` mismatched pixels each
    - frames `1086..1093`: `89, 92, 89, 90, 102, 115, 144, 129` mismatched pixels each
  - the SDL runtime now uses the scanline-accurate `mode7-ppu` object compositor for Mode 7 `snes_bg` playback, which is what closed the `1022/1023/1025` regression window
  - practical reading: bridge-visible native coverage now extends through frame `1093`, and `998..1093` are still inside the same `01:9FE5` family as the derived `991..997` window, but the mismatch ramp from `1078..1093` suggests a later composition detail is becoming more important

The probe now also writes a second PPU-memory snapshot at the start of the sampled frame when `TD2_BOOT_PROBE_DUMP_PPU_MEMORY=1` is enabled:

- `td2_boot_probe_startframe_vram.bin`
- `td2_boot_probe_startframe_cgram.bin`
- `td2_boot_probe_startframe_oam.bin`
- `td2_boot_probe_startframe_ppu_state.json`

That snapshot is useful when a front-end state rewrites VRAM or Mode 7 registers during late vblank and contaminates the simpler end-of-frame dump.

There is also an optional register trace for Mode 7 and `TMAIN` writes:

```sh
TD2_BOOT_PROBE_TOTAL_FRAMES=1201 \
TD2_BOOT_PROBE_SCREENSHOT_FRAME=1200 \
TD2_BOOT_PROBE_TRACE_MODE7=1 \
./validation/run_mesen_probe_boot.sh
```

This emits `td2_boot_probe_mode7_writes.json`, which can be summarized with:

```sh
python3 tools/summarize_mode7_trace.py \
  .mesen-config/Mesen2/LuaScriptData/mesen_probe_boot/td2_boot_probe_mode7_writes.json
```

Both traces also support a frame window instead of a single sampled frame:

```sh
TD2_BOOT_PROBE_TOTAL_FRAMES=1201 \
TD2_BOOT_PROBE_SCREENSHOT_FRAME=1200 \
TD2_BOOT_PROBE_TRACE_START_FRAME=900 \
TD2_BOOT_PROBE_TRACE_END_FRAME=1200 \
TD2_BOOT_PROBE_TRACE_DMA=1 \
./validation/run_mesen_probe_boot.sh
```

That emits `td2_boot_probe_dma_writes.json`, which can be summarized with the same helper:

```sh
python3 tools/summarize_mode7_trace.py \
  .mesen-config/Mesen2/LuaScriptData/mesen_probe_boot/td2_boot_probe_dma_writes.json
```

Current reading from those traces:

- frame `1080`: only `20` tracked CPU writes, all clustered at scanlines `225-231`
- frame `1200`: `274` tracked writes, with heavy VRAM traffic through `$2118/$2119` at scanlines `227-229`
- this means the naive end-of-frame VRAM/PPU snapshot can include next-frame preparation data
- however, switching to the new `startFrame` snapshot does not materially reduce the BG-only mismatch for these frames, so the remaining gap is not explained by a simple “captured the wrong frame state” issue alone
- a wider DMA trace over frames `900-1200` shows no CPU writes to `HDMAEN` or channel `7` setup registers in that window
- the same DMA trace shows the attract Mode 7 path becoming active around frame `974`:
  - frame `974`: channel `1` MDMA to `BBAD1 = $04`, i.e. OAM upload
  - frame `975` onward: repeated channel `0` MDMA to `BBAD0 = $18`, i.e. VRAM upload, alongside channel `1` OAM DMA
- a narrow Mode 7 trace over frames `974-977` pins the scene handoff more tightly:
  - frame `975`: callback `01:9D69` is already performing VRAM writes through `$2116-$2119`
  - frame `976`: callback `01:9FE5` performs the first observed `M7A/M7D` writes
  - by frame `977`, the Mode 7 attract loop is established under `01:9FE5`
- practical reading from that combined evidence:
  - the Mode 7 scene is not being born from a fresh HDMA setup on frames `974-1200`
  - the remaining mismatch is more likely either hardware-side HDMA activity armed before the traced window, or a remaining Mode 7 presentation nuance in the renderer, than a missing CPU-visible setup step in that interval

The scanline-step probe narrows that further for frame `1200`:

```sh
TD2_SCANLINE_TEST_OUTPUT_PREFIX=tools/out/scanline_frame_1200/td2_scanline_step_test \
TD2_SCANLINE_TEST_TARGET_FRAME=1200 \
TD2_SCANLINE_TEST_MAX_SAMPLES=224 \
./validation/run_mesen_capture.sh ./game.smc ./validation/mesen_scanline_step_test.lua
```

That writes `tools/out/scanline_frame_1200/td2_scanline_step_test.json`.
If `TD2_SCANLINE_TEST_OUTPUT_PREFIX` is unset, the legacy fallback still writes
to `.mesen-config/Mesen2/LuaScriptData/mesen_scanline_step_test/td2_scanline_step_test.json`.
Current reading from that probe:

- all `224` visible scanlines on frame `1200` report the same sampled `ppu.mode7.*` values
- `ppu.bgMode = 7` and `ppu.mainScreenLayers = 0x11` remain stable across the sampled frame
- `ppu.mode7.matrix[0] = 256`, `ppu.mode7.matrix[3] = 257`, `ppu.mode7.hscroll = 0`, `ppu.mode7.vscroll = 8191` remain stable across the sampled frame
- this makes a scanline-varying Mode 7 register state much less likely as the primary explanation for the remaining frame-`1200` mismatch

The same scanline-step path now also has a repeatable range wrapper for the next bridge-visible frontier:

```sh
python3 tools/capture_visible_mode7_range.py \
  1094 1101 \
  --output tools/out/visible_mode7_1094_1101.json
python3 tools/apply_visible_mode7_samples.py \
  tools/out/visible_mode7_1094_1101.json \
  tools/out/mesen_range_1094_1101_v1
```

That wrapper now keeps its raw scanline probe JSON in a repo-owned per-run
scratch prefix beside the aggregate output, by default:
`tools/out/visible_mode7_1094_1101_scanline_probe/td2_scanline_step_test.json`.

For seeded gameplay visible-phase sampling, the same Lua probe can now be
driven through a fuller wrapper that preserves every sampled scanline and the
probe's boundary snapshots:

```sh
python3 tools/capture_scanline_samples_range.py \
  86 86 \
  --savestate .mesen-config/Mesen2/SaveStates/game_11.mss \
  --input-windows '60-359:b' \
  --output tools/out/track1_b_hold_scanline_frame_0086_v1.json \
  --max-samples 224
```

That path is the current debugger-oriented follow-up for gameplay-era lanes
where `emu.takeScreenshot()` and end-of-frame raw `PPU` dumps disagree.

Current reading from that `1094..1101` visible-state pass:

- the captured visible `M7A/M7D` pairs are:
  - `1094`: `1152 / 1028`
  - `1095`: `1024 / 1028`
  - `1096`: `896 / 771`
  - `1097`: `768 / 771`
  - `1098`: `640 / 514`
  - `1099`: `512 / 514`
  - `1100`: `384 / 257`
  - `1101`: `256 / 257`
- those visible values do not match the direct bridge-extracted `ppu_state.json` files for the same frames
- however, applying those visible values onto the extracted `1094..1101` frame states yields much worse `main_visible` compares:
  - frames `1094..1101`: `362, 414, 606, 700, 1244, 1515, 3962, 5930` mismatched pixels
- a focused boot probe at frame `1094` confirms that the probe `startframe` snapshot already carries the same visible `M7A/M7D = 1152 / 1028` pair and still renders at `362` mismatched pixels against the extracted `main_visible`
- practical reading:
  - the late-attract frontier after `1093` is not blocked by a simple stale end-of-frame `ppu_state` alone
  - native bridge-visible coverage should therefore stay promoted only through `1093` until the wider composition/export nuance is explained

The current OBJ experiments line up with that reading:

- `tools/render_mesen_snes_bg.py` now accepts `--oam` and can compose OBJ over the reconstructed BG frame
- on frame `1200`, the default `--obj-renderer simple` path reduces mismatch from `9.125628%` to `7.934570%`
- on frame `1080`, the same simple OBJ overlay is still wrong enough to worsen the result to `26.457868%`
- an experimental `--obj-renderer mode7-ppu` path tries to follow the SNES per-scanline sprite fetch flow more closely, but on frame `1200` it still lands at `8.032227%`
- practical reading:
  - OBJ is definitely part of the remaining delta on the later attract frame
  - OBJ alone does not explain the full mismatch, and the current 1080 OBJ decode/composition path is still incomplete or incorrect

Notes:

- The default input pattern uses `b = true` as the candidate accelerate button. Confirm or adjust this once track 1 is wired into the capture workflow.
- `mesen_capture.lua` now calls `emu.stop(0)` when capture finishes so the `--testRunner` process exits cleanly.
- In this environment, one downloaded Linux release binary crashed with `std::bad_cast` under `--testRunner`, while a local source-build binary resolved through `MESEN_BIN` completed the same capture successfully.
- Mesen2's `--testRunner` path does not expose a clean CLI hook for loading a `.mss` savestate before the script runs. The current workaround is a one-shot `emu.addMemoryCallback(..., emu.callbackType.exec, ...)` that calls `emu.loadSavestate(...)` on the first executed instruction.
- When `run_mesen_capture.sh` is called without a third argument, it exports an empty `TD2_CAPTURE_SAVESTATE` and the script stays on the original power-on plus warm-up flow.
- The no-savestate path was revalidated after this change. The savestate-loading branch was implemented against Mesen's shipped Lua API documentation, but it was not exercised here because there was no sample savestate file in the workspace.
