#!/usr/bin/env python3

from __future__ import annotations

import argparse
import json
from pathlib import Path

from build_boot_vram import load_rom_window


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description=(
            "Build a frame-oriented report for late-attract Mode 7 producer cycles "
            "by matching raw VMDATA bursts and DMA sources back to known ROM blobs."
        )
    )
    parser.add_argument("rom", type=Path, help="input ROM path")
    parser.add_argument("probe_json", type=Path, help="boot probe JSON with frame state")
    parser.add_argument("dma_writes_json", type=Path, help="raw DMA write trace JSON")
    parser.add_argument("vram_writes_json", type=Path, help="raw VRAM write trace JSON")
    parser.add_argument("output_json", type=Path, help="output JSON path")
    parser.add_argument(
        "--blob",
        action="append",
        default=[],
        metavar="LABEL:CPU_ADDR[:SIZE]",
        help=(
            "Known ROM blob to match against direct VMDATA bursts. "
            "Example: AA10:0x1AAA10:0x100"
        ),
    )
    parser.add_argument(
        "--markdown-out",
        type=Path,
        help="optional markdown summary output path",
    )
    return parser.parse_args()


def parse_int(value: str) -> int:
    return int(value, 0)


def parse_blob_spec(spec: str) -> dict[str, object]:
    parts = spec.split(":")
    if len(parts) not in (2, 3):
        raise ValueError(f"invalid blob spec {spec!r}")
    label = parts[0]
    cpu_addr = parse_int(parts[1])
    size = parse_int(parts[2]) if len(parts) == 3 else 0x100
    return {
        "label": label,
        "cpu_addr": cpu_addr,
        "size": size,
    }


def format_snes(bank: int | None, addr: int | None) -> str | None:
    if bank is None or addr is None:
        return None
    return f"{bank:02X}:{addr:04X}"


def ensure_parent(path: Path) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)


def load_blob_bytes(rom_bytes: bytes, spec: dict[str, object]) -> bytes:
    cpu_addr = int(spec["cpu_addr"])
    bank = (cpu_addr >> 16) & 0xFF
    bank_addr = cpu_addr & 0xFFFF
    window, _ = load_rom_window(rom_bytes, bank, bank_addr)
    size = int(spec["size"])
    blob = window[:size]
    if len(blob) != size:
        raise ValueError(
            f"blob {spec['label']} truncated at {bank:02X}:{bank_addr:04X}: "
            f"expected {size} bytes, got {len(blob)}"
        )
    return blob


def index_rows_by_frame(rows: list[dict]) -> dict[int, list[dict]]:
    indexed: dict[int, list[dict]] = {}
    for row in rows:
        indexed.setdefault(int(row["frame"]), []).append(row)
    return indexed


def first_value(rows: list[dict], register: str) -> int | None:
    for row in rows:
        if row.get("register") == register:
            return int(row["value"])
    return None


def collect_values(rows: list[dict], register: str) -> list[int]:
    return [int(row["value"]) for row in rows if row.get("register") == register]


def collapse_ranges(rows: list[dict], key: str) -> list[dict]:
    if not rows:
        return []
    ranges: list[dict] = []
    start = rows[0]["frame"]
    prev_frame = rows[0]["frame"]
    prev_value = rows[0].get(key)
    for row in rows[1:]:
        frame = row["frame"]
        value = row.get(key)
        if value != prev_value or frame != prev_frame + 1:
            ranges.append(
                {
                    "value": prev_value,
                    "startFrame": start,
                    "endFrame": prev_frame,
                }
            )
            start = frame
            prev_value = value
        prev_frame = frame
    ranges.append(
        {
            "value": prev_value,
            "startFrame": start,
            "endFrame": prev_frame,
        }
    )
    return ranges


def build_transition_rows(rows: list[dict]) -> list[dict]:
    transitions: list[dict] = []
    prev_signature: dict[str, object] | None = None
    prev_frame: int | None = None
    for row in rows:
        signature = {
            "state0204": row.get("state0204"),
            "dp0054Hex": row.get("dp0054Hex"),
            "burstState": "burst" if row.get("directByteCount") else "idle",
            "directBlobLabel": row.get("directBlobLabel"),
            "directVmaddHex": row.get("directVmaddHex"),
        }
        if prev_signature is None:
            changed_fields = list(signature.keys())
        else:
            changed_fields = [
                key for key, value in signature.items()
                if prev_signature.get(key) != value
            ]
        if not changed_fields:
            continue
        transitions.append(
            {
                "frame": row["frame"],
                "state0204": row.get("state0204"),
                "dp0054Hex": row.get("dp0054Hex"),
                "burstState": signature["burstState"],
                "directBlobLabel": row.get("directBlobLabel"),
                "directVmaddHex": row.get("directVmaddHex"),
                "changedFields": changed_fields,
                "framesSincePreviousTransition": (
                    None if prev_frame is None else row["frame"] - prev_frame
                ),
            }
        )
        prev_signature = signature
        prev_frame = row["frame"]
    return transitions


