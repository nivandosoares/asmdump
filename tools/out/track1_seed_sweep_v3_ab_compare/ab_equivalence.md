# Track 1 A/B Seed Equivalence

- Savestate SHA-256: `17f2857d3309ad99fc87724d131f9b1e7965c1fb5a530f739dedda9f51086b14`
- ROM SHA-256: `53e1a9e17a8b0cffd24946e61a47a6f21e7d85ba32b9436da8705b5e53b1f017`

## Current sweep pairwise compare

- `a_hold` vs `b_hold`: equal_all_frames=`true`, first_capture_diff_index=`None`
- `a_and_b_hold` vs `a_hold`: equal_all_frames=`false`, first_capture_diff_index=`159`
- `a_and_b_hold` vs `b_hold`: equal_all_frames=`false`, first_capture_diff_index=`159`

## Cross-generation compare

- Old promoted `b_hold` vs current `b_hold`: equal_all_frames=`false`
- First differing capture index: `0`
