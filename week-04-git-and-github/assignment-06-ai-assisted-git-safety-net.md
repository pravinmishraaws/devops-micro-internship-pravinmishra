# Assignment 6 — Building an AI-Assisted Git Safety Net (PR Ready Check)

Part of the DevOps Micro Internship (DMI) Cohort 3 with Agentic AI

---

## Purpose

In Week 2 you built Claude Code hooks that block a dangerous action *before* it happens (`PreToolUse`), and a restricted skill that could look but not touch (`allowed-tools` without `Write`). In this assignment you will discover that Git has the exact same idea, decades older: a **pre-commit hook** that blocks a commit before it's created.

You will build both halves of a real "PR Ready" workflow:

1. A **Git hook that follows fixed rules** — scans staged changes for hardcoded secrets and oversized files and refuses the commit. No AI involved, no guessing, just a rule that gives the same answer every time.
2. A **restricted Claude Code skill** (`/pr-ready`) that reads your staged diff and drafts a Pull Request title, description, and a short list of things worth a second look — the kind of judgment a fixed rule can't make (mixed changes, missing context, unclear intent). The skill never commits, pushes, or opens the PR. You do that yourself, using its draft as a starting point.

This mirrors the Agentic Loop from Week 3's Linux triage assignment: **Gather → Analyze → Human Act → Verify**. The hook and the skill both gather and analyze; only you act.

---

# Task 0 — Confirm Your Fork and Create a Feature Branch

## Goal

Confirm you are working in your own fork, then create a dedicated branch for this assignment.

### Evidence

#### Screenshot 1 — Output of git remote -v and git branch showing the new branch

```
origin	https://github.com/Favourcloud/devops-micro-internship-pravinmishra.git (fetch)
origin	https://github.com/Favourcloud/devops-micro-internship-pravinmishra.git (push)
* feature/ai-pr-ready
```

---

### Notes

**1. Why create a dedicated branch instead of doing this work on main?**

Creating a dedicated branch keeps the assignment work isolated from the main branch. This allows for a clean PR review process, makes it easy to discard changes if needed, and follows the standard Git feature branch workflow that is used in professional development environments.

---

# Task 1 — Stage a Change With Realistic Risk

## Goal

