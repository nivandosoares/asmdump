#!/usr/bin/env python3

from __future__ import annotations

import argparse
import json
from pathlib import Path


LOROM_BANK_SIZE = 0x8000
VARINT_BASE_TABLE = [
    0x0000,
    0x0000,
    0x0000,
    0x0004,
    0x000C,
    0x001C,
    0x003C,
    0x007C,
    0x00FC,
    0x01FC,
    0x03FC,
    0x07FC,
    0x0FFC,
    0x1FFC,
    0x3FFC,
    0x7FFC,
    0xFFFC,
]
SHORT_REPEAT_TABLE = [0x00, 0x81, 0x41, 0x21, 0x11, 0x09, 0x05, 0x03, 0x02]


def detect_header_size(rom_size: int) -> int:
    return 512 if (rom_size % LOROM_BANK_SIZE) == 512 else 0


def bank_offset(header_size: int, bank_index: int) -> int:
    return header_size + (bank_index * LOROM_BANK_SIZE)


class DistinctiveBitReader:
    def __init__(self, chunk: bytes, ptr: int, state: int, bits_remaining: int = 8):
        self.chunk = chunk
        self.ptr = ptr
        self.state = state & 0xFFFF
        self.bits_remaining = bits_remaining

    def _require_byte(self) -> int:
        if self.ptr >= len(self.chunk):
            raise ValueError("compressed stream ended early")
        value = self.chunk[self.ptr]
        self.ptr += 1
        return value

    def _asl16(self, value: int) -> tuple[int, int]:
        carry = 1 if (value & 0x8000) else 0
        return ((value << 1) & 0xFFFF), carry

    def _refill_low_byte(self) -> None:
        self.state = (self.state & 0xFF00) | self._require_byte()
        self.bits_remaining = 8

    def skip_bits(self, count: int) -> None:
        for _ in range(count):
            self.state, _ = self._asl16(self.state)
            self.bits_remaining -= 1
            if self.bits_remaining == 0:
                self._refill_low_byte()

    def read_varint(self) -> int:
        value = 0
        self.state, carry = self._asl16(self.state)
        self.bits_remaining -= 1
        if self.bits_remaining == 0:
            self._refill_low_byte()

        if carry:
            for _ in range(2):
                self.state, carry = self._asl16(self.state)
                value = ((value << 1) | carry) & 0xFFFF
                self.bits_remaining -= 1
                if self.bits_remaining == 0:
                    self._refill_low_byte()
            return value

        bit_count = 2
        while True:
            self.state, carry = self._asl16(self.state)
            self.bits_remaining -= 1
            if self.bits_remaining == 0:
                self._refill_low_byte()
            bit_count += 1
            if carry:
                break

        value = 0
        for _ in range(bit_count):
            self.state, carry = self._asl16(self.state)
            value = ((value << 1) | carry) & 0xFFFF
            self.bits_remaining -= 1
            if self.bits_remaining == 0:
                self._refill_low_byte()
        return (VARINT_BASE_TABLE[bit_count] + value) & 0xFFFF

    def build_long_state(self) -> tuple[int, int]:
        next_state = (self.state & 0xFF00) | self._require_byte()
        bits_remaining = self.bits_remaining
        while bits_remaining != 8:
            next_state = ((next_state << 1) & 0xFFFF)
            bits_remaining += 1
        return next_state, bits_remaining


def decode_42fb(chunk: bytes) -> tuple[bytes, dict]:
    if len(chunk) < 12 or chunk[:2] != b"\x42\xfb":
        raise ValueError("chunk is not a 42FB block")

    # L001210 has already consumed the 42FB marker before dispatching into
    # L000D4F, so the decoder starts at chunk offset 0x0002.
    ptr = 2
    ptr += 5
    declared_output_size = (chunk[ptr] << 8) | chunk[ptr + 1]
    ptr += 2
    root_index = chunk[ptr]
    ptr += 1
    node_count = chunk[ptr]
    ptr += 1

    node_flags = [0] * 256
    left = [0] * 256
    right = [0] * 256
    node_flags[root_index] = 0x80

    nodes: list[dict[str, int]] = []
    for _ in range(node_count):
        if (ptr + 2) >= len(chunk):
            raise ValueError("42FB node table truncated")
        node_index = chunk[ptr]
        child_left = chunk[ptr + 1]
        child_right = chunk[ptr + 2]
        ptr += 3

        node_flags[node_index] = 0x01
        left[node_index] = child_left
        right[node_index] = child_right
        nodes.append({
            "node_index": node_index,
            "left": child_left,
            "right": child_right,
        })

    output = bytearray()
    compressed_stream_offset = ptr

    def read_literal() -> int:
        nonlocal ptr
        if ptr >= len(chunk):
            raise ValueError("42FB literal read exceeded chunk size")
        value = chunk[ptr]
        ptr += 1
        return value

    def emit_symbol(symbol: int) -> None:
        if len(output) >= declared_output_size:
            return

        flag = node_flags[symbol]
        if flag == 0:
            output.append(symbol)
            return
        if flag & 0x80:
            output.append(read_literal())
            return

        emit_symbol(left[symbol])
        emit_symbol(right[symbol])

    while len(output) < declared_output_size:
        if ptr >= len(chunk):
            raise ValueError(
                f"42FB stream ended early after {len(output)} / {declared_output_size} output bytes"
            )
        token = chunk[ptr]
        ptr += 1
        emit_symbol(token)

    summary = {
        "format": "42FB",
        "declared_output_size": declared_output_size,
        "root_index": root_index,
        "node_count": node_count,
        "node_table_offset": 11,
        "compressed_stream_offset": compressed_stream_offset,
        "compressed_bytes_consumed": ptr,
        "nodes": nodes,
    }
    return bytes(output), summary