def build_state_value_map(
    rows: list[dict],
    state_key: str,
    value_key: str,
) -> dict[str, list[str]]:
    mapping: dict[str, set[str]] = {}
    for row in rows:
        state_value = row.get(state_key)
        value = row.get(value_key)
        if state_value is None or value is None:
            continue
        mapping.setdefault(str(state_value), set()).add(str(value))
    return {
        state: sorted(values)
        for state, values in sorted(mapping.items(), key=lambda item: int(item[0]))
    }


def render_markdown(report: dict) -> str:
    trace = report["traceWindow"]
    summary = report["summary"]
    lines = [
        f"# {report['title']}",
        "",
        "## Inputs",
        "",
        f"- `probeJson`: `{report['inputs']['probeJson']}`",
        f"- `dmaWritesJson`: `{report['inputs']['dmaWritesJson']}`",
        f"- `vramWritesJson`: `{report['inputs']['vramWritesJson']}`",
        f"- `rom`: `{report['inputs']['rom']}`",
        "",
        "## Trace Window",
        "",
        f"- frames: `{trace['startFrame']}`..`{trace['endFrame']}`",
        "",
        "## Summary",
        "",
        f"- transition frames: `{summary['transitionFrameCount']}` across "
        f"`{', '.join(str(frame) for frame in summary['transitionFrames']) or 'none'}`",
        f"- burst frames: `{summary['burstFrameCount']}` across "
        f"`{', '.join(str(frame) for frame in summary['burstFrames']) or 'none'}`",
        f"- distinct direct blob labels: `{', '.join(summary['distinctDirectBlobLabels']) or 'none'}`",
        f"- distinct DMA blob labels: `{', '.join(summary['distinctDmaBlobLabels']) or 'none'}`",
        f"- distinct VMADD targets: `{', '.join(summary['distinctVmaddTargets']) or 'none'}`",
        f"- frames with OAM DMA: `{', '.join(str(frame) for frame in summary['framesWithOamDma']) or 'none'}`",
        f"- `state0204 -> direct blobs` on burst frames: `{summary['state0204ToDirectBlobLabels']}`",
        f"- `state0204 -> VMADD` on burst frames: `{summary['state0204ToVmaddTargets']}`",
        "",
        "## Transition Rows",
        "",
        "| frame | state0204 | dp0054 | burst | direct blob | VMADD | changed |",
        "|---|---:|---:|---|---|---|---|",
    ]
    for row in report["transitionRows"]:
        lines.append(
            "| {frame} | {state0204} | {dp0054_hex} | {burst_state} | {direct_blob} | "
            "{vmadd_hex} | {changed} |".format(
                frame=row["frame"],
                state0204=row.get("state0204"),
                dp0054_hex=row.get("dp0054Hex"),
                burst_state=row.get("burstState"),
                direct_blob=row.get("directBlobLabel") or "None",
                vmadd_hex=row.get("directVmaddHex") or "None",
                changed=", ".join(row.get("changedFields") or []),
            )
        )
    lines.extend(
        [
            "",
            "## Burst Frames",
            "",
            "| frame | main | irq | state0204 | dp0054 | vmadd | direct blob | dma blob | oam dma |",
            "|---|---|---|---:|---:|---|---|---|---|",
        ]
    )
    for row in report["burstFrames"]:
        lines.append(
            "| {frame} | {main} | {irq} | {state0204} | {dp0054_hex} | {vmadd_hex} | "
            "{direct_blob} | {dma_blob} | {oam_dma} |".format(
                frame=row["frame"],
                main=row.get("mainCallbackSnes") or "None",
                irq=row.get("irqCallbackSnes") or "None",
                state0204=row.get("state0204"),
                dp0054_hex=row.get("dp0054Hex"),
                vmadd_hex=row.get("directVmaddHex") or "None",
                direct_blob=row.get("directBlobLabel") or "None",
                dma_blob=row.get("dmaBlobLabel") or "None",
                oam_dma="yes" if row.get("oamDmaSourceHex") else "no",
            )
        )
    lines.extend(
        [
            "",
            "## Ranges",
            "",
            f"- `state0204` on burst frames: `{summary['state0204Ranges']}`",
            f"- `dp0054` on burst frames: `{summary['dp0054Ranges']}`",
            f"- direct blob sequence: `{summary['directBlobRanges']}`",
            f"- VMADD target sequence: `{summary['vmaddRanges']}`",
        ]
    )
    return "\n".join(lines) + "\n"


