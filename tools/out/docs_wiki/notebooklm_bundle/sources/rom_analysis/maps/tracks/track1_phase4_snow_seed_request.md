# Track 1 Phase 4 Snow Seed Request

- Intake date: `2026-03-28`
- Scope:
  - close the current boundary between reusable menu automation and the later
    snow corridor seen in the longplay
- Related anchor docs:
  - `rom_analysis/maps/tracks/track1_longplay_hard_phase_anchors.md`
  - `rom_analysis/maps/tracks/track1_longplay_snow_anchors.md`
- Related probe artifacts:
  - `tools/out/lane3_phase4_snow_seed_request_summary.json`
  - `tools/out/lane3_phase4_snow_seed_request_summary.md`

## What Was Run

- early `01:BAB3` right-pulse guess:
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=180 python3 tools/run_lane3_gameplay_entry.py tools/out/lane3_track_east_probe_guess --mode probe --menu-windows '1200:a;1250-1255:right;1260-1265:right;1280:a;1505-1510:a;1640-1645:a;1730-1735:a' --probe-total-frames 2600`
- early `01:BAB3` down-pulse guess:
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=180 python3 tools/run_lane3_gameplay_entry.py tools/out/lane3_track_east_down_probe_guess --mode probe --menu-windows '1200:a;1250-1255:down;1260-1265:down;1280:a;1505-1510:a;1640-1645:a;1730-1735:a' --probe-total-frames 2600`
- later `01:BE43` down-pulse guess:
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=210 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/lane3_track_be43_down_guess/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=3200 TD2_BOOT_PROBE_TRACE_START_FRAME=1450 TD2_BOOT_PROBE_TRACE_END_FRAME=2600 TD2_BOOT_PROBE_TRACE_EXEC_POINTS='c20b=01:C20B,c1d2=01:C1D2,be43=01:BE43,be76=01:BE76,b87=01:8B87,902d=01:902D,9111=01:9111,9016=02:9016' TD2_BOOT_PROBE_EXEC_POINT_MAX_HITS=768 TD2_BOOT_PROBE_INPUT_WINDOWS='1200:start;1280:start;1505-1510:start' TD2_BOOT_PROBE_TRIGGER_INPUT_WINDOWS='be43+1-6:down;be43+17-22:start' ./validation/run_mesen_probe_boot.sh ./game.smc`

## Closed Read

- the user boundary is correct:
  without real driving or a preserved later savestate, the current autonomous
  menu-entry lane is not a credible path to the phase-4 snow corridor
- the bounded menu probes did still close one useful low-level detail:
  - `right` in the early menu corridor samples as `state_0960 = 0x0100`
  - `down` in the early menu corridor samples as `state_0960 = 0x0400`
  - this matches the already known `right+down = 0x0500` pulse from the
    no-opponent corridor
- but those same probes do **not** close a usable snow route:
  - early `01:BAB3` `right` pulses never move `selector_1c7c` off `0` and do
    not even preserve the normal gameplay handoff
  - early `01:BAB3` `down` pulses still keep `selector_1c7c = 0` all the way
    into the ordinary `02:9016` Desert Blast corridor
  - a later `be43+1-6:down` guess without the earlier organic selector steps
    does not even reach `01:BE43`; it stalls in the `01:C1D2` family instead
- practical reading:
  - the current menu automation is still useful for early/default gameplay and
    for front-end narrowing
  - it is **not** yet a trustworthy way to reach phase 4 snow before a
    game-over boundary

## Requested Human Artifacts

If the goal is snow archaeology instead of menu archaeology, the next good
input is preserved savestates rather than a longer autonomous replay.

Suggested files under `manual_artifacts/lane3/`:

- `lane3_phase4_snow_onset.mss`
  - first clearly snowy driving frame
- `lane3_phase4_snow_curve.mss`
  - later snowy curve / mountain-horizon frame
- `lane3_phase4_snow_log_truck.mss`
  - later snowy corridor with the log truck ahead

Optional but useful:

- `lane3_phase4_snow_video.avi`
  - `5..10` seconds from the onset seed if capture is easy
- `lane3_phase4_snow_notes.txt`
  - track/car/opponent choice
  - whether this is already phase 4 or a later checkpoint
  - whether police or special traffic is present

## Next Best Step

- do **not** spend more local effort trying to drive from the default menu
  corridor all the way to snow
- wait for one or more preserved snow-adjacent savestates, then resume with:
  - savestate-backed native extraction
  - trusted `BG1/BG2/BG3/OBJ` review
  - immediate gameplay handoff documentation for the next agent
