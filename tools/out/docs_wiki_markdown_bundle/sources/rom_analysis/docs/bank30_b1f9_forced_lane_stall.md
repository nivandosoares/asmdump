# Bank30 `B1F9` Forced-Lane Stall

This note closes the current headless `B1F9` forcing lane as a low-yield path
for the active bank30 unresolved queue.

## Inputs

- `tools/out/l001210_probe_matrix_v14_b1f9_stagetrace/`
- `tools/out/l001210_probe_matrix_v14_b1f9_stagetrace_report.json`
- `tools/out/l001210_probe_matrix_v14_b1f9_stagetrace_report.md`
- `bank1.asm`

Generated with:

```sh
python3 tools/build_b1f9_stage_report.py \
  tools/out/l001210_probe_matrix_v14_b1f9_stagetrace \
  tools/out/l001210_probe_matrix_v14_b1f9_stagetrace_report.json \
  --markdown-out tools/out/l001210_probe_matrix_v14_b1f9_stagetrace_report.md
```

## Dynamic Read

- Both forced lanes still enter `01:B1F9` exactly once at frame `1201`:
  - `force_main_9568_with_state_stagetrace`
  - `force_main_95ad_with_state_stagetrace`
- In both lanes, all `L001210` hits still occur before the forced `B1F9`
  entry. Post-entry `L001210` hit count is `0`.
- Internal stage counters also stay flat in both forced lanes:
  - `B226 = 0`
  - `B256 = 0`
  - `B273 = 0`
  - `B59B = 0`
- The forced lanes end on a stable pinned surface through frame `2199`:
  - `active_main = 01:9568` or `01:95AD` depending on lane
  - `state_1D10 = 0x4100`
  - `state_09A8 = 2`
  - `state_0960 = 0`
  - `state_1C86 = 1`

Practical reading: the current headless forcing setup can prove a real
`B1F9` entry, but it does not drive the routine far enough to produce new
decompression evidence after that entry.

## Static Cross-Check

The unresolved `1E:EE7F` path is only reachable in the prologue-side dynamic
index select at `L00B1F9`:

- `L009568` and `L0095AD` both `inc $1CA8` before `jsr L00B1F9`
- `L00B1F9` begins with default helper index `0x0002`
- if `$1C80 < $1CA8`, the routine overrides that with `($1C78 + 0x001F)`
- `L00B226` then feeds that selected value into `L00A9A0`, which is the
  relevant table path for `1E:EE7F` when `$1C78 = 1`

Code anchors in [bank1.asm](/home/nivando-soares/asmdump/bank1.asm):

- caller-side `inc $1CA8` before `jsr L00B1F9`: [bank1.asm](/home/nivando-soares/asmdump/bank1.asm#L2490), [bank1.asm](/home/nivando-soares/asmdump/bank1.asm#L2513)
- dynamic index select and first `L00A9A0/L00A9CB` calls: [bank1.asm](/home/nivando-soares/asmdump/bank1.asm#L5892)
- later worker/loop surface: [bank1.asm](/home/nivando-soares/asmdump/bank1.asm#L6248), [bank1.asm](/home/nivando-soares/asmdump/bank1.asm#L6286)

The later `L00B6A3 -> L00B6E3` surface is therefore not a second chance to
observe the `EE7F` selector. It is a later worker loop centered on
`$0440/$0442/$0444`, `state_0202`, `01:9D69`, and a wait exit through
`L00B755`.

## Conclusion

- The current forced `01:9568/01:95AD -> 01:B1F9` lane is no longer the best
  headless proving path for `1E:EE7F`.
- It demonstrates entry reachability, but not post-entry decompression
  progress.
- The open unresolved queue remains:
  - `P0`: `1E:EE7F`
  - `P1`: `1E:DA96`

## Next Best Step

- Stop widening the same headless `B1F9` forcing lane unless a new trace
  surface changes the observed boundary.
- Prefer one of these instead:
  - a real menu/live debugger capture that reaches the `EE7F`-relevant prologue
    path organically
  - a different caller family that can touch `DA96` or index `32` without the
    current callback-injection stall
