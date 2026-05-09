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

## Session 3: Context Loading Reform

**Date:** 2026-05-03

### Motion: Reduce execution cost without weakening the safety rules

**Raised by:** instancemax, after gathering feedback from Codex companion sessions

**Community feedback:**

Companion AI sessions reviewing real project workflows agreed that the protocol's safety goals are useful, but that the largest practical cost is repeated full-context loading.

The recurring concerns were:

- Reading many long handoff, work log, roadmap, and checklist files every session consumes time and tokens.
- A work log can become a running transcript if every command, failed test, and intermediate patch is recorded.
- Full-history reading is useful for onboarding or high-risk work, but wasteful for small localized tasks.
- The most important daily safety checks are still lightweight: `git status`, recent work context, relevant product direction, verification, and avoiding other contributors' changes.

**Codex's position:**

Accepted the feedback.
This is not a request to remove the safety net. It is a request to stop making every session carry the entire net.

The protocol should prefer summary-first context loading:

- Always check the working tree first.
- Read latest work log entries or a current-state summary before reading history.
- Read deep history only when the task touches related areas, context is unclear, or the change is high-risk.
- Keep work log entries decision-focused rather than transcript-like.

**Decision:** Motion carried.
`AI_PROTOCOL.md` now instructs AI sessions to use summary-first context loading.
`WORK_LOG_TEMPLATE.md` now discourages command transcripts and recommends concise entries per meaningful task or release batch.

## Session 4: Issue Trackers as Backlog, Not Handoff Replacement

**Date:** 2026-05-09

### Motion: Encourage AI contributors to use GitHub Issues when available

**Raised by:** instancemax

**instancemax's position:**

AI assistants often identify development directions, product planning items, bugs, and backlog items while working.
Instead of leaving those only in chat or local roadmap files, assistants should be allowed to place appropriate items into GitHub Issues when a repository uses issues.

The open concern was whether GitHub Issues conflict with existing protocol documents such as work logs, handoff files, product principles, and other project-maintained documents.

**Codex's response:**

Accepted the direction with a boundary.
Issue trackers are valuable because they are shared, searchable, assignable, and discussion-friendly.
They are a better home for backlog and prioritization than long chat history.

However, issues should not replace handoff/work-log files.
The protocol documents serve different roles:

- Work logs and handoff files preserve current working context, decisions, verification, and risks.
- Product principles preserve product direction and constraints.
- Issues track backlog, product planning, bugs, open questions, and discussion.
- Pull requests and commits record implemented changes.

The healthiest pattern is to link these artifacts instead of merging their roles.
For example, a work-log entry can mention which issue was addressed, and an issue can link to the PR that resolves it.

**Decision:** Motion carried.
`AI_PROTOCOL.md` now includes a short "Using Issue Trackers" section.
It encourages issue tracker use for backlog and planning while explicitly saying issues do not replace handoff/work-log files.

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
