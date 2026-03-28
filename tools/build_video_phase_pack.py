#!/usr/bin/env python3
"""Build named still/contact-sheet phase packs from local gameplay videos."""

from __future__ import annotations

import argparse
import json
import math
import subprocess
import tempfile
import struct
import zlib
from dataclasses import dataclass
from datetime import datetime, timezone
from pathlib import Path


REPO_ROOT = Path(__file__).resolve().parents[1]


@dataclass(frozen=True)
class PhaseSpec:
    id: str
    title: str
    note: str
    anchor_seconds: float
    window_start_seconds: float
    window_duration_seconds: float
    sheet_fps: float
    sheet_tile: str
    sheet_scale: str


@dataclass(frozen=True)
class PackSpec:
    id: str
    title: str
    description: str
    source: Path
    out_dir: Path
    anchor_sheet_tile: str
    anchor_sheet_scale: str
    phases: list[PhaseSpec]


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Build one or more named gameplay-video phase packs from a JSON spec."
    )
    parser.add_argument(
        "--spec",
        type=Path,
        required=True,
        help="JSON spec path describing one or more phase packs.",
    )
    return parser.parse_args()


def repo_rel(path: Path) -> str:
    resolved = path.resolve()
    try:
        return resolved.relative_to(REPO_ROOT).as_posix()
    except ValueError:
        return resolved.as_posix()


def resolve_repo_path(path_text: str) -> Path:
    path = Path(path_text)
    return path if path.is_absolute() else (REPO_ROOT / path)


def load_spec(spec_path: Path) -> list[PackSpec]:
    data = json.loads(spec_path.read_text(encoding="utf-8"))
    packs: list[PackSpec] = []
    for pack in data["packs"]:
        phases = [
            PhaseSpec(
                id=phase["id"],
                title=phase["title"],
                note=phase.get("note", ""),
                anchor_seconds=float(phase["anchor_seconds"]),
                window_start_seconds=float(phase["window_start_seconds"]),
                window_duration_seconds=float(phase["window_duration_seconds"]),
                sheet_fps=float(phase["sheet_fps"]),
                sheet_tile=phase["sheet_tile"],
                sheet_scale=phase["sheet_scale"],
            )
            for phase in pack["phases"]
        ]
        packs.append(
            PackSpec(
                id=pack["id"],
                title=pack["title"],
                description=pack.get("description", ""),
                source=resolve_repo_path(pack["source"]),
                out_dir=resolve_repo_path(pack["out_dir"]),
                anchor_sheet_tile=pack.get("anchor_sheet_tile", "3x2"),
                anchor_sheet_scale=pack.get("anchor_sheet_scale", "320:180"),
                phases=phases,
            )
        )
    return packs


def run_command(command: list[str]) -> None:
    subprocess.run(command, check=True)


def ffprobe_video(source: Path) -> dict:
    result = subprocess.run(
        [
            "ffprobe",
            "-v",
            "error",
            "-show_entries",
            (
                "format=duration,size:stream=index,codec_type,codec_name,width,height,"
                "r_frame_rate,avg_frame_rate,nb_frames"
            ),
            "-of",
            "json",
            str(source),
        ],
        check=True,
        capture_output=True,
        text=True,
    )
    return json.loads(result.stdout)


