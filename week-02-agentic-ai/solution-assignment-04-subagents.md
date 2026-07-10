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

After working through setting up the agents, it makes sense that cost-optimizer uses Haiku. When I looked at the config, the cost optimizer is doing pretty basic tasks - reading the Terraform files, comparing resource pricing, and spotting unused instances. It's not like it needs to make complex architectural decisions. 

The reason is financial - Haiku costs way less than Sonnet, and you're going to run cost checks pretty regularly (sometimes daily). If you used Sonnet for every cost scan, that would eat into the savings the agent is trying to find. I realized that the cost-optimizer doesn't need deep reasoning - it's just analyzing numbers and making recommendations. Sonnet would be overkill and wasteful. Haiku is fast enough to give you quick results, and it keeps the API costs down.

---

#### 2. Why does the security auditor NOT have Write in its tools list?

**Answer:**

When I looked at the security-auditor.md config, I noticed it only has Read and Bash tools - no Write at all. At first I thought that was weird, but then I understood why. The security auditor should only be scanning and reporting vulnerabilities, not fixing them.

If I gave it Write access, it could theoretically auto-fix issues, but then I'd have an agent making security changes to my infrastructure without anyone reviewing them. That's dangerous. What if the agent misunderstands something or gets confused? You'd have unauthorized changes in production.

Also, security is sensitive. I want a human (or at least a separate approval process) between finding a vulnerability and actually fixing it. The auditor reads everything, finds problems, and reports. That's it. Then I manually review and decide what to do. It's the right separation of duties - auditor doesn't fix, it just finds and reports.

---

#### 3. Why does the tf-writer use `inherit` instead of a specific model?

**Answer:**

Looking at the tf-writer.md, I saw it says `model: inherit` instead of specifying Haiku or Sonnet. That was interesting. I think the idea is that tf-writer is doing the heavy lifting - it's writing actual Terraform code, modules, variables, all that complex stuff. It can't be too limited.

If you lock it to Haiku like the cost-optimizer, it might not be smart enough for tricky infrastructure decisions. By using `inherit`, it automatically uses whatever model I'm running in my main session. So if I'm using Sonnet for my project, tf-writer gets Sonnet. If I upgrade to a better model later, tf-writer automatically upgrades too without me having to change anything.

I also realized it's about consistency - I'm not managing model selection in 10 different places. The cost-optimizer needs Haiku (that's a specific requirement), but tf-writer is a general-purpose agent that should match the capability of the main Claude instance. That's cleaner and more flexible when your project requirements change.

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