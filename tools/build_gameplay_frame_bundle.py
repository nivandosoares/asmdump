#!/usr/bin/env python3
"""Package one gameplay frame dump into a small review bundle."""

from __future__ import annotations

import argparse
import json
import shutil
import struct
import subprocess
import tempfile
import zlib
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
    parser.add_argument(
        "--native-frame-dir",
        type=Path,
        help=(
            "Optional mesen_ppu_extract frame directory. When provided, the bundle also "
            "promotes native visible-layer and sprite artifacts from that extraction."
        ),
    )
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


def skip_pnm_space_and_comments(data: bytes, offset: int) -> int:
    while offset < len(data):
        byte = data[offset]
        if byte in b" \t\r\n":
            offset += 1
            continue
        if byte == 35:
            while offset < len(data) and data[offset] not in b"\r\n":
                offset += 1
            continue
        break
    return offset


def read_pnm_token(data: bytes, offset: int) -> tuple[str, int]:
    offset = skip_pnm_space_and_comments(data, offset)
    start = offset
    while offset < len(data) and data[offset] not in b" \t\r\n#":
        offset += 1
    if start == offset:
        raise ValueError("unexpected end of PNM header")
    return data[start:offset].decode("ascii"), offset


def scale_sample(sample: int, maxval: int) -> int:
    if maxval <= 0:
        return 0
    if maxval == 255:
        return sample
    return round(sample * 255 / maxval)


def read_pnm_rgb(source_path: Path) -> tuple[int, int, bytes]:
    data = source_path.read_bytes()
    magic, offset = read_pnm_token(data, 0)
    if magic not in {"P6", "P5", "P3", "P2"}:
        raise ValueError(f"unsupported PNM format: {magic}")

    width_token, offset = read_pnm_token(data, offset)
    height_token, offset = read_pnm_token(data, offset)
    maxval_token, offset = read_pnm_token(data, offset)
    width = int(width_token)
    height = int(height_token)
    maxval = int(maxval_token)
    if width <= 0 or height <= 0:
        raise ValueError("invalid PNM dimensions")

    if magic in {"P6", "P5"}:
        offset = skip_pnm_space_and_comments(data, offset)
        channels = 3 if magic == "P6" else 1
        bytes_per_sample = 1 if maxval < 256 else 2
        sample_count = width * height * channels
        expected_bytes = sample_count * bytes_per_sample
        payload = data[offset : offset + expected_bytes]
        if len(payload) != expected_bytes:
            raise ValueError("truncated PNM payload")
        if bytes_per_sample == 1:
            samples = list(payload)
        else:
            samples = [
                int.from_bytes(payload[index : index + 2], "big")
                for index in range(0, len(payload), 2)
            ]
    else:
        channels = 3 if magic == "P3" else 1
        sample_count = width * height * channels
        samples = []
        for _ in range(sample_count):
            token, offset = read_pnm_token(data, offset)
            samples.append(int(token))

    samples = [scale_sample(sample, maxval) for sample in samples]
    if channels == 3:
        rgb = bytes(samples)
    else:
        rgb = bytes(component for sample in samples for component in (sample, sample, sample))
    return width, height, rgb


def png_chunk(tag: bytes, payload: bytes) -> bytes:
    return (
        struct.pack(">I", len(payload))
        + tag
        + payload
        + struct.pack(">I", zlib.crc32(tag + payload) & 0xFFFFFFFF)
    )


def write_png_from_rgb(dest_path: Path, width: int, height: int, rgb: bytes) -> None:
    rows = []
    stride = width * 3
    for row_index in range(height):
        start = row_index * stride
        rows.append(b"\x00" + rgb[start : start + stride])
    payload = zlib.compress(b"".join(rows), level=9)
    ihdr = struct.pack(">IIBBBBB", width, height, 8, 2, 0, 0, 0)
    png_bytes = (
        b"\x89PNG\r\n\x1a\n"
        + png_chunk(b"IHDR", ihdr)
        + png_chunk(b"IDAT", payload)
        + png_chunk(b"IEND", b"")
    )
    dest_path.parent.mkdir(parents=True, exist_ok=True)
    dest_path.write_bytes(png_bytes)


def write_png_from_rgba(dest_path: Path, width: int, height: int, rgba: bytes) -> None:
    rows = []
    stride = width * 4
    for row_index in range(height):
        start = row_index * stride
        rows.append(b"\x00" + rgba[start : start + stride])
    payload = zlib.compress(b"".join(rows), level=9)
    ihdr = struct.pack(">IIBBBBB", width, height, 8, 6, 0, 0, 0)
    png_bytes = (
        b"\x89PNG\r\n\x1a\n"
        + png_chunk(b"IHDR", ihdr)
        + png_chunk(b"IDAT", payload)
        + png_chunk(b"IEND", b"")
    )
    dest_path.parent.mkdir(parents=True, exist_ok=True)
    dest_path.write_bytes(png_bytes)


