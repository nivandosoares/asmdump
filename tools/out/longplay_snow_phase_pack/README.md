# Longplay Snow Phase Pack

Snow-driving anchors from the later longplay corridor, starting at the user-confirmed one-hour mark.

- Source video:
  - `the_duel_longplay.mp4`
- Video metadata:
  - `{
  "programs": [],
  "streams": [
    {
      "index": 0,
      "codec_name": "vp9",
      "codec_type": "video",
      "width": 1280,
      "height": 720,
      "r_frame_rate": "60/1",
      "avg_frame_rate": "312278000/5204633",
      "nb_frames": "312278"
    },
    {
      "index": 1,
      "codec_name": "opus",
      "codec_type": "audio",
      "r_frame_rate": "0/0",
      "avg_frame_rate": "0/0",
      "nb_frames": "260233"
    }
  ],
  "format": {
    "duration": "5204.661000",
    "size": "298768113"
  },
  "source": "the_duel_longplay.mp4"
}`
- Anchor sheet:
  - `tools/out/longplay_snow_phase_pack/anchor_sheet.png`

## Phases

### 1. Snow Onset

- phase id: `snow_onset`
- anchor: `01:00:00.000` (`3600.000s`)
- window: `00:59:58.000` .. `01:00:04.000`
- note: First clear snow gameplay still at the user-confirmed one-hour boundary of the local longplay.
- artifacts:
  - `tools/out/longplay_snow_phase_pack/01_snow_onset_anchor.png`
  - `tools/out/longplay_snow_phase_pack/01_snow_onset_window.png`

### 2. Snow Mountain Curve

- phase id: `snow_mountain_curve`
- anchor: `01:02:20.000` (`3740.000s`)
- window: `01:02:18.000` .. `01:02:24.000`
- note: Later snowy curve with visible snowfall and stronger mountain horizon.
- artifacts:
  - `tools/out/longplay_snow_phase_pack/02_snow_mountain_curve_anchor.png`
  - `tools/out/longplay_snow_phase_pack/02_snow_mountain_curve_window.png`

### 3. Snow Log-Truck Corridor

- phase id: `snow_log_truck`
- anchor: `01:03:20.000` (`3800.000s`)
- window: `01:03:18.000` .. `01:03:24.000`
- note: Later snowy corridor with traffic ahead, including the log truck in the player's lane family.
- artifacts:
  - `tools/out/longplay_snow_phase_pack/03_snow_log_truck_anchor.png`
  - `tools/out/longplay_snow_phase_pack/03_snow_log_truck_window.png`
