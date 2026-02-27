#!/usr/bin/env python3
"""Visualização de cenas, sprites e pistas baseada nos assets extraídos."""

from __future__ import annotations

import json
from dataclasses import dataclass
from pathlib import Path
from typing import Any

from tools.exporters.c_header_generator import generate_c_header
from tools.ppm_to_png import read_ppm, write_png


@dataclass(slots=True)
class LayerState:
    enabled: bool = True


class SceneVisualizer:
    """Carrega dados extraídos e renderiza telas completas em memória."""

    DEFAULT_SCENES = {
        "gameplay_cockpit": {
            "tilemap": "tilemaps/cockpit.json",
            "tiles_banks": [6, 9],
            "palette": "gameplay",
            "layers": ["bg1", "bg2", "bg3"],
        },
        "main_menu": {
            "tilemap": "tilemaps/cockpit.json",
            "tiles_banks": [6],
            "palette": "main",
            "layers": ["bg1"],
        },
    }

    def __init__(self, data_root: str | Path = "output", scenes_file: str | Path | None = None, debug_mode: bool = True):
        self.data_root = Path(data_root)
        self.debug_mode = debug_mode
        self.scenes = self.load_extracted_data(scenes_file)
        self.current_scene_name: str | None = None
        self.current_scene: dict[str, Any] | None = None
        self.layer_state: dict[str, LayerState] = {}
        self.current_grid: list[list[dict[str, int]]] = []
        self.current_pixels: tuple[int, int, bytes] | None = None

    def load_extracted_data(self, scenes_file: str | Path | None = None) -> dict[str, Any]:
        if scenes_file:
            path = Path(scenes_file)
            return json.loads(path.read_text(encoding="utf-8"))
        return dict(self.DEFAULT_SCENES)

    def load_scene(self, scene_name: str) -> None:
        if scene_name not in self.scenes:
            raise KeyError(f"Cena '{scene_name}' não encontrada")
        self.current_scene_name = scene_name
        self.current_scene = self.scenes[scene_name]
        self.layer_state = {layer: LayerState(True) for layer in self.current_scene.get("layers", ["bg1"])}
        tilemap_path = self.data_root / self.current_scene["tilemap"]
        self.current_grid = json.loads(tilemap_path.read_text(encoding="utf-8"))

    def toggle_layer(self, layer_num: str | int) -> bool:
        key = f"bg{layer_num}" if isinstance(layer_num, int) else layer_num
        if key not in self.layer_state:
            raise KeyError(f"Layer '{key}' não existe na cena atual")
        self.layer_state[key].enabled = not self.layer_state[key].enabled
        return self.layer_state[key].enabled

    def _resolve_tile(self, tile_index: int) -> tuple[int, Path]:
        assert self.current_scene is not None
        banks = self.current_scene.get("tiles_banks", [])
        for bank in banks:
            path = self.data_root / "graphics" / f"bank{bank:02d}" / f"tile_{tile_index:04d}.ppm"
            if path.exists():
                return bank, path
        raise FileNotFoundError(f"Tile {tile_index} não encontrado nos banks {banks}")

    def render_scene(self) -> tuple[int, int, bytes]:
        if not self.current_grid or self.current_scene is None:
            raise RuntimeError("Nenhuma cena carregada")

        rows = len(self.current_grid)
        cols = max(len(row) for row in self.current_grid)
        width = cols * 8
        height = rows * 8
        canvas = bytearray(width * height * 3)

        # MVP: uma camada de tilemap; toggle de layers mantido para debug/instrumentação.
        for gy, row in enumerate(self.current_grid):
            for gx, entry in enumerate(row):
                tile_index = entry["tile"]
                _, tile_path = self._resolve_tile(tile_index)
                tw, th, trgb = read_ppm(tile_path)
                if tw != 8 or th != 8:
                    raise ValueError(f"Tile inesperado em {tile_path}: {tw}x{th}")

                for py in range(8):
                    for px in range(8):
                        src = (py * 8 + px) * 3
                        dx = gx * 8 + px
                        dy = gy * 8 + py
                        dst = (dy * width + dx) * 3
                        canvas[dst : dst + 3] = trgb[src : src + 3]

        self.current_pixels = (width, height, bytes(canvas))
        return self.current_pixels

    def export_png(self, output_path: str | Path) -> Path:
        if self.current_pixels is None:
            self.render_scene()
        assert self.current_pixels is not None
        width, height, rgb = self.current_pixels
        out = Path(output_path)
        out.parent.mkdir(parents=True, exist_ok=True)
        write_png(out, width, height, rgb)
        return out

    def show_tile_info(self, x: int, y: int) -> dict[str, Any]:
        if not self.current_grid:
            raise RuntimeError("Nenhuma cena carregada")
        tx = x // 8
        ty = y // 8
        if ty >= len(self.current_grid) or tx >= len(self.current_grid[ty]):
            raise IndexError("Coordenada fora da área da cena")

        entry = self.current_grid[ty][tx]
        bank, _ = self._resolve_tile(entry["tile"])
        return {
            "x": x,
            "y": y,
            "tile_x": tx,
            "tile_y": ty,
            "source_bank": bank,
            "tile": entry.get("tile", 0),
            "palette": entry.get("palette", 0),
            "priority": entry.get("priority", 0),
            "h_flip": entry.get("h_flip", 0),
            "v_flip": entry.get("v_flip", 0),
        }

    def generate_c_code(self, output_header: str | Path) -> Path:
        if not self.current_grid:
            raise RuntimeError("Nenhuma cena carregada")
        flat = bytearray()
        for row in self.current_grid:
            for entry in row:
                flat.extend((entry.get("tile", 0) & 0xFF, (entry.get("tile", 0) >> 8) & 0xFF))

        scene = self.current_scene_name or "scene"
        out = Path(output_header)
        generate_c_header(flat, f"{scene}_tilemap", out)
        return out


