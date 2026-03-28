# Track 1 Live-Race `L01318D` Static Role Split

- Note date: `2026-03-28`
- Primary code surface:
  - `bank2.asm` `L012F48 .. L01318D`
- Current gameplay seed context:
  - `manual_artifacts/lane3/lane3_live_race_mid.mss`

## What Was Read

- loop/caller context:
  - `nl -ba bank2.asm | sed -n '2148,2255p'`
  - `nl -ba bank2.asm | sed -n '5877,6168p'`
  - `nl -ba bank2.asm | sed -n '6168,6279p'`
- existing ownership notes:
  - `rom_analysis/maps/tracks/track1_02_9016_state_ownership.md`
  - `rom_analysis/maps/tracks/track1_live_race_bg2_producer_path.md`
- small address walk used to pin the previously named PCs inside the loop:
  - `02:B042`
  - `02:B05D`
  - `02:B0B1`
  - `02:B0BD`
  - `02:B134`

## Loop Shape

- `L01114F` and `L011165` both call the same late gameplay block in order:
  - `L012F48`
  - `L01318D`
  - `L01070A`
  - `L0108EF`
  - OAM flush helper
- practical reading:
  - `L01318D` is not the already-closed rival-marker path
  - it sits earlier in the same frame build and prepares/emits the moving
    gameplay workload that later shares the frame with the closed
    `state_11f3 -> oam_0730` HUD marker path

## Static Role Split Inside `L01318D`

- `02:B042`
  - falls on `lda $12F4.w,X`
  - role:
    loads a per-entry attribute/variant word into `$26`
  - reading:
    operand selection, not sprite emission by itself

- `02:B05D`
  - falls on `adc $1CB2.w`
  - role:
    part of the low-index branch that converts the local selector into the
    final `$22` screen/object position before `jsr L012BE2`
  - reading:
    coordinate/phase assembly, not the final submit point

- `02:B0B1`
  - falls on an `asl A`
  - role:
    part of the high-index branch's `5 * value` style expansion on `$22`
    after subtracting `8` and optionally setting `$24 = 0x4000`
  - reading:
    position/tile-base math, not the final submit point

- `02:B0BD`
  - falls on `lda #$1D80.w`
  - role:
    loads the shared source-bank base into `$11/$10` immediately before the
    generic emitter call
  - reading:
    setup for submission, not the emission itself

- `02:B134`
  - falls on `jsr L012BE2.w`
  - role:
    the generic submit point on the default branch after `$26`, `$24`, `$22`,
    and the `1D80:8000` source base are prepared
  - reading:
    strongest current candidate for the actual road-line/object emission site
    among the previously named PCs

## Important Companion Branch

- one nearby site is at least as important as the five named PCs:
  - `02:B101` -> `jsr L012D5A.w`
- branch condition:
  - active only when the `1CEA` test takes the special path and `$BA != 0`
- reading:
  - the narrowed cluster is not one emitter
  - it already splits into:
    - generic `L012BE2` submissions
    - an alternate `L012D5A` submission path

## Practical Reading

- the old five-PC list mixed together three different kinds of work:
  - operand/variant load (`02:B042`)
  - coordinate/tile-base math (`02:B05D`, `02:B0B1`, `02:B0BD`)
  - actual generic submit (`02:B134`)
- that means the next proving target should no longer be "which one of the
  five is the road builder?"
- the tighter target is:
  - what `L012BE2` emits on the default path
  - what `L012D5A` emits on the alternate path
  - which live-race conditions choose between those two emitters

## Why The Radar Was Only An Anchor

- the radar/top-strip marker stayed useful because its ownership is already
  closed:
  - `L0117BA` seeds `state_11f3`
  - `L0108EF` turns it into `oam_0730`
- that closed path gave a reliable visual/state anchor for confirming that the
  manual live-race seeds were meaningfully different from the old control
  corridor
- but `L01318D` is where the open gameplay-world attribution still lives, so
  the lane should now spend effort there instead of treating the radar marker
  as the main destination
