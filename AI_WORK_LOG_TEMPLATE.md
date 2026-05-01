# AI Work Log Template

Use this template for project work logs.

Recommended project file name:

```text
AI_WORK_LOG.md
```

If a project already has a tool-specific file such as `CODEX_DEV_LOG.md`, either continue using it or migrate to `AI_WORK_LOG.md`.

## Entry Template

```md
## YYYY-MM-DD HH:mm:ss +TZ - <AI Name>

### Startup Checklist

- AI_HANDOFF_GUIDE.md read: yes/no
- AI_WORK_LOG.md or CODEX_DEV_LOG.md read: yes/no
- HANDOFF.md read: yes/no/not present
- Version/build file read: yes/no
- git status checked: yes/no

### Previous Work Reviewed

- <What previous AI or human contributors changed.>
- <Your assessment of whether those changes fit the product direction.>

### Context

<Why this work was requested or needed.>

### Decision

<Why this approach was chosen.>

### Changes

- <Change 1>
- <Change 2>
- <Change 3>

### Files Changed

- `<path>`
- `<path>`

### Version

- Previous versionCode: <value>
- New versionCode: <value>
- Previous versionName: <value>
- New versionName: <value>
- Version bump reason: <reason or documentation-only no bump>

### Verification

Command:

```text
<command>
```

Result:

```text
<result>
```

### Notes For Next AI

- <Risk, follow-up, or warning.>
```

## Example Entry

```md
## 2026-05-01 06:29:20 +08:00 - Codex

### Startup Checklist

- AI_HANDOFF_GUIDE.md read: yes
- CODEX_DEV_LOG.md read: yes
- HANDOFF.md read: yes
- Version/build file read: yes
- git status checked: yes

### Previous Work Reviewed

- Claude Code added TC export, screenshot search, and foreground app capture.
- Codex added TLS certificate inspection.
- Assessment: these changes support the QA toolkit product direction.

### Context

The project owner requested a shared AI handoff policy and mandatory versioning rule.

### Decision

Create an AI-facing guide in ASCII-only English and apply the version rule immediately.

### Changes

- Added `AI_HANDOFF_GUIDE.md`.
- Updated versionCode and versionName.
- Updated the work log.

### Files Changed

- `AI_HANDOFF_GUIDE.md`
- `app/build.gradle.kts`
- `CODEX_DEV_LOG.md`

### Version

- Previous versionCode: 5620
- New versionCode: 5621
- Previous versionName: 5620
- New versionName: QA Toolkit TLS
- Version bump reason: User-visible TLS Certificate Inspector feature and build fixes.

### Verification

Command:

```text
.\gradlew.bat :app:compileDebugKotlin
```

Result:

```text
BUILD SUCCESSFUL
```

### Notes For Next AI

- Keep AI-facing process files ASCII-only.
- Do not modify `.claude/` unless the user asks.
```

