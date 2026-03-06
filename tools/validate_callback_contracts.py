#!/usr/bin/env python3
"""Validate callback/state checkpoints against probe JSON captures."""

from __future__ import annotations

import argparse
import json
import sys
from pathlib import Path
from typing import Any


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description=(
            "Validate machine-readable callback/state contracts against "
            "validation/mesen_probe_boot.lua frame snapshots."
        )
    )
    parser.add_argument("contracts_json", type=Path, help="Callback contracts JSON path.")
    parser.add_argument("probe_json", type=Path, help="Probe JSON with frames[].")
    parser.add_argument("--json-out", type=Path, default=None, help="Optional report JSON output path.")
    return parser.parse_args()


def as_int(value: Any) -> int:
    if isinstance(value, int):
        return value
    if isinstance(value, str):
        return int(value, 0)
    raise ValueError(f"unsupported integer value: {value!r}")


def parse_snes_pointer(raw: str) -> tuple[int, int]:
    bank_str, addr_str = raw.split(":", 1)
    return int(bank_str, 16), int(addr_str, 16)


def compare_expected(check: dict[str, Any], frame_row: dict[str, Any]) -> list[dict[str, Any]]:
    mismatches: list[dict[str, Any]] = []
    for key, expected in check.items():
        if key in {"frame", "note"}:
            continue

        if key == "active_main_callback":
            expected_bank, expected_addr = parse_snes_pointer(str(expected))
            actual_bank = as_int(frame_row.get("active_main_callback_bank"))
            actual_addr = as_int(frame_row.get("active_main_callback_addr"))
            if actual_bank != expected_bank or actual_addr != expected_addr:
                mismatches.append(
                    {
                        "field": key,
                        "expected": str(expected).upper(),
                        "actual": f"{actual_bank:02X}:{actual_addr:04X}",
                    }
                )
            continue

        if key == "active_nmi_callback":
            expected_bank, expected_addr = parse_snes_pointer(str(expected))
            actual_bank = as_int(frame_row.get("active_nmi_callback_bank"))
            actual_addr = as_int(frame_row.get("active_nmi_callback_addr"))
            if actual_bank != expected_bank or actual_addr != expected_addr:
                mismatches.append(
                    {
                        "field": key,
                        "expected": str(expected).upper(),
                        "actual": f"{actual_bank:02X}:{actual_addr:04X}",
                    }
                )
            continue

        if key == "active_irq_callback":
            expected_bank, expected_addr = parse_snes_pointer(str(expected))
            actual_bank = as_int(frame_row.get("active_irq_callback_bank"))
            actual_addr = as_int(frame_row.get("active_irq_callback_addr"))
            if actual_bank != expected_bank or actual_addr != expected_addr:
                mismatches.append(
                    {
                        "field": key,
                        "expected": str(expected).upper(),
                        "actual": f"{actual_bank:02X}:{actual_addr:04X}",
                    }
                )
            continue

        if key not in frame_row:
            mismatches.append({"field": key, "expected": expected, "actual": None, "reason": "missing-key"})
            continue

        expected_int = as_int(expected)
        actual_int = as_int(frame_row.get(key))
        if expected_int != actual_int:
            mismatches.append({"field": key, "expected": expected_int, "actual": actual_int})

    return mismatches


def evaluate_contracts(contracts_path: Path, probe_path: Path) -> dict[str, Any]:
    contracts_payload = json.loads(contracts_path.read_text(encoding="utf-8"))
    probe_payload = json.loads(probe_path.read_text(encoding="utf-8"))

    frames = probe_payload.get("frames", [])
    frame_map: dict[int, dict[str, Any]] = {}
    for row in frames:
        if not isinstance(row, dict):
            continue
        frame = row.get("frame")
        if frame is None:
            continue
        frame_map[int(frame)] = row

    contract_rows = contracts_payload.get("contracts", [])
    if not isinstance(contract_rows, list) or not contract_rows:
        raise ValueError("contracts JSON contains no contracts")

    contract_reports: list[dict[str, Any]] = []
    total_checks = 0
    total_failures = 0
    for contract in contract_rows:
        contract_id = str(contract.get("id", "unnamed"))
        checks = contract.get("checks", [])
        if not isinstance(checks, list):
            checks = []

        check_reports: list[dict[str, Any]] = []
        for check in checks:
            total_checks += 1
            frame = int(check["frame"])
            frame_row = frame_map.get(frame)
            if frame_row is None:
                total_failures += 1
                check_reports.append(
                    {
                        "frame": frame,
                        "passed": False,
                        "reason": "frame-not-found",
                    }
                )
                continue

            mismatches = compare_expected(check, frame_row)
            passed = len(mismatches) == 0
            if not passed:
                total_failures += 1
            check_reports.append(
                {
                    "frame": frame,
                    "passed": passed,
                    "mismatches": mismatches,
                    "note": check.get("note"),
                }
            )

        contract_reports.append(
            {
                "id": contract_id,
                "phase": contract.get("phase"),
                "total_checks": len(checks),
                "failed_checks": sum(1 for row in check_reports if not row["passed"]),
                "checks": check_reports,
            }
        )

    return {
        "contracts_json": str(contracts_path.resolve()),
        "probe_json": str(probe_path.resolve()),
        "probe_frame_count": len(frame_map),
        "total_checks": total_checks,
        "failed_checks": total_failures,
        "contracts": contract_reports,
    }


def print_summary(report: dict[str, Any]) -> None:
    print(f"contracts: {report['contracts_json']}")
    print(f"probe: {report['probe_json']}")
    print(
        f"checks: total={report['total_checks']} failed={report['failed_checks']} "
        f"passed={report['total_checks'] - report['failed_checks']}"
    )
    for contract in report["contracts"]:
        contract_id = contract["id"]
        failed = contract["failed_checks"]
        total = contract["total_checks"]
        status = "PASS" if failed == 0 else "FAIL"
        print(f"  {status} {contract_id}: {total - failed}/{total}")
        for check in contract["checks"]:
            if check["passed"]:
                continue
            frame = check["frame"]
            reason = check.get("reason")
            if reason:
                print(f"    frame {frame}: {reason}")
            else:
                print(f"    frame {frame}: {len(check['mismatches'])} mismatch(es)")


def main() -> int:
    args = parse_args()
    report = evaluate_contracts(args.contracts_json, args.probe_json)
    print_summary(report)

    if args.json_out is not None:
        args.json_out.parent.mkdir(parents=True, exist_ok=True)
        args.json_out.write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8")
        print(f"json: {args.json_out}")

    return 0 if report["failed_checks"] == 0 else 1


if __name__ == "__main__":
    try:
        raise SystemExit(main())
    except Exception as exc:  # pylint: disable=broad-except
        print(f"error: {exc}", file=sys.stderr)
        raise SystemExit(1)
