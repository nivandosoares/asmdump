# DOS Preview Codepath

This note promotes the concrete DOS preview/materializer path one step past
bundle ownership.

## Current owned path

The current best bounded read is:

- car preview ownership:
  - `0x57fb -> 0x43c9 -> 0x4c15 -> 0x4e86`
- scene preview parallel:
  - `0x5cf8 -> 0x44d2 -> 0x4d4e -> 0x4e86`
- play-session gate:
  - `0x6064`

This is still an engine-facing contract, not a decoded packed renderer.

## Measured preview bundle rule

The measured startup/materializer surface already supports this contract:

- same-stem `.SS` layout descriptor
- same-stem `*ST.PES` packed visual asset

Current bootstrap review seed:

- primary car: `P959`
- secondary car: `ROSS`
- scene: `CCC`

So the first promoted preview bundle pair is:

- `P959.SS + P959ST.PES`
- `ROSS.SS + ROSSST.PES`

## Measured file-access grammar

The strongest measured packed-asset trace currently is `ROSSST.PES`.

Host-side I/O already shows:

1. front probe read
2. explicit tail seek/read
3. full bulk reread

That is a better first decoder target than guessing a whole image format from
headers alone.

## Why this matters

The next renderer step should not start from “decode PES into pixels somehow.”
It should start from:

- the handler chain that owns preview assembly
- the same-stem bundle rule
- the measured file-access grammar
- the `.SS` token-family split already visible in the manifest

That gives the future engine a materializer API first, and only then a packed
image decoder underneath it.

## Tooling

- `tools/build_dos_preview_codepath.py`
- generated artifacts:
  - `tools/out/dos_preview_codepath.json`
  - `tools/out/dos_preview_codepath.md`
- `tools/build_dos_packed_asset_manifest.py`
  - builds the first registry of `*ST.PES/*ST.PCS` header fields and measured
    probe plans
  - writes:
    - `tools/out/dos_packed_asset_manifest.json`
    - `tools/out/dos_packed_asset_manifest.md`
- `tools/build_dos_packed_probe_contract.py`
  - promotes page classes and the first decoder-facing read plan over
    `*ST.PES`
  - writes:
    - `tools/out/dos_packed_probe_contract.json`
    - `tools/out/dos_packed_probe_contract.md`
  - note:
    - [docs/dos_packed_probe_contract.md](/home/nivando-soares/asmdump/docs/dos_packed_probe_contract.md)

## Run it

```sh
python3 tools/build_dos_preview_codepath.py \
  --engine-manifest tools/out/dos_engine_manifest.json \
  --preview-manifest tools/out/dos_preview_manifest.json \
  --runtime-trace ../Downloads/testdrive2/runtime_trace.json \
  --host-io ../Downloads/testdrive2/host_io_measurements.json \
  --json-out tools/out/dos_preview_codepath.json \
  --markdown-out tools/out/dos_preview_codepath.md

python3 tools/build_dos_packed_asset_manifest.py \
  --preview-manifest tools/out/dos_preview_manifest.json \
  --host-io ../Downloads/testdrive2/host_io_measurements.json \
  --data-dir ../Downloads/testdrive2 \
  --json-out tools/out/dos_packed_asset_manifest.json \
  --markdown-out tools/out/dos_packed_asset_manifest.md

python3 tools/build_dos_packed_probe_contract.py \
  --preview-manifest tools/out/dos_preview_manifest.json \
  --host-io ../Downloads/testdrive2/host_io_measurements.json \
  --data-dir ../Downloads/testdrive2 \
  --json-out tools/out/dos_packed_probe_contract.json \
  --markdown-out tools/out/dos_packed_probe_contract.md
```
