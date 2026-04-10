from __future__ import annotations

import json
import subprocess
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
TOOLS = ROOT / "tools"
DOS_DIR = ROOT.parent / "Downloads" / "testdrive2"


def test_build_dos_asset_review_pngs_smoke(tmp_path: Path) -> None:
    contracts_json = tmp_path / "dos_contracts.json"
    engine_json = tmp_path / "dos_engine_manifest.json"
    preview_json = tmp_path / "dos_preview_manifest.json"
    probe_json = tmp_path / "dos_probe_contract.json"
    review_json = tmp_path / "dos_asset_review.json"
    out_dir = tmp_path / "review_pngs"

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
        ],
        check=True,
    )
    subprocess.run(
        [
            sys.executable,
            str(TOOLS / "build_dos_asset_review_pngs.py"),
            "--preview-manifest",
            str(preview_json),
            "--probe-contract",
            str(probe_json),
            "--out-dir",
            str(out_dir),
            "--json-out",
            str(review_json),
        ],
        check=True,
    )

    payload = json.loads(review_json.read_text(encoding="utf-8"))
    assert payload["overview_png"] == "dos_asset_review_overview.png"
    assert len(payload["boards"]) == 7
    assert (out_dir / payload["overview_png"]).exists()
    assert (out_dir / payload["gallery_html"]).exists()
    assert (out_dir / "ross_review_board.png").exists()
