#!/usr/bin/env python3
"""Run a review-oriented Mesen capture/export pipeline for a short frame window."""

from __future__ import annotations

import argparse
import json
import os
from pathlib import Path
import re
import shlex
import subprocess
import sys
from typing import Mapping


DEFAULT_PROBE_WRITE_POINTS = (
    "objsel=00:2101,oamaddl=00:2102,oamaddh=00:2103,oamdata=00:2104,"
    "vmaddl=00:2116,vmaddh=00:2117,vmdatal=00:2118,vmdatah=00:2119,"
    "cgadd=00:2121,cgdata=00:2122"
)


def parse_button_pattern(raw: str) -> list[str]:
    if not raw:
        return []
    buttons: list[str] = []
    for token in raw.split(","):
        item = token.strip()
        if item:
            buttons.append(item)
    return buttons


def encode_button_pattern(buttons: list[str]) -> str:
    return ",".join(buttons)


def parse_trigger_input_windows(raw: str) -> list[dict[str, object]]:
    windows: list[dict[str, object]] = []
    if not raw.strip():
        return windows

    for segment in raw.split(";"):
        item = segment.strip()
        if not item:
            continue
        range_raw, _, buttons_raw = item.partition(":")
        match = re.match(r"^(?P<point>.+?)\+(?P<start>-?\d+)(?:-(?P<end>-?\d+))?$", range_raw.strip())
        if not match:
            raise SystemExit(f"error: invalid trigger input window: {item}")
        point_id = match.group("point").strip()
        start_offset = int(match.group("start"))
        end_offset = int(match.group("end") or match.group("start"))
        if end_offset < start_offset:
            start_offset, end_offset = end_offset, start_offset
        windows.append(
            {
                "point_id": point_id,
                "start_offset": start_offset,
                "end_offset": end_offset,
                "buttons": parse_button_pattern(buttons_raw),
            }
        )

    return windows


def encode_input_windows(windows: list[dict[str, object]]) -> str:
    segments: list[str] = []
    for window in windows:
        start_frame = int(window["start_frame"])
        end_frame = int(window["end_frame"])
        buttons = encode_button_pattern(list(window["buttons"]))
        if start_frame == end_frame:
            range_part = f"{start_frame}"
        else:
            range_part = f"{start_frame}-{end_frame}"
        if buttons:
            segments.append(f"{range_part}:{buttons}")
        else:
            segments.append(range_part)
    return ";".join(segments)


