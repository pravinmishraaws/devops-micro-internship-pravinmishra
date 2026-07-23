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

![alt text](/week-04-git-and-github/screenshots/image-62.png)

---

### Notes

**1. Why create a dedicated branch instead of doing this work on main?**

The new branch is to perform an operation on the repo and make sure it work perfectly. Before suggesting it to the main branch otherwise it will corrupt the original content.  I need to create the new branch in order not to tamper with with original content.
A dedicated branch lets me experiment and test the pre-commit hook and 
the /pr-ready skill without touching the main branch

---

# Task 1 — Stage a Change With Realistic Risk

## Goal

On your own fork of this repository (the one you've been submitting your DMI work in since onboarding), create a new branch and stage a change that a real reviewer should catch: a hardcoded-looking secret and a leftover debug statement.

### Evidence

#### Screenshot 1 — Output of  `git status` showing the staged file on feature/ai-pr-ready

![alt text](/week-04-git-and-github/screenshots/image.png)

---

### Notes

**1. Why does this assignment use an obviously fake key instead of a real one?**

We use a fake key because this file will be staged, committed  and possibly pushed to a shared repository where others, including reviewers and anyone who forks or clones the repo can see it. If it were a real AWS key, anyone who saw it could use it 
to access real cloud resources, run up costs, or cause damage. Since 
this assignment is only testing whether the hook and the AI skill can 
detect a secret-shaped string, a fake key that matches the same pattern 
(AKIA followed by 16 characters) does the job just as well without any 
real risk.

---

# Task 2 — Write a Real Git Pre-Commit Hook

## Goal

Create a tracked, shareable pre-commit hook that blocks a commit containing secret-like patterns or files over 1MB.

### Evidence

#### Screenshot 2 — `hooks/pre-commit` open in VS Code showing the full script

![alt text](/week-04-git-and-github/screenshots/image-1.png)

---

#### Screenshot 3 — Output of `git config core.hooksPath` confirming it points to `hooks`

![alt text](/week-04-git-and-github/screenshots/image-2.png)

---

### Notes

**1. Why is `hooks/pre-commit` tracked in the repo instead of living only in `.git/hooks/`?**

`.git/hooks/` is local only. it never gets committed, pushed, or cloned. So if you put a script there, nobody else on the team gets it. each person would have to recreate it manually.

By keeping the hook in a normal tracked folder like hooks/pre-commit, it becomes part of the repo versioned, visible in PRs, and shared with everyone who clones it.

---

**2. Compare this to `PreToolUse` from Week 2 Assignment 6. What does each one intercept, and what do they have in common?**

`PreToolUse` intercepts a Claude Code **tool call**: it fires right before Claude is about to run something like `Bash`, `Edit`, or `Write`, and it can inspect that call and block it before it ever executes. The Git `pre-commit` hook intercepts a **commit**, it fires right before `git commit` finalizes, inspecting the staged diff, and can reject the commit before it's created.

Different trigger point, same idea underneath: both sit **between an intention and an action**, at the last possible moment before that action becomes permanent, and both work off a fixed set of rules rather than judgment.

So the common thread is: both are **deterministic gatekeepers** wired into a workflow at a fixed checkpoint, enforcing a hard rule automatically, regardless of who or what triggered the action. a human typing `git commit`, or an AI agent about to run a tool. They don't replace review or judgment, they just guarantee a specific class of mistake can never silently slip through.

---

# Task 3 — Prove the Hook Blocks the Risky Commit

## Goal

Attempt to commit the staged file from Task 1 and show the hook rejecting it.

### Evidence

#### Screenshot 4 — Terminal showing `git commit` rejected with the hook's "BLOCKED" message naming the exact file

![alt text](/week-04-git-and-github/screenshots/image-3.png)

---

### Notes

**1. Which line in `hooks/pre-commit` matched your fake key, and why did it match?**

Line 7 of `hooks/pre-commit` is what caught it:

if git diff --cached -- "$file" | grep -qE 'AKIA[0-9A-Z]{16}|-----BEGIN (RSA|OPENSSH|PRIVATE) KEY-----'; then

It matched because of the `AKIA[0-9A-Z]{16}` part of the script. My fake key in `scripts/notify.sh` was `AKIAABCDEFGHIJKLMNOP`, that's the literal prefix `AKIA` followed by 16 uppercase letters/digits, which is exactly the shape a real AWS access key ID has. The hook scans the staged diff line by line, and since this string fit the pattern exactly, `grep` found a hit and the script printed the "possible secret" warning and blocked the commit.

---

**2. Could this hook have caught a poorly-named variable that stores a secret without the `AKIA` prefix? What does that tell you about the limits of a fixed rule like this?**

No, it wouldn't have caught it. The hook only checks for two very specific patterns. the `AKIA` prefix used by AWS keys, and PEM-style private key headers. If I'd written something like:
```bash
DB_PASSWORD="SuperSecret123!"
```
that line would sail right through, because it doesn't match either regex, even though it's clearly a secret sitting in plaintext.

This shows the real limit of a fixed-rule hook like this. it's pattern matching, not understanding. It only flags secrets that *look* like the specific formats it was written for. Passing this check doesn't mean the code has no secrets, it just means nothing matched those two patterns. 

---

# Task 4 — Build the `/pr-ready` Skill

## Goal

Create a manually invoked Claude Code skill that reads your staged changes and produces a PR-readiness report and a draft PR description — without writing, committing, or pushing anything itself.

### Evidence

#### Screenshot 5 — `SKILL.md` frontmatter showing `allowed-tools: Bash, Read, Grep` (no `Write`) and `disable-model-invocation: true`

![alt text](/week-04-git-and-github/screenshots/image-4.png)

---

#### Screenshot 6 — `/pr-ready` output while the risky file is still staged, showing it flagged the secret and/or debug statement

![alt text](/week-04-git-and-github/screenshots/image-5.png)
![alt text](/week-04-git-and-github/screenshots/image-6.png)

---

### Notes

**1. Why does `/pr-ready` have `Bash` and `Read` but not `Write`?**

Because the whole point of this skill is to review and report, not to change anything. `Bash` lets it run read-only commands like `git diff --cached` and `git status` to see what's staged, and `Read`/`Grep` let it inspect file contents to look for issues. But it has no `Write` (or `Edit`) tool, so it's physically incapable of modifying, creating, or deleting any file. Even if the model "wanted" to fix the secret it found, it couldn't.

---

**2. The pre-commit hook and `/pr-ready` both looked at the same staged diff. Did they flag the same things? What did one catch that the other didn't?**

They overlapped on the fake AWS key in `scripts/notify.sh` line 3, both caught that. But that's where the similarity ends.

The pre-commit hook only checks for the `AKIA` prefix pattern and PEM key headers, and it only has two outcomes, block or allow. It didn't notice the `echo "DEBUG: token is $AWS_ACCESS_KEY_ID"` line at all, since that's not a credential-shaped string, just a print statement.

`/pr-ready`, on the other hand, actually reasoned about the code contextually. It caught the same AKIA key, but it also flagged the debug echo line as a leftover that shouldn't ship, noticed the `.md` file was modified but not staged (and asked if that was intentional), and pointed out that `.claude/` and `hooks/` were untracked and asked whether they should be added or gitignored. It also drafted a PR title and description. something a fixed regex hook has no capability to do.

So the difference is: the hook is a narrow, fast, no-judgment gate, good at catching one specific known shape of danger every single time. `/pr-ready` is broader and more contextual. it can catch things the hook was never written to look for (debug prints, workflow inconsistencies, unstaged files), but it's a model making judgment calls, not a deterministic guarantee. In a real workflow, they complement each other. the hook is the hard stop that can't be reasoned around, and `/pr-ready` is the second pair of eyes that thinks more broadly before a human reviews the PR.

---

# Task 5 — Fix the Issues and Re-Verify

## Goal

Remove the secret and debug statement, then prove both gates now pass clean.

### Evidence

#### Screenshot 7 — `git commit` succeeding after the fix (no BLOCKED message)

![alt text](/week-04-git-and-github/screenshots/image-7.png)

---

#### Screenshot 8 — Second `/pr-ready` run showing a clean risk report and a drafted PR title + description

![alt text](/week-04-git-and-github/screenshots/image-8.png)

---

### Notes

**1. What exactly did you change to satisfy the pre-commit hook?**

I Removed the `Hardcode` and the `echo Debug` from the bash scripts/notify.sh, then no `BLOCKED` from the pre-commit hook.

---

# Task 6 — Push and Open a Pull Request Using the AI Draft

## Goal

Push your branch and open a real Pull Request, using `/pr-ready`'s drafted title and description as your starting point — read it critically and edit before you use it.

**Important:** Open this Pull Request with base repository set to **your own fork** — not the shared upstream `pravinmishraaws/devops-micro-internship-pravinmishra` repository. This assignment's hook and skill files are your own practice work, not a change meant for the shared class repo.

### Evidence

#### Screenshot 9 — Your Pull Request showing the base repository is your own fork, plus the title and description, with the `/pr-ready` draft visible for comparison (paste it in the PR conversation or your notes below)

![alt text](/week-04-git-and-github/screenshots/image-9.png)

---

#### PR Link

https://github.com/Sola-Royal/devops-micro-internship-pravinmishra/pull/1

---

### Notes

**1. What, if anything, did you edit in the AI's drafted PR description before using it? Why?**

There was other extrnal image and folders that is being tracked under my assignment which does not aligned with what i am experimenting.
So, I removed it from the description

---

**2. If you had blindly copy-pasted the AI's draft without reading it, what could go wrong?**

Nothing would go wrong, but it will not capture the main context. It will look rough and not straight forward. the essense of editing is to streamline the importsnt messagr as partain to the Pre-commit hook and pr-ready hook. 

---

**3. Why does this PR need to target your own fork instead of the shared upstream repository?**

It does that because i am not the only one accesing the upstream. The owner of the upstream will be the one to review it nit me. but as i put my own main. i will be th one to review and merge as well.

---

# Task 7 — Map the Workflow to the Agentic Loop

## Goal

Explain this assignment's workflow using the same Gather → Analyze → Human Act → Verify structure from Week 3.

### Notes

**1. Which step(s) represent Gather?**

The `git status` and `git diff --cached` commands are Gather. Both the pre-commit hook and the `/pr-ready` skill start by pulling in exactly what's staged. the hook runs `git diff --cached --name-only` to list staged files, and `/pr-ready`'s instructions explicitly say to run `git diff --cached` and `git status` first. Neither tool interprets anything yet at this point, they're just collecting the raw data.

---

**2. Which step(s) represent Analyze?**

Two different Analyze steps happened here, at two different levels.

- The **pre-commit hook's regex scan**: checking each staged file's diff against the `AKIA[0-9A-Z]{16}` and private-key-header patterns, and checking file size against the 1MB limit. This is a narrow, mechanical analysis: pure pattern matching, no judgment.
- The **`/pr-ready` skill's review**: reading the same staged diff but reasoning more broadly: flagging the credential-shaped string, the debug `echo`, the unstaged `.md` file, and the untracked `.claude/`/`hooks/` directories, then drafting a PR title and description. This is a wider, contextual analysis — closer to how a human reviewer would think, but still just producing a report, not taking action.

Both fall in Analyze because neither one commits, edits, or pushes anything. they only look at what was gathered and produce findings/output for a human to act on.


---

**3. Which step is Human Act, and why must a human — not Claude — run `git commit`, `git push`, and open the PR?**

In `Pre-commit hook` when it broght Blokcked. I had to check and correct the issues before it could pass the commit state and staged.
In `/Pr-ready` check it does not edit anything according to the instruction giving to it. it only suggest and i carry on the suggestion and edited it before using it.

The human edited and remove the hardcode, then also be the one to push not ai. most importantly Ai only allow to use `bash`, `grep` and `read` not `edit` that is why it cannot perform those duties.

---

**4. Which step is Verify?**

In a place where the commit BLOCKED, we have to verify if truly no secret key on the folder that is about to be pushed.
Also, for the `Ai pr-ready check` is the placr we have to veify the title and description given to us whether it aligned or it could also affect what we doing.

---

**5. In one or two sentences: why do you need *both* the fixed-rule pre-commit hook and the AI skill? Isn't one enough?**

The both is important because as you can see, the pree-commit hook follow pattern and it check issues before you commit not after you have pushed but it does not capture wide area while the `Ai pr-ready check` check and capture every possible solutiom and also give you suggestion on what to do.

---

# Task 8 — LinkedIn Post

## Goal

Publish a LinkedIn post summarizing what you built and what you learned about combining fixed-rule safety checks with AI-assisted review.

### Evidence

#### LinkedIn Post URL

https://www.linkedin.com/posts/solaibinuolapo_git-github-devops-share-7486137546687717376-7bm_/?utm_source=share&utm_medium=member_desktop&rcm=ACoAADUrROwBSs3BHxwzwdeWVUk2kf9iszgkWjM

---

## Key Learnings

Add 3-5 bullet points on what you learned this week.

- Git and GitHub
- The The git Core analysis
- The open Source collaborations

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

https://github.com/Sola-Royal/devops-micro-internship-pravinmishra

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
