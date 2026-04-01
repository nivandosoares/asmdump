#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SMOKE_BIN="$SCRIPT_DIR/build/td2_scanline_contract_smoke"

if [ ! -x "$SMOKE_BIN" ]; then
    echo "error: missing $SMOKE_BIN; run 'make -C port' first" >&2
    exit 1
fi

echo "=== TD2 Scanline Contract Smoke ==="
cd "$SCRIPT_DIR"
"$SMOKE_BIN"
