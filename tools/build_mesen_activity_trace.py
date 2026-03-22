#!/usr/bin/env python3

from __future__ import annotations

import argparse
import json
import re
from collections import Counter
from pathlib import Path
from typing import Any


DMA_REGISTER_RE = re.compile(r"^(DMAP|BBAD|A1T|A1B|DAS|DASB|A2A|NTRL)(\d)(L|H)?$")

BBUS_REGISTER_NAMES = {
    0x04: "OAMDATA",
    0x18: "VMDATAL",
    0x19: "VMDATAH",
    0x21: "CGADD",
    0x22: "CGDATA",
}


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description=(
            "Build a frame/callback-oriented Mesen activity trace from "
            "mesen_probe_boot.lua outputs."
        )
    )
    parser.add_argument(
        "probe_input",
        type=Path,
        help=(
            "probe prefix, td2_boot_probe.json, or one related trace json "
            "such as *_dma_writes.json"
        ),
    )
    parser.add_argument("out_json", type=Path, help="output JSON path")
    parser.add_argument("--probe-json", type=Path, default=None, help="optional explicit td2_boot_probe.json path")
    parser.add_argument("--dma-json", type=Path, default=None, help="optional explicit *_dma_writes.json path")
    parser.add_argument("--vram-json", type=Path, default=None, help="optional explicit *_vram_writes.json path")
    parser.add_argument("--mode7-json", type=Path, default=None, help="optional explicit *_mode7_writes.json path")
    parser.add_argument("--markdown-out", type=Path, default=None, help="optional markdown summary output path")
    return parser.parse_args()


def as_int(value: Any, fallback: int | None = None) -> int | None:
    try:
        return int(value)
    except (TypeError, ValueError):
        return fallback


def format_snes(bank: int | None, addr: int | None) -> str | None:
    if bank is None or addr is None or bank < 0 or addr < 0:
        return None
    return f"{bank & 0xFF:02X}:{addr & 0xFFFF:04X}"


def load_optional_json(path: Path | None) -> dict[str, Any] | None:
    if path is None or not path.is_file():
        return None
    payload = json.loads(path.read_text(encoding="utf-8"))
    return payload if isinstance(payload, dict) else None


def infer_prefix(input_path: Path) -> Path:
    name = input_path.name
    for marker in ("_dma_writes", "_vram_writes", "_mode7_writes"):
        if marker in name and name.endswith(".json"):
            return input_path.with_name(name.split(marker, 1)[0])
    for suffix in ("_dma_writes.json", "_vram_writes.json", "_mode7_writes.json", ".json"):
        if name.endswith(suffix):
            return input_path.with_name(name[: -len(suffix)])
    return input_path


def infer_related_path(prefix: Path, suffix: str) -> Path:
    return prefix.with_name(prefix.name + suffix)


def detect_input_kind(path: Path) -> str:
    name = path.name
    if "_dma_writes" in name and name.endswith(".json"):
        return "dma"
    if "_vram_writes" in name and name.endswith(".json"):
        return "vram"
    if "_mode7_writes" in name and name.endswith(".json"):
        return "mode7"
    if name.endswith(".json"):
        return "probe"
    return "prefix"


def callback_from_frame_row(frame_row: dict[str, Any] | None) -> tuple[str | None, str | None]:
    if not isinstance(frame_row, dict):
        return None, None
    main = format_snes(as_int(frame_row.get("active_main_callback_bank")), as_int(frame_row.get("active_main_callback_addr")))
    irq = format_snes(as_int(frame_row.get("active_irq_callback_bank")), as_int(frame_row.get("active_irq_callback_addr")))
    return main, irq


