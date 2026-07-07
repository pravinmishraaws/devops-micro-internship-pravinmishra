# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Repository Is

This is a **personal fork** of the DevOps Micro Internship (DMI Cohort 3) program by Pravin Mishra. It is not application source code — it is a **15-week learning journal and assignment-submission repo**. The owner (Abraham Inwang, GitHub `AIN0908`) completes weekly assignments here, fills in evidence, and submits the fork URL for mentor review.

Two git remotes matter:
- `origin` → the owner's fork (`AIN0908/...`) — where work is pushed
- `upstream` → Pravin's original repo (`pravinmishraaws/...`) — source of new weeks/corrections

Pull new program content with: `git fetch upstream && git merge upstream/main && git push`

## Repository Structure

- `README.md` — the portfolio front page: "About Me", a weekly **progress table**, achievements, and a set of stack badges. This is the primary artifact reviewers see.
- `week-00-*` … `week-14-*` — one folder per week. Each contains a `README.md` template (with `<!-- ... -->` blanks to fill in) and a `screenshots/` folder for proof images. Some weeks add `assignments/` (task specs) and `Solutions_walkthrough/` or `solution-*.md` files.
- `onboarding/` — setup guides (GitHub account, Git, VS Code, submission, LinkedIn posts).
- `badges/` — SVG badges (`week-NN.svg`) referenced from the README stack section.
- `INSTRUCTIONS.md` — the fork → clone → fill in → push → submit workflow.
- `dmi_cohort3_resources.md` — required links and assignment guidelines.
- `Ultimate-Agentic-DevOps-with-Claude-Code/` — a **separate nested project** (its own git repo, README, and CLAUDE.md): a static HTML/CSS portfolio site deployed to AWS S3 + CloudFront via Terraform and GitHub Actions. Treat it as its own codebase; consult **its** CLAUDE.md when working inside that folder.

## The Assignment Workflow (how work gets done here)

Completing a week is a documentation task, not a build task:
1. Open the current `week-NN-*/README.md`.
2. Replace the `<!-- ... -->` comment placeholders with real answers.
3. Add proof images to that week's `screenshots/` folder — every screenshot must show the owner's name/username (a program rule).
4. Update `README.md` (root): flip the week's status ⬜ → 🔄 → ✅ in the progress table, and paste the LinkedIn/blog post URLs.
5. Uncomment that week's badge line in the "Your stack" section of the root `README.md`.
6. Commit and push to `origin`. Submit the fork URL via the program's Google Form.

## Editing Conventions

- **Preserve the placeholder pattern.** Blanks are HTML comments (`<!-- ... -->`); fill them in rather than restructuring the templates.
- **Keep the root README progress table in sync** with the actual state of week folders — it is the at-a-glance status reviewers rely on.
- Status legend: `⬜ Not Started` → `🔄 In Progress` → `✅ Completed`; assignments are `⏳ Pending` → `✅ Solved`.
- Badges live in the README as commented-out lines; unlock a week by removing the `<!--`/`-->` around its badge (watch for existing malformed lines, e.g. a `<Week 01 ...` missing its `!--`).
- There is no build, lint, or test step for this repo. "Verifying" means the Markdown renders correctly and the screenshots/links are present.
