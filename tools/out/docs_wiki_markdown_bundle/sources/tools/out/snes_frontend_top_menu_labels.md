# SNES Front-End Top Menu Labels

- Claim: the separate top-level `3`-option gate on `$1C6A` uses `1E:8000` rows
  `15..17` as the visible signboard labels.
- Code anchor: `01:BAC3`
- Selector expression: `$1C6A + 0x000F`
- Table base: `1E:8000`

| `$1C6A` | Row | Label | Target | Preview |
| ---: | ---: | --- | --- | --- |
| `0` | `15` | `Game Options` | `1E:B26C` | `tools/out/frontend_top_menu_rows_0f_11/frontend_row_15_preview.png` |
| `1` | `16` | `Play TDII` | `1E:B7D4` | `tools/out/frontend_top_menu_rows_0f_11/frontend_row_16_preview.png` |
| `2` | `17` | `High Score` | `1E:BC3C` | `tools/out/frontend_top_menu_rows_0f_11/frontend_row_17_preview.png` |

## Notes

- This closes the earlier heuristic read of the initial signboard menu with
  direct ROM-side label renders.
- The second label is promoted as `Play TDII` because that is the exact text
  visible in the rendered row preview.
- Composite preview: `tools/out/snes_frontend_top_menu_signboards.png`
