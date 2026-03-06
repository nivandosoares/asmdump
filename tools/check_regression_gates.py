#!/usr/bin/env python3
"""Evaluate pixel-regression gates from a policy JSON contract."""

from __future__ import annotations

import argparse
import json
import sys
from pathlib import Path
from typing import Any

from compare_frames import compare_images, load_image


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description=(
            "Validate rendered frame outputs against golden references using a "
            "policy-driven regression gate contract."
        )
    )
    parser.add_argument("contract_json", type=Path, help="Regression gate contract JSON path.")
    parser.add_argument(
        "--render-dir",
        type=Path,
        default=None,
        help="Directory containing rendered frame_XXXXX.ppm files.",
    )
    parser.add_argument(
        "--json-out",
        type=Path,
        default=None,
        help="Optional report JSON output path.",
    )
    return parser.parse_args()


def as_int(value: Any, default: int = 0) -> int:
    try:
        return int(value)
    except (TypeError, ValueError):
        return default


def as_float(value: Any, default: float | None = None) -> float | None:
    if value is None:
        return default
    try:
        return float(value)
    except (TypeError, ValueError):
        return default


def resolve_path(raw: str, base_dir: Path) -> Path:
    path = Path(raw)
    if path.is_absolute():
        return path
    from_base = (base_dir / path).resolve()
    if from_base.exists():
        return from_base
    from_cwd = (Path.cwd() / path).resolve()
    if from_cwd.exists():
        return from_cwd
    return from_base


def parse_sequence_manifest(path: Path) -> list[dict[str, Any]]:
    entries: list[dict[str, Any]] = []
    cursor = 0
    for raw_line in path.read_text(encoding="utf-8").splitlines():
        line = raw_line.strip()
        if not line or line.startswith("#"):
            continue
        parts = line.split()
        if len(parts) < 2:
            raise ValueError(f"malformed manifest line: {raw_line!r}")
        duration = as_int(parts[1], -1)
        if duration <= 0:
            raise ValueError(f"non-positive manifest duration in line: {raw_line!r}")
        entries.append({"raw": line, "start_frame": cursor, "duration": duration})
        cursor += duration
    if not entries:
        raise ValueError(f"manifest has no entries: {path}")
    return entries


def find_token_start(entries: list[dict[str, Any]], token: str) -> tuple[int | None, str | None]:
    for entry in entries:
        line = str(entry["raw"])
        if token in line:
            return as_int(entry["start_frame"]), line
    return None, None


def frame_image_path(render_dir: Path, pattern: str, frame: int) -> Path:
    return render_dir / (pattern % frame)


def compare_image_paths(expected_path: Path, actual_path: Path) -> dict[str, Any]:
    expected_w, expected_h, expected_pixels = load_image(expected_path)
    actual_w, actual_h, actual_pixels = load_image(actual_path)
    if (expected_w, expected_h) != (actual_w, actual_h):
        raise ValueError(
            f"image size mismatch: expected {expected_w}x{expected_h}, got {actual_w}x{actual_h}"
        )
    result = compare_images(expected_pixels, actual_pixels)
    pixel_count = as_int(result["pixel_count"], 0)
    mismatch_pixels = as_int(result["mismatch_pixels"], 0)
    mismatch_ratio = (mismatch_pixels / pixel_count) if pixel_count else 0.0
    return {
        "pixel_count": pixel_count,
        "mismatch_pixels": mismatch_pixels,
        "mismatch_ratio": mismatch_ratio,
        "max_channel_diff": as_int(result["max_channel_diff"], 0),
        "mean_abs_channel_diff": float(result["mean_abs_channel_diff"]),
        "rmse": float(result["rmse"]),
    }


def get_policy(
    policies: dict[str, Any], check: dict[str, Any]
) -> tuple[str, int | None, float | None]:
    policy_name = str(check.get("policy", "default"))
    policy = policies.get(policy_name, {})
    max_pixels = check.get("max_mismatch_pixels", policy.get("max_mismatch_pixels", 0))
    max_ratio = check.get("max_mismatch_ratio", policy.get("max_mismatch_ratio", None))
    max_pixels_int = as_int(max_pixels) if max_pixels is not None else None
    max_ratio_float = as_float(max_ratio, None)
    return policy_name, max_pixels_int, max_ratio_float


def gate_passed(
    mismatch_pixels: int,
    mismatch_ratio: float,
    max_pixels: int | None,
    max_ratio: float | None,
) -> bool:
    if max_pixels is not None and mismatch_pixels > max_pixels:
        return False
    if max_ratio is not None and mismatch_ratio > max_ratio:
        return False
    return True


