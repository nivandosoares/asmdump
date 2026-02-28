#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PROJECT_DIR="$ROOT_DIR/tools/mesen_ppu_extract"
DEFAULT_RELEASE_DIR="/home/nivando-soares/Mesen2/bin/linux-x64/Release"
MESEN_RELEASE_DIR="${MESEN_RELEASE_DIR:-$DEFAULT_RELEASE_DIR}"

if [[ ! -f "$MESEN_RELEASE_DIR/MesenCore.so" ]]; then
  echo "error: MesenCore.so not found in $MESEN_RELEASE_DIR" >&2
  echo "set MESEN_RELEASE_DIR to the Mesen Linux release directory" >&2
  exit 1
fi

dotnet build "$PROJECT_DIR/mesen_ppu_extract.csproj" \
  --configfile "$PROJECT_DIR/NuGet.Config" \
  >/dev/null

env LD_LIBRARY_PATH="$MESEN_RELEASE_DIR${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}" \
  dotnet "$PROJECT_DIR/bin/Debug/net8.0/mesen_ppu_extract.dll" "$@"
