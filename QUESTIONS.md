# QUESTIONS

Review generated on 2026-03-18.

Scope reviewed:
- Root repo structure and build files
- `port/` SDL runtime
- `tools/` Python tooling and `tools/mesen_ppu_extract/` C# bridge
- `validation/` Lua and shell automation
- docs/contracts that define current behavior

Quick review notes:
- I did not find any frontend pages or HTTP/API endpoints in this repository.
- The root `bank*.asm` files look like reverse-engineering reference banks more than ordinary hand-edited feature modules, so the questions below focus on their architectural role rather than line-by-line style feedback inside every bank file.
- Bounded validation run during review:
  - `python3 -m py_compile tools/*.py` passed
  - `make -C port` passed

How to answer:
- Reply inline under each question.
- If a question is actually a bug, say so explicitly.
- If a behavior is intentional, say that too.
- If you already know the fix direction, note it so the next pass can implement it directly.

Suggested answer format:

```md
Answer:
Decision:
Follow-up:
```

## 1. Product Boundaries And Source Of Truth

### Q001
Question: What is the real deliverable boundary for this repository today: reverse-engineering workspace, internal tooling lab, playable SDL prototype, or future ship-ready port?
Observed in: `PORT_PLAN.md`, `docs/technical_overview.md`, `port/README.md`, `tools/README.md`
Why it matters: almost every architectural tradeoff changes depending on whether this repo is an internal archaeology lab or a product runtime.
Answer: Today this repo is an integrated reverse-engineering workspace plus internal tooling lab plus playable SDL prototype. It is not a ship-ready port yet.
Decision: Treat archaeology, extraction tooling, validation harnesses, and the SDL runtime as one active product surface in the current milestone.
Follow-up: Add one canonical root overview that says this explicitly and stop implying broader runtime completeness than we actually have.

### Q002
Question: Should the root `bank*.asm`, `main.s`, `snes.asm`, and `spc700.asm` remain the long-term reference source-of-truth, or are they only temporary scaffolding for the C/SDL port effort?
Observed in: repo root
Why it matters: it affects naming cleanup, directory layout, documentation effort, and how much automation should be built around the assembly corpus.
Answer: They remain the reference source-of-truth for ROM behavior and archaeology, but not the implementation source-of-truth for the PC port runtime.
Decision: Keep building automation around the assembly corpus for provenance and verification, while treating extracted formats plus C/SDL code as the port-side implementation surface.
Follow-up: When the layout cleanup happens, move the assembly corpus under a clearer `disassembly/` or `asm/` root without changing its reference status.

### Q003
Question: I did not find any web pages or HTTP endpoints. Is that expected, and should any future browser/API work live outside this repository?
Observed in: full repo scan
Why it matters: it clarifies whether the architecture should stay desktop/tooling-focused or prepare for additional app surfaces.
Answer: That is expected. This repository is desktop/tooling-focused.
Decision: Any future browser or HTTP/API surface should live outside this repo unless it is directly required for archaeology or asset-tool workflows.
Follow-up: Document that no web/API layer is in scope for the current plan.

### Q004
Question: Is it intentional that reverse-engineering notes, runtime code, emulator automation, generated assets, and tool build outputs all live in one workspace instead of being split into clearer source/generated domains?
Observed in: repo root, `port/`, `tools/`, `rom_analysis/`, `validation/`
Why it matters: the current structure works for archaeology, but it makes ownership, cleanup, CI, and onboarding harder.
Answer: Yes, that is intentional for the current archaeology-heavy phase, but the source/generated boundaries inside the workspace are too loose.
Decision: Keep one repo for now, but tighten domain boundaries inside it instead of splitting into multiple repos prematurely.
Follow-up: Define promoted-vs-scratch artifact policy and separate committed templates/reference assets from machine-local build output.

### Q005
Question: Are the Python and C# tools internal-only developer tools, or do you want them treated as supported public workflows for other contributors?
Observed in: `tools/README.md`, `tools/Makefile`, `tools/mesen_ppu_extract/`
Why it matters: internal scripts can stay rougher; supported workflows need stronger contracts, portability, and error handling.
Answer: They are supported contributor workflows for archaeology contributors, not end-user public APIs.
Decision: Core workflows need stronger contracts and portability; one-off experiment scripts can stay rough until promoted.
Follow-up: Mark which tools are promoted workflows versus scratch probes in `tools/README.md`.

### Q006
Question: Should there be one canonical high-level repository overview instead of requiring people to piece the project together from `PORT_PLAN.md`, `docs/technical_overview.md`, `tools/README.md`, and `port/README.md`?
Observed in: docs spread across multiple entry points
Why it matters: onboarding cost is high right now, and the architecture is hard to infer without reading several long documents.
Answer: Yes.
Decision: Create one canonical high-level overview and keep the current docs as detailed subsystem references.
Follow-up: Add a root `README.md` or equivalent that defines scope, current milestone, repo layout, and supported workflows.

### Q007
Question: When roadmap/checkpoint docs and local code/tool behavior drift, do you want docs updated immediately, or is some lag acceptable during exploration-heavy work?
Observed in: `PORT_PLAN.md`, `rom_analysis/docs/next_steps_roadmap.md`, `rom_analysis/docs/progress_checkpoints.md`
Why it matters: several tools now look like they have become de facto source-of-truth before the docs fully catch up.
Answer: Short-lived drift during active probing is acceptable, but promoted behavior and current-best artifacts need to be documented in the same turn.
Decision: By end of a substantive turn, docs must catch up on any changed project reality that affects current reading, gates, or recommended next step.
Follow-up: Keep treating `PORT_PLAN.md` and roadmap/checkpoint docs as authoritative summaries, not optional lagging notes.

### Q008
Question: Do you want a canonical machine-readable registry for callback names, bank labels, and important SNES addresses instead of repeating raw addresses like `01:A39C`, `01:9FE5`, and `L001210` across many docs and scripts?
Observed in: `tools/README.md`, `rom_analysis/docs/*.md`, `validation/*.lua`, `tools/*.py`
Why it matters: stringly-typed addresses are easy to drift, typo, and rename inconsistently.
Answer: Yes.
Decision: Add a canonical machine-readable registry and have tools/docs refer to it where practical.
Follow-up: Start with callback names, chunk dispatcher labels, and the bank-0/bank-1 anchors already used in contracts and validation.

### Q009
Question: Should the many generated JSON/text formats in this repo gain explicit schema versions?
Observed in: `tools/out` conventions, `design_pack.json`, `sequence.json`, `td2_boot_probe.json`, `*_provenance.jsonc`
Why it matters: a lot of scripts are coupled through ad hoc fields with no compatibility/version story.
Answer: Yes, for any format that is consumed by multiple tools or committed as a promoted artifact.
Decision: Version shared formats; allow truly scratch one-off outputs to remain unversioned until promoted.
Follow-up: Start with `ppu_state.json`, `design_pack.json`, `sequence.json`, probe outputs, and provenance outputs.

### Q010
Question: Do you want one canonical ROM hash/profile documented for all current archaeology and validation artifacts?
Observed in: `game.smc` is used everywhere, but I did not see a formal ROM identity contract in the reviewed code paths
Why it matters: reproducibility is weak if the same filenames can point to different ROM revisions.
Answer: Yes.
Decision: Define one canonical ROM identity contract and treat it as required context for archaeology and validation outputs.
Follow-up: Document ROM hash/profile in `validation/README.md` and reference it from the main overview and promoted artifact manifests.

