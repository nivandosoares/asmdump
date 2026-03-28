# Track 1 Live-Race Manual Seed Intake

- Intake date: `2026-03-27`
- Source Mesen slots:
  - `~/.config/Mesen2/SaveStates/game_1.mss`
  - `~/.config/Mesen2/SaveStates/game_3.mss`
- Preserved repo copies:
  - `manual_artifacts/lane3/lane3_live_race_mid.mss`
  - `manual_artifacts/lane3/lane3_live_race_plus30f.mss`
  - extra preserved slot:
    `manual_artifacts/lane3/lane3_live_race_slot2_extra.mss`

## User-Supplied Visual Context

- both states show the `Porsche` cockpit in motion
- the course is the first `Desert Blast` segment
- the car is approaching a green NPC traffic car
- slot `#1` is the first requested state
- slot `#3` is the second requested state from the same visible sequence

## User-Supplied Navigation And Control Note

- raw follow-up note:
  - `manual_artifacts/lane3/responses.txt`
- practical route back to `live_race_mid`:
  - keep choosing the first option in each menu until gameplay, or keep
    pressing `A`
  - menu semantics:
    - `A` advances
    - `B` returns to the previous option screen
- gameplay essentials:
  - `A` accelerates
  - `B` reduces speed
  - d-pad steers

## Preserved Hashes

- `lane3_live_race_mid.mss`
  - `64789efaaeff890f4e42e35e2c529e17b6c42269842203db35eb492aebf1dd0a`
- `lane3_live_race_plus30f.mss`
  - `cf8b7bae867a83ceb3b0ba43abfb19ce25d7edcc507cc581bd3706ed9dc12076`
- `lane3_live_race_slot2_extra.mss`
  - `f2ce9ae98cf0a4563e51adcb9ddcaf0a971c3d55a0e904970483e166c754aec8`

## What Was Run

- preservation:
  - copied `game_1.mss`, `game_2.mss`, `game_3.mss` into
    `manual_artifacts/lane3/`
- short seeded probes:
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=90 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/lane3_live_race_mid_probe/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=12 TD2_BOOT_PROBE_SCREENSHOT_FRAME=0 ./validation/run_mesen_probe_boot.sh ./game.smc ./manual_artifacts/lane3/lane3_live_race_mid.mss`
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=90 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/lane3_live_race_plus30f_probe/td2_boot_probe TD2_BOOT_PROBE_TOTAL_FRAMES=12 TD2_BOOT_PROBE_SCREENSHOT_FRAME=0 ./validation/run_mesen_probe_boot.sh ./game.smc ./manual_artifacts/lane3/lane3_live_race_plus30f.mss`
- bounded compare:
  - `python3 tools/compare_boot_probe_windows.py tools/out/lane3_live_race_mid_probe/td2_boot_probe.json tools/out/lane3_live_race_plus30f_probe/td2_boot_probe.json tools/out/lane3_live_race_mid_vs_plus30f_probe_compare.json --markdown-out tools/out/lane3_live_race_mid_vs_plus30f_probe_compare.md --label-a live_race_mid --label-b live_race_plus30f --start-frame 0 --end-frame 11 --fields state_0960,state_09a2,state_09a8,state_11f3,dp_0053,dp_0054,dp_0020,dp_0022,state_1c6a,state_1c70,state_1c76,state_0202,active_main_callback_bank,active_main_callback_addr,active_irq_callback_bank,active_irq_callback_addr,active_nmi_callback_bank,active_nmi_callback_addr`
