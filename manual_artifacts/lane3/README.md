# Lane 3 Manual Capture Request

This directory is the manual handoff point for external Lane 3 evidence that
cannot be produced reliably through the current headless Mesen path.

## Highest-Value Artifact

The current blocker is the lack of a verified live-race savestate.

The most useful manual package is:

1. `lane3_live_race_mid.mss`
2. `lane3_live_race_plus30f.mss`
3. `lane3_live_race_notes.txt`

## What Each File Should Be

### `lane3_live_race_mid.mss`

- A manual Mesen savestate taken during unmistakable live gameplay.
- Preferred surface:
  - road moving
  - cockpit/HUD visible
  - not paused
  - not a title/menu/attract/demo transition
- Better if captured during the common in-race camera, not during a crash,
  fade, or scripted transition.

### `lane3_live_race_plus30f.mss`

- A second savestate from the same gameplay session roughly `30` frames later.
- Keep the run in the same live gameplay state.
- If exact `30` is inconvenient, any short later offset in the same session is
  still useful; note the estimate in `lane3_live_race_notes.txt`.

### `lane3_live_race_notes.txt`

Short plain-text note with:

- track/car if known
- whether an opponent car is present
- whether the player had control at that moment
- approximate frame gap between the two savestates
- whether pressing `Start` from that exact point opens pause/menu or does
  something else

## Optional Secondary Artifact

If the attract/demo-skip hypothesis is easy to reproduce, this pair is also
useful:

1. `lane3_demo_before_start.mss`
2. `lane3_demo_after_start_cut.mss`

with one extra note in `lane3_live_race_notes.txt` saying that the second file
was captured immediately after pressing `Start` to cut the presentation.

## Why This Matters

The current `game_11.mss` seed is proven input-sensitive but still inherits the
old front-end selector family. A real mid-race seed is the cleanest way to
separate:

- actual gameplay state
- attract/demo gameplay presentation
- menu-derived callback reuse

## Expected Consumer

Once these files exist here, the next Lane 3 pass can load them directly with
the existing Mesen probe/capture scripts.
