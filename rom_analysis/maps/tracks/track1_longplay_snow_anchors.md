# Track 1 Longplay Snow Anchors

- Intake date: `2026-03-28`
- Source video:
  - local `the_duel_longplay.mp4`
- Builder:
  - `tools/build_video_phase_pack.py`
- Spec:
  - `tools/gameplay_video_phase_packs.json`
- Promoted phase pack:
  - `tools/out/longplay_snow_phase_pack/`

## Key Artifacts

- `tools/out/longplay_snow_phase_pack/anchor_sheet.png`
- `tools/out/longplay_snow_phase_pack/01_snow_onset_anchor.png`
- `tools/out/longplay_snow_phase_pack/02_snow_mountain_curve_anchor.png`
- `tools/out/longplay_snow_phase_pack/03_snow_log_truck_anchor.png`
- `tools/out/longplay_snow_phase_pack/manifest.json`

## What Was Run

- targeted user-guided scan:
  - `ffmpeg -y -loglevel error -ss 3600 -t 80 -i the_duel_longplay.mp4 -vf "fps=1,scale=320:180,tile=4x5" -frames:v 1 tools/out/tmp_snow_scan/longplay_6000_6080_detail_sheet.png`
  - `ffmpeg -y -loglevel error -ss 3570 -t 240 -i the_duel_longplay.mp4 -vf "fps=1/10,scale=240:135,tile=4x6" -frames:v 1 tools/out/tmp_snow_scan/longplay_5950_6350_snow_sheet.png`
- promoted builder run:
  - `python3 tools/build_video_phase_pack.py --spec tools/gameplay_video_phase_packs.json`

## Closed Read

- the user hint was correct:
  snow begins at the one-hour mark of the local longplay
- promoted snow anchors:
  - `01:00:00` (`3600s`): first clear snow onset
  - `01:02:20` (`3740s`): snowy mountain curve with visible flakes and a
    stronger mountain horizon
  - `01:03:20` (`3800s`): later snowy corridor with a log truck ahead
- practical reading:
  - lane 3 no longer lacks preserved snow-specific gameplay frames
  - the snow corridor is now a named visual surface rather than a vague
    “maybe East/West Coast later” hypothesis

## Boundary

- this pack is still a longplay-derived visual anchor, not a trusted
  `BG1/BG2/BG3/OBJ` capture
- use it to aim later emulator-side snow capture, not to replace that work

## Next Best Step

- use this pack plus the earlier hard-phase pack to choose the first snow-capable
  emulator-side route worth reproducing
- once a live or savestate path reaches snow, keep the follow-up on `BG/OBJ`
  ownership instead of whole-frame-only review