### Q011
Question: Should answers in this `QUESTIONS.md` later be promoted into ADRs/specs, or is this file meant to remain the long-lived design memory?
Observed in: requested workflow for this file
Why it matters: it changes how much structure and permanence future decisions should have.
Answer: Durable decisions should be promoted; this file is review memory, not the long-lived source-of-truth.
Decision: Treat `QUESTIONS.md` as a decision-capture staging document, not the permanent contract.
Follow-up: Promote anything durable into a root overview, ADR, or subsystem spec after this review pass.

### Q012
Question: Is Linux-only support acceptable for this codebase right now?
Observed in: `/proc/self/exe` in `port/src/main.c`, Linux shell scripts, `.so` bindings in `tools/mesen_ppu_extract/Program.cs`
Why it matters: several implementation choices are currently Linux-specific, not just "untested elsewhere".
Answer: Yes, Linux-only support is acceptable right now.
Decision: Declare the repo Linux-first instead of pretending broader portability today.
Follow-up: Document Linux-only support explicitly and remove silent portability assumptions from docs.

### Q013
Question: Is the flat root-level placement of all `bank*.asm` files intentional, or should they move under something like `asm/` or `disassembly/`?
Observed in: repo root
Why it matters: the current root directory makes the project look more chaotic than it probably is.
Answer: It is historical, not a layout I want to preserve forever.
Decision: Move the disassembly under a clearer subdirectory when that can be done without breaking active workflows.
Follow-up: Defer the move until the repo overview and script path cleanup are in place.

### Q014
Question: Should generated reference artifacts be treated as first-class source inputs for the port, or should the long-term source-of-truth be code plus raw captures only?
Observed in: `port/assets/`, `tools/out/`, `rom_analysis/maps/`, `docs/images/`
Why it matters: it determines whether committed derived assets are a feature or technical debt.
Answer: Curated promoted derived artifacts are first-class inputs for the port; raw captures remain the deeper provenance layer underneath them.
Decision: Keep committed derived assets when they are referenced by runtime, docs, or validation, and treat everything else as reproducible scratch output.
Follow-up: Write that policy down and enforce it with clearer directory conventions.

## 2. Repository Hygiene And Artifact Policy

### Q015
Question: Is committing `game.smc` intentional?
Observed in: repo root
Why it matters: this has legal, portability, and repository-size implications.
Answer: In this current private working repo, yes, it is intentional because it anchors reproducibility. It is not the long-term pattern I would use for a broader/public distribution.
Decision: Keep it for the current workspace, but pair it with an explicit ROM identity contract and do not assume that model generalizes.
Follow-up: Document the ROM profile now and revisit untracking if repo scope changes.

### Q016
Question: Is committing large derived outputs under `tools/out/` intentional, or should most of them be reproducible-but-untracked?
Observed in: tracked outputs and dirty worktree entries under `tools/out/`
Why it matters: repo size and diff noise are both high when generated artifacts are first-class.
Answer: Only curated promoted outputs are intentional. Most scratch and exploratory `tools/out/` output should be reproducible-but-untracked.
Decision: Keep committed outputs only when they are directly consumed by runtime/docs/contracts or are important evidence artifacts.
Follow-up: Define promoted artifact criteria and tighten ignore rules accordingly.

### Q017
Question: Is committing `port/assets/test_dump_*` intentionally part of the project contract, or are those supposed to be regenerated examples only?
Observed in: `port/assets/test_dump_frame300`, `port/assets/test_dump_range_1086_1093`
Why it matters: it affects how much asset churn and binary data you want in git.
Answer: Those are intentionally committed example/reference assets for the runtime contract.
Decision: Keep a small curated set of reference assets under `port/assets/`, not a broad mirror of generated dumps.
Follow-up: Mark those directories as promoted reference assets in the runtime docs.

### Q018
Question: Is committing derived docs/media like `docs/images/*.png` intentional, even when they come from generated PPM outputs?
Observed in: `docs/images/`
Why it matters: derived visual artifacts can be useful, but they also blur source/generated boundaries.
Answer: Yes, when they are documentation artifacts rather than scratch output.
Decision: Keep derived images that are explicitly used by docs to explain current validated state.
Follow-up: Treat doc media as curated outputs and keep provenance notes in nearby docs.

### Q019
Question: Is committing `tools/mesen_ppu_extract/bin/Debug` and `tools/mesen_ppu_extract/obj` intentional?
Observed in: `tools/mesen_ppu_extract/bin/Debug/net8.0`, `tools/mesen_ppu_extract/obj/`
Why it matters: checked-in build outputs usually create drift and hide stale executable/runtime mismatches.
Answer: No. This is a real bug.
Decision: Source-of-truth is the C# source/project, not `bin/Debug` and never `obj/`.
Follow-up: Untrack build outputs, ignore them properly, and only keep an explicit bootstrap binary if I later decide a convenience cache is worth the maintenance cost.

### Q020
Question: Is committing mutable emulator output under `.mesen-config/` intentional?
Observed in: dirty files under `.mesen-config/Mesen2/LuaScriptData/...`
Why it matters: probe outputs and debugger state look highly machine-local and churn constantly.
Answer: No, not for live probe/debugger output. Only minimal reproducibility inputs belong there.
Decision: Keep committed templates and any blessed savestates we explicitly rely on; do not treat mutable LuaScriptData/debugger churn as committed source.
Follow-up: Split committed template/config inputs from run output paths.

### Q021
Question: Are the `|*.csv`, `|*.cdl`, `|*.dll`, and `|*.txt` lines in `.gitignore` intentional, or are they typos?
Observed in: `.gitignore`
Why it matters: those patterns do not behave like normal ignore rules and may explain some accidental artifact commits.
Answer: They are typos. This is a real bug.
Decision: Fix them to normal ignore patterns or remove them if we do not actually want those extensions ignored.
Follow-up: Clean up `.gitignore` and re-check tracked artifacts against the intended policy.

### Q022
Question: Should `.mesen-config/` be entirely untracked from here on, or do you rely on committed emulator config as part of reproducibility?
Observed in: `.gitignore` plus tracked `.mesen-config` content
Why it matters: this is one of the biggest current source/generated ambiguity points.
Answer: It should not be entirely untracked. We do rely on a minimal committed config/template layer for reproducibility.
Decision: Track only the minimal reproducibility inputs; untrack per-run output, debugger caches, and probe churn.
Follow-up: Introduce a cleaner split between committed template state and generated run state.

### Q023
Question: Is the absence of any CI/workflow configuration intentional?
Observed in: no `.github/workflows` files found
Why it matters: several validation tools now look mature enough that at least a local or CI smoke gate could exist.
Answer: It is temporary, not a permanent design choice.
Decision: Add CI only after the path policy and generated-output policy are cleaned up enough to make a smoke workflow reliable.
Follow-up: Start with a small Linux smoke workflow for Python syntax/schema checks and `make -C port`.

