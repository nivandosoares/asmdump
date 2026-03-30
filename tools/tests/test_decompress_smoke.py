#!/usr/bin/env python3
"""Smoke tests for TD2 decompressor.

Runs a small set of CLI decompressions against the repo ROM and asserts
JSON summaries are produced and contain a "format" field.

Run from repo root: python3 tools/tests/test_decompress_smoke.py
"""
from pathlib import Path
import subprocess
import json
import sys

ROM = Path("game.smc")
OUT_DIR = Path("tools/out/smoke")
OUT_DIR.mkdir(parents=True, exist_ok=True)

# Expanded sample set: include unresolved P0/P1 candidates for bank30
SAMPLES = [
    {"bank": 30, "addr": 0x9681, "name": "42fb_9681"},
    {"bank": 30, "addr": 0xDA96, "name": "67fb_da96"},
    {"bank": 30, "addr": 0xEE7F, "name": "26fb_ee7f"},
]

failures = []
for s in SAMPLES:
    out_bin = OUT_DIR / f"{s['name']}.bin"
    out_json = OUT_DIR / f"{s['name']}.json"
    cmd = [
        sys.executable,
        "tools/decompress_td2_chunk.py",
        str(ROM),
        str(out_bin),
        "--bank",
        str(s["bank"]),
        "--addr",
        hex(s["addr"]),
        "--json-out",
        str(out_json),
    ]
    print("RUN:", " ".join(cmd))
    try:
        subprocess.run(cmd, check=True)
    except subprocess.CalledProcessError as e:
        failures.append((s, f"cli-failed: {e}"))
        continue
    if not out_json.exists():
        failures.append((s, "missing json output"))
        continue
    try:
        data = json.loads(out_json.read_text(encoding="utf-8"))
    except Exception as e:
        failures.append((s, f"bad json: {e}"))
        continue
    if "format" not in data:
        failures.append((s, "json missing 'format' field"))

if failures:
    print("SMOKE FAILURES:")
    for s, msg in failures:
        print(s, msg)
    raise SystemExit(1)

print("SMOKE OK: all samples decompressed and produced JSON summary")
