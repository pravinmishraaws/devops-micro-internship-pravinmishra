---
name: pr-ready
description: >
  Reads your staged Git diff and produces a PR-readiness report and a draft PR
  description. This skill never commits, pushes, or opens the PR — it only
  gathers and analyzes. You act on the output yourself.
allowed-tools: Bash, Read, Grep
disable-model-invocation: true
---

# /pr-ready — Pull Request Readiness Check

## What this skill does

1. Reads the staged diff (`git diff --cached`)
2. Analyzes the changes for:
   - Hardcoded secrets or credentials
   - Debug statements left in
   - Large files
   - Mixed concerns (e.g., formatting + logic in one commit)
   - Missing context or unclear intent
3. Produces a PR-readiness report with:
   - Risk flags (if any)
   - A draft PR title
   - A draft PR description
   - Suggestions for improvement

## Usage

```bash
/pr-ready
```

## Important

This skill has **no Write permission**. It cannot commit, push, or open a PR.
Use its output as a starting point, review critically, and make your own edits
before creating the PR.
