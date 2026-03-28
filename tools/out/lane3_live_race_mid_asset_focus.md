# Gameplay Asset Focus Report: `lane3_live_race_mid`

- Note date: `2026-03-28`
- Source seed: `manual_artifacts/lane3/lane3_live_race_mid.mss`
- Frame anchor: `3`
- Goal:
  promote a gameplay-first asset inventory so later lane-3 work can trace steering, traffic, checkpoint, radar, and police behavior against the right visible owner instead of mixing menu/front-end evidence into gameplay

## Supporting Visual Artifacts

- visible frame: `manual_artifacts/lane3/Screenshots/lane3_live_race_video_frame0000_start.png`
- isolated `BG1`: `tools/out/lane3_live_race_mid_bg1.ppm`
- isolated `BG2`: `tools/out/lane3_live_race_mid_bg2.ppm`
- isolated `OBJ`: `tools/out/lane3_live_race_mid_obj.ppm`

## Current Reading

- Visible gameplay stack on this sample is BG1 + BG2 + OBJ, not BG1 + BG2 + BG3 + OBJ.
- BG1 stays scroll-stable across sampled visible scanlines and is the current best cockpit/HUD-base candidate.
- BG2 varies per scanline and is the current best road/world raster layer candidate.
- BG3 exists in VRAM state but is not enabled on main or sub screens in this sample.
- The active live-race frame stays inside 02:9016 / 01:96A0 while repeatedly rewriting $22/$23 and then writing BG2VOFS from those operands.
- The next-IRQ pointer flips between 01:960D and 01:96A0 inside the frame, so gameplay uses a two-phase IRQ split rather than a single static visible pass.
- BG2 registers are written across most visible scanlines, while BG1 writes only land at the deeper split and frame edge and BG3 writes cluster around the early top-strip split.
- This supports using the user debugger observation as a guide: BG1 is a strong cockpit-base candidate, BG2 is the strongest road/world raster candidate, and BG3 looks more like a temporary strip/auxiliary layer in this confirmed sample than the full gameplay world layer.
- Caveat kept: Static single-state BG2 rendering falls back to backdrop, which fits a per-scanline/rasterized layer rather than disproving BG2 visibility.

## Layer Inventory

| Surface | Role | Visibility | VRAM anchor | Why this matters | First trace targets |
|---|---|---|---|---|---|
| BG1 | cockpit / dashboard / HUD base | main-screen visible | 0x0000 / 0x3000 | Stable scroll across sampled visible scanlines.; Static render keeps 48026 non-backdrop pixels.; Tilemap uses 458 unique tiles across 2048 entries. | BG1HOFS, BG1VOFS, TMAIN @ scanline 120 |
| BG2 | road / horizon / world raster | main-screen visible | 0x0800 / 0x2000 | Per-scanline scroll changes while staying enabled on the main screen.; BG2VOFS/BG2HOFS receive 246/246 writes.; BG2VOFS touches 123 sampled scanlines across 0..226.; Tilemap is low-variety (66 unique tiles / 4096 entries), which fits a repeating road surface. | $22/$23, BG2HOFS, BG2VOFS, next_irq_ptr, VTIMEL, dp_0020/0022, 01:9185 -> 02:9165, 02:B18D, 02:B134 (L012BE2), 02:B101 -> L012D5A |
| OBJ | traffic / radar markers / dynamic actors / HUD details | main-screen visible | 0x6000 / 0x1000 | OBJ render reports 37 visible sprites and 1665 drawn pixels.; Static OBJ bbox is [38, 18, 234, 175].; Existing lane-3 ownership notes already close rival/radar state into OAM output. | state_11f3, oam_0730, state_09a2, state_09a8, dp_0053/0054, 00:95BD, OAM DMA / OAMDATA |
| BG3 | top-strip / split-phase auxiliary layer | transient only | 0x1800 / 0x5000 | Not enabled on the visible main screen in the base gameplay sample.; Temporarily enabled by TMAIN at scanline 23 before the later split returns to BG1+BG2+OBJ.; Tilemap keeps 177 unique tiles across 2048 entries, which fits a lighter helper surface than the road plane. | TMAIN, BG3HOFS, BG3VOFS, VTIMEL @ scanline 23/24 |

## Behavior Watchlist

| Behavior | Expected visual owner | Watch first | Why |
|---|---|---|---|
| steering / curvature / lane motion | BG2 first, then mixed with OBJ only if traffic overlaps | $22/$23, dp_0020/0022, BG2HOFS/BG2VOFS, next_irq_ptr, 01:9185 -> 02:9165 -> 02:B18D, 02:B134 / 02:B101 | These are the already-proven producer-side operands and emitters behind the raster road surface. |
| traffic / green car / police arrival | OBJ | state_09a2, state_09a8, dp_0053/0054, oam_0730, OAM DMA / OAMDATA | Dynamic actors and late radar/police markers already land in the OAM-side workload. |
| rival radar / top-strip alerts | OBJ with transient BG3/TMAIN support | state_11f3, oam_0730, TMAIN, BG3HOFS/BG3VOFS | The rival marker path is already closed as state_11f3 -> oam_0730, while BG3 only joins briefly at the top split. |
| cockpit / wheel pose / dashboard stability | BG1 base, possibly with small OBJ overlays | BG1HOFS, BG1VOFS, frame-to-frame capture compare | BG1 is the stable full-screen layer in the gameplay sample and is the best current cockpit anchor. |
| checkpoint / STOP sign / post-stop fade | mixed BG2 + OBJ + transient strip control | $22/$23, BG2HOFS/BG2VOFS, state_09a2, state_09a8, dp_0053/0054, TMAIN | The preserved video suggests a mixed surface rather than one pure layer, so the next good move is a later-frame asset report on the same scheme. |

## Separation Rule

- Keep this report tied only to the confirmed live-race seed and its direct gameplay artifacts.
- Do not reuse front-end car-presentation helpers or attract-mode screenshots to classify gameplay surfaces.
- The point of this report is the same one that helped lane 2 move faster: emit concrete visual buckets first, then trace memory/VRAM against those buckets instead of tracing blind.

## Next Best Step

- Re-run this same report shape on at least one later gameplay moment from the preserved video or a live-entry capture, especially checkpoint/police windows.
- Pair the behavior watchlist above with the live-entry route so steering, traffic, and opponent/no-opponent variants can be compared on the same taxonomy.
