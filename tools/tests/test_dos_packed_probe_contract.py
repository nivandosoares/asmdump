from __future__ import annotations

import json
import subprocess
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
TOOLS = ROOT / "tools"
DOS_DIR = ROOT.parent / "Downloads" / "testdrive2"


def test_build_dos_packed_probe_contract_smoke(tmp_path: Path) -> None:
    contracts_json = tmp_path / "dos_contracts.json"
    engine_json = tmp_path / "dos_engine_manifest.json"
    preview_json = tmp_path / "dos_preview_manifest.json"
    probe_json = tmp_path / "dos_packed_probe_contract.json"
    probe_md = tmp_path / "dos_packed_probe_contract.md"

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
            str(TOOLS / "build_dos_packed_probe_contract.py"),
            "--preview-manifest",
            str(preview_json),
            "--host-io",
            str(DOS_DIR / "host_io_measurements.json"),
            "--data-dir",
            str(DOS_DIR),
            "--json-out",
            str(probe_json),
            "--markdown-out",
            str(probe_md),
        ],
        check=True,
    )

    payload = json.loads(probe_json.read_text(encoding="utf-8"))
    assert payload["page_size"] == 4096
    assert payload["tail_boundary"] == 12288
    ross = next(item for item in payload["entries"] if item["car_id"] == "ROSS")
    assert ross["classification"] == "four_page_tail_stream"
    assert ross["evidence"] == "VERIFIED"
    assert ross["tail_bytes"] == 810
    p959 = next(item for item in payload["entries"] if item["car_id"] == "P959")
    assert p959["classification"] == "three_page_stream"
    assert probe_md.exists()
