# Lane 3 Handoff After Default-Rival Late `A/B` Narrowing

This note is the explicit resume point for the next agent on Lane 3.

## Read First

- `rom_analysis/docs/next_steps_roadmap.md`
- `rom_analysis/docs/progress_checkpoints.md`
- `rom_analysis/docs/snes_runtime_algorithm_human.md`
- `rom_analysis/docs/lane3_attract_demo_boundary.md`
- `rom_analysis/docs/lane3_visual_annotation_template.md`
- `tools/out/game11_seed_surface_audit/game11_seed_surface_audit.md`
- `rom_analysis/maps/tracks/track1_seed_sweep_v3_ab_compare.md`
- `rom_analysis/maps/tracks/track1_b_hold_scanline_recheck_0090_0093_current_seed.md`
- `rom_analysis/maps/tracks/track1_live_race_manual_seed_intake.md`
- `rom_analysis/maps/tracks/track1_live_race_vs_post9016_control.md`
- `rom_analysis/maps/tracks/track1_02_9016_state_ownership.md`
- `rom_analysis/maps/tracks/track1_live_race_visible_layer_stack.md`
- `rom_analysis/maps/tracks/track1_live_race_bg2_producer_path.md`
- `rom_analysis/maps/tracks/track1_live_race_plus30f_lab_backend_boundary.md`
- `rom_analysis/docs/lane3_today_work_brief.md`
- `rom_analysis/docs/lane3_visual_annotation_template.md`
- `manual_artifacts/lane3/lane3_live_race_notes.txt`
- `tools/out/lane3_live_race_mid_bg2_producer_summary.md`
- `tools/out/lane3_live_race_slot2_boundary_summary.md`
- `tools/out/lane3_live_race_slot2_vs_mid_probe_compare.md`
- `tools/out/post9016_default_rival_probe_none_vs_a_compare.md`
- `tools/out/post9016_default_rival_probe_none_vs_b_compare.md`
- `tools/out/post9016_default_rival_a2050_sequence_compare.md`
- `tools/out/post9016_default_rival_b2050_sequence_compare.md`

## Closed State

- do **not** treat `.mesen-config/Mesen2/SaveStates/game_11.mss` as a verified
  gameplay seed
  - the audit in `tools/out/game11_seed_surface_audit/` closes it as
    `front_end_menu_seed`
  - no-input frames `0..7` stay on:
    - `active_main = 02:9016`
    - `active_irq = 01:96A0`
    - `$1C6A = 1`
    - `$1C70 = 0`
    - `$1C76 = 1`
    - `$0202 = 0xFFFF`
  - the same seed can pass through cockpit-like presentation imagery and still
    fall back into the top-level signboard family
  - a fresh current-seed recheck now also closes the old `90..92` confusion:
    - `rom_analysis/maps/tracks/track1_b_hold_scanline_recheck_0090_0093_current_seed.md`
    - the current savestate fingerprint is now
      `516b217fe396e68d3c7149f13a6b156cd514ca2929172518a0d27654555f853e`,
      not the older `17f2857d3309ad99fc87724d131f9b1e7965c1fb5a530f739dedda9f51086b14`
      recorded in `track1_seed_sweep_v3_ab_compare`
    - fresh `target_frame=90/91` scanline reruns no longer reproduce the old
      `v2_current` queue-cursor equalization
    - those reruns stay flat on `00:8029 / 00:835F` with
      `dp_0053/0054/0055/0056 = 0x30/0x30/0x28/0x12` and `0` write hits