def callback_from_entry(entry: dict[str, Any], frame_row: dict[str, Any] | None) -> tuple[str | None, str | None]:
    main, irq = callback_from_frame_row(frame_row)
    if main is None:
        main = format_snes(as_int(entry.get("main_bank")), as_int(entry.get("main_addr")))
    if main is None:
        main = format_snes(as_int(entry.get("active_main_callback_bank")), as_int(entry.get("active_main_callback_addr")))
    if irq is None:
        irq = format_snes(as_int(entry.get("active_irq_callback_bank")), as_int(entry.get("active_irq_callback_addr")))
    return main, irq


def state_excerpt(frame_row: dict[str, Any] | None) -> dict[str, int | None]:
    if not isinstance(frame_row, dict):
        return {
            "0202": None,
            "0204": None,
            "0206": None,
            "0208": None,
            "020a": None,
            "040a": None,
            "0054": None,
        }
    return {
        "0202": as_int(frame_row.get("state_0202")),
        "0204": as_int(frame_row.get("state_0204")),
        "0206": as_int(frame_row.get("state_0206")),
        "0208": as_int(frame_row.get("state_0208")),
        "020a": as_int(frame_row.get("state_020a")),
        "040a": as_int(frame_row.get("state_040a")),
        "0054": as_int(frame_row.get("dp_0054")),
    }


def classify_bbus(value: int | None) -> dict[str, Any]:
    if value is None:
        return {"register": None, "snes": None, "domain": "unknown"}
    register = BBUS_REGISTER_NAMES.get(value)
    snes = f"00:21{value & 0xFF:02X}"
    if value == 0x04:
        domain = "oam"
    elif value in (0x18, 0x19):
        domain = "vram"
    elif value == 0x22:
        domain = "cgram"
    elif value == 0x21:
        domain = "cgram_addr"
    else:
        domain = "ppu"
    return {
        "register": register or snes,
        "snes": snes,
        "domain": domain,
    }


def parse_dma_mode(value: int | None) -> dict[str, Any]:
    if value is None:
        return {
            "raw": None,
            "transferMode": None,
            "fixed": None,
            "decrement": None,
            "indirect": None,
            "direction": None,
        }
    return {
        "raw": value,
        "transferMode": value & 0x07,
        "fixed": bool(value & 0x08),
        "decrement": bool(value & 0x10),
        "indirect": bool(value & 0x40),
        "direction": "b_to_a" if (value & 0x80) else "a_to_b",
    }


def parse_dma_register(register: str) -> tuple[int | None, str | None]:
    match = DMA_REGISTER_RE.match(register)
    if not match:
        return None, None
    family, channel_str, suffix = match.groups()
    channel = int(channel_str)
    suffix_str = suffix or ""
    key = family + suffix_str
    return channel, key


def build_frame_lookup(probe_payload: dict[str, Any] | None) -> dict[int, dict[str, Any]]:
    if not isinstance(probe_payload, dict):
        return {}
    frames = probe_payload.get("frames")
    if not isinstance(frames, list):
        return {}
    out: dict[int, dict[str, Any]] = {}
    for row in frames:
        if not isinstance(row, dict):
            continue
        frame = as_int(row.get("frame"))
        if frame is None:
            continue
        out[frame] = row
    return out


