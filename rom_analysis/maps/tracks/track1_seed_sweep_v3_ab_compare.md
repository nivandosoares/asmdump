# Track 1 Seed Sweep `v3_ab_compare`

- Seed savestate: `.mesen-config/Mesen2/SaveStates/game_11.mss`
- Sweep runner:
  - `tools/run_track1_seed_sweep.py`
  - `MESEN_RELEASE_DIR=/home/nivando-soares/Mesen2/bin/linux-x64/Release python3 tools/run_track1_seed_sweep.py --out-dir tools/out/track1_seed_sweep_v3_ab_compare --scenario a_hold=60-359:a --scenario b_hold=60-359:b --scenario a_and_b_hold=60-359:a,b`
- Sweep artifacts:
  - `tools/out/track1_seed_sweep_v3_ab_compare/summary.json`
  - `tools/out/track1_seed_sweep_v3_ab_compare/summary.md`
  - `tools/out/track1_seed_sweep_v3_ab_compare/ab_equivalence.json`
  - `tools/out/track1_seed_sweep_v3_ab_compare/ab_equivalence.md`
  - `tools/out/track1_seed_sweep_v3_ab_compare/ab_first_divergence.json`
  - `tools/out/track1_seed_sweep_v3_ab_compare/ab_first_divergence.md`

## Current Sweep Reading

- Fingerprinted input seed:
  - ROM SHA-256:
    `53e1a9e17a8b0cffd24946e61a47a6f21e7d85ba32b9436da8705b5e53b1f017`
  - savestate SHA-256:
    `17f2857d3309ad99fc87724d131f9b1e7965c1fb5a530f739dedda9f51086b14`
- `a_hold`
  - input windows: `60-359:a`
  - classification: `dynamic`
  - first nontrivial frame: `62`
  - first later motion: `64`
- `b_hold`
  - input windows: `60-359:b`
  - classification: `dynamic`
  - first nontrivial frame: `62`
  - first later motion: `64`
- `a_and_b_hold`
  - input windows: `60-359:a,b`
  - classification: `dynamic`
  - first nontrivial frame: `62`
  - first later motion: `64`
- Seed surface audit:
  - classification: `front_end_menu_seed`
  - no-input main callback: `02:9016`
  - selector fields: `$1C6A = [1]`, `$1C70 = [0]`, `$0202 = [65535]`

## Seed Audit Reading

- The no-input audit does **not** start in verified gameplay.
- The same `game_11.mss` seed starts on the top-level signboard menu with
  `Play TDII` selected.
- Matching sampled probes for `a_hold` and `a+b` keep the same top-menu
  selector family through frame `229`, even while the captured images pass
  through a gameplay-like cockpit surface.
- By frame `219`, both scenarios are already on `01:BAB3` with the same
  tracked selector fields, so that branch is not gameplay-backed.

## Equivalence Reading

- `a_hold` and `b_hold` are pixel-identical across all `300` captured frames.
- `a_and_b_hold` matches that same sequence through capture index `158`
  (`script frame 218`) and first diverges at capture index `159`
  (`script frame 219`).
- The first `a_hold` vs `a_and_b_hold` divergence is already large enough to
  treat as a deterministic branch rather than screenshot noise, but not as
  gameplay-backed evidence on the current seed:
  - mismatch pixels: `2085`
  - bbox: `[99, 75, 153, 113]`

## Drift Reading

- The newly fingerprinted `b_hold` output does **not** match the older promoted
  `tools/out/track1_seed_sweep_v2_current/b_hold` sequence.
- The cross-generation compare differs from capture index `0`, so the current
  `.mesen-config/Mesen2/SaveStates/game_11.mss` should be treated as a changed
  seed instead of silently reusing the old `v2_current` timing assumptions.

## Practical Reading

- Stop treating `game_11.mss` as a verified gameplay seed.
- The useful correction here is not “`A` or `B` accelerates in gameplay.”
- The useful correction is:
  - `a_hold` and `b_hold` collapse onto the same broad front-end/demo corridor
  - `a+b` first diverges at frame `219`, but still inside that same
    inherited seed family rather than a separately proven gameplay corridor
- The next bounded target is now to recover a true gameplay seed before
  promoting any more lane-3 conclusions from this sweep family.
