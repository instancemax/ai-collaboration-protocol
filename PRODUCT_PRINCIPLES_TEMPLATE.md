# Product Principles Template

Use this template to help AI assistants understand the product direction before proposing or implementing features.

Recommended project file name:

```text
PRODUCT_PRINCIPLES.md
```

## Product Identity

What is this product becoming?

```text
<Example: This app is a QA evidence toolkit for mobile testers.>
```

## Core User

Who is the primary user?

```text
<Example: QA testers, PMs, developers, and anyone who needs to collect mobile test evidence.>
```

## Core Workflow

What workflow should the product make smoother?

```text
<Example: Run a test case, capture screenshots, record context, find important text, and export a report.>
```

## Product Focus

Features should strengthen these areas:

- <Focus 1>
- <Focus 2>
- <Focus 3>
- <Focus 4>

Example:

- Test case based evidence collection.
- Screenshot organization and search.
- Issue reporting.
- Environment verification.

## Non-Goals

Features should avoid these areas unless the project owner explicitly asks:

- <Non-goal 1>
- <Non-goal 2>
- <Non-goal 3>

Example:

- Unrelated lifestyle utilities.
- Large social features.
- Features that dilute the QA workflow.

## Feature Evaluation Questions

Before adding a feature, AI should answer:

- Does this help the core user?
- Does this reduce manual effort?
- Does this improve evidence quality?
- Does this improve reporting or debugging?
- Does this fit the product identity?
- Is there a smaller first version?

## Quality Bar

New features should be:

- Easy to explain.
- Easy to verify.
- Logged in the work log.
- Covered by versioning rules when behavior changes.
- Consistent with existing UI and architecture.

## Example Product Direction Statement

```text
This product should become a daily QA toolkit.
It should help testers capture evidence, organize screenshots, extract useful text, verify environments, and generate reports.
When choosing new features, prefer tools that make testing, recording, and reporting smoother.
```

