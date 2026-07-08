# Assignment 6 — Safety Rails for Your AI Agent

Part of the DevOps Micro Internship (DMI) Cohort 3 with Agentic AI

---

## Purpose

In this assignment, you will configure safety and control mechanisms for Claude Code using permissions and hooks. You will define team-level command restrictions and implement prompt-level and tool-level hooks to prevent destructive actions before they execute.

---

# Task 1 — Create settings.json with Permissions

## Goal

Create a team-level `settings.json` file with allow and deny rules for safe command execution.

### Evidence

#### Screenshot 1 — Screenshot 1 — `settings.json` open in VS Code showing the full permissions configuration

Add your screenshot here.

![settings.json](image-35.png)

# Task 2 — Add the UserPromptSubmit Hook

## Goal

Add a hook that intercepts user prompts before Claude starts execution and blocks destructive intent.

### Evidence

#### Screenshot 2 — settings.json showing UserPromptSubmit hook

![UserPrompt](image-36.png)

---

# Task 3 — Add the PreToolUse Hook

## Goal

Extend `settings.json` with a PreToolUse hook that blocks dangerous Bash commands before execution.

### Evidence

#### Screenshot 3 — full settings.json with permissions and hooks

![permissions](image-37.png)

---

# Task 4 — Test the UserPromptSubmit Hook

## Goal

Verify that destructive prompts are blocked before Claude begins execution.

### Evidence

#### Screenshot 4 — blocked prompt due to UserPromptSubmit hook

Add your screenshot here.

---

# Task 5 — Test the PreToolUse Hook

## Goal

Verify that dangerous commands are intercepted before execution by the PreToolUse hook.

### Evidence

#### Screenshot 5 — PreToolUse hook blocking terraform destroy

Add your screenshot here.

---

# Submission Instructions

- Ensure `.claude/settings.json` is committed to your GitHub repository
- Run both hook tests successfully and capture required screenshots
- Push final changes to your forked repository

---

## GitHub Repository URL

Paste your forked repository URL here:

`github`https://github.com/AIN0908/devops-micro-internship-pravinmishra/tree/main/week-02-agentic-ai

---

# Completion Checklist

- [ ] `settings.json` created with permissions block
- [ ] UserPromptSubmit hook added correctly
- [ ] PreToolUse hook added correctly
- [ ] Screenshot 3 shows full hooks + permissions configuration
- [ ] Prompt-level destructive test was blocked (Screenshot 4)
- [ ] Command-level `terraform destroy` was blocked (Screenshot 5)
- [ ] `settings.json` committed and visible in GitHub repo

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