# Track 1 `b_hold` Visible-Scanline Probe `0086/0092/0108`

- Seed savestate: `.mesen-config/Mesen2/SaveStates/game_11.mss`
- Input schedule:
  - hold `b` from script frames `60..359`
- Scanline sampler:
  - `validation/mesen_scanline_step_test.lua`
  - `tools/capture_scanline_samples_range.py`
- Trace follow-up:
  - `validation/mesen_probe_boot.lua` with `TD2_BOOT_PROBE_TRACE_MODE7=1`

## Artifacts

- Visible-scanline sample captures:
  - `tools/out/track1_b_hold_scanline_frame_0086_v1.json`
  - `tools/out/track1_b_hold_scanline_frame_0092_v1.json`
  - `tools/out/track1_b_hold_scanline_frame_0108_v1.json`
  - `tools/out/track1_b_hold_scanline_summary_0086_0092_0108_v1.json`
  - `tools/out/track1_b_hold_scanline_frame_0086_v2.json`
  - `tools/out/track1_b_hold_scanline_frame_0092_v2.json`
  - `tools/out/track1_b_hold_scanline_frame_0108_v2.json`
  - `tools/out/track1_b_hold_scanline_summary_0086_0092_0108_v2.json`
  - `tools/out/track1_b_hold_scanline_frame_0086_v3.json`
  - `tools/out/track1_b_hold_scanline_frame_0092_v3.json`
  - `tools/out/track1_b_hold_scanline_frame_0108_v3.json`
  - `tools/out/track1_b_hold_scanline_summary_0086_0092_0108_v3.json`
  - `tools/out/track1_b_hold_scanline_frame_0086_v4.json`
  - `tools/out/track1_b_hold_scanline_frame_0092_v4.json`
  - `tools/out/track1_b_hold_scanline_frame_0108_v4.json`
  - `tools/out/track1_b_hold_scanline_summary_0086_0092_0108_v4.json`
  - `tools/out/track1_b_hold_scanline_frame_0086_v5.json`
  - `tools/out/track1_b_hold_scanline_frame_0092_v5.json`
  - `tools/out/track1_b_hold_scanline_frame_0108_v5.json`
  - `tools/out/track1_b_hold_visible_queue_0086_0092_0108_v1.json`
- Archived trace capture:
  - `tools/out/track1_b_hold_probe_trace_0086_0108_v1/td2_boot_probe.json`
  - `tools/out/track1_b_hold_probe_trace_0086_0108_v1/td2_boot_probe_mode7_writes.json`
  - `tools/out/track1_b_hold_probe_trace_0086_0108_v1/td2_boot_probe_mode7_writes_summary.json`
- Archived negative exec/write trace:
  - `tools/out/track1_b_hold_execwrite_trace_0086_0108_v1/td2_boot_probe.json`
- Archived low-page/WRAM write trace follow-up:
  - `tools/out/track1_b_hold_dp54_write_trace_0086_0108_v1/td2_boot_probe.json`
  - `tools/out/track1_b_hold_dp54_write_trace_0086_0108_v1/td2_boot_probe_write_summary.json`
- Archived queue-cursor trace follow-up:
  - `tools/out/track1_b_hold_queue_cursor_trace_0086_0108_v1/td2_boot_probe.json`
  - `tools/out/track1_b_hold_queue_cursor_trace_0086_0108_v1/td2_boot_probe_trace_summary.json`
  - `tools/out/track1_b_hold_queue_cursor_trace_0086_0108_v2/td2_boot_probe.json`
  - `tools/out/track1_b_hold_queue_cursor_trace_0086_0108_v2/td2_boot_probe_trace_summary.json`
