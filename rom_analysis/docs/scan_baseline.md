# Scan Baseline (Banks 10 / 11 / 30)

Generated on the local repo with:

```sh
python3 tools/scan_structured_bank.py game.smc --bank 10 --json-out tools/out/bank10_chunks.json
python3 tools/scan_structured_bank.py game.smc --bank 11 --json-out tools/out/bank11_chunks.json
python3 tools/scan_structured_bank.py game.smc --bank 30 --json-out tools/out/bank30_chunks.json
python3 tools/extract_compression_header_manifest.py game.smc --bank 10 --json-out tools/out/bank10_headers.json
python3 tools/extract_compression_header_manifest.py game.smc --bank 11 --json-out tools/out/bank11_headers.json
python3 tools/extract_compression_header_manifest.py game.smc --bank 30 --json-out tools/out/bank30_headers.json
```

## Structured Chunk Scan

| Bank | Result |
|---|---|
| `10` | one `42fb` block at `offset 0x362D`, span `18899` |
| `11` | two `42fb` blocks at `0x319A` (span `4638`) and `0x43B8` (span `15432`) |
| `30` | one `42fb` at `0x1681`; multiple `26fb` at `0x5F6C`, `0x6039`, `0x673F`, `0x6800`, `0x6E7F` |

## Compression Header Manifest

| Bank | Marker highlights |
|---|---|
| `10` | `42FB` at `0x362D`, output size `0x3542` |
| `11` | `42FB` at `0x319A` (`0x41F0`) and `0x43B8` (`0xF037`) |
| `30` | `42FB` at `0x1681`, plus `67FB` at `0x5A96` and `0x691F`, plus `26FB` cluster `0x5F6C..0x6E7F` |

## Interpretation

- Banks `10` and `11` are likely code+data mixes with sizable compressed payloads.
- Bank `30` shows a denser compression mix (`42FB/67FB/26FB`), consistent with shared dispatch/content services.
- Marker scans in bank `30` include overlapping candidates; validated decode windows
  must be used before treating each marker as a top-level chunk boundary.
- Bank-1 pointer tables already confirm direct runtime references to bank-30
  `26FB` starts (`DF6C/E039/E73F/E800/EE7F`) despite overlap.
- Runtime `L001210` tracing on the no-input attract path now confirms active hits
  for `DF6C/E039/E73F/E800` and no hits yet for `9681/DA96/E91F/EE7F`.

## Next Actions

1. Build a validated bank-30 chunk map from decoder-consumed spans.
2. Cross-reference validated starts with bank-30 call-site neighborhoods.
3. Repeat classification for bank `10` and bank `11` blocks.
4. Annotate findings into `rom_analysis/code/*.asm` as typed table hypotheses.
