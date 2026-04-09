from __future__ import annotations

import json
import subprocess
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
TOOLS = ROOT / "tools"
DOS_DIR = ROOT.parent / "Downloads" / "testdrive2"


def test_build_dos_engine_manifest_smoke(tmp_path: Path) -> None:
    json_out = tmp_path / "dos_engine_manifest.json"
    md_out = tmp_path / "dos_engine_manifest.md"
    subprocess.run(
        [
            sys.executable,
            str(TOOLS / "build_dos_engine_manifest.py"),
            str(DOS_DIR),
            "--json-out",
            str(json_out),
            "--markdown-out",
            str(md_out),
        ],
        check=True,
    )
    payload = json.loads(json_out.read_text(encoding="utf-8"))
    assert payload["selection_bootstrap"]["id_slots"] == ["P959", "ROSS", "CCC"]
    assert len(payload["car_catalog"]) == 7
    assert len(payload["scene_catalog"]) == 2
    assert payload["car_bundles"][-1]["id"] == "P959"
    assert payload["car_bundles"][-1]["preview_contract"]["measured_packed_asset"] == "P959ST.PES"
    assert payload["porting_notes"]["catalogs_are_platform_specific"] is True
    assert md_out.exists()
