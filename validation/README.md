# Validation

This directory contains the first validation harness artifact for Sprint 0.

Current asset:

- `mesen_capture.lua`: a Mesen-S/Mesen 2 Lua script that can override input for a fixed window, emit per-frame screenshots, and write a JSON input log
- `run_mesen_capture.sh`: a launcher that creates an isolated Mesen config inside the repo, enables Lua file I/O, and runs the script in `--testRunner` mode
- `mesen_probe_boot.lua`: a lightweight state probe that records boot/title selectors like `$1C78/$1C7A/$1CCA/...` once per frame
- `run_mesen_probe_boot.sh`: convenience wrapper around the generic launcher for the boot probe

Expected workflow:

1. Boot the ROM in Mesen-S.
2. Navigate manually to a deterministic starting point, or load a known savestate at the start of track 1.
3. Load `validation/mesen_capture.lua`.
4. Let the script wait through its configured warm-up frames.
5. The script will hold the configured input pattern for 300 frames and dump PNGs plus a JSON log.

For automated headless runs with Mesen2's test runner:

```sh
./validation/run_mesen_capture.sh
```

To seed the run from a deterministic savestate instead of power-on:

```sh
./validation/run_mesen_capture.sh ./game.smc ./validation/mesen_capture.lua /absolute/path/to/start_state.mss
```

To inspect the boot/title selectors directly:

```sh
./validation/run_mesen_probe_boot.sh
```

The boot probe writes a JSON timeline and a final screenshot under the script data folder, using the prefix `td2_boot_probe`.
You can also drive it with simple scripted input via environment variables, for example:

```sh
TD2_BOOT_PROBE_TOTAL_FRAMES=3600 \
TD2_BOOT_PROBE_INPUT_START_FRAME=240 \
TD2_BOOT_PROBE_INPUT=start,b \
./validation/run_mesen_probe_boot.sh
```

The script writes an isolated config to `.mesen-config/Mesen2/settings.json` and capture output under the script data folder inside that config root.
By default it prefers a local source build at `/home/nivando-soares/Mesen2/bin/linux-x64/Release/Mesen` and falls back to the downloaded binary if needed.

Notes:

- The default input pattern uses `b = true` as the candidate accelerate button. Confirm or adjust this once track 1 is wired into the capture workflow.
- `mesen_capture.lua` now calls `emu.stop(0)` when capture finishes so the `--testRunner` process exits cleanly.
- In this environment, the downloaded `Mesen_2.1.1_Linux_x64/Mesen` binary crashed with `std::bad_cast` under `--testRunner`, while `/home/nivando-soares/Mesen2/bin/linux-x64/Release/Mesen` completed the capture successfully.
- Mesen2's `--testRunner` path does not expose a clean CLI hook for loading a `.mss` savestate before the script runs. The current workaround is a one-shot `emu.addMemoryCallback(..., emu.callbackType.exec, ...)` that calls `emu.loadSavestate(...)` on the first executed instruction.
- When `run_mesen_capture.sh` is called without a third argument, it exports an empty `TD2_CAPTURE_SAVESTATE` and the script stays on the original power-on plus warm-up flow.
- The no-savestate path was revalidated after this change. The savestate-loading branch was implemented against Mesen's shipped Lua API documentation, but it was not exercised here because there was no sample savestate file in the workspace.
