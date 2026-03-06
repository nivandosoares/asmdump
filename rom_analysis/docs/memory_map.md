# Memory Map (Archaeology Baseline)

This map captures currently confirmed runtime memory ownership used by
the control kernel and intro bootstrap path. It is the working baseline
for gameplay-era tracing.

## Callback and Scheduler State

| Address | Meaning | Notes |
|---|---|---|
| `$0038-$003A` | Active main callback pointer | Indirect `jmp [$0038]` during NMI tail |
| `$003B-$003D` | Active NMI callback pointer | Promoted from `$096F-$0971` |
| `$003E-$0040` | Active IRQ callback pointer | Split/timer IRQ path |
| `$096C-$096E` | Pending main callback pointer | Staged by `L000385` |
| `$096F-$0971` | Pending NMI callback pointer | Staged by `L0003A0` |

## Frame, Input, and Display State

| Address | Meaning | Notes |
|---|---|---|
| `$0960-$0961` | Joypad 1 sample | Copied from `JOY1L` in NMI |
| `$0962-$0963` | Joypad 2 sample | Copied from `JOY2L` in NMI |
| `$0964-$0965` | Frame counter | Incremented each frame when enabled |
| `$0966` | Display shadow (`INIDSP`) | Brightness / forced blank shadow |
| `$51` | NMI reentry guard | Non-zero while NMI in progress |

## DMA / PPU Queue State

| Address | Meaning | Notes |
|---|---|---|
| `$53` | DMA queue read pointer | Into `$0600` descriptor queue |
| `$54` | DMA queue write/end pointer | Advanced by queue producers |
| `$0600+` | VRAM DMA descriptor queue | 8-byte records consumed in NMI |
| `$0700+` | OAM staging buffer | DMA to `$2104` when `$096A != 0` |
| `$0968` | Main DMA queue gate | Controls queue pass in NMI |
| `$096A` | OAM DMA pending flag | Set by producers, cleared after DMA |
| `$0972-$0973` | NMI DMA budget | Used while consuming `$0600` queue |

## Bootstrap Allocator / Tile Refresh State

| Address | Meaning | Notes |
|---|---|---|
| `$09AA` | VRAM page dedup table | Managed by `$0098FF` path |
| `$09A0` | Allocation count | Used by allocator + TTL sweep flow |
| `$0AAA` | TTL table | Swept by `L00158F` |
| `$0A2A` | Node map | Allocator free-list metadata |
| `$0B2A` | Block size table | Allocator splitting metadata |
| `$0D2C` | Back-pointer table | Allocator metadata |

## Bank 30 Compressed Content Windows

Validated with `tools/validate_td2_chunks.py` against `tools/out/bank30_headers.json`.

| Bank30 offset window | CPU range | Reading |
|---|---|---|
| `[0x1681, 0x168C)` | `1E:9681..1E:968B` | `42FB` control/sentinel block (`0` output). |
| `[0x5A96, 0x73B3)` | `1E:DA96..1E:F3B2` | Confirmed `67FB` word-mode stream (`28620` output bytes). Includes nested marker candidates (`26FB/67FB`) that require caller-level confirmation before treating as independent starts. |
| nested starts in `[0x5A96,0x73B3)` | `1E:DF6C/E039/E73F/E800/EE7F` | Confirmed as independent `26FB` entries by bank-1 pointer tables (`01:A789/01:A7D3` and `01:A842/01:A888`). |
| runtime `L001210` hits (no-input, `3600` frames) | `1E:DF6C/E039/E73F/E800` | Each hit twice in one attract-loop window (`frames 1280..2712`); destination pointer staged as `7E:2000`; repeat spacing `1418` frames. |
| runtime no-hit set (same run) | `1E:9681/DA96/E91F/EE7F` | Not observed on the deterministic no-input attract path; likely path-conditional or later-scene dependent. |

## Open Mapping Priorities

1. Confirm bank 0 -> bank 30 gameplay callback transition addresses.
2. Map bank 10/11 working state regions (vehicle, AI, rasterizer tables).
3. Identify stable track/scenario tables and text/string buffers.
4. Identify audio command queues and SPC handoff state.
