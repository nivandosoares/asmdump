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
CONFIG_ROOT="$ROOT_DIR/.mesen-config"
MESEN_HOME="$CONFIG_ROOT/Mesen2"
SETTINGS_TEMPLATE="${MESEN_SETTINGS_TEMPLATE:-$HOME/.config/Mesen2/settings.json}"
SETTINGS_PATH="$MESEN_HOME/settings.json"
TIMEOUT_SECONDS="${MESEN_TIMEOUT_SECONDS:-120}"

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

if [[ $# -gt 0 && "$1" != -* ]]; then
  ROM_PATH="$(make_absolute_from "$CALLER_CWD" "$1")"
  shift
else
  ROM_PATH="$ROOT_DIR/game.smc"
fi

if [[ ! -x "$MESEN_BIN" ]]; then
  echo "error: Mesen binary not found or not executable: $MESEN_BIN" >&2
  echo "set MESEN_BIN to the Mesen executable, or set MESEN_RELEASE_DIR to the Mesen release directory" >&2
  exit 1
fi

if [[ ! -f "$ROM_PATH" ]]; then
  echo "error: ROM not found: $ROM_PATH" >&2
  exit 1
fi

if [[ ! -f "$SETTINGS_TEMPLATE" ]]; then
  echo "error: settings template not found: $SETTINGS_TEMPLATE" >&2
  exit 1
fi

ARGS=()
EXPECTING_PATH_FOR=""
EXPORT_DIR=""
MANIFEST_OUT=""
LOAD_STATE_PATH=""

for arg in "$@"; do
  if [[ -n "$EXPECTING_PATH_FOR" ]]; then
    abs_path="$(make_absolute_from "$CALLER_CWD" "$arg")"
    ARGS+=("$abs_path")
    case "$EXPECTING_PATH_FOR" in
      export-dir) EXPORT_DIR="$abs_path" ;;
      manifest-out) MANIFEST_OUT="$abs_path" ;;
      load-state) LOAD_STATE_PATH="$abs_path" ;;
    esac
    EXPECTING_PATH_FOR=""
    continue
  fi

  case "$arg" in
    --export-dir|--manifest-out|--load-state)
      ARGS+=("$arg")
      EXPECTING_PATH_FOR="${arg#--}"
      ;;
    --export-dir=*|--manifest-out=*|--load-state=*)
      key="${arg%%=*}"
      value="${arg#*=}"
      abs_path="$(make_absolute_from "$CALLER_CWD" "$value")"
      ARGS+=("${key}=${abs_path}")
      case "$key" in
        --export-dir) EXPORT_DIR="$abs_path" ;;
        --manifest-out) MANIFEST_OUT="$abs_path" ;;
        --load-state) LOAD_STATE_PATH="$abs_path" ;;
      esac
      ;;
    *)
      ARGS+=("$arg")
      ;;
  esac
done

if [[ -n "$EXPECTING_PATH_FOR" ]]; then
  echo "error: missing value for --$EXPECTING_PATH_FOR" >&2
  exit 1
fi

if [[ -n "$LOAD_STATE_PATH" && ! -f "$LOAD_STATE_PATH" ]]; then
  echo "error: savestate not found: $LOAD_STATE_PATH" >&2
  exit 1
fi

if [[ -n "$EXPORT_DIR" ]]; then
  mkdir -p "$EXPORT_DIR"
fi

if [[ -n "$MANIFEST_OUT" ]]; then
  mkdir -p "$(dirname "$MANIFEST_OUT")"
fi

mkdir -p "$MESEN_HOME"
cp "$SETTINGS_TEMPLATE" "$SETTINGS_PATH"
sed -i 's/"AllowIoOsAccess": false/"AllowIoOsAccess": true/' "$SETTINGS_PATH"
sed -i 's/"ScriptTimeout": 1/"ScriptTimeout": 30/' "$SETTINGS_PATH"

echo "using Mesen binary: $MESEN_BIN"
echo "using isolated config: $MESEN_HOME"
echo "running lab backend with ROM: $ROM_PATH"

(
  cd "$ROOT_DIR"
  XDG_CONFIG_HOME="$CONFIG_ROOT" \
    timeout --preserve-status "${TIMEOUT_SECONDS}s" \
    "$MESEN_BIN" \
    --labRunner \
    "$ROM_PATH" \
    "${ARGS[@]}"
)
