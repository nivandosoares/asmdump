# Lane 3 Service and Partial-Results Phase Pack

Promote the previously unseen service/post corridor from the preserved live-race AVI: checkpoint stop, gas-station exterior, attendant dialog, partial-results screen, and the next checkpoint restart.

- Source video:
  - `manual_artifacts/lane3/lane3_live_race_video.avi`
- Video metadata:
  - `{
  "programs": [],
  "streams": [
    {
      "index": 0,
      "codec_name": "cscd",
      "codec_type": "video",
      "width": 256,
      "height": 224,
      "r_frame_rate": "60098811/1000000",
      "avg_frame_rate": "60098811/1000000",
      "nb_frames": "2636"
    },
    {
      "index": 1,
      "codec_name": "pcm_s16le",
      "codec_type": "audio",
      "r_frame_rate": "0/0",
      "avg_frame_rate": "0/0",
      "nb_frames": "2104535"
    }
  ],
  "format": {
    "duration": "43.861101",
    "size": "10680624"
  },
  "source": "manual_artifacts/lane3/lane3_live_race_video.avi"
}`
- Anchor sheet:
  - `tools/out/lane3_service_status_phase_pack/anchor_sheet.png`

## Phases

### 1. Checkpoint STOP Sign Boundary

- phase id: `stop_sign_boundary`
- anchor: `00:00:24.960` (`24.960s`)
- window: `00:00:24.000` .. `00:00:27.000`
- note: Last driving-side boundary before the black transition into the service/post corridor.
- artifacts:
  - `tools/out/lane3_service_status_phase_pack/01_stop_sign_boundary_anchor.png`
  - `tools/out/lane3_service_status_phase_pack/01_stop_sign_boundary_window.png`

### 2. Gas-Station Exterior

- phase id: `gas_station_exterior`
- anchor: `00:00:31.500` (`31.500s`)
- window: `00:00:30.000` .. `00:00:33.000`
- note: Exterior service/post view preserved directly from the local live-race continuity clip.
- artifacts:
  - `tools/out/lane3_service_status_phase_pack/02_gas_station_exterior_anchor.png`
  - `tools/out/lane3_service_status_phase_pack/02_gas_station_exterior_window.png`

### 3. Attendant Dialog

- phase id: `attendant_dialog`
- anchor: `00:00:31.750` (`31.750s`)
- window: `00:00:31.000` .. `00:00:34.000`
- note: Dialogue scene with the frentista beside the car; this was previously present only in the human note.
- artifacts:
  - `tools/out/lane3_service_status_phase_pack/03_attendant_dialog_anchor.png`
  - `tools/out/lane3_service_status_phase_pack/03_attendant_dialog_window.png`

### 4. Partial-Results Screen

- phase id: `partial_results`
- anchor: `00:00:34.000` (`34.000s`)
- window: `00:00:32.000` .. `00:00:38.000`
- note: Mid-race section summary shown after the frentista scene.
- artifacts:
  - `tools/out/lane3_service_status_phase_pack/04_partial_results_anchor.png`
  - `tools/out/lane3_service_status_phase_pack/04_partial_results_window.png`

### 5. Next Checkpoint Restart

- phase id: `next_checkpoint_restart`
- anchor: `00:00:41.000` (`41.000s`)
- window: `00:00:40.000` .. `00:00:43.000`
- note: The same local clip returns to live driving after the partial-results sequence, closing the next checkpoint start.
- artifacts:
  - `tools/out/lane3_service_status_phase_pack/05_next_checkpoint_restart_anchor.png`
  - `tools/out/lane3_service_status_phase_pack/05_next_checkpoint_restart_window.png`