def build_dma_events(
    dma_payload: dict[str, Any] | None,
    frame_lookup: dict[int, dict[str, Any]],
) -> dict[str, Any]:
    if not isinstance(dma_payload, dict):
        return {"enabled": False, "reason": "missing dma trace json"}

    writes = dma_payload.get("writes")
    if not isinstance(writes, list):
        return {"enabled": False, "reason": "dma trace json missing writes array"}

    channel_state: dict[int, dict[str, int]] = {channel: {} for channel in range(8)}
    events: list[dict[str, Any]] = []
    by_domain: Counter[str] = Counter()
    by_callback: Counter[str] = Counter()
    by_channel: Counter[int] = Counter()

    for order, row in enumerate(writes):
        if not isinstance(row, dict):
            continue

        register = str(row.get("register", ""))
        channel, key = parse_dma_register(register)
        if channel is not None and key is not None:
            value = as_int(row.get("value"))
            if value is not None:
                channel_state[channel][key] = value

        if register not in ("DMAEN", "HDMAEN"):
            continue

        frame = as_int(row.get("frame"))
        if frame is None:
            continue

        enable_mask = as_int(row.get("value"), 0) or 0
        if enable_mask <= 0:
            continue

        frame_row = frame_lookup.get(frame)
        main_callback, irq_callback = callback_from_entry(row, frame_row)
        excerpt = state_excerpt(frame_row)

        for channel_index in range(8):
            if (enable_mask & (1 << channel_index)) == 0:
                continue

            regs = channel_state[channel_index]
            bbad = regs.get("BBAD")
            bus_info = classify_bbus(bbad)
            source_addr = None
            if "A1TL" in regs or "A1TH" in regs:
                source_addr = (regs.get("A1TL", 0) & 0xFF) | ((regs.get("A1TH", 0) & 0xFF) << 8)
            source_bank = regs.get("A1B")
            source_linear = None
            source_snes = None
            if source_addr is not None and source_bank is not None:
                source_linear = ((source_bank & 0xFF) << 16) | (source_addr & 0xFFFF)
                source_snes = format_snes(source_bank, source_addr)
            dmap = regs.get("DMAP")
            mode_info = parse_dma_mode(dmap)
            size = None
            if "DASL" in regs or "DASH" in regs:
                size = (regs.get("DASL", 0) & 0xFF) | ((regs.get("DASH", 0) & 0xFF) << 8)

            event = {
                "eventId": f"{register.lower()}_{frame}_{as_int(row.get('scanline'), -1)}_ch{channel_index}",
                "kind": "dma" if register == "DMAEN" else "hdma",
                "frame": frame,
                "scanline": as_int(row.get("scanline")),
                "order": order,
                "channel": channel_index,
                "triggerRegister": register,
                "triggerValue": enable_mask,
                "activeMainCallbackSnes": main_callback,
                "activeIrqCallbackSnes": irq_callback,
                "bgMode": as_int(row.get("bg_mode")),
                "mainScreenLayers": as_int(row.get("main_screen_layers")),
                "state": excerpt,
                "channelConfig": {
                    "DMAP": dmap,
                    "BBAD": bbad,
                    "A1TL": regs.get("A1TL"),
                    "A1TH": regs.get("A1TH"),
                    "A1B": regs.get("A1B"),
                    "DASL": regs.get("DASL"),
                    "DASH": regs.get("DASH"),
                    "DASB": regs.get("DASB"),
                    "A2AL": regs.get("A2AL"),
                    "A2AH": regs.get("A2AH"),
                    "NTRL": regs.get("NTRL"),
                },
                "mode": mode_info,
                "target": bus_info,
                "sourceAddr": source_addr,
                "sourceBank": source_bank,
                "sourceLinear": source_linear,
                "sourceSnes": source_snes,
                "size": size,
            }
            events.append(event)
            by_domain[str(bus_info["domain"])] += 1
            by_channel[channel_index] += 1
            if main_callback is not None:
                by_callback[main_callback] += 1

    frames_with_events = sorted({int(event["frame"]) for event in events})
    summary = {
        "enabled": True,
        "traceWindow": {
            "startFrame": dma_payload.get("trace_start_frame"),
            "endFrame": dma_payload.get("trace_end_frame"),
        },
        "writeCount": len(writes),
        "eventCount": len(events),
        "framesWithEvents": frames_with_events,
        "countsByDomain": dict(sorted(by_domain.items())),
        "countsByChannel": {str(channel): count for channel, count in sorted(by_channel.items())},
        "countsByMainCallback": dict(sorted(by_callback.items())),
        "events": events,
    }
    return summary


