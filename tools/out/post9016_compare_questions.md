# Post-02:9016 Visual Review

This pack supersedes the earlier invalid `2044` review window. The corrected
captures compare the first shared non-black gameplay-facing window after both
recovered paths have already converged to the same callback corridor:

- default rival path:
  `tools/out/post9016_default_rival_capture/`
- no-opponent clock path:
  `tools/out/post9016_no_opponent_clock_capture/`

Both captures cover frames `2048..2088` from boot, sampled every `4` frames.
The automated compare summary is in:

- `tools/out/post9016_compare_summary.md`
- `tools/out/post9016_compare_first_delta_diff.png`

Frame mapping:

- `capture_frame_00000.png` = frame `2048`
- `capture_frame_00004.png` = frame `2052`
- `capture_frame_00008.png` = frame `2056`
- `capture_frame_00012.png` = frame `2060`
- `capture_frame_00016.png` = frame `2064`
- `capture_frame_00020.png` = frame `2068`
- `capture_frame_00024.png` = frame `2072`
- `capture_frame_00028.png` = frame `2076`
- `capture_frame_00032.png` = frame `2080`
- `capture_frame_00036.png` = frame `2084`
- `capture_frame_00040.png` = frame `2088`

Suggested pair-by-pair inspection order:

1. [capture_frame_00000.png](/home/nivando-soares/asmdump/tools/out/post9016_default_rival_capture/capture_frame_00000.png)
   vs
   [capture_frame_00000.png](/home/nivando-soares/asmdump/tools/out/post9016_no_opponent_clock_capture/capture_frame_00000.png)
2. [capture_frame_00008.png](/home/nivando-soares/asmdump/tools/out/post9016_default_rival_capture/capture_frame_00008.png)
   vs
   [capture_frame_00008.png](/home/nivando-soares/asmdump/tools/out/post9016_no_opponent_clock_capture/capture_frame_00008.png)
3. [capture_frame_00016.png](/home/nivando-soares/asmdump/tools/out/post9016_default_rival_capture/capture_frame_00016.png)
   vs
   [capture_frame_00016.png](/home/nivando-soares/asmdump/tools/out/post9016_no_opponent_clock_capture/capture_frame_00016.png)
4. [capture_frame_00024.png](/home/nivando-soares/asmdump/tools/out/post9016_default_rival_capture/capture_frame_00024.png)
   vs
   [capture_frame_00024.png](/home/nivando-soares/asmdump/tools/out/post9016_no_opponent_clock_capture/capture_frame_00024.png)
5. [capture_frame_00032.png](/home/nivando-soares/asmdump/tools/out/post9016_default_rival_capture/capture_frame_00032.png)
   vs
   [capture_frame_00032.png](/home/nivando-soares/asmdump/tools/out/post9016_no_opponent_clock_capture/capture_frame_00032.png)
6. [capture_frame_00040.png](/home/nivando-soares/asmdump/tools/out/post9016_default_rival_capture/capture_frame_00040.png)
   vs
   [capture_frame_00040.png](/home/nivando-soares/asmdump/tools/out/post9016_no_opponent_clock_capture/capture_frame_00040.png)

Reply format:

`1. <answer>`
`2. <answer>`
...

Questions:

1. Does the default-rival lane show a rival/opponent marker in the top radar
   strip that is absent in the no-opponent lane?
2. If yes, does that top-strip marker look like the first clearly meaningful
   visual difference in this window?
3. Beyond the top radar strip, do you see any lower dashboard or cockpit
   difference in `2048..2088`?
4. Beyond the top radar strip, do you see any road/world-object difference in
   `2048..2088`?
5. Does the first difference feel like HUD/tilemap (`BG`) or sprite/event
   (`OAM`)?
6. If the radar marker reading still feels ambiguous, what should I capture
   next: `later frames`, `radar crop`, `OAM off`, or `full HUD crop`?
