# Versioning Rules

This file defines versioning behavior for AI-assisted projects.

The exact version file varies by platform:

- Android: `app/build.gradle.kts` or `build.gradle`
- Node: `package.json`
- Python: `pyproject.toml`, `setup.cfg`, or project-specific metadata
- iOS: `Info.plist` or project build settings

## Core Rule

Every feature change or bug fix must update the project version.

For Android projects:

- Increment `versionCode` by exactly 1.
- Update `versionName` to a short user-facing release name.

Example:

```kotlin
versionCode = 5621
versionName = "QA Toolkit TLS"
```

## When To Bump Version

Bump version for:

- User-visible features.
- Bug fixes.
- Build fixes.
- Release behavior changes.
- Data model changes.
- Migration changes.
- Permission changes.
- UI behavior changes.
- Export/report behavior changes.

Do not usually bump version for:

- Pure documentation changes.
- Comments only.
- Formatting only.
- Local development notes that do not affect app behavior.

If unsure, bump the version and explain why in the work log.

## Version Name Guidance

The version name is user-facing.
It should be short, understandable, and product-oriented.

Good examples:

- `QA Toolkit TLS`
- `Evidence Export`
- `OCR Search`
- `Session Reports`
- `Stability Fix`

Avoid:

- Pure numbers only, unless the project owner requires it.
- Internal branch names.
- Long technical descriptions.
- Jokes or unclear labels.

## Work Log Requirement

Every version change must be recorded in the work log:

```text
Previous versionCode:
New versionCode:
Previous versionName:
New versionName:
Version bump reason:
```

## Multiple Changes In One Batch

If one AI performs several related changes in a single coherent batch, increment versionCode once.

If changes are unrelated and should be released separately, split them into separate batches and increment versionCode for each batch.

## Documentation-Only Exception

If the change is documentation-only, do not bump version unless the project owner asks.

Still update the work log if the documentation is meaningful to project process or handoff.

