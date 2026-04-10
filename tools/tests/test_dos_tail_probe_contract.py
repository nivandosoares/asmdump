from __future__ import annotations

import json
import subprocess
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
TOOLS = ROOT / "tools"
DOS_DIR = ROOT.parent / "Downloads" / "testdrive2"


def test_build_dos_tail_probe_contract_smoke(tmp_path: Path) -> None:
    contracts_json = tmp_path / "dos_contracts.json"
    engine_json = tmp_path / "dos_engine_manifest.json"
    preview_json = tmp_path / "dos_preview_manifest.json"
    tail_json = tmp_path / "dos_tail_probe_contract.json"
    tail_md = tmp_path / "dos_tail_probe_contract.md"

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
            str(TOOLS / "build_dos_tail_probe_contract.py"),
            "--preview-manifest",
            str(preview_json),
            "--data-dir",
            str(DOS_DIR),
            "--json-out",
            str(tail_json),
            "--markdown-out",
            str(tail_md),
        ],
        check=True,
    )

    payload = json.loads(tail_json.read_text(encoding="utf-8"))
    assert payload["tail_boundary"] == 12288
    assert payload["recommended_pair"]["left_car_id"] == "P959"
    assert payload["recommended_pair"]["right_car_id"] == "ROSS"
    assert payload["recommended_pair"]["shared_layout_pattern"] is True
    assert payload["recommended_pair"]["shared_layout_params"] is True
    ross = next(item for item in payload["four_page_tail_entries"] if item["car_id"] == "ROSS")
    assert ross["tail_bytes"] == 810
    assert ross["boundary_common_prefix_bytes"] == 0
    assert tail_md.exists()