def build_direct_write_events(
    vram_payload: dict[str, Any] | None,
    frame_lookup: dict[int, dict[str, Any]],
) -> dict[str, Any]:
    if not isinstance(vram_payload, dict):
        return {"enabled": False, "reason": "missing vram trace json"}

    writes = vram_payload.get("writes")
    if not isinstance(writes, list):
        return {"enabled": False, "reason": "vram trace json missing writes array"}

    current_vmain: int | None = None
    current_vmadd: int | None = None
    current_cgadd: int | None = None
    events: list[dict[str, Any]] = []
    by_kind: Counter[str] = Counter()
    by_callback: Counter[str] = Counter()

    for row in writes:
        if not isinstance(row, dict):
            continue

        register = str(row.get("register", ""))
        value = as_int(row.get("value"))
        if register == "VMAIN":
            current_vmain = value
            continue
        if register == "VMADDL":
            current_vmadd = ((current_vmadd or 0) & 0xFF00) | ((value or 0) & 0xFF)
            continue
        if register == "VMADDH":
            current_vmadd = ((current_vmadd or 0) & 0x00FF) | (((value or 0) & 0xFF) << 8)
            continue
        if register == "CGADD":
            current_cgadd = value
            continue
        if register not in ("VMDATAL", "VMDATAH", "CGDATA"):
            continue

        frame = as_int(row.get("frame"))
        if frame is None:
            continue
        frame_row = frame_lookup.get(frame)
        main_callback, irq_callback = callback_from_entry(row, frame_row)
        excerpt = state_excerpt(frame_row)

        kind = "vram_data" if register in ("VMDATAL", "VMDATAH") else "cgram_data"
        descriptor = {
            "kind": kind,
            "frame": frame,
            "scanline": as_int(row.get("scanline")),
            "activeMainCallbackSnes": main_callback,
            "activeIrqCallbackSnes": irq_callback,
            "bgMode": as_int(row.get("bg_mode")),
            "mainScreenLayers": as_int(row.get("main_screen_layers")),
            "vmain": current_vmain,
            "vmaddr": current_vmadd,
            "cgadd": current_cgadd,
            "state": excerpt,
        }
        if events and all(events[-1].get(key) == value for key, value in descriptor.items()):
            event = events[-1]
        else:
            event = dict(descriptor)
            event["writeCount"] = 0
            event["registerCounts"] = Counter()
            event["sampleValues"] = []
            events.append(event)

        event["writeCount"] = as_int(event.get("writeCount"), 0) + 1
        event["registerCounts"][register] += 1
        sample_values = event["sampleValues"]
        if isinstance(sample_values, list) and len(sample_values) < 16:
            sample_values.append({"register": register, "value": value})
        by_kind[kind] += 1
        if main_callback is not None:
            by_callback[main_callback] += 1

    normalized_events: list[dict[str, Any]] = []
    for index, event in enumerate(events):
        normalized = dict(event)
        normalized["eventId"] = (
            f"{event['kind']}_{event['frame']}_{event['scanline']}_{index}"
        )
        normalized["registerCounts"] = dict(sorted(normalized["registerCounts"].items()))
        normalized_events.append(normalized)

    return {
        "enabled": True,
        "traceWindow": {
            "startFrame": vram_payload.get("trace_start_frame"),
            "endFrame": vram_payload.get("trace_end_frame"),
        },
        "writeCount": len(writes),
        "eventCount": len(normalized_events),
        "countsByKind": dict(sorted(by_kind.items())),
        "countsByMainCallback": dict(sorted(by_callback.items())),
        "events": normalized_events,
    }


