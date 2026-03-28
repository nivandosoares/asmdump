# Track 1 Live-Race Manual Video Intake

- Intake date: `2026-03-28`
- Source artifact:
  - `manual_artifacts/lane3/lane3_live_race_video.avi`
- Supporting note:
  - `manual_artifacts/lane3/responses.txt`

## Video Metadata

- container: `AVI`
- duration: `43.861101s`
- raster: `256x224`
- video stream: `cscd`
- audio stream: `pcm_s16le`, stereo, `48000 Hz`
- nominal frame rate: about `60.10 fps`
- reported video frame count: `2636`

## Derived Review Frames

- `manual_artifacts/lane3/Screenshots/lane3_live_race_video_contact_sheet.png`
- `manual_artifacts/lane3/Screenshots/lane3_live_race_video_frame0000_start.png`
- `manual_artifacts/lane3/Screenshots/lane3_live_race_video_frame0600_curve.png`
- `manual_artifacts/lane3/Screenshots/lane3_live_race_video_frame1200_open_road.png`
- `manual_artifacts/lane3/Screenshots/lane3_live_race_video_frame1500_stop_sign.png`
- `manual_artifacts/lane3/Screenshots/lane3_live_race_video_frame2500_late_radar.png`

These stills were extracted from the preserved AVI because no separate manual
PNG screenshots were present in `manual_artifacts/lane3/Screenshots/` at
intake time.

## What Was Run

- metadata probe:
  - `ffprobe -v error -show_entries format=duration,size:stream=codec_name,width,height,r_frame_rate,nb_frames -of default=noprint_wrappers=1 manual_artifacts/lane3/lane3_live_race_video.avi`
- sparse still extraction:
  - `ffmpeg -y -i manual_artifacts/lane3/lane3_live_race_video.avi -vf "select='eq(n,0)+eq(n,600)+eq(n,1200)+eq(n,1800)+eq(n,2400)',setpts=N/FRAME_RATE/TB" -fps_mode vfr manual_artifacts/lane3/Screenshots/lane3_live_race_video_%03d.png`
- tail still extraction:
  - `ffmpeg -y -i manual_artifacts/lane3/lane3_live_race_video.avi -vf "select='eq(n,1500)+eq(n,2100)+eq(n,2500)+eq(n,2620)',setpts=N/FRAME_RATE/TB" -fps_mode vfr manual_artifacts/lane3/Screenshots/lane3_live_race_video_tail_%03d.png`
- contact sheet:
  - `ffmpeg -y -i manual_artifacts/lane3/lane3_live_race_video.avi -vf "fps=1/5,scale=256:224,tile=3x2" -frames:v 1 manual_artifacts/lane3/Screenshots/lane3_live_race_video_contact_sheet.png`

## Video Read

- the clip is a real continuity proof from `live_race_mid`, not only a single
  still-frame annotation
- the early run matches the prior human note:
  - `Porsche 959` cockpit base
  - active radar strip at the top
  - straight opening road with centered yellow divider
  - green traffic car near the player's right on the opening frame
- the open-road stills and contact sheet add stronger world-shape evidence:
  - left/right bends are visible
  - the road surface shows crest/depression style changes
  - roadside vegetation and mountain silhouettes stay on the moving world side,
    not the stable cockpit/HUD base
- the checkpoint/post sequence is now visually preserved, not text-only:
  - a visible `STOP` sign appears before the service area
  - the contact sheet shows the gas-station/post exterior from the same run
  - black intermediate frames between that stop and the later driving segment
    fit a transition/fade and should not be read as failed extraction
- the late resumed driving segment preserves a stronger radar event:
  - the opening frame already has the normal active marker
  - the later frame now shows an extra colored top-strip marker compared with
    the opening stills
  - that fits the user's note that police arrive late with a third radar
    marker and siren

## Practical Reading

- Lane 3 now has a preserved human-visual continuity artifact, not only manual
  prose, for this seed family
- the strongest direct gain is for later HUD/radar archaeology:
  - stop-sign/checkpoint progression is now a stable visual milestone
  - the late extra radar marker is preserved in a local still, so future work
    can compare it against `state_11f3`, `oam_0730`, and the narrowed
    `L01318D` producer cluster without depending on memory alone
