# AI Handoff Guide

This file defines the required behavior for AI assistants working on a software project.

Use this guide as a project-level rulebook.
Every AI must read it before making code, documentation, build, or release changes.

## Encoding Rule

- Keep AI-facing process documents in UTF-8.
- Prefer ASCII-only English for protocol files.
- Avoid localized text in protocol files unless the project owner explicitly asks for it.
- Do not mass rewrite existing localized project files only because they display poorly in one terminal.

## Required Reading Before Work

Before editing files, every AI must read:

- This handoff guide.
- The project work log, usually `AI_WORK_LOG.md` or `CODEX_DEV_LOG.md`.
- Any project-specific handoff file, such as `HANDOFF.md`.
- The build/version file, such as `app/build.gradle.kts`, `package.json`, `pyproject.toml`, or equivalent.

Then run:

```text
git status --short --branch
```

The AI must identify:

- Current branch.
- Existing modified files.
- Untracked files.
- Whether another AI or user may be working in parallel.

## Startup Response Requirement

Before editing, the AI should briefly report:

- It read the required files.
- What previous AI contributors did.
- What it plans to change.
- What files or areas it expects to touch.
- Whether it sees any risk from existing uncommitted changes.

This makes the process visible to the human maintainer.

## Respect Existing Work

Never assume uncommitted changes are safe to overwrite.

Rules:

- Do not revert user changes unless explicitly asked.
- Do not revert another AI's work unless explicitly asked.
- If an existing change overlaps with the task, inspect it and work with it.
- If a conflict is unclear, ask the user before proceeding.
- Treat hidden or tool-specific folders, such as `.claude/`, `.codex/`, `.idea/`, or worktree folders, as owned by their tools unless instructed otherwise.

## Work Log Requirement

Every feature, bug fix, refactor, build change, or meaningful documentation change must append an entry to the project work log.

The log entry must include:

- Timestamp with timezone.
- AI name.
- Context.
- Previous work reviewed.
- Decision.
- Changes.
- Files changed.
- Verification.
- Version changes, if any.
- Notes for the next AI.

## Versioning Requirement

If the change affects app behavior, user-visible functionality, build output, release behavior, or bug fixes:

- Increment the numeric internal version by exactly 1.
- Update the user-facing version name to a meaningful short name.
- Record the version change in the work log.

Documentation-only changes do not require a version bump unless the project owner asks.

See `VERSIONING_RULES.md`.

## Verification Requirement

After code or resource changes, run the project's agreed verification command.

Examples:

```text
.\gradlew.bat :app:compileDebugKotlin
npm test
cargo test
pytest
```

Record:

- Command.
- Result.
- Warnings or known limitations.
- Whether runtime UI verification was performed.

## Final Response Requirement

The final response should include:

- What changed.
- Why it changed.
- What verification was run.
- Any remaining risks.
- Whether versioning was updated.
- Where the log entry was written.

Keep the final response concise but complete.

## Product Alignment

Before adding a feature, ask:

- Does this support the product's core workflow?
- Does it reduce manual work?
- Does it improve evidence, reporting, debugging, testing, or maintenance?
- Does it introduce unnecessary scope?

Prefer features that strengthen the product's identity.

