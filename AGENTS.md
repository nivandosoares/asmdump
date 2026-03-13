# Autonomous Execution Contract

This repository should be worked in autonomous continuation mode by default.
Do not wait for the user to say "continue" after each step unless blocked by a
real external dependency or an approval boundary.

## Scope And Invariants

- Keep the current port plan as-is.
- Do not introduce a Rust migration or stack pivot unless the user explicitly
  requests it.
- Preserve the current working pattern:
  - implement
  - test
  - document artifacts
- Prefer incremental archaeology and tooling over speculative rewrites.
- Treat existing user changes in the worktree as intentional unless they
  directly conflict with the current target.

## Source Of Truth

Recover project state at the start of every turn from these files first:

- `PORT_PLAN.md`
- `rom_analysis/docs/next_steps_roadmap.md`
- `rom_analysis/docs/progress_checkpoints.md`
- `rom_analysis/docs/validation_gates.md`
- `validation/README.md`

If they disagree, use this priority order:

1. `PORT_PLAN.md`
2. `rom_analysis/docs/next_steps_roadmap.md`
3. `rom_analysis/docs/progress_checkpoints.md`
4. local code/tool reality

When work changes the real state of the project, update the relevant docs in
the same turn.

## Default Loop

For each turn:

1. Recover the highest-priority open gate from the roadmap/checkpoints.
2. Execute the next concrete step instead of asking for one.
3. Implement the smallest complete change that advances that gate.
4. Run bounded validation.
5. Document findings, outputs, and next reading in the project docs.
6. Continue to the next target unless blocked.

## Target Selection Rules

- Prefer active lane work over queued lane work.
- Finish evidence and documentation for the current lane before switching lanes.
- Do not chase side quests when a higher-priority gate is still open.
- If one path becomes low-yield, move to the next concrete proving lane instead
  of repeatedly retrying the same experiment.

Current lane order:

1. Lane 1: bank30 compression provenance / unresolved queue closure
2. Lane 2: tilemap-to-ROM provenance expansion
3. Lane 3: gameplay-frame archaeology
4. Lane 4: bank API contracts

## Validation Policy

Validation is required, but it must be bounded.

- Always validate new code or tooling at least once if a local validation path
  exists.
- Prefer the cheapest validation that can falsify the change.
- Prefer targeted probes over broad reruns.
- If a validation path is known to be noisy or low-yield, cap retries and move
  on with the result documented.

### Retry And Time Limits

Use these default limits unless the task clearly justifies more:

- Simple syntax/build/test command:
  - at most `2` reruns after fixes
- Targeted probe or extractor run:
  - at most `2` parameter variants in the same lane
- Larger matrix or long-running validation:
  - at most `1` fresh rerun unless the previous run was invalid
- Same-blocker pivot rule:
  - after `3` attempts on the same blocker without a new artifact, a stronger
    narrowing, or a changed observed boundary, document the blocker and move to
    the next concrete step or lane
- Investigation thrash limit:
  - do not spend more than about `30` minutes on the same failing validation
    pattern without producing a new artifact, new telemetry, or a documented
    narrowing of the problem

Stop earlier and proceed to the next target when:

- repeated failures are not changing the observed outcome
- the result is already strong enough to update the docs
- the next lane is unblocked and more valuable than another retry

## Failure Handling

When a step does not fully close the target:

- keep the best artifact
- document the exact negative result
- record the remaining blocker
- choose the next most defensible experiment or target

Do not hide failed probes. Failed but informative results are valid outputs.

## Documentation Requirements

Any substantive turn should update at least one of:

- `rom_analysis/docs/progress_checkpoints.md`
- `rom_analysis/docs/next_steps_roadmap.md`
- `validation/README.md`
- another directly relevant doc for the lane

Document:

- what changed
- what was run
- what artifact was produced
- what was learned
- what the next best step is

## Autonomy Boundaries

Ask the user only when blocked by one of these:

- sandbox or approval requirements
- missing external credentials, files, or binaries
- destructive action with meaningful risk
- conflicting repo state that makes the next step ambiguous
- a strategic plan change requested by the user

Do not ask for routine confirmation to continue.

## Git Workflow

- Commits are allowed whenever they create a clean checkpoint.
- Push directly to `origin/master` by default for this repository.
- Do not wait for separate confirmation before pushing a completed checkpoint.
- Prefer small, coherent commits over batching unrelated work together.
- If unrelated dirty worktree changes exist, commit only the files that belong
  to the current checkpoint and leave the rest untouched.

## End-Of-Turn Output Contract

End each substantive turn with these status lines in the final response:

- `STATUS: continue`, `blocked`, or `done`
- `NEXT_GATE: <short gate or target>`
- `BLOCKER: <none or short reason>`

Use `STATUS: continue` whenever the outer automation loop should immediately
invoke the next turn.
