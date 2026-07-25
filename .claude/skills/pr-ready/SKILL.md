---
name: pr-ready
description: Reads staged changes and drafts a Pull Request title, description, and a list of things worth a second look, without committing, pushing, or opening the PR itself.
allowed-tools: Bash, Read, Grep
disable-model-invocation: true
---

# PR Ready Skill

## Purpose

This skill reviews the currently staged Git diff and helps prepare it for a Pull Request
by drafting a title, a description, and flagging anything a human reviewer should look at
more closely (mixed changes, unclear intent, potential secrets, debug statements, missing context).

## Safety Rules

- This skill must never run `git commit`, `git push`, or open a Pull Request
- This skill must never write, edit, or delete any file
- This skill only reads the staged diff and explains what it finds
- Any drafted title or description is a starting point only, the human must review
  and edit it before using it
- If the diff is inconclusive or mixes unrelated changes, this skill must say so
  rather than guessing at intent

## Steps

1. Run `git diff --cached` to see the currently staged changes
2. Identify what the change actually does, and whether it represents one clear purpose
   or multiple unrelated changes mixed together
3. Flag anything that looks like a secret, hardcoded credential, or leftover debug
   statement, even if the pre-commit hook already would have caught it
4. Draft a PR title using conventional commit style (e.g. "feat:", "fix:", "docs:")
5. Draft a short PR description summarizing the change
6. List anything worth a second look before this is opened as a real PR
