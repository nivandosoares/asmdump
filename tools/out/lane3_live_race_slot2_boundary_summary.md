# Lane 3 Slot2 Boundary Summary

- Source seed: `manual_artifacts/lane3/lane3_live_race_slot2_extra.mss`
- Frame: `0`
- Boot probe callback surface:
  - `main = 00:8029`
  - `irq = 00:835F`
  - `nmi = 00:8029`
- Frame-`0` selector/state surface:
  - `$1C6A = 0`
  - `$1C70 = 0`
  - `$1C76 = 0`
  - `$0202 = 0`
  - `$09A2 = 0`
  - `$09A8 = 2`
  - `$11F3 = 0`
  - `dp_0053/0054 = 0/0`
- PPU read from the raw dump:
  - `bgMode = 1`
  - `mainLayers = 0x04` -> `bg3`
  - `subLayers = 0x00`
- Scanline scroll read:
  - `BG1 h/v = [0] / [1023]`
  - `BG2 h/v = [0] / [1023]`
  - `BG3 h/v = [0] / [1023]`
- Compare vs `live_race_mid` over frames `0..7`:
  - callback family differs on all `8/8` frames: `00:8029/00:835F/00:8029` vs
    `02:9016/01:96A0/02:8F3C`
  - selector/state surface also differs on all `8/8` frames:
    `$0202 = 0` vs `0xFFFF`, `$1C6A = 0` vs `1`, `$1C76 = 0` vs `1`
  - the live-race workload fields stay flat at `0` here but not on
    `live_race_mid`:
    `$09A2`, `$11F3`, `dp_0053`, `dp_0054`, `oam_0730`
- Current read:
  - slot `#2` is not a second gameplay replicate
  - it is an adjacent front-end / boundary seed
  - do not substitute it for `lane3_live_race_plus30f.mss` when reasoning about
    live-race composition
