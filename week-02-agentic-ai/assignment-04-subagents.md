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

![Claude agents](image-22.png)

# Task 2 — Compare the Agent Configurations

## Goal

Analyze the configuration differences between the three agents and demonstrate understanding of model and tool selection.

### Written Answers

#### 1. Why does the cost optimizer use Haiku instead of Sonnet?

From my little understanding for now, I think the cost optimizer is designed for efficiency and lightweight analysis. Haiku is a smaller, faster model compared to Sonnet, which makes it ideal for quick calculations and cost trade-off decisions. Using Haiku reduces resource usage while still providing sufficient reasoning power for optimization tasks.

---

#### 2. Why does the security auditor NOT have Write in its tools list?

For this, I think the security auditor is focused on reviewing and analyzing configurations, not modifying them. 

By excluding the Write tool, it prevents accidental or unauthorized changes to sensitive files. This ensures the auditor remains a read-only agent, maintaining integrity and trust in its security assessments.

---

#### 3. Why does the tf-writer use `inherit` instead of a specific model?

The tf-writer is meant to generate Terraform code, but its modeling needs may vary depending on the environment. 

By using inherit, it is leveraging the parent configuration’s model choice, ensuring consistency across the system. 

This makes the agent flexible and adaptable without locking it to a single model.

---

### Evidence

#### Screenshot 2 — `security-auditor.md` frontmatter showing model and tools configuration

![security-auditor](image-23.png)

---

#### Screenshot 3 — `cost-optimizer.md` frontmatter showing the model and tools configuration

![cost-optimizer](image-24.png)

---

# Task 3 — Run the Security Auditor

## Goal

Trigger the security auditor agent and analyze the generated security report for your Terraform infrastructure.

### Evidence

#### Screenshot 4 — The delegation message showing Claude launched the security-auditor

![security auditor](image-25.png)

---

#### Screenshot 5 — Security audit report output

![Output](image-26.png)

---

# Task 4 — Run the Cost Optimizer

## Goal

Trigger the cost optimizer agent and review the generated cost optimization report.

### Evidence

#### Screenshot 6 — The full cost optimization report

![Report](image-27.png)

---

# Submission Instructions

- Ensure all agent files are committed in `.claude/agents/`
- Complete all written answers in your GitHub Repo
- Push final changes to your forked GitHub repository

---

## GitHub Repository URL



[Github](https://github.com/AIN0908/devops-micro-internship-pravinmishra/blob/main/week-02-agentic-ai/solution-assignment-03-skills.md)

---

# Completion Checklist

- [✅ Completed ] `.claude/agents/` folder contains all 3 agent files
- [✅ Completed ] Screenshot 2 shows correct `security-auditor.md` configuration
- [✅ Completed ] Screenshot 3 shows correct `cost-optimizer.md` configuration
- [✅ Completed ] All 3 written answers completed 
- [✅ Completed ] Security auditor executed successfully
- [✅ Completed ] Cost optimizer executed successfully
- [✅ Completed ] Security report is visible with findings
- [✅ Completed ] Cost report is visible with recommendations
- [✅ Completed ] All required screenshots added
- [✅ Completed ] GitHub repo updated with agents

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