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

An AWS account is the root identity and billing container that gives you access to Amazon Web Services. It is what ties together IAM permissions, resource ownership, and cost tracking under one roof. At this stage of onboarding EpicReads, I need one now to provision and manage cloud resources. It is non-negotiable: I can not spin up a single S3 bucket, EC2 instance, or Terraform-managed resource without one. I think of it as the foundation I pour before I can build anything on top.

---

#### Question 2 — What is AWS Free Tier, and how long does it last?

AWS Free Tier is Amazon's way of letting new users learn and prototype on real infrastructure without immediately paying for it. However, the rules changed significantly in July 2025, and a lot of engineers are still working off outdated assumptions. Most Free Tier benefits for new accounts last 12 months from signup. Also, some services offer "Always Free" limits that do not expire.
If you are setting up a new account today, budget your credits like you would budget a sprint — deliberately, not by accident.

---

#### Question 3 — Name three AWS Free Tier services and their free usage limits.

1. Amazon S3: 5 GB standard storage, 20,000 GET requests, 2,000 PUT requests per month. This is very good for static assets or small datasets, but it request costs creep up fast if you are running frequent deploys or CI/CD pipelines against it.

2. AWS Lambda: 1 million requests per month, and this is part of the "Always Free" tier. It does not expire after 6 or 12 months like the others. This makes it a solid long-term building block for lightweight backend logic.

3. Amazon EC2: 750 hours/month on a t2.micro or t3.micro. This is enough to run one instance 24/7 but only guaranteed if your account predates July 2025. Newer accounts just burn through their general credit pool instead, so track usage closely or you will get a surprise bill the moment your instance ticks past what is covered.

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

![Week 02 Screenshorts](screenshots/Week-03-assignment-01-screenshot-01.png)

---

# Submission Instructions

- Add all required screenshots in your GitHub repository submission
- Full name must be visible in required screenshots
- Do not expose sensitive information (keys, passwords, account IDs)

---

# Completion Checklist

- [✅] Task 1 answers written in own words
- [✅] AWS Free Tier account created successfully
- [✅] Signed in to AWS Management Console
- [✅] Screenshot of AWS Account page captured (full name visible, no sensitive data)
- [✅] All required screenshots added to repository

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