def build_mode7_events(
    mode7_payload: dict[str, Any] | None,
    frame_lookup: dict[int, dict[str, Any]],
) -> dict[str, Any]:
    if not isinstance(mode7_payload, dict):
        return {"enabled": False, "reason": "missing mode7 trace json"}

    writes = mode7_payload.get("writes")
    if not isinstance(writes, list):
        return {"enabled": False, "reason": "mode7 trace json missing writes array"}

    events: list[dict[str, Any]] = []
    register_counts: Counter[str] = Counter()
    callback_counts: Counter[str] = Counter()

    for row in writes:
        if not isinstance(row, dict):
            continue

        frame = as_int(row.get("frame"))
        if frame is None:
            continue
        frame_row = frame_lookup.get(frame)
        main_callback, irq_callback = callback_from_entry(row, frame_row)
        excerpt = state_excerpt(frame_row)
        descriptor = {
            "frame": frame,
            "scanline": as_int(row.get("scanline")),
            "activeMainCallbackSnes": main_callback,
            "activeIrqCallbackSnes": irq_callback,
            "bgMode": as_int(row.get("bg_mode")),
            "mainScreenLayers": as_int(row.get("main_screen_layers")),
            "state": excerpt,
        }
        if events and all(events[-1].get(key) == value for key, value in descriptor.items()):
            event = events[-1]
        else:
            event = dict(descriptor)
            event["writeCount"] = 0
            event["registerCounts"] = Counter()
            event["sampleWrites"] = []
            events.append(event)

        register = str(row.get("register", "unknown"))
        event["writeCount"] = as_int(event.get("writeCount"), 0) + 1
        event["registerCounts"][register] += 1
        sample_writes = event["sampleWrites"]
        if isinstance(sample_writes, list) and len(sample_writes) < 24:
            sample_writes.append({"register": register, "value": as_int(row.get("value"))})
        register_counts[register] += 1
        if main_callback is not None:
            callback_counts[main_callback] += 1

    normalized_events: list[dict[str, Any]] = []
    for index, event in enumerate(events):
        normalized = dict(event)
        normalized["eventId"] = f"mode7_{event['frame']}_{event['scanline']}_{index}"
        normalized["registerCounts"] = dict(sorted(normalized["registerCounts"].items()))
        normalized_events.append(normalized)

    return {
        "enabled": True,
        "traceWindow": {
            "startFrame": mode7_payload.get("trace_start_frame"),
            "endFrame": mode7_payload.get("trace_end_frame"),
        },
        "writeCount": len(writes),
        "eventCount": len(normalized_events),
        "countsByRegister": dict(sorted(register_counts.items())),
        "countsByMainCallback": dict(sorted(callback_counts.items())),
        "events": normalized_events,
    }