- the repo now has a preserved manual live-race seed pair:
  - `manual_artifacts/lane3/lane3_live_race_mid.mss`
    - source slot: `~/.config/Mesen2/SaveStates/game_1.mss`
    - SHA-256:
      `64789efaaeff890f4e42e35e2c529e17b6c42269842203db35eb492aebf1dd0a`
  - `manual_artifacts/lane3/lane3_live_race_plus30f.mss`
    - source slot: `~/.config/Mesen2/SaveStates/game_3.mss`
    - SHA-256:
      `cf8b7bae867a83ceb3b0ba43abfb19ce25d7edcc507cc581bd3706ed9dc12076`
  - preserved extra slot:
    - `manual_artifacts/lane3/lane3_live_race_slot2_extra.mss`
  - slot `#2` is no longer an open backup:
    - bounded follow-up now closes it as an adjacent boundary seed
    - short probe surface:
      `main/irq/nmi = 00:8029 / 00:835F / 00:8029`
    - frame-`0` visible stack:
      `bgMode = 1`, `mainLayers = 0x04`, visible `BG3` only
    - do not use it as a replacement for `live_race_plus30f`
  - user-supplied visual context:
    - `Porsche` cockpit in motion
    - first `Desert Blast` segment
    - approaching a green NPC traffic car
  - follow-up human support note:
    - `manual_artifacts/lane3/responses.txt`
    - practical route back to `live_race_mid`:
      keep taking the first menu option / keep pressing `A` until gameplay
    - menu semantics:
      - `A` advances
      - `B` returns to the previous option screen
    - gameplay essentials:
      - `A` accelerates
      - `B` reduces speed
      - d-pad steers
    - `slot2_extra` is also described there as still intro/credits
  - preserved manual video follow-up:
    - `manual_artifacts/lane3/lane3_live_race_video.avi`
    - `rom_analysis/maps/tracks/track1_live_race_manual_video_intake.md`
    - derived stills under `manual_artifacts/lane3/Screenshots/`
    - current measured metadata:
      - `43.861101s`
      - `256x224`
      - about `60.10 fps`
      - `2636` reported video frames
    - stronger continuity read now preserved in stills:
      - opening `live_race_mid` road / cockpit / radar / green-car surface
      - stop-sign and gas-station/post continuity before the checkpoint pause
      - a late resumed-driving frame with an extra colored radar marker,
        matching the earlier police/third-marker human note
  - both manual seeds still load onto:
    - `main = 02:9016`
    - `irq = 01:96A0`
    - `nmi = 02:8F3C`
  - both still inherit:
    - `$1C6A = 1`
    - `$1C70 = 0`
    - `$1C76 = 1`
    - `$0202 = 0xFFFF`
  - but the pair is not a duplicate:
    - `state_11f3` stays around `477..479` on `live_race_mid`
    - `state_11f3` stays around `627..629` on `live_race_plus30f`
    - `dp_0053/0054` stay around `120..200` on `live_race_mid`
    - `dp_0053/0054` stay around `40..64` on `live_race_plus30f`
  - current tooling caveat:
    - headless `td2_boot_probe_frame.png` and `mesen_capture.lua` PNG output
      from these seeds is currently zero-byte; trust the JSON/state side first
  - new backend-boundary caveat on `live_race_plus30f`:
    - current absolute start frame is now anchored as `17495`
    - current measured delta from `live_race_mid` (`16655`) is `840`, so the
      filename `plus30f` is historical only
    - current `labRunner` export attempts fail during frame-boundary
      correction on that seed
- the older deterministic power-on candidate is still relevant as the fallback
  comparison corridor:
  - base route:
    `1200:start;1280:start;1505-1510:start;1584-1589:right,down;1640-1645:start;1730-1735:start`
  - this still lands on the same callback surface through `2048..2208`:
    - `main = 02:9016`
    - `irq = 01:96A0`
    - `nmi = 02:8F3C`
  - inherited selector family also still stays latched:
    - `$1C6A = 1`
    - `$1C70 = 0`
    - `$1C76 = 1`
    - `$0202 = 0xFFFF`
- late `A/B` injection into that corridor is now proven to matter:
  - `A` lane:
    - input windows:
      `1200:start;1280:start;1505-1510:start;1584-1589:right,down;1640-1645:start;1730-1735:start;2050-2208:a`
    - first probe divergence:
      - `state_0960`: frame `2050`, `0 -> 128`
    - later probe divergence:
      - `dp_0054`: frame `2052`
      - `dp_0053`: frame `2053`
      - `state_09a8`: frame `2053`
      - `state_137c`: frame `2104`
      - `state_09a2`: frame `2125`
    - first post-input visible divergence against no-input:
      - frame `2052`
      - bbox `[17, 13, 193, 17]`
    - later visible divergence:
      - starts at frame `2054`
      - lower dashboard bbox around `[72..88, 155..174]`
  - `B` lane:
    - input windows:
      `1200:start;1280:start;1505-1510:start;1584-1589:right,down;1640-1645:start;1730-1735:start;2050-2208:b`
    - first probe divergence:
      - `state_0960`: frame `2050`, `0 -> 32768`
    - otherwise almost empty as a state lane
    - visible divergence is sparse:
      - `2052`
      - `2068`
      - `2084`