- Archived scanline-local trace follow-up:
  - `tools/out/track1_b_hold_scanline_frame_0086_trace_v1.json`
  - `tools/out/track1_b_hold_scanline_frame_0086_trace_v2.json`
  - `tools/out/track1_b_hold_scanline_frame_0086_trace_v2_summary.json`
  - `tools/out/track1_b_hold_scanline_frame_0086_trace_v3.json`
  - `tools/out/track1_b_hold_scanline_frame_0086_trace_v4.json`
  - `tools/out/track1_b_hold_scanline_frame_0086_trace_v4_summary.json`
  - `tools/out/track1_b_hold_scanline_frame_0086_trace_v5.json`
  - `tools/out/track1_b_hold_scanline_frame_0086_trace_v5_summary.json`
  - `tools/out/track1_b_hold_scanline_frame_0087_trace_v1.json`
  - `tools/out/track1_b_hold_scanline_frame_0087_trace_v1_summary.json`
  - `tools/out/track1_b_hold_scanline_frame_0088_trace_v1.json`
  - `tools/out/track1_b_hold_scanline_frame_0088_trace_v1_summary.json`
  - `tools/out/track1_b_hold_scanline_frame_0090_trace_v1.json`
  - `tools/out/track1_b_hold_scanline_frame_0090_trace_v1_summary.json`
  - `tools/out/track1_b_hold_scanline_frame_0090_trace_v2.json`
  - `tools/out/track1_b_hold_scanline_frame_0090_trace_v2_summary.json`
  - `tools/out/track1_b_hold_scanline_frame_0091_trace_v1.json`
- Archived WRAM follow-up:
  - `tools/out/track1_b_hold_wram_frame_0086_v1/td2_boot_probe_startframe_wram.bin`
  - `tools/out/track1_b_hold_wram_frame_0092_v1/td2_boot_probe_startframe_wram.bin`
  - `tools/out/track1_b_hold_wram_frame_0108_v1/td2_boot_probe_startframe_wram.bin`
  - `tools/out/track1_b_hold_wram_queue_0086_0092_0108_v1.json`

## Visible-Phase Reading

- Full visible-frame sampling (`224` scanlines each) does not match the old
  end-of-frame gameplay probe surface.
- On all sampled scanlines for frames `86`, `92`, and `108`:
  - `active_main = 02:9016`
  - `active_irq` alternates between `01:96A0` and `01:960D`
  - `ppu.bgMode = 1`
  - `ppu.mainScreenLayers` toggles between `0x13` and `0x17`
- The sampled visible phase also shows stable split-style layer motion that the
  end-of-frame raw dump does not preserve:
  - `bg2_hscroll` spans `66` values across the frame
  - `bg2_vscroll` spans `101` values across the frame
  - `bg3_vscroll` toggles between `0x03FF` and `0x0014`
- In contrast, the older end-of-frame raw/probe lane for the same seed still
  reports:
  - `active_main = active_nmi = 00:8029`
  - `active_irq = 00:835F`
  - `ppu.mainScreenLayers = 0x04`

## Late-Scanline Register Writes

- The targeted register trace over frames `86..108` records `16` tracked writes
  on every frame:
  - `M7HOFS`
  - `M7VOFS`
  - `$210F`
  - `$2110`
  - `$2111`
  - `$2112`
  - `$2113`
  - `$2114`
- Those writes always land at scanlines `225..227`.
- No DMA writes and no VRAM/CGRAM writes were recorded in the same probe run.
- The traced register-write pattern is identical on frames `86`, `92`, and
  `108`.

## Producer-State Follow-Up

- The second scanline pass (`v2`) added the bank-1 IRQ producer fields used by
  `01:96A0/01:960D`:
  - `$1396`
  - `$13A4/$13A6/$13A8/$13AA/$13AC/$13AE`
  - `$13B4/$13B6/$13BA`
  - `$1CE6/$1CEB/$1CEC`
  - `$1E1C/$1E1E`
  - `$0F3A`
  - visible window and OAM state from `emu.getState()`
- Current reading from those `v2` artifacts:
  - all of those producer-side fields stay identical across frames `86`, `92`,
    and `108`
  - the visible window and OAM summary fields also stay identical across those
    same frames
