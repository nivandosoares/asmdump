# Scanline DMA Queue Summary

This report compares visible-phase queue/DMA state across scanline captures.

## Frame `3250`

- capture: `tools/out/lane3_live_entry_frame03250_scanline_full/td2_scanline_step_test.json`
- sampled scanlines: `0..223` (`224` samples)
- active queue scanlines: `178`
- max active descriptors: `1`
- active spans:
  - `46..223` (`178` scanlines, 1 descriptor(s))
  - entries: `[{"bytes_hex": "01b8b41520008061", "command": 1, "offset": 112, "slot": 14, "source_addr": 1422520, "transfer_size": 32, "vram_dest": 24960, "words": [47105, 5556, 32, 24960]}]`
- representative queue fields:
  - `dp_0053`: `112 (0x70)`
  - `dp_0054`: `112 (0x70)`
  - `wram_0053`: `112 (0x70)`
  - `wram_0054`: `112 (0x70)`
  - `wram_0055`: `24 (0x18)`
  - `wram_0056`: `18 (0x12)`
  - `queue_dma_nonzero_entry_count`: `32 (0x20)`
  - `queue_dma_active_descriptor_count`: `0 (0x0)`
  - `queue_dma_active_entries`: `[]`

## Frame `3400`

- capture: `tools/out/lane3_live_entry_brake_frame03400_scanline_full/td2_scanline_step_test.json`
- sampled scanlines: `0..223` (`224` samples)
- active queue scanlines: `0`
- max active descriptors: `0`
- active spans: none
- representative queue fields:
  - `dp_0053`: `224 (0xE0)`
  - `dp_0054`: `224 (0xE0)`
  - `wram_0053`: `224 (0xE0)`
  - `wram_0054`: `224 (0xE0)`
  - `wram_0055`: `144 (0x90)`
  - `wram_0056`: `21 (0x15)`
  - `queue_dma_nonzero_entry_count`: `32 (0x20)`
  - `queue_dma_active_descriptor_count`: `0 (0x0)`
  - `queue_dma_active_entries`: `[]`

## Frame `3550`

- capture: `tools/out/lane3_live_entry_frame03550_scanline_full/td2_scanline_step_test.json`
- sampled scanlines: `0..223` (`224` samples)
- active queue scanlines: `0`
- max active descriptors: `0`
- active spans: none
- representative queue fields:
  - `dp_0053`: `248 (0xF8)`
  - `dp_0054`: `248 (0xF8)`
  - `wram_0053`: `248 (0xF8)`
  - `wram_0054`: `248 (0xF8)`
  - `wram_0055`: `144 (0x90)`
  - `wram_0056`: `21 (0x15)`
  - `queue_dma_nonzero_entry_count`: `32 (0x20)`
  - `queue_dma_active_descriptor_count`: `0 (0x0)`
  - `queue_dma_active_entries`: `[]`

## Differences vs First Frame

### Frame `3400`

- `dp_0053`:
  - baseline: `112`
  - current: `224`
- `dp_0054`:
  - baseline: `112`
  - current: `224`
- `wram_0053`:
  - baseline: `112`
  - current: `224`
- `wram_0054`:
  - baseline: `112`
  - current: `224`
- `wram_0055`:
  - baseline: `24`
  - current: `144`
- `wram_0056`:
  - baseline: `18`
  - current: `21`
- `activity`:
  - baseline: `{"active_descriptor_count_max": 1, "active_scanline_count": 178, "active_scanline_spans": [{"active_descriptor_count": 1, "active_entries": [{"bytes_hex": "01b8b41520008061", "command": 1, "offset": 112, "slot": 14, "source_addr": 1422520, "transfer_size": 32, "vram_dest": 24960, "words": [47105, 5556, 32, 24960]}], "end_scanline": 223, "scanline_count": 178, "start_scanline": 46}]}`
  - current: `{"active_descriptor_count_max": 0, "active_scanline_count": 0, "active_scanline_spans": []}`

### Frame `3550`

- `dp_0053`:
  - baseline: `112`
  - current: `248`
- `dp_0054`:
  - baseline: `112`
  - current: `248`
- `wram_0053`:
  - baseline: `112`
  - current: `248`
- `wram_0054`:
  - baseline: `112`
  - current: `248`
- `wram_0055`:
  - baseline: `24`
  - current: `144`
- `wram_0056`:
  - baseline: `18`
  - current: `21`
- `activity`:
  - baseline: `{"active_descriptor_count_max": 1, "active_scanline_count": 178, "active_scanline_spans": [{"active_descriptor_count": 1, "active_entries": [{"bytes_hex": "01b8b41520008061", "command": 1, "offset": 112, "slot": 14, "source_addr": 1422520, "transfer_size": 32, "vram_dest": 24960, "words": [47105, 5556, 32, 24960]}], "end_scanline": 223, "scanline_count": 178, "start_scanline": 46}]}`
  - current: `{"active_descriptor_count_max": 0, "active_scanline_count": 0, "active_scanline_spans": []}`