def combine_input_window_strings(*parts: str) -> str:
    segments: list[str] = []
    for part in parts:
        if not part:
            continue
        for item in part.split(";"):
            piece = item.strip()
            if piece:
                segments.append(piece)
    return ";".join(segments)


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description=(
            "Capture a short deterministic Mesen frame window and assemble the "
            "artifacts that are most useful for visual review: extracted bridge "
            "frames, design packs, boot probe telemetry, activity trace, visual "
            "contracts, and a Markdown note skeleton."
        )
    )
    parser.add_argument("slug", help="short review slug, for example intro_mode7_rotation")
    parser.add_argument("start_frame", type=int, help="first frame in the review window")
    parser.add_argument("end_frame", type=int, help="last frame in the review window (inclusive)")
    parser.add_argument(
        "--rom",
        type=Path,
        default=Path("game.smc"),
        help="ROM path relative to the repo root (default: %(default)s)",
    )
    parser.add_argument("--step", type=int, default=1, help="frame step for bridge extraction (default: %(default)s)")
    parser.add_argument(
        "--input-windows",
        default="",
        help="optional timed input windows applied to both the extractor and the probe",
    )
    parser.add_argument(
        "--probe-trigger-input-windows",
        default="",
        help="optional callback-relative input windows passed only to the boot probe, later resolved into absolute extractor windows",
    )
    parser.add_argument(
        "--probe-trace-exec-points",
        default="",
        help="optional exec-point trace spec needed to resolve --probe-trigger-input-windows",
    )
    parser.add_argument(
        "--savestate",
        type=Path,
        help="optional savestate passed to the boot probe wrapper",
    )
    parser.add_argument(
        "--question",
        default="",
        help="optional guiding question inserted into the generated Markdown note",
    )
    parser.add_argument(
        "--title",
        default="",
        help="optional document title override",
    )
    parser.add_argument(
        "--out-root",
        type=Path,
        default=Path("tools/out"),
        help="output root relative to the repo root (default: %(default)s)",
    )
    parser.add_argument(
        "--doc-dir",
        type=Path,
        default=Path("rom_analysis/docs"),
        help="Markdown note directory relative to the repo root (default: %(default)s)",
    )
    parser.add_argument(
        "--doc-path",
        type=Path,
        help="optional explicit Markdown note path; defaults under --doc-dir",
    )
    parser.add_argument(
        "--force-doc",
        action="store_true",
        help="overwrite an existing Markdown note",
    )
    parser.add_argument(
        "--frame-timeout-seconds",
        type=float,
        default=60.0,
        help="bridge per-frame timeout used by extract_mesen_scene_range.py (default: %(default)s)",
    )
    parser.add_argument(
        "--mesen-timeout-seconds",
        type=int,
        default=90,
        help="MESEN_TIMEOUT_SECONDS value for the boot probe run (default: %(default)s)",
    )
    parser.add_argument(
        "--probe-total-frames",
        type=int,
        help="TD2_BOOT_PROBE_TOTAL_FRAMES; defaults to end_frame + 1",
    )
    parser.add_argument(
        "--probe-trace-start-frame",
        type=int,
        help="TD2_BOOT_PROBE_TRACE_START_FRAME; defaults to start_frame",
    )
    parser.add_argument(
        "--probe-trace-end-frame",
        type=int,
        help="TD2_BOOT_PROBE_TRACE_END_FRAME; defaults to end_frame",
    )
    parser.add_argument(
        "--probe-write-points",
        default=DEFAULT_PROBE_WRITE_POINTS,
        help="write-point trace spec passed to TD2_BOOT_PROBE_TRACE_WRITE_POINTS",
    )
    parser.add_argument(
        "--probe-write-point-max-hits",
        type=int,
        default=8192,
        help="TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS value (default: %(default)s)",
    )
    parser.add_argument(
        "--with-provenance",
        action="store_true",
        help="also trace L001210 and build a tilemap provenance artifact for the reviewed window",
    )
    parser.add_argument(
        "--chunk-validation",
        type=Path,
        action="append",
        default=[],
        help="optional chunk-validation JSON passed through to build_tilemap_chunk_provenance.py",
    )
    parser.add_argument(
        "--carry-frames",
        type=int,
        default=16,
        help="carry window for build_tilemap_chunk_provenance.py (default: %(default)s)",
    )
    parser.add_argument(
        "--forward-frames",
        type=int,
        default=2,
        help="forward window for build_tilemap_chunk_provenance.py (default: %(default)s)",
    )
    parser.add_argument(
        "--ld-library-path",
        default=None,
        help=(
            "LD_LIBRARY_PATH for extract_mesen_scene_range.py; defaults to "
            "LD_LIBRARY_PATH, MESEN_RELEASE_DIR, or MESEN_BIN parent when available"
        ),
    )
    parser.add_argument("--skip-extract", action="store_true", help="skip bridge extraction")
    parser.add_argument("--skip-design-pack", action="store_true", help="skip design-pack generation")
    parser.add_argument("--skip-probe", action="store_true", help="skip the boot probe run")
    parser.add_argument("--skip-activity", action="store_true", help="skip activity-trace generation")
    parser.add_argument("--skip-visual-contract", action="store_true", help="skip visual-contract generation")
    parser.add_argument("--skip-doc", action="store_true", help="skip Markdown note generation")
    parser.add_argument(
        "--dry-run",
        action="store_true",
        help="print the commands and planned paths without executing them",
    )
    return parser.parse_args()


def repo_root() -> Path:
    return Path(__file__).resolve().parents[1]


def sanitize_slug(value: str) -> str:
    text = re.sub(r"[^A-Za-z0-9._-]+", "_", value.strip())
    text = text.strip("._-")
    return text or "mesen_window"


def resolve_from_root(root: Path, value: Path | None) -> Path | None:
    if value is None:
        return None
    return value if value.is_absolute() else (root / value)