- practical read:
  - this corridor is no longer “the same frame repeated forever”
  - but it is also not yet a closed gameplay seed by itself
  - the better current read is that older power-on/no-input-style lanes can
    cross short attract/demo gameplay slices while still preserving the same
    inherited selector block
  - that means a missing long gameplay segment after injected input is not
    strong evidence that the lane was "never gameplay"; the input may simply
    have cut a short demo slice before it developed further

## Do Not Repeat

- do not reopen `game_11.mss` as if it were a gameplay seed
- do not re-run wide `A/B` sweeps on `game_11.mss` and call the result gameplay
- do not ask for the same manual live-race saves again
  - slots `#1/#3` are already preserved inside `manual_artifacts/lane3/`
- do not ask for or spend more local effort on the archived `90..92`
  queue-cursor equalization against the current `game_11.mss`
  - the fresh current-seed reruns are static and no longer hit the old write
    burst
- do not spend more CPU on full-length parallel `mesen_capture.lua` runs from
  power-on when a `mesen_probe_boot.lua` compare can falsify the same question
  more cheaply
- do not keep assuming that more passive power-on runtime will reveal a long
  uninterrupted gameplay session
  - the stronger current fit is that these corridors can include short
    attract/demo slices that are easy to clip with scripted input
- do not treat frame `2048` as the first useful late-input delta in this lane
  - it is still contaminated by the already-closed top-right rival blink
  - the first useful post-input frame is `2052`
- do not collapse `A` and `B` back into one lane
  - `A` is the rich proving lane
  - `B` is the clean control lane
- do not trust the zero-byte PNG outputs from the first manual-seed audit as
  visual evidence
  - if image export is needed, pivot to the lab backend or fix the screenshot
    path first
- do not keep repeating blind `labRunner` frame guesses on `live_race_plus30f`
  without using the now-known absolute start frame `17495`

## Exact Artifacts To Trust

- `tools/out/game11_seed_surface_audit/game11_seed_surface_audit.json`
- `tools/out/game11_seed_surface_audit/game11_seed_surface_audit.md`
- `tools/out/post9016_default_rival_probe_none/td2_boot_probe.json`
- `tools/out/post9016_default_rival_probe_a/td2_boot_probe.json`
- `tools/out/post9016_default_rival_probe_b/td2_boot_probe.json`
- `tools/out/post9016_default_rival_probe_none_vs_a_compare.json`
- `tools/out/post9016_default_rival_probe_none_vs_a_compare.md`
- `tools/out/post9016_default_rival_probe_none_vs_b_compare.json`
- `tools/out/post9016_default_rival_probe_none_vs_b_compare.md`
- `tools/out/post9016_default_rival_a2050_sequence_compare.json`
- `tools/out/post9016_default_rival_a2050_sequence_compare.md`
- `tools/out/post9016_default_rival_b2050_sequence_compare.json`
- `tools/out/post9016_default_rival_b2050_sequence_compare.md`
- `tools/out/post9016_default_rival_noinput_frame_02052.png`
- `tools/out/post9016_default_rival_a_frame_02052.png`
- `tools/out/post9016_default_rival_noinput_frame_02056.png`
- `tools/out/post9016_default_rival_a_frame_02056.png`
- `manual_artifacts/lane3/lane3_live_race_mid.mss`
- `manual_artifacts/lane3/lane3_live_race_plus30f.mss`
- `manual_artifacts/lane3/lane3_live_race_notes.txt`
- `manual_artifacts/lane3/responses.txt`
- `tools/out/lane3_live_race_mid_probe/td2_boot_probe.json`
- `tools/out/lane3_live_race_plus30f_probe/td2_boot_probe.json`
- `tools/out/lane3_live_race_mid_vs_plus30f_probe_compare.json`
- `tools/out/lane3_live_race_mid_vs_plus30f_probe_compare.md`
- `tools/out/lane3_live_race_mid_vs_post9016_default_rival_probe_compare.json`
- `tools/out/lane3_live_race_mid_vs_post9016_default_rival_probe_compare.md`
- `tools/out/lane3_live_race_plus30f_vs_post9016_default_rival_probe_compare.json`
- `tools/out/lane3_live_race_plus30f_vs_post9016_default_rival_probe_compare.md`
- `tools/out/lane3_live_race_slot2_boundary_summary.json`
- `tools/out/lane3_live_race_slot2_boundary_summary.md`
- `tools/out/lane3_live_race_slot2_vs_mid_probe_compare.json`
- `tools/out/lane3_live_race_slot2_vs_mid_probe_compare.md`
- `tools/out/lane3_live_race_mid_bg2_producer_summary.json`
- `tools/out/lane3_live_race_mid_bg2_producer_summary.md`
- `rom_analysis/maps/tracks/track1_live_race_plus30f_lab_backend_boundary.md`
- `rom_analysis/docs/lane3_today_work_brief.md`
- `rom_analysis/maps/tracks/track1_live_race_manual_seed_intake.md`
- `rom_analysis/maps/tracks/track1_live_race_bg2_producer_path.md`
- `rom_analysis/maps/tracks/track1_live_race_vs_post9016_control.md`

