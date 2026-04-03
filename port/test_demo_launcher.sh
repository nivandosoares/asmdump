#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
DEMO_BIN="$SCRIPT_DIR/build/td2_demo"

if [ ! -x "$DEMO_BIN" ]; then
    echo "error: missing $DEMO_BIN; run 'make -C port' first" >&2
    exit 1
fi

echo "=== TD2 Demo Launcher Smoke ==="
cd "$SCRIPT_DIR"

OUTPUT="$(SDL_VIDEODRIVER=dummy "$DEMO_BIN" \
    --scene-dir ../tools/out/design_lane3_live_race_mid_frame0_native \
    --scheduler-profile gameplay_live_race_mid \
    --window-width 960 \
    --window-height 540 \
    --frames 2)"

printf '%s\n' "$OUTPUT"

if ! printf '%s\n' "$OUTPUT" | grep -q "native_sdl=on"; then
    echo "FAIL: demo launcher did not report native SDL startup" >&2
    exit 1
fi