def build_frame_activity(
    frame_lookup: dict[int, dict[str, Any]],
    dma_summary: dict[str, Any],
    direct_summary: dict[str, Any],
    mode7_summary: dict[str, Any],
) -> list[dict[str, Any]]:
    activity_by_frame: dict[int, dict[str, Any]] = {}

    for frame, row in frame_lookup.items():
        main_callback, irq_callback = callback_from_frame_row(row)
        activity_by_frame[frame] = {
            "frame": frame,
            "activeMainCallbackSnes": main_callback,
            "activeIrqCallbackSnes": irq_callback,
            "state": state_excerpt(row),
            "dmaEventCount": 0,
            "dmaDomains": Counter(),
            "directEventCount": 0,
            "directWriteCounts": Counter(),
            "mode7EventCount": 0,
            "mode7WriteCount": 0,
        }

    if dma_summary.get("enabled"):
        for event in dma_summary.get("events", []):
            if not isinstance(event, dict):
                continue
            frame = as_int(event.get("frame"))
            if frame is None:
                continue
            row = activity_by_frame.setdefault(
                frame,
                {
                    "frame": frame,
                    "activeMainCallbackSnes": event.get("activeMainCallbackSnes"),
                    "activeIrqCallbackSnes": event.get("activeIrqCallbackSnes"),
                    "state": event.get("state"),
                    "dmaEventCount": 0,
                    "dmaDomains": Counter(),
                    "directEventCount": 0,
                    "directWriteCounts": Counter(),
                    "mode7EventCount": 0,
                    "mode7WriteCount": 0,
                },
            )
            row["dmaEventCount"] += 1
            target = event.get("target", {})
            if isinstance(target, dict):
                row["dmaDomains"][str(target.get("domain", "unknown"))] += 1

    if direct_summary.get("enabled"):
        for event in direct_summary.get("events", []):
            if not isinstance(event, dict):
                continue
            frame = as_int(event.get("frame"))
            if frame is None:
                continue
            row = activity_by_frame.setdefault(
                frame,
                {
                    "frame": frame,
                    "activeMainCallbackSnes": event.get("activeMainCallbackSnes"),
                    "activeIrqCallbackSnes": event.get("activeIrqCallbackSnes"),
                    "state": event.get("state"),
                    "dmaEventCount": 0,
                    "dmaDomains": Counter(),
                    "directEventCount": 0,
                    "directWriteCounts": Counter(),
                    "mode7EventCount": 0,
                    "mode7WriteCount": 0,
                },
            )
            row["directEventCount"] += 1
            row["directWriteCounts"][str(event.get("kind", "unknown"))] += as_int(event.get("writeCount"), 0) or 0

    if mode7_summary.get("enabled"):
        for event in mode7_summary.get("events", []):
            if not isinstance(event, dict):
                continue
            frame = as_int(event.get("frame"))
            if frame is None:
                continue
            row = activity_by_frame.setdefault(
                frame,
                {
                    "frame": frame,
                    "activeMainCallbackSnes": event.get("activeMainCallbackSnes"),
                    "activeIrqCallbackSnes": event.get("activeIrqCallbackSnes"),
                    "state": event.get("state"),
                    "dmaEventCount": 0,
                    "dmaDomains": Counter(),
                    "directEventCount": 0,
                    "directWriteCounts": Counter(),
                    "mode7EventCount": 0,
                    "mode7WriteCount": 0,
                },
            )
            row["mode7EventCount"] += 1
            row["mode7WriteCount"] += as_int(event.get("writeCount"), 0) or 0

    frame_rows: list[dict[str, Any]] = []
    for frame in sorted(activity_by_frame):
        row = activity_by_frame[frame]
        frame_rows.append(
            {
                "frame": frame,
                "activeMainCallbackSnes": row.get("activeMainCallbackSnes"),
                "activeIrqCallbackSnes": row.get("activeIrqCallbackSnes"),
                "state": row.get("state"),
                "dmaEventCount": row.get("dmaEventCount", 0),
                "dmaDomains": dict(sorted(row["dmaDomains"].items())),
                "directEventCount": row.get("directEventCount", 0),
                "directWriteCounts": dict(sorted(row["directWriteCounts"].items())),
                "mode7EventCount": row.get("mode7EventCount", 0),
                "mode7WriteCount": row.get("mode7WriteCount", 0),
            }
        )
    return frame_rows


def top_event_rows(events: list[dict[str, Any]], limit: int = 12) -> list[dict[str, Any]]:
    rows: list[dict[str, Any]] = []
    for event in events[:limit]:
        rows.append(event)
    return rows


