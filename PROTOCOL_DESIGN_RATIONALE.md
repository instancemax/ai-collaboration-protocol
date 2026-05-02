# Protocol Design Rationale

This document is not the protocol itself.
It explains why the protocol is shaped the way it is, so future maintainers can revise the rules without losing the intent behind them.

In other words: `AI_PROTOCOL.md` is the law. This file is the legislative debate.

## The Core Problem

AI-assisted development has a strange failure mode: the work can be technically correct inside one chat session and still become fragile across time.

The missing piece is not intelligence. It is continuity.

An AI may understand the code today, but the next AI may not know:

- What was already attempted
- Which changes were intentional
- Which files were touched by a human
- Why one approach was chosen over another
- Whether a version bump was product-driven or just session noise

The protocol exists to preserve enough continuity for the next contributor to act responsibly.

## Why The Protocol Is Small

A protocol that tries to prevent every possible mistake becomes its own source of failure.
People skip it. AI assistants summarize it badly. The project gains ceremony without gaining judgment.

So the daily protocol should only contain rules that prevent common, costly mistakes:

- Read the local context before acting.
- Announce the intended change before editing.
- Preserve uncommitted work.
- Record decisions that will matter later.
- Verify the result.

Everything else belongs in optional project guidance or in this rationale document.

## Why "Read Before Acting"

AI assistants are good at pattern completion, which is useful and dangerous.
Without reading the current state, an assistant may confidently apply an old plan to a changed repository.

The rule is intentionally simple: read the work log, product principles if present, and git status.
That gives the AI three kinds of memory:

- Historical memory: what happened before
- Product memory: what the project is trying to become
- Mechanical memory: what changed in the working tree

## Why "Declare Before Changing"

Declaring intent creates a short checkpoint before files are modified.
It gives the human maintainer a chance to catch scope drift, wrong assumptions, or accidental overwrites.

This is not meant to become a meeting.
A few lines are enough.

## Why The Work Log Exists

Git is excellent at preserving what changed.
It is weak at preserving why a decision was made, especially when the decision happened in chat.

The work log should not duplicate commits.
It should capture the missing context:

- The reason for the work
- The tradeoff chosen
- The verification result
- The risk or follow-up the next contributor should know

The test for a good work log entry is simple: would this help a capable contributor resume the work a week later?

## Why Versioning Is Tied To User-Visible Change

AI sessions are not releases.

Version numbers should represent product change, not effort, chat length, or number of assistants involved.
This keeps release history meaningful to users and maintainers.

The rule is also meant to prevent the opposite mistake: shipping a behavior change without marking it.
When the user experience changes, the version should usually change too.

## Why Product Principles Are Optional

Many AI mistakes are not code mistakes. They are product-shape mistakes.
An assistant can build a clean feature that dilutes the product.

`PRODUCT_PRINCIPLES.md` gives the AI a lightweight way to ask:

- Who is this for?
- What workflow matters?
- What should this product avoid becoming?

But product principles are optional because not every repository is a product, and not every small tool needs that layer.
Making them mandatory would turn useful guidance into bureaucracy.

## Why There Is No Mandatory Roadmap

A roadmap can be valuable inside a product repository.
But as part of a reusable AI collaboration protocol, a mandatory roadmap is too heavy.

Roadmaps change often. They invite prioritization debates. They can make a small protocol feel like a management system.

The better boundary is:

- Keep product direction optional through `PRODUCT_PRINCIPLES.md`.
- Let individual projects create a roadmap if they need one.
- Warn AIs not to treat old notes as current direction without checking.

## Why "Ask Before Destructive Or Ambiguous Actions"

The protocol does not ask the AI to stop whenever it is uncertain.
That would make it timid and slow.

It asks the AI to stop when the cost of being wrong is high:

- Overwriting someone else's work
- Deleting files or data
- Changing release semantics
- Expanding beyond the requested scope

This is the difference between useful autonomy and reckless autonomy.

## How To Revise The Protocol

When changing the protocol, ask:

1. Does this rule prevent a real recurring failure?
2. Can the rule be followed quickly during ordinary work?
3. Is this daily-use protocol, or should it be rationale/reference material?
4. Does it improve continuity without reducing momentum?
5. Would a future AI know what to do after reading it?

If a rule passes those tests, keep it.
If not, simplify it or move it out of the core protocol.

## The Underlying Philosophy

This protocol is not trying to make AI obedient.
It is trying to make AI legible.

Good collaboration does not require every contributor to think the same way.
It requires each contributor to leave enough evidence that the next one can understand the path, challenge it, and continue with care.
