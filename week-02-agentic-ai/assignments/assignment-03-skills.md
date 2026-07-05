# Assignment 3: Building Your Command Center

---

## 1. Assignment Overview

**Assignment:** Skills                
**Estimated Time:** 90 minutes             
**Difficulty:** Intermediate          
**Category:** Agentic AI, Skills               

---

## 2. Objective

Create the complete `.claude/skills/` folder structure with all 4 skill files, understand why each skill has different tool restrictions, and trigger `/scaffold-terraform` to generate infrastructure code using a single slash command.

---

## 3. Real-World Scenario

Senior DevOps engineers on agentic teams do not type long prompts from memory every time they run infrastructure commands. They build skills once — then run them with a single slash command. The flags are always correct, the restrictions are always enforced, and the process is identical every run. This is what separates an agentic workflow from just chatting with AI: consistency, repeatability, and control encoded into reusable commands.

---

## 4. Learning Outcomes

- Understand skill frontmatter fields: name, description, allowed-tools, disable-model-invocation
- Create the correct folder structure for skills
- Understand why different skills have different tool restrictions
- Run `/scaffold-terraform` to generate real Terraform infrastructure files
- Observe the Agentic Loop triggered by a skill command

---

## 5. Important Instructions (Global Rules)

**Key Rules:**
- Full name must be visible in required screenshots
- Do not expose sensitive information (keys, passwords, account IDs)
- Follow screenshot requirements exactly as specified in tasks
- Submission must clearly match task outputs
- Missing or incorrect proof may result in rejection

---

## 6. Prerequisites

- Assignment 2 completed (CLAUDE.md in place)
- Terraform installed (`terraform version` works — from course Lecture 1.3)
- All 5 skill files downloaded from the Resources section of Lecture 5.1

---

## 7. Tasks

Each task must be completed sequentially.

---

### Task 1 — Create the Skill Folder Structure

**Goal:** Set up the `.claude/skills/` directory with all 4 skill folders.

**Steps:**
1. Open the terminal in VS Code
2. Run the `mkdir` commands below
3. Verify the structure is correct in the VS Code sidebar

**Commands:**
```bash
mkdir -p .claude/skills/scaffold-terraform
mkdir -p .claude/skills/tf-plan
mkdir -p .claude/skills/tf-apply
mkdir -p .claude/skills/deploy
```

**Expected Output:** VS Code sidebar shows `.claude/skills/` with 4 folders inside it.

**Screenshots Required:**
- Screenshot 1 — VS Code sidebar showing `.claude/skills/` folder with all 4 subfolders visible

---

### Task 2 — Add the Skill Files

**Goal:** Place all 5 downloaded files into their correct folders.

**Steps:**
1. Download all 5 files from the Resources section of [Setup The Skills Files](https://www.udemy.com/course/ultimate-agentic-ai-devops-with-claude-code/learn/lecture/54819705#overview) from Udemy. 
2. Move each file to its correct location and rename it:
   - `scaffold-terraform-SKILL.md` → `.claude/skills/scaffold-terraform/SKILL.md`
   - `scaffold-terraform-template-spec.md` → `.claude/skills/scaffold-terraform/template-spec.md`
   - `tf-plan-SKILL.md` → `.claude/skills/tf-plan/SKILL.md`
   - `tf-apply-SKILL.md` → `.claude/skills/tf-apply/SKILL.md`
   - `deploy-SKILL.md` → `.claude/skills/deploy/SKILL.md`
3. Open `tf-plan/SKILL.md` and read the `allowed-tools` field

**Expected Output:** Each skill folder contains exactly the right files. `scaffold-terraform` has 2 files. The other 3 have 1 file each.

**Screenshots Required:**
- Screenshot 2 — `.claude/skills/scaffold-terraform/` open in VS Code showing both `SKILL.md` and `template-spec.md`
- Screenshot 3 — `tf-plan/SKILL.md` frontmatter showing `allowed-tools: Bash, Read, Grep` (no Write) and `disable-model-invocation: true`
---

### Task 3 — Run /scaffold-terraform

**Goal:** Trigger the scaffold skill and watch Claude generate the full Terraform infrastructure files.

**Steps:**
1. Open the Claude Code terminal in VS Code
2. Type `/scaffold-terraform`
3. Watch Claude read the template spec and generate all the files
4. Open the `terraform/` folder in VS Code and verify the files exist

**Commands (in Claude Code):**
```
/scaffold-terraform
```

**Expected Output:** Claude creates `main.tf`, `variables.tf`, `outputs.tf`, `providers.tf`, `backend.tf` inside a `terraform/` folder. Claude shows a summary checklist of what was created.

**Screenshots Required:**
- Screenshot 4 — Claude's response showing the scaffold complete with the file list
- Screenshot 5 — VS Code sidebar showing the `terraform/` folder with all generated files inside

---

### Task 4 — Run terraform init then /tf-plan

**Goal:** Initialize Terraform and trigger `/tf-plan` to observe Claude analyze the output.

**Steps:**
1. In the regular terminal (not Claude Code), navigate into the terraform folder and run `terraform init`
2. Open the Claude Code terminal
3. Type `/tf-plan`
4. Watch Claude run the plan command and analyze the output

**Note:** `terraform plan` will fail with an AWS authentication error because you do not have AWS credentials yet. That is expected and fine. The important thing is to see the skill trigger correctly and Claude analyze the error output — this is the Agentic Loop error-handling in action.

**Commands:**
```bash
cd terraform && terraform init
```

Then in Claude Code:
```
/tf-plan
```

**Expected Output:** Claude runs `terraform plan`, receives output or an auth error, and analyzes it. If it errors, Claude explains why it failed and what would be needed to fix it.

**Screenshots Required:**
- Screenshot 6 — Claude's `/tf-plan` response showing it ran the command and analyzed the result (pass or auth error both count)

---

## 8. Industry Insight

The tool restriction pattern in skills — giving each skill only the tools it actually needs — is called the principle of least privilege. It applies everywhere in DevOps: IAM roles, Kubernetes RBAC, Linux file permissions. A skill that can only read files cannot corrupt your infrastructure even if it runs a thousand times. A skill that can write files needs to earn that permission. The same thinking that keeps your cloud infrastructure safe applies directly to how you configure your AI tools.

---

## 9. Submission Instructions

Complete all tasks in sequence.

Your submission must include:
- All 6 required screenshots
- Your GitHub repo URL (skills committed and visible)

---

## 10. Solution Walkthrough

A step-by-step solution and troubleshooting guide is available for reference:
Full solution walkthrough → (LINK)

---

## 11. LinkedIn Requirement

Create a LinkedIn post including:
- Screenshot of the `terraform/` folder with all files generated by `/scaffold-terraform`
- Caption: "**Just built my first agentic DevOps skill. One command generated an entire Terraform infrastructure. No manual code written.**"
- Tag: #DMIByPravinMishra #AgenticAI #ClaudeCode #DevOps

**Submit:**
- LinkedIn post URL
- Screenshot of the post

---

## 12. Completion Checklist

Before submission, verify:
- [ ] All 4 skill folders created under `.claude/skills/`
- [ ] All 5 files in their correct locations
- [ ] `tf-plan/SKILL.md` shows no Write in allowed-tools (Screenshot 3)
- [ ] `/scaffold-terraform` ran and generated all 5 Terraform files
- [ ] `terraform init` completed
- [ ] `/tf-plan` was triggered and Claude analyzed the output
- [ ] Skills committed and visible in GitHub repo
.
