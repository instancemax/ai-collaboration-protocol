# AI Startup Checklist

Every AI assistant must complete this checklist before editing project files.

The goal is to make handoff visible, prevent accidental overwrites, and ensure the AI understands previous work.

## Required Steps

- [ ] Read `AI_HANDOFF_GUIDE.md`.
- [ ] Read the project work log, such as `AI_WORK_LOG.md` or `CODEX_DEV_LOG.md`.
- [ ] Read project-specific handoff notes, such as `HANDOFF.md`.
- [ ] Read the project's version/build file.
- [ ] Run `git status --short --branch`.
- [ ] Identify the current branch.
- [ ] Identify modified tracked files.
- [ ] Identify untracked files.
- [ ] Identify tool-owned folders or parallel worktrees.
- [ ] Summarize previous AI work.
- [ ] State the intended work area.
- [ ] State the expected files to touch.
- [ ] State any risks or uncertainties.

## Suggested Startup Message

```text
Startup checklist completed.

Required files read:
- AI_HANDOFF_GUIDE.md
- AI_WORK_LOG.md
- HANDOFF.md
- <version/build file>

Current branch:
- <branch>

Existing changes:
- <summary>

Previous AI work reviewed:
- <summary>

Planned work:
- <summary>

Expected touch area:
- <files or modules>

Risks:
- <risks or none>
```

## When To Stop And Ask

Ask the user before editing if:

- The same files are actively being edited by another AI or user.
- The task requires deleting or reverting uncommitted work.
- The requested change conflicts with documented project rules.
- The versioning intent is unclear for release-sensitive changes.

