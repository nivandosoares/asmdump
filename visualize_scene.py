#!/usr/bin/env python3
from __future__ import annotations

import argparse
import json

from tools.scene_visualizer import SceneVisualizer


def main() -> None:
    parser = argparse.ArgumentParser(description="Visualizador de cenas SNES")
    parser.add_argument("--scene", required=True)
    parser.add_argument("--data-root", default="output")
    parser.add_argument("--scenes-file")
    parser.add_argument("--export")
    parser.add_argument("--tile-info", nargs=2, type=int, metavar=("X", "Y"))
    parser.add_argument("--generate-c-header")
    args = parser.parse_args()

    viz = SceneVisualizer(args.data_root, args.scenes_file)
    viz.load_scene(args.scene)
    viz.render_scene()

    if args.export:
        out = viz.export_png(args.export)
        print(f"✅ cena exportada: {out}")

    if args.tile_info:
        try:
            info = viz.show_tile_info(args.tile_info[0], args.tile_info[1])
            print(json.dumps(info, indent=2, ensure_ascii=False))
        except IndexError as exc:
            print(f"⚠️ {exc}")

    if args.generate_c_header:
        out = viz.generate_c_code(args.generate_c_header)
        print(f"✅ header C gerado: {out}")


if __name__ == "__main__":
    main()
