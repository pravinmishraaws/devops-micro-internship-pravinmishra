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

![Agents folder structure in VS Code](./screenshots/Solution-Assignment/assignment-04/Screenshot%201.png)

---

# Task 2 — Compare the Agent Configurations

## Goal

Analyze the configuration differences between the three agents and demonstrate understanding of model and tool selection.

### Written Answers

#### 1. Why does the cost optimizer use Haiku instead of Sonnet?

**Answer:**

We use Haiku for the cost optimizer because it's cheaper and that's perfect for this job. Cost analysis is pretty straightforward - you're just looking at infrastructure, spotting wasted resources, and doing calculations. You don't need Sonnet's extra power for that. 

Think of it this way: Haiku is like a reliable calculator, while Sonnet is like a research scientist. For counting money and finding savings, you just need the calculator. Plus, Haiku is faster and cheaper, so we can run cost checks more often without burning money on the AI itself. It's the practical choice - why pay for a Ferrari when you just need to drive to the store?

---

#### 2. Why does the security auditor NOT have Write in its tools list?

**Answer:**

The security auditor doesn't have Write because its job is to look for problems, not fix them. It's like a doctor who diagnoses but doesn't operate - you want them to tell you what's wrong, not mess with your stuff.

If we gave the auditor Write access, it could accidentally change things or introduce new problems while "fixing" issues. Plus, we want security changes to be reviewed and approved by humans before they happen. The auditor finds the vulnerabilities, reports them, and then a human (or another agent with proper approval) decides what to do about it.

It's also safer this way. Even if something goes wrong with the agent, it can't accidentally damage your infrastructure because it doesn't have the keys to make changes. Smart safety design.

---

#### 3. Why does the tf-writer use `inherit` instead of a specific model?

**Answer:**

The tf-writer uses `inherit` because it's a core agent that needs to be as smart as whatever model you're using for the whole project. Instead of picking a specific model like Haiku or Sonnet, it says "just use whatever the main Claude setup is using."

Think of it like this: Haiku and Sonnet are specialized agents with specific needs (Haiku is cheap, auditor is read-only). But tf-writer is the main workhorse that generates your actual infrastructure code, so it needs the power and smarts of whatever model you have configured. If you upgrade the project from Sonnet to a better model, the tf-writer automatically gets that upgrade too - no need to change settings multiple places.

It's also simpler to manage. You set the model once in your project config, and all the core agents like tf-writer automatically follow along. Much cleaner than hardcoding "use Sonnet" in multiple places.

---

### Evidence

#### Screenshot 2 — `security-auditor.md` frontmatter showing model and tools configuration

![security-auditor.md configuration](./screenshots/Solution-Assignment/assignment-04/Screenshot%202.png)

---

#### Screenshot 3 — `cost-optimizer.md` frontmatter showing the model and tools configuration

![cost-optimizer.md configuration](./screenshots/Solution-Assignment/assignment-04/Screenshot%203.png)

---

# Task 3 — Run the Security Auditor

## Goal

Trigger the security auditor agent and analyze the generated security report for your Terraform infrastructure.

### Evidence

#### Screenshot 4 — The delegation message showing Claude launched the security-auditor

![Security auditor delegation message](./screenshots/Solution-Assignment/assignment-04/Screenshot%204.png)

---

#### Screenshot 5 — Security audit report output

![Security audit report output](./screenshots/Solution-Assignment/assignment-04/Screenshot%205.png)

---

# Task 4 — Run the Cost Optimizer

## Goal

Trigger the cost optimizer agent and review the generated cost optimization report, including recommendations and cost savings analysis.

### Evidence

#### Screenshot 6a — The delegation message showing Claude launched the cost-optimizer

![Cost optimizer delegation message](./screenshots/Solution-Assignment/assignment-04/Screenshot%206a.png)

---

#### Screenshot 6 — The cost optimization report with recommendations

![Cost optimization report output](./screenshots/Solution-Assignment/assignment-04/Screenshot%206.png)

---

# Task 5 — Agent Workflow Summary

## Goal

Capture and document the complete agent workflow showing how subagents were orchestrated to analyze the infrastructure.

### Evidence

#### Screenshot 7 — Complete agent workflow or summary output

![Agent workflow summary](./screenshots/Solution-Assignment/assignment-04/Screenshot%207.png)

---

# Submission Instructions

- Ensure all agent files are committed in `.claude/agents/`
- Complete all written answers in your GitHub Repo
- Push final changes to your forked GitHub repository

---

## GitHub Repository URL

Paste your forked repository URL here:

`__________________________`

---

# Completion Checklist

- [x] `.claude/agents/` folder contains all 3 agent files
- [x] Screenshot 1 shows `.claude/agents/` folder structure
- [x] Screenshot 2 shows correct `security-auditor.md` configuration
- [x] Screenshot 3 shows correct `cost-optimizer.md` configuration
- [x] All 3 written answers completed 
- [x] Security auditor executed successfully (Screenshot 4 - delegation)
- [x] Security auditor report generated (Screenshot 5)
- [x] Cost optimizer executed successfully (Screenshot 6 - report)
- [x] Cost optimization analysis documented (Screenshot 6a - metrics)
- [x] Agent workflow documented (Screenshot 7)
- [x] All 8 required screenshots added
- [ ] GitHub repo updated with agents and written answers

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