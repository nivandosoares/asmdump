#!/usr/bin/env python3

from __future__ import annotations

import argparse
import json
from collections import defaultdict
from pathlib import Path
import re


LOROM_BANK_SIZE = 0x8000
PRINTABLE_MIN = 0x20
PRINTABLE_MAX = 0x7E
REJECT_CHARS = set("{}[]<>|~`\\")


def detect_header_size(rom_size: int) -> int:
    return 512 if (rom_size % LOROM_BANK_SIZE) == 512 else 0


def parse_bank_ranges(raw: str) -> list[int]:
    banks: set[int] = set()
    for part in raw.split(","):
        token = part.strip().lower()
        if not token:
            continue
        if "-" in token:
            start_text, end_text = token.split("-", 1)
            start = int(start_text, 0)
            end = int(end_text, 0)
            if end < start:
                raise ValueError(f"invalid bank range: {part}")
            for bank in range(start, end + 1):
                banks.add(bank)
        else:
            banks.add(int(token, 0))
    return sorted(banks)


def parse_strides(raw: str) -> list[int]:
    strides = sorted({int(token.strip(), 0) for token in raw.split(",") if token.strip()})
    if not strides:
        raise ValueError("at least one stride is required")
    if any(stride <= 0 for stride in strides):
        raise ValueError("strides must be positive")
    return strides


def parse_needles(raw: str | None) -> list[str]:
    if raw is None:
        return []
    needles = [token.strip() for token in raw.split(",") if token.strip()]
    seen: set[str] = set()
    ordered: list[str] = []
    for needle in needles:
        lowered = needle.lower()
        if lowered in seen:
            continue
        seen.add(lowered)
        ordered.append(needle)
    return ordered


def parse_optional_int(raw: str | None) -> int | None:
    if raw is None:
        return None
    return int(raw, 0)


def read_bank(rom_bytes: bytes, bank_index: int) -> bytes:
    header_size = detect_header_size(len(rom_bytes))
    start = header_size + (bank_index * LOROM_BANK_SIZE)
    end = start + LOROM_BANK_SIZE
    if end > len(rom_bytes):
        raise ValueError(f"bank {bank_index:02X} exceeds ROM bounds")
    return rom_bytes[start:end]


def is_printable_ascii(byte_value: int) -> bool:
    return PRINTABLE_MIN <= byte_value <= PRINTABLE_MAX


def looks_text_like(text: str) -> bool:
    if len(text) < 4:
        return False
    if any(char in REJECT_CHARS for char in text):
        return False

    letters = sum(char.isalpha() for char in text)
    digits = sum(char.isdigit() for char in text)
    spaces = text.count(" ")
    punctuation = sum(char in "-',./:!?()+&" for char in text)

    if letters < 4:
        return False
    if letters + digits + spaces + punctuation < int(len(text) * 0.85):
        return False
    if spaces > len(text) // 2:
        return False
    return True


def looks_interleaved_text_like(text: str) -> bool:
    if not looks_text_like(text):
        return False

    spaces = text.count(" ")
    if spaces < 1:
        return False

    words = [token for token in re.split(r"[^A-Za-z0-9]+", text) if token]
    long_words = [word for word in words if len(word) >= 2]
    if len(long_words) < 2:
        return False

    letters_only = "".join(char.lower() for char in text if char.isalpha())
    if not letters_only:
        return False
    vowels = sum(char in "aeiouy" for char in letters_only)
    vowel_ratio = vowels / len(letters_only)
    if vowel_ratio < 0.22 or vowel_ratio > 0.60:
        return False

    return True


