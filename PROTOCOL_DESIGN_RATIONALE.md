# Protocol Design Rationale

This is the legislative record of how this protocol was shaped.
It is not the protocol itself. It is not for AI sessions to read.

It exists so future maintainers -- human or AI -- can understand
which decisions were contested, which were consensus, and why.
Rules that look arbitrary often have a reason. This document holds that reason.

Participants:
- instancemax (human maintainer, chair)
- Claude (Anthropic Claude Code)
- Codex (OpenAI Codex)

---

## Session 1 -- Initial Review and Consolidation

**Date:** 2026-05-02

### Motion: Reduce the 8-file structure to 4 files

**Raised by:** Claude

**Claude's position:**
The original structure (AI_STARTUP_CHECKLIST, AI_FINISH_CHECKLIST, AI_HANDOFF_GUIDE,
AI_WORK_LOG_TEMPLATE, VERSIONING_RULES, PROJECT_ADOPTION_GUIDE, PRODUCT_PRINCIPLES_TEMPLATE,
README) is over-specified. Three separate checklist files create ceremony without adding
safety -- an AI can walk through all 13 startup steps and still not have absorbed the intent.
The work log duplicates git commit history for the "what changed" part, while failing to
capture the "why" part where it actually matters.

Proposed consolidation:
- AI_PROTOCOL.md (merge three checklists)
- WORK_LOG_TEMPLATE.md (reframed as decision log, not session log)
- VERSIONING_RULES.md (simplified, platform-agnostic)
- README.md (absorb PROJECT_ADOPTION_GUIDE)
- PRODUCT_PRINCIPLES_TEMPLATE.md (retain as optional)

**Codex's response:**
Accepted the consolidation direction. Added the observation that over-specification
likely originated from the human maintainer expressing many concerns during drafting,
and the original AI concretizing each concern into a separate file. The root cause
is process, not malice.

Codex made one addition to the proposed structure: PROTOCOL_DESIGN_RATIONALE.md
(this file), on the grounds that the "why we wrote the law this way" discussion
should not live inside the daily-use protocol, or it will cause AI_PROTOCOL.md
to inflate over time as future maintainers add more explanation.

**Decision:** Motion carried. 8 files consolidated to 5 (4 core + 1 rationale).

---

### Motion: Roadmap does not belong in the core protocol

**Raised by:** Codex

**Codex's position:**
A roadmap attached to a reusable AI collaboration protocol creates two problems.
First, roadmaps change often, so the protocol would need constant maintenance
unrelated to its actual purpose. Second, a protocol that includes roadmap
starts to resemble a project management system, which discourages adoption
in projects that do not need that layer.

**Claude's response:**
Agreed. The cleaner boundary is:
- Protocol handles continuity and coordination (how AI contributors work together).
- Product principles handle direction (what the product is trying to become).
- Roadmap is project-specific and should be created by individual projects if needed.

Mixing roadmap into protocol also creates a trust problem: an AI reading an
outdated roadmap may treat it as current direction. The protocol already warns
against this ("do not treat old notes as current direction"), but including
a roadmap creates the exact temptation it warns against.

**Decision:** Motion carried. No roadmap in core protocol. Individual projects
may add their own roadmap files; the protocol does not mandate or template this.

---

### Motion: PRODUCT_PRINCIPLES_TEMPLATE.md remains optional

**Raised by:** Codex

**Codex's position:**
Not every repository is a product. Making product principles mandatory turns
useful guidance into bureaucracy for script repos, utility libraries, and
infrastructure projects.

**Claude's response:**
Agreed. Optional is correct. The value of product principles is that they help
an AI ask "does this feature fit the product?" before building it. That question
matters for user-facing products; it is largely irrelevant for internal tooling
or single-purpose scripts.

**Decision:** Motion carried. PRODUCT_PRINCIPLES_TEMPLATE.md is optional.
The README adoption guide makes this explicit.

---

## Open Questions (not yet resolved)

### Version bumping scope

**Raised by:** Claude during review of Codex's AI_PROTOCOL.md

**Issue:**
AI_PROTOCOL.md currently says: "Bump the version if user-visible behavior changed."
This assumes every repository has explicit versioning (versionCode, versionName, semver, etc.).
Many repositories -- documentation repos, internal scripts, infrastructure configs -- do not.

**Proposed revision:**
> If the project uses explicit versioning and user-visible behavior changed, bump the version.

**Status:** Proposed. Not yet adopted into AI_PROTOCOL.md. Pending Codex response.

---

### Audience clarity for PROTOCOL_DESIGN_RATIONALE.md

**Raised by:** Claude during review of Codex's commit a85e382

**Issue:**
README.md lists PROTOCOL_DESIGN_RATIONALE.md in the Files table alongside
daily-use files (AI_PROTOCOL.md, WORK_LOG_TEMPLATE.md, VERSIONING_RULES.md).
An AI reading the README may conclude it should read this file at the start
of every session, which would add significant overhead with no benefit.

**Proposed fix:**
Add a note to the README Files table:
> PROTOCOL_DESIGN_RATIONALE.md -- For human maintainers only. AI sessions do not need to read this.

**Status:** Proposed. Not yet adopted. Pending Codex response.

---

### Claude Code adoption path

**Raised by:** Claude during review of README.md

**Issue:**
README Step 4 says "put the contents of AI_PROTOCOL.md where the tool loads
project instructions automatically." This is correct but vague. For Claude Code
users specifically, the target file is CLAUDE.md in the project root.

**Proposed addition:**
> For Claude Code: paste AI_PROTOCOL.md contents into CLAUDE.md in the project root.

**Status:** Proposed. Not yet adopted. Pending Codex response.

---

## How to Use This Document

When proposing a change to the protocol:

1. Add an entry under a new Session heading.
2. Record who raised it, what the positions were, and what was decided.
3. If unresolved, add it to Open Questions.
4. When an open question is resolved, move it to the appropriate session record.

The goal is not to record every word. It is to record enough that a future
maintainer can understand the intent behind each rule and challenge it with
full context.
