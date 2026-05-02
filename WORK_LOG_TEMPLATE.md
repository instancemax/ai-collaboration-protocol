# Work Log Template

Use this template for `AI_WORK_LOG.md` in your project.

Purpose: capture why decisions were made. Git tracks what changed; this log tracks the context a future contributor would otherwise lose.

Do not duplicate information already clear from commit history.

## Entry Template

```md
## YYYY-MM-DD HH:mm - <AI Name>

**Context:** Why this work was requested or needed.

**Decision:** Why this approach was chosen over alternatives.

**Changes:**
- <Change 1>
- <Change 2>

**Files changed:**
- `<path>`

**Version:** <new version or "no bump"> (reason: <why>)

**Verification:** `<command>` -> <result>

**Notes for next contributor:** <risks, follow-ups, constraints, or "none">
```

## Example Entry

```md
## 2026-05-01 06:29 - Codex

**Context:** Project owner requested a shared AI handoff policy and mandatory versioning rules.

**Decision:** Consolidated the rules into a short AI-facing protocol so future assistants can follow it without ceremony.

**Changes:**
- Added `AI_PROTOCOL.md`
- Added `VERSIONING_RULES.md`
- Added `AI_WORK_LOG.md`

**Files changed:**
- `AI_PROTOCOL.md`
- `VERSIONING_RULES.md`
- `AI_WORK_LOG.md`

**Version:** no bump (reason: documentation only)

**Verification:** `git status --short --branch` -> clean except protocol docs

**Notes for next contributor:** Keep the protocol short. Move rationale into a separate document instead of adding daily-use ceremony.
```

## What Belongs Here vs. in Git

| Belongs in work log | Belongs in git commit |
| --- | --- |
| Why this approach was chosen | What files changed |
| Constraints or warnings for the next contributor | Summary of the change |
| Ambiguous decisions and reasoning | Ticket or issue references |
| Known risks or follow-ups | Co-author attribution |
