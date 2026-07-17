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

#### Screenshot 1 — VS Code sidebar showing `.claude/skills/` folder with all 4 subfolders visible

![Skills folder structure in VS Code](./screenshots/assignment-03/Screenshot%201.png)

---

# Task 2 — Add the Skill Files

## Goal

Place all required skill files into their correct directories and verify their configuration.

### Evidence

#### Screenshot 2 — `.claude/skills/scaffold-terraform/` open in VS Code showing both `SKILL.md` and `template-spec.md`

![scaffold-terraform skill folder contents](./screenshots/assignment-03/Screenshot%202.png)

---

#### Screenshot 3 — Screenshot 3 — `tf-plan/SKILL.md` frontmatter showing `allowed-tools: Bash, Read, Grep` (no Write) and `disable-model-invocation: true`

![tf-plan/SKILL.md showing allowed-tools restrictions](./screenshots/assignment-03/Screenshot%203.png)

---

# Task 3 — Run /scaffold-terraform

## Goal

Execute the `/scaffold-terraform` skill to generate a full Terraform infrastructure setup.

### Evidence

#### Screenshot 4 — Claude's response showing the scaffold complete with the file list

![Claude scaffold execution result](./screenshots/assignment-03/Screenshot%204.png)

---

#### Screenshot 5 — VS Code sidebar showing the `terraform/` folder with all generated files inside

![Generated terraform/ folder with all files](./screenshots/assignment-03/Screenshot%205.png)

---

# Task 4 — Run terraform init and /tf-plan

## Goal

Initialize Terraform and execute the `/tf-plan` skill to observe plan execution and output analysis.

### Evidence

#### Screenshot 6a — Claude's `/tf-plan` response showing auth failure execution result

![tf-plan execution with auth failure](./screenshots/assignment-03/Screenshot%206a.png)

---

#### Screenshot 6b — Claude's `/tf-plan` response showing successful execution result

![tf-plan execution successful](./screenshots/assignment-03/Screenshot%206b.png)


---

# 🌟 Bonus Activities — Beyond the Course Scope

## Task 5 — Cloud Deployment Using Course Skills

### Goal

Execute the complete cloud deployment pipeline using course-provided skills (`/tf-apply` and `/deploy`). This demonstrates the practical application of Terraform and deployment skills to create real infrastructure resources and deploy a live application to the cloud environment.

### Course-Provided Skills Used

#### `/tf-apply` Skill
- **Purpose:** Execute Terraform apply to create and modify cloud resources
- **Used for:** Provisioning infrastructure based on generated Terraform configuration
- **Part of:** Udemy course content — standard DevOps automation workflow

#### `/deploy` Skill
- **Purpose:** Deploy and configure the application on provisioned infrastructure
- **Used for:** Application deployment and service initialization
- **Part of:** Udemy course content — complements `/tf-apply` for complete deployment pipeline

### Evidence

#### Screenshot 7 — Claude's execution of the `/tf-apply` command creating cloud resources

![tf-apply skill execution](./screenshots/assignment-03/Screenshot%207.png)

---

#### Screenshot 8 — Claude's execution of the `/deploy` command deploying application to infrastructure

![deploy skill execution](./screenshots/assignment-03/Screenshot%208.png)

---

#### Screenshot 9 — Live application verified in browser showing deployed site is accessible

![Live site verification in browser](./screenshots/assignment-03/Screenshot%209.png)

---

### Key Achievements - Task 5

- ✅ Generated Terraform code successfully executed via `/tf-apply` skill
- ✅ Application deployed to cloud infrastructure using `/deploy` skill
- ✅ Real cloud resources provisioned (compute, networking, storage)
- ✅ Live application accessible and functioning in production environment
- ✅ Demonstrates practical DevOps workflow: scaffold → tf-apply → deploy

---

## Task 6 — Create a Custom Skill: `/undeploy`

### Goal

Extend the Claude Skills system by creating a brand-new skill (`/undeploy`) that was **not part of the original Udemy course content**. This skill demonstrates independent initiative in building agentic automation beyond the standard curriculum, providing infrastructure teardown and cleanup capabilities.

### Evidence

#### Screenshot 10 — VS Code showing the new `/undeploy` skill folder structure with SKILL.md and configuration files

![Custom undeploy skill folder structure](./screenshots/assignment-03/Screenshot%2010.png)

---

#### Screenshot 11 — The `/undeploy/SKILL.md` file showing skill configuration, allowed-tools, and restrictions

![undeploy SKILL.md configuration](./screenshots/assignment-03/Screenshot%2011.png)

---

#### Screenshot 12 — Claude's execution of the `/undeploy` command showing the skill in action

![undeploy skill execution result](./screenshots/assignment-03/Screenshot%2012.png)

---

### Key Achievements - Task 6

- ✅ `/undeploy` skill created independently (not in course materials)
- ✅ Proper SKILL.md configuration with allowed-tools restrictions
- ✅ Demonstrates understanding of skill system beyond course content
- ✅ Performs infrastructure teardown/cleanup complementary to `/scaffold-terraform`
- ✅ Custom skill creation showcases agentic AI thinking and practical DevOps problem-solving

---

# Submission Instructions

- Ensure `.claude/skills/` folder and all skill files are committed to your GitHub repository
- Run all commands successfully and capture required screenshots
- Push final changes to your forked repository

---

## GitHub Repository URL

[Git Repo](https://github.com/dev-enthusiast-84/Ultimate-Agentic-DevOps-with-Claude-Code)

## LinkedIn post URL

[LinkedIn Post](https://www.linkedin.com/posts/maneetta-antony-452075387_dmibypravinmishra-devops-agenticai-ugcPost-7481211203856257024-8Rjk/?utm_source=share&utm_medium=member_desktop&rcm=ACoAAF86Sz4BPT7sueDLOfQEmLqLbCo5V7ah-Jo)

---

# Completion Checklist

## Core Tasks
- [x] `.claude/skills/` folder created with all 4 skill folders
- [x] All skill files placed correctly
- [x] `tf-plan/SKILL.md` shows correct `allowed-tools` restrictions
- [x] `/scaffold-terraform` executed successfully
- [x] Terraform files generated inside `terraform/` folder
- [x] `terraform init` executed successfully
- [x] `/tf-plan` executed and output analyzed by Claude
- [x] All required screenshots added (1-6b)
- [x] GitHub repository URL included
- [x] LinkedIn post URL included

## Bonus Activities (Beyond Course Scope)

### Cloud Deployment Using Course Skills (Bonus Task 5)
- [x] `/tf-apply` skill executed to create cloud resources
- [x] `/deploy` skill executed to deploy application
- [x] Infrastructure deployed to cloud environment
- [x] Live site verified and accessible in browser
- [x] Screenshots 7-9 showing tf-apply, deploy, and site verification
- [x] End-to-end workflow demonstrated: scaffold → tf-apply → deploy → verify
- [x] Production environment verified with live traffic

### Custom Skill Development (Bonus Task 6)
- [x] `/undeploy` custom skill created (independent, not in course)
- [x] `/undeploy/SKILL.md` configured with proper allowed-tools restrictions
- [x] `/undeploy` skill documentation and structure completed
- [x] `/undeploy` skill executed successfully
- [x] Screenshots 10-12 showing skill structure, configuration, and execution
- [x] Demonstrates understanding of skill system beyond course materials
- [x] Infrastructure cleanup automation capability added

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