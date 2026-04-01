#!/usr/bin/env python3
"""Sweep a late-gameplay BG3 precedence cutoff against screenshot-derived support."""

from __future__ import annotations

import argparse
import json
from dataclasses import dataclass
from pathlib import Path

from PIL import Image


REPO_ROOT = Path(__file__).resolve().parents[1]


@dataclass(frozen=True)
class Score:
    changed_pixels: int
    sad_rgb: int


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description=(
            "Compare late-gameplay bundle layer compositions against "
            "bg_stack_visible_support.png and find the best top-band cutoff "
            "where BG3 should sit above BG2."
        )
    )
    parser.add_argument(
        "bundle_dirs",
        nargs="+",
        type=Path,
        help="One or more gameplay bundle directories.",
    )
    parser.add_argument(
        "--output-dir",
        type=Path,
        required=True,
        help="Directory for summary JSON/Markdown plus candidate PNGs.",
    )
    parser.add_argument(
        "--cutoff-max",
        type=int,
        default=128,
        help="Maximum top-band cutoff to sweep (inclusive). Default: 128.",
    )
    return parser.parse_args()


def repo_rel(path: Path) -> str:
    resolved = path.resolve()
    try:
        return resolved.relative_to(REPO_ROOT).as_posix()
    except ValueError:
        return resolved.as_posix()


def backdrop_rgba(bundle_dir: Path) -> tuple[int, int, int, int]:
    cgram = (bundle_dir / "design_pack" / "raw" / "cgram.bin").read_bytes()
    if len(cgram) < 2:
        return (0, 0, 0, 255)
    value = cgram[0] | (cgram[1] << 8)
    red = value & 0x1F
    green = (value >> 5) & 0x1F
    blue = (value >> 10) & 0x1F
    return (
        (red << 3) | (red >> 2),
        (green << 3) | (green >> 2),
        (blue << 3) | (blue >> 2),
        255,
    )


def load_rgba(path: Path) -> Image.Image:
    return Image.open(path).convert("RGBA")


def compose_layers(
    layer_images: dict[str, Image.Image],
    backdrop: tuple[int, int, int, int],
    order: tuple[str, ...],
) -> Image.Image:
    width, height = next(iter(layer_images.values())).size
    output = Image.new("RGBA", (width, height), backdrop)
    output_pixels = output.load()
    input_pixels = {name: image.load() for name, image in layer_images.items()}

    for y in range(height):
        for x in range(width):
            pixel = backdrop
            for layer_name in order:
                sample = input_pixels[layer_name][x, y]
                if sample != backdrop:
                    pixel = sample
            output_pixels[x, y] = pixel
    return output


def score_rows(candidate: Image.Image, target: Image.Image) -> list[Score]:
    candidate_pixels = candidate.load()
    target_pixels = target.load()
    width, height = candidate.size
    rows: list[Score] = []

    for y in range(height):
        changed = 0
        sad_rgb = 0
        for x in range(width):
            candidate_pixel = candidate_pixels[x, y]
            target_pixel = target_pixels[x, y]
            delta = (
                abs(candidate_pixel[0] - target_pixel[0]) +
                abs(candidate_pixel[1] - target_pixel[1]) +
                abs(candidate_pixel[2] - target_pixel[2])
            )
            sad_rgb += delta
            if delta != 0:
                changed += 1
        rows.append(Score(changed_pixels=changed, sad_rgb=sad_rgb))
    return rows


def sum_scores(rows: list[Score]) -> Score:
    return Score(
        changed_pixels=sum(row.changed_pixels for row in rows),
        sad_rgb=sum(row.sad_rgb for row in rows),
    )


def select_cutoff(
    bg3_over_rows: list[Score],
    bg3_under_rows: list[Score],
    cutoff_max: int,
) -> tuple[int, Score]:
    height = min(len(bg3_over_rows), len(bg3_under_rows))
    best_cutoff = 0
    best_score = sum_scores(bg3_under_rows[:height])

    prefix_over_changed = [0]
    prefix_over_sad = [0]
    prefix_under_changed = [0]
    prefix_under_sad = [0]

    for row in bg3_over_rows[:height]:
        prefix_over_changed.append(prefix_over_changed[-1] + row.changed_pixels)
        prefix_over_sad.append(prefix_over_sad[-1] + row.sad_rgb)
    for row in bg3_under_rows[:height]:
        prefix_under_changed.append(prefix_under_changed[-1] + row.changed_pixels)
        prefix_under_sad.append(prefix_under_sad[-1] + row.sad_rgb)

    upper_bound = min(cutoff_max, height)
    for cutoff in range(0, upper_bound + 1):
        changed = prefix_over_changed[cutoff] + (prefix_under_changed[height] - prefix_under_changed[cutoff])
        sad_rgb = prefix_over_sad[cutoff] + (prefix_under_sad[height] - prefix_under_sad[cutoff])
        score = Score(changed_pixels=changed, sad_rgb=sad_rgb)
        if score.sad_rgb < best_score.sad_rgb:
            best_cutoff = cutoff
            best_score = score

    return best_cutoff, best_score


