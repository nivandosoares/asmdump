# Track 1 Longplay Prison Finale Anchor

- Intake date: `2026-03-28`
- Source video:
  - local `the_duel_longplay.mp4`
- Builder:
  - `tools/build_video_phase_pack.py`
- Spec:
  - `tools/gameplay_video_phase_packs.json`
- Promoted phase pack:
  - `tools/out/longplay_prison_finale_phase_pack/`

## Key Artifacts

- `tools/out/longplay_prison_finale_phase_pack/anchor_sheet.png`
- `tools/out/longplay_prison_finale_phase_pack/01_arrest_prelude_anchor.png`
- `tools/out/longplay_prison_finale_phase_pack/02_license_revoked_anchor.png`
- `tools/out/longplay_prison_finale_phase_pack/03_high_score_followthrough_anchor.png`
- `tools/out/longplay_prison_finale_phase_pack/manifest.json`

## What Was Run

- `python3 tools/build_video_phase_pack.py --spec tools/gameplay_video_phase_packs.json`

## Closed Read

- the user-requested final prison outcome screen is now preserved as a stable
  local artifact instead of only an end-of-longplay assumption
- promoted finale anchors from the local longplay:
  - `01:26:16` (`5176s`): arrest prelude message strip
  - `01:26:20` (`5180s`): clearest `license revoked` / prison still
  - `01:26:22` (`5182s`): direct handoff into the high-score panel
- practical reading:
  - this recording does not return from the prison still into more gameplay
  - it goes straight from the arrest/prison outcome into the score screen

## Why This Matters

- lane 3 now has the full requested visual boundary for the end-state outcome
  corridor:
  - in-race checkpoint service/post sequence
  - partial-results screen
  - final prison outcome
- future capture or runtime-mimetization work can target this finale by name
  instead of re-scanning the longplay ending manually

## Next Best Step

- keep this finale pack as the human-facing reference for the arrest/prison
  corridor
- if a later emulator/live-debug route reaches the same outcome, compare it
  against this pack while keeping `BG/OBJ` extraction as the trusted ownership
  surface
