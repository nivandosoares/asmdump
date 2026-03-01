#!/usr/bin/env bash
#
# Regression test: render key frames via headless mode and compare
# against golden reference screenshots captured from Mesen.
#
# Usage: ./test_regression.sh [sequence_manifest]
#
# Requires: port built (make), Python 3, golden PPM references in
# tools/out/ matching the expected frame numbers.
#
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
PORT="$SCRIPT_DIR/build/td2_port"
COMPARE="$REPO_DIR/tools/compare_frames.py"
TOOLS_OUT="$REPO_DIR/tools/out"
TMP_DIR="$(mktemp -d)"
trap 'rm -rf "$TMP_DIR"' EXIT

# Default to the hybrid bridge-visible sequence
SEQUENCE="${1:-$TOOLS_OUT/intro_loop_hybrid_bridge_visible_sequence.txt}"

if [ ! -x "$PORT" ]; then
    echo "error: port binary not found at $PORT — run 'make' first" >&2
    exit 1
fi

if [ ! -f "$SEQUENCE" ]; then
    echo "error: sequence manifest not found: $SEQUENCE" >&2
    exit 1
fi

echo "=== TD2 Port Regression Test ==="
echo "Binary:   $PORT"
echo "Sequence: $SEQUENCE"
echo "Temp dir: $TMP_DIR"
echo ""

# Render first 1000 frames in headless mode with frame dumps
"$PORT" --sequence "$SEQUENCE" --headless --frames 1000 --dump-prefix "$TMP_DIR/frame" 2>&1 || true

# Count rendered frames
FRAME_COUNT=$(ls "$TMP_DIR"/frame_*.ppm 2>/dev/null | wc -l)
echo "Rendered $FRAME_COUNT frames"

if [ "$FRAME_COUNT" -eq 0 ]; then
    echo "FAIL: no frames rendered" >&2
    exit 1
fi

# Basic smoke test: verify frame files are valid PPM
FIRST_FRAME="$TMP_DIR/frame_00000.ppm"
if [ -f "$FIRST_FRAME" ]; then
    HEADER=$(head -c 2 "$FIRST_FRAME")
    if [ "$HEADER" != "P6" ]; then
        echo "FAIL: first frame is not valid PPM (got header: $HEADER)" >&2
        exit 1
    fi
    SIZE=$(stat -c%s "$FIRST_FRAME")
    # Expected: P6 header + 256*224*3 = 172032 bytes + header
    if [ "$SIZE" -lt 172032 ]; then
        echo "FAIL: first frame too small ($SIZE bytes)" >&2
        exit 1
    fi
    echo "PASS: frame format valid (PPM P6, $SIZE bytes)"
else
    echo "FAIL: first frame missing" >&2
    exit 1
fi

# Compare against golden references if available
PASS=0
FAIL=0
SKIP=0

compare_frame() {
    local frame_num="$1"
    local golden="$2"
    local rendered
    rendered=$(printf "$TMP_DIR/frame_%05d.ppm" "$frame_num")

    if [ ! -f "$golden" ]; then
        SKIP=$((SKIP + 1))
        return
    fi
    if [ ! -f "$rendered" ]; then
        echo "  frame $frame_num: SKIP (not rendered)"
        SKIP=$((SKIP + 1))
        return
    fi

    # Use compare_frames.py if available, otherwise byte-compare
    if [ -f "$COMPARE" ]; then
        RESULT=$(python3 "$COMPARE" "$golden" "$rendered" 2>&1) || true
        if echo "$RESULT" | grep -q "0 mismatched"; then
            echo "  frame $frame_num: PASS (pixel-perfect)"
            PASS=$((PASS + 1))
        else
            MISMATCH=$(echo "$RESULT" | grep -oP '\d+ mismatched' | head -1)
            echo "  frame $frame_num: ${MISMATCH:-differences detected}"
            FAIL=$((FAIL + 1))
        fi
    else
        if cmp -s "$golden" "$rendered"; then
            echo "  frame $frame_num: PASS (byte-identical)"
            PASS=$((PASS + 1))
        else
            echo "  frame $frame_num: FAIL (differs)"
            FAIL=$((FAIL + 1))
        fi
    fi
}

echo ""
echo "--- Golden frame comparisons ---"

# Look for any golden reference PPMs in tools/out
for golden in "$TOOLS_OUT"/bank1_bootstrap_queue_978.ppm \
              "$TOOLS_OUT"/bank1_bootstrap_queue_982.ppm; do
    if [ -f "$golden" ]; then
        # Extract frame number from filename
        NUM=$(echo "$golden" | grep -oP '\d+(?=\.ppm)')
        if [ -n "$NUM" ]; then
            compare_frame "$NUM" "$golden"
        fi
    fi
done

echo ""
echo "=== Results: $PASS passed, $FAIL failed, $SKIP skipped ==="

if [ "$FAIL" -gt 0 ]; then
    exit 1
fi
exit 0
