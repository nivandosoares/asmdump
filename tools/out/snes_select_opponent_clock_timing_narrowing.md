# SNES Select Opponent Clock Timing Narrowing

## Claim Audit

- Claim: Absolute-frame input windows remain unstable for the fourth-slot clock
  probe because delaying confirmation also shifts the first live `01:C1D2`
  window later, leaving `right+down` early in both bounded follow-ups.
- Classification: VERIFIED
- Evidence:
  - `v3` reaches `L00C20B` at frame `1600` and first `01:C1D2` only at
    `1615..1617`, so `right+down` at `1600..1605` is still early.
  - `v3` therefore still follows the default path:
    `L00BE76` at `1616`, `L008B87` at `1706`, `01:902D` at `1857`, and first
    `active_main = 02:9016` at `2014`.
  - `v4` reaches `L00C20B` at frame `1613` and first `01:C1D2` only at
    `1628..1637`, so the delayed `right+down` at `1620..1625` is still early.
  - `v4` does reach `L00BE76` at `1636`, but no `L008B87` or `01:902D` hit
    appears through the trace window, and later sampled frames stay on
    `active_main = 01:BE43` with `$1C70` unchanged at `0`.
- Notes:
  - The remaining clock-slot problem is now clearly callback-relative timing
    drift, not a raw button-map question.
  - The next probe should overlap `right+down` with the live `01:C1D2` window
    itself or trigger relative to first `01:C1D2` instead of using fixed
    absolute frames.

## Scenario Summary

| Scenario | Input windows | Key frames |
| --- | --- | --- |
| `v3` | `1200:start;1280:start;1505-1510:start;1600-1605:right,down;1610-1615:start;1700-1705:start` | `1600 c20b`, `1615..1617 c1d2`, `1616 be76`, `1706 b87`, `1857 902d`, `2014 02:9016` |
| `v4` | `1200:start;1280:start;1505-1510:start;1620-1625:right,down;1630-1635:start;1700-1705:start` | `1613 c20b`, `1628..1637 c1d2`, `1636 be76`, no `b87/902d` in trace window |

## Next Gate

Use an overlapping or callback-relative `right+down` injection so the fourth
slot move is guaranteed to occur while `01:C1D2` is already live.