### Q024
Question: Is the absence of Python dependency manifests intentional because the toolchain is supposed to remain stdlib-only?
Observed in: no `requirements.txt`, `pyproject.toml`, or similar files in reviewed paths
Why it matters: it explains choices like custom PNG parsing and hand-rolled JSON/manifest handling.
Answer: Yes, for the core tooling path that is intentional right now.
Decision: Keep core Python tooling stdlib-only unless a dependency clearly pays for itself.
Follow-up: If that policy changes, add an explicit manifest and stop pretending the tools are dependency-free.

### Q025
Question: Is this repository expected to be used by one machine/user only, or do you want it portable for other contributors?
Observed in: absolute `/home/nivando-soares/...` assumptions in scripts and Makefiles
Why it matters: many portability problems are only acceptable if the repo is explicitly single-user.
Answer: I want it portable for other contributors. The current single-machine bias is technical debt, not the target contract.
Decision: Treat portability cleanup as real work for promoted workflows.
Follow-up: Remove absolute path assumptions from scripts, Makefiles, and docs.

### Q026
Question: Should absolute paths from manifests and CLI arguments be accepted freely, or do you want stronger path-boundary constraints for safety?
Observed in: manifest path resolution in `port/src/td2_io.c`, `tools/splice_runtime_manifest.py`, `tools/splice_sequence_manifest.py`
Why it matters: current behavior trusts inputs completely and allows arbitrary absolute paths.
Answer: Developer CLIs can stay flexible, but manifests should not remain maximally permissive.
Decision: Prefer manifest-relative paths and add stricter boundary checks for runtime/manifests, with absolute paths only as an explicit opt-in if we still need them.
Follow-up: Tighten path resolution rules in both runtime and manifest utilities.

## 3. Build, Reproducibility, And Workflow

### Q027
Question: Should there be one top-level build/test entrypoint that orchestrates ROM build, runtime build, and core tooling checks?
Observed in: separate `Makefile`, `port/Makefile`, and `tools/Makefile`
Why it matters: current workflow is fragmented and easy to use inconsistently.
Answer: Yes.
Decision: Add one top-level orchestration entrypoint and keep sub-Makefiles underneath it.
Follow-up: Start with a lightweight smoke target that rebuilds the ROM, builds the runtime, and runs core tool checks.

### Q028
Question: Is the root `Makefile` rule `main.s: $(wildcard *.asm)` followed by `touch main.s` intentional?
Observed in: `Makefile`
Why it matters: it is unusual and looks more like timestamp steering than a clear dependency/model rule.
Answer: Yes, but only as a legacy WLA rebuild workaround.
Decision: Treat it as a historical dependency hack, not a pattern to extend.
Follow-up: Either document the reason or replace it with a clearer dependency model when the ROM build gets touched next.

### Q029
Question: Should the top-level build eventually validate the runtime/tooling too, not just rebuild the ROM?
Observed in: `Makefile`
Why it matters: the repo's active work now clearly includes more than the WLA rebuild path.
Answer: Yes.
Decision: The top-level build should eventually cover ROM rebuild plus runtime/tool smoke validation.
Follow-up: Fold the current bounded validation steps into a top-level smoke target once artifact paths are cleaner.

### Q030
Question: Is the single-command compile strategy in `port/Makefile` good enough, or do you want object files, dependency tracking, and debug/sanitizer builds?
Observed in: `port/Makefile`
Why it matters: the runtime is already large enough that a more conventional build could help iteration and diagnostics.
Answer: It is good enough for the current prototype, not for the long-term runtime.
Decision: Move to object files, dependency tracking, and optional debug/sanitizer builds as the runtime continues to grow.
Follow-up: Add conventional debug/release targets before doing larger runtime refactors.

### Q031
Question: Do you want dedicated debug/release/test build modes for the SDL runtime?
Observed in: `port/Makefile`
Why it matters: right now there is only one optimization/warning profile.
Answer: Yes.
Decision: Add at least debug and release modes, with sanitizer/test-oriented flags as a local validation option.
Follow-up: Keep the default build simple, but expose explicit modes for diagnostics.

### Q032
Question: Is the current `tools/Makefile` intentionally a giant hand-maintained orchestration file, or should it become data-driven/generated?
Observed in: `tools/Makefile`
Why it matters: the file is already very large and highly repetitive.
Answer: It is intentionally hand-maintained for the current archaeology phase, but it is not the desired end state.
Decision: Keep it as an expedient orchestration surface until the target data/contracts settle, then factor repetition out.
Follow-up: Convert the longest repeated ranges into manifest-driven or generated sections first.

### Q033
Question: Should the per-frame/per-scene targets in `tools/Makefile` stay explicitly enumerated, or should a manifest-driven loop generate them?
Observed in: long repeated sections for `991..1093`, queue scenes, sequence manifests
Why it matters: manual expansion is brittle and hard to refactor.
Answer: A few curated anchors can stay explicit, but long repeated frame ranges should be data-driven.
Decision: Keep explicit targets only where naming and documentation value outweigh repetition.
Follow-up: Move the large repeated attract-window sections to a manifest-driven generator.

### Q034
Question: Is embedding `python -c` one-liners inside `tools/Makefile` acceptable, or should those JSON-manifest writes live in real scripts?
Observed in: `tools/Makefile`
Why it matters: one-liners are harder to review, reuse, and test.
Answer: Trivial one-liners are acceptable, but any meaningful manifest write should live in a real script.
Decision: Prefer real scripts once the logic is more than a tiny glue expression.
Follow-up: Migrate any non-trivial inline manifest generation into named tools when that area is next touched.

### Q035
Question: Should `tools/extract_mesen_scene_range.py` default to the checked-in extractor DLL, or should the build always compile the C# bridge from source first?
Observed in: `tools/extract_mesen_scene_range.py`
Why it matters: a stale committed DLL can silently diverge from `Program.cs`.
Answer: The source should be authoritative, not the checked-in DLL.
Decision: Either build the bridge from source first or verify the binary matches the expected source/version before use.
Follow-up: Stop treating the checked-in DLL as trusted default state.

### Q036
Question: Do you want explicit Mesen/MesenCore version pinning and compatibility checks before running the C# extractor path?
Observed in: `tools/mesen_ppu_extract/Program.cs`, `validation/run_mesen_capture.sh`
Why it matters: the native struct layout contract looks ABI-fragile.
Answer: Yes.
Decision: Pin the supported Mesen/MesenCore build and fail early on unsupported versions.
Follow-up: Add version/hash reporting and compatibility checks to the bridge path.

### Q037
Question: Is the current Mesen binary discovery logic in `validation/run_mesen_capture.sh` intentionally personal-machine-specific?
Observed in: `validation/run_mesen_capture.sh`
Why it matters: it is fast for one machine, but not portable at all.
Answer: Yes, in the sense that it was written for one machine first, but that is technical debt, not the target contract.
Decision: Replace personal path discovery with explicit env/config-based discovery for promoted workflows.
Follow-up: Add a repo-local config or documented `MESEN_BIN` requirement and stop hard-coding home-directory paths.

## 4. Runtime Architecture And Rendering Model

