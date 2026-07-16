# Assignment 4: Building Your AI Team

---

## 1. Assignment Overview

**Assignment:** Subagents              
**Estimated Time:** 60 minutes            
**Difficulty:** Intermediate             
**Category:** Agentic AI, Subagents              

---

## 2. Objective

Build all 3 subagent files, understand why each one uses a different model and tool set, run two live subagent delegations, and analyze the reports they produce.

---

## 3. Real-World Scenario

No senior engineer on a real team does everything themselves. Security reviews, cost checks, and code generation are separate concerns — done by people with different expertise, different access levels, and different tools. Subagents bring the same separation to AI workflows. Instead of one overloaded general assistant with full access to everything, you build a team of specialists. Each one knows its job, uses only the tools it needs, and runs on the model that fits the task. That is professional-grade agentic engineering.

---

## 4. Learning Outcomes

- Understand the difference between skills (shared context) and subagents (isolated context)
- Configure subagents with correct tools, model, and description for their job
- Understand why model selection matters: Sonnet for deep analysis, Haiku for fast checks
- Trigger agent delegation by typing a natural language prompt
- Read and interpret a security audit report and a cost optimization report

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

- Assignment 3 completed — Terraform files scaffolded and visible in `terraform/`
- All 3 agent files downloaded from the Resources section of Lecture 6.3

---

## 7. Tasks

Each task must be completed sequentially.

---

### Task 1 — Create the Agents Folder and Add Files

**Goal:** Set up `.claude/agents/` and place all 3 agent files.

**Steps:**
1. Open the VS Code terminal
2. Create the agents folder
3. Move the 3 downloaded agent files into it - Resource [Click here](https://www.udemy.com/course/ultimate-agentic-ai-devops-with-claude-code/learn/lecture/54915307#overview)
4. Verify file names match exactly — the file name must match the `name` field in each file's frontmatter

**Commands:**
```bash
mkdir -p .claude/agents
```

**Expected Output:** `.claude/agents/` contains `security-auditor.md`, `tf-writer.md`, `cost-optimizer.md`.

**Screenshots Required:**
- Screenshot 1 — VS Code sidebar showing `.claude/agents/` with all 3 files

---

### Task 2 — Compare the Agent Configurations

**Goal:** Read the frontmatter of each agent and understand why they are configured differently.

**Steps:**
1. Open `security-auditor.md` — note the `tools` and `model` fields
2. Open `cost-optimizer.md` — note the `tools` and `model` fields
3. Open `tf-writer.md` — note the `tools` and `model` fields
4. Write a short answer (2–3 sentences each) to these 3 questions:
   - Why does the cost optimizer use Haiku instead of Sonnet?
   - Why does the security auditor NOT have Write in its tools list?
   - Why does the tf-writer use `inherit` instead of a specific model?

**Expected Output:** 3 written answers in your GitHub Repository folder showing you understand the design decisions behind each agent.

**Screenshots Required:**
- Screenshot 2 — `security-auditor.md` frontmatter showing model and tools configuration
- Screenshot 3 — `cost-optimizer.md` frontmatter showing the model and tools configuration

---

### Task 3 — Run the Security Auditor

**Goal:** Trigger the security auditor by natural language and read the report.

**Steps:**
1. Open the Claude Code terminal
2. Type this exact prompt: `"Audit my Terraform files for security issues."`
3. Watch Claude match the prompt to the security-auditor description and delegate
4. Read the full report — note any HIGH severity findings

**Commands (in Claude Code):**
```
Audit my Terraform files for security issues.
```

**Expected Output:** Claude shows a delegation message — "Launching security-auditor agent." The report comes back organized by severity. Likely findings include missing S3 encryption, TLS version, and access logging.

**Screenshots Required:**
- Screenshot 4 — The delegation message showing Claude launched the security-auditor
- Screenshot 5 — Security audit report output

---

### Task 4 — Run the Cost Optimizer

**Goal:** Trigger the cost optimizer and note how it differs from the security auditor in speed and focus.

**Steps:**
1. In the Claude Code terminal, type: `"Review my Terraform infrastructure for cost optimization."`
2. Note how much faster it finishes compared to the security auditor — Haiku vs Sonnet
3. Read the cost report

**Commands (in Claude Code):**
```
Review my Terraform infrastructure for cost optimization.
```

**Expected Output:** Claude delegates to cost-optimizer. It finishes noticeably faster. Report covers CloudFront price class, versioning lifecycle policy recommendation, and estimated monthly cost.

**Screenshots Required:**
- Screenshot 6 — The full cost optimization report

---

## 8. Industry Insight

The most common mistake teams make when adopting agentic AI is building one large general-purpose agent and giving it every tool and every capability. This works until something goes wrong — and then it is very hard to diagnose. The subagent pattern solves this. When a security audit runs on read-only tools and produces a wrong result, you know exactly where to look: the agent body and its checklist. Small, focused agents are easier to debug, easier to trust, and easier to improve over time. Start small. Specialize deliberately.

---

## 9. Submission Instructions

Complete all tasks in sequence.

Your submission must include:
- All 6 required screenshots
- 3 written answers in the Google Doc (from Task 2)
- Your GitHub repo URL (agents committed and visible)

Submit only a Google Doc link.
Follow the Assignment Submission Guidelines — (LINK)

---

## 10. Solution Walkthrough

A step-by-step solution and troubleshooting guide is available for reference:
Full solution walkthrough → [Click here](../assignment-solutions/assignment-04-subagents.md)

---

## 11. LinkedIn Requirement

Not required for this assignment.

---

## 12. Completion Checklist

Before submission, verify:
- [ ] All 3 agent files in `.claude/agents/`
- [ ] Screenshot 2 and 3 show different tools and models for each agent
- [ ] 3 written answers 
- [ ] Security auditor ran and produced a report with findings
- [ ] Cost optimizer ran and produced a report
- [ ] Agents committed and visible in GitHub repo