- A targeted end-of-frame probe trace against the same producer addresses was
  also negative:
  - archived in `tools/out/track1_b_hold_execwrite_trace_0086_0108_v1/`
  - no exec hits were recorded at `02:9016`, `01:960D`, or `01:96A0`
  - no writes were recorded at the bank-1 producer-side WRAM addresses during
    the traced `86..108` window
- Practical read:
  - the bank-1 IRQ producer-side state is not what distinguishes the screenshot
    states at `92` and `108`

## Direct-Page Base Follow-Up

- The third scanline pass (`v3`) added `cpu.d` plus an explicit effective
  direct-page read for the sampled `dp_0054` field.
- Current reading from the `v3` artifacts:
  - `cpu.d` stays `0` on all sampled scanlines for frames `86`, `92`, and
    `108`
  - the effective direct-page address therefore stays fixed at `0x0054`
  - `dp_0054_effective` matches `dp_0054` exactly on all three frames
- Practical read:
  - the sampled visible-phase discriminator is not coming from a hidden
    nonzero direct-page base

## WRAM-Mirror Follow-Up

- The fourth scanline pass (`v4`) added explicit `7E:0054..0056` samples
  alongside the low-page reads.
- Current reading from the `v4` artifacts:
  - visible-phase `00:0054..0056` matches `7E:0054..0056` exactly on all
    sampled scanlines
  - frame `86` samples `0x38/0x90/0x15`
  - frames `92` and `108` sample `0x48/0x90/0x15`
  - only `7E:0054` changes across the three frames
- Practical read:
  - the remaining visible-phase discriminator is now bound more tightly:
    it is a real `7E:0054` WRAM value, not just an ambiguous low-page read

## End-Of-Frame Write-Trace Follow-Up

- A targeted boot-probe write trace followed the same `86..108` window against:
  - `00:0054..0056`
  - `7E:0054..0056`
- Archived summary:
  - `tools/out/track1_b_hold_dp54_write_trace_0086_0108_v1/td2_boot_probe_write_summary.json`
- Current reading:
  - the end-of-frame trace records only late low-page writes to:
    - `00:0055 = 0x84`
    - `00:0056 = 0x17`
  - that write pair repeats once per frame at scanline `227` for every frame
    `86..108`
  - no write hits were recorded at `00:0054` or `7E:0054..0056`
  - the same end-of-frame probe snapshots at `86`, `92`, and `108` still read
    `dp_0054 = 0` under `active_main = 00:8029`
- Practical read:
  - visible-phase `7E:0054` is real, but the current end-of-frame boot-probe
    write lane still does not observe the producer or reset path that takes it
    from `0x38 -> 0x48 -> 0x00`

## Visible Queue-Cursor Follow-Up

- The fifth scanline pass (`v5`) extended the visible-phase samples with the
  paired queue cursor and a parsed summary of the `0600` DMA ring.
- Current reading from the `v5` artifacts:
  - frame `86` samples `00:0053/0054 = 7E:0053/0054 = 0x38/0x38`
  - frames `92` and `108` sample
    `00:0053/0054 = 7E:0053/0054 = 0x48/0x48`
  - all three frames still sample `7E:0055/0056 = 0x90/0x15`
  - `queue_dma_active_descriptor_count = 0` on all `224` visible scanlines
    for all three frames
  - `queue_dma_nonzero_entry_count = 32`, so the stale `0600` ring remains
    populated outside the active cursor window
- Practical read:
  - the old “visible-phase `7E:0054` split” is now too narrow a read
  - the real sampled discriminator is the drained queue cursor pair
    `7E:0053/0054`
  - the `0x38 -> 0x48` change is cursor movement with `read == write`, not
    growth in active queued descriptors

## Late-Phase Cursor Follow-Up

- A mirrored bank rerun against `80:` bank-0 queue helpers plus `81:/82:`
  producer candidates stayed negative for exec hits:
  - `tools/out/track1_b_hold_queue_cursor_trace_0086_0108_v2/td2_boot_probe_trace_summary.json`
  - `exec_hit_count = 0`
  - the only end-of-frame writes still land at scanline `227`:
    - `00:0053 = 0`
    - `00:0055 = 0x84`
    - `00:0056 = 0x17`