def main() -> int:
    args = parse_args()
    if not args.blob:
        raise SystemExit("error: at least one --blob spec is required")

    rom_bytes = args.rom.read_bytes()
    probe_json = json.loads(args.probe_json.read_text(encoding="utf-8"))
    dma_json = json.loads(args.dma_writes_json.read_text(encoding="utf-8"))
    vram_json = json.loads(args.vram_writes_json.read_text(encoding="utf-8"))

    blob_specs = [parse_blob_spec(spec) for spec in args.blob]
    blob_bytes = {
        str(spec["label"]): load_blob_bytes(rom_bytes, spec)
        for spec in blob_specs
    }
    source_label_by_addr = {
        int(spec["cpu_addr"]): str(spec["label"])
        for spec in blob_specs
    }

    trace_start = (
        probe_json.get("trace_start_frame")
        or dma_json.get("trace_start_frame")
        or vram_json.get("trace_start_frame")
    )
    trace_end = (
        probe_json.get("trace_end_frame")
        or dma_json.get("trace_end_frame")
        or vram_json.get("trace_end_frame")
    )

    def frame_in_window(frame: int) -> bool:
        if trace_start is not None and frame < int(trace_start):
            return False
        if trace_end is not None and frame > int(trace_end):
            return False
        return True

    probe_frames = {
        int(row["frame"]): row
        for row in probe_json.get("frames", [])
        if frame_in_window(int(row["frame"]))
    }
    dma_by_frame = index_rows_by_frame(
        [row for row in dma_json.get("writes", []) if frame_in_window(int(row["frame"]))]
    )
    vram_by_frame = index_rows_by_frame(
        [row for row in vram_json.get("writes", []) if frame_in_window(int(row["frame"]))]
    )

    all_frames = sorted(set(probe_frames) | set(dma_by_frame) | set(vram_by_frame))
    rows: list[dict] = []
    burst_rows: list[dict] = []
    for frame in all_frames:
        probe_row = probe_frames.get(frame, {})
        dma_rows = dma_by_frame.get(frame, [])
        vram_rows = vram_by_frame.get(frame, [])

        direct_values: list[int] = []
        for row in vram_rows:
            register = row.get("register")
            if register in ("VMDATAL", "VMDATAH"):
                direct_values.append(int(row["value"]))

        direct_blob_label = None
        if direct_values:
            direct_bytes = bytes(direct_values)
            for label, blob in blob_bytes.items():
                if direct_bytes == blob:
                    direct_blob_label = label
                    break
        else:
            direct_bytes = b""

        vmadd_low = first_value(vram_rows, "VMADDL")
        vmadd_high = first_value(vram_rows, "VMADDH")
        direct_vmadd = None
        if vmadd_low is not None and vmadd_high is not None:
            direct_vmadd = (vmadd_high << 8) | vmadd_low

        dma_vram_src = None
        dma_vram_size = None
        if first_value(dma_rows, "A1T0L") is not None:
            a1t0l = int(first_value(dma_rows, "A1T0L"))
            a1t0h = int(first_value(dma_rows, "A1T0H"))
            a1b0 = int(first_value(dma_rows, "A1B0"))
            dma_vram_src = (a1b0 << 16) | (a1t0h << 8) | a1t0l
            das0l = int(first_value(dma_rows, "DAS0L") or 0)
            das0h = int(first_value(dma_rows, "DAS0H") or 0)
            dma_vram_size = (das0h << 8) | das0l

        oam_dma_src = None
        oam_dma_size = None
        if first_value(dma_rows, "A1T1L") is not None:
            a1t1l = int(first_value(dma_rows, "A1T1L"))
            a1t1h = int(first_value(dma_rows, "A1T1H"))
            a1b1 = int(first_value(dma_rows, "A1B1"))
            oam_dma_src = (a1b1 << 16) | (a1t1h << 8) | a1t1l
            das1l = int(first_value(dma_rows, "DAS1L") or 0)
            das1h = int(first_value(dma_rows, "DAS1H") or 0)
            oam_dma_size = (das1h << 8) | das1l

        row = {
            "frame": frame,
            "mainCallbackSnes": format_snes(
                probe_row.get("active_main_callback_bank"),
                probe_row.get("active_main_callback_addr"),
            ),
            "irqCallbackSnes": format_snes(
                probe_row.get("active_irq_callback_bank"),
                probe_row.get("active_irq_callback_addr"),
            ),
            "state0204": probe_row.get("state_0204"),
            "dp0054": probe_row.get("dp_0054"),
            "dp0054Hex": (
                f"0x{int(probe_row['dp_0054']):02X}"
                if probe_row.get("dp_0054") is not None
                else None
            ),
            "directVmadd": direct_vmadd,
            "directVmaddHex": f"0x{direct_vmadd:04X}" if direct_vmadd is not None else None,
            "directByteCount": len(direct_values),
            "directBlobLabel": direct_blob_label,
            "dmaBlobSource": dma_vram_src,
            "dmaBlobSourceHex": f"0x{dma_vram_src:06X}" if dma_vram_src is not None else None,
            "dmaBlobLabel": source_label_by_addr.get(dma_vram_src),
            "dmaBlobSize": dma_vram_size,
            "oamDmaSource": oam_dma_src,
            "oamDmaSourceHex": f"0x{oam_dma_src:06X}" if oam_dma_src is not None else None,
            "oamDmaSize": oam_dma_size,
        }
        rows.append(row)
        if row["dmaBlobSource"] is not None or row["directByteCount"]:
            burst_rows.append(row)

    trace_start = trace_start if trace_start is not None else (min(all_frames) if all_frames else None)
    trace_end = trace_end if trace_end is not None else (max(all_frames) if all_frames else None)
    transition_rows = build_transition_rows(rows)
    summary = {
        "transitionFrameCount": len(transition_rows),
        "transitionFrames": [row["frame"] for row in transition_rows],
        "burstFrameCount": len(burst_rows),
        "burstFrames": [row["frame"] for row in burst_rows],
        "distinctDirectBlobLabels": sorted(
            {row["directBlobLabel"] for row in burst_rows if row["directBlobLabel"]}
        ),
        "distinctDmaBlobLabels": sorted(
            {row["dmaBlobLabel"] for row in burst_rows if row["dmaBlobLabel"]}
        ),
        "distinctVmaddTargets": sorted(
            {row["directVmaddHex"] for row in burst_rows if row["directVmaddHex"]}
        ),
        "framesWithOamDma": [
            row["frame"] for row in rows if row["oamDmaSource"] is not None
        ],
        "state0204Ranges": collapse_ranges(burst_rows, "state0204"),
        "dp0054Ranges": collapse_ranges(burst_rows, "dp0054Hex"),
        "directBlobRanges": collapse_ranges(burst_rows, "directBlobLabel"),
        "vmaddRanges": collapse_ranges(burst_rows, "directVmaddHex"),
        "state0204ToDirectBlobLabels": build_state_value_map(
            burst_rows, "state0204", "directBlobLabel"
        ),
        "state0204ToVmaddTargets": build_state_value_map(
            burst_rows, "state0204", "directVmaddHex"
        ),
    }
    report = {
        "title": "Mode 7 Blob Cycle Report",
        "inputs": {
            "rom": str(args.rom.resolve()),
            "probeJson": str(args.probe_json.resolve()),
            "dmaWritesJson": str(args.dma_writes_json.resolve()),
            "vramWritesJson": str(args.vram_writes_json.resolve()),
        },
        "traceWindow": {
            "startFrame": trace_start,
            "endFrame": trace_end,
        },
        "blobSpecs": [
            {
                "label": str(spec["label"]),
                "cpuAddr": f"0x{int(spec['cpu_addr']):06X}",
                "size": int(spec["size"]),
            }
            for spec in blob_specs
        ],
        "summary": summary,
        "frames": rows,
        "transitionRows": transition_rows,
        "burstFrames": burst_rows,
    }

    ensure_parent(args.output_json)
    args.output_json.write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8")
    print(
        f"wrote mode7 blob cycle report -> {args.output_json} "
        f"burst_frames={summary['burstFrameCount']}"
    )

    if args.markdown_out is not None:
        ensure_parent(args.markdown_out)
        args.markdown_out.write_text(render_markdown(report), encoding="utf-8")
        print(f"wrote markdown summary -> {args.markdown_out}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
