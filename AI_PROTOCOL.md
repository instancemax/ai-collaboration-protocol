# AI Protocol
**v1.7 · 2026-05-22**

Read this before making any changes to the project.

---

## New Pal? Start Here (30 seconds)

Five rules. Everything else in this file is detail.

1. **Read before touching** — run `git status`, read the latest work log summary.
2. **Say what you plan** — before editing, state what you will change and why.
3. **Don't overwrite others' work** — check for uncommitted changes first.
4. **Branch + PR, never push main** — name your branch `<model>/<machine>/<description>`.
5. **Self-merge is allowed** — resolve conflicts first, then merge your own PR.

Done? Read the rest when you need it.

---

## What Changed Recently

**v1.7 (2026-05-22)** — Protocol readability: version number, quick-start, recent changes section. Branch naming updated for multi-machine setups.

**v1.6 (2026-05-22)** — AI contributors may now self-merge their own PRs. Conflict resolution is the AI's responsibility before merging.

**v1.5 (2026-05-16)** — Six improvements from field feedback: conflict PR check before starting, technical prerequisite verification, debugging circuit breaker, version-bump lock, per-session log files recommendation, close issues on merge. Task Weight Modes added (Lightweight / Standard / High-Risk).

---

## Before You Start

1. Run `git status --short --branch` to identify the current branch and any uncommitted changes.
2. Read the latest `AI_WORK_LOG.md` entries or summary first.
3. Read `PRODUCT_PRINCIPLES.md` if present and relevant to the task.
4. Read deeper historical logs or full background files only when the task touches related areas, context is unclear, or the change is high-risk.
5. If another contributor has uncommitted changes, do not overwrite them without asking.
6. Check for open Pull Requests that may overlap with your intended work. If a conflicting or duplicate PR exists, surface it to the human maintainer before starting.

Prefer summary-first context loading. The goal is to understand enough to work safely, not to re-read all project history every session.

## Task Weight Modes

Protocol overhead should scale with task risk. Use the lightest mode that still keeps the work safe and understandable.

### Lightweight Tasks

Use for small, low-risk changes such as wording, comments, formatting, or tiny documentation edits.

Always:

- Run `git status --short --branch`.
- Preserve other contributors' work.
- Summarize what changed.
- Run a relevant check if one exists.

Usually skip:

- Deep historical log reading.
- Roadmap or issue updates.
- Version bumps.
- Long work-log entries.
- Formal handoff beyond a concise final note.

### Standard Tasks

Use for ordinary feature work, bug fixes, documentation changes with real workflow impact, and issue-driven work.

- Use summary-first context loading.
- Check relevant open issues and PRs.
- Verify technical prerequisites before stating the plan.
- Record a decision-focused work-log entry when the change matters for future contributors.
- Open a PR at the appropriate stage.
- Bump version only when explicit project versioning and user-visible change require it.

### High-Risk Tasks

Use for architecture, data, permissions, release behaviour, migrations, version conflicts, high-concurrency branches, or cross-PR integration.

- Read deeper relevant history.
- Check for overlapping PRs and related issues before starting.
- Use checkpoint commits when work is long-running or cloud-executed.
- Record clear verification, risks, and remaining work.
- Ask the maintainer before destructive, ambiguous, or scope-expanding actions.

## Before You Edit

State briefly:

- What you read
- What state the project is in
- What you plan to change and why
- What files or areas will be affected
- Any uncertainty that could change the decision

Before stating your plan, verify that the technical prerequisites exist — CLI flags, API endpoints, file paths, library versions. Do not propose a solution built on an assumption you have not confirmed.

This keeps the human maintainer informed and prevents silent surprises.

## While Working

- Preserve user and prior AI changes unless explicitly asked to revert them.
- If a conflict is ambiguous, ask before proceeding.
- Prefer small, focused changes over large rewrites.
- If the task would require touching something outside the stated scope, ask first.
- Use product principles as direction, not as a rigid checklist.
- **Debugging circuit breaker:** If you have attempted the same approach more than twice without progress, stop. Re-read the error, re-state the problem in plain language, and try a different direction — or ask for help. Persisting in the same direction is rarely productive and wastes context.

## Using Issue Trackers

If the project uses GitHub Issues or another issue tracker, use it as a shared backlog and planning surface when helpful.

Good uses:

- Capture product roadmap items, feature ideas, bugs, and technical debt.
- Split large product directions into trackable implementation issues.
- Record open product questions that need human decisions.
- Link work-log entries, commits, or pull requests back to relevant issues.

Do not treat issues as a replacement for project handoff files.

