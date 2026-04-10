from __future__ import annotations

import json
import subprocess
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
TOOLS = ROOT / "tools"
DOS_DIR = ROOT.parent / "Downloads" / "testdrive2"


def test_build_dos_frontpage_contract_smoke(tmp_path: Path) -> None:
    contracts_json = tmp_path / "dos_contracts.json"
    engine_json = tmp_path / "dos_engine_manifest.json"
    preview_json = tmp_path / "dos_preview_manifest.json"
    frontpage_json = tmp_path / "dos_frontpage_contract.json"
    frontpage_md = tmp_path / "dos_frontpage_contract.md"

    subprocess.run(
        [sys.executable, str(TOOLS / "extract_dos_contracts.py"), str(DOS_DIR), "--json-out", str(contracts_json)],
        check=True,
    )
    subprocess.run(
        [sys.executable, str(TOOLS / "build_dos_engine_manifest.py"), str(DOS_DIR), "--json-out", str(engine_json)],
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
        ],
        check=True,
    )
    subprocess.run(
        [
            sys.executable,
            str(TOOLS / "build_dos_frontpage_contract.py"),
            "--preview-manifest",
            str(preview_json),
            "--data-dir",
            str(DOS_DIR),
            "--json-out",
            str(frontpage_json),
            "--markdown-out",
            str(frontpage_md),
        ],
        check=True,
    )
    payload = json.loads(frontpage_json.read_text(encoding="utf-8"))
    assert payload["header_bytes"] == 64
    assert any(item["offset"] == 0 and item["values"] == [130] for item in payload["stable_offsets"])
    ross = next(item for item in payload["entries"] if item["id"] == "ROSS")
    assert ross["field_window"]["offset_8"] == 14
    assert frontpage_md.exists()
