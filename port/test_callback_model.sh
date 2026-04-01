#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SMOKE_BIN="$SCRIPT_DIR/build/td2_callback_model_smoke"
SCENE_DIR="$SCRIPT_DIR/assets/test_dump_range_1086_1093/design_pack_range/frame_01093"

if [ ! -x "$SMOKE_BIN" ]; then
    echo "error: missing $SMOKE_BIN; run 'make -C port' first" >&2
    exit 1
fi

echo "=== TD2 Callback Model Smoke ==="
"$SMOKE_BIN" "$SCENE_DIR"