def evaluate_contract(contract_path: Path, render_dir_arg: Path | None) -> dict[str, Any]:
    base_dir = contract_path.resolve().parent
    contract = json.loads(contract_path.read_text(encoding="utf-8"))

    sequence_manifest = resolve_path(str(contract["sequence_manifest"]), base_dir)
    entries = parse_sequence_manifest(sequence_manifest)

    if render_dir_arg is not None:
        render_dir = render_dir_arg.resolve()
    elif "render_dir" in contract:
        render_dir = resolve_path(str(contract["render_dir"]), base_dir)
    else:
        raise ValueError("render directory is required (--render-dir or render_dir in contract)")
    if not render_dir.is_dir():
        raise ValueError(f"render directory not found: {render_dir}")

    frame_pattern = str(contract.get("frame_pattern", "frame_%05d.ppm"))
    policies = dict(contract.get("policies", {}))
    checks = contract.get("checks", [])
    if not isinstance(checks, list) or not checks:
        raise ValueError("contract contains no checks")

    results: list[dict[str, Any]] = []
    for raw_check in checks:
        if not isinstance(raw_check, dict):
            continue
        check = dict(raw_check)
        check_id = str(check.get("id", "unnamed"))
        kind = str(check.get("kind", "token_vs_golden"))
        token = str(check.get("token", ""))
        policy_name, max_pixels, max_ratio = get_policy(policies, check)

        start_frame, matched_line = find_token_start(entries, token)
        if start_frame is None:
            results.append(
                {
                    "id": check_id,
                    "kind": kind,
                    "policy": policy_name,
                    "passed": False,
                    "reason": f"token not found: {token}",
                    "token": token,
                }
            )
            continue

        row: dict[str, Any] = {
            "id": check_id,
            "kind": kind,
            "policy": policy_name,
            "token": token,
            "matched_manifest_line": matched_line,
            "token_start_frame": start_frame,
            "max_mismatch_pixels": max_pixels,
            "max_mismatch_ratio": max_ratio,
        }

        try:
            if kind == "token_vs_golden":
                golden = resolve_path(str(check["golden"]), base_dir)
                frame = start_frame + as_int(check.get("frame_offset", 0))
                actual = frame_image_path(render_dir, frame_pattern, frame)
                if not golden.is_file():
                    raise FileNotFoundError(f"golden not found: {golden}")
                if not actual.is_file():
                    raise FileNotFoundError(f"rendered frame not found: {actual}")
                metrics = compare_image_paths(golden, actual)
                passed = gate_passed(
                    metrics["mismatch_pixels"],
                    metrics["mismatch_ratio"],
                    max_pixels,
                    max_ratio,
                )
                row.update(
                    {
                        "frame": frame,
                        "golden": str(golden),
                        "actual": str(actual),
                        **metrics,
                        "passed": passed,
                    }
                )
            elif kind == "token_pair":
                frame_a = start_frame + as_int(check.get("frame_a_offset", -1))
                frame_b = start_frame + as_int(check.get("frame_b_offset", 0))
                image_a = frame_image_path(render_dir, frame_pattern, frame_a)
                image_b = frame_image_path(render_dir, frame_pattern, frame_b)
                if not image_a.is_file():
                    raise FileNotFoundError(f"rendered frame not found: {image_a}")
                if not image_b.is_file():
                    raise FileNotFoundError(f"rendered frame not found: {image_b}")
                metrics = compare_image_paths(image_a, image_b)
                passed = gate_passed(
                    metrics["mismatch_pixels"],
                    metrics["mismatch_ratio"],
                    max_pixels,
                    max_ratio,
                )
                row.update(
                    {
                        "frame_a": frame_a,
                        "frame_b": frame_b,
                        "image_a": str(image_a),
                        "image_b": str(image_b),
                        **metrics,
                        "passed": passed,
                    }
                )
            else:
                row.update({"passed": False, "reason": f"unsupported check kind: {kind}"})
        except Exception as exc:  # pylint: disable=broad-except
            row.update({"passed": False, "reason": str(exc)})

        results.append(row)

    passed_count = sum(1 for item in results if item.get("passed"))
    failed_count = len(results) - passed_count
    return {
        "contract": str(contract_path.resolve()),
        "render_dir": str(render_dir),
        "sequence_manifest": str(sequence_manifest),
        "total_checks": len(results),
        "passed": passed_count,
        "failed": failed_count,
        "results": results,
    }


def print_summary(report: dict[str, Any]) -> None:
    print(f"contract: {report['contract']}")
    print(f"render_dir: {report['render_dir']}")
    print(f"sequence: {report['sequence_manifest']}")
    print(
        f"checks: total={report['total_checks']} passed={report['passed']} failed={report['failed']}"
    )
    for row in report["results"]:
        status = "PASS" if row.get("passed") else "FAIL"
        check_id = row.get("id", "unnamed")
        kind = row.get("kind", "unknown")
        if row.get("passed"):
            mismatch = row.get("mismatch_pixels")
            ratio = float(row.get("mismatch_ratio", 0.0))
            print(
                f"  {status} {check_id} [{kind}] mismatch={mismatch} ({ratio:.6%})"
            )
        else:
            print(f"  {status} {check_id} [{kind}] reason={row.get('reason', 'n/a')}")


def main() -> int:
    args = parse_args()
    report = evaluate_contract(args.contract_json, args.render_dir)
    print_summary(report)

    if args.json_out is not None:
        args.json_out.parent.mkdir(parents=True, exist_ok=True)
        args.json_out.write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8")
        print(f"json: {args.json_out}")

    return 0 if report["failed"] == 0 else 1


if __name__ == "__main__":
    try:
        raise SystemExit(main())
    except Exception as exc:  # pylint: disable=broad-except
        print(f"error: {exc}", file=sys.stderr)
        raise SystemExit(1)