### Q038
Question: Is the hand-written JSON parsing in `port/src/td2_io.c` intentional because the runtime must stay dependency-free?
Observed in: `port/src/td2_io.c`
Why it matters: the current parser is brittle and trusts exact generated key/value shapes.
Answer: Yes. The runtime is intentionally dependency-free and only consumes our own generated formats.
Decision: Keep dependency-free loading, but be honest that this is a schema-specific loader, not a general JSON implementation.
Follow-up: Replace the ad hoc scanning with tighter schema-specific parsing once the format is versioned.

### Q039
Question: Is `palette_bank_load_json()` intentionally parsing every integer it sees instead of validating actual JSON structure?
Observed in: `port/src/td2_io.c`
Why it matters: it works on current files, but it is structurally unsafe and hard to extend.
Answer: Yes, for the current flat generated palette format. It is not meant as a general JSON contract.
Decision: Keep it only while the input format stays extremely narrow and machine-generated.
Follow-up: Replace it with an actual schema-aware parser if the palette format grows any richer.

### Q040
Question: Is the custom whitespace-separated runtime manifest format the long-term canonical format, or is it a temporary convenience layer?
Observed in: `port/src/main.c`, `tools/runtime_manifest_to_json.py`, `tools/splice_runtime_manifest.py`
Why it matters: many tools now depend on this format and reproduce its limitations.
Answer: It is a temporary convenience layer.
Decision: Keep using it during the current archaeology/prototype phase, but do not treat it as the final canonical manifest format.
Follow-up: Promote a versioned machine-readable manifest format and keep the text form only as a generated/runtime-friendly view if it is still useful.

### Q041
Question: Are spaces in manifest paths intentionally unsupported?
Observed in: `scene_sequence_load_manifest()` in `port/src/main.c` and similar split-based parsers in Python utilities
Why it matters: the whole manifest pipeline currently assumes tokenized whitespace paths.
Answer: Yes, under the current text manifest syntax.
Decision: Continue treating whitespace in manifest paths as unsupported until the format changes.
Follow-up: Either switch to a structured manifest or add proper escaping rules with explicit validation errors.

### Q042
Question: Is Linux-only `/proc/self/exe` resolution for the default sequence path acceptable?
Observed in: `port/src/main.c`
Why it matters: the default startup path is not portable even if SDL itself is.
Answer: Yes, given the current Linux-only support envelope.
Decision: Leave it alone while the repo remains Linux-first.
Follow-up: Replace it with a portable base-path API if/when non-Linux support becomes a real target.

### Q043
Question: Should `port/src/main.c` remain a monolithic control file, or do you want it split into CLI, manifest loading, playback state, and rendering modules?
Observed in: `port/src/main.c`
Why it matters: the file is already handling too many responsibilities at once.
Answer: I do not want it to remain monolithic.
Decision: Split CLI, manifest loading, playback control, and runtime-specific scene behaviors into separate modules as the next runtime cleanup.
Follow-up: Do that before piling on broader runtime feature work.

### Q044
Question: Should the CLI formally define precedence when users pass conflicting view modes like `--sequence`, `--image`, `--snes-bg-*`, and `--palette` together?
Observed in: `port/src/main.c`
Why it matters: the current behavior is implied by code order, not by explicit contract.
Answer: Yes.
Decision: Stop relying on implicit code-order precedence and either reject conflicting modes or document a strict precedence rule.
Follow-up: Prefer explicit conflict errors over hidden precedence.

### Q045
Question: In headless mode, should the first dumped frame represent the initial loaded state or the state after one simulation step?
Observed in: headless loop ordering in `port/src/main.c`
Why it matters: current headless output is post-step, which can subtly shift regression expectations.
Answer: The first dumped frame should represent the initial loaded state. The current post-step behavior is a contract bug.
Decision: Change headless dumping to emit frame 0 before simulation advances.
Follow-up: Update regression docs/gates to match the clarified numbering once fixed.

### Q046
Question: In interactive mode, should `--dump-prefix` dump per render or per simulation tick?
Observed in: interactive loop in `port/src/main.c`
Why it matters: dumping per render can duplicate frames or make dumps depend on host timing.
Answer: It should dump per simulation tick. Dumping per render is not the contract I want.
Decision: Tie dumps to simulation/frame-advance semantics, not host render frequency.
Follow-up: Make interactive and headless dumping use the same frame numbering model.

### Q047
Question: Is it intentional that the runtime only models three BG layers instead of all four SNES BG layers?
Observed in: `SnesBgScene.layers[3]` in `port/src/td2_types.h`, layer loops in `port/src/td2_ppu.c`
Why it matters: `BG4` data exists elsewhere in the repo, but the runtime currently cannot render it.
Answer: Yes, for the current front-end slice, but it is a temporary limitation, not a final renderer claim.
Decision: Treat BG4 omission as acceptable only while current validated scenes do not require it.
Follow-up: Expand the runtime scene model to all four BG layers before claiming general SNES-scene support.

### Q048
Question: Is it intentional that the Python renderer also ignores BG4?
Observed in: `tools/render_mesen_snes_bg.py`
Why it matters: tooling and runtime match each other here, but both appear incomplete relative to SNES capabilities.
Answer: Yes, for parity with the current runtime limitation.
Decision: Keep runtime and tooling aligned for now, but do not treat BG4 omission as a stable renderer contract.
Follow-up: Add BG4 support to both together when a promoted scene needs it.

### Q049
Question: Is Mode 7 ExtBG intentionally unsupported in the runtime right now?
Observed in: `port/src/td2_ppu.c`
Why it matters: if later scenes depend on ExtBG, current render architecture will need a deeper change.
Answer: Yes.
Decision: ExtBG stays unsupported until a validated scene requires it.
Follow-up: Document ExtBG as unsupported instead of leaving it as an implicit omission.

### Q050
Question: Is it acceptable that the runtime ignores sub-screen composition, windows, color math, mosaic, hires, and screen interlace?
Observed in: `port/src/td2_ppu.c`
Why it matters: the extracted PPU state carries more detail than the runtime currently uses.
Answer: It is acceptable for the current intro/front-end vertical slice, but not as a general SNES renderer claim.
Decision: Treat these as declared unsupported features outside the current validated scene set.
Follow-up: Document the supported renderer subset and only promote scenes that fit inside it until the gap closes.

### Q051
Question: Is it acceptable that non-Mode-7 BG rendering ignores the tile priority bit (`0x2000`) and just paints fixed layer order?
Observed in: `render_snes_bg_scene()` in `port/src/td2_ppu.c`
Why it matters: correct SNES BG/sprite layering often depends on per-tile priority, not just layer index.
Answer: No. This is a real correctness gap for general non-Mode-7 rendering.
Decision: Treat it as a bug-to-fix before claiming general non-Mode-7 parity.
Follow-up: Add a targeted test scene that exercises per-tile priority once the fix lands.

### Q052
Question: Is `snes_bg_scene_load_scanline_params()` intentionally left as a stub?
Observed in: `port/src/td2_ppu.c`, `port/src/td2_ppu.h`
Why it matters: the header/doc comments imply sidecar support, but the implementation currently always returns `false`.
Answer: Yes, it is an intentional placeholder for planned sidecar support, but leaving it exposed and unwired is not ideal.
Decision: Either implement and wire it up or remove/de-scope it until needed.
Follow-up: Do not keep a dead public hook around indefinitely.

