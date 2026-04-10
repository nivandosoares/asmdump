# DOS Decoder Boundary Contract

This note closes the next bounded question after the front-page field map and
tail histogram probe: where the first decoder boundary now looks strongest
inside `*ST.PES`.

## Current bounded read

The current best rule is now split-phase, not one uniform packed surface:

- treat the first `256` bytes of the front page as structured table/header
  territory
- treat the first `256` bytes of the four-page tail as continued stream data
  in the same regime as the preceding page boundary
- keep `P959ST.PES` versus `ROSSST.PES` as the control pair for cross-class
  checks

## Why this is now stronger

- every promoted car-preview `*ST.PES` asset has long strictly increasing runs
  in the front `256` bytes:
  - `P959`: longest run `64`
  - `F40`: longest run `65`
  - `ROSS`: longest run `67`
  - `COUN`: longest run `56`
  - `VETT`: longest run `61`
- those runs begin in the same practical front-page zone:
  - between offsets `27` and `30`
- the first `256` bytes of the promoted four-page tails do not preserve that
  front-page pattern:
  - `ROSS`: longest run `5`
  - `COUN`: longest run `4`
  - `VETT`: longest run `4`
- the immediate pre-tail boundary window stays similarly stream-like:
  - `ROSS`: longest run `6`
  - `COUN`: longest run `5`
  - `VETT`: longest run `6`

That does not decode pixels yet, but it does directly narrow the next parser
boundary:

- front page: structured selector/table/header zone
- pre-tail and tail start: stream-continuation zone

## Tooling

- builder:
  - `tools/build_dos_decoder_boundary_contract.py`
- smoke:
  - `tools/tests/test_dos_decoder_boundary_contract.py`
- generated artifacts:
  - `tools/out/dos_decoder_boundary_contract.json`
  - `tools/out/dos_decoder_boundary_contract.md`

## Run it

```sh
python3 tools/build_dos_decoder_boundary_contract.py \
  --preview-manifest tools/out/dos_preview_manifest.json \
  --data-dir ../Downloads/testdrive2 \
  --json-out tools/out/dos_decoder_boundary_contract.json \
  --markdown-out tools/out/dos_decoder_boundary_contract.md

python3 tools/tests/test_dos_decoder_boundary_contract.py
```

## Next gate

Use this split-phase boundary to recover the next directly proven decoder
subregion:

1. isolate one front-page increasing-run band and test whether it behaves like
   an explicit lookup/table family instead of compressed symbols
2. compare the same offsets in `P959ST.PES` and `ROSSST.PES` to see where the
   three-page and four-page variants stop sharing front-page structure
3. keep the early four-page tail in the stream lane until a repeated footer or
   reset marker is directly proven