- slot-`#2` boundary recheck:
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=90 TD2_BG_RANGE_START_FRAME=0 TD2_BG_RANGE_END_FRAME=0 TD2_BG_RANGE_STEP=1 TD2_BG_RANGE_DUMP_OAM=1 TD2_BG_RANGE_OUTPUT_PREFIX=tools/out/lane3_live_race_slot2_bg0_silent ./validation/run_mesen_dump_bg_range.sh ./game.smc manual_artifacts/lane3/lane3_live_race_slot2_extra.mss > tools/out/lane3_live_race_slot2_bg0_silent.log 2>&1`
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=90 TD2_SCANLINE_TEST_TARGET_FRAME=0 TD2_SCANLINE_TEST_MAX_SAMPLES=16 TD2_SCANLINE_TEST_OUTPUT_PREFIX=tools/out/lane3_live_race_slot2_scanline0 ./validation/run_mesen_capture.sh ./game.smc ./validation/mesen_scanline_step_test.lua manual_artifacts/lane3/lane3_live_race_slot2_extra.mss > tools/out/lane3_live_race_slot2_scanline0.log 2>&1`
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=90 TD2_BOOT_PROBE_TOTAL_FRAMES=8 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/lane3_live_race_slot2_probe ./validation/run_mesen_probe_boot.sh ./game.smc manual_artifacts/lane3/lane3_live_race_slot2_extra.mss > tools/out/lane3_live_race_slot2_probe.log 2>&1`
  - `python3 tools/compare_boot_probe_windows.py tools/out/lane3_live_race_slot2_probe.json tools/out/lane3_live_race_mid_probe/td2_boot_probe.json tools/out/lane3_live_race_slot2_vs_mid_probe_compare.json --markdown-out tools/out/lane3_live_race_slot2_vs_mid_probe_compare.md --label-a slot2_extra --label-b live_race_mid --start-frame 0 --end-frame 7 --fields state_0960,state_09a2,state_09a8,state_11f3,dp_0053,dp_0054,dp_0020,dp_0022,state_1c6a,state_1c70,state_1c76,state_0202,active_main_callback_bank,active_main_callback_addr,active_irq_callback_bank,active_irq_callback_addr,active_nmi_callback_bank,active_nmi_callback_addr,oam_0730`
- negative screenshot-path check:
  - short `mesen_capture.lua` reruns from both seeds (`8` frames, no input)
  - both capture directories were created, but all emitted PNG files were
    zero-byte files

## Artifacts

- `manual_artifacts/lane3/lane3_live_race_mid.mss`
- `manual_artifacts/lane3/lane3_live_race_plus30f.mss`
- `manual_artifacts/lane3/lane3_live_race_slot2_extra.mss`
- `manual_artifacts/lane3/lane3_live_race_notes.txt`
- `manual_artifacts/lane3/responses.txt`
- `tools/out/lane3_live_race_mid_probe/td2_boot_probe.json`
- `tools/out/lane3_live_race_plus30f_probe/td2_boot_probe.json`
- `tools/out/lane3_live_race_mid_vs_plus30f_probe_compare.json`
- `tools/out/lane3_live_race_mid_vs_plus30f_probe_compare.md`
- `tools/out/lane3_live_race_slot2_boundary_summary.json`
- `tools/out/lane3_live_race_slot2_boundary_summary.md`
- `tools/out/lane3_live_race_slot2_vs_mid_probe_compare.json`
- `tools/out/lane3_live_race_slot2_vs_mid_probe_compare.md`

## Current Reading

- both primary manual states still load onto the same callback surface used by
  the already-known post-`02:9016` corridor:
  - `active_main = 02:9016`
  - `active_irq = 01:96A0`
  - `active_nmi = 02:8F3C`
- both also still inherit the old selector family at frame `0`:
  - `$1C6A = 1`
  - `$1C70 = 0`
  - `$1C76 = 1`
  - `$0202 = 0xFFFF`
- despite sharing that callback/selector surface, the pair is not a duplicate:
  - stable all-frame differences over frames `0..11`:
    - `dp_0053`
    - `dp_0054`
    - `state_09a2`
    - `state_11f3`
  - strongest stable split:
    - `live_race_mid`: `state_11f3 = 477..479`,
      `dp_0053/0054 = 120..200`
    - `live_race_plus30f`: `state_11f3 = 627..629`,
      `dp_0053/0054 = 40..64`
  - intermittent split:
    - `state_09a8` differs on `4/12` frames
    - `state_0960` differs only on frame `0` (`128 -> 0`)
- both seeds are internally dynamic even without new input:
  - `live_race_mid` cycles through multiple `dp_0053/0054`, `state_09a2`,
    `state_09a8`, and `state_11f3` values inside the `12`-frame window
  - `live_race_plus30f` also advances `dp_0053/0054`, `dp_0020/0022`,
    `state_09a2`, `state_09a8`, and `state_11f3`
- practical implication:
  - the repo now has preserved manual seeds that the user identifies as live
    Desert Blast gameplay imagery
  - but the code-facing state still resembles the same `02:9016` family that
    earlier looked menu-derived or front-end-bound in older no-input corridors
  - the newer fit is that those older corridors likely crossed short
    attract/demo gameplay slices and were over-interpreted as a clean
    menu-vs-gameplay boundary
  - the real lane-3 question is now sharper: why can visually live-race seeds
    still present as `02:9016` with the inherited selector block?
- the preserved slot `#2` is no longer usefully "unclassified":
  - its direct recheck now keeps `main/irq/nmi = 00:8029 / 00:835F / 00:8029`
  - its frame-`0` visible stack is `BG3`-only, not `BG1 + BG2 + OBJ`
  - practical read:
    `lane3_live_race_slot2_extra.mss` is an adjacent boundary seed, not a
    substitute for the primary live-race pair

## Human Follow-Up Read (`2026-03-28`)

- the raw response note now gives a first filled visual read for
  `ESTADO 1` / `live_race_mid`:
  - the green NPC traffic car is near, with its rear visible on the player's
    right
  - the wheel still reads as straight
  - the road is straight with the yellow divider centered
  - the cockpit base still reads as `Porsche 959`
  - the human layer guess keeps the road/world surface on `layer2`
  - dynamic objects called out explicitly:
    roadside vegetation, the green traffic car, and the speed / RPM / gear
    indicators
  - a radar/rival marker is visibly active
  - the first motion is easiest to notice in the white lane stripes plus the
    lateral roadside/dynamic objects
- the same response note also confirms that `slot2_extra` still looks like
  intro/credits, which matches the current boundary/control reading
- the short local clip summarized in that same response extends
  `live_race_mid` from the preserved start state to the checkpoint/post stop:
  - gas-station dialog appears there, followed by the player's partial-results
    screen and then the next checkpoint start
  - the clip also highlights curves, elevations/depressions in the road,
    insects hitting the windshield, and a late police arrival with siren plus
    a third radar marker

## Negative Result

- the current headless screenshot path is not reliable on these manual seeds:
  - `td2_boot_probe_frame.png` was emitted as a zero-byte file on both runs
  - `mesen_capture.lua` also emitted zero-byte `capture_frame_*.png` files
- do not spend time interpreting those PNGs; use the JSON/state side first or
  pivot to the lab backend if actual image export becomes necessary

## Next Best Step

- treat `lane3_live_race_mid.mss` and `lane3_live_race_plus30f.mss` as the new
  active Lane 3 seed pair
- do not substitute `lane3_live_race_slot2_extra.mss` for the missing second
  visual replicate; it is now a closed boundary/control seed
- compare their producer-side/OAM/HUD state against the older power-on
  `02:9016` corridor
- specifically trace what `state_11f3`, `dp_0053`, `dp_0054`, `state_09a2`,
  and `state_09a8` mean in these visually live-race seeds