### Q053
Question: If scanline-sidecar loading is still needed, should `snes_bg_scene_load()` invoke it automatically instead of relying on an external caller that does not exist right now?
Observed in: `port/src/td2_ppu.c`
Why it matters: even a non-stub implementation would currently never be used.
Answer: Yes.
Decision: If scanline sidecars remain part of the runtime contract, loading must be automatic from the main scene load path.
Follow-up: Make it sibling-file or manifest-driven, not an invisible external requirement.

### Q054
Question: Do you want to keep `mode7_anim` as a hard-coded special runtime behavior, or replace it with a more general callback/state playback model?
Observed in: `SEQUENCE_ENTRY_MODE7_ANIM` handling in `port/src/main.c`
Why it matters: this is the only place where a sequence entry mutates live PPU state procedurally.
Answer: It should eventually be replaced by a more general callback/state playback model.
Decision: Keep `mode7_anim` only as a narrow bridge for the current `01:9FE5` work.
Follow-up: Generalize procedural scene playback once another callback family needs the same treatment.

### Q055
Question: If `mode7_anim` stays, should the Python manifest utilities also understand it?
Observed in: `port/src/main.c` supports it, but `tools/runtime_manifest_to_json.py` and splicing utilities do not
Why it matters: the runtime currently accepts a sequence type that the tooling pipeline cannot round-trip.
Answer: Yes.
Decision: Every runtime manifest entry type that remains supported must round-trip through the tooling.
Follow-up: Add `mode7_anim` support to the manifest utilities if the runtime keeps it.

### Q056
Question: Is the Ballistic A39C runtime palette update intentionally recomputing from frame zero on every advance?
Observed in: `indexed_palette_animation_update_runtime_palette()` in `port/src/main.c`
Why it matters: current frame counts are small, but the algorithm is still quadratic in the frame index.
Answer: Yes. That was a simplicity-over-optimization choice for a small clip.
Decision: Leave it alone while the clip stays small and correctness is the main concern.
Follow-up: Switch to incremental state updates if the callback playback system expands or profiling says it matters.

## 5. Rendering Correctness And Behavior Clarifications

### Q057
Question: Is the vertical-mirror logic intentionally using sprite width instead of sprite height in the C regular OBJ renderer?
Observed in: `render_snes_objects()` in `port/src/td2_ppu.c`
Why it matters: for non-square sprites this looks like a real correctness bug, not just an approximation.
Answer: No. This is a real bug.
Decision: Fix the vertical-mirror math to use sprite height.
Follow-up: Add a targeted sprite case that exercises non-square mirrored OBJ.

### Q058
Question: Is the same width-vs-height vertical-mirror behavior in the Python simple OBJ renderer intentional?
Observed in: `render_objects()` in `tools/render_mesen_snes_bg.py`
Why it matters: if it is a bug, it exists in both runtime and tooling and can poison comparisons.
Answer: No. This is the same real bug in the Python renderer.
Decision: Fix it in lockstep with the C renderer.
Follow-up: Keep the C and Python OBJ paths under the same correctness tests for mirrored sprites.

### Q059
Question: Is the same width-vs-height vertical-mirror behavior in the Python PPU-accurate Mode 7 OBJ renderer intentional?
Observed in: `render_mode7_objects_ppu_accurate()` in `tools/render_mesen_snes_bg.py`
Why it matters: this would mean the more accurate path inherited the same likely bug.
Answer: No. That is also a real bug.
Decision: Fix the PPU-accurate path too.
Follow-up: Re-run parity checks on any Mode 7 OBJ scenes after the fix.

### Q060
Question: Is the simple OBJ renderer in runtime/tooling only supposed to be approximate, or do you want it to converge toward actual SNES draw behavior too?
Observed in: `port/src/td2_ppu.c`, `tools/render_mesen_snes_bg.py`
Why it matters: it changes whether correctness gaps are bugs or accepted simplifications.
Answer: It is allowed to be approximate for quick previews, but the overall project direction is still toward actual SNES draw behavior for validated scenes.
Decision: Keep the simple path clearly labeled approximate and do not use it as the authority for parity-critical work.
Follow-up: Route parity-critical builders and checks to the more accurate path.

### Q061
Question: Should the scene builder previews use the same PPU-accurate Mode 7 OBJ compositor that the runtime now relies on for better parity?
Observed in: `tools/build_bootstrap_queue_scene.py`, `tools/build_mode7_source_scene.py`, `tools/build_bank1_l00a00c_scene.py`
Why it matters: current preview builders import `render_objects()` rather than the `mode7-ppu` path.
Answer: Yes, for any Mode 7 scene that feeds parity work.
Decision: Use the PPU-accurate compositor for promoted Mode 7 preview/build paths.
Follow-up: Keep the simple renderer only as an exploratory option.

### Q062
Question: Do you want one single rendering source-of-truth, or is duplicated C/Python render logic acceptable for now?
Observed in: `port/src/td2_ppu.c` and `tools/render_mesen_snes_bg.py`
Why it matters: duplicated render logic is already large and will drift over time.
Answer: One behavioral source-of-truth is required, but one literal codebase is not mandatory today.
Decision: Duplication is acceptable short-term only if it is kept under shared contract tests.
Follow-up: Add shared golden/tests before adding more renderer complexity to both paths.

### Q063
Question: Is it acceptable that the design-pack tooling exports BG4 tilemaps while the preview/runtime renderers ignore BG4?
Observed in: `tools/build_mesen_design_pack.py` versus `port/src/td2_ppu.c` and `tools/render_mesen_snes_bg.py`
Why it matters: your tooling model and your playback model currently disagree about supported layers.
Answer: Yes, temporarily. The design pack is intentionally a richer inspection artifact than the current playback/render subset.
Decision: Keep that asymmetry documented until the renderer catches up.
Follow-up: Close the gap if a promoted scene or workflow actually depends on BG4 playback.

### Q064
Question: Are manifest/token names intended to be stable identifiers for validation, or can they change freely when artifacts are renamed?
Observed in: `port/test_regression.sh`, `tools/check_regression_gates.py`
Why it matters: current regression logic often identifies checkpoints by substring matches inside manifest lines.
Answer: They are not intended to be stable identifiers.
Decision: Validation should move to explicit checkpoint IDs, not token substrings.
Follow-up: Add explicit IDs to manifests/contracts and stop keying gates off filename fragments.

### Q065
Question: Should runtime/tools restrict manifest path traversal to files near the manifest, or is loading arbitrary absolute/relative paths intentional?
Observed in: manifest path resolution in runtime and Python utilities
Why it matters: current behavior is maximally permissive.
Answer: Loading arbitrary paths is acceptable for ad hoc developer tooling, but not as a long-term runtime/manifest contract.
Decision: Restrict manifest resolution by default and make broader access explicit if we still need it.
Follow-up: Tighten manifest loaders on both the C and Python sides.

### Q066
Question: Is it acceptable that `scene_sequence_total_frames()` and other duration math still use plain `int` instead of wider/frame-safe types?
Observed in: `port/src/main.c` and multiple Python manifest tools
Why it matters: this is fine for current sequences, but it bakes in small-range assumptions.
Answer: It is acceptable for current sequence sizes, but I do not want to freeze that assumption into the long-term contract.
Decision: Widen the C-side duration math before the manifest format is treated as stable.
Follow-up: Use wider/frame-safe totals in runtime structures and keep Python math unconstrained.

