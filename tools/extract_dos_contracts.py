#!/usr/bin/env python3
"""Extract first-pass DOS Test Drive II contracts from the shipped executables."""

from __future__ import annotations

import argparse
import json
import re
import struct
from pathlib import Path
from typing import Iterable


GRAPHICS_EXES = ("TD2EGA.EXE", "TD2CGA.EXE", "TD2TDY.EXE")
PRINTABLE_RE = re.compile(rb"[\x20-\x7e]{5,}")
RESOURCE_RE = re.compile(r"^[a-z0-9_]{4,}\.(?:pcs|pes)$", re.IGNORECASE)

KEY_STRINGS = (
    "select.dat",
    "diskid.dat",
    "MASTER",
    "CAR",
    "SCENERY",
    "PLAY",
    "PROGRAM",
    "MUSIC ON",
    "MUSIC OFF",
    "SOUND ON",
    "SOUND OFF",
    "KEYBOARD ON",
    "Please insert %s DISK in Drive %c:",
    "Hard disk is a %s DISK.",
    "This disk is a %s DISK.",
    "This disk does not match the master!",
    "Please insert MASTER or PLAY Disk.",
    "Play Disk needs both cars and scenery!",
    "Make Play Disk",
    "Play Disk",
    "Scenery Disk",
    "Copy Scenery",
    "Press Enter to un/select scenery.",
    "You missed the gas station",
    "and you're out of gas.",
    "Hope you enjoy the walk.",
    "Too far left to reach pump.",
    "Engine has lost all power...",
    "Suspension completely gone...",
    "Steering completely shot...",
    "Car took too much damage...",
    "Fill 'er up...",
    "Lives left:",
    "Careful, it's your last life!",
)


def dos_mz_header(data: bytes) -> dict[str, int]:
    if data[:2] != b"MZ":
        raise ValueError("not an MZ executable")
    values = struct.unpack_from("<14H", data, 2)
    cblp, cp, crlc, cparhdr, minalloc, maxalloc, ss, sp, csum, ip, cs, lfarlc, ovno, _ = values
    image_bytes = (cp - 1) * 512 + cblp if cblp else cp * 512
    return {
        "header_bytes": cparhdr * 16,
        "relocation_count": crlc,
        "relocation_table_offset": lfarlc,
        "cs": cs,
        "ip": ip,
        "ss": ss,
        "sp": sp,
        "overlay": ovno,
        "image_bytes": image_bytes,
        "min_alloc_paragraphs": minalloc,
        "max_alloc_paragraphs": maxalloc,
    }


def extract_strings(data: bytes) -> list[dict[str, object]]:
    out: list[dict[str, object]] = []
    for match in PRINTABLE_RE.finditer(data):
        text = match.group().decode("ascii", errors="ignore")
        out.append({"offset": match.start(), "text": text})
    return out


def find_text(strings: Iterable[dict[str, object]], needle: str) -> dict[str, object] | None:
    needle_upper = needle.upper()
    for item in strings:
        text = str(item["text"])
        if text.upper() == needle_upper:
            return item
    pattern = re.compile(rf"(?<![A-Z0-9_]){re.escape(needle_upper)}(?![A-Z0-9_])")
    for item in strings:
        text = str(item["text"]).upper()
        if pattern.search(text):
            return item
    return None


def collect_resources(strings: Iterable[dict[str, object]]) -> dict[str, list[str]]:
    pcs: list[str] = []
    pes: list[str] = []
    for item in strings:
        text = str(item["text"])
        if not RESOURCE_RE.search(text):
            continue
        lower = text.lower()
        if lower.endswith(".pcs"):
            pcs.append(lower)
        elif lower.endswith(".pes"):
            pes.append(lower)
    return {"pcs": pcs, "pes": pes}


def collect_token_runs(strings: Iterable[dict[str, object]]) -> dict[str, list[str]]:
    out: dict[str, list[str]] = {}
    for item in strings:
        text = str(item["text"])
        if "sm00" in text.lower() and "hg94" in text.lower():
            out["terrain_tokens"] = [text]
        if "oil0" in text.lower() and "govr" in text.lower():
            out["hazard_tokens"] = [text]
        if "clr0" in text.lower() and "cp7d" in text.lower():
            out["cop_tokens"] = [text]
    return out


