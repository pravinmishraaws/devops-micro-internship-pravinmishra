# Assignment 2: Teaching Claude Your Project

---

## 1. Assignment Overview

**Assignment:** CLAUDE.md              
**Estimated Time:** 60 minutes                
**Difficulty:** Beginner                  
**Category:** Agentic AI, Project Context                    

---

## 2. Objective

Use `/init` to generate a starter CLAUDE.md, customize all 5 sections with project-specific details, and demonstrate through two live tests that Claude's behavior changes based on the file.

---

## 3. Real-World Scenario

On real engineering teams, every new team member reads the onboarding doc before writing a single line of code. CLAUDE.md is that document — but for AI. Without it, Claude guesses at your architecture and ignores your conventions. With it, Claude knows your stack, your rules, and what it is not allowed to do. Engineers who invest time in a good CLAUDE.md spend far less time correcting AI mistakes later.

---

## 4. Learning Outcomes

- Understand the difference between README.md (for humans) and CLAUDE.md (for AI)
- Generate a starter CLAUDE.md using `/init`
- Write all 5 sections: Overview, Architecture, Commands, Conventions, Safety
- Prove the file works by testing before and after Claude reads it

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

- Assignment 1 completed
- Claude Code running in the portfolio project
- No CLAUDE.md file in the project yet

---

## 7. Tasks

Each task must be completed sequentially.

---

### Task 1 — Capture the Before State

**Goal:** Screenshot Claude's answer before CLAUDE.md exists so you have a baseline to compare.

**Steps:**
1. Open Claude Code in your project
2. Confirm there is no CLAUDE.md file (the project should only have `index.html`, `style.css`, `images/`, `README.MD`, `privacy.html`, `terms.html`)
3. Ask this exact question: `"What is this project and how should I deploy it?"`
4. Screenshot the response — it will be generic and vague

**Commands (in Claude Code):**
```
What is this project and how should I deploy it?
```

**Expected Output:** Claude gives a generic answer based only on the existing project files. It may describe the project as a static HTML/CSS website and suggest common deployment options.

**Screenshots Required:**
- Screenshot 1 — Claude’s generic response before CLAUDE.md exists (project contains only `index.html`, `style.css`, `images/`, `README.MD`, `privacy.html`, `terms.html`)
![part 1](/week-02-agentic-ai/screenshots/claude-response-A.png)
![part 2](/week-02-agentic-ai/screenshots/claude-response-B.png)
![part 3](/week-02-agentic-ai/screenshots/claude-response-c.png)
![part 4](/week-02-agentic-ai/screenshots/claude-response-D.png)

---

### Task 2 — Generate an initial CLAUDE.md using /init and review the auto-generated content in VS Code.

**Goal:** Use the built-in `/init` command to create an auto-generated CLAUDE.md.

**Steps:**
1. In the Claude Code terminal, type `/init`
2. Wait for Claude to scan the project files and generate the CLAUDE.md
3. Open the generated file in VS Code and read through it

**Commands (in Claude Code):**
```
/init
```

**Expected Output:** A CLAUDE.md appears at the project root. It has a Project Overview and Architecture section but is missing important details like the intended AWS deployment.

**Screenshots Required:**
- Screenshot 2 — The auto-generated CLAUDE.md open in VS Code showing its content
![claude1](/week-02-agentic-ai/screenshots/claude-md.png)


---

### Task 3 — Customize the CLAUDE.md

**Goal:** Replace the generic content with specific, actionable instructions across all 5 sections.

**Steps:**
1. Open CLAUDE.md in VS Code
2. Update **Project Overview** to:
   > "Static HTML/CSS portfolio website deployed to AWS using S3 and CloudFront, provisioned with Terraform, and automated via GitHub Actions."
3. Update **Architecture** to include this line:
   > "Pure HTML5 and CSS3. No JavaScript. No build step. No framework."
4. Add a **Commands** section listing: `terraform init`, `terraform plan`, `terraform apply`
5. Add a **Conventions** section with these three rules:
   - All infrastructure changes go through Terraform — never modify AWS resources manually
   - No JavaScript in this project
   - CSS uses mobile-first approach with breakpoints at 900px, 768px, and 600px
