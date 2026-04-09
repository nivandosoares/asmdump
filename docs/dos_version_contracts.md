# DOS Version Contracts

This note promotes the first repo-owned DOS contract surface from the local
`../Downloads/testdrive2` executables.

## What is now explicit

- `DUEL.EXE` is a small graphics-device launcher that dispatches to
  `TD2CGA.EXE`, `TD2EGA.EXE`, and `TD2TDY.EXE`.
- The three graphics executables all embed the same named sidecar resource
  families:
  - `accolade`, `dsititle`, `testdrv2`, `endgame`, `gameopt`, `gamediff`,
    `gasstuff`, `cop`, `road`
- The DOS build exposes explicit persistence/media files:
  - `select.dat`
  - `diskid.dat`
- The DOS front end exposes explicit media/content roles:
  - `MASTER`
  - `CAR`
  - `SCENERY`
  - `PLAY`
  - `PROGRAM`
- The DOS front end also exposes the play-gate itself in user-facing text:
  - `Play Disk needs both cars and scenery!`
  - `Press Enter to un/select scenery.`
  - `Make Play Disk`
  - `Copy Scenery`
- The DOS runtime also exposes first-class option toggles:
  - `MUSIC ON/OFF`
  - `SOUND ON/OFF`
  - `KEYBOARD ON`
- The gameplay/reporting layer already exposes explicit failure/status
  contracts:
  - gas-station miss / out-of-gas walk
  - too-far-left pump refusal
  - engine, suspension, steering, and total-damage failure channels
  - fuel refill
  - lives remaining / last-life warning

## Why this matters for the port

The SNES lane had been using DOS contracts as search targets, but the DOS
contracts themselves were not versioned in-repo yet. They are now recoverable
from tooling instead of only living in prose.

The practical read is:

- DOS exposes a cleaner contract layer than the current SNES recovery for menu
  and play-session assembly.
- The first functional port surface should target those DOS-visible contracts
  directly:
  - selection vector
  - catalog readiness
  - explicit play gate
  - persistence/media surfaces
  - failure/reporting channels
- SNES archaeology still matters, but mainly as a comparative lane where it
  helps close semantics or asset ownership.

## New tooling

- `tools/extract_dos_contracts.py`
  - extracts MZ header facts, named strings, resource sidecars, disk/media
    roles, toggles, and failure/reporting messages from the DOS executables
  - writes:
    - `tools/out/dos_version_contracts.json`
    - `tools/out/dos_version_contracts.md`
- `tools/dos_frontend_port.py`
  - minimal contract-driven DOS frontend model
  - exposes a runnable selection/play-gate surface for future language ports
  - writes:
    - `tools/out/dos_frontend_port_replay.json`
- `rom_analysis/docs/dos_contract_model.jsonc`
  - small versioned source-of-truth contract subset promoted from those
    generated artifacts
- `tools/build_dos_engine_manifest.py`
  - builds an engine-first DOS manifest from the live data files and asset
    families
  - writes:
    - `tools/out/dos_engine_manifest.json`
    - `tools/out/dos_engine_manifest.md`
- `rom_analysis/docs/dos_engine_contracts.jsonc`
  - versioned engine-first DOS contract surface for future reimplementation
    and modding

## Run it

```sh
python3 tools/extract_dos_contracts.py \
  ../Downloads/testdrive2 \
  --json-out tools/out/dos_version_contracts.json \
  --markdown-out tools/out/dos_version_contracts.md

python3 tools/dos_frontend_port.py \
  --contract-json tools/out/dos_version_contracts.json \
  --script 'right_car,right_scenery,drop_scenery_catalog'
```

## Current boundary

This is a string- and header-driven DOS checkpoint, not a full DOS code-flow
recovery. It proves the user-visible contract surfaces and gives the repo a
runnable model, and it now includes direct evidence for the DOS “both cars and
scenery” play gate. It still does not assign the exact in-memory DOS offsets
or the real `select.dat` binary layout.

The next high-value DOS steps are:

1. recover the live selector vector and the exact persisted-field layout
2. identify the concrete car/scenery materializer entrypoints
3. map the exact DOS play gate that refuses to advance when one catalog is not
   ready
4. promote a slightly richer contract runner that covers gameplay failure
   channels, not only front-end gating
