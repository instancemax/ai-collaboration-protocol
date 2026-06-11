# Harness Checklist

A self-audit for any repository where AI agents work.
Copy this file into a project, walk through it, and record the result in the work log.
Re-run it whenever the project's workflow changes significantly.

The model is the engine. The harness is the rest of the car.
A weak harness wastes a strong model; a strong harness makes even a modest model reliable.

Based on a five-axis harness audit model adapted for this protocol family.

---

## How to score

For each item: ✅ in place / 🟡 partial / ❌ missing.
Don't aim for all-✅ on day one. Aim to know exactly where your gaps are,
and turn each ❌ you care about into an issue in the target repo.

---

## 1. Constrain — limit what agents can do

Mechanical walls beat polite requests. Prose constrains a cooperative agent; walls constrain every agent.

- [ ] Feature work happens on branches; main is never pushed directly
- [ ] Branch naming convention exists and is documented (`<agent>/<machine>/<short-description>`)
- [ ] Ownership boundaries are explicit (which files/areas an agent may not touch)
- [ ] Secrets and credentials are never in the repo; agents physically cannot read them
- [ ] Risky operations (deletes, migrations, releases) require explicit human approval

## 2. Inform — supply the right context at the right time

An agent's behaviour is determined by what its environment tells it at session start.

- [ ] `AI_PROTOCOL.md` (or equivalent) is loaded automatically at session start
- [ ] `AI_WORK_LOG.md` exists and the latest entry says what was done and what is next
- [ ] A backlog exists that an idle agent can pick tasks from without waiting for instructions
- [ ] Project-specific commands (build, test, run) are documented where agents will find them
- [ ] Stale documents are marked or removed, so agents cannot mistake old plans for current direction

## 3. Verify — check the work without trusting self-assessment

**This is the most commonly missing layer.** An agent's claim of "verified" is not verification.

- [ ] An automated test suite exists and can be run with a single documented command
- [ ] CI runs on every PR (tests + lint at minimum)
- [ ] Merging is blocked when CI is red
- [ ] A linter/formatter enforces code conventions mechanically
- [ ] "How to verify" is a required section in every PR description

## 4. Correct — catch and recover from mistakes

- [ ] PRs are reviewed by someone other than the author (human, or a second AI)
- [ ] A debugging circuit breaker rule exists (stop after 2 failed attempts, change approach)
- [ ] Work is checkpoint-committed so a dead session can be resumed, not restarted
- [ ] Reverting is cheap: small focused PRs, no giant rewrites

## 5. Humans in the loop — gate the high-stakes points

- [ ] The protocol lists actions that always require asking first
- [ ] A "waiting for human decision" list exists and agents know to add to it
- [ ] The human can see project status without reading raw diffs (status brief, ACTIVE_WORK)
- [ ] Notifications reach the human when something needs their decision

---

## Recording the result

Add an entry to the work log:

```text
## YYYY-MM-DD — Harness audit by <pal name>
Constrain: x/5  Inform: x/5  Verify: x/5  Correct: x/4  Humans: x/4
Top gaps: ...
Issues opened: #.., #..
```

The score is not a grade. It is a map of where the next harness investment should go.
