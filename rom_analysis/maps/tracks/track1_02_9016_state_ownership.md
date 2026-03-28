# Track 1 `02:9016` State Ownership Notes

- Note date: `2026-03-27`
- Primary evidence surfaces:
  - `rom_analysis/maps/tracks/track1_live_race_vs_post9016_control.md`
  - `tools/out/lane3_live_race_mid_vs_post9016_default_rival_probe_compare.json`
  - `tools/out/lane3_live_race_plus30f_vs_post9016_default_rival_probe_compare.json`
  - `bank2.asm` `L0108EF`, `L0117BA`, `L012501`
  - `bank0.asm` `L00158F`, `L0015BD`, `L0015E1`, `L001662`, `L00179B`
  - `bank1.asm` `L009185`, `6250..6272`

## What Was Read

- static ownership reads:
  - `nl -ba bank2.asm | sed -n '1128,1208p'`
  - `nl -ba bank2.asm | sed -n '2860,3060p'`
  - `nl -ba bank2.asm | sed -n '4480,4585p'`
  - `nl -ba bank2.asm | sed -n '5488,5715p'`
  - `nl -ba bank2.asm | sed -n '6168,6205p'`
  - `nl -ba bank0.asm | sed -n '3294,3420p'`
  - `nl -ba bank0.asm | sed -n '3440,3775p'`
  - `nl -ba bank1.asm | sed -n '2088,2122p'`
  - `nl -ba bank1.asm | sed -n '6240,6320p'`
- probe spot-checks from existing promoted JSONs:
  - control aligned window `2048..2053`
  - manual live-race windows `0..5`

## Ownership Map

- `state_11f3` is no longer an anonymous split field.
  - `bank2.asm` `L0117BA` seeds it only on the rival-enabled branch:
    `$11F3 <- $11F1 - 1` when `$1C76 != 0`.
  - `bank2.asm` `L0108EF` then turns `$11F3` into `oam_0730`, while the
    adjacent words come from `$11F1 -> oam_072C` and `$11F5 -> oam_0734`.
  - `bank2.asm` `L012501` also compares `$11F3` against `$1CE8`, so the field
    participates in gameplay-facing thresholds as well as HUD/OAM staging.
  - practical read:
    `state_11f3 -> oam_0730` is a rival-only HUD/progress marker, not a menu
    artifact.

- `state_09a2` is an OAM staging cursor / sprite count.
  - `bank0.asm` startup resets it with `$09A2 = 0`, `$09A4 = 0x0200`,
    `$09A8 = 2`, then `L0015BD` fills the remaining `0700` buffer with the
    `E100` sentinel and raises `$096A`.
  - `bank0.asm` `L001662` and `L00179B` increment `$09A2` once per sprite
    emitted into `0700/0900`.
  - `bank1.asm` `L009185` preserves and restores `$09A2` around helper-bundle
    rendering before calling `L0015BD`.
  - practical read:
    `state_09a2` differences inside `02:9016` indicate different OAM workload,
    not a separate top-level callback family.

- `state_09a8` is a builder-side OAM allocator control value.
  - `bank0.asm` `L0015E1` copies `$09A8` into `$0AAA`, the allocator-side map
    associated with OAM entries.
  - `bank2.asm` repeatedly sets `$09A8` to non-default values immediately
    before sprite submission calls:
    - `#000A` around `L001662`
    - `#003C` in `L01318D`
    - `#FFFF` in bank-1 helper setup
    - then resets back to `#0002`
  - practical read:
    the `09A8 = 2/10` pulses in the live-race probes are allocator/build
    control changes, not a standalone gameplay mode flag.

- `dp_0053/dp_0054` behave as the read/write cursor pair for the `7E:0600`
  DMA descriptor ring.
  - the scanline instrumentation already models the pair that way in
    `validation/mesen_scanline_step_test.lua`, deriving active descriptor
    counts from `7E:0053/0054` over `7E:0600`.
  - the aligned control and manual live-race windows show the exact cursor
    catch-up shape expected from a producer/consumer ring in `8`-byte steps:
    - control: `E8/E8 -> E8/E8 -> E8/F8 -> F8/F8 -> F8/F8 -> F8/F8`
    - `live_race_mid`: `78/78 -> 78/88 -> 88/88 -> 88/98 -> 98/98 -> 98/A8`
    - `live_race_plus30f`: `28/28 -> 28/28 -> 28/28 -> 28/28 -> 28/30 -> 30/40`
  - practical read:
    `0053/0054` are queue-lifecycle telemetry inside `02:9016`, not durable
    car-physics state.

- `dp_0020/dp_0022` are still useful discriminators, but they look like
  transient builder operands rather than stable state.
  - `bank2.asm` writes and rewrites `$20.b/$22.b` throughout sprite/HUD
    builders such as `L012481`, `L012CA8`, `L012D5A`, and `L012DEC`.
  - those values act like temporary coordinates / source selectors / tile
    bases immediately before math or `L001662/L00179B` submission calls.
  - practical read:
    probe differences on `dp_0020/dp_0022` tell us which producer path last ran
    near frame end, but not by themselves which gameplay phase we are in.

## Current Reading

- the broad `02:9016 / 01:96A0 / 02:8F3C` family is now best read as a shared
  session driver that can host attract/demo, front-end carry, and live race.
- the manual live-race seeds differ from the old aligned control corridor
  because they schedule different rival HUD/OAM and DMA queue work inside that
  same driver:
  - rival marker source: `state_11f3 -> oam_0730`
  - OAM workload surface: `state_09a2/state_09a8`
  - DMA queue lifecycle: `dp_0053/dp_0054`
  - last-run builder scratch: `dp_0020/dp_0022`

## Next Best Step

- stop treating `09A2/09A8/0053/0054` as anonymous split bytes
- trace the specific bank-2 producer paths that create the extra live-race
  OAM and queue movement:
  - callers around `L01318D` and `L0108EF`
  - paths that set `$09A8` to non-`2` values before `L001662/L00179B`
  - any owner that advances the `0053/0054` DMA ring alongside those OAM
    submissions
