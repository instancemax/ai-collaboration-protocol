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

## Session 5: Field Feedback from Working Pals

**Date:** 2026-05-16

**Source:** Three AI contributors (龜仔, 霧仔, 元鼠) submitted structured feedback after using the protocol in real projects. This session documents the improvements adopted in response.

### Motion: Add a debugging circuit breaker

**Raised by:** 霧仔

**Position:**
The protocol guides the AI through before/after states but gives no guidance for the middle: when the AI is stuck in a loop, trying the same approach repeatedly. In practice, attempting the same direction more than twice without progress is a signal to stop and re-analyse, not persist.

**Decision:** Motion carried.
"While Working" now includes a circuit breaker rule: after two failed attempts in the same direction, stop, re-state the problem, and change approach or ask for help.

### Motion: Require technical verification before proposing a plan

**Raised by:** 霧仔

**Position:**
"State what you plan to change" is not sufficient if the plan is built on an unverified assumption. In one case, a non-existent CLI flag was confidently proposed. The protocol should require that technical prerequisites — flags, endpoints, paths, versions — are confirmed to exist before a plan is stated.

**Decision:** Motion carried.
"Before You Edit" now includes a verification step before stating the plan.

### Motion: Prevent parallel version-bump conflicts

**Raised by:** 元鼠

**Position:**
When multiple cloud AI sessions run concurrently, each bumping the version from the same base commit, the result is a series of conflicting PRs that the human maintainer must resolve manually. The protocol should enforce sequential version bumping.

**Decision:** Motion carried.
"After Working" now states that only one AI should bump the version at a time. If another branch has already bumped from the same base, the conflict must be resolved before opening a PR.

### Motion: Recommend per-session log files for high-concurrency projects

**Raised by:** 元鼠

**Position:**
Prepending to a single `AI_WORK_LOG.md` file causes merge conflicts when multiple PRs land close together. The structural solution is one log file per session, merged periodically by the human maintainer.

**Decision:** Motion carried with a note.
The protocol now recommends per-session log files as an option for projects with many parallel contributors. It remains optional — single-file logs are still appropriate for lower-concurrency projects.

### Motion: Require checking for conflicting open PRs before starting work

**Raised by:** 元鼠

**Position:**
A PR was made redundant by a later PR covering the same scope — the earlier work was wasted. Checking for overlapping open PRs before starting is a low-cost step that prevents this.

**Decision:** Motion carried.
"Before You Start" now includes a step to check for conflicting open PRs and surface any overlap to the human maintainer.

### Motion: Require closing related issues when merging a PR

**Raised by:** 元鼠

**Position:**
Multiple completed issues were left open after their corresponding PRs merged. The human maintainer had to close them manually. The protocol should require the AI to close resolved issues as part of the post-work step.

**Decision:** Motion carried.
"After Working" and "Using Issue Trackers" now state that issues resolved by a PR must be closed and linked before or at the time of merge.

## Session 6: Task Weight Modes

**Date:** 2026-05-16

### Motion: Make protocol overhead proportional to task risk

**Raised by:** instancemax, after receiving additional field feedback from 叩叩魯

**Field feedback:**

The protocol works well for long-running, multi-agent, multi-PR collaboration.
It prevents handoff loss by making contributors record context, preserve other people's work, link issues, explain PRs, and keep versioning intentional.

The problem is not that these safeguards are wrong.
The problem is that they can feel too heavy for small edits.
If every wording tweak, tiny UI copy change, or local documentation adjustment triggers the full administrative path, AI contributors spend too much time deciding which document is the latest source of truth and too many tokens restating low-risk context.

**Codex's position:**

Accepted the feedback.
This is the same principle as Session 3, but stated at the protocol level: overhead should scale with risk.

The protocol should keep the safety rules, but classify tasks into lightweight, standard, and high-risk modes.
This lets small changes stay small while preserving stronger safeguards for behaviour changes, release work, high-concurrency branches, migrations, architecture, and cross-PR integration.

**Decision:** Motion carried.
`AI_PROTOCOL.md` now includes "Task Weight Modes".
The goal is not to weaken discipline, but to make discipline proportional enough that contributors keep following it.

## Session 7: Allow AI Self-Merge

**Date:** 2026-05-22

### Motion: Remove the prohibition on AI self-merging PRs

**Raised by:** instancemax

**Position:**

The original rule ("Do not merge the PR yourself, under any circumstances") was intended to keep the human maintainer in control of what lands on the main branch. In practice, it created friction: merge conflicts accumulated while waiting for the human to resolve them, and the bottleneck slowed down parallel AI workflows.

**Decision:** Motion carried.
AI contributors may now self-merge their own PRs. The responsibility for resolving merge conflicts before merging moves to the AI contributor. The human maintainer retains the option to review before merge but is no longer required to be the one who clicks merge.

## Session 8: Protocol Readability and Multi-Machine Branch Naming

**Date:** 2026-05-22

### Motion: Add version number, quick-start section, and recent-changes log to the protocol

**Raised by:** 可露朵 (Claude), prompted by instancemax

**Position:**

As the protocol grew through five sessions of amendments, two usability problems emerged:

First, new AI contributors joining a project have no fast entry point. They face the full protocol on their first read, which consumes context and risks missing the most important rules among the detail.

Second, returning AI contributors (or existing pals picking up after an update) have no way to know what changed since their last session. They either re-read everything or risk operating on outdated rules.

Proposed fix: add three elements to the top of `AI_PROTOCOL.md`:
- A version number and date in the header (so pals can anchor their knowledge to a version).
- A "New Pal? Start Here" section: five core rules in 30 seconds.
- A "What Changed Recently" section: rolling summary of the last three versions.

**Decision:** Motion carried.
Protocol header now includes version and date. Quick-start and recent-changes sections added above the main body.

### Motion: Update branch naming convention for multi-machine environments

**Raised by:** instancemax

**Position:**

With multiple AI agents running on multiple machines (MacBook, Windows, cloud), the two-segment branch name `<agent>/<description>` is no longer sufficient to distinguish contributors. Two Claude Code sessions on different machines would produce identical branch prefixes, making it impossible to tell them apart in the git log.

Three-segment naming `<agent>/<machine>/<short-description>` makes every contributor uniquely identifiable at a glance.
Pal names are better kept in PR bodies, work logs, and `pals/<name>.md` because they are cultural signatures rather than stable mechanical identifiers. A short pal slug may be added to the description segment only when needed to disambiguate multiple pals sharing the same agent and machine.

**Decision:** Motion carried.
Branch naming convention updated to `<agent>/<machine>/<short-description>`. The machine segment may be omitted when only one machine is in use.

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
