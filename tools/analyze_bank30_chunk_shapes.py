#!/usr/bin/env python3

from __future__ import annotations

import argparse
import json
from collections import Counter
from itertools import combinations
from pathlib import Path
from typing import Any


DEFAULT_FILES = {
    "da96": "bank30_67fb_da96.bin",
    "df6c": "bank30_26fb_df6c.bin",
    "e039": "bank30_26fb_e039.bin",
    "e73f": "bank30_26fb_e73f.bin",
    "e800": "bank30_26fb_e800.bin",
    "ee7f": "bank30_26fb_ee7f.bin",
}


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description=(
            "Summarize structural signatures of refreshed bank30 chunk outputs "
            "to support lane-1 provenance triage."
        )
    )
    parser.add_argument(
        "--base-dir",
        type=Path,
        default=Path("tools/out"),
        help="directory containing bank30_*.bin outputs",
    )
    parser.add_argument(
        "--json-out",
        type=Path,
        required=True,
        help="output JSON path",
    )
    parser.add_argument(
        "--markdown-out",
        type=Path,
        default=None,
        help="optional markdown summary path",
    )
    return parser.parse_args()


def load_words(path: Path) -> list[int]:
    data = path.read_bytes()
    return [data[i] | (data[i + 1] << 8) for i in range(0, len(data) - 1, 2)]


def pct(numer: int, denom: int) -> float:
    if denom <= 0:
        return 0.0
    return round((numer / denom) * 100.0, 4)


def find_long_runs(words: list[int], min_len: int) -> list[dict[str, int]]:
    runs: list[dict[str, int]] = []
    start = 0
    for i in range(1, len(words) + 1):
        if i == len(words) or words[i] != words[start]:
            length = i - start
            if length >= min_len:
                runs.append(
                    {
                        "start_word": start,
                        "length_words": length,
                        "word": words[start],
                    }
                )
            start = i
    return runs


def summarize_chunk(words: list[int]) -> dict[str, Any]:
    counter = Counter(words)
    zero_words = counter.get(0, 0)
    hi_nonzero = sum(1 for word in words if (word & 0xFC00) != 0)
    gt_7fff = sum(1 for word in words if word > 0x7FFF)
    return {
        "word_count": len(words),
        "zero_word_count": zero_words,
        "zero_word_pct": pct(zero_words, len(words)),
        "unique_word_count": len(counter),
        "hi_nonzero_word_count": hi_nonzero,
        "hi_nonzero_word_pct": pct(hi_nonzero, len(words)),
        "gt_7fff_word_count": gt_7fff,
        "gt_7fff_word_pct": pct(gt_7fff, len(words)),
        "top_words": [
            {"word": word, "count": count}
            for word, count in counter.most_common(12)
        ],
        "long_runs_ge_8": find_long_runs(words, 8)[:24],
    }


def same_index_match_pct(a_words: list[int], b_words: list[int]) -> dict[str, Any]:
    compare_words = min(len(a_words), len(b_words))
    same = sum(1 for i in range(compare_words) if a_words[i] == b_words[i])
    return {
        "compare_words": compare_words,
        "same_words": same,
        "same_word_pct": pct(same, compare_words),
    }


def analyze_da96(words: list[int]) -> dict[str, Any]:
    long_runs = find_long_runs(words, 32)
    runs_7c1f = [run for run in long_runs if run["word"] == 0x7C1F]
    stride_counts = Counter(
        runs_7c1f[i + 1]["start_word"] - runs_7c1f[i]["start_word"]
        for i in range(len(runs_7c1f) - 1)
    )
    dominant_stride = stride_counts.most_common(1)[0][0] if stride_counts else None

    repeated_row_block: dict[str, Any] = {
        "run_count": len(runs_7c1f),
        "dominant_stride_words": dominant_stride,
        "stride_counts": [
            {"stride_words": stride, "count": count}
            for stride, count in stride_counts.most_common(8)
        ],
    }

    if dominant_stride and runs_7c1f:
        first_start = runs_7c1f[0]["start_word"]
        rows = []
        for n in range(len(runs_7c1f)):
            start = first_start + (n * dominant_stride)
            end = start + dominant_stride
            if end > len(words):
                break
            rows.append(words[start:end])
        row_signatures = Counter(tuple(row) for row in rows)
        repeated_row_block.update(
            {
                "first_start_word": first_start,
                "row_block_count": len(rows),
                "row_width_words": dominant_stride,
                "identical_row_variants": len(row_signatures),
                "largest_repeated_row_count": row_signatures.most_common(1)[0][1]
                if row_signatures
                else 0,
            }
        )

    return {
        "long_runs_ge_32": long_runs[:40],
        "repeated_7c1f_row_block": repeated_row_block,
    }


