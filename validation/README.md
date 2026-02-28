# Validation

This directory contains the first validation harness artifact for Sprint 0.

Current asset:

- `mesen_capture.lua`: a Mesen-S/Mesen 2 Lua script that can override input for a fixed window, emit per-frame screenshots, and write a JSON input log
- `run_mesen_capture.sh`: a launcher that creates an isolated Mesen config inside the repo, enables Lua file I/O, and runs the script in `--testRunner` mode
- `mesen_probe_boot.lua`: a lightweight state probe that records boot/title selectors like `$1C78/$1C7A/$1CCA/...` once per frame
- `run_mesen_probe_boot.sh`: convenience wrapper around the generic launcher for the boot probe
- `mesen_dump_bg_range.lua`: single-run range dumper for `VRAM + CGRAM + PPU state` and optional screenshots on selected frames
- `run_mesen_dump_bg_range.sh`: convenience wrapper around the generic launcher for that range dumper
- `mesen_scanline_step_test.lua`: an experimental scanline-step probe that uses `emu.step(..., ppuScanline)` plus `codeBreak` to sample `emu.getState()` once per visible scanline on a target frame

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

To seed the run from a deterministic savestate instead of power-on:

```sh
./validation/run_mesen_capture.sh ./game.smc ./validation/mesen_capture.lua /absolute/path/to/start_state.mss
```

To inspect the boot/title selectors directly:

```sh
./validation/run_mesen_probe_boot.sh
```

To dump a whole intro range in one emulator run:

```sh
MESEN_TIMEOUT_SECONDS=75 \
TD2_BG_RANGE_START_FRAME=654 \
TD2_BG_RANGE_END_FRAME=2070 \
TD2_BG_RANGE_STEP=4 \
TD2_BG_RANGE_DUMP_SCREENSHOTS=1 \
TD2_BG_RANGE_OUTPUT_PREFIX=/home/nivando-soares/asmdump/tools/out/intro_loop \
./validation/run_mesen_dump_bg_range.sh
```

That produces flat files like:

- `tools/out/intro_loop_frame_00654_vram.bin`
- `tools/out/intro_loop_frame_00654_cgram.bin`
- `tools/out/intro_loop_frame_00654_ppu_state.json`
- `tools/out/intro_loop_frame_00654_frame.png`
- `tools/out/intro_loop.json`

The boot probe writes a JSON timeline and a final screenshot under the script data folder, using the prefix `td2_boot_probe`.
You can also drive it with simple scripted input via environment variables, for example:

```sh
TD2_BOOT_PROBE_TOTAL_FRAMES=3600 \
TD2_BOOT_PROBE_INPUT_START_FRAME=240 \
TD2_BOOT_PROBE_INPUT=start,b \
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

- `.mesen-config/Mesen2/LuaScriptData/mesen_probe_boot/td2_boot_probe.json`
- `.mesen-config/Mesen2/LuaScriptData/mesen_probe_boot/td2_boot_probe_frame.png`
- `.mesen-config/Mesen2/LuaScriptData/mesen_probe_boot/td2_boot_probe_vram.bin`
- `.mesen-config/Mesen2/LuaScriptData/mesen_probe_boot/td2_boot_probe_cgram.bin`
- `.mesen-config/Mesen2/LuaScriptData/mesen_probe_boot/td2_boot_probe_oam.bin`
- `.mesen-config/Mesen2/LuaScriptData/mesen_probe_boot/td2_boot_probe_ppu_state.json`

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
By default it prefers a local source build at `/home/nivando-soares/Mesen2/bin/linux-x64/Release/Mesen` and falls back to the downloaded binary if needed.

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
  - the native OAM-aware `snes_bg` window for `978..985`
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
  - frame offset `324` vs source frame `978`: `3` mismatched pixels (`0.005232%`)
  - frame offset `328` vs source frame `982`: `4` mismatched pixels (`0.006975%`)

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
  - keep `978..985` as the first promoted native post-Ballistic window inside the hybrid loop
  - `tools/out/intro_native_978/sequence.txt` is now the splice source for that `978..985` window

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
  - `L00A9F2(1)` onto a seeded `954` CGRAM base
- the current seeded prototype output is `tools/out/bank1_l00a00c_scene.ppm`, and it is still `100.000000%` mismatched against both frame `958` and frame `974`
- practical reading:
  - the remaining gap is not just "wrong capture boundary"
  - the bootstrap likely depends on additional carried-over or mutated state beyond the obvious direct uploads

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
TD2_SCANLINE_TEST_TARGET_FRAME=1200 \
TD2_SCANLINE_TEST_MAX_SAMPLES=224 \
./validation/run_mesen_capture.sh ./game.smc ./validation/mesen_scanline_step_test.lua
```

That writes `.mesen-config/Mesen2/LuaScriptData/mesen_scanline_step_test/td2_scanline_step_test.json`.
Current reading from that probe:

- all `224` visible scanlines on frame `1200` report the same sampled `ppu.mode7.*` values
- `ppu.bgMode = 7` and `ppu.mainScreenLayers = 0x11` remain stable across the sampled frame
- `ppu.mode7.matrix[0] = 256`, `ppu.mode7.matrix[3] = 257`, `ppu.mode7.hscroll = 0`, `ppu.mode7.vscroll = 8191` remain stable across the sampled frame
- this makes a scanline-varying Mode 7 register state much less likely as the primary explanation for the remaining frame-`1200` mismatch

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
- In this environment, the downloaded `Mesen_2.1.1_Linux_x64/Mesen` binary crashed with `std::bad_cast` under `--testRunner`, while `/home/nivando-soares/Mesen2/bin/linux-x64/Release/Mesen` completed the capture successfully.
- Mesen2's `--testRunner` path does not expose a clean CLI hook for loading a `.mss` savestate before the script runs. The current workaround is a one-shot `emu.addMemoryCallback(..., emu.callbackType.exec, ...)` that calls `emu.loadSavestate(...)` on the first executed instruction.
- When `run_mesen_capture.sh` is called without a third argument, it exports an empty `TD2_CAPTURE_SAVESTATE` and the script stays on the original power-on plus warm-up flow.
- The no-savestate path was revalidated after this change. The savestate-loading branch was implemented against Mesen's shipped Lua API documentation, but it was not exercised here because there was no sample savestate file in the workspace.
