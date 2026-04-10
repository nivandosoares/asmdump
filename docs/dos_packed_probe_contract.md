# DOS Packed Probe Contract

This note promotes the packed preview lane one step past header inspection.

## Current bounded read

The best current decoder-facing rule is page-oriented, not format-complete:

- read the front segment first
- if the asset crosses `12288` bytes, treat the tail after that boundary as a
  first-class segment
- bulk reread the whole file before attempting decode

This is grounded by the measured `ROSSST.PES` host trace and generalized only
by file geometry where the same page class recurs.

## Current page classes

Current `*ST.PES` files split into three practical classes:

- `single_page_stream`
  - `TDS2DEST.PES`
- `three_page_stream`
  - `F40ST.PES`
  - `LOTUST.PES`
  - `P959ST.PES`
  - `RUFST.PES`
- `four_page_tail_stream`
  - `COUNST.PES`
  - `ROSSST.PES`
  - `VETTST.PES`

The important boundary is not “scene vs car” or “PES vs PCS.” It is whether
the packed preview asset crosses the promoted `12 KB` cut.

## Why this matters

This lets the future engine expose a stable materializer/read API before the
pixel decoder is solved:

- open bundle
- probe front page
- optionally probe tail page fragment
- reread whole asset into the decoder

That is a better contract than pretending the only next step is “parse the
whole compressed image format.”

## Tooling

- `tools/build_dos_packed_probe_contract.py`
- generated artifacts:
  - `tools/out/dos_packed_probe_contract.json`
  - `tools/out/dos_packed_probe_contract.md`
- visible design-review boards:
  - `tools/build_dos_asset_review_pngs.py`
  - `tools/out/dos_asset_review_pngs/dos_asset_review_overview.png`
  - `tools/out/dos_asset_review_pngs/<car>_review_board.png`
  - `tools/out/dos_asset_review_pngs/dos_asset_review_gallery.html`

## Run it

```sh
python3 tools/build_dos_packed_probe_contract.py \
  --preview-manifest tools/out/dos_preview_manifest.json \
  --host-io ../Downloads/testdrive2/host_io_measurements.json \
  --data-dir ../Downloads/testdrive2 \
  --json-out tools/out/dos_packed_probe_contract.json \
  --markdown-out tools/out/dos_packed_probe_contract.md

python3 tools/build_dos_asset_review_pngs.py \
  --preview-manifest tools/out/dos_preview_manifest.json \
  --probe-contract tools/out/dos_packed_probe_contract.json \
  --out-dir tools/out/dos_asset_review_pngs \
  --json-out tools/out/dos_asset_review_pngs.json
```

## Design read

The PNG boards are intentionally conservative:

- they show token layout families
- packed `PES/PCS` geometry
- page/tail boundaries
- evidence grades

They do not claim decoded DOS preview art yet.
