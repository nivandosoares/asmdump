#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
exec "$ROOT_DIR/validation/run_mesen_capture.sh" \
  "${1:-$ROOT_DIR/game.smc}" \
  "$ROOT_DIR/validation/mesen_dump_bg_range.lua" \
  "${2:-}"
