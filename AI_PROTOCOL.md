# AI Protocol

Read this before making any changes to the project.

---

## Before You Start

1. Read `AI_WORK_LOG.md` — understand what previous contributors did and why
2. Read `PRODUCT_PRINCIPLES.md` if present — know what this product is and is not
3. Run `git status --short --branch` — identify the current branch and any uncommitted changes
4. If another contributor has uncommitted changes, **do not overwrite them without asking**

## Before You Edit

State clearly:
- What you read and what state the project is in
- What you plan to change and why
- What files will be affected

This keeps the human maintainer informed and prevents silent surprises.

## While Working

- Do not revert user or prior AI changes unless explicitly asked
- If a conflict is ambiguous, ask before proceeding
- Prefer small, focused changes over large rewrites
- If the task would require touching something outside the stated scope, ask first

## After Working

1. Update `AI_WORK_LOG.md` with your context, decisions, and affected files
2. Bump the version if user-visible behavior changed (see `VERSIONING_RULES.md`)
3. Run the project's verification command and record the result
4. Report: what changed, why, verification result, and any remaining risks

## When to Stop and Ask

Always ask before:
- Overwriting or reverting uncommitted work
- Deleting files or data
- Changing release versioning when the intent is unclear
- Taking actions outside the stated scope

---

## Suggested Opening Message

When starting a session, briefly report:

```
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
