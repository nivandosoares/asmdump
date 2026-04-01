# Track 1 Live-Entry Brake Traffic Pair `3250 -> 3400`

- Note date: `2026-03-28`
- Goal:
  use one bounded live-entry control variant to push past the earlier
  collision-heavy corridor and promote the first traffic-emergence pair that
  stays useful for both machine tracing and designer labeling

## What Was Run

- bounded live-entry review capture with alternating steering:
  - `python3 tools/run_lane3_gameplay_entry.py tools/out/lane3_live_entry_review_wiggle_3600 --mode capture --mesen-release-dir /home/nivando-soares/Mesen2/bin/linux-x64/Release --timeout-seconds 300 --capture-warmup-frames 2050 --capture-frames 3600 --capture-screenshot-every 150 --gameplay-input-windows '0-3599:a;320-520:right;770-970:left;1220-1420:right;1670-1870:left;2120-2320:right;2570-2770:left;3020-3220:right'`
- bounded live-entry review capture with a braking window around the earlier
  crash point:
  - `python3 tools/run_lane3_gameplay_entry.py tools/out/lane3_live_entry_review_brake_3600 --mode capture --mesen-release-dir /home/nivando-soares/Mesen2/bin/linux-x64/Release --timeout-seconds 300 --capture-warmup-frames 2050 --capture-frames 3600 --capture-screenshot-every 150 --gameplay-input-windows '0-899:a;900-1350:b;1351-3599:a'`
- review contact sheets:
  - `ffmpeg -y -pattern_type glob -i 'tools/out/lane3_live_entry_review_wiggle_3600/capture_frame_*.png' -vf 'scale=128:112,tile=5x5:padding=4:margin=4:color=white' -frames:v 1 tools/out/lane3_live_entry_review_wiggle_3600_contact_sheet.png`
  - `ffmpeg -y -pattern_type glob -i 'tools/out/lane3_live_entry_review_brake_3600/capture_frame_*.png' -vf 'scale=128:112,tile=5x4:padding=4:margin=4:color=white' -frames:v 1 tools/out/lane3_live_entry_review_brake_3600_contact_sheet.png`
- probe surface for the braking variant:
  - `python3 tools/run_lane3_gameplay_entry.py tools/out/lane3_live_entry_brake_probe_v1 --mode probe --mesen-release-dir /home/nivando-soares/Mesen2/bin/linux-x64/Release --timeout-seconds 240 --probe-total-frames 4800 --gameplay-input-windows '0-899:a;900-1350:b;1351-3599:a'`
- exact raw dumps for the promoted pair:
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=240 TD2_BG_RANGE_START_FRAME=3250 TD2_BG_RANGE_END_FRAME=3250 TD2_BG_RANGE_STEP=1 TD2_BG_RANGE_DUMP_OAM=1 TD2_BG_RANGE_DUMP_SCREENSHOTS=1 TD2_BG_RANGE_INPUT_WINDOWS='1200:a;1280:a;1505-1510:a;1640-1645:a;1730-1735:a;2050-2949:a;2950-3400:b;3401-5649:a' TD2_BG_RANGE_OUTPUT_PREFIX=tools/out/lane3_live_entry_brake_frame03250 ./validation/run_mesen_dump_bg_range.sh ./game.smc`
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=240 TD2_BG_RANGE_START_FRAME=3400 TD2_BG_RANGE_END_FRAME=3400 TD2_BG_RANGE_STEP=1 TD2_BG_RANGE_DUMP_OAM=1 TD2_BG_RANGE_DUMP_SCREENSHOTS=1 TD2_BG_RANGE_INPUT_WINDOWS='1200:a;1280:a;1505-1510:a;1640-1645:a;1730-1735:a;2050-2949:a;2950-3400:b;3401-5649:a' TD2_BG_RANGE_OUTPUT_PREFIX=tools/out/lane3_live_entry_brake_frame03400 ./validation/run_mesen_dump_bg_range.sh ./game.smc`
- bundle materialization with designer-facing `PNG` previews plus
  screenshot-derived world/background support surfaces:
  - `python3 tools/build_gameplay_frame_bundle.py --label lane3_live_entry_brake_traffic_frame03250 --frame 3250 --vram tools/out/lane3_live_entry_brake_frame03250_frame_03250_vram.bin --cgram tools/out/lane3_live_entry_brake_frame03250_frame_03250_cgram.bin --ppu-state tools/out/lane3_live_entry_brake_frame03250_frame_03250_ppu_state.json --oam tools/out/lane3_live_entry_brake_frame03250_frame_03250_oam.bin --screenshot tools/out/lane3_live_entry_brake_frame03250_frame_03250_frame.png --out-dir tools/out/lane3_live_entry_brake_traffic_frame03250_bundle`
  - `python3 tools/build_gameplay_frame_bundle.py --label lane3_live_entry_brake_traffic_frame03400 --frame 3400 --vram tools/out/lane3_live_entry_brake_frame03400_frame_03400_vram.bin --cgram tools/out/lane3_live_entry_brake_frame03400_frame_03400_cgram.bin --ppu-state tools/out/lane3_live_entry_brake_frame03400_frame_03400_ppu_state.json --oam tools/out/lane3_live_entry_brake_frame03400_frame_03400_oam.bin --screenshot tools/out/lane3_live_entry_brake_frame03400_frame_03400_frame.png --out-dir tools/out/lane3_live_entry_brake_traffic_frame03400_bundle`
