TD2 extraction proof bundle (frame range)

Generated: 2026-03-06
Source ROM: /home/nivando-soares/asmdump/game.smc
Frames: 1086..1093 (inclusive), step 1

Contents:
- raw_range/
  Raw per-frame Mesen extraction + runtime sequence manifest
  - raw_range/sequence.txt
  - raw_range/sequence.json
- design_pack_range/
  Design-team packs for each frame with decoded tilemaps/sprites metadata
  - design_pack_range/design_pack_range.json
  - design_pack_range/frame_01086/design_pack.json
  - ... through frame_01093
- td2_boot_probe_l001210_summary.json
  Runtime chunk-dispatch summary from L001210 exec trace
- td2_boot_probe_l001210_summary_startb.json
  Alternate scripted-input (`start,b`) runtime chunk-dispatch summary
- bank30_chunk_validation.json
  Bank30 decode validation summary (42FB/26FB/67FB)
- bank30_chunk_registry.json / bank30_chunk_registry.md
  Consolidated bank30 archaeology registry (decode + runtime + unresolved priority)

Quick inspect targets:
- design_pack_range/frame_01090/tilemaps/bg1_tilemap.json
- design_pack_range/frame_01090/sprites/sprites_visible.json
- raw_range/frame_01090/ppu_state.json
- raw_range/frame_01090/vram.bin
