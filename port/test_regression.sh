#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
PORT_BIN="$SCRIPT_DIR/build/td2_port"
COMPARE="$REPO_DIR/tools/compare_frames.py"
TMP_DIR="$(mktemp -d)"
trap 'rm -rf "$TMP_DIR"' EXIT

if [ ! -x "$PORT_BIN" ]; then
    echo "error: missing $PORT_BIN; run 'make -C port' first" >&2
    exit 1
fi

if [ ! -f "$COMPARE" ]; then
    echo "error: missing compare helper: $COMPARE" >&2
    exit 1
fi

PASS=0
FAIL=0

render_and_compare() {
    local label="$1"
    local scene_dir="$2"
    local golden="$3"
    local prefix="$TMP_DIR/$label"
    local rendered="${prefix}_00000.ppm"
    local result mismatch ratio

    echo "--- $label ---"
    "$PORT_BIN" --scene-dir "$scene_dir" --headless --frames 1 --dump-prefix "$prefix"

    if [ ! -f "$rendered" ]; then
        echo "FAIL: missing rendered frame $rendered" >&2
        FAIL=$((FAIL + 1))
        return
    fi

    result=$(python3 "$COMPARE" "$golden" "$rendered")
    mismatch=$(printf "%s\n" "$result" | awk -F': ' '/^mismatch:/ {split($2, a, " "); print a[1]; exit}')
    ratio=$(printf "%s\n" "$result" | awk -F'[()]' '/^mismatch:/ {print $2; exit}')

    if [ "${mismatch:-}" = "0" ]; then
        echo "PASS: exact parity (${ratio:-0%})"
        PASS=$((PASS + 1))
    else
        echo "FAIL: ${mismatch:-unknown} mismatched pixels (${ratio:-unknown})" >&2
        FAIL=$((FAIL + 1))
    fi
}

echo "=== TD2 SNES Bootstrap Smoke ==="

render_and_compare \
    "frame300_bootstrap" \
    "$SCRIPT_DIR/assets/test_dump_frame300/design_pack" \
    "$SCRIPT_DIR/assets/test_dump_frame300/design_pack/layers/main_visible.ppm"

render_and_compare \
    "frame1086_bootstrap" \
    "$SCRIPT_DIR/assets/test_dump_range_1086_1093/design_pack_range/frame_01086" \
    "$SCRIPT_DIR/assets/test_dump_range_1086_1093/design_pack_range/frame_01086/layers/main_visible.ppm"

echo ""
echo "=== Results: $PASS passed, $FAIL failed ==="

if [ "$FAIL" -ne 0 ]; then
    exit 1
fi
