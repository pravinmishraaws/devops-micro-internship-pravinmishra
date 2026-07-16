# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

The public GitHub **template repo** for the DevOps Micro Internship program (`week-00` … `week-13`). Students fork it, fill in `assignment-*.md` files per week, and submit for review. Audience for most content here is **students**, not the internal team — that's different from the other five repos in this workspace, which are mostly team/infra-facing.

## This repo's structure is load-bearing for automated grading

A separate private repo, `review-agent/` (sibling in the workspace), grades every student fork weekly by reading this template's structure **live at run time** — it does not hardcode week/file lists. That means:

- Adding, renaming, or restructuring `assignment-*.md` files, week folders, or the screenshots convention in a week here **immediately changes what `review-agent` expects** from every student fork, with no code change needed on the grader's side.
- Grading signals depend on structural checks against this template: whether a student's file still matches the template's blob SHA (untouched/copied detection), placeholder strings, word count, and file presence. If you change the template's placeholder text or word-count expectations, the grader's checks shift accordingly — coordinate with `review-agent/review_agent/` if you're changing a week that's already been taught.
- Weeks are authored **ahead of the cohort's actual pace** on purpose. `review-agent` enforces a `current-week.txt` cap so students can't pre-fill and get credit for a future week before it's taught — you don't need to hide unpublished weeks here, the grader handles the cutoff.

## Student-facing docs (not team conventions)

`README.md`, `onboarding/`, and `dmi_cohort3_resources.md` are written for students forking this repo — badges, progress table, submission instructions. Don't fold internal/team ecosystem rules (branding, UTM, deploy) into these; they don't apply to a student's fork.

## Related

- Program site: `https://dmi.pravinmishra.com` (separate repo, `dmi.pravinmishra.com/`)
- Community: `https://discord.pravinmishra.com`
- Grading spec: `REVIEW-AGENT.md` in the workspace root; grader implementation in `review-agent/`
