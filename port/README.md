Minimal PC port skeleton for The Duel: Test Drive II.

This folder contains a tiny SDL2-based runtime skeleton used as an iterative starting point for the port. It provides:

- a fixed 60Hz main loop
- 256x224 internal framebuffer presented via an SDL texture and nearest scaling
- basic input handling (keyboard, ESC quits)
- a debug overlay via console output (FPS and state)

Build (requires SDL2 development libraries):

  cd port
  make

Run:

  ./port

Notes:
- This is a minimal scaffold. Replace or expand platform_*.c/h with your production platform layer.
- The Makefile uses `sdl2-config` if available or pkg-config as a fallback.