def build_cutoff_candidate(
    bg3_over: Image.Image,
    bg3_under: Image.Image,
    cutoff: int,
) -> Image.Image:
    output = bg3_under.copy()
    if cutoff > 0:
        top_band = bg3_over.crop((0, 0, bg3_over.width, cutoff))
        output.paste(top_band, (0, 0))
    return output


def write_compare_strip(
    current_main: Image.Image,
    candidate: Image.Image,
    support: Image.Image,
    dest_path: Path,
) -> None:
    width, height = current_main.size
    strip = Image.new("RGBA", (width * 3, height))
    strip.paste(current_main, (0, 0))
    strip.paste(candidate, (width, 0))
    strip.paste(support, (width * 2, 0))
    dest_path.parent.mkdir(parents=True, exist_ok=True)
    strip.save(dest_path)


def write_summary_markdown(results: list[dict], dest_path: Path) -> None:
    lines = [
        "# Gameplay BG3 Cutoff Sweep",
        "",
        "| Bundle | Current main changed | Current main SAD | Best cutoff | Candidate changed | Candidate SAD | Improvement |",
        "|---|---:|---:|---:|---:|---:|---:|",
    ]
    for result in results:
        current_main = result["scores"]["current_main"]
        best_candidate = result["scores"]["best_candidate"]
        lines.append(
            "| "
            f"`{result['bundle_dir']}` | "
            f"{current_main['changed_pixels']} | "
            f"{current_main['sad_rgb']} | "
            f"{result['best_cutoff']} | "
            f"{best_candidate['changed_pixels']} | "
            f"{best_candidate['sad_rgb']} | "
            f"{current_main['sad_rgb'] - best_candidate['sad_rgb']} |"
        )
    lines.extend(
        [
            "",
            "Interpretation",
            "- `current main`: the tracked bundle `main.png` versus `bg_stack_visible_support.png`.",
            "- `best cutoff`: top-band height where `BG3` sits above `BG2`; below that it falls back under `BG2`.",
            "- `candidate`: the best mixed stack built from tracked `bg1/bg2/bg3` bundle layers.",
        ]
    )
    dest_path.parent.mkdir(parents=True, exist_ok=True)
    dest_path.write_text("\n".join(lines) + "\n", encoding="utf-8")


def main() -> None:
    args = parse_args()
    output_dir = args.output_dir.resolve()
    output_dir.mkdir(parents=True, exist_ok=True)

    results: list[dict] = []

    for bundle_arg in args.bundle_dirs:
        bundle_dir = bundle_arg.resolve()
        bundle_name = bundle_dir.name
        backdrop = backdrop_rgba(bundle_dir)
        layer_images = {
            "bg1": load_rgba(bundle_dir / "bg1.png"),
            "bg2": load_rgba(bundle_dir / "bg2.png"),
            "bg3": load_rgba(bundle_dir / "bg3.png"),
        }
        current_main = load_rgba(bundle_dir / "main.png")
        support = load_rgba(bundle_dir / "bg_stack_visible_support.png")

        bg3_under = compose_layers(layer_images, backdrop, ("bg3", "bg2", "bg1"))
        bg3_over = compose_layers(layer_images, backdrop, ("bg2", "bg3", "bg1"))

        current_main_score = sum_scores(score_rows(current_main, support))
        bg3_under_score = sum_scores(score_rows(bg3_under, support))
        bg3_over_rows = score_rows(bg3_over, support)
        bg3_under_rows = score_rows(bg3_under, support)
        best_cutoff, best_score = select_cutoff(bg3_over_rows, bg3_under_rows, args.cutoff_max)
        best_candidate = build_cutoff_candidate(bg3_over, bg3_under, best_cutoff)

        candidate_png = output_dir / f"{bundle_name}_bg3_cutoff_candidate.png"
        compare_png = output_dir / f"{bundle_name}_bg3_cutoff_compare.png"
        best_candidate.save(candidate_png)
        write_compare_strip(current_main, best_candidate, support, compare_png)

        result = {
            "bundle_dir": repo_rel(bundle_dir),
            "best_cutoff": best_cutoff,
            "scores": {
                "current_main": {
                    "changed_pixels": current_main_score.changed_pixels,
                    "sad_rgb": current_main_score.sad_rgb,
                },
                "bg3_under_bg2": {
                    "changed_pixels": bg3_under_score.changed_pixels,
                    "sad_rgb": bg3_under_score.sad_rgb,
                },
                "bg3_over_bg2": {
                    "changed_pixels": bg3_over_rows and sum(row.changed_pixels for row in bg3_over_rows) or 0,
                    "sad_rgb": bg3_over_rows and sum(row.sad_rgb for row in bg3_over_rows) or 0,
                },
                "best_candidate": {
                    "changed_pixels": best_score.changed_pixels,
                    "sad_rgb": best_score.sad_rgb,
                },
            },
            "artifacts": {
                "candidate_png": repo_rel(candidate_png),
                "compare_png": repo_rel(compare_png),
            },
        }
        results.append(result)

    summary = {
        "cutoff_max": args.cutoff_max,
        "results": results,
    }
    json_path = output_dir / "summary.json"
    markdown_path = output_dir / "summary.md"
    json_path.write_text(json.dumps(summary, indent=2) + "\n", encoding="utf-8")
    write_summary_markdown(results, markdown_path)
    print(json.dumps(summary, indent=2))


if __name__ == "__main__":
    main()
