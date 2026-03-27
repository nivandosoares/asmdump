# game_11.mss Seed Surface Audit

- Seed classification: `front_end_menu_seed`
- No-input main callback: `02:9016`
- No-input `$1C6A`: `[1]`
- No-input `$0202`: `[65535]`

## Visual reading

- `game11_a_hold_frame_060.png` is gameplay-like cockpit imagery.
- `game11_a_hold_frame_219.png` is the top-level signboard menu again.
- So this seed can traverse gameplay-like presentation surfaces without becoming verified gameplay state.

## Probe reading

- `a_hold` and `a+b` keep `$1C6A = 1`, `$1C70 = 0`, `$1C76 = 1`, `$0202 = 0xFFFF` through sampled frames `0/60/62/159/219/229`.
- The only early cross-scenario state delta found by the sampled probe is `state_0960` from frame `60` onward.
- By frame `219`, both scenarios are already on `01:BAB3` with the same tracked selector fields.

## Practical reading

- `game_11.mss` must not be promoted as a verified gameplay seed.
- The existing `v3_ab_compare` divergence at frame `219` is front-end/menu-bound until a true gameplay seed is recovered.
