# AI Finish Checklist

Every AI assistant must complete this checklist before sending the final response after making changes.

The goal is to make the work reviewable, reproducible, and safe for the next AI or human maintainer.

## Required Steps

- [ ] Review changed files.
- [ ] Update the project work log.
- [ ] If behavior changed, increment internal version by 1.
- [ ] If behavior changed, update user-facing version name.
- [ ] Run the agreed verification command.
- [ ] Record verification result in the work log.
- [ ] Run `git status --short`.
- [ ] Note any untracked files.
- [ ] Note any warnings or residual risks.
- [ ] Mention changed files in the final response.
- [ ] Mention version changes in the final response.
- [ ] Mention where the work log entry was written.

## Suggested Final Response

```text
Done.

Changed:
- <summary>

Version:
- <old version> -> <new version>

Verification:
- <command>
- <result>

Work log:
- <file and timestamp>

Notes:
- <risks, warnings, or follow-up>
```

## Verification Failure Rule

If verification fails:

- Do not hide it.
- Record the failure in the work log.
- Fix the failure if it is in scope and safe.
- If it is not safe or not in scope, explain the blocker clearly.

## No Silent Finish

Do not end work after making changes without:

- Logging.
- Verifying.
- Reporting.

