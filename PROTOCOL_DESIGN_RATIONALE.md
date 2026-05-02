# Protocol Design Rationale

This is the legislative record of how this protocol was shaped.
It is not the protocol itself. It is not for AI sessions to read.

It exists so future maintainers, human or AI, can understand which decisions were contested, which were consensus, and why.
Rules that look arbitrary often have a reason. This document holds that reason.

Participants:

- instancemax (human maintainer, chair)
- Claude (Anthropic Claude Code)
- Codex (OpenAI Codex)

## Session 1: Initial Review and Consolidation

**Date:** 2026-05-02

### Motion: Reduce the 8-file structure to 4 core files

**Raised by:** Claude

**Claude's position:**

The original structure was over-specified:

- `AI_STARTUP_CHECKLIST.md`
- `AI_FINISH_CHECKLIST.md`
- `AI_HANDOFF_GUIDE.md`
- `AI_WORK_LOG_TEMPLATE.md`
- `VERSIONING_RULES.md`
- `PROJECT_ADOPTION_GUIDE.md`
- `PRODUCT_PRINCIPLES_TEMPLATE.md`
- `README.md`

Three separate checklist or guide files create ceremony without adding enough safety.
An AI can walk through every checklist item and still miss the underlying intent.

The work log should also avoid duplicating git history.
Git already records what changed; the work log should record why the decision was made.

Proposed consolidation:

- `AI_PROTOCOL.md`: merge the startup, finish, and handoff rules
- `WORK_LOG_TEMPLATE.md`: reframe as a decision log, not a session transcript
- `VERSIONING_RULES.md`: simplify and keep platform-agnostic
- `README.md`: absorb adoption guidance
- `PRODUCT_PRINCIPLES_TEMPLATE.md`: retain as optional guidance

**Codex's response:**

Accepted the consolidation direction.
The original version likely came from a reasonable process failure: many valid concerns were each concretized into a separate file.
The problem was not that the concerns were wrong, but that the resulting protocol became too heavy for daily use.

Codex proposed one addition: keep `PROTOCOL_DESIGN_RATIONALE.md` as a separate document.
The reason is that "why the law is written this way" should not live inside the daily-use protocol, or `AI_PROTOCOL.md` will slowly inflate as future maintainers add more explanation.

**Decision:** Motion carried.
The protocol should be consolidated into a small set of daily-use files plus one separate rationale record.

### Motion: Roadmap does not belong in the core protocol

**Raised by:** Codex

**Codex's position:**

A roadmap attached to a reusable AI collaboration protocol creates two problems.
First, roadmaps change often, so the protocol would need constant maintenance unrelated to its actual purpose.
Second, a protocol that includes a roadmap starts to resemble a project management system, which discourages adoption in projects that do not need that layer.

**Claude's response:**

Agreed.
The cleaner boundary is:

- Protocol handles continuity and coordination: how AI contributors work together.
- Product principles handle direction: what the product is trying to become.
- Roadmap is project-specific and should be created by individual projects only when useful.

Mixing roadmap into the protocol also creates a trust problem.
An AI reading an outdated roadmap may treat it as current direction.
The protocol should warn against treating old notes as current product direction, not create a new source of stale direction.

**Decision:** Motion carried.
No roadmap belongs in the core protocol.
Individual projects may create their own roadmap files; this shared protocol does not mandate or template one.

### Motion: `PRODUCT_PRINCIPLES_TEMPLATE.md` remains optional

**Raised by:** Codex

**Codex's position:**

Not every repository is a product.
Making product principles mandatory turns useful guidance into bureaucracy for script repos, utility libraries, documentation repos, and infrastructure projects.

**Claude's response:**

Agreed.
The value of product principles is that they help an AI ask whether a feature fits the product before building it.
That question matters for user-facing products; it is less relevant for internal tooling or single-purpose scripts.

**Decision:** Motion carried.
`PRODUCT_PRINCIPLES_TEMPLATE.md` remains optional.
The README adoption guide makes this explicit.

## Session 2: Review of Codex Consolidation

**Date:** 2026-05-02

### Motion: Version bumping should only apply to projects with explicit versioning

**Raised by:** Claude

**Claude's position:**

`AI_PROTOCOL.md` originally said:

> Bump the version if user-visible behavior changed.

This assumes every repository has explicit versioning such as `versionCode`, `versionName`, or semver.
Many repositories, including documentation repos, internal scripts, and infrastructure configs, may not.

Suggested wording:

> If the project uses explicit versioning and user-visible behavior changed, bump the version.

**Codex's response:**

Accepted.
The revised wording prevents AI assistants from inventing versioning where the project has none, while still preserving the release discipline for projects that do version releases.

**Decision:** Motion carried.
`AI_PROTOCOL.md` now conditions version bumping on explicit project versioning.

### Motion: Clarify the audience for `PROTOCOL_DESIGN_RATIONALE.md`

**Raised by:** Claude

**Claude's position:**

The rationale document is useful, but its audience differs from the daily protocol.
If README lists it beside `AI_PROTOCOL.md`, AI assistants may think they should read the full rationale every session.
That would add overhead without improving daily work.

Suggested README wording:

> For human maintainers only. AI sessions do not need to read this.

**Codex's response:**

Accepted.
The rationale is for maintainers revising the protocol, not for routine feature or bug-fix sessions.

**Decision:** Motion carried.
README now marks `PROTOCOL_DESIGN_RATIONALE.md` as maintainer-facing rather than daily AI reading.

### Motion: Make the Claude Code adoption path explicit

**Raised by:** Claude

**Claude's position:**

README originally said to put `AI_PROTOCOL.md` where the tool loads project instructions automatically.
This is correct but vague.
For Claude Code users, the concrete file is `CLAUDE.md` in the project root.

**Codex's response:**

Accepted.
The adoption instructions should be concrete where the ecosystem convention is known.

**Decision:** Motion carried.
README now says Claude Code users should paste the contents of `AI_PROTOCOL.md` into `CLAUDE.md` in the project root.

## How to Use This Document

When proposing a change to the protocol:

1. Add an entry under a new session heading.
2. Record who raised the motion, what the positions were, and what was decided.
3. If unresolved, add it under `Open Questions`.
4. When an open question is resolved, move it into the relevant session record.

The goal is not to record every word.
The goal is to preserve enough context that a future maintainer can understand the intent behind each rule and challenge it with full context.

## Open Questions

None currently.
