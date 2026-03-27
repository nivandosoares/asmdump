# Post-029016 Compare Summary

- window: `2048..2088` sampled every `4` frames
- packs: `post9016_default_rival_capture` vs `post9016_no_opponent_clock_capture`
- first nonzero sampled diff: frame `2048` (capture_frame_00000.png)
- diff pixels at first nonzero sample: `125`
- diff bounding box at first nonzero sample: `(11, 11, 194, 21)`
- practical visual read: the earliest stable delta is confined to the top radar/HUD strip; the default-rival lane shows an extra red opponent marker that is absent in the no-opponent lane.
- human review refinement: the user also reports rival blinking lights in the
  rearview as the first meaningful cue; lower cockpit and road content stay
  unchanged in this window, and the observed split disappears with OAM off.

| Boot frame | PNG | Diff pixels | Bounding box |
|---|---|---:|---|
| `2048` | `capture_frame_00000.png` | `125` | `(11, 11, 194, 21)` |
| `2052` | `capture_frame_00004.png` | `137` | `(11, 11, 194, 21)` |
| `2056` | `capture_frame_00008.png` | `125` | `(11, 11, 194, 21)` |
| `2060` | `capture_frame_00012.png` | `125` | `(11, 11, 194, 21)` |
| `2064` | `capture_frame_00016.png` | `125` | `(11, 11, 194, 21)` |
| `2068` | `capture_frame_00020.png` | `125` | `(11, 11, 194, 21)` |
| `2072` | `capture_frame_00024.png` | `125` | `(11, 11, 194, 21)` |
| `2076` | `capture_frame_00028.png` | `125` | `(11, 11, 194, 21)` |
| `2080` | `capture_frame_00032.png` | `125` | `(11, 11, 194, 21)` |
| `2084` | `capture_frame_00036.png` | `137` | `(11, 11, 194, 21)` |
| `2088` | `capture_frame_00040.png` | `125` | `(11, 11, 194, 21)` |
