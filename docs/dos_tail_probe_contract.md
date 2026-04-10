# DOS Tail Probe Contract

This note closes the next bounded question after the front-page field map:
what the post-`12288` fragment in four-page `*ST.PES` assets currently looks
like.

## Current bounded read

The best current interpretation is continuity-first, not footer-first:

- keep using `P959ST.PES` vs `ROSSST.PES` as the control pair
- treat the post-`12288` fragment in four-page assets as continued packed
  payload until a stronger contrary marker appears
- avoid building a renderer API around an assumed shared footer/table

## Why this is now stronger

- `P959ST.PES` and `ROSSST.PES` still share the same visible layout family:
  - `window_only_tokens`
  - params `[5, 25]`
- but they diverge exactly where the page-class split becomes interesting:
  - `P959ST.PES` is still a `three_page_stream`
  - `ROSSST.PES` is still a `four_page_tail_stream`
- current four-page tail starts do not share a common prefix:
  - `VETT/ROSS`: `0`
  - `VETT/COUN`: `0`
  - `ROSS/COUN`: `0`
- same-file continuity currently beats cross-file tail similarity for every
  promoted four-page asset:
  - `VETT`: `0.6745 > 0.6211`
  - `ROSS`: `0.8144 > 0.7689`
  - `COUN`: `0.9230 > 0.7689`

That is not proof of the decoder yet, but it is enough to weaken the current
shared-footer hypothesis and keep the next experiments centered on stream
continuation.

## Tooling

- builder:
  - `tools/build_dos_tail_probe_contract.py`
- smoke:
  - `tools/tests/test_dos_tail_probe_contract.py`
- generated artifacts:
  - `tools/out/dos_tail_probe_contract.json`
  - `tools/out/dos_tail_probe_contract.md`

## Run it

```sh
python3 tools/build_dos_tail_probe_contract.py \
  --preview-manifest tools/out/dos_preview_manifest.json \
  --data-dir ../Downloads/testdrive2 \
  --json-out tools/out/dos_tail_probe_contract.json \
  --markdown-out tools/out/dos_tail_probe_contract.md

python3 tools/tests/test_dos_tail_probe_contract.py
```

## Next gate

Use the new continuity-first read to recover one directly proven subregion
inside the four-page tail path:

1. test whether an early tail window continues the same token/bitstream rules
   as the preceding page
2. only promote a footer/table interpretation if a repeated structure appears
   across `ROSSST.PES`, `COUNST.PES`, and `VETTST.PES`
