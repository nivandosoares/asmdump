# Bank 2 Gameplay Builder `02:90B2 -> 02:9551` In Human Terms

Date: `2026-04-08`

This note covers the next heavy bank-2 builder block adjacent to the
anonymous `02:9016` control gate:

- `L0110B2` at `02:90B2`
- `L011551` at `02:9551`

The current best read is that this is a real gameplay precompute/builder
pass, not a tiny UI helper. It materializes player/rival-derived working
tables during gameplay entry/setup before the later gameplay helper families
run.

## Entry Context

`L0110B2` is structurally simple:

```asm
L0110B2:
    php
    phb
    phk
    plb
    rep #$30
    jsr L011551
    plb
    plp
    rtl
```

That means the important logic is all inside `L011551`.

The strongest currently proven caller is bank 1 at `L009075`, after the
front-end derived bundle has already been collapsed and after the selected
`$1C78` / `$1C7A` VRAM chunks have been staged.

The newest boundary correction is important:

- there is no direct fallthrough from `02:9016` into `L0110B2`
- `02:9016` returns on every currently visible path
- `L0110B2 -> L011551` is therefore best read as a separate bank-1-invoked
  setup/build stage, not as part of the per-frame callback body itself

So this block is best read as:

- front-end has already chosen the player-facing selector state
- bank 1 has already collapsed that into gameplay-facing fields
- bank 1 explicitly invokes this builder
- bank 2 now builds the runtime working set from those choices

## Inputs That Matter

The most important visible inputs are:

- `$1C78`
  - the earlier 3-slot front-end car-facing selector surface
- `$1C7A`
  - the downstream rival/no-opponent-derived selector
  - earlier bank-1 work now closes this as:
    - `0..2` for rival lanes
    - `0` forced for the no-opponent lane
- `$1C76`
  - rival-present flag from the same bank-1 collapse
- `$1CCA`
  - derived bundle field that changes spacing/range defaults later in the
    builder
- `$1C6C`
  - another earlier bank-1 selector/collapse field used to choose a small
    transform profile
- `$0996`
  - transition gate that can force that transform-profile index to `3`

## Stage 1: Build the Rival/Secondary Working Tables

The first half of `L011551` uses `$1C7A` twice:

- `02:8306` pointer family -> copied into `$14DC`
- `02:830C` pointer family -> copied into `$13FC`

Those are bank-local pointer tables with three entries each:

- `02:8306`: `8000`, `8102`, `8204`
- `02:830C`: `8090`, `8192`, `8294`

The code copies:

- `0x0120` bytes worth of words into `$14DC`
- `0x0072` bytes worth of words into `$13FC`
- while tracking the max word into `$1CFE`

Current human read:

```c
load_profile_tables(selector_1c7a, table_8306, state_14dc, &state_1cfe);
load_profile_tables(selector_1c7a, table_830c, state_13fc, NULL);
```

This is already strong evidence that the first half of the builder is loading
one full runtime profile from a compact selector-local bank-2 table family.

## Stage 2: Seed a Temporary Runtime and Grow a Span Map

After loading the `$1C7A` tables, `L011551`:

- clears `$117D..` through `L013400`
- seeds the main geometry/state fields:
  - `$137C = 1`
  - `$1C9C = 0x0400`
  - `$1C9E/$1CA2 = $1426`
  - `$1CA0/$1CA4 = $1434`
  - `$1CA6 = $141A`
- temporarily forces `$1C74 = 1`
- runs `L0112FA`
- stores `$09` into `$1CF4`
- stores `$1C94` into `$137E`
- clears `$1A28[0..0x01FE]`

Then it enters the main loop at `L0115E3`:

- snapshot `11CD -> 11D1`
- increment `$12A3`
- call `L01397E`
- if `11D4 < 11CE`, write a repeated value across a slice of `$1A28`
- remember the new `(12A3, 11CD)` pair in `$12A5/$11D3`
- loop until:
  - `$137C == $13FC`
  - `$118B == 0`
  - `$11CD == $11D1`

That produces a converged span-like map in `$1A28` and final checkpoint words:

- `$1CF0 = $11CD`
- `$1CF2 = $149A`

Current human pseudocode:

```c
void build_secondary_profile_from_1c7a(void) {
    load_selector_profile(selector_1c7a);
    seed_runtime_defaults();
    force_runtime_mode_for_build();
    precompute_curve_tables();

    clear_span_map_1a28();
    while (!build_has_converged()) {
        step_runtime_geometry_once();   // L01397E
        stamp_current_slice_into_1a28();
    }

    state_1cf0 = state_11cd;
    state_1cf2 = state_149a;
}
```

