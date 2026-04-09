from __future__ import annotations

import json
import subprocess
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
TOOLS = ROOT / "tools"
DOS_DIR = ROOT.parent / "Downloads" / "testdrive2"


def test_extract_dos_contracts_smoke(tmp_path: Path) -> None:
    json_out = tmp_path / "dos_contracts.json"
    md_out = tmp_path / "dos_contracts.md"
    subprocess.run(
        [
            sys.executable,
            str(TOOLS / "extract_dos_contracts.py"),
            str(DOS_DIR),
            "--json-out",
            str(json_out),
            "--markdown-out",
            str(md_out),
        ],
        check=True,
    )
    payload = json.loads(json_out.read_text(encoding="utf-8"))
    assert payload["contracts"]["launcher"]["claims"]["graphics_driver_launcher"]["classification"] == "VERIFIED"
    assert "select.dat" in payload["summary"]["common_key_strings"]
    assert "testdrv2.pcs" in payload["summary"]["common_resource_sidecars"]
    assert md_out.exists()


def test_dos_frontend_port_gate_script(tmp_path: Path) -> None:
    contract_json = tmp_path / "dos_contracts.json"
    replay_json = tmp_path / "dos_frontend_replay.json"
    subprocess.run(
        [
            sys.executable,
            str(TOOLS / "extract_dos_contracts.py"),
            str(DOS_DIR),
            "--json-out",
            str(contract_json),
        ],
        check=True,
    )
    subprocess.run(
        [
            sys.executable,
            str(TOOLS / "dos_frontend_port.py"),
            "--contract-json",
            str(contract_json),
            "--script",
            "right_car,right_scenery,drop_scenery_catalog",
            "--json-out",
            str(replay_json),
        ],
        check=True,
    )
    payload = json.loads(replay_json.read_text(encoding="utf-8"))
    assert payload["final_state"]["selected_car_id"] == "lamborghini_diablo"
    assert payload["final_state"]["selected_scenery_id"] == "city_bound"
    assert payload["final_play_gate"]["ready"] is False
    assert payload["final_play_gate"]["missing_catalogs"] == ["scenery"]