- Handoff/work-log files explain the current working context, decisions, verification, and risks for the next contributor.
- Issues track backlog, planning, prioritization, and discussion over time.
- Product principles explain direction and constraints.
- Pull requests and commits record the implemented change.

Before creating new issues, check for existing related issues to avoid duplicates.
Prefer concise issues with clear outcomes over dumping long chat history into the tracker.

When a PR is merged that resolves one or more issues, close those issues and link the closing PR. Do not leave resolved issues open.

## Worker Modes

AI contributors generally fall into two modes with different push and PR behaviour.

### Local AI (e.g. interactive assistant running on the maintainer's machine)

- Works alongside the human maintainer in a live conversation; can ask questions at any point.
- **Does not push or open a PR mid-task** unless the human requests it. Committing locally during work is fine.
- **Triggers a push + PR at stage completion** — a natural stopping point where the work is coherent and reviewable — or when the human explicitly asks.
- May push trivial documentation fixes directly to the main branch with explicit human approval; all substantive work goes on a feature branch.

### Cloud AI (e.g. autonomous agent, CI-triggered worker)

- Works without a live conversation; cannot ask clarifying questions mid-task.
- **Must push and open a PR as the final step of every task**, because the working environment is ephemeral — results are lost if not pushed.
- Never pushes directly to the main branch.
- **Use checkpoint commits**: commit and update `AI_WORK_LOG.md` after each meaningful independent change, not only at the end of the full task. If the session ends unexpectedly, the next contributor can resume from the last checkpoint rather than starting over. A checkpoint commit is a normal commit — no special prefix needed — just make sure the work log reflects what was done and what remains.

## Branching and Pull Requests

Work on a dedicated branch, not directly on the main branch.

Suggested branch naming: `<agent>/<machine>/<short-description>`

- `<agent>`: model name — `claude`, `codex`, `antigravity`, etc.
- `<machine>`: where the AI is running — `mac`, `win`, `cloud`, etc.
- `<short-description>`: what the branch does

Examples: `claude/mac/fix-auth`, `codex/cloud/add-tests`, `antigravity/win/refactor-db`

If only one machine is in use, the `<machine>` segment may be omitted.

When it is time to push (see Worker Modes above):

1. Push the branch to `origin`.
2. Open a Pull Request from the feature branch into the main branch.
3. Title: imperative phrase summarising the work (e.g. `feat: add log aggregation stack`).
4. Body: what changed, why, how to verify, any remaining risks.
5. Resolve any merge conflicts before merging.
6. Merge the PR once it is ready. AI contributors may self-merge.

## After Working

1. Update `AI_WORK_LOG.md` with context, decisions, affected files, verification, and remaining risks.
   - If the project log is growing large, keep a short current-state summary at the top. For projects with many parallel AI contributors, consider writing one log file per session (e.g. `logs/2026-05-16-claude.md`) and merging them periodically. This prevents prepend conflicts when multiple PRs land at the same time.
2. If the project uses explicit versioning and user-visible behavior changed, bump the version. See `VERSIONING_RULES.md`.
   - **Only one AI should bump the version at a time.** If another branch has already bumped the version from the same base, resolve the conflict before opening your PR — do not independently increment again.
3. Run the project's verification command and record the result.
4. Push the branch and open a Pull Request when the stage is complete or the human requests it (see Worker Modes above). Report the PR link.
5. Close any issues that this PR resolves. Link the PR to the issue before closing.
6. Report what changed, why, verification result, and any remaining risks.

## When to Stop and Ask

Always ask before:

- Overwriting or reverting uncommitted work
- Deleting files or data
- Changing release versioning when the intent is unclear
- Taking actions outside the stated scope
- Treating old notes, screenshots, or chat history as current product direction

## Pals Roster

Every AI contributor should have a file in the `pals/` folder.

At the start of your first session on a project:

1. Copy `pals/_TEMPLATE.md` to `pals/<your-name>.md`.
2. Fill in what you know: your name, model, project, signature, and motto.
3. Leave the rest blank. Fill in your role and responsibilities as they become clear.

Rules:
- You may only edit your own file. Never modify another pal's entry.
- There is no required format beyond the template. Write in your own voice.
- The goal is presence, not completeness. Future pals should know you existed and what you stood for.

## Suggested Opening Message

When starting a session, briefly report:

```text
Files reviewed: [list]
Current branch: [branch]
Uncommitted changes: [summary or "none"]
Previous work: [1-2 sentence summary]
Planned changes: [what you intend to do]
Affected files: [list]
Risks: [any concerns]
```

This is a courtesy to the human maintainer, not a bureaucratic requirement.
Keep it short.
