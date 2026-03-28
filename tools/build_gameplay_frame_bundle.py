#!/usr/bin/env python3
"""Package one gameplay frame dump into a small review bundle."""

from __future__ import annotations

import argparse
import json
import shutil
import subprocess
from pathlib import Path


REPO_ROOT = Path(__file__).resolve().parents[1]


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description=(
            "Take one flat gameplay frame dump (VRAM/CGRAM/OAM/PPU/screenshot) and "
            "materialize a review bundle with raw files, isolated layer renders, and "
            "a lightweight design pack."
        )
    )
    parser.add_argument("--label", required=True, help="Short bundle label.")
    parser.add_argument("--frame", type=int, required=True, help="Absolute frame number.")
    parser.add_argument("--vram", type=Path, required=True, help="VRAM dump path.")
    parser.add_argument("--cgram", type=Path, required=True, help="CGRAM dump path.")
    parser.add_argument("--ppu-state", type=Path, required=True, help="PPU-state JSON path.")
    parser.add_argument("--oam", type=Path, help="Optional OAM dump path.")
    parser.add_argument("--screenshot", type=Path, help="Optional screenshot path.")
    parser.add_argument("--out-dir", type=Path, required=True, help="Bundle output directory.")
    return parser.parse_args()


def resolve_path(path: Path) -> Path:
    return path if path.is_absolute() else (Path.cwd() / path)


def repo_rel(path: Path) -> str:
    resolved = path.resolve()
    try:
        return resolved.relative_to(REPO_ROOT).as_posix()
    except ValueError:
        return resolved.as_posix()


def copy_file(src: Path, dst: Path) -> None:
    dst.parent.mkdir(parents=True, exist_ok=True)
    shutil.copy2(src, dst)


def render_scene(
    root: Path,
    vram: Path,
    cgram: Path,
    ppu_state: Path,
    output: Path,
    *,
    oam: Path | None = None,
    json_out: Path | None = None,
) -> None:
    command = [
        "python3",
        "tools/render_mesen_snes_bg.py",
        str(vram),
        str(cgram),
        str(ppu_state),
        str(output),
    ]
    if oam is not None:
        command.extend(["--oam", str(oam)])
    if json_out is not None:
        command.extend(["--json-out", str(json_out)])
    subprocess.run(command, cwd=root, check=True)


def write_json(path: Path, payload: dict) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(payload, indent=2) + "\n", encoding="utf-8")


def main() -> None:
    args = parse_args()
    root = REPO_ROOT

    vram_src = resolve_path(args.vram)
    cgram_src = resolve_path(args.cgram)
    ppu_src = resolve_path(args.ppu_state)
    oam_src = resolve_path(args.oam) if args.oam else None
    screenshot_src = resolve_path(args.screenshot) if args.screenshot else None
    out_dir = resolve_path(args.out_dir)
    frame_dir = out_dir / "frame_dir"
    raw_dir = out_dir / "raw"
    render_dir = out_dir / "renders"
    design_pack_dir = out_dir / "design_pack"

    out_dir.mkdir(parents=True, exist_ok=True)
    frame_dir.mkdir(parents=True, exist_ok=True)
    raw_dir.mkdir(parents=True, exist_ok=True)
    render_dir.mkdir(parents=True, exist_ok=True)

    raw_vram = raw_dir / "vram.bin"
    raw_cgram = raw_dir / "cgram.bin"
    raw_ppu = raw_dir / "ppu_state.json"
    raw_oam = raw_dir / "oam.bin"

    for src, dst in ((vram_src, raw_vram), (cgram_src, raw_cgram), (ppu_src, raw_ppu)):
        copy_file(src, dst)
    if oam_src is not None:
        copy_file(oam_src, raw_oam)
    if screenshot_src is not None:
        copy_file(screenshot_src, out_dir / "frame.png")

    copy_file(raw_vram, frame_dir / "vram.bin")
    copy_file(raw_cgram, frame_dir / "cgram.bin")
    copy_file(raw_ppu, frame_dir / "ppu_state.json")
    if oam_src is not None:
        copy_file(raw_oam, frame_dir / "oam.bin")

    state = json.loads(raw_ppu.read_text(encoding="utf-8"))
    layer_masks = {
        "main": 0x13,
        "bg1": 0x01,
        "bg2": 0x02,
        "obj": 0x10,
    }

    layer_ppu_paths: dict[str, Path] = {}
    for name, mask in layer_masks.items():
        layer_state = dict(state)
        layer_state["ppu.mainScreenLayers"] = mask
        layer_state["ppu.subScreenLayers"] = 0
        layer_path = render_dir / f"{name}_ppu_state.json"
        write_json(layer_path, layer_state)
        layer_ppu_paths[name] = layer_path

    render_targets = {
        "main": render_dir / "main.ppm",
        "bg1": render_dir / "bg1.ppm",
        "bg2": render_dir / "bg2.ppm",
        "obj": render_dir / "obj.ppm",
    }
    render_jsons = {
        "main": render_dir / "main_render.json",
        "bg1": render_dir / "bg1_render.json",
        "bg2": render_dir / "bg2_render.json",
        "obj": render_dir / "obj_render.json",
    }

    for name in ("main", "bg1", "bg2"):
        render_scene(
            root,
            raw_vram,
            raw_cgram,
            layer_ppu_paths[name],
            render_targets[name],
            json_out=render_jsons[name],
        )
    render_scene(
        root,
        raw_vram,
        raw_cgram,
        layer_ppu_paths["obj"],
        render_targets["obj"],
        oam=raw_oam if oam_src is not None else None,
        json_out=render_jsons["obj"],
    )

    for name in ("bg1", "bg2"):
        copy_file(render_targets[name], frame_dir / f"{name}.ppm")
        copy_file(render_targets[name], out_dir / f"{name}.ppm")
        copy_file(render_jsons[name], out_dir / f"{name}_render.json")
    copy_file(render_targets["obj"], frame_dir / "obj.ppm")
    copy_file(render_targets["obj"], out_dir / "obj.ppm")
    copy_file(render_jsons["obj"], out_dir / "obj_render.json")
    copy_file(render_targets["main"], out_dir / "main.ppm")
    copy_file(render_jsons["main"], out_dir / "main_render.json")

    subprocess.run(
        [
            "python3",
            "tools/build_mesen_design_pack.py",
            str(frame_dir),
            str(design_pack_dir),
            "--clean-out",
        ],
        cwd=root,
        check=True,
    )

    manifest = {
        "label": args.label,
        "frame": args.frame,
        "bundle_dir": repo_rel(out_dir),
        "sources": {
            "vram": repo_rel(vram_src),
            "cgram": repo_rel(cgram_src),
            "ppu_state": repo_rel(ppu_src),
            "oam": repo_rel(oam_src) if oam_src is not None else None,
            "screenshot": repo_rel(screenshot_src) if screenshot_src is not None else None,
        },
        "outputs": {
            "main_ppm": repo_rel(out_dir / "main.ppm"),
            "frame_png": repo_rel(out_dir / "frame.png") if screenshot_src is not None else None,
            "bg1_ppm": repo_rel(out_dir / "bg1.ppm"),
            "bg2_ppm": repo_rel(out_dir / "bg2.ppm"),
            "obj_ppm": repo_rel(out_dir / "obj.ppm"),
            "design_pack": repo_rel(design_pack_dir / "design_pack.json"),
        },
    }
    write_json(out_dir / "bundle_manifest.json", manifest)


if __name__ == "__main__":
    main()
