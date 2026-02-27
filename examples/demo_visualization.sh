#!/usr/bin/env bash
set -euo pipefail

DATA_ROOT="${1:-/tmp/asmdump_extract_check}"

python visualize_scene.py --scene gameplay_cockpit --data-root "$DATA_ROOT" --export "$DATA_ROOT/previews/cockpit_preview.png"
python visualize_sprites.py --car car_model_0 --data-root "$DATA_ROOT" --angle rear --scale near --export "$DATA_ROOT/previews/car_preview.png"
python visualize_track.py --track bank13 --data-root "$DATA_ROOT" --start 0 --output "$DATA_ROOT/previews/road_preview.png"

echo "Previews em $DATA_ROOT/previews"