def write_png_preview(source_ppm: Path, dest_png: Path) -> bool:
    try:
        width, height, rgb = read_pnm_rgb(source_ppm)
    except ValueError:
        return False
    write_png_from_rgb(dest_png, width, height, rgb)
    return True


def analyze_pnm_rgb(source_path: Path) -> dict[str, int | bool] | None:
    try:
        width, height, rgb = read_pnm_rgb(source_path)
    except ValueError:
        return None
    nonzero_bytes = sum(1 for component in rgb if component)
    return {
        "width": width,
        "height": height,
        "rgbByteCount": len(rgb),
        "uniqueRgbByteValues": len(set(rgb)),
        "nonzeroRgbBytes": nonzero_bytes,
        "allBlack": nonzero_bytes == 0,
    }


def read_backdrop_rgb(cgram_path: Path) -> tuple[int, int, int]:
    cgram = cgram_path.read_bytes()
    if len(cgram) < 2:
        return (0, 0, 0)
    value = cgram[0] | (cgram[1] << 8)
    red = value & 0x1F
    green = (value >> 5) & 0x1F
    blue = (value >> 10) & 0x1F
    return (
        (red << 3) | (red >> 2),
        (green << 3) | (green >> 2),
        (blue << 3) | (blue >> 2),
    )


def convert_image_to_ppm(source_path: Path, dest_path: Path) -> bool:
    try:
        subprocess.run(
            [
                "ffmpeg",
                "-y",
                "-loglevel",
                "error",
                "-i",
                str(source_path),
                "-frames:v",
                "1",
                str(dest_path),
            ],
            check=True,
            stdout=subprocess.DEVNULL,
            stderr=subprocess.DEVNULL,
        )
    except (FileNotFoundError, subprocess.CalledProcessError):
        return False
    return True


def build_visible_support_assets(
    screenshot_path: Path,
    bg1_ppm_path: Path,
    obj_ppm_path: Path,
    cgram_path: Path,
    out_dir: Path,
) -> dict[str, str]:
    with tempfile.TemporaryDirectory(prefix="td2_gameplay_bundle_") as temp_dir:
        frame_ppm = Path(temp_dir) / "frame.ppm"
        if not convert_image_to_ppm(screenshot_path, frame_ppm):
            return {}

        frame_width, frame_height, frame_rgb = read_pnm_rgb(frame_ppm)
        bg1_width, bg1_height, bg1_rgb = read_pnm_rgb(bg1_ppm_path)
        obj_width, obj_height, obj_rgb = read_pnm_rgb(obj_ppm_path)
        if (frame_width, frame_height) != (bg1_width, bg1_height) or (frame_width, frame_height) != (obj_width, obj_height):
            return {}

        backdrop = read_backdrop_rgb(cgram_path)
        world_rgba = bytearray(frame_width * frame_height * 4)
        bg_stack_rgba = bytearray(frame_width * frame_height * 4)

        for pixel_index in range(frame_width * frame_height):
            src_offset = pixel_index * 3
            dst_offset = pixel_index * 4
            frame_pixel = frame_rgb[src_offset : src_offset + 3]
            bg1_pixel = tuple(bg1_rgb[src_offset : src_offset + 3])
            obj_pixel = tuple(obj_rgb[src_offset : src_offset + 3])
            bg1_visible = bg1_pixel != backdrop
            obj_visible = obj_pixel != backdrop

            if not obj_visible:
                bg_stack_rgba[dst_offset : dst_offset + 4] = frame_pixel + b"\xFF"
            if not bg1_visible and not obj_visible:
                world_rgba[dst_offset : dst_offset + 4] = frame_pixel + b"\xFF"

        outputs: dict[str, str] = {}
        support_targets = {
            "bg_stack_visible_support_png": bg_stack_rgba,
            "world_visible_support_png": world_rgba,
        }
        for name, rgba in support_targets.items():
            dest_path = out_dir / name.replace("_png", ".png")
            write_png_from_rgba(dest_path, frame_width, frame_height, bytes(rgba))
            outputs[name] = repo_rel(dest_path)
        return outputs


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


