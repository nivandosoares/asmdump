# Post-02:9016 Visual Review

This pack compares the first shared gameplay-facing window after both recovered
paths have already converged to the same callback corridor:

- default rival path:
  `tools/out/post9016_default_rival_capture/`
- no-opponent clock path:
  `tools/out/post9016_no_opponent_clock_capture/`

Both captures cover frames `2044..2084` from boot, sampled every `4` frames.

Frame mapping:

- `capture_frame_00000.png` = frame `2044`
- `capture_frame_00004.png` = frame `2048`
- `capture_frame_00008.png` = frame `2052`
- `capture_frame_00012.png` = frame `2056`
- `capture_frame_00016.png` = frame `2060`
- `capture_frame_00020.png` = frame `2064`
- `capture_frame_00024.png` = frame `2068`
- `capture_frame_00028.png` = frame `2072`
- `capture_frame_00032.png` = frame `2076`
- `capture_frame_00036.png` = frame `2080`
- `capture_frame_00040.png` = frame `2084`

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

1. In the earliest pair where you can tell the paths apart, which frame is it?
   If none, answer `no visible delta in 2044..2084`.
2. Do you see any rival-specific indicator in the default-rival path that is
   missing in the clock path?
   Examples: radar dot, HUD marker, opponent car, text, icon.
3. Does the first visible difference look like cockpit/HUD (`BG`) or a moving
   object/event (`OAM`)?
   If unsure, answer `unclear`.
4. Is there any top-of-screen radar difference between the two paths in this
   window?
5. Is there any lower dashboard/panel difference between the two paths in this
   window?
6. Do both paths show the same road traffic and world objects here, or does one
   path visibly suppress an opponent/vehicle?
7. If you had to name the first clearly different element, what is it?
8. If nothing in these screenshots is enough, which later window should I
   capture next?
   You can answer with a rough direction like `20-40 frames later`,
   `need OAM off`, `need radar close-up`, or `need full HUD crop`.
