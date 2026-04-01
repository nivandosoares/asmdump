# SentrySearch Gameplay Chunk Workflow

- Date: `2026-04-01`
- Local-only inputs:
  - `sentrysearch/`
  - `sentrysearch/video/the_duel_longplay.mp4`
- Git rule:
  these inputs are investigation aids only and are ignored by the repo root
  `.gitignore`

## Why This Exists

Lane 3 already has human-reviewed longplay anchors, but those anchors were
still awkward to turn into repeatable search windows. The attached
SentrySearch repo is now used as the chunking backend for that lookup step.

The current checkpoint does **not** assume a prebuilt semantic index:

- `cd sentrysearch && uv run sentrysearch stats`
  currently reports an empty index
- there is no hidden local vector database to depend on

So the first promoted workflow uses the attached chunker directly to create
repeatable time windows and query vocabulary without committing the tool or the
video into this repo.

## Promoted Tooling

- Builder:
  - `tools/build_sentrysearch_chunk_manifest.py`
- Generated artifacts:
  - `tools/out/sentrysearch_longplay_anchor_chunks.json`
  - `tools/out/sentrysearch_longplay_anchor_chunks.md`

## What Was Run

- `python3 -m py_compile tools/build_sentrysearch_chunk_manifest.py`
- `python3 tools/build_sentrysearch_chunk_manifest.py sentrysearch/video/the_duel_longplay.mp4 --window 'bridge:1802:90:bridge crossing|purple water|mountain horizon|traffic right lane' --window 'tunnel:2028:90:tunnel driving|dark tunnel walls|mountain wall corridor' --window 'rain:2688:90:rain segment|windshield droplets|traffic ahead' --window 'snow:3570:120:snow onset|snow mountain curve|log truck ahead' --json-out tools/out/sentrysearch_longplay_anchor_chunks.json --markdown-out tools/out/sentrysearch_longplay_anchor_chunks.md`

## Current Chunk Windows

- `bridge`
  - window: `30:02 -> 31:32`
  - query terms:
    `bridge crossing`, `purple water`, `mountain horizon`,
    `traffic right lane`
- `tunnel`
  - window: `33:48 -> 35:18`
  - query terms:
    `tunnel driving`, `dark tunnel walls`, `mountain wall corridor`
- `rain`
  - window: `44:48 -> 46:18`
  - query terms:
    `rain segment`, `windshield droplets`, `traffic ahead`
- `snow`
  - window: `59:30 -> 01:01:30`
  - query terms:
    `snow onset`, `snow mountain curve`, `log truck ahead`

## Practical Use

- Use the Markdown artifact when you need a fast bounded review window.
- Use the JSON artifact when a later tool wants exact chunk boundaries.
- If a future turn decides the semantic index is worth building, start from one
  promoted window first instead of indexing the full longplay blindly.

## Next Best Step

- Pick one named window and use it to drive the next bounded gameplay capture
  or later SentrySearch indexing pass.
- Keep the result tied back to the existing anchor notes rather than creating a
  second parallel naming scheme.
