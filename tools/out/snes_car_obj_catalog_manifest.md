# SNES Car OBJ Catalog Manifest

- Claim: `01:9C77` feeds per-car OBJ catalogs, not the BG name/info panel.
- Scope: thin canonical naming pass for future promoted assets.

| Canonical ID | Display Name | Base | File Offset | Catalog Role | Name Mapping | Local Report |
| --- | --- | --- | --- | --- | --- | --- |
| `p959` | `Porsche 959` | `1A:97D8` | `0x0D17D8` | `VERIFIED` | `VERIFIED` | `tools/out/car_table_1a97d8_report.md` |
| `diablo` | `Lamborghini Diablo` | `11:A578` | `0x08A578` | `VERIFIED` | `VERIFIED` | `tools/out/car_table_11a578_report.md` |
| `f40` | `Ferrari F40` | `1A:8000` | `0x0D0000` | `VERIFIED` | `PROBABLE` | `tools/out/car_table_1a8000_report.md` |

## Notes

- `p959`
  - Runtime anchor: frame `1500`, `state_0202 = 1`.
  - The visible `Porsche 959` label survives in `BG2` without OAM, while this
    base supplies the visible car OBJ art.
- `diablo`
  - Runtime anchor: frame `1640`, `state_0202 = 2`, reached by
    `right` input at `1505..1510`.
  - The visible `Lamborghini Diablo` label survives in `BG2`, while this base
    supplies the visible car OBJ art.
- `f40`
  - Local row decode is now promoted in-repo through
    `tools/out/car_table_1a8000_report.md`.
  - The display-name mapping is still the remaining third-slot calibration
    until a live named frame is promoted.
