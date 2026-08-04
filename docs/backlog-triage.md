# Backlog triage

Use this when converting upstream or fork issues into work that can land through the PR sequence in `.cursor/rules/github-delivery.mdc`.

## Labels

| Label | Meaning |
|-------|---------|
| `bug` | Reproducible defect with expected vs actual behavior |
| `enhancement` | New capability that does not fix a regression |
| `question` | Support / how-to; close with docs link when possible |
| `obsolete` | Fixed upstream, no longer applies, or superseded |
| `needs-fixture` | Validated defect waiting for a regression fixture before code changes |

## Workflow

1. Reproduce on a clean checkout with `npm ci` and the settings fixtures where possible.
2. If it is a defect, add or sketch a fixture/test first (`needs-fixture`), then fix in a dedicated PR.
3. If it is an enhancement, link it to the matching modernization stage (settings contract, Electron trust boundary, runtime reliability, AHK v2).
4. Prefer small issues that map to one PR. Split large reports before coding.

## Release checklist

See [releases.md](releases.md) and [manual-regression.md](manual-regression.md).
