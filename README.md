# AI Collaboration Protocol

A lightweight protocol for AI-assisted software development.
Designed for projects where humans and multiple AI assistants share a codebase over time.

> Good process should preserve quality even when context is incomplete, memory is lost, or a different AI takes over.

## Why This Exists

AI assistants do not reliably carry memory across sessions. Without shared conventions, critical decisions stay trapped in chat history and the next contributor, human or AI, starts blind.

This protocol embeds the minimum useful context into the project itself.

## Core Principles

- Read before acting
- Declare before changing
- Preserve other people's work
- Log decisions that git commit messages cannot capture
- Version numbers reflect user-visible change, not AI session activity
- Keep the protocol small enough that people actually use it

## Files

| File | Purpose |
| --- | --- |
| `AI_PROTOCOL.md` | Main protocol every AI reads before working |
| `WORK_LOG_TEMPLATE.md` | Template for logging decisions and handoff context |
| `VERSIONING_RULES.md` | When and how to bump version numbers |
| `PRODUCT_PRINCIPLES_TEMPLATE.md` | Optional template for product direction |
| `PROTOCOL_DESIGN_RATIONALE.md` | For human maintainers only. AI sessions do not need to read this |

## Adopting This Protocol

1. Copy `AI_PROTOCOL.md`, `WORK_LOG_TEMPLATE.md`, and `VERSIONING_RULES.md` into your project root.
2. Create `AI_WORK_LOG.md` from the work log template. The first entry can be "Protocol adopted".
3. If the project needs product direction, copy `PRODUCT_PRINCIPLES_TEMPLATE.md` to `PRODUCT_PRINCIPLES.md` and fill it in.
4. If using Claude Code, paste the contents of `AI_PROTOCOL.md` into `CLAUDE.md` in the project root.
5. If using Cursor or a similar tool, put the contents of `AI_PROTOCOL.md` where the tool loads project instructions automatically.
6. If using a pure API flow, prepend `AI_PROTOCOL.md` to the system prompt or instruct the AI to read it at session start.

Suggested first commit message:

```text
docs: add AI collaboration protocol
```

## Tool-Supported vs. Pure API

| | Claude Code / Cursor | Pure API |
| --- | --- | --- |
| How protocol loads | Automatically through project instructions | Instruct AI to read `AI_PROTOCOL.md` |
| Memory between sessions | Partly handled by the tool | Stored in `AI_WORK_LOG.md` |
| Work log habit | AI can follow project rules | Remind the AI in your prompt |

## Living Document Rule

If a rule prevents real mistakes, keep it.
If a rule mainly creates ceremony, simplify or remove it.

The goal is sustainable quality, not compliance theater.
