import json
import tempfile
import unittest
from pathlib import Path

from tools.scene_visualizer import SceneVisualizer


def _write_ppm(path: Path, r: int, g: int, b: int) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    payload = bytes([r, g, b] * 64)
    path.write_bytes(b"P6\n8 8\n255\n" + payload)


class SceneVisualizerTests(unittest.TestCase):
    def test_render_and_tile_info_and_c_header(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            (root / "tilemaps").mkdir(parents=True, exist_ok=True)
            (root / "graphics" / "bank06").mkdir(parents=True, exist_ok=True)

            _write_ppm(root / "graphics" / "bank06" / "tile_0000.ppm", 255, 0, 0)
            _write_ppm(root / "graphics" / "bank06" / "tile_0001.ppm", 0, 255, 0)

            grid = [
                [{"tile": 0, "palette": 1, "priority": 0, "h_flip": 0, "v_flip": 0}, {"tile": 1, "palette": 2, "priority": 1, "h_flip": 0, "v_flip": 0}],
            ]
            (root / "tilemaps" / "cockpit.json").write_text(json.dumps(grid), encoding="utf-8")

            scenes = {
                "test_scene": {
                    "tilemap": "tilemaps/cockpit.json",
                    "tiles_banks": [6],
                    "layers": ["bg1", "bg2"],
                }
            }
            scenes_path = root / "scenes.json"
            scenes_path.write_text(json.dumps(scenes), encoding="utf-8")

            viz = SceneVisualizer(root, scenes_path)
            viz.load_scene("test_scene")
            width, height, rgb = viz.render_scene()

            self.assertEqual((width, height), (16, 8))
            self.assertEqual(rgb[0:3], b"\xff\x00\x00")

            info = viz.show_tile_info(9, 1)
            self.assertEqual(info["tile"], 1)
            self.assertEqual(info["source_bank"], 6)

            out_png = viz.export_png(root / "preview.png")
            self.assertTrue(out_png.exists())

            out_h = viz.generate_c_code(root / "tilemap.h")
            text = out_h.read_text(encoding="utf-8")
            self.assertIn("test_scene_tilemap", text)


if __name__ == "__main__":
    unittest.main()
