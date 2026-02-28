# Bank 7 Notes

## Current Read

`bank7` does not look like one flat 4bpp tile bank from byte 0.

Observed with header scans:

- recurring `42 FB` markers at offsets `0x0000`, `0x07CA`, `0x0F98`, `0x1A33`, `0x232C`, `0x2C90`, `0x36CE`, `0x3F49`, `0x4A3C`, `0x4ABA`
- recurring `26 FB` markers at offsets `0x017A`, `0x0949`, `0x11D8`, `0x1C0A`, `0x2511`, `0x2E8A`, `0x3870`, `0x4112`, `0x4AA8`, `0x4B43`, `0x4CA5`

The rough pattern is alternating:

- short `42 FB` block
- larger `26 FB` block

Typical span sizes from the current scan:

- `42 FB` blocks: about 378 to 576 bytes
- `26 FB` blocks: about 1600 to 2300 bytes

The important correction after opening `L001210` in `bank0.asm` is:

- `42 FB` is not "just metadata"; it is one of the actual compression formats handled by the common decompressor path
- `26 FB` is a second compression format handled by that same path
- `27 FB` also appears twice late in bank 7 and is handled as a third bank-7-relevant variant
- `67 FB` is supported by `L001210`, but it does not appear in bank 7

## Practical Decode Strategy

For now, treat both `42 FB` and `26/27 FB` chunks as real compressed assets, not plain/raw tile ranges.

Workflow:

1. Scan chunk offsets with `tools/scan_structured_bank.py` or `tools/extract_compression_header_manifest.py`.
2. Use the header manifest to identify the variant and leading fields.
3. Route the payload through the matching decompressor path from `L001210`.
4. Only after decompression, treat the output as tile or tilemap candidate data.

Current bank-7 header findings:

- `42 FB` count: `10`
- `26 FB` count: `11`
- `27 FB` count: `2`
- `67 FB` count: `0`

Observed header structure:

- `42 FB` entries expose a stable big-endian field at byte offset `0x07`; in the boot screen group this often resolves to `0x1006`
- `26 FB` and `27 FB` expose variant-specific big-endian fields at byte offsets `0x03` and `0x06`
- the two `27 FB` entries are late-bank outliers at `07:E8DA` and `07:FB00`

## First `42FB` Decode Confirmed

The first boot-screen `42FB` block at `07:8000` now decodes cleanly through the `L000D4F` model:

- compressed input consumed: `377` bytes
- output size: `0x1006` bytes
- node count: `18`
- root literal marker: `0x87`

The important structural result is the output layout:

- bytes `0x0000-0x0005`: `L0005AC`-style header
- bytes `0x0006-0x1005`: `0x1000` bytes of payload

For the first blob, that header is:

- width words: `0x0040`
- row count: `0x0020`
- aux field: `0x0304`

That means the first `42FB` output is not a naked tile stream. It is a paged VRAM upload record that feeds `L0005AC`, and only its payload becomes planar graphics after the 6-byte header is removed.

## First `26FB` Decode Confirmed

The first boot-screen `26FB` block at `07:817A` now decodes to its full declared span:

- compressed input consumed: `1160` bytes
- output size: `0x0870` bytes
- special symbol: `0x64`
- short table slots populated: `210`
- no short-form special code was needed in this block; the escape symbol resolves through the long-code path

Unlike `42FB`, this output is already a raw byte stream suitable for `L0006C9`-style DMA, not an `L0005AC` record with a 6-byte header.

The same decoder model also works for the boot overlay source at `0D:EFDE`, which expands to `0x0300` bytes.

## Immediate Targets

- boot screen group A: `42 FB` entries at `07:8000`, `07:87CA`, `07:8F98`, `07:9A33`, `07:AC90`, `07:B6CE`, `07:BF49`
- boot screen group B: `26 FB` entries at `07:817A`, `07:8949`, `07:91D8`, `07:9C0A`, `07:A511`, `07:AE8A`, `07:B870`, `07:C112`, `07:CAA8`
- late-bank `27 FB` experiments: `07:E8DA`, `07:FB00`

## Open Questions

- what the `26 FB` / `27 FB` header fields at offsets `0x03` and `0x06` mean semantically
- whether every `26 FB` / `27 FB` chunk follows the same raw-DMA model seen on the boot-path blocks, or if later banks introduce extra modes
- how much of the boot screen becomes recognizable once `26FB` is added to the current partial VRAM reconstruction
