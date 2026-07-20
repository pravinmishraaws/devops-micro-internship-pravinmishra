# Assignment 1 — AWS Free Tier Account Setup (EpicReads Cloud Onboarding)

Part of the DevOps Micro Internship (DMI) Cohort 3 with Agentic AI

---

## Purpose

In this assignment, you will create and verify an AWS Free Tier account as part of onboarding EpicReads — an online bookstore moving to the cloud. You will demonstrate an understanding of AWS fundamentals, Free Tier services, and account setup by answering conceptual questions and capturing proof of a working AWS Console login.

---

# Task 1 — Understanding AWS & Free Tier

## Goal

Demonstrate understanding of AWS basics and Free Tier usage by answering the following questions in your own words (3–4 lines each).

### Answers

#### Question 1 — What is an AWS account, and why do you need it at this stage?

An AWS account is basically your personal identity and billing container within Amazon's cloud platform. It's what ties together everything you spin up, from storage buckets to virtual servers, under one login and one payment method. For EpicReads, we need this at the start because every single AWS resource (compute, storage, databases, etc.) has to live inside an account; there's no way to provision anything without it. It's the foundation everything else in the migration gets built on top of.

---

#### Question 2 — What is AWS Free Tier, and how long does it last?

AWS Free Tier is Amazon's way of letting new users try out their services without paying anything upfront, so you can experiment and build small projects risk-free. It's actually split into three types: some offerings are free for 6 months after signup, some are "always free" up to a certain usage cap (even after the 6 months ends), and a few are short-term trials tied to a specific service. For EpicReads' onboarding, the 6-month clock is the one that matters most since that's when we'll be doing the bulk of our early testing.

---

#### Question 3 — Name three AWS Free Tier services and their free usage limits.

A few good examples: Amazon EC2 gives you 750 hours per month of a t2.micro or t3.micro instance, which is enough to keep a small server running continuously for testing. 
Amazon S3 offers 5GB of standard storage plus a set number of GET/PUT requests each month, handy for hosting static assets like book cover images.  
Amazon RDS provides 750 hours per month of a db.t2.micro or db.t3.micro database instance along with 20GB of storage, which would work fine for a lightweight version of EpicReads' catalog database while we're prototyping.


---

# Task 2 — Create AWS Free Tier Account

## Goal

Create a valid AWS Free Tier account and sign in to the AWS Management Console.

> No screenshots required for this task. Completion is verified through Task 3.

---

# Task 3 — Verify AWS Account

## Goal

Confirm that your AWS account setup is complete by navigating to the Account section and capturing proof.

### Evidence

#### Screenshot 1 — AWS Account page showing account name (email may be blurred)

![screenshot-1](screenshots/gideon-omole-as1-scr1.png)

---

# Submission Instructions

- Add all required screenshots in your GitHub repository submission
- Full name must be visible in required screenshots
- Do not expose sensitive information (keys, passwords, account IDs)

---

# Completion Checklist

- [ ] Task 1 answers written in own words
- [ ] AWS Free Tier account created successfully
- [ ] Signed in to AWS Management Console
- [ ] Screenshot of AWS Account page captured (full name visible, no sensitive data)
- [ ] All required screenshots added to repository

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