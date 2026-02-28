#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DEFAULT_MESEN_BIN="/home/nivando-soares/Mesen2/bin/linux-x64/Release/Mesen"
if [[ ! -x "$DEFAULT_MESEN_BIN" ]]; then
  DEFAULT_MESEN_BIN="/home/nivando-soares/Downloads/Mesen_2.1.1_Linux_x64/Mesen"
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

if [[ ! -x "$MESEN_BIN" ]]; then
  echo "error: Mesen binary not found or not executable: $MESEN_BIN" >&2
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
  XDG_CONFIG_HOME="$CONFIG_ROOT" \
    TD2_CAPTURE_SAVESTATE="$SAVESTATE_PATH" \
    "$MESEN_BIN" \
    --testRunner \
    --timeout="$TIMEOUT_SECONDS" \
    "$SCRIPT_PATH" \
    "$ROM_PATH"
)