def format_seconds(seconds: float) -> str:
    whole = max(0, seconds)
    hours = int(whole // 3600)
    minutes = int((whole % 3600) // 60)
    secs = whole - (hours * 3600 + minutes * 60)
    return f"{hours:02d}:{minutes:02d}:{secs:06.3f}"


def expected_sheet_frames(duration: float, fps: float) -> int:
    return max(1, int(math.ceil(duration * fps - 1e-9)))


def parse_dims(text: str) -> tuple[int, int]:
    delimiter = "x" if "x" in text else ":"
    width_text, height_text = text.split(delimiter, 1)
    return int(width_text), int(height_text)


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
        samples = [scale_sample(sample, maxval) for sample in samples]
    else:
        channels = 3 if magic == "P3" else 1
        sample_count = width * height * channels
        samples = []
        for _ in range(sample_count):
            token, offset = read_pnm_token(data, offset)
            samples.append(scale_sample(int(token), maxval))

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
    dest_path.write_bytes(png_bytes)


def build_anchor_sheet(
    anchor_paths: list[Path],
    out_path: Path,
    scale: str,
    tile: str,
) -> bool:
    if not anchor_paths:
        return False
    cell_width, cell_height = parse_dims(scale)
    cols, rows = parse_dims(tile)
    canvas_width = cols * cell_width
    canvas_height = rows * cell_height
    canvas = bytearray(canvas_width * canvas_height * 3)

    with tempfile.TemporaryDirectory(prefix="td2_phase_pack_sheet_") as temp_dir:
        temp_dir_path = Path(temp_dir)
        for index, image_path in enumerate(anchor_paths):
            if index >= cols * rows:
                break
            scaled_ppm = temp_dir_path / f"{index:02d}.ppm"
            run_command(
                [
                    "ffmpeg",
                    "-y",
                    "-loglevel",
                    "error",
                    "-i",
                    str(image_path),
                    "-vf",
                    (
                        f"scale={cell_width}:{cell_height}:force_original_aspect_ratio=decrease,"
                        f"pad={cell_width}:{cell_height}:(ow-iw)/2:(oh-ih)/2:black"
                    ),
                    "-frames:v",
                    "1",
                    str(scaled_ppm),
                ]
            )
            width, height, rgb = read_pnm_rgb(scaled_ppm)
            if width != cell_width or height != cell_height:
                raise ValueError("unexpected scaled anchor dimensions")

            cell_x = (index % cols) * cell_width
            cell_y = (index // cols) * cell_height
            for row_index in range(cell_height):
                src_start = row_index * cell_width * 3
                src_end = src_start + cell_width * 3
                dst_start = ((cell_y + row_index) * canvas_width + cell_x) * 3
                dst_end = dst_start + cell_width * 3
                canvas[dst_start:dst_end] = rgb[src_start:src_end]

    write_png_from_rgb(out_path, canvas_width, canvas_height, bytes(canvas))
    return True


def write_pack_markdown(
    pack: PackSpec,
    video_metadata: dict,
    phase_rows: list[dict],
    anchor_sheet_rel: str | None,
) -> str:
    lines = [f"# {pack.title}", ""]
    if pack.description:
        lines.extend([pack.description, ""])
    lines.extend(
        [
            "- Source video:",
            f"  - `{repo_rel(pack.source)}`",
            "- Video metadata:",
            f"  - `{json.dumps(video_metadata, indent=2)}`",
        ]
    )
    if anchor_sheet_rel is not None:
        lines.extend(["- Anchor sheet:", f"  - `{anchor_sheet_rel}`"])
    lines.append("")
    lines.append("## Phases")
    lines.append("")
    for row in phase_rows:
        lines.extend(
            [
                f"### {row['index']}. {row['title']}",
                "",
                f"- phase id: `{row['id']}`",
                f"- anchor: `{row['anchorTimestamp']}` (`{row['anchorSeconds']:.3f}s`)",
                f"- window: `{row['windowStartTimestamp']}` .. `{row['windowEndTimestamp']}`",
                f"- note: {row['note']}",
                "- artifacts:",
                f"  - `{row['anchorImage']}`",
                f"  - `{row['windowSheet']}`",
                "",
            ]
        )
    return "\n".join(lines).rstrip() + "\n"


def build_pack(pack: PackSpec) -> None:
    pack.out_dir.mkdir(parents=True, exist_ok=True)
    video_metadata = ffprobe_video(pack.source)
    video_metadata["source"] = repo_rel(pack.source)

    phase_rows: list[dict] = []
    anchor_paths: list[Path] = []

    for index, phase in enumerate(pack.phases, start=1):
        prefix = f"{index:02d}_{phase.id}"
        anchor_path = pack.out_dir / f"{prefix}_anchor.png"
        window_path = pack.out_dir / f"{prefix}_window.png"

        run_command(
            [
                "ffmpeg",
                "-y",
                "-loglevel",
                "error",
                "-ss",
                f"{phase.anchor_seconds:.3f}",
                "-i",
                str(pack.source),
                "-frames:v",
                "1",
                str(anchor_path),
            ]
        )
        run_command(
            [
                "ffmpeg",
                "-y",
                "-loglevel",
                "error",
                "-ss",
                f"{phase.window_start_seconds:.3f}",
                "-t",
                f"{phase.window_duration_seconds:.3f}",
                "-i",
                str(pack.source),
                "-vf",
                f"fps={phase.sheet_fps:g},scale={phase.sheet_scale},tile={phase.sheet_tile}",
                "-frames:v",
                "1",
                str(window_path),
            ]
        )

        anchor_paths.append(anchor_path)
        phase_rows.append(
            {
                "index": index,
                "id": phase.id,
                "title": phase.title,
                "note": phase.note,
                "anchorSeconds": phase.anchor_seconds,
                "anchorTimestamp": format_seconds(phase.anchor_seconds),
                "windowStartSeconds": phase.window_start_seconds,
                "windowStartTimestamp": format_seconds(phase.window_start_seconds),
                "windowDurationSeconds": phase.window_duration_seconds,
                "windowEndTimestamp": format_seconds(
                    phase.window_start_seconds + phase.window_duration_seconds
                ),
                "windowExpectedFrameCount": expected_sheet_frames(
                    phase.window_duration_seconds,
                    phase.sheet_fps,
                ),
                "sheetFps": phase.sheet_fps,
                "sheetTile": phase.sheet_tile,
                "sheetScale": phase.sheet_scale,
                "anchorImage": repo_rel(anchor_path),
                "windowSheet": repo_rel(window_path),
            }
        )

    anchor_sheet_path = pack.out_dir / "anchor_sheet.png"
    anchor_sheet_rel: str | None = None
    if build_anchor_sheet(
        anchor_paths=anchor_paths,
        out_path=anchor_sheet_path,
        scale=pack.anchor_sheet_scale,
        tile=pack.anchor_sheet_tile,
    ):
        anchor_sheet_rel = repo_rel(anchor_sheet_path)

    manifest = {
        "packId": pack.id,
        "title": pack.title,
        "description": pack.description,
        "generatedAtUtc": datetime.now(timezone.utc).isoformat(),
        "sourceVideo": repo_rel(pack.source),
        "videoMetadata": video_metadata,
        "anchorSheet": anchor_sheet_rel,
        "phases": phase_rows,
    }
    manifest_path = pack.out_dir / "manifest.json"
    manifest_path.write_text(json.dumps(manifest, indent=2) + "\n", encoding="utf-8")

    readme_path = pack.out_dir / "README.md"
    readme_path.write_text(
        write_pack_markdown(pack, video_metadata, phase_rows, anchor_sheet_rel),
        encoding="utf-8",
    )


def main() -> None:
    args = parse_args()
    packs = load_spec(resolve_repo_path(args.spec.as_posix()))
    for pack in packs:
        if not pack.source.exists():
            raise FileNotFoundError(f"phase-pack source missing: {pack.source}")
        build_pack(pack)


if __name__ == "__main__":
    main()
