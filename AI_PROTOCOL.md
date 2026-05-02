# AI Protocol

Read this before making any changes to the project.

## Before You Start

1. Read `AI_WORK_LOG.md` to understand what previous contributors did and why.
2. Read `PRODUCT_PRINCIPLES.md` if present to understand what this product is and is not.
3. Run `git status --short --branch` to identify the current branch and any uncommitted changes.
4. If another contributor has uncommitted changes, do not overwrite them without asking.

## Before You Edit

State briefly:

- What you read
- What state the project is in
- What you plan to change and why
- What files or areas will be affected
- Any uncertainty that could change the decision

This keeps the human maintainer informed and prevents silent surprises.

## While Working

- Preserve user and prior AI changes unless explicitly asked to revert them.
- If a conflict is ambiguous, ask before proceeding.
- Prefer small, focused changes over large rewrites.
- If the task would require touching something outside the stated scope, ask first.
- Use product principles as direction, not as a rigid checklist.

## After Working

1. Update `AI_WORK_LOG.md` with context, decisions, affected files, verification, and remaining risks.
2. If the project uses explicit versioning and user-visible behavior changed, bump the version. See `VERSIONING_RULES.md`.
3. Run the project's verification command and record the result.
4. Report what changed, why, verification result, and any remaining risks.

## When to Stop and Ask

Always ask before:

- Overwriting or reverting uncommitted work
- Deleting files or data
- Changing release versioning when the intent is unclear
- Taking actions outside the stated scope
- Treating old notes, screenshots, or chat history as current product direction

## Suggested Opening Message

When starting a session, briefly report:

```text
Files reviewed: [list]
Current branch: [branch]
Uncommitted changes: [summary or "none"]
Previous work: [1-2 sentence summary]
Planned changes: [what you intend to do]
Affected files: [list]
Risks: [any concerns]
```

This is a courtesy to the human maintainer, not a bureaucratic requirement.
Keep it short.
