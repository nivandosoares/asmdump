# Track 1 Longplay Hard-Phase Anchors

- Intake date: `2026-03-28`
- Source video:
  - local `the_duel_longplay.mp4`
- Builder:
  - `tools/build_video_phase_pack.py`
- Spec:
  - `tools/gameplay_video_phase_packs.json`
- Promoted phase pack:
  - `tools/out/longplay_hard_phase_anchor_pack/`

## Key Artifacts

- `tools/out/longplay_hard_phase_anchor_pack/anchor_sheet.png`
- `tools/out/longplay_hard_phase_anchor_pack/01_night_start_anchor.png`
- `tools/out/longplay_hard_phase_anchor_pack/02_bridge_crossing_anchor.png`
- `tools/out/longplay_hard_phase_anchor_pack/03_mountain_wall_anchor.png`
- `tools/out/longplay_hard_phase_anchor_pack/04_tunnel_run_anchor.png`
- `tools/out/longplay_hard_phase_anchor_pack/05_rain_segment_anchor.png`
- `tools/out/longplay_hard_phase_anchor_pack/manifest.json`

## What Was Run

- `python3 tools/build_video_phase_pack.py --spec tools/gameplay_video_phase_packs.json`

## Closed Read

- the later hard-phase corridor now has preserved local visual anchors instead
  of only roadmap timestamps
- promoted anchors from the local longplay:
  - `24:13` (`1453s`): first clean night-driving still after the earlier
    transition/result boundary around the roadmap's `24:11`
  - `30:32` (`1832s`): bridge crossing with purple water, mountain horizon,
    and traffic on the right lane
  - `33:24` (`2004s`): mountain-wall / no-right-shoulder corridor chosen as a
    clearer representative still than the roadmap's rougher `33:40` anchor,
    which falls very close to tunnel entry in this recording
  - `34:18` (`2058s`): tunnel driving
  - `45:18` (`2718s`): rain segment with windshield droplets and traffic ahead
- the difficult later phases now expose concrete visual targets that were
  missing from the gameplay pack family:
  - dark/night palette shift
  - bridge/water/mountain horizon stack
  - mountain-wall/no-shoulder road geometry
  - tunnel enclosure
  - rain-on-windshield presentation

## Boundary

- these anchors come from a local longplay recording, not from the trusted
  savestate-backed `BG1/BG2/BG3/OBJ` extraction path
- use them as visual targeting surfaces for later emulator/native capture, not
  as proof of exact runtime ownership by themselves

## Next Best Step

- use these anchors to drive later hard-phase-specific capture requests or live
  reproduction attempts
- once any of these phases is reachable in a reproducible emulator path, keep
  the later analysis on the ratified `BG` plus `OBJ` surfaces instead of
  collapsing back to whole-frame-only review