def find_lane_runs(
    bank_data: bytes,
    bank_index: int,
    stride: int,
    min_length: int,
    anchor_byte: int | None = None,
    anchor_loose: bool = False,
) -> list[dict[str, object]]:
    candidates: list[dict[str, object]] = []

    for phase in range(stride):
        lane_bytes = bank_data[phase::stride]
        run_start = None
        run_chars: list[str] = []

        def flush(run_end_index: int | None) -> None:
            nonlocal run_start, run_chars
            if run_start is None or len(run_chars) < min_length:
                run_start = None
                run_chars = []
                return

            text = "".join(run_chars)
            run_bytes = lane_bytes[run_start : run_start + len(run_chars)]
            if anchor_byte is not None and anchor_byte not in run_bytes:
                run_start = None
                run_chars = []
                return

            looks_ok = looks_text_like(text) if stride == 1 else looks_interleaved_text_like(text)
            if anchor_loose and anchor_byte is not None:
                looks_ok = True
            if not looks_ok:
                run_start = None
                run_chars = []
                return

            start_bank_offset = phase + (run_start * stride)
            last_lane_index = run_start + len(run_chars) - 1
            end_bank_offset = phase + (last_lane_index * stride)
            span_bytes = end_bank_offset - start_bank_offset + 1
            anchor_positions_lane = [
                run_start + index for index, byte_value in enumerate(run_bytes) if byte_value == anchor_byte
            ] if anchor_byte is not None else []
            anchor_positions_bank = [
                phase + (lane_index * stride) for lane_index in anchor_positions_lane
            ]

            candidates.append(
                {
                    "bank": bank_index,
                    "bank_hex": f"{bank_index:02X}",
                    "stride": stride,
                    "phase": phase,
                    "mode": "contiguous" if stride == 1 else "interleaved",
                    "bank_offset": start_bank_offset,
                    "bank_offset_hex": f"0x{start_bank_offset:04X}",
                    "snes": f"{bank_index:02X}:{0x8000 + start_bank_offset:04X}",
                    "end_bank_offset": end_bank_offset,
                    "end_bank_offset_hex": f"0x{end_bank_offset:04X}",
                    "end_snes": f"{bank_index:02X}:{0x8000 + end_bank_offset:04X}",
                    "char_length": len(text),
                    "span_bytes": span_bytes,
                    "density": round(len(text) / span_bytes, 4),
                    "looks_text_like": looks_ok,
                    "anchor_byte": anchor_byte,
                    "anchor_count": len(anchor_positions_bank),
                    "anchor_bank_offsets": anchor_positions_bank,
                    "anchor_bank_offsets_hex": [f"0x{offset:04X}" for offset in anchor_positions_bank],
                    "anchor_snes": [f"{bank_index:02X}:{0x8000 + offset:04X}" for offset in anchor_positions_bank],
                    "text": text,
                }
            )

            run_start = None
            run_chars = []

        for lane_index, byte_value in enumerate(lane_bytes):
            if is_printable_ascii(byte_value):
                if run_start is None:
                    run_start = lane_index
                run_chars.append(chr(byte_value))
            else:
                flush(lane_index - 1)

        flush(len(lane_bytes) - 1 if run_start is not None else None)

    return candidates


def dedupe_candidates(candidates: list[dict[str, object]]) -> list[dict[str, object]]:
    best_by_key: dict[tuple[object, ...], dict[str, object]] = {}
    for candidate in candidates:
        key = (
            candidate["bank"],
            candidate["text"],
            candidate["bank_offset"],
            candidate.get("end_bank_offset"),
            candidate["stride"],
            candidate["phase"],
        )
        previous = best_by_key.get(key)
        if previous is None or int(candidate["char_length"]) > int(previous["char_length"]):
            best_by_key[key] = candidate
    return sorted(
        best_by_key.values(),
        key=lambda item: (
            int(item["bank"]),
            int(item["bank_offset"]),
            int(item["stride"]),
            int(item["phase"]),
        ),
    )


def find_needle_hits(
    bank_data: bytes,
    bank_index: int,
    stride: int,
    needles: list[str],
) -> list[dict[str, object]]:
    hits: list[dict[str, object]] = []
    lowered_needles = [(needle, needle.lower()) for needle in needles]

    for phase in range(stride):
        lane_bytes = bank_data[phase::stride]
        run_start = None
        run_chars: list[str] = []

        def flush() -> None:
            nonlocal run_start, run_chars
            if run_start is None or not run_chars:
                run_start = None
                run_chars = []
                return

            text = "".join(run_chars)
            lowered = text.lower()
            for needle, lowered_needle in lowered_needles:
                search_start = 0
                while True:
                    index = lowered.find(lowered_needle, search_start)
                    if index < 0:
                        break
                    bank_offset = phase + ((run_start + index) * stride)
                    hits.append(
                        {
                            "bank": bank_index,
                            "bank_hex": f"{bank_index:02X}",
                            "stride": stride,
                            "phase": phase,
                            "needle": needle,
                            "bank_offset": bank_offset,
                            "bank_offset_hex": f"0x{bank_offset:04X}",
                            "snes": f"{bank_index:02X}:{0x8000 + bank_offset:04X}",
                            "context": text,
                        }
                    )
                    search_start = index + 1

            run_start = None
            run_chars = []

        for lane_index, byte_value in enumerate(lane_bytes):
            if is_printable_ascii(byte_value):
                if run_start is None:
                    run_start = lane_index
                run_chars.append(chr(byte_value))
            else:
                flush()

        flush()

    return hits


def build_summary(
    candidates: list[dict[str, object]],
    per_bank_limit: int,
) -> dict[str, object]:
    summary_rows: list[dict[str, object]] = []
    grouped: dict[int, list[dict[str, object]]] = defaultdict(list)
    for candidate in candidates:
        grouped[int(candidate["bank"])].append(candidate)

    for bank in sorted(grouped):
        rows = sorted(
            grouped[bank],
            key=lambda item: (
                -int(item["char_length"]),
                int(item["stride"]),
                int(item["bank_offset"]),
            ),
        )
        summary_rows.append(
            {
                "bank": bank,
                "bank_hex": f"{bank:02X}",
                "count": len(rows),
                "top_hits": rows[:per_bank_limit],
            }
        )

    return {
        "candidate_count": len(candidates),
        "bank_count": len(summary_rows),
        "banks": summary_rows,
    }


