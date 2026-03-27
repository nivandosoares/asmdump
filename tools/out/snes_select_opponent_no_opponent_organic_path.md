# SNES Select Opponent Organic No-Opponent Path

## Claim Audit

- Claim: Callback-relative clock-slot selection plus a later
  `be43+17-22:start` confirm now recover the no-opponent path organically
  through `L00C20B -> 01:C1D2 -> L00BE76 -> 01:BE43 -> L008B87 -> 01:902D ->
  01:9111 -> active_main = 02:9016`, while keeping `$1C70 = 3` and
  `$1C76 = 0`.
- Classification: VERIFIED
- Evidence:
  - `tools/out/select_opponent_clock_path_v7_be43_confirm/td2_boot_probe.json`
    records:
    - first `01:C1D2` at `1628`
    - `L00BE76` at `1642`
    - first `01:BE43` at `1713`
    - `L008B87` at `1736`
    - `01:902D` at `1887`
    - `01:9111` at `2043`
    - first `active_main = 02:9016` at `2044`
  - The same `v7` run samples `$1C70 = 3` and `$1C76 = 0` at
    `1736`, `1887`, `2044`, `2600`, and `3000`.
  - At frame `1730`, `v7` still shows `active_main = 01:BE43` with
    `state_0960 = 0x1000`, matching the be43-relative confirm pulse that
    precedes the recovered `L008B87` hit at `1736`.
  - `tools/out/select_opponent_clock_path_v2/td2_boot_probe.json` reaches the
    same downstream timings (`1736/1887/2044`), but keeps the rival state
    `$1C70 = 0`, `$1C76 = 1`.
- Notes:
  - This closes the no-opponent confirm/promotion path itself.
  - The remaining open edge is now gameplay-facing divergence after the shared
    `02:9016` corridor begins, not front-end reachability.

## Scenario Summary

| Scenario | Absolute input windows | Trigger input windows | Key frames |
| --- | --- | --- | --- |
| `v7` | `1200:start;1280:start;1505-1510:start` | `c1d2+1-6:right,down;c1d2+8-13:start;be43+17-22:start` | `1613 c20b`, `1628..1643 c1d2`, `1642 be76`, `1713 be43`, `1736 b87`, `1887 902d`, `2043 9111`, `2044 02:9016` |

## Timing Comparison

| Path | `L008B87` | `01:902D` | first `02:9016` | `$1C70` | `$1C76` |
| --- | --- | --- | --- | --- | --- |
| default rival `v2` | `1736` | `1887` | `2044` | `0` | `1` |
| no-opponent `v7` | `1736` | `1887` | `2044` | `3` | `0` |

## Next Gate

Capture and compare the post-`02:9016` no-opponent lane against the
default-rival baseline so gameplay/HUD divergence can be tied to the preserved
`$1C76 = 0` state.
