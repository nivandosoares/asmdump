# Lane 3 Handoff After Default-Rival Late `A/B` Narrowing

This note is the explicit resume point for the next agent on Lane 3.

## Read First

- `rom_analysis/docs/next_steps_roadmap.md`
- `rom_analysis/docs/progress_checkpoints.md`
- `rom_analysis/docs/snes_runtime_algorithm_human.md`
- `tools/out/game11_seed_surface_audit/game11_seed_surface_audit.md`
- `rom_analysis/maps/tracks/track1_seed_sweep_v3_ab_compare.md`
- `rom_analysis/maps/tracks/track1_b_hold_scanline_recheck_0090_0093_current_seed.md`
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
- the best current Lane 3 candidate is now the deterministic power-on
  default-rival corridor after the already-closed front-end route:
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
  - but it is also not yet a closed gameplay seed, because the inherited
    selector family never leaves the old menu-derived state block in the
    current proof window

## Do Not Repeat

- do not reopen `game_11.mss` as if it were a gameplay seed
- do not re-run wide `A/B` sweeps on `game_11.mss` and call the result gameplay
- do not ask for or spend more local effort on the archived `90..92`
  queue-cursor equalization against the current `game_11.mss`
  - the fresh current-seed reruns are static and no longer hit the old write
    burst
- do not spend more CPU on full-length parallel `mesen_capture.lua` runs from
  power-on when a `mesen_probe_boot.lua` compare can falsify the same question
  more cheaply
- do not treat frame `2048` as the first useful late-input delta in this lane
  - it is still contaminated by the already-closed top-right rival blink
  - the first useful post-input frame is `2052`
- do not collapse `A` and `B` back into one lane
  - `A` is the rich proving lane
  - `B` is the clean control lane

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

## Repo Caveat

- the worktree may still be dirty from unrelated work on another host
- do not revert or fold unrelated modified files into the next Lane 3
  checkpoint
- stage only the lane-3 handoff target and its direct artifacts

## Next Gate

Extend the late-`A` default-rival corridor until one of these becomes true:

1. unmistakable world/gameplay motion is visible, or
2. the inherited selector family finally exits the old top-menu values

The question is no longer “does this corridor react at all?”

The question is:

- is this responsive corridor true gameplay or still presentation-state reuse?

## Recommended Next Experiment

1. Keep the same power-on default-rival base route.
2. Extend the late `A` lane farther, but stay bounded:
   - first probe target:
     `2050-2400:a`
   - if that still looks promising, one short capture window centered on the
     first newly interesting frame is enough
3. Keep `B` as the control lane for the same extension window.
4. Prefer probe-first, then capture-second:
   - probe:
     - compare callbacks
     - compare selector family
     - compare `state_0960`, `dp_0053`, `dp_0054`, `state_09a8`,
       `state_09a2`, `state_137c`
   - capture:
     - only once a newly interesting frame or bbox appears
5. If the lane still never exits the inherited selector family, the next
   proving step is not more PNG volume:
   - it is to identify what `02:9016` actually means in this corridor and
     whether the old “menu state” fields are simply not being cleared during a
     real early gameplay phase

## Minimal Validation If Tooling Changes

- `python3 -m py_compile tools/compare_capture_sequences.py`
- `python3 tools/compare_boot_probe_windows.py tools/out/post9016_default_rival_probe_none/td2_boot_probe.json tools/out/post9016_default_rival_probe_a/td2_boot_probe.json tools/out/post9016_default_rival_probe_none_vs_a_compare.json --markdown-out tools/out/post9016_default_rival_probe_none_vs_a_compare.md --label-a no_input --label-b a_hold --start-frame 2048 --end-frame 2208`
- `python3 tools/compare_boot_probe_windows.py tools/out/post9016_default_rival_probe_none/td2_boot_probe.json tools/out/post9016_default_rival_probe_b/td2_boot_probe.json tools/out/post9016_default_rival_probe_none_vs_b_compare.json --markdown-out tools/out/post9016_default_rival_probe_none_vs_b_compare.md --label-a no_input --label-b b_hold --start-frame 2048 --end-frame 2208`
- `python3 tools/compare_capture_sequences.py tools/out/post9016_default_rival_capture_full tools/out/post9016_default_rival_capture_a2050 tools/out/post9016_default_rival_a2050_sequence_compare.json --markdown-out tools/out/post9016_default_rival_a2050_sequence_compare.md --base-label no_input --candidate-label a_hold --script-start-frame 2048`
- `python3 tools/compare_capture_sequences.py tools/out/post9016_default_rival_capture_full tools/out/post9016_default_rival_capture_b2050 tools/out/post9016_default_rival_b2050_sequence_compare.json --markdown-out tools/out/post9016_default_rival_b2050_sequence_compare.md --base-label no_input --candidate-label b_hold --script-start-frame 2048`

## Checkpoint Trail

- `d13d5d5`: fingerprinted seeded sweep on mutable `game_11.mss`
- `677e863`: audit demotes `game_11.mss` to `front_end_menu_seed`
- `6530de8`: late `A/B` response narrowed on the power-on default-rival corridor
