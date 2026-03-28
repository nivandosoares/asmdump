# Gameplay Bundle Compare: `brake_3250` vs `brake_3400`

- `brake_3250` frame: `3250`
- `brake_3400` frame: `3400`
- `brake_3250` screenshot: `tools/out/lane3_live_entry_brake_traffic_frame03250_bundle/frame.png`
- `brake_3400` screenshot: `tools/out/lane3_live_entry_brake_traffic_frame03400_bundle/frame.png`

## Visual Anchors

- `brake_3250` screenshot-derived background stack support: `tools/out/lane3_live_entry_brake_traffic_frame03250_bundle/bg_stack_visible_support.png`
- `brake_3250` screenshot-derived world support: `tools/out/lane3_live_entry_brake_traffic_frame03250_bundle/world_visible_support.png`
- `brake_3250` `BG1`: `tools/out/lane3_live_entry_brake_traffic_frame03250_bundle/bg1.png`
- `brake_3250` `BG2`: `tools/out/lane3_live_entry_brake_traffic_frame03250_bundle/bg2.png`
- `brake_3250` `OBJ`: `tools/out/lane3_live_entry_brake_traffic_frame03250_bundle/obj.png`
- `brake_3400` screenshot-derived background stack support: `tools/out/lane3_live_entry_brake_traffic_frame03400_bundle/bg_stack_visible_support.png`
- `brake_3400` screenshot-derived world support: `tools/out/lane3_live_entry_brake_traffic_frame03400_bundle/world_visible_support.png`
- `brake_3400` `BG1`: `tools/out/lane3_live_entry_brake_traffic_frame03400_bundle/bg1.png`
- `brake_3400` `BG2`: `tools/out/lane3_live_entry_brake_traffic_frame03400_bundle/bg2.png`
- `brake_3400` `OBJ`: `tools/out/lane3_live_entry_brake_traffic_frame03400_bundle/obj.png`

## Current Reading

- BG1/BG2/BG3 tilemap stats stay unchanged while OBJ alone changes, so the strongest current fit is a pure actor/event update over a stable road/cockpit background stack.
- OBJ workload changes across the pair, so dynamic actor/overlay work contributes materially to the visible transition.

## Key Deltas

| Surface | brake_3250 | brake_3400 | Same? |
|---|---|---|---|
| BG1 tilemap stats | `{'entry_count': 2048, 'unique_tiles': 458, 'non_zero_tiles': 1350, 'top_tiles': [{'tileIndex': 0, 'count': 698}, {'tileIndex': 337, 'count': 97}, {'tileIndex': 114, 'count': 38}, {'tileIndex': 13, 'count': 21}, {'tileIndex': 14, 'count': 21}]}` | `{'entry_count': 2048, 'unique_tiles': 458, 'non_zero_tiles': 1350, 'top_tiles': [{'tileIndex': 0, 'count': 698}, {'tileIndex': 337, 'count': 97}, {'tileIndex': 114, 'count': 38}, {'tileIndex': 13, 'count': 21}, {'tileIndex': 14, 'count': 21}]}` | `True` |
| BG2 tilemap stats | `{'entry_count': 4096, 'unique_tiles': 66, 'non_zero_tiles': 1536, 'top_tiles': [{'tileIndex': 0, 'count': 2560}, {'tileIndex': 8, 'count': 792}, {'tileIndex': 66, 'count': 388}, {'tileIndex': 2, 'count': 120}, {'tileIndex': 132, 'count': 24}]}` | `{'entry_count': 4096, 'unique_tiles': 66, 'non_zero_tiles': 1536, 'top_tiles': [{'tileIndex': 0, 'count': 2560}, {'tileIndex': 8, 'count': 792}, {'tileIndex': 66, 'count': 388}, {'tileIndex': 2, 'count': 120}, {'tileIndex': 132, 'count': 24}]}` | `True` |
| BG3 tilemap stats | `{'entry_count': 2048, 'unique_tiles': 177, 'non_zero_tiles': 1007, 'top_tiles': [{'tileIndex': 0, 'count': 1041}, {'tileIndex': 176, 'count': 832}, {'tileIndex': 1, 'count': 1}, {'tileIndex': 2, 'count': 1}, {'tileIndex': 3, 'count': 1}]}` | `{'entry_count': 2048, 'unique_tiles': 177, 'non_zero_tiles': 1007, 'top_tiles': [{'tileIndex': 0, 'count': 1041}, {'tileIndex': 176, 'count': 832}, {'tileIndex': 1, 'count': 1}, {'tileIndex': 2, 'count': 1}, {'tileIndex': 3, 'count': 1}]}` | `True` |
| OBJ workload | `{'visible_sprites': 37, 'drawn_pixels': 1138}` | `{'visible_sprites': 41, 'drawn_pixels': 2117}` | `False` |
| BG2 layer state | `{'layer_index': 1, 'tilemapAddress': 2048, 'chrAddress': 8192, 'doubleWidth': True, 'doubleHeight': True, 'largeTiles': True, 'hscroll': 261, 'vscroll': 283}` | `{'layer_index': 1, 'tilemapAddress': 2048, 'chrAddress': 8192, 'doubleWidth': True, 'doubleHeight': True, 'largeTiles': True, 'hscroll': 261, 'vscroll': 283}` | `True` |

## Practical Fit

- For gameplay packs, prefer `world_visible_support.png` when the goal is human labeling of road/background content. It is screenshot-derived and preserves the exact visible world even when the raw `BG2` render is only a static-state approximation.
- If `BG2` stats hold while `BG1` and `OBJ` change, the right next memory targets are overlay/collision-side fields before widening the road emitter search again.
- If a future pair flips `BG2` too, that will be the better moment to reopen pure road/world provenance inside `L01318D`.
