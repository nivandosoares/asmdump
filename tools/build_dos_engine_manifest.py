#!/usr/bin/env python3
"""Build an engine-oriented DOS TD2 manifest from the shipped data files."""

from __future__ import annotations

import argparse
import json
import re
from pathlib import Path


CAR_ROLE_SUFFIXES = ("", "O", "DASH", "REAR", "ROAD", "ST")
PACKED_EXTS = ("PES", "PCS")


def normalize_name(raw: str) -> str:
    return raw.replace("_", " ")


def parse_text_records(path: Path) -> list[str]:
    text = path.read_text(encoding="ascii", errors="ignore")
    lines = []
    for line in text.splitlines():
        line = line.replace("\x1a", "").strip()
        if line:
            lines.append(line)
    return lines


def parse_cars(path: Path) -> list[dict[str, object]]:
    out = []
    for line in parse_text_records(path):
        car_id, raw_name = line.split(maxsplit=1)
        out.append(
            {
                "id": car_id,
                "display_name_raw": raw_name,
                "display_name_runtime": normalize_name(raw_name),
            }
        )
    return out


def parse_scenes(path: Path) -> list[dict[str, object]]:
    out = []
    for line in parse_text_records(path):
        scene_id, raw_name, play_disk = line.split(maxsplit=2)
        out.append(
            {
                "id": scene_id,
                "display_name_raw": raw_name,
                "display_name_runtime": normalize_name(raw_name),
                "play_disk": int(play_disk),
            }
        )
    return out


def parse_select(path: Path) -> dict[str, object]:
    tokens = parse_text_records(path)[0].split()
    ints = [int(value) for value in tokens[:3]]
    ids = tokens[3:6]
    return {
        "selector_values": ints,
        "id_slots": ids,
    }


def parse_ss(path: Path) -> dict[str, object]:
    raw = path.read_text(encoding="ascii", errors="ignore").replace("\x1a", "").strip()
    match = re.match(r"^(\d+)\s+(\d+)\s+(\d+)\s+([A-Za-z0-9]+)$", raw)
    if not match:
        raise ValueError(f"unexpected SS format in {path}")
    count = int(match.group(1))
    param_1 = int(match.group(2))
    param_2 = int(match.group(3))
    stream = match.group(4)
    tokens = [stream[index:index + 4] for index in range(0, len(stream), 4) if stream[index:index + 4]]
    return {
        "count": count,
        "param_1": param_1,
        "param_2": param_2,
        "tokens": tokens,
    }


def u16_prefix(path: Path, count: int) -> list[int]:
    data = path.read_bytes()
    out = []
    for index in range(count):
        base = index * 2
        if base + 2 > len(data):
            break
        out.append(int.from_bytes(data[base:base + 2], "little"))
    return out


def collect_car_bundle(root: Path, record: dict[str, object]) -> dict[str, object]:
    stem = str(record["id"])
    ss = parse_ss(root / f"{stem}.SS")
    main_bin = root / f"{stem}.BIN"
    aux_bin = root / f"{stem}O.BIN"
    roles: dict[str, object] = {
        "logic_main": {
            "path": main_bin.name,
            "size": main_bin.stat().st_size,
            "u16_prefix": u16_prefix(main_bin, 8),
        },
        "logic_aux": {
            "path": aux_bin.name,
            "size": aux_bin.stat().st_size,
            "u16_prefix": u16_prefix(aux_bin, 8),
        },
        "layout_descriptor": {
            "path": f"{stem}.SS",
            "count": ss["count"],
            "param_1": ss["param_1"],
            "param_2": ss["param_2"],
            "tokens": ss["tokens"],
        },
    }
    for suffix in CAR_ROLE_SUFFIXES[2:]:
        role_name = suffix.lower()
        role = {}
        for ext in PACKED_EXTS:
            p = root / f"{stem}{suffix}.{ext}"
            role[ext.lower()] = {"path": p.name, "size": p.stat().st_size}
        roles[f"visual_{role_name}"] = role
    return {
        "id": stem,
        "display_name": record["display_name_runtime"],
        "bundle_roles": roles,
        "preview_contract": {
            "layout_descriptor": f"{stem}.SS",
            "measured_packed_asset": f"{stem}ST.PES",
        },
    }


