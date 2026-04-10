from __future__ import annotations

import json
import subprocess
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
TOOLS = ROOT / "tools"
DOS_DIR = ROOT.parent / "Downloads" / "testdrive2"


def test_build_dos_preview_codepath_smoke(tmp_path: Path) -> None:
    contracts_json = tmp_path / "dos_contracts.json"
    engine_json = tmp_path / "dos_engine_manifest.json"
    preview_json = tmp_path / "dos_preview_manifest.json"
    codepath_json = tmp_path / "dos_preview_codepath.json"
    codepath_md = tmp_path / "dos_preview_codepath.md"

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
            str(TOOLS / "build_dos_preview_codepath.py"),
            "--engine-manifest",
            str(engine_json),
            "--preview-manifest",
            str(preview_json),
            "--runtime-trace",
            str(DOS_DIR / "runtime_trace.json"),
            "--host-io",
            str(DOS_DIR / "host_io_measurements.json"),
            "--json-out",
            str(codepath_json),
            "--markdown-out",
            str(codepath_md),
        ],
        check=True,
    )
    payload = json.loads(codepath_json.read_text(encoding="utf-8"))
    assert payload["handler_chain"]["car_selection_handler"]["entry"] == "0x57fb"
    assert payload["preview_bundle_contract"]["bootstrap_primary"]["car_id"] == "P959"
    assert payload["preview_bundle_contract"]["bootstrap_secondary"]["car_id"] == "ROSS"
    assert "ROSSST.PES" in payload["measured_preview_files"]["host_probe_patterns"]
    assert codepath_md.exists()
