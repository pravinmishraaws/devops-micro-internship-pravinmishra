# Assignment 3 — Building Your Command Center

Part of the DevOps Micro Internship (DMI) Cohort 3 with Agentic AI

---

## Purpose

In this assignment, you will build a local Claude Skills system by creating the `.claude/skills/` folder structure, adding predefined skill files, and executing a real agentic command (`/scaffold-terraform`) to generate infrastructure code. You will also observe how skills enforce tool restrictions and enable controlled automation.

---

# Task 1 — Create the Skill Folder Structure

## Goal

Create the required `.claude/skills/` directory structure for all skills.

### Evidence

#### Screenshot 1 — Skills folder structure in VS Code

![Screenshot 1](screenshots/c-skills.png)

---

# Task 2 — Add the Skill Files

## Goal

Place all required skill files into their correct directories and verify their configuration.

### Evidence

#### Screenshot 2 — scaffold-terraform skill folder contents

![Screenshot 2](screenshots/scaffF.png)

---

#### Screenshot 3 — tf-plan/SKILL.md showing allowed-tools restrictions

![Screenshot 3](screenshots/TF_plann.png)

---

# Task 3 — Run /scaffold-terraform

## Goal

Execute the `/scaffold-terraform` skill to generate a full Terraform infrastructure setup.

### Evidence

#### Screenshot 4 — Claude scaffold execution result

![Screenshot 4](screenshots/terrf.png)

---

#### Screenshot 5 — Generated terraform/ folder with all files

![screenshot 5](screenshots/all-terrf.png)

---

# Task 4 — Run terraform init and /tf-plan

## Goal

Initialize Terraform and execute the `/tf-plan` skill to observe plan execution and output analysis.

### Evidence

#### Screenshot 6 — /tf-plan execution and Claude analysis output

![Screnshot 6](screenshots/cred.png)

---

# Submission Instructions

- Ensure `.claude/skills/` folder and all skill files are committed to your GitHub repository
- Run all commands successfully and capture required screenshots
- Push final changes to your forked repository

---

## GitHub Repository URL

Paste your forked repository URL here:

https://github.com/ayomikunphilip/Ultimate-Agentic-DevOps-with-Claude-Code/tree/main/.claude/skills
---

## Linkedin URL

https://www.linkedin.com/posts/ayomikunphilip_dmibypravinmishra-agenticai-claudecode-ugcPost-7480631361033179136-HMRv/?utm_source=share&utm_medium=member_desktop&rcm=ACoAAF4cLMMBGj_ND3_b5bGU28ywvq8aZAW62fs

## LinkedIn Screenshot

![LinkedIn Post](screenshots/First_post.png)

https://www.linkedin.com/posts/ayomikunphilip_dmibypravinmishra-agenticai-claudecode-activity-7480631386073288704-mXPJ?utm_source=social_share_send&utm_medium=member_desktop_web&rcm=ACoAAF4cLMMBGj_ND3_b5bGU28ywvq8aZAW62fs---

# Completion Checklist

- [ ] `.claude/skills/` folder created with all 4 skill folders
- [ ] All skill files placed correctly
- [ ] `tf-plan/SKILL.md` shows correct `allowed-tools` restrictions
- [ ] `/scaffold-terraform` executed successfully
- [ ] Terraform files generated inside `terraform/` folder
- [ ] `terraform init` executed successfully
- [ ] `/tf-plan` executed and output analyzed by Claude
- [ ] All required screenshots added
- [ ] GitHub repository URL included

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