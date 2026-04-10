from __future__ import annotations

import json
import subprocess
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
TOOLS = ROOT / "tools"
DOS_DIR = ROOT.parent / "Downloads" / "testdrive2"


def test_build_dos_decoder_boundary_contract_smoke(tmp_path: Path) -> None:
    contracts_json = tmp_path / "dos_contracts.json"
    engine_json = tmp_path / "dos_engine_manifest.json"
    preview_json = tmp_path / "dos_preview_manifest.json"
    boundary_json = tmp_path / "dos_decoder_boundary_contract.json"
    boundary_md = tmp_path / "dos_decoder_boundary_contract.md"

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
            str(TOOLS / "build_dos_decoder_boundary_contract.py"),
            "--preview-manifest",
            str(preview_json),
            "--data-dir",
            str(DOS_DIR),
            "--json-out",
            str(boundary_json),
            "--markdown-out",
            str(boundary_md),
        ],
        check=True,
    )

    payload = json.loads(boundary_json.read_text(encoding="utf-8"))
    assert payload["front_window_bytes"] == 256
    assert payload["recommended_pair"]["left_car_id"] == "P959"
    assert payload["recommended_pair"]["right_car_id"] == "ROSS"
    p959 = next(item for item in payload["entries"] if item["car_id"] == "P959")
    assert p959["front_longest_strict_run"] == 64
    ross = next(item for item in payload["entries"] if item["car_id"] == "ROSS")
    assert ross["tail_longest_strict_run"] == 5
    assert ross["preceding_longest_strict_run"] == 6
    assert boundary_md.exists()