class SpriteViewer:
    """Visualizador simples de metasprites com exportação PNG."""

    def __init__(self, data_root: str | Path = "output"):
        self.data_root = Path(data_root)
        sprites_json = self.data_root / "sprites" / "metasprites.json"
        self.metasprites = json.loads(sprites_json.read_text(encoding="utf-8")) if sprites_json.exists() else {}

    def load_car_model(self, car_type: str, angle: str = "rear", distance: str = "near") -> dict[str, Any]:
        model = self.metasprites.get(car_type) or self.metasprites.get("car_model_0", [])
        return {"car_type": car_type, "angle": angle, "distance": distance, "parts": model}

    def render_car(self, car_type: str, output: str | Path, angle: str = "rear", distance: str = "near") -> Path:
        model = self.load_car_model(car_type, angle, distance)
        # MVP: render placeholder 64x32 para integração do pipeline.
        width, height = 64, 32
        rgb = bytearray(width * height * 3)
        for y in range(height):
            for x in range(width):
                p = (y * width + x) * 3
                rgb[p : p + 3] = bytes((40, 40, 40))

        # desenha blocos representando partes do metasprite
        for part in model["parts"]:
            px = part.get("x", 0) % width
            py = part.get("y", 0) % height
            idx = (py * width + px) * 3
            rgb[idx : idx + 3] = bytes((255, 80, 20))

        out = Path(output)
        out.parent.mkdir(parents=True, exist_ok=True)
        write_png(out, width, height, bytes(rgb))
        return out


class RoadVisualizer:
    """Visualização de pista em perspectiva simplificada para validação rápida."""

    def __init__(self, data_root: str | Path = "output"):
        self.data_root = Path(data_root)
        self.segments = {}

    def load_track(self, track_name: str = "bank13") -> list[dict[str, int]]:
        seg_path = self.data_root / "tracks" / "segments.json"
        all_data = json.loads(seg_path.read_text(encoding="utf-8")) if seg_path.exists() else {}
        self.segments = all_data.get(track_name, [])
        return self.segments

    def render_road_perspective(self, output: str | Path, position: int = 0, camera_angle: int = 0) -> Path:
        width, height = 320, 224
        rgb = bytearray(width * height * 3)

        # céu
        for y in range(height // 2):
            for x in range(width):
                p = (y * width + x) * 3
                rgb[p : p + 3] = bytes((70, 120, 180))

        # estrada com falsa perspectiva
        for y in range(height // 2, height):
            t = (y - height // 2) / (height // 2)
            road_half = int(20 + t * 120)
            center = width // 2 + camera_angle
            left = max(0, center - road_half)
            right = min(width - 1, center + road_half)
            for x in range(width):
                p = (y * width + x) * 3
                if left <= x <= right:
                    rgb[p : p + 3] = bytes((70, 70, 70))
                else:
                    rgb[p : p + 3] = bytes((20, 140, 30))

        out = Path(output)
        out.parent.mkdir(parents=True, exist_ok=True)
        write_png(out, width, height, bytes(rgb))
        return out


class WebExplorer:
    """Mini dashboard local para explorar cenas renderizadas."""

    def __init__(self, data_root: str | Path = "output"):
        self.data_root = Path(data_root)

    def launch_dashboard(self, host: str = "127.0.0.1", port: int = 8080) -> None:
        from http.server import SimpleHTTPRequestHandler, ThreadingHTTPServer
        from functools import partial

        web_root = self.data_root
        print(f"Dashboard em http://{host}:{port} (root={web_root})")
        handler = partial(SimpleHTTPRequestHandler, directory=str(web_root))
        server = ThreadingHTTPServer((host, port), handler)
        server.serve_forever()