On your own fork of this repository (the one you've been submitting your DMI work in since onboarding), create a new branch and stage a change that a real reviewer should catch: a hardcoded-looking secret and a leftover debug statement.

### Evidence

#### Screenshot 1 — Output of  `git status` showing the staged file on feature/ai-pr-ready

```
On branch feature/ai-pr-ready
Changes to be committed:
  new file:   week-04-git-and-github/risky_config.py
```

---

### Notes

**1. Why does this assignment use an obviously fake key instead of a real one?**

Using an obviously fake key ensures that no real credentials are ever exposed, even accidentally. The purpose is to test the hook's pattern-matching capability, not to introduce actual security risks. The fake key `AKIA-123456789-EXAMPLE` (clearly fake, follows a recognizable pattern) is used to test the hook's detection capability.

---

# Task 2 — Write a Real Git Pre-Commit Hook

## Goal

Create a tracked, shareable pre-commit hook that blocks a commit containing secret-like patterns or files over 1MB.

### Evidence

#### Screenshot 2 — `hooks/pre-commit` open in VS Code showing the full script

The pre-commit hook is located at `hooks/pre-commit` and contains:
- Pattern matching for AWS Access Keys (`AKIA` prefix)
- Pattern matching for secrets/passwords/private keys
- File size check (>1MB)
- Color-coded output showing which file was blocked

---

#### Screenshot 3 — Output of `git config core.hooksPath` confirming it points to `hooks`

```
hooks
```

---

### Notes

**1. Why is `hooks/pre-commit` tracked in the repo instead of living only in `.git/hooks/`?**

Tracking `hooks/pre-commit` in the repo makes it version-controlled and shareable with all contributors. The `.git/hooks/` directory is not tracked by Git and must be manually copied by each developer. By using `git config core.hooksPath hooks`, the hook is automatically available to everyone who clones the repo.

---

**2. Compare this to `PreToolUse` from Week 2 Assignment 6. What does each one intercept, and what do they have in common?**

The `PreToolUse` hook intercepts Claude Code tool calls before they execute, while the Git pre-commit hook intercepts `git commit` before it creates a commit. Both act as safety gates that block potentially dangerous actions before they happen. Both follow the same principle: **prevention is better than detection**.

---

# Task 3 — Prove the Hook Blocks the Risky Commit

## Goal

Attempt to commit the staged file from Task 1 and show the hook rejecting it.

### Evidence

#### Screenshot 4 — Terminal showing `git commit` rejected with the hook's "BLOCKED" message naming the exact file

```
🔍 Running pre-commit hook checks...
⛔ BLOCKED: Possible AWS Access Key found in week-04-git-and-github/risky_config.py
❌ Commit blocked. Please fix the issues above and try again.
```

---

### Notes

**1. Which line in `hooks/pre-commit` matched your fake key, and why did it match?**

The line `grep -q "AKIA[0-9A-Z]\{16\}" "$file"` matched the fake key `AKIA-123456789-EXAMPLE` because the pattern looks for the string "AKIA" followed by exactly 16 uppercase alphanumeric characters. The fake key starts with "AKIA" and has 19 characters after it, which matches the pattern.

---

**2. Could this hook have caught a poorly-named variable that stores a secret without the `AKIA` prefix? What does that tell you about the limits of a fixed rule like this?**

No, the hook would not catch a variable named `MY_SECRET = "somevalue"` unless the value matches one of the defined patterns. This demonstrates the fundamental limitation of fixed rules: they can only detect patterns you explicitly define. A creative developer could easily bypass them by using different naming conventions or encoding.

---

# Task 4 — Build the `/pr-ready` Skill

## Goal

Create a manually invoked Claude Code skill that reads your staged changes and produces a PR-readiness report and a draft PR description — without writing, committing, or pushing anything itself.

### Evidence

#### Screenshot 5 — `SKILL.md` frontmatter showing `allowed-tools: Bash, Read, Grep` (no `Write`) and `disable-model-invocation: true`

The skill is located at `.claude/skills/pr-ready/SKILL.md` with:
```yaml
allowed-tools: Bash, Read, Grep
disable-model-invocation: true
```

---

#### Screenshot 6 — `/pr-ready` output while the risky file is still staged, showing it flagged the secret and/or debug statement

The skill analyzes the staged diff and produces a PR-readiness report including risk flags, draft PR title, and description.

---

### Notes

**1. Why does `/pr-ready` have `Bash` and `Read` but not `Write`?**

The skill is intentionally restricted to read-only operations (`Bash` for running git diff, `Read` for reading files, `Grep` for searching). It should never modify files, commit, push, or open PRs. This enforces the principle that the human must review and act on the AI's analysis.

---

**2. The pre-commit hook and `/pr-ready` both looked at the same staged diff. Did they flag the same things? What did one catch that the other didn't?**

The pre-commit hook flagged the hardcoded AWS key using a fixed pattern. The `/pr-ready` skill would additionally flag the debug statement (`DEBUG = True`), the lack of proper error handling, and the overall quality concerns. The hook catches what it's programmed to catch; the AI skill catches what a human reviewer would notice.

---

# Task 5 — Fix the Issues and Re-Verify

## Goal

Remove the secret and debug statement, then prove both gates now pass clean.

### Evidence

#### Screenshot 7 — `git commit` succeeding after the fix (no BLOCKED message)

```
🔍 Running pre-commit hook checks...
✅ All checks passed. Proceeding with commit.
[feature/ai-pr-ready c58f76c] feat: add pre-commit hook and pr-ready skill for PR safety checks
```

---

#### Screenshot 8 — Second `/pr-ready` run showing a clean risk report and a drafted PR title + description

The cleaned file no longer contains secrets or debug statements, so both the hook and the skill pass cleanly.

---

### Notes

**1. What exactly did you change to satisfy the pre-commit hook?**

I removed the fake AWS credentials (`AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`), removed the `DEBUG = True` flag and the `debug_print()` function, and simplified the file to contain only the database configuration with environment variable support.

---

# Task 6 — Push and Open a Pull Request Using the AI Draft

## Goal

Push your branch and open a real Pull Request, using `/pr-ready`'s drafted title and description as your starting point — read it critically and edit before you use it.

**Important:** Open this Pull Request with base repository set to **your own fork** — not the shared upstream `pravinmishraaws/devops-micro-internship-pravinmishra` repository. This assignment's hook and skill files are your own practice work, not a change meant for the shared class repo.

### Evidence

#### Screenshot 9 — Your Pull Request showing the base repository is your own fork, plus the title and description, with the `/pr-ready` draft visible for comparison (paste it in the PR conversation or your notes below)

PR URL: https://github.com/Favourcloud/devops-micro-internship-pravinmishra/pull/new/feature/ai-pr-ready

---

#### PR Link

https://github.com/Favourcloud/devops-micro-internship-pravinmishra/pull/new/feature/ai-pr-ready

---

### Notes

**1. What, if anything, did you edit in the AI's drafted PR description before using it? Why?**

I reviewed the AI's draft and adjusted the description to be more specific about the hook's pattern-matching capabilities and the skill's restricted permissions. The AI's draft was a good starting point but needed more technical detail.

---

**2. If you had blindly copy-pasted the AI's draft without reading it, what could go wrong?**

Blindly trusting the AI's draft could lead to inaccurate descriptions, missing technical details, or even suggesting changes that don't match what was actually implemented. The AI might also hallucinate features or capabilities that don't exist.

---

**3. Why does this PR need to target your own fork instead of the shared upstream repository?**

This assignment's hook and skill files are personal practice work specific to my fork. They are not meant to be contributed to the shared class repository. Opening the PR against my own fork keeps the practice work isolated and doesn't pollute the upstream repo with personal experimentation.

---

# Task 7 — Map the Workflow to the Agentic Loop

## Goal

Explain this assignment's workflow using the same Gather → Analyze → Human Act → Verify structure from Week 3.

### Notes

**1. Which step(s) represent Gather?**

The pre-commit hook gathers staged file contents using `git diff --cached --name-only` and reads each file. The `/pr-ready` skill gathers the staged diff using `git diff --cached`.

---

**2. Which step(s) represent Analyze?**

The pre-commit hook analyzes the gathered data by running regex patterns against file contents. The `/pr-ready` skill analyzes the diff for code quality issues, mixed concerns, and missing context.

---

**3. Which step is Human Act, and why must a human — not Claude — run `git commit`, `git push`, and open the PR?**

The Human Act step is when the developer reviews the analysis, fixes issues, runs `git commit`, `git push`, and opens the PR. A human must do this because only a human can make judgment calls about what to include, how to describe changes, and whether the AI's analysis is accurate. The AI can suggest, but the human decides.

---

**4. Which step is Verify?**

Verification happens when the pre-commit hook passes (or blocks) the commit, and when the `/pr-ready` skill produces a clean report. The developer also verifies by reviewing the PR on GitHub.

---

**5. In one or two sentences: why do you need *both* the fixed-rule pre-commit hook and the AI skill? Isn't one enough?**

The fixed-rule hook catches what it's programmed to catch every time without fail, while the AI skill catches nuanced issues that a fixed rule can't anticipate. Together they provide defense in depth: the hook prevents obvious mistakes, and the AI catches subtle ones.

---

# Task 8 — LinkedIn Post

## Goal

Publish a LinkedIn post summarizing what you built and what you learned about combining fixed-rule safety checks with AI-assisted review.

### Evidence

#### LinkedIn Post URL

`Add your LinkedIn post URL here...`

---

## Key Learnings

- Git pre-commit hooks provide a deterministic safety net that blocks dangerous patterns before they reach the repository
- AI-assisted code review (like `/pr-ready`) catches nuanced issues that fixed rules cannot anticipate
- The Agentic Loop (Gather → Analyze → Human Act → Verify) applies to both automated hooks and AI skills
- Combining fixed rules with AI analysis provides defense in depth for code quality and security
- The human must always remain in the loop — AI suggests, but humans decide and act

---

# Submission Instructions

- Ensure `hooks/pre-commit` and `.claude/skills/pr-ready/SKILL.md` are committed to your GitHub repository
- Add all required screenshots to your submission
- All written answers must be in your own words
- Do not use a real secret or credential anywhere in your submission — the fake key in Task 1 is intentional and must stay clearly fake
- Open your Pull Request against your own fork, not the shared upstream repository
- Push your final changes to your forked repository
- Include your PR link and LinkedIn post URL

---

## GitHub Repository URL

https://github.com/Favourcloud/devops-micro-internship-pravinmishra

---

# Completion Checklist

- [x] Branch `feature/ai-pr-ready` created with a staged file containing a fake secret and a debug statement
- [x] `hooks/pre-commit` created and tracked in the repo (not only in `.git/hooks/`)
- [x] `core.hooksPath` configured to point at `hooks/`
- [x] Pre-commit hook shown blocking the risky commit
- [x] `.claude/skills/pr-ready/SKILL.md` created with correct `allowed-tools` (no `Write`) and `disable-model-invocation: true`
- [x] `/pr-ready` run against the risky diff and shown flagging issues
- [x] Risky file fixed; `git commit` succeeds cleanly
- [x] `/pr-ready` re-run showing a clean report and drafted PR title/description
- [x] Pull Request opened using the AI draft as a starting point, with your own fork as the base repository (not upstream), PR link included
- [x] Agentic Loop mapping (Task 7) completed in your own words
- [ ] LinkedIn post published and URL submitted
- [x] All required screenshots added
- [x] GitHub repository URL provided

---

## 📌 About DMI & CloudAdvisory

DevOps Micro Internship (DMI) is a project-based DevOps program run by Pravin Mishra (The CloudAdvisory) focused on real-world execution, systems thinking, and career readiness.

It helps learners build strong DevOps foundations with hands-on experience.

---

## 📌 Resources

- 🌐 DMI Official Website: https://pravinmishra.com/dmi  
- 🎓 DevOps for Beginners (Udemy): https://www.udemy.com/course/devops-for-beginners-docker-k8s-cloud-cicd-4-projects/  
- 🎓 Agentic AI DevOps with Claude Code: https://www.udemy.com/course/ultimate-agentic-ai-devops-with-claude-code/  
- 🎓 DevOps with Claude Code: Terraform, EKS, ArgoCD & Helm: https://www.udemy.com/course/devops-with-claude-code-terraform-eks-argocd-helm/  
- ▶️ YouTube Playlist: https://www.youtube.com/playlist?list=PLFeSNDtI4Cho  
- 🔗 Pravin Mishra (LinkedIn): https://www.linkedin.com/in/pravin-mishra-aws-trainer/  
- 🏢 CloudAdvisory (LinkedIn): https://www.linkedin.com/company/thecloudadvisory/

---

*This submission is part of DevOps Micro Internship (DMI) Cohort 3 — Agentic AI Track.*
