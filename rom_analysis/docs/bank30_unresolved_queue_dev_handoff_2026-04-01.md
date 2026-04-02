# Bank30 Unresolved Queue Dev Handoff

Date: `2026-04-01`

## Scope

This handoff closes one repo-state mismatch in lane 1 and records the first
repeatable static read on the two remaining unresolved bank30 targets:

- `P0`: `1E:EE7F`
- `P1`: `1E:DA96`

## What Changed

- Refreshed the bank30 header scan:
  - `tools/out/bank30_headers.json`
- Refreshed decoder validation:
  - `tools/out/bank30_chunk_validation.json`
- Rebuilt the consolidated registry:
  - `tools/out/bank30_chunk_registry.json`
  - `tools/out/bank30_chunk_registry.md`
- Added a repeatable structural analyzer:
  - `tools/analyze_bank30_chunk_shapes.py`
- Produced new shape-analysis artifacts:
  - `tools/out/bank30_chunk_shapes.json`
  - `tools/out/bank30_chunk_shapes.md`

## Corrected Ground Truth

- The current bank30 header manifest has `8` candidates again, not `6`:
  - `42FB`: `1E:9681`
  - `67FB`: `1E:DA96`, `1E:E91F`
  - `26FB`: `1E:DF6C`, `1E:E039`, `1E:E73F`, `1E:E800`, `1E:EE7F`
- The refreshed validation pass now matches the current decoder/tool reality:
  - `1E:DA96` decodes successfully as `67FB`
    - output: `28620` bytes
    - input consumed: `6429` bytes
  - `1E:E91F` fails as a standalone `67FB`
    - error: `index out of range`
- The rebuilt registry is back in sync with that evidence:
  - `runtime-confirmed`: `DF6C/E039/E73F/E800`
  - `sentinel-control`: `9681`
  - `nested-invalid-marker`: `E91F`
  - unresolved queue:
    - `P0`: `EE7F`
    - `P1`: `DA96`

## Static Read

### `DA96`

- `DA96` is structurally unlike the sparse `26FB` helper payloads.
- The refreshed shape pass shows:
  - `14310` decompressed words
  - `6.499%` zero words
  - `86.9881%` of words have non-zero high tile/control bits
  - `21.768%` of words are `> 0x7FFF`
- The strongest concrete pattern is a repeated row-like block:
  - `33` runs of `0x7C1F`
  - each run is `125` words long
  - run starts land on a constant `157`-word stride
  - treating that stride as a row width yields a `157 x 33` block
  - `32` of those rows are byte-identical
  - only `2` row variants appear in the whole block
- Practical read:
  - this looks like row-major visual/map payload, not executable-like material
  - if we keep pressing `DA96`, the best proving path is caller/visual
    correlation, not “disassemble it like code”

### `EE7F`

- `EE7F` keeps the same decompressed size as the two sparse `26FB` siblings:
  - `DF6C`: `899` words
  - `E73F`: `899` words
  - `EE7F`: `899` words
- But `EE7F` is not a near-clone of that pair:
  - zero-word ratio:
    - `DF6C`: `88.2091%`
    - `E73F`: `88.7653%`
    - `EE7F`: `23.4705%`
  - same-index word overlap:
    - `DF6C` vs `E73F`: `77.5306%`
    - `DF6C` vs `EE7F`: `21.0234%`
    - `E73F` vs `EE7F`: `20.356%`
- Practical read:
  - `EE7F` is a real distinct member of the bank1 helper-table family
  - it should remain the highest-priority unresolved runtime target
  - the current issue is reachability, not weak data classification

## Implications For Lane 1

- `DA96` stays unresolved in runtime terms, but it is no longer a good
  “maybe this is hidden code” candidate.
- `EE7F` is still the best next proving target because it is both:
  - bank1-table-confirmed
  - structurally distinct from the already-observed `DF6C/E73F` pair
- The old repo mismatch is now closed:
  - generated bank30 artifacts again expose the `67FB` rows explicitly
  - the registry and docs can now talk about `DA96/E91F` without relying on
    stale generated output

## Recommended Next Step

1. Chase an organic `EE7F` reachability path first.
2. Prefer menu/live-debugger capture or a new caller family over more widened
   forced-`B1F9` headless retries.
3. Treat `DA96` as a separate visual/map-provenance lane:
   correlate it against consumer-side scenes, tilemaps, or large repeated
   front-end assets instead of trying to prove it through the same helper-index
   funnel as `EE7F`.

## Rebuild Commands

```sh
python3 tools/extract_compression_header_manifest.py game.smc --bank 30 --json-out tools/out/bank30_headers.json
python3 tools/validate_td2_chunks.py game.smc --bank 30 --headers-json tools/out/bank30_headers.json --json-out tools/out/bank30_chunk_validation.json
python3 tools/build_bank30_chunk_registry.py tools/out/bank30_headers.json tools/out/bank30_chunk_validation.json tools/out/td2_boot_probe_l001210_summary.json tools/out/bank30_chunk_registry.json --markdown-out tools/out/bank30_chunk_registry.md
python3 tools/analyze_bank30_chunk_shapes.py --json-out tools/out/bank30_chunk_shapes.json --markdown-out tools/out/bank30_chunk_shapes.md
```