def import_native_frame_dir(
    root: Path,
    native_frame_dir: Path,
    out_dir: Path,
) -> tuple[dict[str, str | None], dict[str, dict[str, object]], list[str]]:
    outputs: dict[str, str | None] = {}
    checks: dict[str, dict[str, object]] = {}
    warnings: list[str] = []
    design_pack_native_dir = out_dir / "design_pack_native"

    subprocess.run(
        [
            "python3",
            "tools/build_mesen_design_pack.py",
            str(native_frame_dir),
            str(design_pack_native_dir),
            "--clean-out",
        ],
        cwd=root,
        check=True,
    )
    outputs["native_design_pack"] = repo_rel(design_pack_native_dir / "design_pack.json")

    promoted_files = {
        "native_bg1_visible_ppm": ("bg1_visible.ppm", "bg1_visible_native.ppm"),
        "native_bg2_visible_ppm": ("bg2_visible.ppm", "bg2_visible_native.ppm"),
        "native_bg3_visible_ppm": ("bg3_visible.ppm", "bg3_visible_native.ppm"),
        "native_main_visible_ppm": ("main_visible.ppm", "main_visible_native.ppm"),
        "native_sub_visible_ppm": ("sub_visible.ppm", "sub_visible_native.ppm"),
        "native_sprites_screen_ppm": ("sprites_screen.ppm", "sprites_screen_native.ppm"),
    }
    for manifest_key, (source_name, dest_name) in promoted_files.items():
        source_path = native_frame_dir / source_name
        artifact_key = manifest_key.removeprefix("native_").removesuffix("_ppm")
        if not source_path.is_file():
            outputs[manifest_key] = None
            png_key = manifest_key.replace("_ppm", "_png")
            outputs[png_key] = None
            checks[artifact_key] = {
                "source": source_name,
                "ppm": None,
                "png": None,
                "missing": True,
            }
            continue
        dest_path = out_dir / dest_name
        copy_file(source_path, dest_path)
        outputs[manifest_key] = repo_rel(dest_path)
        png_key = manifest_key.replace("_ppm", "_png")
        png_path = out_dir / dest_name.replace(".ppm", ".png")
        outputs[png_key] = repo_rel(png_path) if write_png_preview(dest_path, png_path) else None
        analysis = analyze_pnm_rgb(dest_path)
        if analysis is None:
            checks[artifact_key] = {
                "source": source_name,
                "ppm": repo_rel(dest_path),
                "png": outputs[png_key],
                "missing": False,
                "analysisFailed": True,
            }
            continue
        checks[artifact_key] = {
            "source": source_name,
            "ppm": repo_rel(dest_path),
            "png": outputs[png_key],
            "missing": False,
            **analysis,
        }
        if analysis["allBlack"]:
            warnings.append(
                f"{dest_name} is fully black in this native gameplay bundle; "
                "treat it as a boundary artifact, not a valid composed-screen render."
            )

    write_json(out_dir / "native_visible_checks.json", checks)
    outputs["native_visible_checks_json"] = repo_rel(out_dir / "native_visible_checks.json")
    return outputs, checks, warnings


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
    native_frame_dir = resolve_path(args.native_frame_dir) if args.native_frame_dir else None
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
            oam=raw_oam if (name == "main" and oam_src is not None) else None,
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

    png_outputs: dict[str, str | None] = {}
    for name in ("main", "bg1", "bg2", "obj"):
        ppm_path = out_dir / f"{name}.ppm"
        png_path = out_dir / f"{name}.png"
        png_outputs[f"{name}_png"] = repo_rel(png_path) if write_png_preview(ppm_path, png_path) else None
    if screenshot_src is not None:
        png_outputs.update(
            build_visible_support_assets(
                out_dir / "frame.png",
                out_dir / "bg1.ppm",
                out_dir / "obj.ppm",
                raw_cgram,
                out_dir,
            )
        )

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

    native_outputs: dict[str, str | None] = {}
    native_checks: dict[str, dict[str, object]] = {}
    warnings: list[str] = []
    if native_frame_dir is not None:
        native_outputs, native_checks, warnings = import_native_frame_dir(
            root, native_frame_dir, out_dir
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
            "native_frame_dir": repo_rel(native_frame_dir) if native_frame_dir is not None else None,
        },
        "outputs": {
            "main_ppm": repo_rel(out_dir / "main.ppm"),
            "frame_png": repo_rel(out_dir / "frame.png") if screenshot_src is not None else None,
            "bg1_ppm": repo_rel(out_dir / "bg1.ppm"),
            "bg2_ppm": repo_rel(out_dir / "bg2.ppm"),
            "obj_ppm": repo_rel(out_dir / "obj.ppm"),
            "design_pack": repo_rel(design_pack_dir / "design_pack.json"),
            **png_outputs,
            **native_outputs,
        },
        "nativeVisibleChecks": native_checks,
        "warnings": warnings,
    }
    write_json(out_dir / "bundle_manifest.json", manifest)


if __name__ == "__main__":
    main()
