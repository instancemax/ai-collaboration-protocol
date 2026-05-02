# Versioning Rules

These rules apply to projects using this protocol.
Adapt the version file location to the platform.

## When to Bump Version

Bump for:

- User-visible features
- Bug fixes
- UI or behavior changes
- Data model or migration changes
- Permission changes
- Build fixes that affect release output

Do not bump for:

- Documentation only
- Comments or formatting only
- Development notes with no effect on app behavior

If unsure, choose the smaller release boundary that a user would understand, then explain the decision in `AI_WORK_LOG.md`.

## How to Bump

Increment the version by 1, or follow the platform's normal convention.
Give the release a short, user-facing name that describes the change.

Good version names:

- `Evidence Export`
- `OCR Search`
- `Session Reports`
- `Stability Fix`

Avoid:

- Pure numbers with no label
- Internal branch names
- Long technical descriptions
- Names that describe the AI session instead of the product change

## Platform Reference

| Platform | Version file | Fields |
| --- | --- | --- |
| Android | `app/build.gradle` or `build.gradle.kts` | `versionCode`, `versionName` |
| Node.js | `package.json` | `version` |
| Python | `pyproject.toml` or `setup.cfg` | `version` |
| iOS | `Info.plist` or build settings | `CFBundleVersion`, `CFBundleShortVersionString` |

## Batching Rule

- Related changes in one coherent release batch: one version increment
- Unrelated changes intended for separate releases: separate increments

## Work Log Requirement

Every version bump must have a corresponding entry in `AI_WORK_LOG.md` explaining what changed and why.
