#!/usr/bin/env python3

from __future__ import annotations

import argparse
import json
from pathlib import Path
from typing import Any


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description=(
            "Scan extracted BG tilemaps for direct word-sequence matches against "
            "the decompressed bank30 DA96 payload."
        )
    )
    parser.add_argument(
        "--chunk-bin",
        type=Path,
        default=Path("tools/out/bank30_67fb_da96.bin"),
        help="decompressed bank30 DA96 binary",
    )
    parser.add_argument(
        "--search-root",
        action="append",
        dest="search_roots",
        type=Path,
        default=[],
        help="root to scan for tilemaps/bg*_tilemap.json (may be repeated)",
    )
    parser.add_argument(
        "--min-match-words",
        type=int,
        default=8,
        help="minimum contiguous word-match length to report",
    )
    parser.add_argument(
        "--top-n",
        type=int,
        default=25,
        help="maximum matches to keep in the summary",
    )
    parser.add_argument(
        "--json-out",
        type=Path,
        required=True,
        help="output JSON report path",
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


def discover_tilemaps(search_roots: list[Path]) -> list[Path]:
    found: list[Path] = []
    seen: set[Path] = set()
    for root in search_roots:
        if not root.exists():
            continue
        for path in sorted(root.rglob("bg*_tilemap.json")):
            if path.parent.name != "tilemaps":
                continue
            resolved = path.resolve()
            if resolved in seen:
                continue
            seen.add(resolved)
            found.append(path)
    return found


def longest_match(
    chunk_words: list[int],
    row_words: list[int],
    row_col: int,
    chunk_start: int,
) -> int:
    match_len = 0
    chunk_limit = len(chunk_words)
    row_limit = len(row_words)
    while (
        (row_col + match_len) < row_limit
        and (chunk_start + match_len) < chunk_limit
        and row_words[row_col + match_len] == chunk_words[chunk_start + match_len]
    ):
        match_len += 1
    return match_len


def collect_matches(
    chunk_words: list[int],
    tilemap_path: Path,
    min_match_words: int,
) -> dict[str, Any]:
    payload = json.loads(tilemap_path.read_text(encoding="utf-8"))
    rows = payload.get("maps", {}).get("entryWords") or []
    width = len(rows[0]) if rows else 0
    seed_words = max(1, min(4, min_match_words))
    chunk_positions: dict[tuple[int, ...], list[int]] = {}
    for idx in range(0, len(chunk_words) - seed_words + 1):
        key = tuple(chunk_words[idx : idx + seed_words])
        chunk_positions.setdefault(key, []).append(idx)

    matches: list[dict[str, Any]] = []
    best_length = 0
    for row_index, row in enumerate(rows):
        if len(row) < seed_words:
            continue
        for col in range(0, len(row) - seed_words + 1):
            seed = tuple(row[col : col + seed_words])
            if len(set(seed)) == 1:
                continue
            candidate_offsets = chunk_positions.get(seed, [])
            if len(candidate_offsets) > 256:
                continue
            for chunk_start in candidate_offsets:
                match_len = longest_match(chunk_words, row, col, chunk_start)
                if match_len < min_match_words:
                    continue
                best_length = max(best_length, match_len)
                matches.append(
                    {
                        "row": row_index,
                        "col": col,
                        "length_words": match_len,
                        "chunk_offset_words": chunk_start,
                        "chunk_offset_bytes": chunk_start * 2,
                        "first_word": row[col],
                    }
                )

    matches.sort(
        key=lambda row: (
            -int(row["length_words"]),
            int(row["row"]),
            int(row["col"]),
            int(row["chunk_offset_words"]),
        )
    )
    return {
        "tilemap_path": str(tilemap_path),
        "layer_name": payload.get("name"),
        "width_tiles": width,
        "height_tiles": len(rows),
        "match_count": len(matches),
        "best_match_words": best_length,
        "matches": matches,
    }


def write_markdown(output: Path, report: dict[str, Any]) -> None:
    lines: list[str] = []
    lines.append("# Bank30 DA96 Tilemap Correlation")
    lines.append("")
    lines.append(
        f"- chunk: `{report['chunk_bin']}` (`{report['chunk_word_count']}` words)"
    )
    lines.append(f"- search roots: `{', '.join(report['search_roots'])}`")
    lines.append(f"- tilemaps scanned: `{report['tilemap_count']}`")
    lines.append(f"- minimum reported match: `{report['min_match_words']}` words")
    lines.append("")

    best = report.get("best_match")
    if best is None:
        lines.append(
            "No direct contiguous BG tilemap row matches met the reporting threshold."
        )
        lines.append("")
        lines.append(
            "Practical read: current extracted BG tilemaps do not appear to be raw "
            "literal copies of the DA96 word stream."
        )
    else:
        lines.append("## Strongest Match")
        lines.append("")
        lines.append(
            f"- tilemap: `{best['tilemap_path']}`"
        )
        lines.append(f"- layer: `{best['layer_name']}`")
        lines.append(f"- row/col: `{best['row']}` / `{best['col']}`")
        lines.append(f"- length: `{best['length_words']}` words")
        lines.append(
            f"- DA96 offset: word `{best['chunk_offset_words']}` "
            f"(byte `0x{best['chunk_offset_bytes']:X}`)"
        )

    lines.append("")
    lines.append("## Top Tilemaps")
    lines.append("")
    lines.append("| Tilemap | Layer | Best match | Match count |")
    lines.append("|---|---|---:|---:|")
    for row in report["per_tilemap"][: min(12, len(report["per_tilemap"]))]:
        lines.append(
            f"| `{row['tilemap_path']}` | `{row['layer_name']}` | "
            f"`{row['best_match_words']}` | `{row['match_count']}` |"
        )

    output.parent.mkdir(parents=True, exist_ok=True)
    output.write_text("\n".join(lines) + "\n", encoding="utf-8")


def main() -> int:
    args = parse_args()
    search_roots = args.search_roots or [Path("tools/out"), Path("port/assets")]
    chunk_words = load_words(args.chunk_bin)
    tilemaps = discover_tilemaps(search_roots)

    per_tilemap = [
        collect_matches(chunk_words, tilemap_path, args.min_match_words)
        for tilemap_path in tilemaps
    ]
    per_tilemap.sort(
        key=lambda row: (
            -int(row["best_match_words"]),
            -int(row["match_count"]),
            str(row["tilemap_path"]),
        )
    )

    all_matches = []
    for row in per_tilemap:
        for match in row["matches"]:
            merged = dict(match)
            merged["tilemap_path"] = row["tilemap_path"]
            merged["layer_name"] = row["layer_name"]
            all_matches.append(merged)
    all_matches.sort(
        key=lambda row: (
            -int(row["length_words"]),
            str(row["tilemap_path"]),
            int(row["row"]),
            int(row["col"]),
            int(row["chunk_offset_words"]),
        )
    )
    all_matches = all_matches[: args.top_n]

    report = {
        "schema": "td2.bank30.da96.tilemap_correlation.v1",
        "chunk_bin": str(args.chunk_bin),
        "chunk_word_count": len(chunk_words),
        "search_roots": [str(root) for root in search_roots],
        "tilemap_count": len(tilemaps),
        "min_match_words": args.min_match_words,
        "best_match": all_matches[0] if all_matches else None,
        "top_matches": all_matches,
        "per_tilemap": per_tilemap,
    }

    args.json_out.parent.mkdir(parents=True, exist_ok=True)
    args.json_out.write_text(json.dumps(report, indent=2), encoding="utf-8")
    if args.markdown_out is not None:
        write_markdown(args.markdown_out, report)

    print(
        "scanned "
        f"{len(tilemaps)} tilemaps; "
        f"best match length = {report['best_match']['length_words'] if report['best_match'] else 0}"
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
