#!/usr/bin/env python3
"""Build reusable gameplay chunk manifests with the local SentrySearch chunker."""

from __future__ import annotations

import argparse
import json
import shutil
import subprocess
import sys
import tempfile
from pathlib import Path


REPO_ROOT = Path(__file__).resolve().parents[1]
SENTRYSEARCH_ROOT = REPO_ROOT / "sentrysearch"
if str(SENTRYSEARCH_ROOT) not in sys.path:
    sys.path.insert(0, str(SENTRYSEARCH_ROOT))

from sentrysearch.chunker import _get_ffmpeg_executable, chunk_video  # type: ignore


def format_timestamp(seconds: float) -> str:
    total = int(seconds)
    hours, rem = divmod(total, 3600)
    minutes, secs = divmod(rem, 60)
    if hours:
        return f"{hours:02d}:{minutes:02d}:{secs:02d}"
    return f"{minutes:02d}:{secs:02d}"


def parse_window(spec: str) -> dict:
    parts = spec.split(":", 3)
    if len(parts) != 4:
        raise ValueError(
            f"invalid window spec '{spec}'; expected label:start:duration:term1|term2"
        )
    label, start_text, duration_text, query_text = parts
    start = float(start_text)
    duration = float(duration_text)
    queries = [item.strip() for item in query_text.split("|") if item.strip()]
    return {
        "label": label,
        "start": start,
        "duration": duration,
        "queries": queries,
    }


def trim_window(video: Path, start: float, duration: float, out_path: Path) -> None:
    ffmpeg = _get_ffmpeg_executable()
    subprocess.run(
        [
            ffmpeg,
            "-y",
            "-loglevel",
            "error",
            "-ss",
            str(start),
            "-i",
            str(video),
            "-t",
            str(duration),
            "-c",
            "copy",
            str(out_path),
        ],
        check=True,
    )


def build_manifest(
    video: Path,
    windows: list[dict],
    chunk_duration: int,
    overlap: int,
) -> dict:
    manifest_windows = []

    with tempfile.TemporaryDirectory(prefix="td2_sentrysearch_") as tmp_dir:
        tmp_root = Path(tmp_dir)
        for window in windows:
            clip_path = tmp_root / f"{window['label']}.mp4"
            trim_window(video, window["start"], window["duration"], clip_path)
            chunks = chunk_video(str(clip_path), chunk_duration=chunk_duration, overlap=overlap)
            manifest_chunks = []
            for index, chunk in enumerate(chunks):
                original_start = window["start"] + float(chunk["start_time"])
                original_end = window["start"] + float(chunk["end_time"])
                manifest_chunks.append(
                    {
                        "index": index,
                        "chunk_start_seconds": original_start,
                        "chunk_end_seconds": original_end,
                        "chunk_start_label": format_timestamp(original_start),
                        "chunk_end_label": format_timestamp(original_end),
                    }
                )
                Path(chunk["chunk_path"]).unlink(missing_ok=True)
            chunk_dir = Path(chunks[0]["chunk_path"]).parent if chunks else None
            if chunk_dir is not None:
                shutil.rmtree(chunk_dir, ignore_errors=True)
            manifest_windows.append(
                {
                    "label": window["label"],
                    "window_start_seconds": window["start"],
                    "window_end_seconds": window["start"] + window["duration"],
                    "window_start_label": format_timestamp(window["start"]),
                    "window_end_label": format_timestamp(window["start"] + window["duration"]),
                    "query_terms": window["queries"],
                    "chunks": manifest_chunks,
                }
            )

    return {
        "video": str(video),
        "chunk_duration_seconds": chunk_duration,
        "overlap_seconds": overlap,
        "windows": manifest_windows,
    }


def write_markdown(manifest: dict, out_path: Path) -> None:
    lines = [
        "# SentrySearch Gameplay Chunk Manifest",
        "",
        f"- Video: `{manifest['video']}`",
        f"- Chunk duration: `{manifest['chunk_duration_seconds']}s`",
        f"- Overlap: `{manifest['overlap_seconds']}s`",
        "",
    ]

    for window in manifest["windows"]:
        lines.extend(
            [
                f"## {window['label']}",
                "",
                f"- Window: `{window['window_start_label']} -> {window['window_end_label']}`",
                f"- Query terms: {', '.join(f'`{term}`' for term in window['query_terms'])}",
                "",
                "| Chunk | Start | End |",
                "|---|---:|---:|",
            ]
        )
        for chunk in window["chunks"]:
            lines.append(
                f"| `{chunk['index']:02d}` | `{chunk['chunk_start_label']}` | `{chunk['chunk_end_label']}` |"
            )
        lines.append("")

    out_path.write_text("\n".join(lines), encoding="utf-8")


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("video", type=Path, help="Source gameplay video")
    parser.add_argument(
        "--window",
        action="append",
        default=[],
        help="label:start:duration:term1|term2",
    )
    parser.add_argument("--chunk-duration", type=int, default=30)
    parser.add_argument("--overlap", type=int, default=5)
    parser.add_argument("--json-out", type=Path, required=True)
    parser.add_argument("--markdown-out", type=Path)
    args = parser.parse_args()

    if not args.window:
        parser.error("at least one --window is required")

    windows = [parse_window(spec) for spec in args.window]
    manifest = build_manifest(args.video.resolve(), windows, args.chunk_duration, args.overlap)
    args.json_out.write_text(json.dumps(manifest, indent=2), encoding="utf-8")
    if args.markdown_out:
        write_markdown(manifest, args.markdown_out)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
