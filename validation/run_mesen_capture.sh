#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CALLER_CWD="$(pwd -P)"
DEFAULT_MESEN_BIN=""
if [[ -n "${MESEN_RELEASE_DIR:-}" && -x "${MESEN_RELEASE_DIR}/Mesen" ]]; then
  DEFAULT_MESEN_BIN="${MESEN_RELEASE_DIR}/Mesen"
elif command -v Mesen >/dev/null 2>&1; then
  DEFAULT_MESEN_BIN="$(command -v Mesen)"
elif command -v mesen >/dev/null 2>&1; then
  DEFAULT_MESEN_BIN="$(command -v mesen)"
fi
MESEN_BIN="${MESEN_BIN:-$DEFAULT_MESEN_BIN}"
ROM_PATH="${1:-$ROOT_DIR/game.smc}"
SCRIPT_PATH="${2:-$ROOT_DIR/validation/mesen_capture.lua}"
SAVESTATE_PATH="${3:-}"
CONFIG_ROOT="$ROOT_DIR/.mesen-config"
MESEN_HOME="$CONFIG_ROOT/Mesen2"
SETTINGS_TEMPLATE="${MESEN_SETTINGS_TEMPLATE:-$HOME/.config/Mesen2/settings.json}"
SETTINGS_PATH="$MESEN_HOME/settings.json"
TIMEOUT_SECONDS="${MESEN_TIMEOUT_SECONDS:-20}"