## Repo Caveat

- the worktree may still be dirty from unrelated work on another host
- do not revert or fold unrelated modified files into the next Lane 3
  checkpoint
- stage only the lane-3 handoff target and its direct artifacts

## Next Gate

Use the preserved manual live-race seed pair plus the aligned control compare
to explain which substate fields separate live-race imagery from the older
power-on `02:9016` corridor.

The first separator is no longer open:

- both manual seeds already differ immediately from the aligned control on
  `oam_0730`, `state_11f3`, `dp_0053`, `dp_0054`, `dp_0020`, `dp_0022`, and
  `state_09a2`

The first semantic ownership pass is now also closed:

- `state_11f3 -> oam_0730` is a rival-only HUD/OAM path
- `state_09a2` is an OAM staging cursor / sprite count
- `state_09a8` is a builder-side OAM allocator control value
- `dp_0053/dp_0054` behave as DMA-ring read/write cursors
- `dp_0020/dp_0022` remain useful, but currently look like transient
  builder scratch rather than durable gameplay state

The first visible layer-stack pass is now also narrowed on a real manual seed:

- confirmed `live_race_mid` frame `0` samples as `bgMode = 1`
- visible main-screen stack on that sample is `BG1 + BG2 + OBJ`
- `BG1` stays scroll-stable across sampled visible scanlines
- `BG2` changes per scanline and is now the strongest road/world raster-layer
  candidate
- `BG3` exists in raw state but is not enabled on the visible screen in that
  sample
- code-side fit is now stronger:
  - `01:9111 -> 01:9185 -> 02:9165` is the active gameplay family path
  - `02:9165` runs `L01340E`, `L013927`, `L012F48`, `L01318D`, `L01070A`,
    and `L0108EF` before the OAM flush
  - `bank2.asm` `2628..2644` arms HDMA channel `7` against the `BG2` scroll
    register block, and `bank1.asm` `5846..5851` writes `BG2VOFS` from `$22/$23`
- the same raw helper wrappers still fail on `live_race_plus30f`, so the
  second-seed replication remains open
- the preserved `slot2_extra` is now explicitly **not** that second replicate:
  - it stays on `00:8029 / 00:835F / 00:8029`
  - it is a useful boundary/control seed, not gameplay evidence

The question is now narrower:

- the first producer-side answer is now closed on `live_race_mid`:
  - the confirmed frame repeatedly rewrites `$22/$23`
  - `bank1.asm` `5846..5851` then writes `BG2VOFS` directly from that pair
  - `next_irq_ptr` flips `01:960D <-> 01:96A0` at scanlines `24` and `121`
  - `TMAIN` temporarily rises to `0x17` at scanline `23` and returns to
    `0x13` at scanline `121`
  - `BG2HOFS/BG2VOFS` are the only heavily rewritten visible layer registers
    in the bounded PPU trace; `BG1` and `BG3` only move at the split edges
- the strongest current producer cluster is now narrowed:
  - inside `L01318D`, especially `02:B042 / 02:B05D / 02:B0B1 / 02:B0BD /
    02:B134`
- the remaining open questions are now semantic rather than structural:
  - which exact member of that cluster is the road-line builder versus support
    cursor math?
  - which owner advances the extra live-race `09A2/09A8/0053/0054` movement
    alongside that `BG2` producer work?
  - can `live_race_plus30f` be recovered through the lab backend as the second
    visual replicate?

## Recommended Next Experiment

1. Start from the preserved manual seeds and the new aligned-control compare,
   not from `game_11.mss`.
2. Keep the known ownership anchors fixed:
   - `bank2.asm` `L0117BA`, `L0108EF`, `L012501`
   - `bank0.asm` `L00158F`, `L0015BD`, `L0015E1`, `L001662`, `L00179B`
