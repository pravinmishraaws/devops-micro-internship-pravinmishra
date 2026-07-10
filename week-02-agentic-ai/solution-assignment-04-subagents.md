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

#### Screenshot 1 — Agents folder structure in VS Code

![Screenshot 1](screenshots/week-02-assignment-04-screenshot-01.png).

---

# Task 2 — Compare the Agent Configurations

## Goal

Analyze the configuration differences between the three agents and demonstrate understanding of model and tool selection.

### Written Answers

#### 1. Why does the cost optimizer use Haiku instead of Sonnet?

The cost optimizer performs a focused task: reviewing Terraform configurations to identify opportunities for reducing infrastructure costs. This work prioritizes speed and efficiency over complex reasoning, making Haiku the better choice. It delivers reliable recommendations while using fewer computational resources, which aligns with the purpose of a cost-focused agent...

---

#### 2. Why does the security auditor NOT have Write in its tools list?

The security auditor is designed to assess infrastructure and report security risks without modifying project files. Restricting it to read-only tools prevents unintended changes during an audit and ensures the integrity of the codebase. This follows the principle of least privilege, where an agent receives only the permissions required to perform its specific responsibility...

---

#### 3. Why does the tf-writer use `inherit` instead of a specific model?

The tf-writer uses inherit so it automatically adopts the model selected for the active Claude Code session. This keeps the agent flexible and ensures consistent behavior across different projects and workflows without requiring changes to its configuration. It also allows the agent to benefit from improvements made to the active model over time...

---

### Evidence

#### Screenshot 2 — security-auditor.md frontmatter

![Screenshot 2](screenshots/week-02-assignment-01-screenshot-01.png).

---

#### Screenshot 3 — cost-optimizer.md frontmatter

![Screenshot 3](screenshots/week-02-assignment-04-screenshot-03.png).

---

# Task 3 — Run the Security Auditor

## Goal

Trigger the security auditor agent and analyze the generated security report for your Terraform infrastructure.

### Evidence

#### Screenshot 4 — Security auditor delegation triggered

![Screenshot 4](screenshots/week-02-assignment-04-screenshot-04.png).

---

#### Screenshot 5 — Security audit report output

![Screenshot 5](screenshots/week-02-assignment-04-screenshot-05.png).

---

# Task 4 — Run the Cost Optimizer

## Goal

Trigger the cost optimizer agent and review the generated cost optimization report.

### Evidence

#### Screenshot 6 — Cost optimization report output

![Screenshot 6](screenshots/week-02-assignment-04-screenshot-06.png)..

---

# Submission Instructions

- Ensure all agent files are committed in `.claude/agents/`
- Complete all written answers in your Google Doc submission
- Push final changes to your forked GitHub repository
- Submit only the Google Doc link as required

---

## Google Doc Link

Paste your Google Doc URL here:

** {https://docs.google.com/document/d/1dUrgDSBdqI9nB-93aRv2ltPVOyCOKayvNiaLW_IiQao/edit?usp=sharing} **

---

## GitHub Repository URL

Paste your forked repository URL here:

** {https://github.com/PeaceCloud-Solutions/Ultimate-Agentic-DevOps-with-Claude-Code.git} **

---

# Completion Checklist

- [-] `.claude/agents/` folder contains all 3 agent files
- [-] Screenshot 2 shows correct `security-auditor.md` configuration
- [-] Screenshot 3 shows correct `cost-optimizer.md` configuration
- [-] All 3 written answers completed in Google Doc
- [-] Security auditor executed successfully
- [-] Cost optimizer executed successfully
- [-] Security report is visible with findings
- [-] Cost report is visible with recommendations
- [-] All required screenshots added
- [-] GitHub repo updated with agents

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