# SDL Runtime Mimetization Smoke

Date: `2026-03-28`

## Goal

Measure, with one bounded regression pass, how far the current C/SDL runtime
already mimics the promoted SNES intro/attract sequence.

This is explicitly an intro/front-end smoke, not a gameplay-parity claim.

## Run

```sh
make -C port
./port/test_regression.sh
```

Sequence under test:

- `tools/out/intro_loop_hybrid_bridge_visible_sequence.txt`

## Result

- `make -C port` reported the runtime already up to date
- the headless regression rendered `1000` frames successfully
- frame-format sanity passed on the dumped PPM output
- golden checks:
  - `bootstrap_queue_978` at frame `324`: `0` mismatched pixels
  - `bootstrap_queue_982` at frame `328`: `0` mismatched pixels
  - `bridgeoverride_986` at frame `332`: `0` mismatched pixels
  - `bridgeobj_990` at frame `336`: `0` mismatched pixels
  - `mode7_visible_991` at frame `337`: `4` mismatched pixels
    (`0.006975%`)
- transition check:
  - `mode7_hold_transition`: `PASS`

Regression summary:

- `5` passed
- `1` failed
- `0` skipped

## Practical Read

- The current SDL runtime reproduces the promoted bridge-visible intro path
  exactly through the checked `978/982/986/990` checkpoints.
- The first remaining measured parity gap in this smoke sits immediately after
  that block at frame `991`, and it is small: `4` pixels.
- For intro/front-end regression work, the runtime is already good enough to
  act as a useful SNES mimic and checkpoint surface.
- For gameplay, this smoke does **not** prove parity yet; the gameplay lane
  still relies on live-entry probe/capture work rather than direct SDL replay.

## Next Gate

- either close the `4`-pixel `991` gap directly
- or formalize that boundary explicitly if the runtime should treat it as a
  temporary tolerated Mode 7 edge