3. Treat the remaining open problem as producer attribution, not field naming:
   - `dp_0053/dp_0054` already fit DMA-ring cursor behavior
   - `state_09a2/state_09a8` already fit OAM staging / allocator control
   - `dp_0020/dp_0022` still need path-level attribution
4. Keep the new visible-layer stack result in scope:
   - current confirmed gameplay sample is `BG1 + BG2 + OBJ`
   - `BG2` is the strongest current road/world candidate because its scroll
     changes per scanline
   - `BG3` is not currently proven as a visible gameplay layer
   - `slot2_extra` is now a closed `00:8029` boundary/control seed and should
     not be used as a gameplay replicate
5. Focus on the narrowed `L01318D` cluster first:
   - `02:B042 / 02:B05D / 02:B0B1 / 02:B0BD / 02:B134`
   - keep the `01:960D / 01:96A0 / 01:9809` split scheduler in scope while
     reading those producers
6. If a second visible replicate becomes necessary, use the lab backend on
   `live_race_plus30f` instead of reusing `slot2_extra`, but treat the current
   boundary-correction failure as an active tooling bug rather than as a
   ready-to-run export path.
7. Treat the old power-on no-input `post9016` corridor as the control surface;
   use the `A` lane only if a richer fallback is needed later.
8. Prefer bounded producer/OAM/HUD tracing over more screenshot volume:
   - the current screenshot path is still broken on the manual seeds
9. If another dev is available today, use
   `rom_analysis/docs/lane3_today_work_brief.md` as the working brief rather
   than reconstructing the queue from multiple archaeology notes.
10. If a human needs to re-enter the same gameplay corridor manually, use the
    new route/control note in `manual_artifacts/lane3/responses.txt` instead
    of rediscovering the menu flow from scratch.

## Minimal Validation If Tooling Changes

- `python3 -m py_compile tools/compare_capture_sequences.py`
- `python3 tools/compare_boot_probe_windows.py tools/out/post9016_default_rival_probe_none/td2_boot_probe.json tools/out/post9016_default_rival_probe_a/td2_boot_probe.json tools/out/post9016_default_rival_probe_none_vs_a_compare.json --markdown-out tools/out/post9016_default_rival_probe_none_vs_a_compare.md --label-a no_input --label-b a_hold --start-frame 2048 --end-frame 2208`
- `python3 tools/compare_boot_probe_windows.py tools/out/post9016_default_rival_probe_none/td2_boot_probe.json tools/out/post9016_default_rival_probe_b/td2_boot_probe.json tools/out/post9016_default_rival_probe_none_vs_b_compare.json --markdown-out tools/out/post9016_default_rival_probe_none_vs_b_compare.md --label-a no_input --label-b b_hold --start-frame 2048 --end-frame 2208`
- `python3 tools/compare_capture_sequences.py tools/out/post9016_default_rival_capture_full tools/out/post9016_default_rival_capture_a2050 tools/out/post9016_default_rival_a2050_sequence_compare.json --markdown-out tools/out/post9016_default_rival_a2050_sequence_compare.md --base-label no_input --candidate-label a_hold --script-start-frame 2048`
- `python3 tools/compare_capture_sequences.py tools/out/post9016_default_rival_capture_full tools/out/post9016_default_rival_capture_b2050 tools/out/post9016_default_rival_b2050_sequence_compare.json --markdown-out tools/out/post9016_default_rival_b2050_sequence_compare.md --base-label no_input --candidate-label b_hold --script-start-frame 2048`
- `python3 tools/compare_boot_probe_windows.py tools/out/lane3_live_race_mid_probe/td2_boot_probe.json tools/out/lane3_live_race_plus30f_probe/td2_boot_probe.json tools/out/lane3_live_race_mid_vs_plus30f_probe_compare.json --markdown-out tools/out/lane3_live_race_mid_vs_plus30f_probe_compare.md --label-a live_race_mid --label-b live_race_plus30f --start-frame 0 --end-frame 11 --fields state_0960,state_09a2,state_09a8,state_11f3,dp_0053,dp_0054,dp_0020,dp_0022,state_1c6a,state_1c70,state_1c76,state_0202,active_main_callback_bank,active_main_callback_addr,active_irq_callback_bank,active_irq_callback_addr,active_nmi_callback_bank,active_nmi_callback_addr`

## Checkpoint Trail

- `d13d5d5`: fingerprinted seeded sweep on mutable `game_11.mss`
- `677e863`: audit demotes `game_11.mss` to `front_end_menu_seed`
- `6530de8`: late `A/B` response narrowed on the power-on default-rival corridor
