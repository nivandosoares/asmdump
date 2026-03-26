# SNES Front-End Selector Cardinality

## Claims

- `VERIFIED`: the recovered SNES front-end car-selection surface exposes `3`
  reachable slots through `$0202/$1C78`, and no separate front-end restriction
  on the third slot is present in that loop.
- `VERIFIED`: the recovered SNES top-level track surface exposes `4` slots
  through `$1C7C` before descriptor materialization.
- `VERIFIED`: the adjacent UI helpers previously read as `$1E80` users
  actually construct the long ROM pointer table `1E:8000`.

## Evidence

- Car loop:
  - `L008B3E` sets `$1C84 = 3`
  - `L00BDAC` wraps `$0202` `2 -> 0`
  - `L00BDD0` wraps `$0202` `0 -> 2`
  - helper triples exist for indices `9/10/11`
- Track loop:
  - `L008B6F` sets `$1C84 = 4`
  - `L00BE76` wraps `$1C7C` across `0..3`
  - `L008B87` resolves descriptor-group bases/counts
    `[0, 5, 11, 18] / [5, 6, 7, 8]`
- UI pointer table:
  - `01:BDF4`, `01:BE53`, and `01:BAC3` all overlap `sta $11` / `sta $10` to
    build the base pointer `1E:8000`
  - the decoded current rows are `8..10` for the car-facing helper and
    `11..14` for the track-facing helper

## Notes

- The unresolved gap is no longer selector cardinality.
- The remaining gap is decoding the `1E:8000` payload rows far enough to tie
  the `4` `$1C7C` slots to human-readable track names.
