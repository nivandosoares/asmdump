# DOS Engine Porting Surface

This note reframes the DOS lane around future engine work rather than immediate
pixel rendering.

## Why this comes first

The DOS build already exposes a cleaner engine contract than the current SNES
recovery for several core systems:

- selection state
- car catalog
- scenery catalog
- preview materialization
- play-session gating

That makes DOS a better reimplementation/modding base even before packed-image
decoding is complete.

## Engine-first rules

- Treat `CARS.DAT` and `SCENES.DAT` as the gameplay-facing source catalogs.
- Treat `SELECT.DAT` as the persisted subset of the live selector vector.
- Treat each car ID as a bundle root:
  - logic: `<ID>.BIN`
  - aux logic: `<ID>O.BIN`
  - layout: `<ID>.SS`
  - visuals: `<ID>DASH.*`, `<ID>REAR.*`, `<ID>ROAD.*`, `<ID>ST.*`
- Treat preview rendering as a materializer contract:
  - same-stem `.SS`
  - same-stem `*ST.PES`
- Treat the play-session gate as a first-class engine boundary:
  - `0x6064`
  - `Play Disk needs both cars and scenery!`

## Current DOS roster

Cars from `CARS.DAT`:

- `VETT` -> `Chevy Corvette ZR1`
- `ROSS` -> `Ferrari Testarossa`
- `COUN` -> `Lambo Countach`
- `LOTU` -> `Lotus Turbo Esprit`
- `RUF` -> `Ruf Twin Turbo`
- `F40` -> `Ferrari F40`
- `P959` -> `Porsche 959`

Scenes from `SCENES.DAT`:

- `TDS2` -> `Master Scenery` (`play_disk = 6`)
- `CCC` -> `Calif Challenge` (`play_disk = 7`)

Current bootstrap from `SELECT.DAT`:

- selector values: `0 0 0`
- ids: `P959 ROSS CCC`

## Porting read

- Do not force DOS and SNES into one shared roster contract.
- Bind engine behavior to DOS IDs first, then add cross-platform mappings only
  when they are directly proven.
- The first engine modules should be:
  - catalog loader
  - selection state
  - preview materializer
  - play-session gate
  - later packed-asset decoder / renderer

## New manifest

- `tools/build_dos_engine_manifest.py`
- generated artifacts:
  - `tools/out/dos_engine_manifest.json`
  - `tools/out/dos_engine_manifest.md`
- versioned contract:
  - `rom_analysis/docs/dos_engine_contracts.jsonc`
- review surfaces:
  - `tools/build_dos_design_review.py`
  - `tools/out/dos_design_review.html`
  - `tools/out/dos_design_review.md`
- preview/materializer manifest:
  - `tools/build_dos_preview_manifest.py`
  - `tools/out/dos_preview_manifest.json`
  - `tools/out/dos_preview_manifest.md`
- preview codepath contract:
  - `tools/build_dos_preview_codepath.py`
  - `tools/out/dos_preview_codepath.json`
  - `tools/out/dos_preview_codepath.md`
  - [docs/dos_preview_codepath.md](/home/nivando-soares/asmdump/docs/dos_preview_codepath.md)
- packed probe contract:
  - `tools/build_dos_packed_probe_contract.py`
  - `tools/out/dos_packed_probe_contract.json`
  - `tools/out/dos_packed_probe_contract.md`
  - [docs/dos_packed_probe_contract.md](/home/nivando-soares/asmdump/docs/dos_packed_probe_contract.md)
- visible review boards:
  - `tools/build_dos_asset_review_pngs.py`
  - `tools/out/dos_asset_review_pngs/dos_asset_review_overview.png`
  - `tools/out/dos_asset_review_pngs/dos_asset_review_gallery.html`
- front-page field map:
  - `tools/build_dos_frontpage_contract.py`
  - `tools/out/dos_frontpage_contract.json`
  - `tools/out/dos_frontpage_contract.md`
  - [docs/dos_next_agent_handoff.md](/home/nivando-soares/asmdump/docs/dos_next_agent_handoff.md)
- decoder-boundary field map:
  - `tools/build_dos_decoder_boundary_contract.py`
  - `tools/out/dos_decoder_boundary_contract.json`
  - `tools/out/dos_decoder_boundary_contract.md`
  - [docs/dos_decoder_boundary_contract.md](/home/nivando-soares/asmdump/docs/dos_decoder_boundary_contract.md)

## Run it

```sh
python3 tools/build_dos_engine_manifest.py \
  ../Downloads/testdrive2 \
  --json-out tools/out/dos_engine_manifest.json \
  --markdown-out tools/out/dos_engine_manifest.md

python3 tools/build_dos_design_review.py \
  --manifest-json tools/out/dos_engine_manifest.json \
  --html-out tools/out/dos_design_review.html \
  --markdown-out tools/out/dos_design_review.md

python3 tools/build_dos_preview_manifest.py \
  --engine-manifest tools/out/dos_engine_manifest.json \
  --contracts-json tools/out/dos_version_contracts.json \
  --json-out tools/out/dos_preview_manifest.json \
  --markdown-out tools/out/dos_preview_manifest.md

python3 tools/build_dos_preview_codepath.py \
  --engine-manifest tools/out/dos_engine_manifest.json \
  --preview-manifest tools/out/dos_preview_manifest.json \
  --runtime-trace ../Downloads/testdrive2/runtime_trace.json \
  --host-io ../Downloads/testdrive2/host_io_measurements.json \
  --json-out tools/out/dos_preview_codepath.json \
  --markdown-out tools/out/dos_preview_codepath.md

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

python3 tools/build_dos_frontpage_contract.py \
  --preview-manifest tools/out/dos_preview_manifest.json \
  --data-dir ../Downloads/testdrive2 \
  --json-out tools/out/dos_frontpage_contract.json \
  --markdown-out tools/out/dos_frontpage_contract.md
```

## Boundary

This checkpoint does not decode `.PES/.PCS` yet. That is intentional.

The goal here is to make future engine work and mods easier by stabilizing:

- what the runtime state is
- what the catalogs are
- what each car/scenery ID owns
- what the gate into a playable session requires

Once that stays stable, packed-asset rendering becomes an implementation layer
on top instead of the only way to make progress.