def decode_26fb(chunk: bytes) -> tuple[bytes, dict]:
    if len(chunk) < 8 or chunk[:2] != b"\x26\xfb":
        raise ValueError("chunk is not a 26FB block")

    ptr = 2
    ptr += 1
    declared_output_size = (chunk[ptr] << 8) | chunk[ptr + 1]
    ptr += 2
    ptr += 1
    initial_state = (chunk[ptr] << 8) | chunk[ptr + 1]
    ptr += 2

    reader = DistinctiveBitReader(chunk, ptr, initial_state)
    reader.read_varint()
    special_symbol = (reader.state >> 8) & 0xFF
    reader.skip_bits(8)

    counts = [0] * 16
    bases = [0] * 16
    limits = [0] * 16
    total_symbol_count = 0
    accumulator = 0
    running_total = 0
    group_count = 0

    for index in range(16):
        accumulator = (accumulator << 1) & 0xFFFF
        bases[index] = (accumulator - running_total) & 0xFFFF

        value = reader.read_varint()
        counts[index] = value
        running_total = (running_total + value) & 0xFFFF
        accumulator = (accumulator + value) & 0xFFFF

        if value == 0:
            limits[index] = 0
            continue

        shifted = accumulator
        carry = 0
        for _ in range(15 - index):
            carry = 1 if (shifted & 0x8000) else 0
            shifted = ((shifted << 1) & 0xFFFF)
        limits[index] = shifted
        if carry:
            group_count = index + 1
            total_symbol_count = running_total
            break

    if group_count == 0:
        raise ValueError("26FB group table did not converge")

    order: list[int] = []
    used = [False] * 256
    for _ in range(total_symbol_count):
        selector = reader.read_varint() + 1
        symbol = -1
        while selector:
            symbol += 1
            if not used[symbol]:
                selector -= 1
        used[symbol] = True
        order.append(symbol)

    short_symbols = [0] * 256
    actions = [0x10] * 256
    order_index = 0
    short_slots_used = 0
    special_short_bits: int | None = None

    for bit_length in range(1, min(group_count, 8) + 1):
        symbol_count = counts[bit_length - 1]
        repeat_count = SHORT_REPEAT_TABLE[bit_length] - 1
        for _ in range(symbol_count):
            symbol = order[order_index]
            order_index += 1
            action = (bit_length - 1) * 2
            if symbol == special_symbol:
                special_short_bits = bit_length
                action = 0x12

            for _ in range(repeat_count):
                if short_slots_used >= 256:
                    raise ValueError("26FB short decode table overflowed")
                short_symbols[short_slots_used] = symbol
                actions[short_slots_used] = action
                short_slots_used += 1

    long_shifts: list[int] = []
    long_extra_bits: list[int] = []
    long_limits: list[int] = []
    long_bases: list[int] = []
    for bit_length in range(9, group_count + 1):
        long_shifts.append(16 - bit_length)
        long_extra_bits.append(bit_length - 8)
        long_limits.append(limits[bit_length - 1])
        long_bases.append(bases[bit_length - 1])

    output = bytearray()
    end_marker_hit = False
    decode_steps = 0

    def append_repeat(run_length: int) -> None:
        if not output:
            raise ValueError("26FB repeat encountered before any output was written")
        take = min(run_length, declared_output_size - len(output))
        output.extend([output[-1]] * take)

    def decode_special(bit_count: int) -> bool:
        reader.skip_bits(bit_count)
        run_length = reader.read_varint()
        if run_length != 0:
            append_repeat(run_length)
            return False

        if reader.state & 0x8000:
            return True

        reader.skip_bits(1)
        if len(output) < declared_output_size:
            output.append((reader.state >> 8) & 0xFF)
        reader.skip_bits(8)
        return False

    while len(output) < declared_output_size:
        decode_steps += 1
        index = (reader.state >> 8) & 0xFF
        action = actions[index]

        if action not in (0x10, 0x12):
            output.append(short_symbols[index])
            reader.skip_bits((action // 2) + 1)
            continue

        if action == 0x10:
            if not long_shifts:
                raise ValueError("26FB selected a long code but no long tables were built")

            next_state, next_bits_remaining = reader.build_long_state()
            group_index = 0
            while group_index < len(long_limits) - 1:
                if reader.state < long_limits[group_index]:
                    break
                group_index += 1

            order_slot = ((reader.state >> long_shifts[group_index]) - long_bases[group_index]) & 0xFFFF
            if order_slot >= len(order):
                raise ValueError(f"26FB long-code table overflowed: {order_slot}")

            symbol = order[order_slot]
            reader.state = next_state
            reader.bits_remaining = next_bits_remaining

            if symbol == special_symbol:
                if decode_special(long_extra_bits[group_index]):
                    end_marker_hit = True
                    break
                continue

            output.append(symbol)
            reader.skip_bits(long_extra_bits[group_index])
            continue

        if special_short_bits is None:
            raise ValueError("26FB referenced a short special code but no short special symbol was built")
        if decode_special(special_short_bits):
            end_marker_hit = True
            break

    if len(output) != declared_output_size:
        raise ValueError(
            f"26FB decode length mismatch: got {len(output)} bytes, expected {declared_output_size}"
        )

    summary = {
        "format": "26FB",
        "declared_output_size": declared_output_size,
        "initial_state": initial_state,
        "special_symbol": special_symbol,
        "special_short_bits": special_short_bits,
        "group_count": group_count,
        "total_symbol_count": total_symbol_count,
        "short_slots_used": short_slots_used,
        "counts": counts[:group_count],
        "long_bases": long_bases,
        "long_limits": long_limits,
        "compressed_stream_offset": ptr,
        "compressed_bytes_consumed": reader.ptr,
        "decode_steps": decode_steps,
        "end_marker_hit": end_marker_hit,
    }
    return bytes(output), summary


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Decompress a TD2 chunk from the ROM. Supports 42FB and partial 26FB coverage."
    )
    parser.add_argument("rom", type=Path, help="input ROM path")
    parser.add_argument("output", type=Path, help="output binary path")
    parser.add_argument("--bank", type=int, required=True, help="LoROM bank index")
    parser.add_argument(
        "--addr",
        type=lambda value: int(value, 0),
        required=True,
        help="CPU address of the chunk inside the bank, e.g. 0x8000",
    )
    parser.add_argument(
        "--max-input-bytes",
        type=lambda value: int(value, 0),
        default=0x8000,
        help="maximum number of source bytes to expose to the decompressor (default: full bank)",
    )
    parser.add_argument(
        "--json-out",
        type=Path,
        default=None,
        help="optional JSON summary output path",
    )
    return parser.parse_args()


def main() -> int:
    args = parse_args()
    rom_bytes = args.rom.read_bytes()
    header_size = detect_header_size(len(rom_bytes))
    base = bank_offset(header_size, args.bank)

    if args.addr < 0x8000 or args.addr > 0xFFFF:
        raise ValueError(f"chunk address must be in LoROM visible range: {args.addr:#x}")

    start = base + (args.addr - 0x8000)
    end = min(base + LOROM_BANK_SIZE, start + args.max_input_bytes)
    chunk = rom_bytes[start:end]

    if chunk[:2] == b"\x42\xfb":
        output, summary = decode_42fb(chunk)
    elif chunk[:2] == b"\x26\xfb":
        output, summary = decode_26fb(chunk)
    else:
        raise ValueError(
            f"unsupported chunk marker {chunk[:2].hex()} at bank {args.bank:02X}:{args.addr:04X}"
        )

    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_bytes(output)

    summary.update({
        "bank": args.bank,
        "addr": f"0x{args.addr:04X}",
        "rom_offset": f"0x{start:06X}",
        "output_path": str(args.output),
        "output_size": len(output),
        "first_bytes": [f"0x{byte:02X}" for byte in output[:16]],
    })

    if args.json_out:
        args.json_out.parent.mkdir(parents=True, exist_ok=True)
        args.json_out.write_text(json.dumps(summary, indent=2), encoding="utf-8")

    print(
        f"decompressed {summary['format']} chunk {args.bank:02X}:{args.addr:04X} "
        f"-> {args.output} ({len(output)} bytes, consumed {summary['compressed_bytes_consumed']} input bytes)"
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
