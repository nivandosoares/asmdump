#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PORT_BIN="$SCRIPT_DIR/build/td2_port"
TMP_DIR="$(mktemp -d)"
trap 'rm -rf "$TMP_DIR"' EXIT

if [ ! -x "$PORT_BIN" ]; then
    echo "error: missing $PORT_BIN; run 'make -C port' first" >&2
    exit 1
fi

PASS=0
FAIL=0

run_compare() {
    local label="$1"
    local scene_dir="$2"
    local expected_callback_checks="${3:-0}"
    local prefix="$TMP_DIR/$label"
    local summary="${prefix}_00000_compare.json"
    local compare_ppm="${prefix}_00000_compare.ppm"
    local diff_ppm="${prefix}_00000_diff.ppm"
    local reference_ppm="${prefix}_00000_reference.ppm"
    local compare_status
    local mismatch
    local state_failures
    local callback_failures
    local callback_total_checks

    echo "--- $label ---"
    if ! "$PORT_BIN" \
            --scene-dir "$scene_dir" \
            --headless \
            --frames 1 \
            --compare \
            --fail-on-compare-diff \
            --dump-prefix "$prefix"; then
        echo "FAIL: compare lane returned non-zero" >&2
        FAIL=$((FAIL + 1))
        return
    fi

    if [ ! -f "$summary" ] || [ ! -f "$compare_ppm" ] || [ ! -f "$diff_ppm" ] || [ ! -f "$reference_ppm" ]; then
        echo "FAIL: missing compare artifacts for $label" >&2
        FAIL=$((FAIL + 1))
        return
    fi

    compare_status="$(python3 - <<'PY' "$summary"
import json
import sys
path = sys.argv[1]
with open(path, "r", encoding="utf-8") as file:
    payload = json.load(file)
print(payload["metrics"]["mismatch_pixels"])
print(payload["state_contract"]["failed_checks"])
print(payload["callback_contract"]["failed_checks"])
print(payload["callback_contract"]["total_checks"])
PY
)"
    mismatch="$(printf '%s\n' "$compare_status" | sed -n '1p')"
    state_failures="$(printf '%s\n' "$compare_status" | sed -n '2p')"
    callback_failures="$(printf '%s\n' "$compare_status" | sed -n '3p')"
    callback_total_checks="$(printf '%s\n' "$compare_status" | sed -n '4p')"

    if [ "$mismatch" = "0" ] &&
       [ "$state_failures" = "0" ] &&
       [ "$callback_failures" = "0" ] &&
       [ "$callback_total_checks" = "$expected_callback_checks" ]; then
        echo "PASS: compare bundle generated with exact pixel, PPU-state, and callback-state parity"
        PASS=$((PASS + 1))
    else
        echo "FAIL: compare summary reports $mismatch mismatched pixels, $state_failures PPU-state failures, $callback_failures callback failures, and $callback_total_checks callback checks (expected $expected_callback_checks)" >&2
        FAIL=$((FAIL + 1))
    fi
}

echo "=== TD2 Compare Lane Smoke ==="

run_compare \
    "frame300_compare" \
    "$SCRIPT_DIR/assets/test_dump_frame300/design_pack" \
    0

run_compare \
    "frame1086_compare" \
    "$SCRIPT_DIR/assets/test_dump_range_1086_1093/design_pack_range/frame_01086" \
    0

run_compare \
    "frame1093_compare" \
    "$SCRIPT_DIR/assets/test_dump_range_1086_1093/design_pack_range/frame_01093" \
    8

echo ""
echo "=== Results: $PASS passed, $FAIL failed ==="

if [ "$FAIL" -ne 0 ]; then
    exit 1
fi
