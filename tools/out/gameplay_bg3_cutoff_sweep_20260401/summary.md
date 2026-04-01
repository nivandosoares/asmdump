# Gameplay BG3 Cutoff Sweep

| Bundle | Current main changed | Current main SAD | Best cutoff | Candidate changed | Candidate SAD | Improvement |
|---|---:|---:|---:|---:|---:|---:|
| `tools/out/lane3_live_entry_frame03250_bundle` | 17042 | 4813358 | 79 | 15635 | 4285002 | 528356 |
| `tools/out/lane3_live_entry_brake_traffic_frame03400_bundle` | 17047 | 4425905 | 79 | 15729 | 3791435 | 634470 |
| `tools/out/lane3_live_entry_frame03550_bundle` | 17216 | 4751245 | 95 | 17801 | 3983097 | 768148 |

Interpretation
- `current main`: the tracked bundle `main.png` versus `bg_stack_visible_support.png`.
- `best cutoff`: top-band height where `BG3` sits above `BG2`; below that it falls back under `BG2`.
- `candidate`: the best mixed stack built from tracked `bg1/bg2/bg3` bundle layers.
