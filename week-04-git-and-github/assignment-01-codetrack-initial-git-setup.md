# Assignment 1 — CodeTrack: Initial Git Setup (Local Only)

Part of the DevOps Micro Internship (DMI) Cohort 3 with Agentic AI

---

## Purpose

In this assignment, you will set up Git correctly on your local machine before starting the CodeTrack project. You will create a local repository and configure your Git identity at both the repository level (local) and the machine level (global). This assignment is local only — you will not push anything to GitHub yet.

---

# Task 1 — Create the CodeTrack Project and Initialize Git

## Goal

Create a `CodeTrack` project folder and initialize it as a Git repository.

### Evidence

#### Screenshot 1 — Output of `git init` inside `CodeTrack` showing "Initialized empty Git repository"

![Screenshot 1 - git init output](./screenshots/assignment-01/Screenshot%201.png)

---

#### Screenshot 2 — Output of `ls -a` showing the `.git` folder

![Screenshot 2 - ls -a output](./screenshots/assignment-01/Screenshot%202.png)

---

### Notes

**1. What is the `.git` folder, and why does it matter?**

The `.git` folder is a hidden directory that Git creates when you initialize a repository. It serves as the heart of version control for your project by storing all the metadata and history needed to track changes. Inside the `.git` folder, you'll find important subdirectories like:

- **objects/**: Stores all the actual file content and commits (using SHA-1 hashing)
- **refs/**: Contains pointers to commit objects (branches and tags)
- **HEAD**: Points to the current branch you're working on
- **config**: Contains repository-specific configuration settings (like your local username and email)
- **logs/**: Records all reference updates in the reflog

The `.git` folder matters because it's what makes your directory a Git repository. Without it, you'd just have regular files with no version control. Every time you make a commit, create a branch, or change the repository, Git updates the contents of the `.git` folder. It's also crucial for collaboration — this folder enables you to track who made what changes, when they were made, and why (via commit messages). When you clone a repository, you're essentially copying the entire `.git` folder from the remote server, which gives you the complete history locally.

---

# Task 2 — Configure Git Identity Locally (Repository-Only)

## Goal

Set your Git username and email for the `CodeTrack` repository only, using `git config --local`.

### Evidence

#### Screenshot 3 — Output of `git config --local --list` showing your `user.name` and `user.email`

![Screenshot 3 - git config --local --list output](./screenshots/assignment-01/Screenshot%203.png)

---

# Task 3 — Configure Git Identity Globally

## Goal

Set a global Git username and email for this machine using `git config --global`. Note that CodeTrack's local settings still take priority over these.

### Evidence

#### Screenshot 4 — Output of `git config --global --list` showing your `user.name` and `user.email`

![Screenshot 4 - git config --global --list output](./screenshots/assignment-01/Screenshot%204.png)

---

# Submission Instructions

- Add all required screenshots in your submission
- Full Name must be visible in required screenshots
- Do not expose passwords, access tokens, or private keys

---

# Completion Checklist

- [x] `CodeTrack` folder created and initialized as a Git repository (Screenshots 1–2)
- [x] Explanation of the `.git` folder written in your own words
- [x] Local `user.name` and `user.email` configured and verified (Screenshot 3)
- [x] Global `user.name` and `user.email` configured and verified (Screenshot 4)
- [x] No sensitive data exposed

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
