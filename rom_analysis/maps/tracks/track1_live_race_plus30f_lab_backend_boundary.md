# Track 1 `live_race_plus30f` Lab Backend Boundary

- Note date: `2026-03-28`
- Primary seed:
  - `manual_artifacts/lane3/lane3_live_race_plus30f.mss`
- Related seed:
  - `manual_artifacts/lane3/lane3_live_race_mid.mss`

## Why This Note Exists

The current Lane 3 handoff still listed the lab backend as the best candidate
for recovering a second technical replicate of `live_race_plus30f`.

This note turns that into a bounded current-state read:

- what absolute frame the seed starts on
- whether the backend can export it today
- what that means for the next dev's work queue

## What Was Run

- smoke test with intentionally wrong range:
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=90 ./validation/run_mesen_lab_backend.sh ./game.smc --load-state manual_artifacts/lane3/lane3_live_race_plus30f.mss --run-range 0:0 --probe-set frame_core_probe,dma_vram_probe --export-dir tools/out/lane3_live_race_plus30f_lab_smoke`
- bounded absolute-frame export attempts:
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=120 ./validation/run_mesen_lab_backend.sh ./game.smc --load-state manual_artifacts/lane3/lane3_live_race_plus30f.mss --run-range 17495:17495 --probe-set frame_core_probe,dma_vram_probe --export-dir tools/out/lane3_live_race_plus30f_lab_17495`
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release MESEN_TIMEOUT_SECONDS=120 ./validation/run_mesen_lab_backend.sh ./game.smc --load-state manual_artifacts/lane3/lane3_live_race_plus30f.mss --run-range 17496:17496 --probe-set frame_core_probe,dma_vram_probe --export-dir tools/out/lane3_live_race_plus30f_lab_17496`
- supporting existing frame anchor:
  - `tools/out/lane3_live_race_mid_bg0_silent_frame_00000_ppu_state.json`

## Artifacts

- `tools/out/lane3_live_race_plus30f_lab_17495/manifest.json`

## Observed Result

- the smoke test already closes the absolute start boundary:
  - `labRunner failed: loaded state starts at frame 17495, which is already past requested start frame 0`
- that means the current absolute start frame of
  `lane3_live_race_plus30f.mss` is now known:
  - `ppu.frameCount = 17495`
- the earlier raw dump already anchors the current absolute frame of
  `lane3_live_race_mid.mss`:
  - `ppu.frameCount = 16655`
- practical implication:
  - the filename `live_race_plus30f` should now be treated as a historical
    label, not as a validated `+30`-frame delta from `live_race_mid`
  - current measured absolute delta between the two preserved seeds is `840`
    PPU frames (`17495 - 16655`)
- both bounded absolute-frame export attempts currently fail on the same
  boundary condition:
  - `labRunner failed: failed to advance beyond frame 17495 after PpuFrame + 2048 PPU correction steps`
- only the `17495` attempt produced a manifest:
  - `captureCompleted = false`
  - `alignedStartBoundary.ppu.frameCount = 17495`

## Current Reading

- this is still a useful advancement even though it is a failed export:
  - it closes the absolute frame anchor of `live_race_plus30f`
  - it demotes the working assumption that the second seed is roughly
    `30` frames after the first
  - it proves the current lab-backend blocker is not “missing savestate
    support”; the backend can load the seed and read its frame boundary
- the blocker is now narrower:
  - the backend fails during its post-load frame-boundary correction step on
    this seed family
- practical consequence for today's work:
  - do not promise `live_race_plus30f` frame exports from the current lab
    backend without first fixing this boundary-correction bug
  - use manual visual exports or human annotations as the immediate fallback
    if a second replicate is needed today

## Next Best Step

- if the next dev stays on tooling:
  - inspect the `labRunner` frame-boundary correction path around savestate
    load and `PpuFrame + 2048` recovery
  - verify whether the same failure reproduces on `live_race_mid` or is
    specific to `live_race_plus30f`
- if the next dev stays on archaeology:
  - keep `live_race_mid` as the primary technical seed
  - treat `live_race_plus30f` as a human-visual replicate first, not as a
    guaranteed machine-export replicate