- The new scanline-local trace widened the sampled window on frame `86` from
  `224` to `260` scanlines:
  - `tools/out/track1_b_hold_scanline_frame_0086_trace_v2_summary.json`
  - no exec-point hits were recorded there either, including the known
    `02:9016` and `00:8029` callback addresses
  - no tracked cursor writes appear during visible scanlines `0..223`
  - the first new late write trio appears at frame `87`, scanline `228`:
    - `00:0055 = 0x90`
    - `00:0056 = 0x15`
    - `00:0053 = 0x38`
  - during that `228` write trio:
    - `00:0054` still reads `0x38`
    - `active_main` still reads `02:9016`
    - sampled scanlines `223`, `224`, `227`, and `259` all keep
      `00:0053/0054/0055/0056 = 0x38/0x38/0x90/0x15`
- Practical read:
  - the late gameplay lane now appears to have at least two phases
  - first, a post-visible write stage still under `02:9016` preserves the
    visible cursor/budget tuple (`0x38/0x38/0x90/0x15`)
  - later, the older boot-probe lane sees the fully reset
    `00:8029` / `0x00/0x00/0x84/0x17` end-of-frame surface

## Frame-Boundary Follow-Up

- The traced scanline capture now records explicit `start`/`end` frame-boundary
  snapshots in addition to per-scanline samples.
- The bounded reruns around frame `86` now narrow the late handoff further:
  - `v3` (`260` samples) records:
    - frame `86 start` at scanline `0`
    - frame `86 end` at scanline `225`
    - both still read `active_main = 02:9016` and
      `00:0053/0054/0055/0056 = 0x38/0x38/0x90/0x15`
  - `v4` (`360` samples) extends past the scanline wrap:
    - `tools/out/track1_b_hold_scanline_frame_0086_trace_v4_summary.json`
    - frame `87 start` at scanline `0` still reads the same
      `02:9016` / `0x38/0x38/0x90/0x15` state
    - the sampled scanline stream wraps at sample `262`
      (`scanline 261 -> 0`) and still does not leave `02:9016`
    - the last sampled point is frame `87`, scanline `97`, still with
      `02:9016` and `00:0053/0054/0055/0056 = 0x38/0x38/0x90/0x15`
- Practical read:
  - the `02:9016 -> 00:8029` handoff does not happen during:
    - frame `86` visible scanlines
    - frame `86 end`
    - frame `87 start`
    - frame `87` scanlines `0..97`
  - the current direct boundary is now later than frame `87`, scanline `97`

## Multi-Frame Boundary Follow-Up

- The same boundary-aware trace has now been widened twice more without changing
  the observed callback/cursor state.
- `v5` (`target_frame = 86`, `620` samples):
  - `tools/out/track1_b_hold_scanline_frame_0086_trace_v5_summary.json`
  - records:
    - frame `86 end`
    - frame `87 start`
    - frame `87 end`
    - frame `88 start`
  - all four frame events still read:
    - `active_main = 02:9016`
    - `00:0053/0054/0055/0056 = 0x38/0x38/0x90/0x15`
  - the same late write trio now repeats on frame `88`, scanline `227`:
    - `00:0053 = 0x38`
    - `00:0055 = 0x90`
    - `00:0056 = 0x15`
  - the last sampled point is frame `88`, scanline `96`, still on
    `02:9016` with the same cursor/budget tuple
- `v1` shifted to `target_frame = 87` with the same `620`-sample window:
  - `tools/out/track1_b_hold_scanline_frame_0087_trace_v1_summary.json`
  - records:
    - frame `87 end`
    - frame `88 start`
    - frame `88 end`
    - frame `89 start`
  - all four of those frame events still read the same
    `02:9016` / `0x38/0x38/0x90/0x15` state
  - the late write trio repeats again on frame `89`, scanline `228`
  - the last sampled point is frame `89`, scanline `96`, still on `02:9016`
    with the same cursor/budget tuple