def infer_ld_library_path(explicit: str | None) -> str:
    if explicit is not None:
        return explicit
    current = os.environ.get("LD_LIBRARY_PATH")
    if current:
        return current
    release_dir = os.environ.get("MESEN_RELEASE_DIR")
    if release_dir:
        return release_dir
    mesen_bin = os.environ.get("MESEN_BIN")
    if mesen_bin:
        return str(Path(mesen_bin).resolve().parent)
    return ""


def run_command(
    cmd: list[str],
    *,
    cwd: Path,
    env: Mapping[str, str] | None = None,
    dry_run: bool = False,
) -> None:
    if env:
        env_prefix = " ".join(f"{key}={shlex.quote(value)}" for key, value in sorted(env.items()))
        print(f"$ {env_prefix} {shlex.join(cmd)}")
    else:
        print(f"$ {shlex.join(cmd)}")
    if dry_run:
        return
    merged_env = os.environ.copy()
    if env:
        merged_env.update(env)
    subprocess.run(cmd, cwd=cwd, env=merged_env, check=True)


def rel_to_root(path: Path, root: Path) -> str:
    try:
        return path.resolve().relative_to(root.resolve()).as_posix()
    except ValueError:
        return path.resolve().as_posix()


def bundle_name(slug: str, start_frame: int, end_frame: int) -> str:
    return f"{slug}_{start_frame:05d}_{end_frame:05d}"


def build_review_note(
    *,
    title: str,
    question: str,
    bundle: str,
    start_frame: int,
    end_frame: int,
    step: int,
    input_windows: str,
    trigger_input_windows: str,
    resolved_input_windows: str,
    savestate: Path | None,
    frames_dir: Path,
    design_dir: Path | None,
    probe_json: Path | None,
    activity_json: Path | None,
    visual_index_json: Path | None,
    provenance_json: Path | None,
    summary_json: Path,
    root: Path,
) -> str:
    lines = [
        f"# {title}",
        "",
        "## Question",
        question or "Fill in the exact behavior question for this review window.",
        "",
        "## Capture Recipe",
        f"- slug: `{bundle}`",
        f"- frames: `{start_frame}..{end_frame}` step `{step}`",
        f"- absolute input windows: `{input_windows or '<none>'}`",
        f"- trigger input windows: `{trigger_input_windows or '<none>'}`",
        f"- resolved extractor windows: `{resolved_input_windows or '<none>'}`",
        f"- savestate: `{rel_to_root(savestate, root) if savestate else '<none>'}`",
        "",
        "## Artifact Paths",
        f"- summary: `{rel_to_root(summary_json, root)}`",
        f"- extracted bridge frames: `{rel_to_root(frames_dir, root)}`",
    ]
    if design_dir is not None:
        lines.append(f"- design packs: `{rel_to_root(design_dir, root)}`")
    if probe_json is not None:
        lines.append(f"- probe json: `{rel_to_root(probe_json, root)}`")
    if activity_json is not None:
        lines.append(f"- activity trace: `{rel_to_root(activity_json, root)}`")
    if visual_index_json is not None:
        lines.append(f"- visual contract range: `{rel_to_root(visual_index_json, root)}`")
    if provenance_json is not None:
        lines.append(f"- provenance json: `{rel_to_root(provenance_json, root)}`")
    lines.extend(
        [
            "",
            "## Key Frames",
            "- frame <n>: what changed on screen?",
            "- frame <n>: which layer changed (`bg1/bg2/bg3/bg4/obj`)?",
            "- frame <n>: does this look like tilemap, palette, OAM, scroll, or Mode 7 state?",
            "",
            "## Visual Reading",
            "- annotate `main_visible.ppm` first",
            "- cross-check `tilemaps/bg*_tilemap.json` for BG claims",
            "- cross-check `sprites/sprites_visible.json` for OBJ claims",
            "- note whether the difference exists only in visible lines or only in the full frame",
            "",
            "## Current Hypothesis",
            "- fill in the best callback/state or asset-ownership hypothesis",
            "",
            "## Ambiguities",
            "- what still cannot be distinguished from visuals alone?",
            "",
            "## Next Probe",
            "- what is the smallest next capture window that would resolve the ambiguity?",
            "",
        ]
    )
    return "\n".join(lines)


