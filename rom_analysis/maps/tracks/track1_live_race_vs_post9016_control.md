# Track 1 Live-Race Seeds Vs Post-`02:9016` Control Corridor

- Note date: `2026-03-27`
- Manual-seed sources:
  - `manual_artifacts/lane3/lane3_live_race_mid.mss`
  - `manual_artifacts/lane3/lane3_live_race_plus30f.mss`
- Control corridor:
  - `tools/out/post9016_default_rival_probe_none/td2_boot_probe.json`
  - aligned relative window: control frames `2048..2059` -> compare frames `0..11`

## What Was Run

- tooling validation:
  - `python3 -m py_compile tools/compare_boot_probe_windows.py`
- aligned control compare:
  - `python3 tools/compare_boot_probe_windows.py tools/out/lane3_live_race_mid_probe/td2_boot_probe.json tools/out/post9016_default_rival_probe_none/td2_boot_probe.json tools/out/lane3_live_race_mid_vs_post9016_default_rival_probe_compare.json --markdown-out tools/out/lane3_live_race_mid_vs_post9016_default_rival_probe_compare.md --label-a live_race_mid --label-b post9016_default_rival_noinput --frame-offset-b -2048 --start-frame 0 --end-frame 11 --fields state_0960,state_09a2,state_09a8,state_11f3,dp_0053,dp_0054,dp_0020,dp_0022,state_1c6a,state_1c70,state_1c76,state_0202,active_main_callback_bank,active_main_callback_addr,active_irq_callback_bank,active_irq_callback_addr,active_nmi_callback_bank,active_nmi_callback_addr,oam_0730`
  - `python3 tools/compare_boot_probe_windows.py tools/out/lane3_live_race_plus30f_probe/td2_boot_probe.json tools/out/post9016_default_rival_probe_none/td2_boot_probe.json tools/out/lane3_live_race_plus30f_vs_post9016_default_rival_probe_compare.json --markdown-out tools/out/lane3_live_race_plus30f_vs_post9016_default_rival_probe_compare.md --label-a live_race_plus30f --label-b post9016_default_rival_noinput --frame-offset-b -2048 --start-frame 0 --end-frame 11 --fields state_0960,state_09a2,state_09a8,state_11f3,dp_0053,dp_0054,dp_0020,dp_0022,state_1c6a,state_1c70,state_1c76,state_0202,active_main_callback_bank,active_main_callback_addr,active_irq_callback_bank,active_irq_callback_addr,active_nmi_callback_bank,active_nmi_callback_addr,oam_0730`

## Artifacts

- `tools/out/lane3_live_race_mid_vs_post9016_default_rival_probe_compare.json`
- `tools/out/lane3_live_race_mid_vs_post9016_default_rival_probe_compare.md`
- `tools/out/lane3_live_race_plus30f_vs_post9016_default_rival_probe_compare.json`
- `tools/out/lane3_live_race_plus30f_vs_post9016_default_rival_probe_compare.md`

## Current Reading

- all three windows share the same callback surface:
  - `active_main = 02:9016`
  - `active_irq = 01:96A0`
  - `active_nmi = 02:8F3C`
- all three also share the same inherited selector family:
  - `$1C6A = 1`
  - `$1C70 = 0`
  - `$1C76 = 1`
  - `$0202 = 0xFFFF`
- the manual live-race seeds still separate from the older power-on control
  corridor immediately, without needing a new callback-family handoff
  - both manual seeds differ from the aligned control on all `12/12` frames in:
    - `oam_0730`
    - `state_11f3`
    - `dp_0053`
    - `dp_0054`
    - `dp_0020`
    - `dp_0022`
    - `state_09a2`
  - `state_09a8` is weaker:
    - `live_race_mid`: `2/12` differing frames
    - `live_race_plus30f`: `4/12` differing frames
  - `state_0960` is only a one-frame edge on `live_race_mid` (`128 -> 0`)
- strongest stable split:
  - control corridor:
    - `state_11f3 = 44`
    - `oam_0730 = 4618`
  - `live_race_mid`:
    - `state_11f3 = 477..479`
    - `oam_0730 = 4645`
  - `live_race_plus30f`:
    - `state_11f3 = 627..629`
    - `oam_0730 = 4655`
- practical reading:
  - `02:9016` should no longer be read as a menu-exclusive label
  - the user-verified live-race seeds prove this callback family can already
    carry live Desert Blast imagery while the real separation sits one level
    lower in HUD/OAM/substate fields
  - the current frontier is therefore semantic ownership, not callback-family
    discovery

## Next Best Step

- trace which code owns:
  - `state_11f3 -> oam_0730`
  - `dp_0053/dp_0054`
  - `dp_0020/dp_0022`
  - `state_09a2/state_09a8`
- prefer bounded producer/OAM/HUD tracing from the preserved manual seeds over
  more screenshot export, because the PNG path is still unreliable there
