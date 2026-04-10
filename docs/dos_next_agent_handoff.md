# DOS Next-Agent Handoff

This is the explicit resume point for the current DOS archaeology lane.

## Current lane state

Promoted local checkpoints on `master`:

- `b643f7c` `Add DOS engine and design review tooling`
- `dce5d23` `Add DOS preview codepath and packed asset manifests`
- `edfb7ba` `Add DOS packed probe contract`
- `7df5396` `Add DOS asset review PNG boards`

Push is still blocked on this host because `/usr/bin/ssh` cannot execute.

## What is already strong

- DOS engine-first surface:
  - catalogs
  - selector bootstrap
  - preview bundle ownership
  - play-session gate
- preview codepath:
  - `0x57fb -> 0x43c9 -> 0x4c15 -> 0x4e86`
  - `0x5cf8 -> 0x44d2 -> 0x4d4e -> 0x4e86`
  - play gate `0x6064`
- packed probe classes:
  - `single_page_stream`
  - `three_page_stream`
  - `four_page_tail_stream`
  - promoted `12 KB` tail boundary

## New explicit front-page entry point

Use these generated artifacts first:

- `tools/out/dos_frontpage_contract.json`
- `tools/out/dos_frontpage_contract.md`
- `tools/out/dos_decoder_boundary_contract.json`
- `tools/out/dos_decoder_boundary_contract.md`
- `tools/out/dos_tail_probe_contract.json`
- `tools/out/dos_tail_probe_contract.md`
- `tools/out/dos_packed_probe_contract.json`
- `tools/out/dos_asset_review_pngs/dos_asset_review_gallery.html`

Current bounded front-page read:

- byte `0` is a stable `0x82` signature on all current `*ST.PES`
- bytes `9` and `10` stay `0`
- byte `8` splits current assets into `{13, 14, 12}`
  - car previews are currently `13` or `14`
  - `TDS2DEST.PES` is `12`
- bytes `11/12/13` stay in a tiny range and likely belong to a structured
  header family rather than compressed payload noise
- bytes `16..21` vary per asset in a way that still looks field-like
- the first `256` bytes also carry long strictly increasing bands across all
  promoted car-preview assets, with longest runs from `56` to `67`
- the four-page tail start does not carry that same pattern:
  - `ROSS`: longest run `5`
  - `COUN`: longest run `4`
  - `VETT`: longest run `4`
- the immediate pre-tail boundary stays similarly stream-like:
  - `ROSS`: longest run `6`
  - `COUN`: longest run `5`
  - `VETT`: longest run `6`

Practical current split:

- `P959ST.PES` and `F40ST.PES` share the strongest front-page similarity in
  the current car set
- `ROSSST.PES`, `COUNST.PES`, and `VETTST.PES` are the current four-page tail
  class and should be treated as the best next tail-fragment targets
- `P959ST.PES` and `ROSSST.PES` remain the best bounded cross-class pair:
  same visible layout family, different page class
- current four-page tail starts do not share a common prefix, and their
  histogram similarity stays closer to their own preceding page than to
  another asset's tail

## Recommended next experiments

1. Stay inside the first `64` bytes and the promoted page boundaries first.
2. Compare one `three_page_stream` and one `four_page_tail_stream` asset:
   - recommended pair:
     - `P959ST.PES`
     - `ROSSST.PES`
3. Use the new tail contract to test whether one early four-page tail window
   continues the same token/bitstream rules as the preceding page.
4. Only promote a footer/table interpretation if a repeated structure appears
   across `ROSSST.PES`, `COUNST.PES`, and `VETTST.PES`.
5. Only add decoded visual boards when the decoded region is directly proven.

## Files and tools to use first

- `tools/build_dos_frontpage_contract.py`
- `tools/build_dos_tail_probe_contract.py`
- `tools/build_dos_decoder_boundary_contract.py`
- `tools/build_dos_packed_probe_contract.py`
- `tools/build_dos_asset_review_pngs.py`
- `docs/dos_packed_probe_contract.md`
- `docs/dos_decoder_boundary_contract.md`
- `docs/dos_tail_probe_contract.md`
- `docs/dos_preview_codepath.md`
- `docs/dos_engine_porting.md`

## Validation path

Cheap reruns on this host:

```sh
python3 -m py_compile \
  tools/build_dos_frontpage_contract.py \
  tools/tests/test_dos_frontpage_contract.py

python3 tools/build_dos_frontpage_contract.py \
  --preview-manifest tools/out/dos_preview_manifest.json \
  --data-dir ../Downloads/testdrive2 \
  --json-out tools/out/dos_frontpage_contract.json \
  --markdown-out tools/out/dos_frontpage_contract.md

python3 tools/tests/test_dos_frontpage_contract.py

python3 tools/build_dos_tail_probe_contract.py \
  --preview-manifest tools/out/dos_preview_manifest.json \
  --data-dir ../Downloads/testdrive2 \
  --json-out tools/out/dos_tail_probe_contract.json \
  --markdown-out tools/out/dos_tail_probe_contract.md

python3 tools/tests/test_dos_tail_probe_contract.py

python3 tools/build_dos_decoder_boundary_contract.py \
  --preview-manifest tools/out/dos_preview_manifest.json \
  --data-dir ../Downloads/testdrive2 \
  --json-out tools/out/dos_decoder_boundary_contract.json \
  --markdown-out tools/out/dos_decoder_boundary_contract.md

python3 tools/tests/test_dos_decoder_boundary_contract.py
```

## Worktree warning

There is unrelated preexisting `port/` prototype work in the worktree:

- modified:
  - `port/Makefile`
  - `port/README.md`
  - `tools/extract_raw_layers.py`
- many staged additions under:
  - `port/include/`
  - `port/src/`
  - `port/td2_port`
  - `tools/generate_attract_assets.py`

Do not bundle those into DOS archaeology commits unless the task explicitly
switches back to the prototype lane.
