# Lane 3 Manual Capture Request

## Current Status (`2026-03-28`)

The original request is now fulfilled.

Preserved manual savestates:

- `lane3_live_race_mid.mss`
- `lane3_live_race_plus30f.mss`
- `lane3_live_race_slot2_extra.mss`
- `lane3_live_race_notes.txt`
- `responses.txt`
- `lane3_live_race_video.avi`

Derived stills from the preserved local video now live under:

- `Screenshots/lane3_live_race_video_contact_sheet.png`
- `Screenshots/lane3_live_race_video_frame0000_start.png`
- `Screenshots/lane3_live_race_video_frame0600_curve.png`
- `Screenshots/lane3_live_race_video_frame1200_open_road.png`
- `Screenshots/lane3_live_race_video_frame1500_stop_sign.png`
- `Screenshots/lane3_live_race_video_frame2500_late_radar.png`

Note:

- no separate user-supplied screenshot files were present in `Screenshots/`
  at intake time
- the current PNGs in that folder were extracted from
  `lane3_live_race_video.avi` so later agents have stable review frames even
  if they do not replay the video manually

These came from the user's live Mesen config under
`~/.config/Mesen2/SaveStates/`:

- slot `#1` -> `lane3_live_race_mid.mss`
- slot `#2` -> `lane3_live_race_slot2_extra.mss`
- slot `#3` -> `lane3_live_race_plus30f.mss`

Use these preserved copies, not the mutable external config path.

This directory is the manual handoff point for external Lane 3 evidence that
cannot be produced reliably through the current headless Mesen path.

## Highest-Value Artifact

The current blocker is the lack of a verified live-race savestate.

The most useful manual package is:

1. `lane3_live_race_mid.mss`
2. `lane3_live_race_plus30f.mss`
3. `lane3_live_race_notes.txt`
4. `responses.txt`
5. `lane3_live_race_video.avi`

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
