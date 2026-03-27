# SNES Front-End Top Menu Transitions

- Claim: the top-level `$1C6A` signboard menu now has closed branch semantics.
- Entry routine: `01:BAE8`
- Decision site: `01:BB7F`

| `$1C6A` | Label | Branch | Semantic target | Follow-on |
| ---: | --- | --- | --- | --- |
| `0` | `Game Options` | `01:BB8D` | `L00C0C7` configuration menu loop | installs callback `01:BF7A`, which uses rows `0x15..0x1B` for the control/sound settings labels |
| `1` | `Play TDII` | `01:BB7F` fallthrough | downstream play/setup corridor | returns success to `L008B31`, which falls through to `L008B3E` and enters the separate `$0202/$1C78` three-slot corridor |
| `2` | `High Score` | `01:BB93` | `L00A3CC` high-score surface | enters `L00A3CC` and then returns to the top menu loop |

## Notes

- This closes the semantic meaning of the three top-level signboards, not just
  their rendered text.
- `Game Options` is now statically tied to the already decoded settings-label
  family `0x15..0x1B`.
- `Play TDII` is the only top-level option that advances into the later
  `$0202` front-end corridor.
