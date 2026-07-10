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

Cost optimization is just analyzing numbers and finding wasted resources - doesn't need Sonnet's advanced reasoning. Haiku is cheaper and faster, so if you run daily cost checks, you save money on API calls instead of burning it on the tool itself.

---

#### 2. Why does the security auditor NOT have Write in its tools list?

**Answer:**

The auditor's job is to find problems, not fix them. If it had Write access, it could make unauthorized security changes without human review, which is risky.

---

#### 3. Why does the tf-writer use `inherit` instead of a specific model?

**Answer:**

tf-writer is the main agent writing Terraform code - it needs to be as smart as the main Claude instance, not locked to a cheap model like Haiku. Using `inherit` means it automatically gets the same model you're using for the whole project, and if you upgrade later, it upgrades too.

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

# Task 5 — Dynamic Agentic Workflow Orchestration

## Goal

Demonstrate the complete dynamic workflow orchestration where multiple specialized agents are triggered in parallel to analyze infrastructure, then synthesize findings into actionable recommendations.

### Evidence

#### Screenshot 7a — Dynamic Workflow Launch: Parallel Agent Execution

![Dynamic workflow launch with parallel agents](./screenshots/Solution-Assignment/assignment-04/Screenshot%207a.png)

**Description:** Shows the infrastructure audit workflow launching three concurrent agents (security-audit, cost-analysis, drift-detection) in parallel using `/workflows` orchestration. Also shows the drift-detector.md agent configuration file. The agents begin execution in background with monitoring via `/workflows watch` command. Demonstrates workflow initialization with multiple agents starting simultaneously.

---

#### Screenshot 7b — Workflow In Progress: Audit Phase Completing

![Workflow audit phase in progress](./screenshots/Solution-Assignment/assignment-04/Screenshot%207b.png)

**Description:** Shows workflow execution with three audit agents running concurrently (security-audit: Sonnet 5 - 1m32s, cost-analysis: Haiku 4.5 - 45s, drift-detection: Haiku 4.5 - 2m45s). Total time shown as 3/4 agents at 3m19s. The Audit phase shows 3/3 agents completed with Synthesis phase (0/1) queued. Also displays the four agent configuration files (cost-optimizer, drift-detector, security-auditor, tf-writer) in the agents folder.

---

#### Screenshot 7c — Synthesis Phase: Consolidating Agent Findings

![Synthesis phase consolidation](./screenshots/Solution-Assignment/assignment-04/Screenshot%207c.png)

**Description:** Demonstrates the synthesis phase where a single agent (Haiku 4.5) consolidates findings from all three parallel audit agents. The synthesis agent processes 17.4k tokens in 29 seconds, combining security, cost, and drift analysis results into a unified report.

---

#### Screenshot 7 — Final Report: Comprehensive Infrastructure Audit Results

![Complete infrastructure audit report](./screenshots/Solution-Assignment/assignment-04/Screenshot%207.png)

**Description:** Shows the complete synthesized report with Infrastructure Audit findings. Includes 3 CRITICAL issues (CloudFront disabled, CI/CD role mismatch), HIGH security gaps (untracked state, missing encryption, security headers), cost optimization recommendations ($1.50-2.50/month savings), and a prioritized action sequence. Demonstrates how the agentic workflow produces actionable, consolidated insights from parallel analysis.

---

### Key Workflow Features Demonstrated

✅ **Dynamic Parallel Execution** — 3 audit agents (security-auditor, cost-optimizer, drift-detector) running simultaneously with workflow display names (security-audit, cost-analysis, drift-detection)
✅ **Multi-Phase Orchestration** — Audit phase (3 agents in parallel) → Synthesis phase (1 consolidation agent) sequential pipeline  
✅ **Agent Specialization** — Sonnet 5 for security analysis, Haiku 4.5 for cost/drift analysis  
✅ **Result Synthesis** — Consolidation agent combines security, cost, and drift findings into unified report  
✅ **Actionable Output** — Priority-ordered remediation recommendations with specific fixes and cost savings  

### Evidence Verification Notes

**Agent Files vs Workflow Display Names:**

| Agent File | Workflow Display Name | Model | Purpose |
|-----------|----------------------|-------|---------|
| `security-auditor.md` | `security-audit` | Sonnet 5 | Infrastructure security analysis |
| `cost-optimizer.md` | `cost-analysis` | Haiku 4.5 | Cost optimization opportunities |
| `drift-detector.md` | `drift-detection` | Haiku 4.5 | State drift detection |
| (synthesis phase) | `synthesis` | Haiku 4.5 | Findings consolidation & report |

**Workflow Execution Timeline:**
- Parallel audit phase: Variable times (45s to 2m45s per agent)
  - cost-analysis (Haiku): ~45s
  - security-audit (Sonnet): ~1m32s
  - drift-detection (Haiku): ~2m45s
- Synthesis phase: ~29s (consolidation)
- Total workflow time: 3m+ end-to-end
- Demonstrates real parallel execution with varying completion times due to task complexity

---

# Submission Instructions

- Ensure all agent files are committed in `.claude/agents/`
- Complete all written answers in your GitHub Repo
- Push final changes to your forked GitHub repository

---

## GitHub Repository URL

Paste your forked repository URL here:

[Git Repo](https://github.com/dev-enthusiast-84/Ultimate-Agentic-DevOps-with-Claude-Code)

---

# Completion Checklist

## Core Tasks
- [x] `.claude/agents/` folder contains all 4 agent files (security-auditor, cost-optimizer, drift-detector, tf-writer)
- [x] Screenshot 1 shows `.claude/agents/` folder structure
- [x] Screenshot 2 shows correct `security-auditor.md` configuration
- [x] Screenshot 3 shows correct `cost-optimizer.md` configuration
- [x] All 3 written answers completed (Haiku for cost, no Write for auditor, inherit for tf-writer)

## Agent Execution Evidence
- [x] Security auditor executed successfully (Screenshot 4 - delegation)
- [x] Security auditor report generated (Screenshot 5 - findings)
- [x] Cost optimizer executed successfully (Screenshot 6a - delegation)
- [x] Cost optimizer report generated (Screenshot 6 - recommendations)

## Dynamic Workflow Orchestration (Task 5)
- [x] Workflow launch with parallel agent execution (Screenshot 7a)
- [x] Workflow completion showing all agents finished (Screenshot 7b)
- [x] Synthesis phase consolidating findings (Screenshot 7c)
- [x] Final comprehensive report with recommendations (Screenshot 7)
- [x] All 11 required screenshots added

## Missing/Pending Items
- [ ] **GitHub Repository URL** — Needs to be filled in
- [ ] **drift-detector.md** — Not shown in configuration screenshots (verify if needed for core requirements)

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