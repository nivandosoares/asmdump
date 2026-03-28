# Track 1 Live-Race Native Visible Layers

This note records the promoted gameplay-native layer extraction path from real
live-race savestates instead of a long power-on replay.

## Command Path

Native extraction from the preserved gameplay seeds:

```sh
MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release \
./tools/run_mesen_ppu_extract.sh \
  --rom ./game.smc \
  --load-state manual_artifacts/lane3/lane3_live_race_mid.mss \
  --frame 0 \
  --frame-is-offset \
  --out-dir tools/out/mesen_lane3_live_race_mid_native \
  --frame-timeout-seconds 60

MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release \
./tools/run_mesen_ppu_extract.sh \
  --rom ./game.smc \
  --load-state manual_artifacts/lane3/lane3_live_race_plus30f.mss \
  --frame 0 \
  --frame-is-offset \
  --out-dir tools/out/mesen_lane3_live_race_plus30f_native \
  --frame-timeout-seconds 60
```

Bundle promotion with both the old state-facing render path and the new native
visible-layer path:

```sh
python3 tools/build_gameplay_frame_bundle.py \
  --label lane3_live_race_mid_native \
  --frame 16655 \
  --vram tools/out/mesen_lane3_live_race_mid_native/vram.bin \
  --cgram tools/out/mesen_lane3_live_race_mid_native/cgram.bin \
  --ppu-state tools/out/mesen_lane3_live_race_mid_native/ppu_state.json \
  --oam tools/out/mesen_lane3_live_race_mid_native/oam.bin \
  --native-frame-dir tools/out/mesen_lane3_live_race_mid_native \
  --out-dir tools/out/lane3_live_race_mid_native_bundle

python3 tools/build_gameplay_frame_bundle.py \
  --label lane3_live_race_plus30f_native \
  --frame 17495 \
  --vram tools/out/mesen_lane3_live_race_plus30f_native/vram.bin \
  --cgram tools/out/mesen_lane3_live_race_plus30f_native/cgram.bin \
  --ppu-state tools/out/mesen_lane3_live_race_plus30f_native/ppu_state.json \
  --oam tools/out/mesen_lane3_live_race_plus30f_native/oam.bin \
  --native-frame-dir tools/out/mesen_lane3_live_race_plus30f_native \
  --out-dir tools/out/lane3_live_race_plus30f_native_bundle
```

## Promoted Artifacts

- Native raw frame dir:
  `tools/out/mesen_lane3_live_race_mid_native/`
- Native raw frame dir:
  `tools/out/mesen_lane3_live_race_plus30f_native/`
- Gameplay bundle with native visible surfaces:
  `tools/out/lane3_live_race_mid_native_bundle/`
- Gameplay bundle with native visible surfaces:
  `tools/out/lane3_live_race_plus30f_native_bundle/`

Key promoted PNGs for review:

- `tools/out/lane3_live_race_mid_native_bundle/bg1_visible_native.png`
- `tools/out/lane3_live_race_mid_native_bundle/bg2_visible_native.png`
- `tools/out/lane3_live_race_mid_native_bundle/bg3_visible_native.png`
- `tools/out/lane3_live_race_mid_native_bundle/sprites_screen_native.png`
- `tools/out/lane3_live_race_mid_native_bundle/main_visible_native.png`
- `tools/out/lane3_live_race_plus30f_native_bundle/bg1_visible_native.png`
- `tools/out/lane3_live_race_plus30f_native_bundle/bg2_visible_native.png`
- `tools/out/lane3_live_race_plus30f_native_bundle/bg3_visible_native.png`
- `tools/out/lane3_live_race_plus30f_native_bundle/sprites_screen_native.png`
- `tools/out/lane3_live_race_plus30f_native_bundle/main_visible_native.png`

## Closed Read

- Both preserved gameplay seeds now close the same native layer family:
  `BG2 visible` yields the road/pista surface, `BG3 visible` yields the
  scenery/horizon layer, and `sprites_screen` yields the dynamic `OBJ`
  surface.
- The second-seed replicate is no longer open on the native path:
  `lane3_live_race_plus30f.mss` produces valid `BG1/BG2/BG3/OBJ` outputs just
  like `lane3_live_race_mid.mss`.
- The remaining gameplay-native blocker is now better fenced:
  `main_visible.ppm` and `sub_visible.ppm` are byte-identical all-black
  outputs on both seeds, while the other visible-layer outputs differ
  normally between the two captures.
- Practical reading:
  the open issue is the composed gameplay `main/sub` export on this native
  path, not the existence of separable gameplay layers.

## Practical Rule

- When exact gameplay layer review is needed, prefer the native
  `mesen_ppu_extract` path from a preserved savestate.
- Use `build_gameplay_frame_bundle.py --native-frame-dir ...` to keep those
  native visible layers inside the same review bundle as the old state-facing
  render outputs.
- The bundle now writes `native_visible_checks.json` and mirrors the same
  summary under `bundle_manifest.json`, so fully black native artifacts are
  flagged explicitly instead of being mistaken for valid layer renders.
- Keep the older bundle outputs (`bg1.png`, `bg2.png`, `obj.png`) as technical
  correlation surfaces for `VRAM/CGRAM/PPU state`.
- Keep `main.png` as the current whole-scene renderer-facing fallback when a
  composed review surface is needed.
- Keep `world_visible_support.png` only as a fallback when no native gameplay
  extraction exists for the frame under review.
- Treat `main_visible_native.png` as a known boundary artifact until the
  gameplay-native composed-screen export is explained or replaced.

## Visual Check

Use the artifact panel in the wiki entry for direct image review of these
native PNGs:

- `tools/out/lane3_live_race_mid_native_bundle/bg2_visible_native.png`
- `tools/out/lane3_live_race_mid_native_bundle/bg3_visible_native.png`
- `tools/out/lane3_live_race_mid_native_bundle/sprites_screen_native.png`
- `tools/out/lane3_live_race_mid_native_bundle/main_visible_native.png`
- `tools/out/lane3_live_race_plus30f_native_bundle/bg2_visible_native.png`
- `tools/out/lane3_live_race_plus30f_native_bundle/bg3_visible_native.png`
- `tools/out/lane3_live_race_plus30f_native_bundle/sprites_screen_native.png`
- `tools/out/lane3_live_race_plus30f_native_bundle/main_visible_native.png`

## Next Gate

- Either explain/fix the gameplay-native composed `main/sub` export path, or
  continue gameplay mapping while treating `BG2/BG3/OBJ` as the trusted native
  surfaces and `main_visible_native` as fenced.
