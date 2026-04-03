#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
DEMO_BIN="$SCRIPT_DIR/build/td2_demo"
DEFAULT_TIMELINE="$SCRIPT_DIR/assets/native_demo_archaeology_timeline.txt"

if [ ! -x "$DEMO_BIN" ]; then
    echo "error: missing $DEMO_BIN; run 'make -C port' first" >&2
    exit 1
fi

exec "$DEMO_BIN" \
    --timeline "$DEFAULT_TIMELINE" \
    --window-width 1280 \
    --window-height 896 \
    "$@"