def resolve_trigger_windows_from_probe(trigger_spec: str, probe_json: Path) -> tuple[list[dict[str, object]], str]:
    windows = parse_trigger_input_windows(trigger_spec)
    if not windows:
        return [], ""

    payload = json.loads(probe_json.read_text(encoding="utf-8"))
    exec_trace = payload.get("exec_point_trace", {})
    first_frames = exec_trace.get("first_frames", {})
    if not isinstance(first_frames, dict):
        raise SystemExit(f"error: {probe_json} is missing exec_point_trace.first_frames")

    resolved: list[dict[str, object]] = []
    for window in windows:
        point_id = str(window["point_id"])
        trigger_frame = first_frames.get(point_id)
        if not isinstance(trigger_frame, int):
            raise SystemExit(
                f"error: probe did not record first frame for trigger point '{point_id}' in {probe_json}"
            )
        start_frame = trigger_frame + int(window["start_offset"])
        end_frame = trigger_frame + int(window["end_offset"])
        if end_frame < start_frame:
            start_frame, end_frame = end_frame, start_frame
        resolved.append(
            {
                "point_id": point_id,
                "trigger_frame": trigger_frame,
                "start_frame": start_frame,
                "end_frame": end_frame,
                "buttons": list(window["buttons"]),
            }
        )

    return resolved, encode_input_windows(resolved)


