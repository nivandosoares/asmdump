# Post-02:9016 Visual Semantics

### CLAIM AUDIT

- Claim:
  The first stable visible rival-vs-no-opponent divergence in frames
  `2048..2088` is an OAM-side top-strip marker controlled by the
  rival-enabled state `$1C76` through `state_11f3 -> oam_0730` staging in
  bank-2 gameplay code.
- Classification:
  `VERIFIED`
- Evidence:
  - [post9016_compare_summary.json](/home/nivando-soares/asmdump/tools/out/post9016_compare_summary.json)
    localizes all sampled image deltas in `2048..2088` to the same top-strip
    bounding box `(11, 11, 194, 21)`.
  - Human review of
    [post9016_compare_questions.md](/home/nivando-soares/asmdump/tools/out/post9016_compare_questions.md)
    answers that the default-rival lane shows a red rival marker absent from
    the no-opponent lane, that the lower cockpit/dashboard remains unchanged,
    and that the observed difference disappears with OAM disabled.
  - `bank2.asm:1145-1165` (`L0108EF`) stages `oam_072c` from `state_11f1`,
    conditionally stages `oam_0730` from `state_11f3` only when `$1C76 != 0`,
    and stages `oam_0734` from `state_11f5`.
  - [post9016_extended_state_compare.json](/home/nivando-soares/asmdump/tools/out/post9016_extended_state_compare.json)
    shows stable whole-window differences `oam_0730 = 4618 -> 57600`,
    `state_11f3 = 44 -> 0`, `$1C76 = 1 -> 0`, and `$1C70 = 0 -> 3`.
  - The same extended compare keeps `oam_072c` and `oam_0734` identical
    across the window, matching the visual read that the split is the extra
    rival marker rather than the whole cockpit HUD.
- Notes:
  - This closes the first stable gameplay-visible split as rival-only OAM
    ownership.
  - The user also reports rival blinking lights in the rearview as the first
    meaningful cue, but that finer rearview mapping is not yet tied to a
    specific state field in this checkpoint.