def analyze_ee7f_family(shapes: dict[str, dict[str, Any]], words_by_name: dict[str, list[int]]) -> dict[str, Any]:
    family = {}
    for name in ("df6c", "e73f", "ee7f"):
        family[name] = shapes[name]

    comparisons = {}
    for a, b in (("df6c", "e73f"), ("df6c", "ee7f"), ("e73f", "ee7f")):
        comparisons[f"{a}_vs_{b}"] = same_index_match_pct(words_by_name[a], words_by_name[b])

    return {
        "family_members": family,
        "pairwise_same_index": comparisons,
    }


def write_markdown(output: Path, summary: dict[str, Any]) -> None:
    chunks = summary["chunks"]
    da96 = summary["da96_focus"]
    family = summary["ee7f_family_focus"]
    lines: list[str] = []
    lines.append("# Bank30 Chunk Shape Analysis")
    lines.append("")
    lines.append("## Refreshed Chunk Metrics")
    lines.append("")
    lines.append("| Chunk | Words | Zero % | Unique words | High-bit-set % | > `0x7FFF` % |")
    lines.append("|---|---:|---:|---:|---:|---:|")
    for name in ("da96", "df6c", "e039", "e73f", "e800", "ee7f"):
        row = chunks[name]
        lines.append(
            f"| `{name}` | `{row['word_count']}` | `{row['zero_word_pct']}` | "
            f"`{row['unique_word_count']}` | `{row['hi_nonzero_word_pct']}` | "
            f"`{row['gt_7fff_word_pct']}` |"
        )

    lines.append("")
    lines.append("## `DA96` Focus")
    lines.append("")
    repeated = da96["repeated_7c1f_row_block"]
    lines.append(
        "- repeated `0x7C1F` run count: "
        f"`{repeated['run_count']}`"
    )
    lines.append(
        "- dominant run stride: "
        f"`{repeated.get('dominant_stride_words')}` words"
    )
    lines.append(
        "- repeated row block width/rows: "
        f"`{repeated.get('row_width_words')}` x `{repeated.get('row_block_count')}`"
    )
    lines.append(
        "- identical row variants across that block: "
        f"`{repeated.get('identical_row_variants')}` "
        f"(largest repeated row count `{repeated.get('largest_repeated_row_count')}`)"
    )
    lines.append("")
    lines.append("Top `DA96` long runs (`>=32` words):")
    for run in da96["long_runs_ge_32"][:12]:
        lines.append(
            f"- start `{run['start_word']}` length `{run['length_words']}` "
            f"word `0x{run['word']:04X}`"
        )

    lines.append("")
    lines.append("## `EE7F` Family Focus")
    lines.append("")
    lines.append("| Pair | Compared words | Same words | Same % |")
    lines.append("|---|---:|---:|---:|")
    for key in ("df6c_vs_e73f", "df6c_vs_ee7f", "e73f_vs_ee7f"):
        row = family["pairwise_same_index"][key]
        lines.append(
            f"| `{key}` | `{row['compare_words']}` | `{row['same_words']}` | "
            f"`{row['same_word_pct']}` |"
        )
    lines.append("")
    lines.append(
        "- `DF6C` and `E73F` stay a tight sparse pair, while `EE7F` keeps the same "
        "899-word footprint but materially different occupancy and same-index shape."
    )

    output.parent.mkdir(parents=True, exist_ok=True)
    output.write_text("\n".join(lines) + "\n", encoding="utf-8")


def main() -> int:
    args = parse_args()

    words_by_name: dict[str, list[int]] = {}
    chunks: dict[str, dict[str, Any]] = {}
    for name, filename in DEFAULT_FILES.items():
        path = args.base_dir / filename
        words = load_words(path)
        words_by_name[name] = words
        chunk_summary = summarize_chunk(words)
        chunk_summary["path"] = str(path)
        chunks[name] = chunk_summary

    pairwise_same_index = {
        f"{a}_vs_{b}": same_index_match_pct(words_by_name[a], words_by_name[b])
        for a, b in combinations(("df6c", "e039", "e73f", "e800", "ee7f"), 2)
    }

    summary = {
        "inputs": {name: str(args.base_dir / filename) for name, filename in DEFAULT_FILES.items()},
        "chunks": chunks,
        "pairwise_same_index": pairwise_same_index,
        "da96_focus": analyze_da96(words_by_name["da96"]),
        "ee7f_family_focus": analyze_ee7f_family(chunks, words_by_name),
    }

    args.json_out.parent.mkdir(parents=True, exist_ok=True)
    args.json_out.write_text(json.dumps(summary, indent=2) + "\n", encoding="utf-8")
    print(f"wrote json -> {args.json_out}")

    if args.markdown_out is not None:
        write_markdown(args.markdown_out, summary)
        print(f"wrote markdown -> {args.markdown_out}")

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
