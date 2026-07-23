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

![Screenshot 1](./screenshots/assignment-06/Screenshot%201a.png)

---

### Notes

**1. Why create a dedicated branch instead of doing this work on main?**

A dedicated branch isolates the experimental work (the risky staged file and the hook testing) from the main branch. This keeps main clean and deployable, and allows the work to be reviewed independently. It also demonstrates the Git workflow used in real teams where main is protected and all changes go through feature branches and pull requests.

---

# Task 1 — Stage a Change With Realistic Risk

## Goal

On your own fork of this repository (the one you've been submitting your DMI work in since onboarding), create a new branch and stage a change that a real reviewer should catch: a hardcoded-looking secret and a leftover debug statement.

### Evidence

#### Screenshot 1 — Output of  `git status` showing the staged file on feature/ai-pr-ready

![Screenshot 2](./screenshots/assignment-06/Screenshot%201b.png)

---

### Notes

**1. Why does this assignment use an obviously fake key instead of a real one?**

A real credential would be dangerous to commit to any repository, even a teaching exercise. A fake key like `AKIA0-9AZ` is recognizable as a pattern-matching target, allowing the hook to demonstrate secret detection without risking actual credential leakage. It proves the rule works without the security risk.

---

# Task 2 — Write a Real Git Pre-Commit Hook

## Goal

Create a tracked, shareable pre-commit hook that blocks a commit containing secret-like patterns or files over 1MB.

### Evidence

#### Screenshot 2 — `hooks/pre-commit` open in VS Code showing the full script

![Screenshot 3](./screenshots/assignment-06/Screenshot%202.png)

---

#### Screenshot 3 — Output of `git config core.hooksPath` confirming it points to `hooks`

![Screenshot 4](./screenshots/assignment-06/Screenshot%203.png)

---

### Notes

**1. Why is `hooks/pre-commit` tracked in the repo instead of living only in `.git/hooks/`?**

Tracked hooks in a `hooks/` directory are shareable with the entire team. Hooks in `.git/hooks/` are local and not version-controlled, so teammates wouldn't have the same safety checks. Using a tracked `hooks/` directory ensures all collaborators run the same pre-commit rules when cloning the repository.

---

**2. Compare this to `PreToolUse` from Week 2 Assignment 6. What does each one intercept, and what do they have in common?**

Both intercept risky actions before they happen. `PreToolUse` hooks (Claude Code) block dangerous Claude tools before they execute. Pre-commit hooks block commits before they're created. Both are preventive gatekeepers: they gather information, check against fixed rules, and refuse the action if it violates those rules—no ambiguity, same result every time.

---

# Task 3 — Prove the Hook Blocks the Risky Commit

## Goal

Attempt to commit the staged file from Task 1 and show the hook rejecting it.

### Evidence

#### Screenshot 4 — Terminal showing `git commit` rejected with the hook's "BLOCKED" message naming the exact file

![Screenshot 5](./screenshots/assignment-06/Screenshot%204.png)

---

### Notes

**1. Which line in `hooks/pre-commit` matched your fake key, and why did it match?**

Line 7 of the hook matches the pattern: `if git diff --cached -- "$file" | grep -qE 'AKIA[0-9A-Z]{16}|-----BEGIN (RSA|OPENSSH|PRIVATE) KEY-----'`. This pattern detects AWS access key IDs (AKIA prefix followed by 16 alphanumeric chars) and private key headers, which are common secret formats that should never be committed.

---

**2. Could this hook have caught a poorly-named variable that stores a secret without the `AKIA` prefix? What does that tell you about the limits of a fixed rule like this?**

No—the hook only catches pattern-based secrets (AKIA keys, private key headers, etc.). A variable named `api_key="secret_value"` would slip through. This shows fixed rules are necessary but insufficient: they catch obvious patterns reliably but miss context-aware risks. That's why the `/pr-ready` skill complements the hook—AI can spot suspicious variable names and logic, not just patterns.

---

# Task 4 — Build the `/pr-ready` Skill

## Goal

Create a manually invoked Claude Code skill that reads your staged changes and produces a PR-readiness report and a draft PR description — without writing, committing, or pushing anything itself.

### Evidence

#### Screenshot 5 — `SKILL.md` frontmatter showing `allowed-tools: Bash, Read, Grep` (no `Write`) and `disable-model-invocation: true`

![Screenshot 6](./screenshots/assignment-06/Screenshot%205.png)

---

#### Screenshot 6 — `/pr-ready` output while the risky file is still staged, showing it flagged the secret and/or debug statement

![Screenshot 7](./screenshots/assignment-06/Screenshot%206.png)

---

### Notes

**1. Why does `/pr-ready` have `Bash` and `Read` but not `Write`?**

The `/pr-ready` skill is restricted to read-only operations (`Bash` for git commands, `Read` for file inspection, `Grep` for pattern search) because it's designed to analyze and report, never to modify. Excluding `Write` ensures the skill can't accidentally commit, stage, or push changes—it only gathers information and drafts recommendations for human review and action.

---

**2. The pre-commit hook and `/pr-ready` both looked at the same staged diff. Did they flag the same things? What did one catch that the other didn't?**

Both flagged the fake AWS key (AKIA pattern). The pre-commit hook caught it through fixed pattern matching and blocked the commit immediately. The `/pr-ready` skill could provide additional context: it could flag the `DEBUG:` statement as leftover logging, suggest better variable naming, explain why AWS keys shouldn't be in code, and provide a human-readable risk report—context the hook's simple rules cannot provide.

---

# Task 5 — Fix the Issues and Re-Verify

## Goal

Remove the secret and debug statement, then prove both gates now pass clean.

### Evidence

#### Screenshot 7 — `git commit` succeeding after the fix (no BLOCKED message)

![Screenshot 8](./screenshots/assignment-06/Screenshot%207.png)

---

#### Screenshot 8 — Second `/pr-ready` run showing a clean risk report and a drafted PR title + description

![Screenshot 9](./screenshots/assignment-06/Screenshot%208.png)

---

### Notes

**1. What exactly did you change to satisfy the pre-commit hook?**

Removed the hardcoded AWS key assignment and the debug echo statement from `scripts/notify.sh`. The hook blocks any commit containing the pattern `AKIA[0-9A-Z]{16}` (AWS access key format) or private key headers. By deleting those lines, the file no longer matches any of the hook's secret patterns, allowing the commit to succeed.

---

# Task 6 — Push and Open a Pull Request Using the AI Draft

## Goal

Push your branch and open a real Pull Request, using `/pr-ready`'s drafted title and description as your starting point — read it critically and edit before you use it.

**Important:** Open this Pull Request with base repository set to **your own fork** — not the shared upstream `pravinmishraaws/devops-micro-internship-pravinmishra` repository. This assignment's hook and skill files are your own practice work, not a change meant for the shared class repo.

### Evidence

#### Screenshot 9 — Your Pull Request showing the base repository is your own fork, plus the title and description, with the `/pr-ready` draft visible for comparison (paste it in the PR conversation or your notes below)

![Screenshot 10](./screenshots/assignment-06/Screenshot%209.png)

---

#### PR Link

`https://github.com/pravinmishraaws/devops-micro-internship-pravinmishra/pull/66`

---

### Notes

**1. What, if anything, did you edit in the AI's drafted PR description before using it? Why?**

The `/pr-ready` skill drafted: "Title: feat: add notification script template" and provided a description about adding a notification script for demo/reference. For Task 6, the title was simplified to "Assignment 6 files - AI PR Ready Skill" to clarify that this PR demonstrates the assignment's hook and skill setup, not a production feature. The description was adjusted to explain the educational purpose.

---

**2. If you had blindly copy-pasted the AI's draft without reading it, what could go wrong?**

The AI's draft described a general notification feature, which could confuse reviewers about the PR's actual purpose (demonstrating a security workflow, not adding a real feature). It might trigger requests for implementation details (API calls, config params) that weren't relevant to this assignment. Without reading critically, the PR title wouldn't clarify this is practice work, risking merge into shared code.

---

**3. Why does this PR need to target your own fork instead of the shared upstream repository?**

**Important Note:** This PR was opened against the upstream repository (pravinmishraaws), but the assignment specifies it should target your own fork. The hook and skill files are your personal practice work for learning Git safety patterns—not a change meant for the shared class repository. Opening it against your own fork keeps experimental work isolated, preventing it from cluttering the shared project's PR history and avoiding confusion about who is responsible for maintaining these files.

---

# Task 7 — Map the Workflow to the Agentic Loop

## Goal

Explain this assignment's workflow using the same Gather → Analyze → Human Act → Verify structure from Week 3.

### Notes

**1. Which step(s) represent Gather?**

Gather happens in two places: The pre-commit hook runs `git diff --cached` to scan staged files for patterns. The `/pr-ready` skill runs `git diff --cached` and reads the file contents to understand what's being committed. Both are gathering raw information about the changes.

---

**2. Which step(s) represent Analyze?**

The pre-commit hook analyzes against fixed rules (secret patterns, file size limits) and returns pass/fail. The `/pr-ready` skill analyzes the diff with AI judgment: it reads the context, understands intent, flags ambiguities (debug statements, unclear purpose), and suggests improvements. Both analyze but with different methods—one deterministic, one contextual.

---

**3. Which step is Human Act, and why must a human — not Claude — run `git commit`, `git push`, and open the PR?**

Human Act is when the developer decides to commit, push, and open the PR. A human must do this because the system gathers and analyzes but doesn't decide—only humans understand the full business context, can accept risk, and take responsibility for the code entering version control and review. Automating this would bypass human judgment.

---

**4. Which step is Verify?**

Verify is when reviewers on GitHub examine the PR, run CI checks, and decide whether to merge. After the human acts, verification confirms the fix was correct and that no new issues emerged when the code was tested in the broader system.

---

**5. In one or two sentences: why do you need *both* the fixed-rule pre-commit hook and the AI skill? Isn't one enough?**

The hook catches known patterns reliably and fast (no ambiguity), while the skill catches context-aware risks the hook can't see (unclear purpose, mixed concerns, incomplete logic). Together they form defense-in-depth: the hook stops obvious mistakes, the skill flags subtle ones humans should consider before committing.

---

# Task 8 — LinkedIn Post

## Goal

Publish a LinkedIn post summarizing what you built and what you learned about combining fixed-rule safety checks with AI-assisted review.

### Evidence

#### LinkedIn Post URL

`https://www.linkedin.com/posts/maneetta-antony-452075387_building-a-safer-smarter-git-workflow-ugcPost-7485927097236910080-wH6G/?utm_source=share&utm_medium=member_desktop&rcm=ACoAAF86Sz4BPT7sueDLOfQEmLqLbCo5V7ah-Jo`

---

#### LinkedIn Post Screenshot

![LinkedIn Post](./screenshots/assignment-06/linkedin-post.png)

---

## Key Learnings

- **Fixed rules + AI analysis = defense-in-depth security:** Pre-commit hooks catch known patterns reliably, while AI skills spot context-aware risks humans should consider. Neither alone is sufficient; together they form a robust safety net.

- **The Agentic Loop mirrors real software development:** Gather (inspect changes), Analyze (fixed rules & AI judgment), Human Act (decide and commit), Verify (review & test). Humans remain the decision-maker; tools gather and analyze only.

- **Restricted tools are essential for safety:** A skill with Bash, Read, and Grep but no Write can analyze deeply without risking accidental modifications. Restrictions prevent automation from exceeding its mandate.

- **Staged diffs are the atomic unit of change control:** Both the hook and skill analyze `git diff --cached`, making staged changes the interface where safety checks fire. This forces intentional staging and review before commits.

- **Transparency in tool output matters:** The `/pr-ready` skill's draft PR title/description must be read and edited by humans before use—blindly copying AI drafts can introduce subtle misalignment with project intent or confuse reviewers about change purpose.

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

`https://github.com/dev-enthusiast-84/devops-micro-internship-pravinmishra`

---

# Completion Checklist

- [x] Branch `feature/ai-pr-ready` created with a staged file containing a fake secret and a debug statement (Screenshots 1a-1b)
- [x] `hooks/pre-commit` created and tracked in the repo (not only in `.git/hooks/`) (Screenshot 2)
- [x] `core.hooksPath` configured to point at `hooks/` (Screenshot 3)
- [x] Pre-commit hook shown blocking the risky commit (Screenshot 4)
- [x] `.claude/skills/pr-ready/SKILL.md` created with correct `allowed-tools` (no `Write`) and `disable-model-invocation: true` (Screenshot 5)
- [x] `/pr-ready` run against the risky diff and shown flagging issues (Screenshot 6)
- [x] Risky file fixed; `git commit` succeeds cleanly (Screenshot 7)
- [x] `/pr-ready` re-run showing a clean report and drafted PR title/description (Screenshot 8)
- [x] Pull Request opened using the AI draft as a starting point, PR link included (Screenshot 9)
- [x] Agentic Loop mapping (Task 7) completed in your own words (5/5 questions answered)
- [x] LinkedIn post published and URL submitted (Screenshot: linkedin-post.png)
- [x] All required screenshots added (11/11 complete including LinkedIn)
- [x] GitHub repository URL provided
- [x] All Task notes and question answers completed
- [x] Key learnings documented (5 points)

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
