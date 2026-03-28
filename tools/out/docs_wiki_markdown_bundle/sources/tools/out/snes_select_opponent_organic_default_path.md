# SNES Select Opponent Organic Default Path

## Claim Audit

- Claim: No-force timed-input probes now recover the default top-left `Select Opponent` path organically through `L00C20B -> 01:C1D2 -> L00BE76 -> L008B87 -> 01:902D`, followed later by `active_main = 02:9016`.
- Classification: VERIFIED
- Evidence:
  - `tools/out/select_opponent_clock_path_v1b/td2_boot_probe.json` reaches:
    - `L00C20B` at frame `1562`
    - first `01:C1D2` at frame `1577`
    - `L00BE76` at frame `1616`
    - `L008B87` at frame `1706`
    - `01:902D` at frame `1857`
    - first `active_main = 02:9016` at frame `2014`
  - `tools/out/select_opponent_clock_path_v2/td2_boot_probe.json` reaches:
    - `L00C20B` at frame `1584`
    - first `01:C1D2` at frame `1599`
    - `L00BE76` at frame `1646`
    - `L008B87` at frame `1736`
    - `01:902D` at frame `1887`
    - first `active_main = 02:9016` at frame `2044`
  - In both runs, `$1C70` stays `0` and `$1C76` flips `0 -> 1` only after `L008B87`.
  - The attempted `right+down` windows still land before the first live `01:C1D2` frame in both runs.
- Notes:
  - This closes organic reachability for the default rival path without active-main forcing.
  - The remaining proving target is not reachability anymore; it is selecting the fourth clock slot inside the live `01:C1D2` window so the `$1C76 = 0` branch can be compared against this baseline.

## Scenario Summary

| Scenario | Input windows | Key frames |
| --- | --- | --- |
| `v1b` | `1200:start;1280:start;1505-1510:start;1560-1565:right,down;1610-1615:start;1700-1705:start` | `1562 c20b`, `1577 c1d2`, `1616 be76`, `1706 b87`, `1857 902d`, `2014 02:9016` |
| `v2` | `1200:start;1280:start;1505-1510:start;1584-1589:right,down;1640-1645:start;1730-1735:start` | `1584 c20b`, `1599 c1d2`, `1646 be76`, `1736 b87`, `1887 902d`, `2044 02:9016` |

## Next Gate

Inject `right+down` only after `01:C1D2` is already live so `$1C70` can leave
`0` before the same organic corridor falls through `L008B87` and `01:902D`.
