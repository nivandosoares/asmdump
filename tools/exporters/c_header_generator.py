"""C header generator for binary assets."""

from __future__ import annotations

from pathlib import Path


def generate_c_header(data: bytes | bytearray, var_name: str, output_path: str | Path) -> None:
    path = Path(output_path)
    path.parent.mkdir(parents=True, exist_ok=True)

    guard = f"{var_name.upper()}_H"
    lines = [
        "// Gerado automaticamente por extract_tools",
        f"#ifndef {guard}",
        f"#define {guard}",
        "",
        "#include <stdint.h>",
        "",
        f"static const uint8_t {var_name}[] = {{",
    ]

    for i, byte in enumerate(data):
        prefix = "    " if i % 12 == 0 else ""
        suffix = "\n" if i % 12 == 11 else ""
        lines.append(f"{prefix}0x{byte:02X}, {suffix}")

    lines.extend(["", "};", "", f"#endif // {guard}", ""])
    path.write_text("".join(lines), encoding="utf-8")
