# Track 1 Live Gameplay Entry Route

- Note date: `2026-03-28`
- Goal:
  promote a practical power-on route back into live gameplay so later lane-3
  work can use gameplay-relative inputs instead of depending on one preserved
  manual savestate or one exact absolute frame match

## What Was Added

- entry launcher:
  - `tools/run_lane3_gameplay_entry.py`
- probe-window search helper:
  - `tools/search_boot_probe_matches.py`

## What Was Run

- short menu-route recheck with `A` on menus only:
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=120 TD2_BOOT_PROBE_TOTAL_FRAMES=2600 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/lane3_boot_repro_menu_a_short/td2_boot_probe TD2_BOOT_PROBE_TRACE_EXEC_POINTS='c20b=00:C20B,c1d2=01:C1D2,be76=00:BE76,b87=00:8B87,p902d=01:902D,p9111=01:9111,p9016=02:9016' TD2_BOOT_PROBE_EXEC_POINT_MAX_HITS=64 TD2_BOOT_PROBE_EXEC_POINT_MAX_HITS_PER_POINT=8 TD2_BOOT_PROBE_INPUT_WINDOWS='1200:a;1280:a;1505-1510:a;1640-1645:a;1730-1735:a' ./validation/run_mesen_probe_boot.sh ./game.smc`
- long power-on route with menu `A` pulses plus gameplay-only `A` hold:
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=360 TD2_BOOT_PROBE_TOTAL_FRAMES=17000 TD2_BOOT_PROBE_OUTPUT_PREFIX=tools/out/lane3_boot_repro_menu_a_then_hold_a/td2_boot_probe TD2_BOOT_PROBE_INPUT_WINDOWS='1200:a;1280:a;1505-1510:a;1640-1645:a;1730-1735:a;2050-16999:a' ./validation/run_mesen_probe_boot.sh ./game.smc`
- exact aligned compare against the preserved manual gameplay seed:
  - `python3 tools/compare_boot_probe_windows.py tools/out/lane3_live_race_mid_probe/td2_boot_probe.json tools/out/lane3_boot_repro_menu_a_then_hold_a/td2_boot_probe.json tools/out/lane3_boot_repro_menu_a_then_hold_a_vs_live_mid_exact16655.json --markdown-out tools/out/lane3_boot_repro_menu_a_then_hold_a_vs_live_mid_exact16655.md --label-a live_race_mid --label-b menu_a_then_hold_a --frame-offset-b -16655 --start-frame 0 --end-frame 11 --fields state_0960,state_09a2,state_09a8,state_11f3,dp_0053,dp_0054,dp_0020,dp_0022,state_1c6a,state_1c70,state_1c76,state_0202,active_main_callback_bank,active_main_callback_addr,active_irq_callback_bank,active_irq_callback_addr,active_nmi_callback_bank,active_nmi_callback_addr,oam_0730`
- sliding exact-field search over the later live-gameplay corridor:
  - `python3 tools/search_boot_probe_matches.py tools/out/lane3_live_race_mid_probe/td2_boot_probe.json tools/out/lane3_boot_repro_menu_a_then_hold_a/td2_boot_probe.json tools/out/lane3_boot_repro_menu_a_then_hold_a_vs_live_mid_search.json --markdown-out tools/out/lane3_boot_repro_menu_a_then_hold_a_vs_live_mid_search.md --label-target live_race_mid --label-search menu_a_then_hold_a --target-start-frame 0 --target-end-frame 11 --search-start-frame 15000 --search-end-frame 16999 --fields state_0960,state_09a2,state_09a8,state_11f3,dp_0053,dp_0054,dp_0020,dp_0022,state_1c6a,state_1c70,state_1c76,state_0202,active_main_callback_bank,active_main_callback_addr,active_irq_callback_bank,active_irq_callback_addr,active_nmi_callback_bank,active_nmi_callback_addr,oam_0730 --top-k 5`
- launcher smoke validation:
  - `python3 tools/run_lane3_gameplay_entry.py tools/out/lane3_gameplay_entry_probe_smoke --mesen-release-dir /home/nivando-soares/Mesen2/bin/linux-x64/Release --probe-total-frames 2600 --gameplay-input-windows '0-549:a'`

## Promoted Artifacts

- `tools/out/lane3_boot_repro_menu_a_then_hold_a_vs_live_mid_exact16655.json`
- `tools/out/lane3_boot_repro_menu_a_then_hold_a_vs_live_mid_exact16655.md`
- `tools/out/lane3_boot_repro_menu_a_then_hold_a_vs_live_mid_search.json`
- `tools/out/lane3_boot_repro_menu_a_then_hold_a_vs_live_mid_search.md`

## Current Reading

