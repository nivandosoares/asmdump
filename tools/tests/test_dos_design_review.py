from __future__ import annotations

import subprocess
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
TOOLS = ROOT / "tools"
DOS_DIR = ROOT.parent / "Downloads" / "testdrive2"


def test_build_dos_design_review_smoke(tmp_path: Path) -> None:
    manifest_json = tmp_path / "dos_engine_manifest.json"
    html_out = tmp_path / "dos_design_review.html"
    md_out = tmp_path / "dos_design_review.md"
    subprocess.run(
        [
            sys.executable,
            str(TOOLS / "build_dos_engine_manifest.py"),
            str(DOS_DIR),
            "--json-out",
            str(manifest_json),
        ],
        check=True,
    )
    subprocess.run(
        [
            sys.executable,
            str(TOOLS / "build_dos_design_review.py"),
            "--manifest-json",
            str(manifest_json),
            "--html-out",
            str(html_out),
            "--markdown-out",
            str(md_out),
        ],
        check=True,
    )
    html_text = html_out.read_text(encoding="utf-8")
    md_text = md_out.read_text(encoding="utf-8")
    assert "DOS Engine Review Surface" in html_text
    assert "Porsche 959" in html_text
    assert "Play Disk" in html_text
    assert "P959" in md_text
