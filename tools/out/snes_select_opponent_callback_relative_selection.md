# SNES Select Opponent Callback-Relative Selection

## Claim Audit

- Claim: Callback-relative input windows keyed to the first live `01:C1D2`
  hit now drive the fourth `Select Opponent` slot organically (`$1C70 = 3`),
  after which the run reaches `L00BE76` and the later `01:BE43` corridor
  with `$1C76 = 0`.
- Classification: VERIFIED
- Evidence:
  - `validation/mesen_probe_boot.lua` now accepts
    `TD2_BOOT_PROBE_TRIGGER_INPUT_WINDOWS` and records both
    `trigger_input_windows` and `exec_point_trace.first_frames`.
  - `tools/out/select_opponent_clock_path_v5_trigger/td2_boot_probe.json`
    records first `01:C1D2` at frame `1628`, then moves to
    `$1C70 = 3` / `$1C76 = 0` by frame `1642` while reaching `L00BE76`
    at that same frame.
  - The same `v5` run samples `active_main = 01:BE43` at frames
    `1713`, `1736`, `1857`, `1887`, `2014`, and `2044`, with no traced
    `L008B87`, `01:902D`, or `01:9111` hit.
  - `tools/out/select_opponent_clock_path_v6_trigger_long/td2_boot_probe.json`
    reproduces the same selection timing and extends the later
    `01:BE43` corridor through frames `2200`, `2400`, and `2600`, still with
    `$1C70 = 3` and `$1C76 = 0`.
- Notes:
  - This closes organic fourth-slot selection itself.
  - It does not yet prove the later no-opponent phase-confirm behavior,
    because the `v5/v6` input program omits the later confirm `start` window
    that previously advanced the default-rival lane into
    `L008B87 -> 01:902D -> active_main = 02:9016`.

## Scenario Summary

| Scenario | Absolute input windows | Trigger input windows | Key frames |
| --- | --- | --- | --- |
| `v5` | `1200:start;1280:start;1505-1510:start` | `c1d2+1-6:right,down;c1d2+8-13:start` | `1613 c20b`, `1628..1643 c1d2`, `1642 be76`, later samples `1713/1736/1857/1887/2014/2044 = 01:BE43` |
| `v6` | `1200:start;1280:start;1505-1510:start` | `c1d2+1-6:right,down;c1d2+8-13:start` | `1613 c20b`, `1628..1643 c1d2`, `1642 be76`, `1713..2206 be43`, later samples `2200/2400/2600 = 01:BE43` |

## Next Gate

Pair the callback-relative fourth-slot move with a later `start` confirm after
the `01:BE43` corridor is live so the no-opponent lane can be compared against
the recovered default-rival baseline.
