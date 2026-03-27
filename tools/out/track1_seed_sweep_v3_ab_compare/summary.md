# Track 1 Seed Sweep

- ROM: `/home/nivando-soares/asmdump/game.smc`
- ROM SHA-256: `53e1a9e17a8b0cffd24946e61a47a6f21e7d85ba32b9436da8705b5e53b1f017`
- Savestate: `/home/nivando-soares/asmdump/.mesen-config/Mesen2/SaveStates/game_11.mss`
- Savestate SHA-256: `17f2857d3309ad99fc87724d131f9b1e7965c1fb5a530f739dedda9f51086b14`
- Capture config: `warmup=60` `frames=300` `screenshot_every=1`
- Seed surface audit: `front_end_menu_seed` `main=02:9016` `$1C6A=[1]` `$0202=[65535]`

| Scenario | Windows | Distinct hashes | Classification | First nontrivial | First motion |
|---|---|---:|---|---:|---:|
| a_hold | `60-359:a` | 5 | dynamic | 62 | 64 |
| b_hold | `60-359:b` | 5 | dynamic | 62 | 64 |
| a_and_b_hold | `60-359:a,b` | 5 | dynamic | 62 | 64 |

- Scenario count: 3
- Dynamic scenarios: a_hold, b_hold, a_and_b_hold
- Static-seed scenarios: none
- Recommended next step: the current seed still starts in a top-level front-end/menu state; recover a verified gameplay seed before promoting sweep output as gameplay evidence
