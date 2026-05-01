# Project Adoption Guide

This guide explains how to adopt the AI Collaboration Protocol in a project repository.

## Step 1: Add Project Files

Add these files to the project root:

```text
AI_HANDOFF_GUIDE.md
AI_WORK_LOG.md
```

Optional but recommended:

```text
AI_STARTUP_CHECKLIST.md
AI_FINISH_CHECKLIST.md
VERSIONING_RULES.md
```

## Step 2: Link The Shared Protocol

At the top of the project `AI_HANDOFF_GUIDE.md`, add:

```text
This project follows the shared AI Collaboration Protocol:
https://github.com/<owner>/ai-collaboration-protocol
```

Then add project-specific rules below it.

## Step 3: Define Project Purpose

Write a short product purpose statement.

Example:

```text
This app is a QA evidence toolkit.
It helps testers capture, organize, search, and report mobile testing evidence.
```

This helps AI assistants choose features that fit the product direction.

## Step 4: Define Required Verification

Add the exact command every AI should run after changes.

Examples:

```text
.\gradlew.bat :app:compileDebugKotlin
npm test
pytest
cargo test
```

Also define when deeper verification is needed.

Example:

```text
If UI changes are made, run the app and inspect the changed screen manually or with browser/device tooling when available.
```

## Step 5: Define Versioning

For Android:

```text
Every feature or fix must increment versionCode by 1.
Every feature or fix must update versionName to a short user-facing release name.
```

For other platforms, define the equivalent version file and rule.

## Step 6: Require Work Log Entries

Create `AI_WORK_LOG.md` and add:

```text
Every AI must append an entry after feature, fix, refactor, or meaningful documentation changes.
Use the template from AI_WORK_LOG_TEMPLATE.md.
```

## Step 7: Human Review Habit

The human project owner should periodically review:

- Who changed what.
- Whether versioning was updated.
- Whether verification was run.
- Whether the current product direction is still clear.
- Whether AI notes reveal repeated pain points.

The protocol works best when both humans and AI treat it as a living system.

## Suggested First Commit

```text
docs: add AI collaboration protocol
```

## Suggested Prompt For Future AI

```text
Before working on this project, read AI_HANDOFF_GUIDE.md and the shared AI Collaboration Protocol.
Then complete AI_STARTUP_CHECKLIST, summarize previous AI work, and only then start editing.
Before final response, complete AI_FINISH_CHECKLIST and update AI_WORK_LOG.md.
```