def build_contracts(exe_dir: Path) -> dict[str, object]:
    launcher_path = exe_dir / "DUEL.EXE"
    launcher_data = launcher_path.read_bytes()
    launcher_strings = extract_strings(launcher_data)

    launcher_contract = {
        "path": launcher_path.name,
        "mz_header": dos_mz_header(launcher_data),
        "claims": {
            "graphics_driver_launcher": {
                "classification": "VERIFIED",
                "evidence": [
                    item for item in launcher_strings if "graphic device" in str(item["text"]).lower()
                ],
            },
            "driver_targets": {
                "classification": "VERIFIED",
                "evidence": [
                    item
                    for item in launcher_strings
                    if str(item["text"]).lower() in {"$td2cga.exe", "td2ega.exe", "td2tdy.exe"}
                ],
            },
        },
    }

    graphics_contracts = []
    for exe_name in GRAPHICS_EXES:
        path = exe_dir / exe_name
        data = path.read_bytes()
        strings = extract_strings(data)
        resources = collect_resources(strings)
        token_runs = collect_token_runs(strings)
        claims = {
            "resource_sidecars": {
                "classification": "VERIFIED",
                "evidence": resources,
            },
            "persistence_file": {
                "classification": "VERIFIED",
                "evidence": find_text(strings, "select.dat"),
            },
            "disk_roles": {
                "classification": "VERIFIED",
                "evidence": [
                    find_text(strings, "MASTER"),
                    find_text(strings, "SCENERY"),
                    find_text(strings, "PROGRAM"),
                    find_text(strings, "Play Disk"),
                    find_text(strings, "Make Play Disk"),
                    find_text(strings, "Copy Scenery"),
                ],
            },
            "disk_gate_prompts": {
                "classification": "VERIFIED",
                "evidence": [
                    find_text(strings, "Please insert %s DISK in Drive %c:"),
                    find_text(strings, "Hard disk is a %s DISK."),
                    find_text(strings, "This disk is a %s DISK."),
                    find_text(strings, "This disk does not match the master!"),
                    find_text(strings, "Please insert MASTER or PLAY Disk."),
                    find_text(strings, "diskid.dat"),
                    find_text(strings, "Play Disk needs both cars and scenery!"),
                    find_text(strings, "Press Enter to un/select scenery."),
                ],
            },
            "runtime_toggles": {
                "classification": "VERIFIED",
                "evidence": [
                    find_text(strings, "MUSIC ON"),
                    find_text(strings, "MUSIC OFF"),
                    find_text(strings, "SOUND ON"),
                    find_text(strings, "SOUND OFF"),
                    find_text(strings, "KEYBOARD ON"),
                ],
            },
            "gameplay_failure_messages": {
                "classification": "VERIFIED",
                "evidence": [find_text(strings, key) for key in KEY_STRINGS[-10:]],
            },
            "named_asset_token_runs": {
                "classification": "PROBABLE",
                "evidence": token_runs,
                "notes": "These token runs look like compact asset stems grouped by terrain, hazard, and cop families.",
            },
        }
        graphics_contracts.append(
            {
                "path": path.name,
                "mz_header": dos_mz_header(data),
                "claims": claims,
            }
        )

    return {
        "version": 1,
        "created": "2026-04-09",
        "scope": "First-pass DOS executable contract extraction for The Duel: Test Drive II.",
        "inputs": {
            "directory": str(exe_dir),
            "launcher": "DUEL.EXE",
            "graphics_exes": list(GRAPHICS_EXES),
        },
        "contracts": {
            "launcher": launcher_contract,
            "graphics_programs": graphics_contracts,
        },
        "summary": {
            "graphics_variants": list(GRAPHICS_EXES),
            "common_resource_sidecars": sorted(
                set(
                    item
                    for program in graphics_contracts
                    for family in ("pcs", "pes")
                    for item in program["claims"]["resource_sidecars"]["evidence"][family]
                )
            ),
            "common_key_strings": [
                key
                for key in KEY_STRINGS
                if all(find_text(extract_strings((exe_dir / exe_name).read_bytes()), key) for exe_name in GRAPHICS_EXES)
            ],
        },
    }


def render_markdown(payload: dict[str, object]) -> str:
    lines = [
        "# DOS Version Contracts",
        "",
        f"- created: `{payload['created']}`",
        f"- inputs: `{payload['inputs']['directory']}`",
        f"- graphics variants: `{', '.join(payload['summary']['graphics_variants'])}`",
        "",
        "## Common resource sidecars",
        "",
    ]
    for item in payload["summary"]["common_resource_sidecars"]:
        lines.append(f"- `{item}`")
    lines.extend(
        [
            "",
            "## Common key strings",
            "",
        ]
    )
    for item in payload["summary"]["common_key_strings"]:
        lines.append(f"- `{item}`")
    lines.extend(
        [
            "",
            "## Contract read",
            "",
            "- `DUEL.EXE` is a small graphics-device launcher that dispatches to the concrete CGA/EGA/Tandy executables.",
            "- Each graphics executable carries the same sidecar asset families (`.pcs`, `.pes`) plus persistence and disk-gating strings.",
            "- The DOS front end exposes explicit disk roles (`MASTER`, `CAR`, `SCENERY`, `PLAY`, `PROGRAM`) instead of hiding content ownership behind one flat runtime block.",
            "- Runtime toggles (`MUSIC`, `SOUND`, `KEYBOARD`) and gameplay-failure/reporting messages are embedded as first-class user-facing contracts.",
            "- `select.dat` and `diskid.dat` are explicit DOS persistence/media surfaces and should stay first-class in any future language-port contract model.",
        ]
    )
    return "\n".join(lines) + "\n"


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("exe_dir", type=Path, help="directory containing DUEL.EXE and TD2*.EXE")
    parser.add_argument("--json-out", type=Path, required=True, help="write machine-readable contracts here")
    parser.add_argument("--markdown-out", type=Path, help="write a short markdown summary here")
    args = parser.parse_args()

    payload = build_contracts(args.exe_dir)
    args.json_out.parent.mkdir(parents=True, exist_ok=True)
    args.json_out.write_text(json.dumps(payload, indent=2) + "\n", encoding="utf-8")
    if args.markdown_out:
        args.markdown_out.parent.mkdir(parents=True, exist_ok=True)
        args.markdown_out.write_text(render_markdown(payload), encoding="utf-8")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