- pairwise compare:
  - `python3 tools/build_gameplay_bundle_compare.py tools/out/lane3_live_entry_brake_traffic_frame03250_bundle tools/out/lane3_live_entry_brake_traffic_frame03400_bundle tools/out/lane3_live_entry_brake_traffic_3250_vs_3400_compare.json --markdown-out tools/out/lane3_live_entry_brake_traffic_3250_vs_3400_compare.md --label-a brake_3250 --label-b brake_3400`

## Bounded Negative Result

- the bounded `wiggle` attempt still crashes too early to reach a useful
  checkpoint/post-stop or police/radar phase
- the braking variant delays that failure, but it still does **not** recover
  the manual-seed checkpoint/post-stop flow
- practical implication:
  the current live-entry lane still does not have a closed checkpoint/police
  replicate, so the strongest new promoted surface is traffic emergence before
  the later crash

## Promoted Artifacts

- `tools/out/lane3_live_entry_review_wiggle_3600_contact_sheet.png`
- `tools/out/lane3_live_entry_review_brake_3600_contact_sheet.png`
- `tools/out/lane3_live_entry_brake_probe_v1/td2_boot_probe.json`
- `tools/out/lane3_live_entry_brake_traffic_frame03250_bundle/`
- `tools/out/lane3_live_entry_brake_traffic_frame03400_bundle/`
- `tools/out/lane3_live_entry_brake_traffic_3250_vs_3400_compare.json`
- `tools/out/lane3_live_entry_brake_traffic_3250_vs_3400_compare.md`

## Visual Support

Designer-facing anchors for the promoted pair:

- `tools/out/lane3_live_entry_brake_traffic_frame03250_bundle/frame.png`
- `tools/out/lane3_live_entry_brake_traffic_frame03250_bundle/bg_stack_visible_support.png`
- `tools/out/lane3_live_entry_brake_traffic_frame03250_bundle/world_visible_support.png`
- `tools/out/lane3_live_entry_brake_traffic_frame03250_bundle/main.png`
- `tools/out/lane3_live_entry_brake_traffic_frame03250_bundle/bg1.png`
- `tools/out/lane3_live_entry_brake_traffic_frame03250_bundle/bg2.png`
- `tools/out/lane3_live_entry_brake_traffic_frame03250_bundle/bg3.png`
- `tools/out/lane3_live_entry_brake_traffic_frame03250_bundle/obj.png`
- `tools/out/gameplay_bg3_cutoff_sweep_20260401/lane3_live_entry_frame03250_bundle_bg3_cutoff_candidate.png`
- `tools/out/gameplay_bg3_cutoff_sweep_20260401/lane3_live_entry_frame03250_bundle_bg3_cutoff_compare.png`
- `tools/out/lane3_live_entry_brake_traffic_frame03400_bundle/frame.png`
- `tools/out/lane3_live_entry_brake_traffic_frame03400_bundle/bg_stack_visible_support.png`
- `tools/out/lane3_live_entry_brake_traffic_frame03400_bundle/world_visible_support.png`
- `tools/out/lane3_live_entry_brake_traffic_frame03400_bundle/main.png`
- `tools/out/lane3_live_entry_brake_traffic_frame03400_bundle/bg1.png`
- `tools/out/lane3_live_entry_brake_traffic_frame03400_bundle/bg2.png`
- `tools/out/lane3_live_entry_brake_traffic_frame03400_bundle/bg3.png`
- `tools/out/lane3_live_entry_brake_traffic_frame03400_bundle/obj.png`
- `tools/out/gameplay_bg3_cutoff_sweep_20260401/lane3_live_entry_brake_traffic_frame03400_bundle_bg3_cutoff_candidate.png`
- `tools/out/gameplay_bg3_cutoff_sweep_20260401/lane3_live_entry_brake_traffic_frame03400_bundle_bg3_cutoff_compare.png`

