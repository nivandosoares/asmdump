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
    --timeline "$SCRIPT_DIR/assets/native_demo_archaeology_timeline.txt" \
    --window-width 960 \
    --window-height 540 \
    --frames 70)"

printf '%s\n' "$OUTPUT"

if ! printf '%s\n' "$OUTPUT" | grep -q "native_sdl=on"; then
    echo "FAIL: demo launcher did not report native SDL startup" >&2
    exit 1
fi

if ! printf '%s\n' "$OUTPUT" | grep -q "mode=timeline"; then
    echo "FAIL: demo launcher did not enter timeline mode" >&2
    exit 1
fi

if ! printf '%s\n' "$OUTPUT" | grep -q "Timeline clip 2/"; then
    echo "FAIL: demo launcher did not advance beyond the first clip" >&2
    exit 1
fi