- Practical read:
  - the late gameplay lane is now proven stable through:
    - frame `86 end`
    - frame `87 start`
    - frame `87 end`
    - frame `88 start`
    - frame `88 end`
    - frame `89 start`
    - frame `89`, scanline `96`
  - the `02:9016 -> 00:8029` handoff is therefore later than frame `89`,
    scanline `96`

## Visible `0054` Producer Follow-Up

- The next shifted trace window (`target_frame = 88`, `620` samples) finally
  records direct `00:0054` writes on the visible gameplay path:
  - `tools/out/track1_b_hold_scanline_frame_0088_trace_v1_summary.json`
  - frame `90`, scanline `30`: `00:0054 = 0x40`
  - frame `90`, scanline `54`: `00:0054 = 0x48`
- Those writes happen under the same visible gameplay callback surface:
  - `active_main = 02:9016`
  - `active_irq = 01:960D`
  - `ppu.mainScreenLayers = 0x17`
- At the same time:
  - `00:0053` remains `0x38`
  - `00:0055/0056` remain `0x90/0x15`
  - the recurring late write trio also continues on frames `89` and `90`
- Practical read:
  - the first direct producer for the visible-phase queue write pointer is now
    observed
  - this explains how the later sampled gameplay lane reaches
    `00:0054 = 0x48` by frame `92`
  - the next open edge is now the paired `00:0053` catch-up plus whatever
    transient budget change comes with it

## Visible `0053` Catch-Up Follow-Up

- The next shifted trace window (`target_frame = 90`, `620` samples) now
  records the equalized gameplay state directly:
  - `tools/out/track1_b_hold_scanline_frame_0090_trace_v1_summary.json`
  - frame `90 end`: `00:0053/0054/0055/0056 = 0x38/0x48/0x90/0x15`
  - frame `91 start`: `00:0053/0054/0055/0056 = 0x48/0x48/0xB8/0x14`
  - frame `91 end`: `00:0053/0054/0055/0056 = 0x48/0x48/0xB8/0x14`
  - frame `92 start`: `00:0053/0054/0055/0056 = 0x48/0x48/0x90/0x15`
- The write burst in that same window is now explicit:
  - frame `90`, scanline `30`: `00:0054 = 0x40`
  - frame `90`, scanline `54`: `00:0054 = 0x48`
  - frame `91`, scanline `228`: `00:0055 = 0x90`, `00:0056 = 0x15`,
    `00:0055 = 0x08`, `00:0056 = 0x15`
  - frame `91`, scanline `229`: `00:0055 = 0xB8`, `00:0056 = 0x14`,
    `00:0053 = 0x48`
  - frame `92`, scanline `227`: `00:0055 = 0x90`, `00:0056 = 0x15`,
    `00:0053 = 0x48`
- A helper-side follow-up against nearby bank-1 sinks stayed negative:
  - `tools/out/track1_b_hold_scanline_frame_0090_trace_v2_summary.json`
  - added write tracing at `7E:1E24/1E26/070C/0718`
  - no helper-side writes were recorded in the same `90..92` window
- Practical read:
  - the visible gameplay lane now has a directly observed equalization path:
    `00:0054` advances on frame `90`, then `00:0053` catches up on frame `91`
  - the closest open edge is now the transient frame-`91` budget tuple
    `00:0055/0056 = 0xB8/0x14` and the frame-`92` reset back to `0x90/0x15`
  - the later `00:8029` collapse still matters, but it is no longer the first
    unexplained boundary

## Isolated `Frame 91` Resume Check

- A resumed single-frame rerun now replays the same late boundary without
  depending on the older widened `target_frame = 90` artifact:
  - `tools/out/track1_b_hold_scanline_frame_0091_trace_v1.json`
