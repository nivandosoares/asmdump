#!/usr/bin/env bash
#
# Regression test: render key frames via headless mode and compare
# against golden reference screenshots captured from Mesen.
#
# Usage: ./test_regression.sh [sequence_manifest]
#
# Requires: port built (make), Python 3, golden PPM references in
# tools/out/. Checkpoints are mapped by manifest entry token.
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
FRAME_COUNT=$(find "$TMP_DIR" -maxdepth 1 -name 'frame_*.ppm' | wc -l)
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

find_entry_start_frame() {
    local token="$1"
    awk -v token="$token" '
        /^[[:space:]]*#/ || NF == 0 { next }
        {
            if (index($0, token) > 0) {
                print total
                found = 1
                exit
            }
            total += ($2 + 0)
        }
        END {
            if (!found) {
                exit 1
            }
        }
    ' "$SEQUENCE"
}

compare_frame() {
    local frame_num="$1"
    local golden="$2"
    local label="$3"
    local rendered
    rendered=$(printf "$TMP_DIR/frame_%05d.ppm" "$frame_num")

    if [ ! -f "$golden" ]; then
        echo "  $label @ frame $frame_num: SKIP (missing golden)"
        SKIP=$((SKIP + 1))
        return
    fi
    if [ ! -f "$rendered" ]; then
        echo "  $label @ frame $frame_num: SKIP (not rendered)"
        SKIP=$((SKIP + 1))
        return
    fi

    # Use compare_frames.py if available, otherwise byte-compare
    if [ -f "$COMPARE" ]; then
        local result mismatch mismatch_ratio
        result=$(python3 "$COMPARE" "$golden" "$rendered" 2>&1) || true
        mismatch=$(printf "%s\n" "$result" | awk -F': ' '/^mismatch:/ {split($2, a, " "); print a[1]; exit}')
        mismatch_ratio=$(printf "%s\n" "$result" | awk -F'[()]' '/^mismatch:/ {print $2; exit}')

        if [ -z "$mismatch" ]; then
            echo "  $label @ frame $frame_num: FAIL (could not parse compare output)"
            printf "%s\n" "$result" | sed 's/^/    /'
            FAIL=$((FAIL + 1))
        elif [ "$mismatch" -eq 0 ]; then
            echo "  $label @ frame $frame_num: PASS (pixel-perfect)"
            PASS=$((PASS + 1))
        else
            echo "  $label @ frame $frame_num: FAIL ($mismatch mismatched, ${mismatch_ratio:-ratio-unknown})"
            FAIL=$((FAIL + 1))
        fi
    else
        if cmp -s "$golden" "$rendered"; then
            echo "  $label @ frame $frame_num: PASS (byte-identical)"
            PASS=$((PASS + 1))
        else
            echo "  $label @ frame $frame_num: FAIL (differs)"
            FAIL=$((FAIL + 1))
        fi
    fi
}

echo ""
echo "--- Golden frame comparisons ---"

# label|manifest token|golden image
CHECKPOINTS=(
    "bootstrap_queue_978|bank1_bootstrap_queue_978_vram.bin|$TOOLS_OUT/bank1_bootstrap_queue_978.ppm"
    "bootstrap_queue_982|bank1_bootstrap_queue_982_vram.bin|$TOOLS_OUT/bank1_bootstrap_queue_982.ppm"
    "bridgeoverride_986|bank1_bootstrap_queue_986_bridgeoverride_vram.bin|$TOOLS_OUT/bank1_bootstrap_queue_986_bridgeoverride.ppm"
    "bridgeobj_990|bank1_bootstrap_queue_990_bridgeobj_vram.bin|$TOOLS_OUT/bank1_bootstrap_queue_990_bridgeobj.ppm"
    "mode7_visible_991|bank1_mode7_visible_991_vram.bin|$TOOLS_OUT/bank1_mode7_visible_991.ppm"
)

for checkpoint in "${CHECKPOINTS[@]}"; do
    IFS='|' read -r label token golden <<< "$checkpoint"
    if frame_num=$(find_entry_start_frame "$token" 2>/dev/null); then
        compare_frame "$frame_num" "$golden" "$label"
    else
        echo "  $label: SKIP (manifest token not found: $token)"
        SKIP=$((SKIP + 1))
    fi
done

echo ""
echo "--- Transition continuity checks ---"

check_zero_diff_pair() {
    local frame_a="$1"
    local frame_b="$2"
    local label="$3"
    local image_a image_b
    image_a=$(printf "$TMP_DIR/frame_%05d.ppm" "$frame_a")
    image_b=$(printf "$TMP_DIR/frame_%05d.ppm" "$frame_b")

    if [ ! -f "$image_a" ] || [ ! -f "$image_b" ]; then
        echo "  $label: SKIP (frames not rendered)"
        SKIP=$((SKIP + 1))
        return
    fi

    if [ -f "$COMPARE" ]; then
        local result mismatch mismatch_ratio
        result=$(python3 "$COMPARE" "$image_a" "$image_b" 2>&1) || true
        mismatch=$(printf "%s\n" "$result" | awk -F': ' '/^mismatch:/ {split($2, a, " "); print a[1]; exit}')
        mismatch_ratio=$(printf "%s\n" "$result" | awk -F'[()]' '/^mismatch:/ {print $2; exit}')

        if [ -z "$mismatch" ]; then
            echo "  $label: FAIL (could not parse compare output)"
            printf "%s\n" "$result" | sed 's/^/    /'
            FAIL=$((FAIL + 1))
        elif [ "$mismatch" -eq 0 ]; then
            echo "  $label: PASS (seamless)"
            PASS=$((PASS + 1))
        else
            echo "  $label: FAIL ($mismatch mismatched, ${mismatch_ratio:-ratio-unknown})"
            FAIL=$((FAIL + 1))
        fi
    else
        if cmp -s "$image_a" "$image_b"; then
            echo "  $label: PASS (byte-identical)"
            PASS=$((PASS + 1))
        else
            echo "  $label: FAIL (differs)"
            FAIL=$((FAIL + 1))
        fi
    fi
}

if hold_start=$(find_entry_start_frame "bank1_mode7_hold_1102_ppu_state.txt" 2>/dev/null); then
    if [ "$hold_start" -gt 0 ]; then
        check_zero_diff_pair "$((hold_start - 1))" "$hold_start" "mode7_hold_transition"
    else
        echo "  mode7_hold_transition: SKIP (hold starts at frame 0)"
        SKIP=$((SKIP + 1))
    fi
else
    echo "  mode7_hold_transition: SKIP (hold token not found)"
    SKIP=$((SKIP + 1))
fi

echo ""
echo "=== Results: $PASS passed, $FAIL failed, $SKIP skipped ==="

if [ "$FAIL" -gt 0 ]; then
    exit 1
fi
exit 0