## 6. Validation Harness And Emulator Automation

### Q067
Question: Is it intentional that validation runs share one mutable `.mesen-config` directory instead of using per-run isolated temp configs?
Observed in: `validation/run_mesen_capture.sh`
Why it matters: shared mutable state can cause clobbering and non-determinism between runs.
Answer: Yes, as an expedient local workflow choice, but not as the long-term validation contract.
Decision: Move toward per-run isolated generated state while keeping a small committed template/config base.
Follow-up: Split template config from run output and stop sharing mutable probe paths by default.

### Q068
Question: Is enabling `AllowIoOsAccess` in Mesen's settings acceptable for your threat model?
Observed in: `validation/run_mesen_capture.sh`
Why it matters: this is fine for trusted local use, but it should be an explicit security choice.
Answer: Yes, for trusted local developer use only.
Decision: Keep it as an explicit local-trust assumption, not a casual hidden default for broader environments.
Follow-up: Document that the validation stack assumes trusted local execution.

### Q069
Question: Is patching `settings.json` with literal `sed` replacements robust enough, or do you want a safer config-generation step?
Observed in: `validation/run_mesen_capture.sh`
Why it matters: this is brittle across Mesen version/template changes.
Answer: No, it is not robust enough as a stable contract.
Decision: Replace it with a safer generated-config path.
Follow-up: Generate a minimal repo-owned settings file or patch JSON structurally instead of using literal `sed` replacements.

### Q070
Question: Should `run_mesen_capture.sh` verify the actual Mesen version/build it found before using it?
Observed in: `validation/run_mesen_capture.sh`
Why it matters: a quiet version mismatch could invalidate captures and bridge assumptions.
Answer: Yes.
Decision: Validation should fail early on unsupported or unknown Mesen versions.
Follow-up: Add version reporting and a pinned supported-build check.

### Q071
Question: Should the repeated Lua helper logic for env parsing, input windows, savestate loading, file IO, and JSON writing be centralized?
Observed in: `validation/mesen_capture.lua`, `validation/mesen_dump_bg_range.lua`, `validation/mesen_probe_boot.lua`, `validation/mesen_scanline_step_test.lua`
Why it matters: these scripts duplicate a lot of behavior and are likely to drift.
Answer: Yes.
Decision: Centralize the shared Lua helper logic as far as Mesen loading mechanics allow.
Follow-up: Introduce a shared helper/include path or generated common block for env parsing and serialization helpers.

### Q072
Question: Is it acceptable that the Lua scripts hand-roll JSON encoding instead of using a shared helper or a more constrained output format?
Observed in: `validation/mesen_dump_bg_range.lua`, `validation/mesen_probe_boot.lua`, `validation/mesen_scanline_step_test.lua`
Why it matters: the custom encoders are a maintenance burden and easy to subtly break.
Answer: It is acceptable under current Mesen/Lua constraints, but only if the JSON writing logic is centralized.
Decision: Keep the no-dependency approach, but stop duplicating multiple hand-rolled encoders.
Follow-up: Move JSON/text encoding into one shared helper path.

### Q073
Question: Should `validation/mesen_probe_boot.lua` remain a single very large script, or do you want to split it logically even if that complicates Mesen loading?
Observed in: `validation/mesen_probe_boot.lua`
Why it matters: it is now large enough that changes are hard to reason about safely.
Answer: I do not want it to keep growing as one giant file.
Decision: Split it logically if Mesen loading permits, or at minimum factor shared/generated sections inside the file.
Follow-up: Break out reusable helper logic first, then isolate probe-specific sections.

### Q074
Question: Is the savestate env-var naming intentionally inconsistent across Lua scripts?
Observed in: `validation/mesen_capture.lua`, `validation/mesen_dump_bg_range.lua`, `validation/mesen_scanline_step_test.lua`
Why it matters: for example, scanline tooling still resolves `TD2_CAPTURE_SAVESTATE`, which is surprising.
Answer: No. This is a real bug/cleanup issue.
Decision: Standardize savestate env-var names across the Lua stack.
Follow-up: Pick one naming rule and update the wrappers/docs to match.

### Q075
Question: Should the Python wrappers stop suppressing subprocess stdout/stderr by default?
Observed in: `tools/run_track1_seed_sweep.py`, `tools/capture_visible_mode7_range.py`, `tools/capture_scanline_samples_range.py`
Why it matters: quiet failures are harder to debug when Mesen or Lua scripts misbehave.
Answer: Yes.
Decision: Default to streaming or capturing logs to per-run files, with an explicit quiet mode if needed.
Follow-up: Stop sending Mesen/Lua subprocess output to `/dev/null` by default.

### Q076
Question: Should validation wrappers write to run-specific output files instead of reusing shared fixed paths under `.mesen-config/Mesen2/LuaScriptData/`?
Observed in: `tools/run_l001210_probe_matrix.py`, `tools/capture_visible_mode7_range.py`, `tools/capture_scanline_samples_range.py`
Why it matters: current runs can clobber each other and are hard to parallelize.
Answer: Yes.
Decision: Use run-specific outputs and only copy/promote into canonical locations when needed.
Follow-up: Add run IDs or temp output roots to the wrappers.

### Q077
Question: Is parallel execution intentionally unsupported for the current validation tooling?
Observed in: many scripts read/write fixed probe output paths
Why it matters: this should be explicit if it is a design constraint rather than an accidental limitation.
Answer: Yes, parallel execution is intentionally unsupported right now because of the shared mutable output/config model.
Decision: Treat no-parallelism as an explicit current constraint, not an accidental maybe.
Follow-up: Document that constraint and remove it only after per-run isolation exists.

### Q078
Question: Should the probe-side savestate save feature fail fast when unsupported instead of behaving as best-effort?
Observed in: `validation/mesen_probe_boot.lua`
Why it matters: silent downgrade from "save state" to "could not save" can invalidate follow-up workflows.
Answer: Yes.
Decision: Requested savestate saves should fail clearly if the platform cannot honor them.
Follow-up: Return a hard failure or explicit unsupported status instead of quiet best-effort behavior.

### Q079
Question: Is depending on `$HOME/.config/Mesen2/settings.json` as the template acceptable?
Observed in: `validation/run_mesen_capture.sh`
Why it matters: it ties reproducibility to one user's existing host config.
Answer: No.
Decision: The validation stack should not depend on host-personal Mesen settings as its reproducibility base.
Follow-up: Replace it with a repo-owned template or generated config.

### Q080
Question: Do you want to keep both the Lua `--testRunner` path and the C# debugger-bridge path, or should one eventually become canonical?
Observed in: `validation/*.lua`, `tools/mesen_ppu_extract/Program.cs`
Why it matters: two different automation stacks means duplicated assumptions and duplicated breakage risk.
Answer: Keep both, but with different canonical roles.
Decision: Lua `--testRunner` is the canonical deterministic input/probe path; the C# bridge is the canonical asset/layer extraction path.
Follow-up: Document those roles so we do not keep re-solving the same problem in both stacks.

### Q081
Question: Is `port/test_regression.sh` intentionally masking renderer failures with `|| true` during the frame-render step?
Observed in: `port/test_regression.sh`
Why it matters: that can hide real runtime crashes and turn them into misleading downstream comparison failures.
Answer: No. This is a real bug.
Decision: Renderer failures should fail the regression run immediately.
Follow-up: Remove the masking and keep downstream comparisons only for successful renders.

