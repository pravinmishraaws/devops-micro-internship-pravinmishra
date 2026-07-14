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

![AgensfolderStructure](devops-micro-internship-pravinmishra\week-02-agentic-ai\screenshots\Agents3Files.png)

# Task 2 — Compare the Agent Configurations

## Goal

Analyze the configuration differences between the three agents and demonstrate understanding of model and tool selection.

### Written Answers

#### 1. Why does the cost optimizer use Haiku instead of Sonnet?

Add your answer here...

--- 1. Why does the cost optimizer use Haiku instead of Sonnet?
The Cost Optimizer uses Haiku because its tasks are generally:
Parsing Terraform configurations
Identifying cost-saving opportunities
Comparing resource configurations
Producing concise recommendations
These tasks are mostly pattern matching and rule-based analysis, which do not require the deeper reasoning capabilities of Sonnet.
Using Haiku provides several benefits:
Lower cost per request
Faster responses
Sufficient intelligence for straightforward optimization tasks
If every agent used Sonnet, operating costs would increase without significantly improving the quality of cost optimization recommendations.



#### 2. Why does the security auditor NOT have Write in its tools list?

Add your answer here...

--- The Security Auditor is intended to analyze, inspect, and report security issues—not modify infrastructure.

Removing the Write tool follows the principle of least privilege, meaning an agent should only receive the permissions it actually needs.

Without the Write tool, the security auditor can:

Read Terraform files
Identify vulnerabilities
Produce recommendations

But it cannot:

Modify Terraform code
Accidentally introduce changes
Overwrite infrastructure configurations

This makes the agent safer and reduces the risk of unintended or unauthorized changes.

#### 3. Why does the tf-writer use `inherit` instead of a specific model?

Add your answer here...

---  The tf-writer is responsible for generating or modifying Terraform code, so it benefits from using whichever model is configured as the system's default.

Using:

model: inherit

instead of specifying a model (such as Sonnet or Haiku) provides several advantages:

Automatically uses the project's configured default model.
Makes the configuration easier to maintain because changing the default model updates all inheriting agents.
Allows users or administrators to upgrade models without editing every agent configuration.
Keeps the agent portable across environments with different default model preferences.



### Evidence

#### Screenshot 2 — security-auditor.md frontmatter

![SecurittyAuditor.md](devops-micro-internship-pravinmishra\week-02-agentic-ai\screenshots\securityAudit.png)

![SecurityAudit2](devops-micro-internship-pravinmishra\week-02-agentic-ai\screenshots\SecurityReview.png)

#### Screenshot 3 — cost-optimizer.md frontmatter

![CostOptimizer](devops-micro-internship-pravinmishra\week-02-agentic-ai\screenshots\costOptimizer.png)

# Task 3 — Run the Security Auditor

## Goal

Trigger the security auditor agent and analyze the generated security report for your Terraform infrastructure.

### Evidence

#### Screenshot 4 — Security auditor delegation triggered

![SecurityAuditor](devops-micro-internship-pravinmishra\week-02-agentic-ai\screenshots\SecurityAudit1.png)

#### Screenshot 5 — Security audit report output

![SecurityAuditReortOutput1](devops-micro-internship-pravinmishra\week-02-agentic-ai\screenshots\Secoutput1.png)

![SecurityAuditReortOutput2](devops-micro-internship-pravinmishra\week-02-agentic-ai\screenshots\SecAud2.png)

# Task 4 — Run the Cost Optimizer

## Goal

Trigger the cost optimizer agent and review the generated cost optimization report.

### Evidence

#### Screenshot 6 — Cost optimization report output

![CostOptimizattionReport](devops-micro-internship-pravinmishra\week-02-agentic-ai\screenshots\CostAudit1.png)

![CostOpt2](devops-micro-internship-pravinmishra\week-02-agentic-ai\screenshots\CostAudit2.png)


![CostOpt3](devops-micro-internship-pravinmishra\week-02-agentic-ai\screenshots\CostAudit3.png)

![CostOpt4](devops-micro-internship-pravinmishra\week-02-agentic-ai\screenshots\costaud4.png)

![CostOpti5](devops-micro-internship-pravinmishra\week-02-agentic-ai\screenshots\CostAud5.png)


# Submission Instructions

- Ensure all agent files are committed in `.claude/agents/`
- Complete all written answers in your Google Doc submission
- Push final changes to your forked GitHub repository
- Submit only the Google Doc link as required

---

## Google Doc Link

Paste your Google Doc URL here:

`______________________`

--- https://docs.google.com/document/d/11VbIbEM3XOiqwid4LVcFNZ15JtRcAv0ZCmQnPpTBUJo/edit?usp=sharing

--- https://docs.google.com/document/d/1H-ZUtbBdsjfUIQw97JQoy2DhIKkzEeYiw8JOfXU-sDQ/edit?usp=sharing


--- https://docs.google.com/document/d/1Ou3cvVqf93xzU7nMhG56OCFs7LwxwVpP3MW38hxWDMs/edit?usp=sharing



## GitHub Repository URL

Paste your forked repository URL here:

`__________________________`

---https://github.com/Taiwo-Peter2023/Ultimate-Agentic-DevOps-with-Claude-Code

# Completion Checklist

- [ ] `.claude/agents/` folder contains all 3 agent files
- [ ] Screenshot 2 shows correct `security-auditor.md` configuration
- [ ] Screenshot 3 shows correct `cost-optimizer.md` configuration
- [ ] All 3 written answers completed in Google Doc
- [ ] Security auditor executed successfully
- [ ] Cost optimizer executed successfully
- [ ] Security report is visible with findings
- [ ] Cost report is visible with recommendations
- [ ] All required screenshots added
- [ ] GitHub repo updated with agents

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