6. Add a **Safety** section:
   > "Never put secrets in this file. No API keys, passwords, or AWS credentials."
7. Save the file

**Expected Output:** A complete CLAUDE.md with all 5 sections, each containing project-specific content.

**Screenshots Required:**
- Screenshot 3 — Your customized CLAUDE.md in VS Code showing all 5 sections (scroll to show the full file)
![custom-cloud.md](/week-02-agentic-ai/screenshots/Claude-md-custome-1.png)
![custom-cloud.md](/week-02-agentic-ai/screenshots/Claude-md-custome-2.png)

---

### Task 4 — Test the After State

**Goal:** Run two tests that prove CLAUDE.md changed how Claude behaves.

**Steps:**
1. Start a **new Claude Code session** — close the current terminal and open a fresh one
2. Ask: `"What is this project and how should I deploy it?"` — Claude should now mention S3, CloudFront, and Terraform clearly.
3. Then ask: `"Add a React component to the homepage"` — Claude should push back because of the No JavaScript rule
4. Screenshot both responses

**Commands (in Claude Code, new session):**
```
What is this project and how should I deploy it?
Add a React component to the homepage.
```

**Expected Output:**
- Test 1: Claude gives a specific, detailed answer mentioning S3, CloudFront, and Terraform
- Test 2: Claude refuses or warns — citing the "No JavaScript" convention from CLAUDE.md


**Screenshots Required:**

- Screenshot 4 — Claude's specific, detailed answer after reading CLAUDE.md (Claude mentioning S3, CloudFront and Terraform)

![claude-md-response](/week-02-agentic-ai/screenshots/response-1.png)
![claude-md-response](/week-02-agentic-ai/screenshots/response-1b.png)


- Screenshot 5 — Claude refusing or warning against adding React because of the "No JavaScript" convention defined in CLAUDE.md

![claude-md-response](/week-02-agentic-ai/screenshots/response-react.png)


---

### Task 5 — Commit and push your changes to your fork in GitHub

**Goal:** Commit the `CLAUDE.md` file and push it to your GitHub fork so the project instructions are version-controlled.

**Steps:**

1. Check the Git status to verify that `CLAUDE.md` has been created or modified

2. Stage the changes (`git add .`)

3. Commit the changes with a meaningful commit message

4. Push the commit to your GitHub fork

5. Open your GitHub repository in the browser and verify that `CLAUDE.md` is visible in the repository root


**Commands (Terminal):**

```bash

git status
git add CLAUDE.md
git commit -m "Add project-specific CLAUDE.md"
git push origin main

```

**Expected Output:** The `CLAUDE.md` file is committed, pushed to your GitHub fork, and visible in the repository.


**Screenshots Required:**

- Screenshot 6 — `CLAUDE.md` visible in your GitHub repository after pushing the commit

![github-updated-repo](/week-02-agentic-ai/screenshots/Github-after-commit.png)

---

## 8. Industry Insight

The CLAUDE.md is where the engineer's knowledge becomes permanent. Every line you write there is an instruction that applies to every session, every command, every file Claude touches — automatically. Senior engineers on agentic teams treat their CLAUDE.md like production code: they version control it, review changes to it, and keep it updated as the project evolves. A 90-line CLAUDE.md written carefully can save weeks of correction across a year of usage.

---

## 9. Submission Instructions

Complete all tasks in sequence.

Your submission must include:
- All 6 required screenshots
- Your GitHub repo URL (`CLAUDE.md` must be committed and pushed)

---

## 10. Solution Walkthrough

A step-by-step solution and troubleshooting guide is available for reference.

---

## 11. LinkedIn Requirement

Not required for this assignment.

---

### 12. Completion Checklist

Before submission, verify:

[ ] Screenshot 1 shows a generic Claude response (no CLAUDE.md)<br>
[ ] Screenshot 2 shows the auto-generated `/init` output <br>
[ ] Screenshot 3 shows all 5 sections in your customized CLAUDE.md <br>
[ ] Screenshot 4 shows Claude mentioning S3, CloudFront, and Terraform <br>
[ ] Screenshot 5 shows Claude refusing the React request <br>
[ ] Screenshot 6 shows `CLAUDE.md` committed and visible in your GitHub repository <br>
[ ] GitHub repository URL is included in the submission <br>

---