## Designer Review Follow-Up

- first designer read:
  - `BG1` cockpit extraction is correct
  - `OBJ` sprites are visually correct
  - the initial packs still did **not** make the road/background readable
- root cause:
  - gameplay `BG2` in this lane uses both `largeTiles = true` and a
    per-scanline presentation surface
  - fixing `16x16` tile geometry improves the raw `BG2` render materially, but
    one flat frame-end `ppu_state.json` still cannot reconstruct the full
    visible road/background stack by itself
- new practical split inside the bundle:
  - `bg2.png` is the corrected static-state `BG2` render for memory/VRAM
    correlation
  - `bg3.png` is the closest raw-state sky/horizon helper surface and is now
    available directly in the tracked bundle
  - `world_visible_support.png` is the exact screenshot-derived road/world
    surface for human labeling
  - `bg_stack_visible_support.png` is the exact screenshot-derived background
    stack without `OBJ`, useful when designers want the cockpit plus world but
    not the traffic/event layer

## Current Reading

- the braking window creates the first bounded live-entry follow-up that stays
  useful past the earlier collision-heavy corridor:
  - frame `3250` keeps a road/curve/signage surface with no red traffic car
  - frame `3400` introduces a clear red traffic car while preserving the same
    road and cockpit context
- the top-level gameplay family stays unchanged across that pair:
  - `3250`: `02:9016 / 01:96A0 / 02:8F3C`
  - `3400`: `02:9016 / 01:96A0 / 02:8F3C`
- the machine split is sharper than the earlier collision pair:
  - `BG1` tilemap stats are identical
  - `BG2` tilemap stats are identical
  - `BG3` tilemap stats are identical
  - `BG2` layer state is identical
  - only `OBJ` workload shifts materially:
    `37 -> 41` visible sprites and `1138 -> 2117` drawn pixels
- the matched probe rows fit that same read:
  - `state_11f3`: `179 -> 208`
  - `oam_0730`: `4627 -> 4628`
  - `state_09a2`: `43 -> 47`
  - `dp_0053/0054`: `16 -> 224`
  - `dp_0022`: `22 -> 6`
- practical fit:
  - this is currently the cleanest live-entry proof that a visible gameplay
    event can land primarily on the `OBJ` bucket while the road/cockpit
    backgrounds remain stable
  - the new raw `BG3` previews stay populated and nearly unchanged across the
    pair, which reinforces the current read that this transition is
    background-stable and `OBJ`-driven rather than a fresh road-layer swap
  - the new cutoff sweep fits the same interpretation:
    frame `3400` lands on the same best top-band `BG3 > BG2` cutoff as
    frame `3250` (`79` lines), which is a strong hint that this late pair
    shares one stable background composition rule while only the actor/event
    bucket changes materially
  - for designer review, the new screenshot-derived support surfaces now close
    the earlier road/background visibility gap without pretending the raw
    `BG2` render is fully scanline-accurate
  - it is therefore a better designer-labeling and memory-trace target than
    another whole-frame collision compare

## Why This Matters

- lane 3 now has two complementary live-entry event buckets:
  - `3250 -> 3550`: collision/overlay-heavy transition with `BG1 + OBJ` shift
  - `3250 -> 3400` under the braking variant: traffic-emergence transition
    with an `OBJ`-only visible split
- this is the gameplay-side equivalent of the earlier lane-2 asset-first gain:
  designers can now label a concrete actor/event bucket instead of one entire
  screenshot, and tracing can follow that same narrowed bucket in memory/OAM

## Next Best Step

- use the new traffic-emergence pair as the best current target for `OBJ`-side
  gameplay labeling and OAM tracing
- keep `bg3.png` in the review loop so sky/horizon discussion stays anchored
  to tracked raw-state output rather than only the screenshot-derived support
  masks
- keep the cutoff candidates in the same review loop, because they are the
  first tracked artifacts that materially narrow the background rule to a
  top-band precedence shift instead of a missing-layer problem
- if another bounded live-entry attempt is made, optimize it specifically for
  getting past the `2400`-relative crash boundary toward checkpoint/post-stop,
  not for rediscovering the already-promoted traffic pair again