### Q082
Question: Is the regression shell script supposed to remain Linux-specific?
Observed in: `port/test_regression.sh`
Why it matters: it depends on `awk`, `stat -c`, `mktemp`, and other Linux-flavored shell behavior.
Answer: Yes, for now.
Decision: Treat it as a Linux-only smoke script under the repo's current platform policy.
Follow-up: Revisit only if broader platform support becomes real.

## 7. Python Tooling Architecture And Data Contracts

### Q083
Question: Do you want a proper shared Python package for common helpers instead of cross-importing CLI scripts?
Observed in: many `tools/*.py` imports such as `render_mesen_snes_bg`, `build_bank1_helper_scene`, `compare_frames`
Why it matters: the current structure is already acting like a package without being one.
Answer: Yes.
Decision: Create a small internal shared package/module layer for promoted helpers.
Follow-up: Start by centralizing path, JSON, image, and manifest utilities.

### Q084
Question: Is the `sys.path.insert(...)` hack in `tools/run_track1_seed_sweep.py` acceptable?
Observed in: `tools/run_track1_seed_sweep.py`
Why it matters: it is a symptom that the tools want a proper module layout.
Answer: No. It is temporary glue, not an acceptable long-term pattern.
Decision: Replace it with a proper module/package layout.
Follow-up: Remove the hack once the shared helper module exists.

### Q085
Question: Should the repo define canonical schemas for `design_pack.json`, `sequence.json`, runtime manifests, probe outputs, and provenance outputs?
Observed in: `tools/build_mesen_design_pack.py`, `tools/build_scene_sequence_manifest.py`, `tools/runtime_manifest_to_json.py`, `validation/*.lua`
Why it matters: many downstream scripts assume these shapes but no schema/version exists.
Answer: Yes.
Decision: Canonical schemas are required for the promoted cross-tool formats.
Follow-up: Version and document those formats, starting with the most heavily shared ones.

### Q086
Question: Should the repeated helpers like `relpath()`, `write_ppm()`, `parse_int()`, and JSON read/write live in a shared utility module?
Observed in: many `tools/*.py`
Why it matters: the same logic is duplicated in too many files already.
Answer: Yes.
Decision: Move repeated low-risk helpers into a shared utility module.
Follow-up: Do that before adding more new scripts that duplicate the same patterns again.

### Q087
Question: Should `tools/build_scene_sequence_manifest.py` and `tools/build_capture_sequence_manifest.py` share one internal library for collapse-by-hash and image emission?
Observed in: both scripts
Why it matters: they solve almost the same problem in parallel and will drift.
Answer: Yes.
Decision: Share the collapse/hash/image-emission logic internally.
Follow-up: Factor the common logic into a manifest/image helper module.

### Q088
Question: Is `tools/splice_sequence_manifest.py` intentionally less strict than `tools/splice_runtime_manifest.py` about overlap and duration alignment?
Observed in: `tools/splice_sequence_manifest.py` versus `tools/splice_runtime_manifest.py`
Why it matters: the JSON-based splicer looks much easier to misuse.
Answer: No. That looseness was expedient, not a contract I want to keep.
Decision: Bring the JSON splicer up to the same boundary/duration safety level as the runtime splicer.
Follow-up: Add explicit overlap and duration-alignment checks there too.

### Q089
Question: Is it intentional that `tools/splice_sequence_manifest.py` drops `oam` paths when rewriting `snes_bg` entries?
Observed in: `tools/splice_sequence_manifest.py`
Why it matters: that looks like a real data-loss bug for OAM-aware scenes.
Answer: No. This is a real bug.
Decision: Preserve `oam` paths when splicing `snes_bg` entries.
Follow-up: Add a targeted regression test for OAM-aware splice round-trips.

### Q090
Question: Should `tools/runtime_manifest_to_json.py` and the splicing utilities support `mode7_anim` if the runtime keeps supporting it?
Observed in: manifest utilities versus `port/src/main.c`
Why it matters: the pipeline currently cannot round-trip every runtime entry type.
Answer: Yes.
Decision: Tooling should round-trip every supported runtime manifest entry type.
Follow-up: Add `mode7_anim` support or remove the runtime type if it is no longer needed.

### Q091
Question: Is the large, dense tilemap JSON/CSV output from `tools/build_mesen_design_pack.py` intentionally optimized for human inspection over storage efficiency?
Observed in: `tools/build_mesen_design_pack.py`
Why it matters: these files can get large quickly and are expensive to diff.
Answer: Yes.
Decision: Design-pack tilemap outputs are inspection-first artifacts, not storage-optimized interchange files.
Follow-up: If size becomes painful, add a compact machine format in addition to the human-readable one rather than replacing it.

### Q092
Question: Is the visible-sprite sort order in `tools/build_mesen_design_pack.py` supposed to reflect actual SNES draw order, or just provide a useful inspection ordering?
Observed in: `collect_sprite_analysis()` in `tools/build_mesen_design_pack.py`
Why it matters: reviewers could otherwise mistake an inspection sort for hardware order.
Answer: It is a useful inspection ordering, not guaranteed SNES draw order.
Decision: Keep it as an inspection aid and label it clearly as such.
Follow-up: Document that `sprites_visible.json` is not a hardware-order contract.

### Q093
Question: Is the current design-pack/raw-dump format meant to be long-term stable for external consumers, or still experimental?
Observed in: `tools/build_mesen_design_pack.py`, `tools/build_mesen_design_pack_range.py`
Why it matters: it changes how strict backward compatibility should be.
Answer: It is still experimental, though some fields are already de facto shared.
Decision: Treat the format as internal/experimental until it is versioned.
Follow-up: Version it before promising backward compatibility to external consumers.

### Q094
Question: Is hashing raw `ppu_state.json` text in `tools/extract_mesen_scene_range.py` intentional, or should scene identity be based on normalized semantic state?
Observed in: `tools/extract_mesen_scene_range.py`
Why it matters: whitespace or field-order changes can break identity even when scene meaning does not change.
Answer: No, text-level hashing is not the right long-term identity rule.
Decision: Scene identity should move to normalized semantic state plus the other relevant raw blobs.
Follow-up: Replace raw text hashing with stable normalized-field hashing.

### Q095
Question: Is converting already-captured PNG screenshots into new PPM files an intentional storage tradeoff?
Observed in: `tools/build_scene_sequence_manifest.py`, `tools/build_capture_sequence_manifest.py`
Why it matters: this duplicates image data for runtime convenience.
Answer: Yes.
Decision: Keep PPM conversion as a runtime-simplicity tradeoff, but only for curated playback assets.
Follow-up: Do not multiply duplicate image formats beyond the small sets actually used by the runtime.

### Q096
Question: Should VRAM writes that would exceed the VRAM buffer fail hard instead of being silently truncated?
Observed in: `apply_dma_descriptor()` in `tools/build_bootstrap_queue_scene.py`, `apply_patch_region()` in `tools/build_mode7_source_scene.py`
Why it matters: silent truncation can hide real bad inputs or address math bugs.
Answer: Yes. Silent truncation is the wrong contract here.
Decision: Treat overrun writes as hard failures unless I later add an explicit opt-in clipping mode for a narrow reason.
Follow-up: Change both builders to fail loudly on out-of-bounds VRAM writes.

