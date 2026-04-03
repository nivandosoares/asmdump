#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
DEMO_BIN="$SCRIPT_DIR/build/td2_demo"
DEFAULT_SCENE="$REPO_DIR/tools/out/design_lane3_live_race_mid_frame0_native"

if [ ! -x "$DEMO_BIN" ]; then
    echo "error: missing $DEMO_BIN; run 'make -C port' first" >&2
    exit 1
fi

exec "$DEMO_BIN" \
    --scene-dir "$DEFAULT_SCENE" \
    --scheduler-profile gameplay_live_race_mid \
    --window-width 1280 \
    --window-height 896 \
    "$@"
