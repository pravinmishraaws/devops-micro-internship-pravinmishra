# Assignment 4 — Building Your AI Team

Part of the DevOps Micro Internship (DMI) Cohort 3 with Agentic AI

---

## Purpose

In this assignment, you will build and configure a set of specialized AI subagents inside your project. You will learn how different models and tool permissions define agent behavior, and you will trigger two real agent delegations to analyze security and cost aspects of your Terraform infrastructure.

---

# Task 1 — Create the Agents Folder and Add Files

## Goal

Create the `.claude/agents/` directory and add all required agent files.

### Evidence

#### Screenshot 1 — VS Code sidebar showing `.claude/agents/` with all 3 files

![Screenshot 1 - Agents folder](screenshots/assignment04-screenshot1-agents-folder.png)

---

# Task 2 — Compare the Agent Configurations

## Goal

Analyze the configuration differences between the three agents and demonstrate understanding of model and tool selection.

### Written Answers

#### 1. Why does the cost optimizer use Haiku instead of Sonnet?

Cost review is a lighter, more mechanical task — checking price classes, spotting missing lifecycle rules, matching known cost patterns. It doesn't require deep reasoning or nuanced tradeoff analysis the way a security audit does, so Haiku's speed is the better fit. This showed up directly in practice: the cost optimizer finished in 39 seconds versus the security auditor's 2 minutes 23 seconds for a comparable file set.

---

#### 2. Why does the security auditor NOT have Write in its tools list?

Its job is to find problems, not fix them. Restricting it to read-only tools (Read, Grep, Glob) means a misconfigured prompt, a bad finding, or even a compromised agent can never accidentally modify infrastructure — it can only report. This is the least-privilege principle applied to AI agents: give each one exactly the access its job requires, nothing more.

---

#### 3. Why does the tf-writer use `inherit` instead of a specific model?

Code generation benefits from matching whatever model is actively driving the main session, rather than being locked to one fixed model regardless of context. Using `inherit` lets `tf-writer` scale with the session's capability — if the main session is running a stronger model, the generated Terraform code benefits from that same reasoning power, instead of being capped at a fixed lower-tier model by default.

---

### Evidence

#### Screenshot 2 — `security-auditor.md` frontmatter showing model and tools configuration

![Screenshot 2 - Security auditor frontmatter](screenshots/assignment04-screenshot2-security-auditor-frontmatter.png)

---

#### Screenshot 3 — `cost-optimizer.md` frontmatter showing the model and tools configuration

![Screenshot 3 - Cost optimizer frontmatter](screenshots/assignment04-screenshot3-cost-optimizer-frontmatter.png)

---

# Task 3 — Run the Security Auditor

## Goal

Trigger the security auditor agent and analyze the generated security report for your Terraform infrastructure.

### Evidence

#### Screenshot 4 — The delegation message showing Claude launched the security-auditor

![Screenshot 4 - Security auditor delegation](screenshots/assignment04-screenshot4-security-delegation.png)

---

#### Screenshot 5 — Security audit report output

![Screenshot 5 - Security audit report](screenshots/assignment04-screenshot5-security-report.png)

---

# Task 4 — Run the Cost Optimizer

## Goal

Trigger the cost optimizer agent and review the generated cost optimization report.

### Evidence

#### Screenshot 6 — The full cost optimization report

![Screenshot 6 - Cost optimization report](screenshots/assignment04-screenshot6-cost-report.png)

---

# Submission Instructions

- Ensure all agent files are committed in `.claude/agents/`
- Complete all written answers in your GitHub Repo
- Push final changes to your forked GitHub repository

---

## GitHub Repository URL

Paste your forked repository URL here:

`https://github.com/Ubani-Onu-C/Ultimate-Agentic-DevOps-with-Claude-Code`

---

# Completion Checklist

- [x] `.claude/agents/` folder contains all 3 agent files
- [x] Screenshot 2 shows correct `security-auditor.md` configuration
- [x] Screenshot 3 shows correct `cost-optimizer.md` configuration
- [x] All 3 written answers completed 
- [x] Security auditor executed successfully
- [x] Cost optimizer executed successfully
- [x] Security report is visible with findings
- [x] Cost report is visible with recommendations
- [x] All required screenshots added
- [x] GitHub repo updated with agents

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