# Bank1 Helper Provenance

- Frame: `1500`
- Layer: `bg2`
- Target probe state: `$0202=1`, `$0204=3`, `$0208=13`, `$020A=40131`, `$0054=136`
- Helper bundle: index `10`

## Layer Read

- `tilemapBaseWords = 0x1000`
- `chrBaseWords = 0x3000`
- visible nonzero bbox: `{'screenTileLeft': 0, 'screenTileTop': 15, 'screenTileRight': 31, 'screenTileBottom': 27, 'screenPixelLeft': 0, 'screenPixelTop': 120, 'screenPixelRight': 255, 'screenPixelBottom': 223}`
- visible tile index span: `1..217`
- visible palette indices: `[0]`

## Runtime Anchor

- last `L00A9A0` hit at/before frame `1500` with matching `$0202/$0208`: frame `1304` -> `00:B6B2`
- last `L00A9CB` hit at/before frame `1500` with matching `$0202/$0208`: frame `1310` -> `0E:91FE`

## Bundle Match

- `L00A9A0` helper `10` stages paged VRAM from `00:B6B2` to `0x1000`
- `L00A9CB` helper `10` stages bulk VRAM from `0E:91FE` to `0x3000`
- tilemap base match: `True`
- CHR base match: `True`

## Reading

- The frame-level BG surface is anchored to the same bank1 helper bundle seen earlier in runtime trace.
- `L00A9A0` explains the live BG tilemap base and `L00A9CB` explains the live BG CHR base.
- If the `26FB` validation on the bulk source fails with an early-end mismatch, treat that as the existing partial-bulk frontier, not as evidence against the helper match.
