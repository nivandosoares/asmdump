# Track 1 Live-Race Native Visible Layers

This note records the first promoted gameplay-native layer extraction from a
real live-race savestate instead of a long power-on replay.

## Command Path

Native extraction from the preserved gameplay seed:

```sh
MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release \
./tools/run_mesen_ppu_extract.sh \
  --rom ./game.smc \
  --load-state manual_artifacts/lane3/lane3_live_race_mid.mss \
  --frame 0 \
  --frame-is-offset \
  --out-dir tools/out/mesen_lane3_live_race_mid_native \
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
```

## Promoted Artifacts

- Native raw frame dir:
  `tools/out/mesen_lane3_live_race_mid_native/`
- Gameplay bundle with native visible surfaces:
  `tools/out/lane3_live_race_mid_native_bundle/`

Key promoted PNGs for review:

- `tools/out/lane3_live_race_mid_native_bundle/bg1_visible_native.png`
- `tools/out/lane3_live_race_mid_native_bundle/bg2_visible_native.png`
- `tools/out/lane3_live_race_mid_native_bundle/bg3_visible_native.png`
- `tools/out/lane3_live_race_mid_native_bundle/sprites_screen_native.png`
- `tools/out/lane3_live_race_mid_native_bundle/main_visible_native.png`

## Closed Read

- `BG2 visible` now closes the gameplay road/pista surface directly from the
  native Mesen extractor.
- `BG3 visible` now closes the gameplay scenery/horizon layer directly from
  the same savestate.
- `sprites_screen` closes the dynamic `OBJ` side with the green car and other
  gameplay actors separated from the background layers.
- This means the previous gameplay blocker is no longer “we do not have
  faithful `BG2/BG3` outputs”; the native extractor does produce them when it
  starts from a preserved gameplay savestate.
- The remaining gameplay-native blocker is narrower:
  `main_visible.ppm` and `sub_visible.ppm` from this same extraction are black,
  even though `BG1/BG2/BG3` and `OBJ` surfaces are valid.
- Practical reading:
  the open issue is now the final composed main-screen export on this native
  path, not the existence of separable gameplay layers.

## Practical Rule

- When exact gameplay layer review is needed, prefer the native
  `mesen_ppu_extract` path from a preserved savestate.
- Use `build_gameplay_frame_bundle.py --native-frame-dir ...` to keep those
  native visible layers inside the same review bundle as the old state-facing
  render outputs.
- Keep the older bundle outputs (`bg1.png`, `bg2.png`, `obj.png`) as technical
  correlation surfaces for `VRAM/CGRAM/PPU state`.
- Keep `world_visible_support.png` only as a fallback when no native gameplay
  extraction exists for the frame under review.

## Visual Check

Use the artifact panel in the wiki entry for direct image review of these
native PNGs:

- `tools/out/lane3_live_race_mid_native_bundle/bg2_visible_native.png`
- `tools/out/lane3_live_race_mid_native_bundle/bg3_visible_native.png`
- `tools/out/lane3_live_race_mid_native_bundle/sprites_screen_native.png`
- `tools/out/lane3_live_race_mid_native_bundle/main_visible_native.png`

## Next Gate

- Promote the same native savestate-backed extraction on
  `lane3_live_race_plus30f.mss`.
- Decide whether the bundle/wiki should hide or explicitly label
  `main_visible_native.png` as a known-black boundary artifact until the native
  composed-screen export is explained.
