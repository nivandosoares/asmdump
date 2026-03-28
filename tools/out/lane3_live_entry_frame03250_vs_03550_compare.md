# Gameplay Bundle Compare: `live_entry_3250` vs `live_entry_3550`

- `live_entry_3250` frame: `3250`
- `live_entry_3550` frame: `3550`
- `live_entry_3250` screenshot: `tools/out/lane3_live_entry_frame03250_bundle/frame.png`
- `live_entry_3550` screenshot: `tools/out/lane3_live_entry_frame03550_bundle/frame.png`

## Visual Anchors

- `live_entry_3250` `BG1`: `tools/out/lane3_live_entry_frame03250_bundle/bg1.png`
- `live_entry_3250` `BG2`: `tools/out/lane3_live_entry_frame03250_bundle/bg2.png`
- `live_entry_3250` `OBJ`: `tools/out/lane3_live_entry_frame03250_bundle/obj.png`
- `live_entry_3550` `BG1`: `tools/out/lane3_live_entry_frame03550_bundle/bg1.png`
- `live_entry_3550` `BG2`: `tools/out/lane3_live_entry_frame03550_bundle/bg2.png`
- `live_entry_3550` `OBJ`: `tools/out/lane3_live_entry_frame03550_bundle/obj.png`

## Current Reading

- BG2 tilemap stats stay unchanged while BG1 changes, so the strongest current fit is that the road/world plane persists and the later overlay loads onto the cockpit/HUD side.
- OBJ workload changes across the pair, so dynamic actor/overlay work contributes materially to the visible transition.
- BG2 scroll operands continue moving across the pair, which keeps the world/road layer live even though the later frame is visually dominated by the crash overlay.

## Key Deltas

| Surface | live_entry_3250 | live_entry_3550 | Same? |
|---|---|---|---|
| BG1 tilemap stats | `{'entry_count': 2048, 'unique_tiles': 458, 'non_zero_tiles': 1350, 'top_tiles': [{'tileIndex': 0, 'count': 698}, {'tileIndex': 337, 'count': 97}, {'tileIndex': 114, 'count': 38}, {'tileIndex': 13, 'count': 21}, {'tileIndex': 14, 'count': 21}]}` | `{'entry_count': 2048, 'unique_tiles': 566, 'non_zero_tiles': 1732, 'top_tiles': [{'tileIndex': 0, 'count': 316}, {'tileIndex': 640, 'count': 242}, {'tileIndex': 337, 'count': 97}, {'tileIndex': 114, 'count': 38}, {'tileIndex': 13, 'count': 21}]}` | `False` |
| BG2 tilemap stats | `{'entry_count': 4096, 'unique_tiles': 66, 'non_zero_tiles': 1536, 'top_tiles': [{'tileIndex': 0, 'count': 2560}, {'tileIndex': 8, 'count': 792}, {'tileIndex': 66, 'count': 388}, {'tileIndex': 2, 'count': 120}, {'tileIndex': 132, 'count': 24}]}` | `{'entry_count': 4096, 'unique_tiles': 66, 'non_zero_tiles': 1536, 'top_tiles': [{'tileIndex': 0, 'count': 2560}, {'tileIndex': 8, 'count': 792}, {'tileIndex': 66, 'count': 388}, {'tileIndex': 2, 'count': 120}, {'tileIndex': 132, 'count': 24}]}` | `True` |
| BG3 tilemap stats | `{'entry_count': 2048, 'unique_tiles': 177, 'non_zero_tiles': 1007, 'top_tiles': [{'tileIndex': 0, 'count': 1041}, {'tileIndex': 176, 'count': 832}, {'tileIndex': 1, 'count': 1}, {'tileIndex': 2, 'count': 1}, {'tileIndex': 3, 'count': 1}]}` | `{'entry_count': 2048, 'unique_tiles': 177, 'non_zero_tiles': 1007, 'top_tiles': [{'tileIndex': 0, 'count': 1041}, {'tileIndex': 176, 'count': 832}, {'tileIndex': 1, 'count': 1}, {'tileIndex': 2, 'count': 1}, {'tileIndex': 3, 'count': 1}]}` | `True` |
| OBJ workload | `{'visible_sprites': 31, 'drawn_pixels': 916}` | `{'visible_sprites': 25, 'drawn_pixels': 1961}` | `False` |
| BG2 layer state | `{'layer_index': 1, 'tilemapAddress': 2048, 'chrAddress': 8192, 'doubleWidth': True, 'doubleHeight': True, 'largeTiles': True, 'hscroll': 213, 'vscroll': 27}` | `{'layer_index': 1, 'tilemapAddress': 2048, 'chrAddress': 8192, 'doubleWidth': True, 'doubleHeight': True, 'largeTiles': True, 'hscroll': 263, 'vscroll': 283}` | `False` |

## Practical Fit

- If `BG2` stats hold while `BG1` and `OBJ` change, the right next memory targets are overlay/collision-side fields before widening the road emitter search again.
- If a future pair flips `BG2` too, that will be the better moment to reopen pure road/world provenance inside `L01318D`.
