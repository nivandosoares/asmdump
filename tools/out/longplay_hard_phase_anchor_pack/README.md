# Longplay Hard-Phase Anchor Pack

Representative later gameplay phases from the local longplay: night, bridge, mountain-wall/no-shoulder, tunnel, and rain.

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
  - `tools/out/longplay_hard_phase_anchor_pack/anchor_sheet.png`

## Phases

### 1. Night Driving

- phase id: `night_start`
- anchor: `00:24:13.000` (`1453.000s`)
- window: `00:24:10.000` .. `00:24:18.000`
- note: The roadmap anchor `24:11` lands on the end-of-section transition; the first clean night-driving still in the same local window appears around `24:13`.
- artifacts:
  - `tools/out/longplay_hard_phase_anchor_pack/01_night_start_anchor.png`
  - `tools/out/longplay_hard_phase_anchor_pack/01_night_start_window.png`

### 2. Bridge Crossing

- phase id: `bridge_crossing`
- anchor: `00:30:32.000` (`1832.000s`)
- window: `00:30:30.000` .. `00:30:36.000`
- note: Bridge/water crossing with mountain horizon and traffic on the right lane.
- artifacts:
  - `tools/out/longplay_hard_phase_anchor_pack/02_bridge_crossing_anchor.png`
  - `tools/out/longplay_hard_phase_anchor_pack/02_bridge_crossing_window.png`

### 3. Mountain Wall / No-Shoulder Corridor

- phase id: `mountain_wall`
- anchor: `00:33:24.000` (`2004.000s`)
- window: `00:33:18.000` .. `00:33:26.000`
- note: Representative visible still for the hard mountain corridor with the left stone wall and no right shoulder; the roadmap `33:40` anchor quickly collapses into the tunnel in this recording.
- artifacts:
  - `tools/out/longplay_hard_phase_anchor_pack/03_mountain_wall_anchor.png`
  - `tools/out/longplay_hard_phase_anchor_pack/03_mountain_wall_window.png`

### 4. Tunnel Run

- phase id: `tunnel_run`
- anchor: `00:34:18.000` (`2058.000s`)
- window: `00:34:16.000` .. `00:34:22.000`
- note: Tunnel driving segment with traffic already visible inside the dark corridor.
- artifacts:
  - `tools/out/longplay_hard_phase_anchor_pack/04_tunnel_run_anchor.png`
  - `tools/out/longplay_hard_phase_anchor_pack/04_tunnel_run_window.png`

### 5. Rain Segment

- phase id: `rain_segment`
- anchor: `00:45:18.000` (`2718.000s`)
- window: `00:45:16.000` .. `00:45:22.000`
- note: Late hard-phase rain scene with visible droplets on the windshield and traffic ahead.
- artifacts:
  - `tools/out/longplay_hard_phase_anchor_pack/05_rain_segment_anchor.png`
  - `tools/out/longplay_hard_phase_anchor_pack/05_rain_segment_window.png`
