#!/usr/bin/env python3
from __future__ import annotations

import argparse

from tools.scene_visualizer import SpriteViewer


def main() -> None:
    parser = argparse.ArgumentParser(description="Visualizador de sprites")
    parser.add_argument("--car", required=True)
    parser.add_argument("--angle", default="rear")
    parser.add_argument("--scale", default="near")
    parser.add_argument("--data-root", default="output")
    parser.add_argument("--export", required=True)
    args = parser.parse_args()

    viewer = SpriteViewer(args.data_root)
    out = viewer.render_car(args.car, args.export, args.angle, args.scale)
    print(f"✅ sprite exportado: {out}")


if __name__ == "__main__":
    main()
