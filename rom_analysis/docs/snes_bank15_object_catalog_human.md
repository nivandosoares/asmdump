# SNES Bank `$15` Object Catalog In Human Terms

Date: `2026-04-08`

This note rewrites the currently promoted late-gameplay object proof into
plain language for the dev team.

Important naming clarification:

- the proven object address is `15:B4A8` in **SNES bank notation**
- in this repository, that SNES bank maps to [bank21.asm](/home/nivando/asmdump/bank21.asm)
- it does **not** map to [bank15.asm](/home/nivando/asmdump/bank15.asm)

## What Is Actually Proven

At late gameplay frame `3250`, one visible DMA descriptor survives on the
queue across scanlines `46..223`:

- descriptor words:
  - `0xB801`
  - `0x15B4`
  - `0x0020`
  - `0x6180`
- decoded read:
  - source: `15:B4B8`
  - transfer size: `0x20` bytes
  - destination: `VRAM 0x6180`

That queued upload is the strongest current explanation for why frame `3250`
cannot be closed by seeded end-frame `VRAM/CGRAM/OAM` alone.

## Object Table Read

The current promoted object family begins at:

- table start: `15:B4A8`

The strongest current human read is:

```c
typedef struct {
    uint16_t chunk_count;   // proven: 0x0001
    uint16_t tile_count;    // proven: 0x0001 -> 0x20 bytes
    uint16_t meta0;         // still unnamed
    uint16_t meta1;         // still unnamed
    // chunk descriptors / metadata follow
    uint8_t payload[];      // first proven payload byte at 15:B4B8
} SnesBank15Object;
```

For the promoted `3250` object:

- `word0 = 0x0001`
- `word1 = 0x0001`
- payload start = `table + 8 * chunk_count + 8 = 15:B4B8`

That payload address matches the live visible descriptor exactly.

## Queue Builder Read

The queue descriptor is no longer best read as an ad hoc copy. It fits the
bank-0 builder family rooted at:

- `L001895`
- `L001A70`

Current human pseudocode:

```c
QueueDesc build_object_upload(uint16_t object_index) {
    RomPtr object = object_pointer_table[object_index];

    uint16_t chunk_count = read16(object + 0);
    if (chunk_count == 0) {
        return no_work();
    }

    uint16_t tile_count = read16(object + 2);
    uint16_t transfer_size = tile_count * 0x20;
    RomPtr payload = object + 8 * chunk_count + 8;

    uint16_t vram_slot = allocate_or_reuse_tile_page(object, tile_count);

    QueueDesc desc = {
        .command = 0x0001,
        .source = payload,
        .size = transfer_size,
        .vram_dest = (vram_slot << 4) + state_099A,
    };
    write_desc_to_0600_queue(desc);
    return desc;
}
```

For the promoted `3250` case, that read closes to:

```c
QueueDesc desc = {
    .command = 0x0001,
    .source = 0x15B4B8,
    .size = 0x0020,
    .vram_dest = 0x6180,
};
```

## Why This Matters To The Port

The practical constraint is now clearer:

- the unresolved `3250` surface is not “some mysterious missing layer”
- it is a **transient queue-backed BG1 CHR upload**
- that upload is selected during the active gameplay callback family
  `02:9016 / 01:96A0`
- the final seeded bundle does not preserve that visible-phase upload state

So the port target is not only “load the end-frame bundle more accurately”.
The stronger target is:

1. identify the gameplay-side selector that chooses this SNES-bank-`$15`
   object family
2. model the queue-backed upload handoff
3. let NMI materialize the selected object into visible VRAM

## What Is Still Open

These points are **not** closed yet:

- the semantic names of the object words after `chunk_count/tile_count`
- the exact selector path inside `02:9016 .. 02:90B2`
- the exact IRQ-side contribution from `01:96A0`
- whether more late-entry objects share the same family or this is one narrow
  one-tile special case

## Current Team Pseudocode

```c
void gameplay_029016_late_entry_step(void) {
    update_gameplay_state();
    update_visible_split_state();   // paired IRQ family 01:96A0

    if (needs_late_bg1_object()) {
        SnesBank15Object obj = select_bank15_object();
        QueueDesc desc = build_object_upload(obj.index);
        queue_dma_descriptor(desc);
    }
}
```

That is the strongest current human read for the dev team.
