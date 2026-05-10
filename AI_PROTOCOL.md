# AI Protocol

Read this before making any changes to the project.

## Before You Start

1. Run `git status --short --branch` to identify the current branch and any uncommitted changes.
2. Read the latest `AI_WORK_LOG.md` entries or summary first.
3. Read `PRODUCT_PRINCIPLES.md` if present and relevant to the task.
4. Read deeper historical logs or full background files only when the task touches related areas, context is unclear, or the change is high-risk.
5. If another contributor has uncommitted changes, do not overwrite them without asking.

Prefer summary-first context loading. The goal is to understand enough to work safely, not to re-read all project history every session.

## Before You Edit

State briefly:

- What you read
- What state the project is in
- What you plan to change and why
- What files or areas will be affected
- Any uncertainty that could change the decision

This keeps the human maintainer informed and prevents silent surprises.

## While Working

- Preserve user and prior AI changes unless explicitly asked to revert them.
- If a conflict is ambiguous, ask before proceeding.
- Prefer small, focused changes over large rewrites.
- If the task would require touching something outside the stated scope, ask first.
- Use product principles as direction, not as a rigid checklist.

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

## Branching and Pull Requests

Work on a dedicated branch, not directly on the main branch.

Suggested branch naming: `<agent>/<short-description>` (e.g. `claude/loki-aggregation`, `codex/fix-auth-bug`).

When it is time to push (see Worker Modes above):

1. Push the branch to `origin`.
2. Open a Pull Request from the feature branch into the main branch.
3. Title: imperative phrase summarising the work (e.g. `feat: add log aggregation stack`).
4. Body: what changed, why, how to verify, any remaining risks.
5. **Do not merge the PR yourself, under any circumstances.** The human maintainer reviews and merges all PRs. This is non-negotiable — even if the PR looks clean and CI passes.

## After Working

1. Update `AI_WORK_LOG.md` with context, decisions, affected files, verification, and remaining risks.
2. If the project uses explicit versioning and user-visible behavior changed, bump the version. See `VERSIONING_RULES.md`.
3. Run the project's verification command and record the result.
4. Push the branch and open a Pull Request when the stage is complete or the human requests it (see Worker Modes above). Report the PR link.
5. Report what changed, why, verification result, and any remaining risks.

## When to Stop and Ask

Always ask before:

- Overwriting or reverting uncommitted work
- Deleting files or data
- Changing release versioning when the intent is unclear
- Taking actions outside the stated scope
- Treating old notes, screenshots, or chat history as current product direction

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