def collect_scenery_assets(root: Path) -> list[dict[str, object]]:
    groups: dict[str, dict[str, object]] = {}
    for path in sorted(root.iterdir()):
        if not path.is_file():
            continue
        name = path.name.upper()
        if name.endswith((".DAT", ".SGN", ".FNT", ".PCS", ".PES")):
            stem = path.stem.upper()
            prefix = re.match(r"^[A-Z0-9]+", stem)
            if not prefix:
                continue
            key = prefix.group(0)
            groups.setdefault(key, {"stem": key, "files": []})
            groups[key]["files"].append({"path": path.name, "size": path.stat().st_size})
    return [groups[key] for key in sorted(groups)]


def build_manifest(root: Path) -> dict[str, object]:
    cars = parse_cars(root / "CARS.DAT")
    scenes = parse_scenes(root / "SCENES.DAT")
    selection = parse_select(root / "SELECT.DAT")
    car_bundles = [collect_car_bundle(root, car) for car in cars]
    scenery_assets = collect_scenery_assets(root)

    return {
        "version": 1,
        "created": "2026-04-09",
        "scope": "Engine-oriented DOS TD2 manifest for reimplementation and modding.",
        "data_root": str(root),
        "engine_modules": [
            {
                "name": "selection_state",
                "surface": "selector vector rooted at 0x8a1c plus persisted select.dat subset",
            },
            {
                "name": "car_catalog",
                "surface": "cars.dat records plus same-stem logic/layout/visual bundles",
            },
            {
                "name": "scene_catalog",
                "surface": "scenes.dat records plus play_disk routing and scenery asset groups",
            },
            {
                "name": "preview_materializer",
                "surface": "same-stem *.SS plus *ST.PES pairing",
            },
            {
                "name": "play_session_gate",
                "surface": "requires non-empty car and scenery catalogs before play-disk assembly",
            },
        ],
        "selection_bootstrap": selection,
        "car_catalog": cars,
        "scene_catalog": scenes,
        "car_bundles": car_bundles,
        "scenery_asset_groups": scenery_assets,
        "porting_notes": {
            "catalogs_are_platform_specific": True,
            "shared_id_assumption": "Do not assume 1:1 SNES/DOS car or scenery rosters; bind gameplay and assets per-platform.",
            "verified_common_runtime_rule": "The DOS engine binds logic blobs, layout descriptors, and multiple visual roles from one car ID stem.",
        },
    }


def render_markdown(payload: dict[str, object]) -> str:
    lines = [
        "# DOS Engine Manifest",
        "",
        f"- created: `{payload['created']}`",
        f"- data root: `{payload['data_root']}`",
        "",
        "## Engine modules",
        "",
    ]
    for item in payload["engine_modules"]:
        lines.append(f"- `{item['name']}`: {item['surface']}")
    lines.extend(["", "## Selection bootstrap", ""])
    lines.append(f"- selector values: `{payload['selection_bootstrap']['selector_values']}`")
    lines.append(f"- id slots: `{payload['selection_bootstrap']['id_slots']}`")
    lines.extend(["", "## Cars", ""])
    for item in payload["car_catalog"]:
        lines.append(f"- `{item['id']}`: `{item['display_name_runtime']}`")
    lines.extend(["", "## Scenes", ""])
    for item in payload["scene_catalog"]:
        lines.append(f"- `{item['id']}`: `{item['display_name_runtime']}` play disk `{item['play_disk']}`")
    lines.extend(
        [
            "",
            "## Practical read",
            "",
            "- Treat DOS car and scenery catalogs as the engine source of truth, not as renderer side effects.",
            "- Treat each car stem as one engine bundle with logic (`.BIN` / `O.BIN`), layout (`.SS`), and visual-role assets (`DASH/REAR/ROAD/ST`).",
            "- Treat preview composition as a materializer problem (`*.SS + *ST.PES`), not as one flat bitmap file.",
            "- Keep SNES and DOS rosters independent; only map entries across platforms when a direct content proof exists.",
        ]
    )
    return "\n".join(lines) + "\n"


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("data_dir", type=Path)
    parser.add_argument("--json-out", type=Path, required=True)
    parser.add_argument("--markdown-out", type=Path)
    args = parser.parse_args()

    payload = build_manifest(args.data_dir)
    args.json_out.parent.mkdir(parents=True, exist_ok=True)
    args.json_out.write_text(json.dumps(payload, indent=2) + "\n", encoding="utf-8")
    if args.markdown_out:
        args.markdown_out.parent.mkdir(parents=True, exist_ok=True)
        args.markdown_out.write_text(render_markdown(payload), encoding="utf-8")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
