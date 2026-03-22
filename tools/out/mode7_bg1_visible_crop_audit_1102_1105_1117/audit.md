# Mesen visible crop audit

- layer: `bg1`
- frames audited: `3`
- exact matches: `3` / `3`

| frame | full size | visible size | scroll raw | scroll normalized | mismatch | bbox |
|---:|---|---|---|---|---:|---|
| `1102` | `1024x1024` | `256x224` | `0,8191` | `0,0` | `0` | `-` |
| `1105` | `1024x1024` | `256x224` | `0,8191` | `0,0` | `0` | `-` |
| `1117` | `1024x1024` | `256x224` | `0,8191` | `0,0` | `0` | `-` |

## Reading

- `0` mismatched pixels means the bridge `*_visible.ppm` is exactly the wrap-cropped viewport of the full `*.ppm` layer render.
- This validates the extractor-side semantics independently of the renderer and supports treating `layers/bg1_visible.ppm` as a viewer/export surface rather than an on-screen contribution target.
