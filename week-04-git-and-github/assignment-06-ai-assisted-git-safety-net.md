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

![Task 0](<screenshots/week 04-assignment 06-screenshot 1.png>).

---

### Notes

**1. Why create a dedicated branch instead of doing this work on main?**

A dedicated branch keeps the assignment work separate from the stable `main` branch. It allows me to develop, test, and review the Git hook and `/pr-ready` skill without affecting the main version of the repository. It also makes the changes easier to track, compare, and submit through a Pull Request. If a problem occurs, I can correct or remove the feature branch without disrupting the working code on `main`.
.

---

# Task 1 — Stage a Change With Realistic Risk

## Goal

On your own fork of this repository (the one you've been submitting your DMI work in since onboarding), create a new branch and stage a change that a real reviewer should catch: a hardcoded-looking secret and a leftover debug statement.

### Evidence

#### Screenshot 1 — Output of  `git status` showing the staged file on feature/ai-pr-ready

![Task 1](<screenshots/week 04-assignment 06-screenshot 1.png>).

---

### Notes

**1. Why does this assignment use an obviously fake key instead of a real one?**

he assignment uses an obviously fake key because real credentials should never be exposed in source code, Git history, screenshots, or public repositories. A fake key allows the pre-commit hook to be tested safely without risking unauthorized access to an actual AWS account or exposing sensitive information. It demonstrates how secret detection works while following security best practices.

---

# Task 2 — Write a Real Git Pre-Commit Hook

## Goal

Create a tracked, shareable pre-commit hook that blocks a commit containing secret-like patterns or files over 1MB.

### Evidence

#### Screenshot 2 — `hooks/pre-commit` open in VS Code showing the full script

![Task 2.A](<screenshots/week 04-assignment 06-screenshot 2.png>).

---

#### Screenshot 3 — Output of `git config core.hooksPath` confirming it points to `hooks`

![Task 2.B](<screenshots/week 04-assignment 06-screenshot 3.png>).

---

### Notes

**1. Why is `hooks/pre-commit` tracked in the repo instead of living only in `.git/hooks/`?**

Tracking hooks/pre-commit in the repository allows everyone working on the project to use the same hook. It becomes part of the version-controlled codebase, making it easier to share, review, and update. If the hook existed only inside .git/hooks/, it would remain local to my machine and would not be available to other contributors.

---

**2. Compare this to `PreToolUse` from Week 2 Assignment 6. What does each one intercept, and what do they have in common?**

The Git pre-commit hook intercepts a commit before Git records it in the repository, while the PreToolUse hook intercepts a tool request before Claude executes it. Although they operate in different environments, both serve the same purpose: preventing unsafe actions before they happen by enforcing predefined safety rules.

---

# Task 3 — Prove the Hook Blocks the Risky Commit

## Goal

Attempt to commit the staged file from Task 1 and show the hook rejecting it.

### Evidence

#### Screenshot 4 — Terminal showing `git commit` rejected with the hook's "BLOCKED" message naming the exact file

![Task 3](<screenshots/week 04-assignment 06-screenshot 4.png>).

---

### Notes

**1. Which line in `hooks/pre-commit` matched your fake key, and why did it match?**

The line that searched for the pattern AKIA[0-9A-Z]{16} matched my fake key. It worked because the sample key was intentionally written to follow the same format as an AWS Access Key ID, allowing the hook to detect it through pattern matching..

---

**2. Could this hook have caught a poorly-named variable that stores a secret without the `AKIA` prefix? What does that tell you about the limits of a fixed rule like this?**

No. The hook only checks for predefined patterns, so it would miss a secret that doesn't match those rules. This highlights that fixed-rule detection is reliable for known patterns but cannot understand context or identify every possible security risk.

---

# Task 4 — Build the `/pr-ready` Skill

## Goal

Create a manually invoked Claude Code skill that reads your staged changes and produces a PR-readiness report and a draft PR description — without writing, committing, or pushing anything itself.

### Evidence

#### Screenshot 5 — `SKILL.md` frontmatter showing `allowed-tools: Bash, Read, Grep` (no `Write`) and `disable-model-invocation: true`

![Task 4.A](<screenshots/week 04-assignment 06-screenshot 5.png>).

---

#### Screenshot 6 — `/pr-ready` output while the risky file is still staged, showing it flagged the secret and/or debug statement

![Task 4.B](<screenshots/week 04-assignment 06-screenshot 6.png>).

---

### Notes

**1. Why does `/pr-ready` have `Bash` and `Read` but not `Write`?**

The skill only needs permission to inspect the staged changes and generate recommendations. Removing Write ensures it cannot modify files, create commits, or change the repository, leaving those actions under my control.

---

**2. The pre-commit hook and `/pr-ready` both looked at the same staged diff. Did they flag the same things? What did one catch that the other didn't?**

Both detected the fake secret and debug statement. However, the pre-commit hook simply blocked the commit based on fixed rules, while /pr-ready also reviewed the overall quality of the staged changes and suggested improvements to the Pull Request title, description, and readiness before submission.

---

# Task 5 — Fix the Issues and Re-Verify

## Goal

Remove the secret and debug statement, then prove both gates now pass clean.

### Evidence

#### Screenshot 7 — `git commit` succeeding after the fix (no BLOCKED message)

![Task 5](<screenshots/week 04-assignment 06-screenshot 7.png>).

---

#### Screenshot 8 — Second `/pr-ready` run showing a clean risk report and a drafted PR title + description

![Task 5.B](<screenshots/week 04-assignment 06-screenshot 8.png>).

---

### Notes

**1. What exactly did you change to satisfy the pre-commit hook?**

I removed the fake AWS-style access key and deleted the debug statement from the staged file. After staging the corrected version, the hook no longer detected any blocked patterns, allowing the commit to complete successfully.

---

# Task 6 — Push and Open a Pull Request Using the AI Draft

## Goal

Push your branch and open a real Pull Request, using `/pr-ready`'s drafted title and description as your starting point — read it critically and edit before you use it.

**Important:** Open this Pull Request with base repository set to **your own fork** — not the shared upstream `pravinmishraaws/devops-micro-internship-pravinmishra` repository. This assignment's hook and skill files are your own practice work, not a change meant for the shared class repo.

### Evidence

#### Screenshot 9 — Your Pull Request showing the base repository is your own fork, plus the title and description, with the `/pr-ready` draft visible for comparison (paste it in the PR conversation or your notes below)

Add your screenshot here.

---

#### PR Link

Add your PR URL here...

---

### Notes

**1. What, if anything, did you edit in the AI's drafted PR description before using it? Why?**

I reviewed the AI-generated draft and made small edits to improve clarity and ensure it accurately described the work I completed. This helped make the Pull Request more precise and better reflected my actual changes.

---

**2. If you had blindly copy-pasted the AI's draft without reading it, what could go wrong?**

The draft might contain inaccurate details, omit important information, or describe changes that weren't actually made. Reviewing it before submission ensures the Pull Request is accurate, complete, and appropriate for reviewers.

---

**3. Why does this PR need to target your own fork instead of the shared upstream repository?**

This assignment is practice work created in my own repository. Opening the Pull Request against my fork keeps the shared upstream repository clean and ensures only intended class contributions are submitted to the original project.

---

# Task 7 — Map the Workflow to the Agentic Loop

## Goal

Explain this assignment's workflow using the same Gather → Analyze → Human Act → Verify structure from Week 3.

### Notes

**1. Which step(s) represent Gather?**

The Gather stage occurs when the pre-commit hook and the /pr-ready skill inspect the staged changes using Git and repository files to collect the information needed for review.

---

**2. Which step(s) represent Analyze?**

Analyze happens when the pre-commit hook checks the staged files against predefined security rules and when /pr-ready evaluates the staged changes to identify potential issues and prepare a Pull Request draft.

---

**3. Which step is Human Act, and why must a human — not Claude — run `git commit`, `git push`, and open the PR?**

Human Act is when I review the findings, decide whether changes are needed, commit the code, push the branch, and open the Pull Request. These actions remain my responsibility because they permanently affect the repository and require human judgment and accountability.

---

**4. Which step is Verify?**

Verify happens after fixing the identified issues by running the pre-commit hook and /pr-ready again, confirming that the commit succeeds and the Pull Request is ready for submission.

---

**5. In one or two sentences: why do you need *both* the fixed-rule pre-commit hook and the AI skill? Isn't one enough?**

The pre-commit hook reliably blocks known risks such as secrets and oversized files using fixed rules, while the AI skill provides broader review by evaluating context, clarity, and Pull Request quality. Together, they combine consistent automated enforcement with intelligent human-focused guidance, creating a more complete review process.

---

# Task 8 — LinkedIn Post

## Goal

Publish a LinkedIn post summarizing what you built and what you learned about combining fixed-rule safety checks with AI-assisted review.

### Evidence

#### LinkedIn Post URL

Add your LinkedIn post URL here...

---

## Key Learnings

Add 3-5 bullet points on what you learned this week.

-
-
-

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

Paste your forked repository URL here:

`Add your URL here`

---

# Completion Checklist

- [ ] Branch `feature/ai-pr-ready` created with a staged file containing a fake secret and a debug statement
- [ ] `hooks/pre-commit` created and tracked in the repo (not only in `.git/hooks/`)
- [ ] `core.hooksPath` configured to point at `hooks/`
- [ ] Pre-commit hook shown blocking the risky commit
- [ ] `.claude/skills/pr-ready/SKILL.md` created with correct `allowed-tools` (no `Write`) and `disable-model-invocation: true`
- [ ] `/pr-ready` run against the risky diff and shown flagging issues
- [ ] Risky file fixed; `git commit` succeeds cleanly
- [ ] `/pr-ready` re-run showing a clean report and drafted PR title/description
- [ ] Pull Request opened using the AI draft as a starting point, with your own fork as the base repository (not upstream), PR link included
- [ ] Agentic Loop mapping (Task 7) completed in your own words
- [ ] LinkedIn post published and URL submitted
- [ ] All required screenshots added
- [ ] GitHub repository URL provided

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
