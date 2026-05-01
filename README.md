# AI Collaboration Protocol

This repository defines a reusable working protocol for AI-assisted software development.

It is designed for projects where multiple AI assistants, human maintainers, and devices may touch the same codebase over time.

The goal is simple:

> Good process should preserve quality even when context is incomplete, memory is lost, or a different AI takes over.

## Why This Exists

AI assistants can be powerful, but they are not always continuous.
One AI may start a feature, another may fix a bug, and a human maintainer may need to understand what happened later.

Without a protocol, important knowledge stays trapped in chat history.
With a protocol, the project itself becomes the source of truth.

This protocol creates a shared culture:

- Read before acting.
- Explain before changing.
- Log after changing.
- Verify before finishing.
- Respect previous work.
- Keep versioning honest.

## Core Files

- `AI_HANDOFF_GUIDE.md`
  - The mandatory guide every AI must read before working.

- `AI_STARTUP_CHECKLIST.md`
  - The checklist every AI must complete before editing files.

- `AI_FINISH_CHECKLIST.md`
  - The checklist every AI must complete before final response.

- `AI_WORK_LOG_TEMPLATE.md`
  - A standard log entry format for recording AI work.

- `VERSIONING_RULES.md`
  - Rules for versionCode, versionName, and release naming.

- `PROJECT_ADOPTION_GUIDE.md`
  - How to adopt this protocol in a project repository.

## Recommended Project Setup

In each project repository, keep a project-specific handoff file such as:

```text
AI_HANDOFF_GUIDE.md
AI_WORK_LOG.md
```

At the top of that file, link back to this shared protocol:

```text
This project follows the shared AI Collaboration Protocol:
https://github.com/<owner>/ai-collaboration-protocol
```

## Minimal Rule Set

Every AI assistant must:

1. Read the required handoff files before editing.
2. Run `git status --short --branch`.
3. Summarize what previous AI contributors did.
4. State what it plans to touch.
5. Avoid overwriting user or other AI changes.
6. Update the work log after feature, fix, or refactor work.
7. Bump version when app behavior changes.
8. Run the agreed verification command.
9. Report changed files, verification result, and risks.

## Philosophy

This protocol is not meant to slow development down.
It is meant to make good work repeatable.

Good systems reduce dependence on individual memory.
Good systems make quality easier to maintain.
Good systems let future maintainers understand not only what changed, but why.