def render_markdown(summary: dict[str, Any]) -> str:
    lines: list[str] = []
    lines.append("# Mesen Activity Trace")
    lines.append("")
    lines.append("## Inputs")
    lines.append("")
    for key, value in summary.get("inputs", {}).items():
        lines.append(f"- `{key}`: `{value}`")
    lines.append("")
    trace_window = summary.get("traceWindow", {})
    lines.append("## Trace Window")
    lines.append("")
    lines.append(
        f"- frames: `{trace_window.get('startFrame')}`..`{trace_window.get('endFrame')}`"
    )
    lines.append("")

    dma_summary = summary.get("dma", {})
    direct_summary = summary.get("directWrites", {})
    mode7_summary = summary.get("mode7", {})

    lines.append("## Summary")
    lines.append("")
    if dma_summary.get("enabled"):
        lines.append(
            f"- DMA/HDMA events: `{dma_summary.get('eventCount')}` across frames "
            f"`{dma_summary.get('framesWithEvents')}`"
        )
        lines.append(f"- DMA domains: `{dma_summary.get('countsByDomain')}`")
    else:
        lines.append(f"- DMA/HDMA events: disabled (`{dma_summary.get('reason')}`)")
    if direct_summary.get("enabled"):
        lines.append(
            f"- direct VRAM/CGRAM write events: `{direct_summary.get('eventCount')}` "
            f"from `{direct_summary.get('writeCount')}` raw writes"
        )
        lines.append(f"- direct write kinds: `{direct_summary.get('countsByKind')}`")
    else:
        lines.append(f"- direct VRAM/CGRAM writes: disabled (`{direct_summary.get('reason')}`)")
    if mode7_summary.get("enabled"):
        lines.append(
            f"- Mode 7/TMAIN events: `{mode7_summary.get('eventCount')}` "
            f"from `{mode7_summary.get('writeCount')}` raw writes"
        )
        lines.append(f"- Mode 7 register counts: `{mode7_summary.get('countsByRegister')}`")
    else:
        lines.append(f"- Mode 7/TMAIN writes: disabled (`{mode7_summary.get('reason')}`)")
    lines.append("")

    frame_activity = summary.get("frameActivity", [])
    lines.append("## Frame Activity")
    lines.append("")
    for row in frame_activity:
        if not isinstance(row, dict):
            continue
        if not row.get("dmaEventCount") and not row.get("directEventCount") and not row.get("mode7EventCount"):
            continue
        lines.append(
            "- frame `{frame}` callback `{main}` irq `{irq}`: dma={dma} "
            "direct={direct} mode7={mode7} state0204={state0204} "
            "state0206={state0206} state040a={state040a} dp0054={dp0054}".format(
                frame=row.get("frame"),
                main=row.get("activeMainCallbackSnes"),
                irq=row.get("activeIrqCallbackSnes"),
                dma=row.get("dmaEventCount"),
                direct=row.get("directEventCount"),
                mode7=row.get("mode7EventCount"),
                state0204=(row.get("state") or {}).get("0204"),
                state0206=(row.get("state") or {}).get("0206"),
                state040a=(row.get("state") or {}).get("040a"),
                dp0054=(row.get("state") or {}).get("0054"),
            )
        )
    lines.append("")

    if dma_summary.get("enabled"):
        lines.append("## Sample DMA Events")
        lines.append("")
        for event in top_event_rows(dma_summary.get("events", [])):
            target = event.get("target", {})
            lines.append(
                "- frame `{frame}` scanline `{scanline}` `{kind}` ch`{channel}` -> `{target}` "
                "domain=`{domain}` size=`{size}` source=`{source}` callback=`{callback}`".format(
                    frame=event.get("frame"),
                    scanline=event.get("scanline"),
                    kind=event.get("kind"),
                    channel=event.get("channel"),
                    target=target.get("register") if isinstance(target, dict) else None,
                    domain=target.get("domain") if isinstance(target, dict) else None,
                    size=event.get("size"),
                    source=event.get("sourceSnes"),
                    callback=event.get("activeMainCallbackSnes"),
                )
            )
        lines.append("")

    if direct_summary.get("enabled"):
        lines.append("## Sample Direct Write Events")
        lines.append("")
        for event in top_event_rows(direct_summary.get("events", [])):
            lines.append(
                "- frame `{frame}` scanline `{scanline}` `{kind}` writes=`{writes}` "
                "vmaddr=`{vmaddr}` cgadd=`{cgadd}` callback=`{callback}`".format(
                    frame=event.get("frame"),
                    scanline=event.get("scanline"),
                    kind=event.get("kind"),
                    writes=event.get("writeCount"),
                    vmaddr=event.get("vmaddr"),
                    cgadd=event.get("cgadd"),
                    callback=event.get("activeMainCallbackSnes"),
                )
            )
        lines.append("")

    if mode7_summary.get("enabled"):
        lines.append("## Sample Mode 7 Events")
        lines.append("")
        for event in top_event_rows(mode7_summary.get("events", [])):
            lines.append(
                "- frame `{frame}` scanline `{scanline}` writes=`{writes}` "
                "registers=`{registers}` callback=`{callback}`".format(
                    frame=event.get("frame"),
                    scanline=event.get("scanline"),
                    writes=event.get("writeCount"),
                    registers=event.get("registerCounts"),
                    callback=event.get("activeMainCallbackSnes"),
                )
            )
        lines.append("")

    return "\n".join(lines) + "\n"


