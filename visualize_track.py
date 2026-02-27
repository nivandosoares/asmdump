#!/usr/bin/env python3
from __future__ import annotations

import argparse

from tools.scene_visualizer import RoadVisualizer


def main() -> None:
    parser = argparse.ArgumentParser(description="Visualizador de pista")
    parser.add_argument("--track", default="bank13")
    parser.add_argument("--start", type=int, default=0)
    parser.add_argument("--camera-angle", type=int, default=0)
    parser.add_argument("--data-root", default="output")
    parser.add_argument("--output", required=True)
    args = parser.parse_args()

    viewer = RoadVisualizer(args.data_root)
    viewer.load_track(args.track)
    out = viewer.render_road_perspective(args.output, args.start, args.camera_angle)
    print(f"✅ pista exportada: {out}")


if __name__ == "__main__":
    main()