- the user-guided route is now strong enough to promote as a practical
  gameplay-entry surface:
  - `A` pulses on the menu corridor still reopen the shared gameplay family
    from power-on
  - by frame `2044`, the short route is already on:
    - `active_main = 02:9016`
    - `active_irq = 01:96A0`
    - `active_nmi = 02:8F3C`
    - `$1C6A = 1`
    - `$1C70 = 0`
    - `$1C76 = 1`
    - `$0202 = 0xFFFF`
- the new launcher makes that route operational instead of implicit:
  - fixed menu-entry windows:
    `1200:a;1280:a;1505-1510:a;1640-1645:a;1730-1735:a`
  - gameplay-relative zero:
    frame `2050`
  - later gameplay input windows can now be expressed relative to that point
    instead of repeating a full absolute boot-time string every run
- the long `menu_a_then_hold_a` run is therefore useful as a reproducible
  live-gameplay lane even though it does **not** clone `live_race_mid`
  exactly:
  - at absolute frame `16655`, it still keeps:
    - `state_11f3 = 198`
    - `oam_0730 = 4628`
    - `dp_0053 = 248`
    - `dp_0054 = 248`
    - `dp_0020 = 11`
    - `dp_0022 = 284`
  - the preserved manual `live_race_mid` seed still keeps:
    - `state_11f3 = 477..479`
    - `oam_0730 = 4645`
    - a different moving `dp_0053/0054` / `dp_0020/0022` corridor
- the exact-state mismatch is now best read as a **secondary** problem:
  - the sliding exact-field search over `15000..16999` never improves beyond
    `129/228` exact field slots
  - the strongest matches are broad ties rather than a single special window
  - practical fit:
    this route reaches a real gameplay-family corridor that is stable enough
    for live probing, but it is still shallower than the preserved manual
    `live_race_mid` sample

## Practical Use

- when the goal is live debug or live capture:
  - start from `tools/run_lane3_gameplay_entry.py`
  - treat frame `2050` as gameplay-relative zero
  - express later driving/braking/steering experiments as relative gameplay
    windows
- when the goal is exact visual anchoring against the preserved manual stills:
  - keep using `manual_artifacts/lane3/lane3_live_race_mid.mss`
  - do **not** assume the new power-on route will land on the same absolute
    substate by itself

## First Live Input Follow-Up

- a first live-entry probe matrix now exists locally:
  - `tools/out/lane3_live_entry_matrix_summary.json`
- tested scenarios from the same live-entry route:
  - `0-2149:a`
  - `0-2149:a;320-620:right`
  - `0-2149:a;320-620:left`
- bounded read from that matrix:
  - the current strong probe fields do **not** separate those three runs
  - all three keep the same maxima and first-hit frames for:
    - `state_11f3` (`44 -> 198`, first max at `3348`)
    - `oam_0730` (`4618 -> 4628`, first max at `3320`)
    - `state_09a2` (`18 -> 45`, first max at `3110`)
    - `dp_0053` / `dp_0054` (`0 -> 248`, first max at `2083/2082`)
  - practical fit:
    the currently favored probe fields are still too coarse to register this
    early steering burst as a separate gameplay lane
- a visual follow-up now sharpens that same point:
  - straight-vs-right capture compare:
    `tools/out/lane3_entry_capture_straight_vs_right.md`
  - straight-vs-straight repeat compare:
    `tools/out/lane3_entry_capture_straight_repeat_compare.md`
  - the repeated `straight` lane is screenshot-deterministic
  - the naive `straight` vs `right` compare shows a one-frame phase lead on the
    `right` run
  - after compensating that one-frame lead, the first real visual divergence
    lands around capture index `82`, i.e. script frame `2402`
  - the injected `right` window begins at absolute frame `2370`, so the first
    visible consequence appears about `32` frames later
- current implication:
  - steering already has real visible effect on the live-entry lane
  - but the present Lane 3 probe field set does not yet expose the owner of
    that effect cleanly
  - the next stronger machine-only step is therefore not “ask for a screenshot”
    but widen the live probe/capture field set around steering-sensitive
    windows

## Next Best Step

- treat the new launcher as the default live-debug entry lane for gameplay
  archaeology
- parameterize that lane upward instead of chasing one exact seed:
  - alternate car selection
  - alternate track selection
  - opponent/no-opponent branch
- once those selectors are encoded, use short gameplay-relative probe/capture
  loops to map:
  - live road/world emitters
  - traffic / police / checkpoint behavior
  - track-specific layer and OAM differences
- before asking for more human visual support, expand the machine-visible
  steering lane first:
  - align the one-frame capture lead automatically in tooling or comparison
  - add steering-sensitive probe fields instead of only reusing
    `state_11f3/oam_0730/09A2/0053/0054`
