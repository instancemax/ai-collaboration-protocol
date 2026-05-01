# AI Collaboration Protocol

A lightweight protocol for AI-assisted software development.  
Designed for projects where multiple AI assistants and humans share a codebase over time.

> Good process should preserve quality even when context is incomplete, memory is lost, or a different AI takes over.

---

## Why This Exists

AI assistants don't retain memory across sessions. Without shared conventions, critical decisions stay trapped in chat history and the next contributor — human or AI — starts blind.

This protocol embeds context into the project itself.

---

## Core Principles

- Read before acting
- Declare before changing
- Log decisions that git commit messages can't capture
- Version numbers reflect user-visible change, not AI session activity
- When in doubt, ask before acting

---

## Files

| File | Purpose |
|------|---------|
| `AI_PROTOCOL.md` | Main protocol — every AI reads this before working |
| `WORK_LOG_TEMPLATE.md` | Template for logging decisions and context |
| `VERSIONING_RULES.md` | When and how to bump version numbers |
| `PRODUCT_PRINCIPLES_TEMPLATE.md` | Template to define product direction (optional, per project) |

---

## Adopting This Protocol

1. Copy `AI_PROTOCOL.md`, `WORK_LOG_TEMPLATE.md`, and `VERSIONING_RULES.md` into your project root
2. Create `AI_WORK_LOG.md` from the template (first entry: "Protocol adopted")
3. **If using Claude Code or Cursor:** paste the contents of `AI_PROTOCOL.md` into your `CLAUDE.md` — the tool loads it automatically each session
4. **If using pure API:** prepend the contents of `AI_PROTOCOL.md` to your system prompt, or instruct the AI to read it at session start
5. Optionally fill in `PRODUCT_PRINCIPLES_TEMPLATE.md` → save as `PRODUCT_PRINCIPLES.md`

First commit message: `docs: add AI collaboration protocol`

---

## Tool-Supported vs. Pure API

| | Claude Code / Cursor | Pure API |
|---|---|---|
| How protocol loads | Automatically via `CLAUDE.md` | Instruct AI to read `AI_PROTOCOL.md` |
| Memory between sessions | Handled by tool's memory system | Entirely via `AI_WORK_LOG.md` |
| Work log | AI follows on its own | Remind AI in your prompt |

---

## Treating This as a Living Document

If a rule causes more friction than it prevents, remove it.  
The goal is sustainable quality, not compliance theater.
