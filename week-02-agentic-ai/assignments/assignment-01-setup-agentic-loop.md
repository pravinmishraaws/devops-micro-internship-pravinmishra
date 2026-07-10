# Assignment 1: Your First Agentic Session

---

## 1. Assignment Overview

**Assignment:** Setup & Agentic Loop     
**Estimated Time:** 60 minutes     
**Difficulty:** Beginner      
**Category:** Agentic AI, Claude Code Setup     

---

## 2. Objective

Install and authenticate Claude Code CLI and VS Code extension, fork and clone the course starter [repository](https://github.com/pravinmishraaws/Ultimate-Agentic-DevOps-with-Claude-Code), and observe how the Agentic Loop works before any configuration is in place.

---

## 3. Real-World Scenario

Every DevOps engineer working with agentic AI starts the same way — setting up the tooling and understanding how the AI actually thinks before trusting it with real infrastructure. You would never hand the keys to a new team member without watching them work first. This assignment is exactly that — get your environment ready, then watch Claude work so you understand what is happening before you build anything on top of it.

---

## 4. Learning Outcomes

- Install and authenticate Claude Code CLI
- Fork and clone the course starter repository
- Observe the three phases of the Agentic Loop: Gather, Act, Verify
- Understand how Claude Code differs from Claude chat

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

- Node.js and npm installed (`node --version` works)

  ![nodejs-npm-version](/week-02-agentic-ai/screenshots/nodejs-npm-version.png)

- Git installed and configured (Verify using `git --version`)

![git-version](/week-02-agentic-ai/screenshots/git-version.png)

- GitHub account

![github-account](/week-02-agentic-ai/screenshots/github-account.png)

- VS Code installed (Vrify using `code --version`)

![vscode-version](/week-02-agentic-ai/screenshots/vscode-version-cli.png)
![vscode-version](/week-02-agentic-ai/screenshots/vscode-version-app.png)

- Claude subscription (Pro plan minimum)

---

## 7. Tasks

Each task must be completed sequentially.

---

### Task 1 — Install Claude Code

**Goal:** Install the Claude Code CLI globally and authenticate with your Anthropic account.

**Steps:**
1. Open your terminal
2. Run the install command below
3. Verify the installation printed a version number
4. Run `claude` to open Claude Code and authenticate through the browser

**Commands:**
```bash
npm install -g @anthropic-ai/claude-code
claude --version
claude
```
![claude-installation](/week-02-agentic-ai/screenshots/install-claude.png)


**Expected Output:** Version number printed. Browser opens for Anthropic login. After logging in, the Claude Code prompt appears in your terminal.

**Screenshots Required:**
- Screenshot 1 — Terminal showing `claude --version` with the version number visible

![claude version](/week-02-agentic-ai/screenshots/claude-version.png)

- Screenshot 2 — Claude Code authenticated and showing the terminal prompt (your name visible)

![terminal-prompt](/week-02-agentic-ai/screenshots/trust-folder.png)
![welcome](/week-02-agentic-ai/screenshots/welcome-sub.png)
![browser-connect](/week-02-agentic-ai/screenshots/browser-connect-claude.png)
![authorize-claude](/week-02-agentic-ai/screenshots/authorize-claude.png)
![authorize-code](/week-02-agentic-ai/screenshots/authorize-code.png)
![claude-cli](/week-02-agentic-ai/screenshots/cli-claude.png)
---

### Task 2 — Fork and Clone the Starter Repository

**Goal:** Get your own copy of the course project onto your machine.

**Steps:**
1. Open the [repository link](https://github.com/pravinmishraaws/Ultimate-Agentic-DevOps-with-Claude-Code) in your browser.
![repository](/week-02-agentic-ai/screenshots/github-assignment-repo.png)
2. Click **Fork → Create Fork**
3. Clone your fork to your local machine
4. Open the project in VS Code

**Commands:**
```bash
git clone https://github.com/wisegeorge1/Ultimate-Agentic-DevOps-with-Claude-Code
cd  C:\Users\George\Documents\Personal-Workspace\DMI-Cohort-3\Ultimate-Agentic-DevOps-with-Claude-Code
code .
```

**Expected Output:** VS Code opens showing `index.html`, `style.css`, and the `images/` folder in the sidebar. No `.claude/` directory exists yet. (Remove the .claude folder, CLAUDE.md, and .github folder if they exist.)

**Screenshots Required:**
- Screenshot 3 — VS Code with the project open, file tree visible showing `index.html`, `style.css`, `images/`
!
![cloned repository](/week-02-agentic-ai/screenshots/cloned-repo-vs-code.png)


---

### Task 3 — Observe the Agentic Loop

**Goal:** Watch Claude Code work through Gather → Act → Verify on two real tasks.

**Steps:**
1. Open the Claude Code terminal inside VS Code (open the terminal panel, type `claude`)
2. Ask this exact question: `"What files are in this project and what does each one do?"`
3. Watch the tool calls — Claude reads files (Gather), forms its answer (Act), checks its understanding (Verify)
4. Now ask: `"How many lines of CSS does this project have?"`
5. Watch Claude run a shell command to count them — this is Act in action

**Commands (type in Claude Code terminal):**
```
What files are in this project and what does each one do?
How many lines of CSS does this project have?
```

**Expected Output:**
- Question 1: Claude lists the files and describes each one, showing it read them first
- Question 2: Claude runs a command like `wc -l style.css` and reports the exact number

**Screenshots Required:**
- Screenshot 4 — Claude's response to the first question, showing it read the files (tool calls visible)
![response to question 1](/week-02-agentic-ai/screenshots/response-first-question.png)

- Screenshot 5 — Claude's response to the second question, showing it ran a command and reported the line count
![response to question 2](/week-02-agentic-ai/screenshots/response-second-question.png)

---

## 8. Industry Insight

In professional agentic DevOps teams, engineers do not use Claude Code blind. Before trusting it with infrastructure, they watch it work on safe, low-stakes tasks — reading files, counting lines, describing what it sees. This is how you build calibration: you learn what Claude does well, where it guesses, and when it needs more context. That calibration is exactly what the rest of this week builds on.

---

## 9. Submission Instructions

Complete all tasks in sequence.

Your submission must include:
- All 5 required screenshots
- Your GitHub forked repository URL

---

https://github.com/wisegeorge1/Ultimate-Agentic-DevOps-with-Claude-Code

## 10. Solution Walkthrough

A step-by-step solution and troubleshooting guide will be provided.

---

## 11. LinkedIn Requirement

Not required for this assignment.

---

## 12. Completion Checklist

Before submission, verify:
- [ ] Claude Code CLI installed and `claude --version` works
- [ ] Claude Code authenticated — opens without asking for login again
- [ ] Starter repo forked and cloned
- [ ] All 5 screenshots captured and added to your GitHub Repository file
- [ ] GitHub repo URL included

---
