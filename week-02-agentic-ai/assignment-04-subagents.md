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

![Week 02 Screenshorts](screenshots/Week-02-assignment-04-screenshot-1.png)

---

# Task 2 — Compare the Agent Configurations

## Goal

Analyze the configuration differences between the three agents and demonstrate understanding of model and tool selection.

### Written Answers

#### 1. Why does the cost optimizer use Haiku instead of Sonnet?

The cost optimizer uses Haiku because its job is mostly pattern-matching and not deep reasoning. It checks for oversized resources, unused services, expensive instance types, or things that could be swapped for cheaper alternatives. Haiku is the kind of review that does not need heavier reasoning power like sonnet.
From a DevOps engineer view, I think this is a practical choice: Haiku is faster and very cheaper to run, so it fits the task well without wasting compute on something that does not need it. Also, there is a nice bit of irony in it, that is, an agent whose whole purpose is saving money runs on the cheapest model available. Using Sonnet here would just be overkill for a straightforward review job.

---

#### 2. Why does the security auditor NOT have Write in its tools list?

The security auditor does not have "Write" access because its job is only to review and report, not to make changes directly. It can inspect Terraform files and flag issues like open security groups, weak IAM permissions, missing encryption, or exposed public resources but it should not be the one to edit anything.
This follows the principle of least privilege: give the agent only the access it needs to do its job and nothing more. Keeping it read-only avoids the risk of the agent making an unreviewed change to security-sensitive infrastructure, whether from a misjudgment or something like a prompt injection slipping through. The auditor finds problems and recommends fixes — a DevOps engineer still has to review and apply them.

---

#### 3. Why does the tf-writer use `inherit` instead of a specific model?

The tf-writer uses inherit so it follows whatever model the main Claude Code session is running, instead of being locked to one fixed model.
This makes sense because Terraform writing tasks vary a lot in complexity. Sometimes it is just spinning up a small S3 bucket and at other times it will be writing a full module with variables, outputs, IAM policies, and networking resources. By inheriting the model, tf-writer automatically gets access to whatever that is currently the strongest available model in the session, rather than being stuck on something outdated. Also, it keeps things consistent, such as if I upgrade my main session later, tf-writer benefits immediately without needing a manual config change.

---

### Evidence

#### Screenshot 2 — `security-auditor.md` frontmatter showing model and tools configuration

![Week 02 Screenshorts](screenshots/Week-02-assignment-04-screenshot-2a.png)
![Week 02 Screenshorts](screenshots/Week-02-assignment-04-screenshot-2b.png)

---

#### Screenshot 3 — `cost-optimizer.md` frontmatter showing the model and tools configuration

![Week 02 Screenshorts](screenshots/Week-02-assignment-04-screenshot-3a.png)
![Week 02 Screenshorts](screenshots/Week-02-assignment-04-screenshot-3b.png)

---

# Task 3 — Run the Security Auditor

## Goal

Trigger the security auditor agent and analyze the generated security report for your Terraform infrastructure.

### Evidence

#### Screenshot 4 — The delegation message showing Claude launched the security-auditor

![Week 02 Screenshorts](screenshots/Week-02-assignment-04-screenshot-4.png)

---

#### Screenshot 5 — Security audit report output

![Week 02 Screenshorts](screenshots/Week-02-assignment-04-screenshot-5a.png)
![Week 02 Screenshorts](screenshots/Week-02-assignment-04-screenshot-5b.png)
![Week 02 Screenshorts](screenshots/Week-02-assignment-04-screenshot-5c.png)
![Week 02 Screenshorts](screenshots/Week-02-assignment-04-screenshot-5d.png)
![Week 02 Screenshorts](screenshots/Week-02-assignment-04-screenshot-5e.png)
![Week 02 Screenshorts](screenshots/Week-02-assignment-04-screenshot-5f.png)
![Week 02 Screenshorts](screenshots/Week-02-assignment-04-screenshot-5g.png)
![Week 02 Screenshorts](screenshots/Week-02-assignment-04-screenshot-5h.png)
![Week 02 Screenshorts](screenshots/Week-02-assignment-04-screenshot-5i.png)
![Week 02 Screenshorts](screenshots/Week-02-assignment-04-screenshot-5j.png)
![Week 02 Screenshorts](screenshots/Week-02-assignment-04-screenshot-5k.png)
![Week 02 Screenshorts](screenshots/Week-02-assignment-04-screenshot-5l.png)

---

# Task 4 — Run the Cost Optimizer

## Goal

Trigger the cost optimizer agent and review the generated cost optimization report.

### Evidence

#### Screenshot 6 — The full cost optimization report

![Week 02 Screenshorts](screenshots/Week-02-assignment-04-screenshot-6a.png)
![Week 02 Screenshorts](screenshots/Week-02-assignment-04-screenshot-6b.png)
![Week 02 Screenshorts](screenshots/Week-02-assignment-04-screenshot-6c.png)

---

# Submission Instructions

- Ensure all agent files are committed in `.claude/agents/`
- Complete all written answers in your GitHub Repo
- Push final changes to your forked GitHub repository

---

## GitHub Repository URL

https://github.com/ToluFemiTayo/Ultimate-Agentic-DevOps-with-Claude-Code.git

`Add your URL here`

---

# Completion Checklist

- [✅] `.claude/agents/` folder contains all 3 agent files
- [✅] Screenshot 2 shows correct `security-auditor.md` configuration
- [✅] Screenshot 3 shows correct `cost-optimizer.md` configuration
- [✅] All 3 written answers completed 
- [✅] Security auditor executed successfully
- [✅] Cost optimizer executed successfully
- [✅] Security report is visible with findings
- [✅] Cost report is visible with recommendations
- [✅] All required screenshots added
- [✅] GitHub repo updated with agents

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