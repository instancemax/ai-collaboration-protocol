# AI Work Log Template

Use this template for `AI_WORK_LOG.md` in your project.

**Purpose:** Capture *why* decisions were made — context that git commit messages can't hold.  
Git tracks *what* changed. This log tracks *why*.

Do not duplicate information already clear from the commit history.

---

## Entry Template

```md
## YYYY-MM-DD HH:mm — <AI Name>

**Context:** Why this work was requested or needed.

**Decision:** Why this approach was chosen over alternatives.

**Changes:**
- <Change 1>
- <Change 2>

**Files changed:**
- `<path>`

**Version:** <new version> (reason: <why>) — or "no bump, documentation only"

**Verification:** `<command>` → <result>

**Notes for next contributor:** <risks, follow-ups, or constraints to be aware of>
```

---

## Example Entry

```md
## 2026-05-01 06:29 — Codex

**Context:** Project owner requested a shared AI handoff policy and mandatory versioning rules.

**Decision:** Created a single ASCII-only English guide to ensure compatibility across AI tools.

**Changes:**
- Added `AI_HANDOFF_GUIDE.md`
- Applied versioning rule immediately with a versionCode bump

**Files changed:**
- `AI_HANDOFF_GUIDE.md`
- `app/build.gradle.kts`

**Version:** 5621 / "QA Toolkit TLS" (reason: TLS Certificate Inspector feature shipped)

**Verification:** `.\gradlew.bat :app:compileDebugKotlin` → BUILD SUCCESSFUL

**Notes for next contributor:** Keep AI-facing process files ASCII-only. Do not modify `.claude/` unless the user asks.
```

---

## What Belongs Here vs. in Git

| Belongs in work log | Belongs in git commit |
|---|---|
| Why this approach was chosen | What files changed |
| Constraints or warnings for the next AI | Summary of what the change does |
| Ambiguous decisions and their reasoning | Ticket/issue references |
| Known risks or follow-ups | Co-author attribution |
