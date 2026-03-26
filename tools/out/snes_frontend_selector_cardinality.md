# SNES Front-End Selector Cardinality

## Claims

- `VERIFIED`: the recovered SNES front-end car-selection surface exposes `3`
  reachable slots through `$0202/$1C78`, and no separate front-end restriction
  on the third slot is present in that loop.
- `VERIFIED`: the recovered SNES top-level track surface exposes `4` slots
  through `$1C7C` before descriptor materialization.
- `VERIFIED`: simple `start`-pulse probes are not sufficient to materialize the
  `$1E80` descriptor table used by `L00179B`.

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
- Negative probe:
  - simple start-pulse WRAM dumps at frames `1200` and `1400` still leave
    `$1E80..$1FFF` zero
  - frame `1200` in that lane transiently reaches active main callback
    `01:BAB3`

## Notes

- The unresolved gap is no longer selector cardinality.
- The remaining gap is the exact label/descriptor materializer that ties the
  `4` `$1C7C` slots to human-readable track names.
