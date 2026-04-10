from __future__ import annotations

import json
import subprocess
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
TOOLS = ROOT / "tools"
DOS_DIR = ROOT.parent / "Downloads" / "testdrive2"


def test_build_dos_packed_asset_manifest_smoke(tmp_path: Path) -> None:
    contracts_json = tmp_path / "dos_contracts.json"
    engine_json = tmp_path / "dos_engine_manifest.json"
    preview_json = tmp_path / "dos_preview_manifest.json"
    packed_json = tmp_path / "dos_packed_assets.json"
    packed_md = tmp_path / "dos_packed_assets.md"

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
            str(TOOLS / "build_dos_packed_asset_manifest.py"),
            "--preview-manifest",
            str(preview_json),
            "--host-io",
            str(DOS_DIR / "host_io_measurements.json"),
            "--data-dir",
            str(DOS_DIR),
            "--json-out",
            str(packed_json),
            "--markdown-out",
            str(packed_md),
        ],
        check=True,
    )
    payload = json.loads(packed_json.read_text(encoding="utf-8"))
    assert payload["shared_contract"]["signature_byte"] == "0x82"
    assert len(payload["entries"]) == 7
    ross = next(item for item in payload["entries"] if item["car_id"] == "ROSS")
    assert ross["pes"]["path"] == "ROSSST.PES"
    assert ross["pes"]["measured_probe"]["events"]
    assert packed_md.exists()