def main() -> int:
    args = parse_args()
    if args.end_frame < args.start_frame:
        raise SystemExit("error: end_frame must be greater than or equal to start_frame")
    if args.step <= 0:
        raise SystemExit("error: --step must be greater than zero")
    if args.skip_probe and (not args.skip_activity or not args.skip_visual_contract or args.with_provenance):
        raise SystemExit(
            "error: --skip-probe cannot be combined with activity trace, visual contracts, or provenance generation"
        )
    if args.probe_trigger_input_windows and args.skip_probe:
        raise SystemExit("error: --probe-trigger-input-windows requires the boot probe run")
    if args.probe_trigger_input_windows and not args.probe_trace_exec_points:
        raise SystemExit("error: --probe-trigger-input-windows requires --probe-trace-exec-points")
    if args.skip_design_pack and (not args.skip_visual_contract or args.with_provenance):
        raise SystemExit(
            "error: --skip-design-pack cannot be combined with visual contracts or provenance generation"
        )

    root = repo_root()
    safe_slug = sanitize_slug(args.slug)
    bundle = bundle_name(safe_slug, args.start_frame, args.end_frame)

    rom_path = resolve_from_root(root, args.rom)
    savestate_path = resolve_from_root(root, args.savestate)
    out_root = resolve_from_root(root, args.out_root)
    doc_dir = resolve_from_root(root, args.doc_dir)
    doc_path = resolve_from_root(root, args.doc_path) if args.doc_path else (doc_dir / f"{bundle}.md")
    chunk_validation_paths = [resolve_from_root(root, path) for path in args.chunk_validation]

    frames_dir = out_root / f"{bundle}_frames"
    design_dir = out_root / f"{bundle}_design"
    probe_dir = out_root / f"{bundle}_probe"
    visual_dir = out_root / f"{bundle}_visual"
    summary_json = out_root / f"{bundle}_guided_export.json"
    provenance_json = out_root / f"{bundle}_provenance.json"
    provenance_md = out_root / f"{bundle}_provenance.md"

    probe_prefix = probe_dir / "td2_boot_probe"
    probe_json = probe_prefix.with_suffix(".json")
    probe_l001210_json = probe_dir / "td2_boot_probe_l001210_exec.json"
    activity_json = probe_dir / "activity_trace.json"
    activity_md = probe_dir / "activity_trace.md"
    visual_index_json = visual_dir / "visual_contract_range.json"
    design_index_json = design_dir / "design_pack_range.json"
    extract_sequence_json = frames_dir / "sequence.json"
    extract_sequence_txt = frames_dir / "sequence.txt"

    if not args.dry_run:
        out_root.mkdir(parents=True, exist_ok=True)
        probe_dir.mkdir(parents=True, exist_ok=True)
        if not args.skip_doc:
            doc_path.parent.mkdir(parents=True, exist_ok=True)

    ld_library_path = infer_ld_library_path(args.ld_library_path)
    probe_total_frames = args.probe_total_frames if args.probe_total_frames is not None else (args.end_frame + 1)
    probe_trace_start = (
        args.probe_trace_start_frame if args.probe_trace_start_frame is not None else args.start_frame
    )
    probe_trace_end = args.probe_trace_end_frame if args.probe_trace_end_frame is not None else args.end_frame
    resolved_trigger_windows: list[dict[str, object]] = []
    resolved_trigger_input_windows = ""
    effective_extract_input_windows = args.input_windows

    if not args.skip_probe:
        probe_env = {
            "MESEN_TIMEOUT_SECONDS": str(args.mesen_timeout_seconds),
            "TD2_BOOT_PROBE_OUTPUT_PREFIX": rel_to_root(probe_prefix, root),
            "TD2_BOOT_PROBE_TOTAL_FRAMES": str(probe_total_frames),
            "TD2_BOOT_PROBE_TRACE_START_FRAME": str(probe_trace_start),
            "TD2_BOOT_PROBE_TRACE_END_FRAME": str(probe_trace_end),
            "TD2_BOOT_PROBE_TRACE_DMA": "1",
            "TD2_BOOT_PROBE_TRACE_VRAM": "1",
            "TD2_BOOT_PROBE_TRACE_MODE7": "1",
            "TD2_BOOT_PROBE_TRACE_WRITE_POINTS": args.probe_write_points,
            "TD2_BOOT_PROBE_WRITE_POINT_MAX_HITS": str(args.probe_write_point_max_hits),
        }
        if args.probe_trace_exec_points:
            probe_env["TD2_BOOT_PROBE_TRACE_EXEC_POINTS"] = args.probe_trace_exec_points
        if args.with_provenance:
            probe_env["TD2_BOOT_PROBE_TRACE_L001210"] = "1"
        if args.input_windows:
            probe_env["TD2_BOOT_PROBE_INPUT_WINDOWS"] = args.input_windows
        if args.probe_trigger_input_windows:
            probe_env["TD2_BOOT_PROBE_TRIGGER_INPUT_WINDOWS"] = args.probe_trigger_input_windows
        cmd = ["./validation/run_mesen_probe_boot.sh", rel_to_root(rom_path, root)]
        if savestate_path is not None:
            cmd.append(rel_to_root(savestate_path, root))
        run_command(cmd, cwd=root, env=probe_env, dry_run=args.dry_run)
        if args.probe_trigger_input_windows and not args.dry_run:
            resolved_trigger_windows, resolved_trigger_input_windows = resolve_trigger_windows_from_probe(
                args.probe_trigger_input_windows,
                probe_json,
            )
            effective_extract_input_windows = combine_input_window_strings(
                args.input_windows,
                resolved_trigger_input_windows,
            )

    if not args.skip_extract:
        cmd = [
            sys.executable,
            "tools/extract_mesen_scene_range.py",
            "--rom",
            rel_to_root(rom_path, root),
            "--start-frame",
            str(args.start_frame),
            "--end-frame",
            str(args.end_frame),
            "--step",
            str(args.step),
            "--out-dir",
            rel_to_root(frames_dir, root),
            "--frame-timeout-seconds",
            str(args.frame_timeout_seconds),
        ]
        if effective_extract_input_windows:
            cmd.extend(["--input-windows", effective_extract_input_windows])
        if ld_library_path:
            cmd.extend(["--ld-library-path", ld_library_path])
        run_command(cmd, cwd=root, dry_run=args.dry_run)

    if not args.skip_design_pack:
        cmd = [
            sys.executable,
            "tools/build_mesen_design_pack_range.py",
            rel_to_root(frames_dir, root),
            rel_to_root(design_dir, root),
            "--clean-out",
        ]
        run_command(cmd, cwd=root, dry_run=args.dry_run)

    if not args.skip_activity:
        cmd = [
            sys.executable,
            "tools/build_mesen_activity_trace.py",
            rel_to_root(probe_json, root),
            rel_to_root(activity_json, root),
            "--markdown-out",
            rel_to_root(activity_md, root),
        ]
        run_command(cmd, cwd=root, dry_run=args.dry_run)

    if args.with_provenance:
        cmd = [
            sys.executable,
            "tools/build_tilemap_chunk_provenance.py",
            rel_to_root(design_dir, root),
            rel_to_root(probe_l001210_json, root),
            rel_to_root(provenance_json, root),
            "--markdown-out",
            rel_to_root(provenance_md, root),
            "--carry-frames",
            str(args.carry_frames),
            "--forward-frames",
            str(args.forward_frames),
        ]
        for path in chunk_validation_paths:
            cmd.extend(["--chunk-validation", rel_to_root(path, root)])
        run_command(cmd, cwd=root, dry_run=args.dry_run)

    if not args.skip_visual_contract:
        cmd = [
            sys.executable,
            "tools/build_mesen_visual_contract_range.py",
            rel_to_root(design_dir, root),
            rel_to_root(visual_dir, root),
            "--probe-json",
            rel_to_root(probe_json, root),
            "--activity-trace-json",
            rel_to_root(activity_json, root),
            "--clean-out",
        ]
        if args.with_provenance:
            cmd.extend(["--provenance-json", rel_to_root(provenance_json, root)])
        run_command(cmd, cwd=root, dry_run=args.dry_run)

    summary_payload = {
        "schema": "td2.mesen_guided_export.v1",
        "slug": safe_slug,
        "bundle": bundle,
        "title": args.title or bundle,
        "question": args.question or None,
        "start_frame": args.start_frame,
        "end_frame": args.end_frame,
        "step": args.step,
        "input_windows": args.input_windows,
        "probe_trigger_input_windows": args.probe_trigger_input_windows,
        "resolved_trigger_windows": resolved_trigger_windows,
        "resolved_input_windows": effective_extract_input_windows,
        "probe_trace_exec_points": args.probe_trace_exec_points,
        "savestate": rel_to_root(savestate_path, root) if savestate_path else None,
        "artifacts": {
            "frames_dir": rel_to_root(frames_dir, root),
            "extract_sequence_txt": rel_to_root(extract_sequence_txt, root),
            "extract_sequence_json": rel_to_root(extract_sequence_json, root),
            "design_dir": None if args.skip_design_pack else rel_to_root(design_dir, root),
            "design_index_json": None if args.skip_design_pack else rel_to_root(design_index_json, root),
            "probe_json": None if args.skip_probe else rel_to_root(probe_json, root),
            "probe_l001210_json": None if (args.skip_probe or not args.with_provenance) else rel_to_root(probe_l001210_json, root),
            "activity_json": None if args.skip_activity else rel_to_root(activity_json, root),
            "activity_md": None if args.skip_activity else rel_to_root(activity_md, root),
            "visual_dir": None if args.skip_visual_contract else rel_to_root(visual_dir, root),
            "visual_index_json": None if args.skip_visual_contract else rel_to_root(visual_index_json, root),
            "provenance_json": None if not args.with_provenance else rel_to_root(provenance_json, root),
            "provenance_md": None if not args.with_provenance else rel_to_root(provenance_md, root),
            "doc_path": None if args.skip_doc else rel_to_root(doc_path, root),
        },
    }

    if not args.dry_run:
        summary_json.write_text(json.dumps(summary_payload, indent=2) + "\n", encoding="utf-8")

    if not args.skip_doc:
        note_text = build_review_note(
            title=args.title or bundle,
            question=args.question,
            bundle=bundle,
            start_frame=args.start_frame,
            end_frame=args.end_frame,
            step=args.step,
            input_windows=args.input_windows,
            trigger_input_windows=args.probe_trigger_input_windows,
            resolved_input_windows=effective_extract_input_windows,
            savestate=savestate_path,
            frames_dir=frames_dir,
            design_dir=None if args.skip_design_pack else design_dir,
            probe_json=None if args.skip_probe else probe_json,
            activity_json=None if args.skip_activity else activity_json,
            visual_index_json=None if args.skip_visual_contract else visual_index_json,
            provenance_json=None if not args.with_provenance else provenance_json,
            summary_json=summary_json,
            root=root,
        )
        if doc_path.exists() and not args.force_doc:
            print(f"note exists, leaving untouched: {rel_to_root(doc_path, root)}")
        elif args.dry_run:
            print(f"$ write note -> {rel_to_root(doc_path, root)}")
        else:
            doc_path.write_text(note_text + "\n", encoding="utf-8")
            print(f"wrote note -> {rel_to_root(doc_path, root)}")

    if args.dry_run:
        print(f"planned summary -> {rel_to_root(summary_json, root)}")
    else:
        print(f"wrote summary -> {rel_to_root(summary_json, root)}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
