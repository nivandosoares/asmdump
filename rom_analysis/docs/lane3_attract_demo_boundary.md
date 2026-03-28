# Lane 3 Attract/Demo Boundary

This note records the current best explanation for why some older Lane 3
evidence looked like "menu" in one pass and "gameplay" in another.

## Working Read

- the old no-input and early-input Lane 3 corridors should not be treated as a
  clean binary split between front-end and gameplay
- the stronger current fit is that the attract loop can pass through short
  gameplay-like demo slices
- those slices are easy to truncate or skip with scripted input, especially in
  the same power-on runs that were previously used as gameplay-hunting lanes

## Why This Fits Better Now

- `game_11.mss` is still correctly demoted to `front_end_menu_seed`
  - it is not a trustworthy gameplay baseline
  - but that does **not** imply every `02:9016`-based corridor is menu-only
- the preserved manual live-race seeds are user-verified Desert Blast gameplay
  imagery
  - they still load onto `02:9016 / 01:96A0 / 02:8F3C`
  - they already diverge from the old post-`2050` control corridor in stable
    HUD/OAM/substate fields
- the older `b_hold` and related power-on corridors can still show cockpit or
  motion-like surfaces without proving a stable player-controlled gameplay
  session
  - the simplest explanation is that these runs can cross attract/demo
    material, not that they cleanly enter the same long-form state as the
    preserved live-race seeds

## Practical Rule

- do not demand a long uninterrupted gameplay segment from the old no-input or
  early-input power-on corridors
- do not interpret "input prevented the expected gameplay from appearing" as a
  failure by default; it may simply mean the input cut off a short attract/demo
  slice before it matured
- treat those older corridors as mixed front-end/demo evidence unless they are
  corroborated by:
  - preserved manual gameplay seeds
  - a clear code-facing substate separation
  - or a stronger producer-side trace than the old screenshot-hunting passes

## Immediate Implication

- `02:9016` should currently be read as a broader session-family label, not a
  menu-exclusive label
- the live frontier is the meaning of the internal HUD/OAM/substate fields
  within that family, not the existence of a separate gameplay callback family
