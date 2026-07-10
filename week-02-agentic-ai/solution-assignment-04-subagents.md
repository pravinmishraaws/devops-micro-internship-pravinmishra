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

![VS Code sidebar showing `.claude/agents/`](./screenshots/SS-A4/W2-A4-SS-1.png)

---

# Task 2 — Compare the Agent Configurations

## Goal

Analyze the configuration differences between the three agents and demonstrate understanding of model and tool selection.

### Written Answers

#### 1. Why does the cost optimizer use Haiku instead of Sonnet?

The cost optimizer performs straightforward pattern matching and resource inventory tasks. It scans Terraform files for known cost patterns (like CloudFront price classes or S3 storage tiers) and delivers structured recommendations. This task has clear criteria and doesn't require nuanced reasoning across multiple competing factors, making Haiku's speed and efficiency better suited than Sonnet's deeper reasoning capabilities. The trade-off favors cost and latency over analytical depth.

---

#### 2. Why does the security auditor NOT have Write in its tools list?

The security auditor is a read-only inspection tool. By excluding Write, it cannot accidentally or intentionally modify infrastructure files, creating an audit-proof boundary between analysis and execution. This enforces a security principle: the mechanism that detects problems should be separate from the mechanism that fixes them, preventing a single compromised agent from both identifying and patching vulnerabilities.

---

#### 3. Why does the tf-writer use `inherit` instead of a specific model?

The tf-writer generates and modifies live infrastructure code, so it must adapt to the parent context's model selection. Using inherit ensures consistency with Claude Code's default reasoning capability rather than forcing a fixed model that might be misaligned with the project's requirements. This allows the project to upgrade or adjust its base model without updating individual agent definitions.

---

### Evidence

#### Screenshot 2 — `security-auditor.md` frontmatter showing model and tools configuration

![`security-auditor.md`](./screenshots/SS-A4/W2-A4-SS-2.png)

---

#### Screenshot 3 — `cost-optimizer.md` frontmatter showing the model and tools configuration

![`cost-optimizer.md`](./screenshots/SS-A4/W2-A4-SS-3.png)

---

# Task 3 — Run the Security Auditor

## Goal

Trigger the security auditor agent and analyze the generated security report for your Terraform infrastructure.

### Evidence

#### Screenshot 4 — The delegation message showing Claude launched the security-auditor

![`Claude launched the security-auditor`](./screenshots/SS-A4/W2-A4-SS-4.png)

---

#### Screenshot 5 — Security audit report output

![`Security audit report output`](./screenshots/SS-A4/W2-A4-SS-5.png)

---

# Task 4 — Run the Cost Optimizer

## Goal

Trigger the cost optimizer agent and review the generated cost optimization report.

### Evidence

#### Screenshot 6 — The full cost optimization report

![`The full cost optimization report`](./screenshots/SS-A4/W2-A4-SS-6.png)

---

# Submission Instructions

- Ensure all agent files are committed in `.claude/agents/`
- Complete all written answers in your GitHub Repo
- Push final changes to your forked GitHub repository

---

## GitHub Repository URL

Paste your forked repository URL here:

`https://github.com/santosronnie26-sr/devops-micro-internship-pravinmishra`
`https://github.com/santosronnie26-sr/Ultimate-Agentic-DevOps-with-Claude-Code`

---

# Completion Checklist

- [✓] `.claude/agents/` folder contains all 3 agent files
- [✓] Screenshot 2 shows correct `security-auditor.md` configuration
- [✓] Screenshot 3 shows correct `cost-optimizer.md` configuration
- [✓] All 3 written answers completed 
- [✓] Security auditor executed successfully
- [✓] Cost optimizer executed successfully
- [✓] Security report is visible with findings
- [✓] Cost report is visible with recommendations
- [✓] All required screenshots added
- [✓] GitHub repo updated with agents

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