def main() -> int:
    args = parse_args()

    probe_input = args.probe_input.resolve()
    input_kind = detect_input_kind(probe_input)
    prefix = infer_prefix(probe_input)
    probe_json_path = (
        args.probe_json.resolve()
        if args.probe_json is not None
        else (probe_input if input_kind == "probe" else infer_related_path(prefix, ".json"))
    )
    dma_json_path = (
        args.dma_json.resolve()
        if args.dma_json is not None
        else (probe_input if input_kind == "dma" else infer_related_path(prefix, "_dma_writes.json"))
    )
    vram_json_path = (
        args.vram_json.resolve()
        if args.vram_json is not None
        else (probe_input if input_kind == "vram" else infer_related_path(prefix, "_vram_writes.json"))
    )
    mode7_json_path = (
        args.mode7_json.resolve()
        if args.mode7_json is not None
        else (probe_input if input_kind == "mode7" else infer_related_path(prefix, "_mode7_writes.json"))
    )

    probe_payload = load_optional_json(probe_json_path)
    dma_payload = load_optional_json(dma_json_path)
    vram_payload = load_optional_json(vram_json_path)
    mode7_payload = load_optional_json(mode7_json_path)

    frame_lookup = build_frame_lookup(probe_payload)
    dma_summary = build_dma_events(dma_payload, frame_lookup)
    direct_summary = build_direct_write_events(vram_payload, frame_lookup)
    mode7_summary = build_mode7_events(mode7_payload, frame_lookup)
    frame_activity = build_frame_activity(frame_lookup, dma_summary, direct_summary, mode7_summary)

    trace_start_frame = None
    trace_end_frame = None
    for payload in (probe_payload, dma_payload, vram_payload, mode7_payload):
        if not isinstance(payload, dict):
            continue
        if trace_start_frame is None:
            trace_start_frame = payload.get("trace_start_frame")
        if trace_end_frame is None:
            trace_end_frame = payload.get("trace_end_frame")

    summary = {
        "inputs": {
            "probeInput": str(args.probe_input.resolve()),
            "probeJson": str(probe_json_path) if probe_json_path.is_file() else None,
            "dmaJson": str(dma_json_path) if dma_json_path.is_file() else None,
            "vramJson": str(vram_json_path) if vram_json_path.is_file() else None,
            "mode7Json": str(mode7_json_path) if mode7_json_path.is_file() else None,
        },
        "traceWindow": {
            "startFrame": trace_start_frame,
            "endFrame": trace_end_frame,
        },
        "probeFrames": len(frame_lookup),
        "dma": dma_summary,
        "directWrites": direct_summary,
        "mode7": mode7_summary,
        "frameActivity": frame_activity,
    }

    args.out_json.parent.mkdir(parents=True, exist_ok=True)
    args.out_json.write_text(json.dumps(summary, indent=2) + "\n", encoding="utf-8")

    if args.markdown_out is not None:
        args.markdown_out.parent.mkdir(parents=True, exist_ok=True)
        args.markdown_out.write_text(render_markdown(summary), encoding="utf-8")

    print(
        f"wrote activity trace -> {args.out_json} "
        f"dma_events={summary['dma'].get('eventCount')} "
        f"direct_events={summary['directWrites'].get('eventCount')} "
        f"mode7_events={summary['mode7'].get('eventCount')}"
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