- Current reading from that isolated `frame 91` trace:
  - frame `91 start`: `00:0053/0054/0055/0056 = 0x48/0x48/0xB8/0x14`
  - frame `91 end`: the same `0x48/0x48/0xB8/0x14` state still holds under
    `active_main = 02:9016`
  - frame `92 start`: `00:0053/0054/0055/0056 = 0x48/0x48/0x90/0x15`
  - the only traced writes in that rerun are the reset-side writes at
    frame `92`, scanline `227`:
    - `00:0055 = 0x90`
    - `00:0056 = 0x15`
    - `00:0053 = 0x48`
  - no exec hits were recorded at the current candidate trace points:
    - `02:9016`
    - `01:960D`
    - `01:96A0`
    - `01:9825`
    - `01:9868`
    - `00:8029`
- Practical read:
  - the frame-`92` reset is now reproducible in an isolated rerun centered on
    the burst window itself
  - the open edge is therefore narrower than “replay the boundary”:
    it is specifically “find the producer-side path that creates the transient
    `0xB8/0x14` tuple before the already-observed reset”

## Remaining Blocker

- The screenshot-vs-raw split is now better explained:
  - `emu.takeScreenshot()` on this seed is aligned with a visible-phase
    gameplay path that differs from the end-of-frame raw dump surface
  - the old “static raw” reading was real, but it was sampling the wrong phase
    for the screenshot-backed lane
- The `b_hold` screenshot transitions at `92` and `108` are still not explained
  by the currently sampled visible-phase fields:
  - the scanline-sampled `PPU`/callback pattern for `86`, `92`, and `108`
    matches exactly except for the visible-phase queue cursor pair
    `7E:0053/0054` / `00:0053/0054`
    (`0x38/0x38` at frame `86`, `0x48/0x48` at `92/108`)
  - the bank-1 producer-side WRAM/window/OAM fields added in `v2` also match
    exactly across the same three frames
  - `cpu.d = 0` rules out a hidden direct-page base change in `v3`
  - `v5` shows that the active visible queue window is already empty, so the
    unexplained edge is now the cursor lifecycle rather than queue payload
  - the widened late-phase traces now show three separate boundaries:
    - scanline-local `260`-sample capture still holds
      `00:0053/0054/0055/0056 = 0x38/0x38/0x90/0x15` through scanline `259`
      and only records a matching `0053/0055/0056` write trio at scanline `228`
    - frame-boundary `v4` follow-up now proves the same state survives across
      frame `86 end`, frame `87 start`, and frame `87` scanline wrap into at
      least frame `87`, scanline `97`
    - multi-frame `v5`/shifted-`87` follow-ups now prove that same state also
      survives frame `87 end`, frame `88 start`, frame `88 end`, frame `89`
      start, and at least frame `89`, scanline `96`
    - shifted `88` follow-up now records the first direct
      `00:0054 = 0x40 -> 0x48` writes under `02:9016` on frame `90`
    - shifted `90` follow-up now records the next equalized state boundary:
      frame `90 end` still reads `0x38/0x48/0x90/0x15`, but frame `91`
      starts and ends at `0x48/0x48/0xB8/0x14`, then frame `92 start`
      returns to `0x48/0x48/0x90/0x15`
    - helper-side write tracing at `7E:1E24/1E26/070C/0718` stays negative
      across that same `90..92` window
    - the end-of-frame boot-probe lane still collapses later to
      `00:0053 = 0`, `00:0055 = 0x84`, and `00:0056 = 0x17` at scanline `227`
      under `active_main = 00:8029`

## Practical Reading

- Lane 3 no longer needs to treat `game_11.mss` as a simple “bad raw dump”
  seed; it has a real visible gameplay path under `02:9016`.
- The next best debugger step is not another flat raw dump:
  - trace the producer/reset path behind the frame-`91`
    `00:0053/0055/0056` burst that turns
    `00:0053/0054/0055/0056 = 0x38/0x48/0x90/0x15` into
    `0x48/0x48/0xB8/0x14`, then back to `0x48/0x48/0x90/0x15`
  - after that, return to the later `00:8029` / `0x00/0x00/0x84/0x17`
    end-of-frame collapse
  - after that, prefer sprite/color-math/OAM or other producer-side state over
    more end-of-frame `VRAM/CGRAM/OAM` repeats