def write_markdown(
    path: Path,
    summary: dict[str, object],
    strides: list[int],
    min_length: int,
    banks: list[int],
    anchor_byte: int | None,
) -> None:
    lines = [
        "# ASCII Candidate Scan",
        "",
        f"- Banks: `{', '.join(f'{bank:02X}' for bank in banks)}`",
        f"- Strides: `{', '.join(str(stride) for stride in strides)}`",
        f"- Minimum printable run length: `{min_length}`",
        f"- Anchor byte: `{anchor_byte:#04x}`" if anchor_byte is not None else "- Anchor byte: `none`",
        f"- Candidate count: `{summary['candidate_count']}`",
        "",
    ]

    for bank_row in summary["banks"]:
        lines.append(f"## Bank `{bank_row['bank_hex']}`")
        lines.append("")
        lines.append(f"- Candidate count: `{bank_row['count']}`")
        for hit in bank_row["top_hits"]:
            lines.append(
                f"- `{hit['snes']}` stride `{hit['stride']}` phase `{hit['phase']}` "
                f"end `{hit['end_snes']}` len `{hit['char_length']}` density `{hit['density']}` "
                f"anchors `{', '.join(hit['anchor_snes']) if hit['anchor_snes'] else 'none'}` -> `{hit['text']}`"
            )
        lines.append("")

    path.write_text("\n".join(lines), encoding="utf-8")


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Scan a LoROM image for contiguous and interleaved ASCII-like text candidates."
    )
    parser.add_argument("rom", type=Path, help="input ROM path")
    parser.add_argument(
        "--banks",
        default="0-31",
        help="bank list/ranges (default: 0-31)",
    )
    parser.add_argument(
        "--strides",
        default="1,2,3",
        help="comma-separated stride list to test (default: 1,2,3)",
    )
    parser.add_argument(
        "--min-length",
        type=int,
        default=6,
        help="minimum printable run length in the chosen lane (default: 6)",
    )
    parser.add_argument(
        "--per-bank-limit",
        type=int,
        default=8,
        help="top hits to keep per bank in the summary (default: 8)",
    )
    parser.add_argument(
        "--needles",
        default=None,
        help="optional comma-separated text needles to search across de-interleaved lanes",
    )
    parser.add_argument(
        "--anchor-byte",
        default=None,
        help="optional byte value; keep only printable runs that include this byte (example: 0x41)",
    )
    parser.add_argument(
        "--anchor-loose",
        action="store_true",
        help="when --anchor-byte is set, keep anchor-containing printable runs even if text heuristics reject them",
    )
    parser.add_argument("--json-out", type=Path, default=None, help="optional JSON report output path")
    parser.add_argument("--markdown-out", type=Path, default=None, help="optional Markdown report output path")
    return parser.parse_args()


def main() -> int:
    args = parse_args()
    banks = parse_bank_ranges(args.banks)
    strides = parse_strides(args.strides)
    needles = parse_needles(args.needles)
    anchor_byte = parse_optional_int(args.anchor_byte)

    rom_bytes = args.rom.read_bytes()
    all_candidates: list[dict[str, object]] = []
    needle_hits: list[dict[str, object]] = []

    for bank in banks:
        bank_data = read_bank(rom_bytes, bank)
        for stride in strides:
            all_candidates.extend(
                find_lane_runs(
                    bank_data,
                    bank,
                    stride,
                    args.min_length,
                    anchor_byte=anchor_byte,
                    anchor_loose=args.anchor_loose,
                )
            )
            if needles:
                needle_hits.extend(find_needle_hits(bank_data, bank, stride, needles))

    candidates = dedupe_candidates(all_candidates)
    summary = build_summary(candidates, args.per_bank_limit)
    report = {
        "rom": str(args.rom),
        "banks": banks,
        "strides": strides,
        "min_length": args.min_length,
        "needles": needles,
        "anchor_byte": anchor_byte,
        "anchor_loose": args.anchor_loose,
        "candidates": candidates,
        "needle_hits": needle_hits,
        "summary": summary,
    }

    if args.json_out:
        args.json_out.parent.mkdir(parents=True, exist_ok=True)
        args.json_out.write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8")

    if args.markdown_out:
        args.markdown_out.parent.mkdir(parents=True, exist_ok=True)
        write_markdown(args.markdown_out, summary, strides, args.min_length, banks, anchor_byte)

    for bank_row in summary["banks"]:
        print(f"bank={bank_row['bank_hex']} count={bank_row['count']}")
        for hit in bank_row["top_hits"]:
            print(
                f"  {hit['snes']} stride={hit['stride']} phase={hit['phase']} "
                f"len={hit['char_length']} end={hit['end_snes']} "
                f"anchors={hit['anchor_snes']} text={hit['text']}"
            )

    if args.json_out:
        print(f"json={args.json_out}")
    if args.markdown_out:
        print(f"markdown={args.markdown_out}")
    if needle_hits:
        print("needle_hits:")
        for hit in needle_hits:
            print(
                f"  {hit['snes']} stride={hit['stride']} phase={hit['phase']} "
                f"needle={hit['needle']} context={hit['context']}"
            )

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