The exact semantic names are still open, but the control shape is no longer
ambiguous: this is a builder producing a converged map, not a one-frame HUD
update.

## Stage 3: Apply a Small Transform Profile

After the first build converges, `L011551` uses a small embedded lookup pair:

- bytes read from `02:954D + X`
- bytes read from `02:9549 + X`

with:

- `X = $1C6C`
- except when `$0996 != 0`, it forces `X = 3`

This is notable because the routine is reading literal bytes out of the code
region near itself as compact data constants.

Current observed byte sets are:

- transform byte family at `02:9549`: `80 D9 99 00`
- paired high-byte family at `02:954D`: `64 AA 78 FA`

Behavior:

- the second byte family is packed into `$1C6E` as the high byte
- if the first byte family entry is nonzero, that byte is passed with every
  `$1A28` entry through `L01335D`

Current human read:

```c
int profile = (state_0996 != 0) ? 3 : state_1c6c;
state_1c6e = transform_high_table[profile] << 8;

if (transform_byte_table[profile] != 0) {
    for (i = 0; i < 0x100; i++) {
        state_1a28[i] = apply_small_transform(state_1a28[i],
                                              transform_byte_table[profile]);
    }
}
```

The exact meaning of this transform is still open, but it is clearly a
profile-specific post-process over the freshly built span map.

## Stage 4: Rebuild the Active/Primary Profile from `$1C78`

The routine then repeats the same local table load shape, but now keyed by
`$1C78` instead of `$1C7A`:

- `02:8306[$1C78] -> $14DC`
- `02:830C[$1C78] -> $13FC`

This is the strongest current reason to read the whole function as a
two-profile builder:

- first pass: rival/no-opponent-derived profile
- second pass: active player-facing profile

The function then:

- snapshots or restores a small state bundle through `$146E/$1470..$147A`
- calls `L0117FE`
- resets several defaults around:
  - `$1C9C`
  - `$11F1`
  - `$1CC4`
  - `$11DF`
  - `$12AD`
  - `$1CB6`
  - `$129B/$125D`
- if `$1C76 != 0`, it seeds the extra rival-present lane:
  - second slot count
  - `$1283 = 2`
  - `$11E1 = $11DF - 0x00C0`
  - `$11F3 = $11F1 - 1`
  - `$125F = 0xFFFE`
  - `$1271 = 2`

Current human pseudocode:

```c
void build_primary_profile_from_1c78(void) {
    load_selector_profile(selector_1c78);
    preserve_or_restore_seed_state_bundle();
    run_primary_profile_builder();   // L0117FE
    seed_runtime_defaults_after_build();

    if (rival_lane_present()) {
        seed_second_lane_runtime_fields();
    }
}
```

## Current Best Interpretation

This is an inference from the proven control/data shape, but it is now a
strong one:

- `$1C78` is the player-facing/front-end car selector
- `$1C7A` is the rival/no-opponent-derived selector
- `L011551` builds one converged profile from the rival-side selector,
  transforms its span map, then rebuilds the active profile from the
  player-side selector
- `$1A28` is not a UI list; it is a generated runtime map/curve/span surface
  consumed by later gameplay helpers

In plain language:

```c
void bank2_build_gameplay_profiles(void) {
    secondary = build_profile(selector_1c7a);   // rival / no-opponent side
    secondary_span_map = postprocess_span_map(secondary);

    primary = build_profile(selector_1c78);     // active player-facing side
    seed_runtime_for_primary_and_optional_rival(primary, secondary_span_map);
}
```

## Why This Matters

This is the first strong human read for a bank-2 routine that turns the
front-end-derived selectors into deeper gameplay runtime state instead of only
staging HUD or OAM rows.

That is useful to the dev team because it narrows the architecture:

- bank 1 chooses and collapses selectors
- bank 1 then explicitly calls bank-2 `L011551` to materialize those choices
  into generated runtime tables
- later bank-2 / bank-10 / bank-11 helpers consume that generated state

## Open Questions

- what exact real-world quantity does `$1A28` encode: lane centerline,
  span width, depth progression, or another road/runtime curve?
- what exact meanings do `$14DC` and `$13FC` carry after the local pointer
  loads?
- what real selector dimension does `$1C6C` represent when choosing the small
  transform profile?
- how directly does this builder feed the late `02:9016` branch family that
  eventually chooses the queue-backed SNES-bank-`$15` object stream?