make_absolute_from() {
  local base_dir="$1"
  local path="$2"

  if [[ -z "$path" ]]; then
    printf '%s' ""
    return
  fi

  case "$path" in
    /*) printf '%s\n' "$path" ;;
    *) printf '%s/%s\n' "$base_dir" "$path" ;;
  esac
}

ROM_PATH="$(make_absolute_from "$CALLER_CWD" "$ROM_PATH")"
SCRIPT_PATH="$(make_absolute_from "$CALLER_CWD" "$SCRIPT_PATH")"
if [[ -n "$SAVESTATE_PATH" ]]; then
  SAVESTATE_PATH="$(make_absolute_from "$CALLER_CWD" "$SAVESTATE_PATH")"
fi

TD2_CAPTURE_OUTPUT_PREFIX_ABS="$(make_absolute_from "$ROOT_DIR" "${TD2_CAPTURE_OUTPUT_PREFIX:-}")"
TD2_BG_RANGE_OUTPUT_PREFIX_ABS="$(make_absolute_from "$ROOT_DIR" "${TD2_BG_RANGE_OUTPUT_PREFIX:-}")"
TD2_BOOT_PROBE_OUTPUT_PREFIX_ABS="$(make_absolute_from "$ROOT_DIR" "${TD2_BOOT_PROBE_OUTPUT_PREFIX:-}")"
TD2_SCANLINE_TEST_OUTPUT_PREFIX_ABS="$(make_absolute_from "$ROOT_DIR" "${TD2_SCANLINE_TEST_OUTPUT_PREFIX:-}")"
TD2_LIVE_PROBE_OUTPUT_PREFIX_ABS="$(make_absolute_from "$ROOT_DIR" "${TD2_LIVE_PROBE_OUTPUT_PREFIX:-}")"
TD2_BOOT_PROBE_SAVE_SAVESTATE_ABS="$(make_absolute_from "$ROOT_DIR" "${TD2_BOOT_PROBE_SAVE_SAVESTATE:-}")"

if [[ ! -x "$MESEN_BIN" ]]; then
  echo "error: Mesen binary not found or not executable: $MESEN_BIN" >&2
  echo "set MESEN_BIN to the Mesen executable, or set MESEN_RELEASE_DIR to the Mesen release directory" >&2
  exit 1
fi

if [[ ! -f "$ROM_PATH" ]]; then
  echo "error: ROM not found: $ROM_PATH" >&2
  exit 1
fi

if [[ ! -f "$SCRIPT_PATH" ]]; then
  echo "error: Lua script not found: $SCRIPT_PATH" >&2
  exit 1
fi

if [[ -n "$SAVESTATE_PATH" && ! -f "$SAVESTATE_PATH" ]]; then
  echo "error: savestate not found: $SAVESTATE_PATH" >&2
  exit 1
fi

if [[ ! -f "$SETTINGS_TEMPLATE" ]]; then
  echo "error: settings template not found: $SETTINGS_TEMPLATE" >&2
  exit 1
fi

mkdir_parent_if_set() {
  local path="$1"
  if [[ -n "$path" ]]; then
    mkdir -p "$(dirname "$path")"
  fi
}

mkdir_parent_if_set "$TD2_CAPTURE_OUTPUT_PREFIX_ABS"
mkdir_parent_if_set "$TD2_BG_RANGE_OUTPUT_PREFIX_ABS"
mkdir_parent_if_set "$TD2_BOOT_PROBE_OUTPUT_PREFIX_ABS"
mkdir_parent_if_set "$TD2_SCANLINE_TEST_OUTPUT_PREFIX_ABS"
mkdir_parent_if_set "$TD2_LIVE_PROBE_OUTPUT_PREFIX_ABS"
mkdir_parent_if_set "$TD2_BOOT_PROBE_SAVE_SAVESTATE_ABS"

mkdir -p "$MESEN_HOME"
cp "$SETTINGS_TEMPLATE" "$SETTINGS_PATH"
sed -i 's/"AllowIoOsAccess": false/"AllowIoOsAccess": true/' "$SETTINGS_PATH"
sed -i 's/"ScriptTimeout": 1/"ScriptTimeout": 30/' "$SETTINGS_PATH"

echo "using Mesen binary: $MESEN_BIN"
echo "using isolated config: $MESEN_HOME"
echo "running test runner with ROM: $ROM_PATH"
echo "running Lua script: $SCRIPT_PATH"
if [[ -n "$SAVESTATE_PATH" ]]; then
  echo "loading savestate via Lua exec callback: $SAVESTATE_PATH"
fi

(
  cd "$ROOT_DIR"
  if [[ -n "$TD2_CAPTURE_OUTPUT_PREFIX_ABS" ]]; then
    export TD2_CAPTURE_OUTPUT_PREFIX="$TD2_CAPTURE_OUTPUT_PREFIX_ABS"
  fi
  if [[ -n "$TD2_BG_RANGE_OUTPUT_PREFIX_ABS" ]]; then
    export TD2_BG_RANGE_OUTPUT_PREFIX="$TD2_BG_RANGE_OUTPUT_PREFIX_ABS"
  fi
  if [[ -n "$TD2_BOOT_PROBE_OUTPUT_PREFIX_ABS" ]]; then
    export TD2_BOOT_PROBE_OUTPUT_PREFIX="$TD2_BOOT_PROBE_OUTPUT_PREFIX_ABS"
  fi
  if [[ -n "$TD2_SCANLINE_TEST_OUTPUT_PREFIX_ABS" ]]; then
    export TD2_SCANLINE_TEST_OUTPUT_PREFIX="$TD2_SCANLINE_TEST_OUTPUT_PREFIX_ABS"
  fi
  if [[ -n "$TD2_LIVE_PROBE_OUTPUT_PREFIX_ABS" ]]; then
    export TD2_LIVE_PROBE_OUTPUT_PREFIX="$TD2_LIVE_PROBE_OUTPUT_PREFIX_ABS"
  fi
  if [[ -n "$TD2_BOOT_PROBE_SAVE_SAVESTATE_ABS" ]]; then
    export TD2_BOOT_PROBE_SAVE_SAVESTATE="$TD2_BOOT_PROBE_SAVE_SAVESTATE_ABS"
  fi
  XDG_CONFIG_HOME="$CONFIG_ROOT" \
    TD2_CAPTURE_SAVESTATE="$SAVESTATE_PATH" \
    "$MESEN_BIN" \
    --testRunner \
    --timeout="$TIMEOUT_SECONDS" \
    "$SCRIPT_PATH" \
    "$ROM_PATH"
)