### Q097
Question: Should the hard-coded table-confirmed bank30 set move out of code and into a data file/doc contract?
Observed in: `TABLE_CONFIRMED_SNELS` in `tools/build_bank30_chunk_registry.py`
Why it matters: that knowledge is important enough to deserve a more explicit source-of-truth.
Answer: Yes.
Decision: Move that curated knowledge into a data/doc contract instead of leaving it buried in code.
Follow-up: Store it in a versioned JSONC/doc file that the registry builder reads.

### Q098
Question: Is `27FB` intentionally still unsupported even though the header scanner treats it as a normal candidate marker?
Observed in: `tools/extract_compression_header_manifest.py`, `tools/validate_td2_chunks.py`
Why it matters: the tooling advertises a broader marker surface than the decoder/validator actually handles.
Answer: Yes, `27FB` is intentionally unsupported for now because we have not proved the decoder contract yet.
Decision: Keep scanning/reporting it, but label it explicitly as unsupported rather than implying parity with implemented markers.
Follow-up: Tighten the reporting language and add decoder support only when the format is actually understood.

### Q099
Question: Is the custom PNG parser in `tools/compare_frames.py` an intentional "no third-party dependencies" choice?
Observed in: `tools/compare_frames.py`
Why it matters: maintaining a partial PNG decoder only makes sense if dependency minimization is a hard requirement.
Answer: Yes.
Decision: Keep it as a narrow trusted-local parser under the stdlib-only policy.
Follow-up: Do not expand it into a general image library unless the dependency policy changes.

### Q100
Question: Is it acceptable that `tools/compare_frames.py` does not validate PNG CRCs and only supports a narrow subset of PNG features?
Observed in: `tools/compare_frames.py`
Why it matters: trusted-local assets make this okay; wider use would not.
Answer: It is acceptable for trusted local capture assets only.
Decision: Keep the parser narrow and explicitly scoped to our capture outputs.
Follow-up: Document the accepted PNG subset and trusted-input assumption.

### Q101
Question: Should callback/state contracts support ranges, tolerances, or optional fields, or do you want exact-equality checks only?
Observed in: `tools/validate_callback_contracts.py`
Why it matters: exact-only matching is simple, but brittle as the archaeology model gets richer.
Answer: Exact equality should remain the default, but the contract format should support opt-in ranges, tolerances, and optional fields where justified.
Decision: Keep strictness by default and add flexibility only where the archaeology case clearly needs it.
Follow-up: Extend the contract schema instead of weakening all checks globally.

### Q102
Question: Is token-substring lookup in `tools/check_regression_gates.py` stable enough, or should manifests carry explicit checkpoint IDs?
Observed in: `tools/check_regression_gates.py`
Why it matters: current gates depend on artifact filenames/text not drifting.
Answer: It is not stable enough.
Decision: Move regression gates to explicit checkpoint IDs.
Follow-up: Add those IDs to manifests/contracts and stop matching by substring.

## 8. C# Bridge, Performance, And Testing Strategy

### Q103
Question: Is the flattened `ppu_state.json` generated by the C# bridge intended to be the long-term canonical contract for the runtime and tools?
Observed in: `BuildPortCompatiblePpuState()` in `tools/mesen_ppu_extract/Program.cs`
Why it matters: many other tools implicitly rely on this compatibility shim.
Answer: Yes, for now this is the canonical cross-language PPU state contract.
Decision: Treat it as a real shared contract, not an incidental byproduct.
Follow-up: Version and document it explicitly.

### Q104
Question: What is your intended compatibility strategy for the `MesenCore.so` P/Invoke ABI and the large marshaled struct layouts in the C# bridge?
Observed in: `tools/mesen_ppu_extract/Program.cs`
Why it matters: this looks highly sensitive to upstream MesenCore layout changes.
Answer: Pin the supported MesenCore build, record that expectation, and treat upgrades as explicit bridge-maintenance events.
Decision: ABI compatibility will be managed by version pinning plus bridge smoke checks, not by hoping upstream layouts stay compatible.
Follow-up: Add version/hash reporting and a small bridge self-check path around marshal sizes and expected fields.

### Q105
Question: Is the checked-in debug build of `mesen_ppu_extract` supposed to be the executable source-of-truth, or only a convenience cache?
Observed in: `tools/mesen_ppu_extract/bin/Debug/net8.0/`
Why it matters: if it is only a cache, I would treat stale binary drift as a bug.
Answer: It is only a convenience cache. Source is the truth.
Decision: Stale binary drift should be treated as a bug whenever that cache remains in tree.
Follow-up: Prefer building from source or validating binary freshness instead of trusting the checked-in DLL blindly.

### Q106
Question: Is the `.mesen-home` directory created inside each extraction output directory sufficient for reproducibility, or do you want a more explicit bridge config contract?
Observed in: `tools/mesen_ppu_extract/Program.cs`
Why it matters: the bridge currently self-seeds a runtime home but does not expose much control over it.
Answer: It helps, but it is not sufficient by itself.
Decision: Keep the self-contained `.mesen-home`, but add explicit bridge config/version metadata to the outputs.
Follow-up: Record Mesen build identity and bridge settings alongside extraction outputs.

### Q107
Question: Do you want timed input stepping to live in the C# bridge long-term, or should timing-sensitive input remain exclusively in the Lua/testRunner path?
Observed in: `AdvanceToRequestedFrame()` in `tools/mesen_ppu_extract/Program.cs`
Why it matters: there are now two distinct strategies for frame-accurate control.
Answer: Timing-sensitive input should remain canonical in the Lua/testRunner path.
Decision: Keep bridge-side stepping only as a convenience for extraction flows that can tolerate that narrower contract.
Follow-up: Do not let the bridge become the primary deterministic input-control surface.

### Q108
Question: Is it acceptable that many scripts repeatedly re-read the entire ROM and large dump files instead of sharing a cached/common analysis layer?
Observed in: many `tools/*.py`
Why it matters: this is simple, but increasingly expensive as workflows get larger.
Answer: Yes, for now.
Decision: Keep the simple reread model until profiling says it is a real bottleneck.
Follow-up: If performance becomes painful, add a shared analysis/cache layer after the format contracts stabilize.

### Q109
Question: Do you want unit tests for the high-risk pure-code paths like decompression, image comparison, manifest splicing, and render helpers?
Observed in: no unit-test files found for those modules
Why it matters: those are exactly the places where regressions can silently poison archaeology results.
Answer: Yes.
Decision: Add unit tests for the high-risk pure-code helpers.
Follow-up: Start with decompression, compare/splice logic, and renderer helper math.

### Q110
Question: Do you want golden/schema tests for core emitted formats and scene builders, not just ad hoc workflow-level validation?
Observed in: current validation is mostly workflow/output oriented
Why it matters: toolchains this coupled usually benefit from smaller contract tests in addition to end-to-end runs.
Answer: Yes.
Decision: Add golden/schema tests on top of the existing workflow-level validation.
Follow-up: Start with `ppu_state.json`, manifest schemas, and a small set of promoted scene-builder outputs.
