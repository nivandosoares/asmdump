from __future__ import annotations

import json
import subprocess
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
TOOLS = ROOT / "tools"
DOS_DIR = ROOT.parent / "Downloads" / "testdrive2"


def test_build_dos_preview_manifest_smoke(tmp_path: Path) -> None:
    contracts_json = tmp_path / "dos_contracts.json"
    engine_json = tmp_path / "dos_engine_manifest.json"
    preview_json = tmp_path / "dos_preview_manifest.json"
    preview_md = tmp_path / "dos_preview_manifest.md"

    subprocess.run(
        [
            sys.executable,
            str(TOOLS / "extract_dos_contracts.py"),
            str(DOS_DIR),
            "--json-out",
            str(contracts_json),
        ],
        check=True,
    )
    subprocess.run(
        [
            sys.executable,
            str(TOOLS / "build_dos_engine_manifest.py"),
            str(DOS_DIR),
            "--json-out",
            str(engine_json),
        ],
        check=True,
    )
    subprocess.run(
        [
            sys.executable,
            str(TOOLS / "build_dos_preview_manifest.py"),
            "--engine-manifest",
            str(engine_json),
            "--contracts-json",
            str(contracts_json),
            "--json-out",
            str(preview_json),
            "--markdown-out",
            str(preview_md),
        ],
        check=True,
    )
    payload = json.loads(preview_json.read_text(encoding="utf-8"))
    assert payload["bootstrap_selection"]["primary_car_id"] == "P959"
    assert payload["bootstrap_selection"]["secondary_car_id"] == "ROSS"
    assert len(payload["preview_entries"]) == 7
    p959 = next(item for item in payload["preview_entries"] if item["car_id"] == "P959")
    assert p959["layout_pattern"] == "window_only_tokens"
    f40 = next(item for item in payload["preview_entries"] if item["car_id"] == "F40")
    assert f40["layout_pattern"] == "window_plus_face_tokens"
    assert preview_md.exists()
