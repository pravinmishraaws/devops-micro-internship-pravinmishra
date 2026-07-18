# Assignment 5 — Bash Script Automation Drill (OPS Checklist)

Part of the DevOps Micro Internship (DMI) Cohort 3 with Agentic AI

---

## Purpose

In this assignment, you will practice Bash scripting by building a series of small automation scripts covering environment setup, variables, arrays, loops, file conditionals, if-else logic, and functions. These scripts form the foundation of real-world Linux automation used in DevOps, cloud, and production support environments.

---

# Task 1 — Bash Environment & Workspace Setup

## Goal

Verify that Bash is available on your system and create a clean workspace for this assignment.

### Evidence

#### Screenshot 1 — Output of `echo $SHELL` and `bash --version`

![Task 1 - Screenshot 1](./screenshots/assignment-05/task1/Screenshot%201.png)

---

#### Screenshot 2 — Output of `pwd` and `ls -lah` showing the scripts directory

![Task 1 - Screenshot 2](./screenshots/assignment-05/task1/Screenshot%202.png)

---

### Notes

Answer the following in your own words:

**1. What is Bash?**

Add your answer here.

---

**2. What is the difference between shell and Bash?**

Add your answer here.

---

**3. Why is it important to confirm the Bash version before writing scripts?**

Add your answer here.

---

# Task 2 — Your First Bash Script

## Goal

Create your first Bash script, make it executable, and run it from the terminal.

### Evidence

#### Screenshot 1 — Content of `first-script.sh`

![Task 2 - Screenshot 1](./screenshots/assignment-05/task2/Screenshot%201.png)

---

#### Screenshot 2 — Output of `./first-script.sh`

![Task 2 - Screenshot 2](./screenshots/assignment-05/task2/Screenshot%202.png)

---

#### Screenshot 3 — Output of `ls -l first-script.sh` showing executable permission

![Task 2 - Screenshot 3](./screenshots/assignment-05/task2/Screenshot%203.png)

---

### Notes

Answer the following in your own words:

**1. What is the purpose of `#!/bin/bash`?**

Add your answer here.

---

**2. Why do we use `chmod +x` before running a script?**

Add your answer here.

---

**3. What is the difference between running a script using `./script.sh` and `bash script.sh`?**

Add your answer here.

---

# Task 3 — Variables: User Information Script

## Goal

Use variables to store and display user-related information.

### Evidence

#### Screenshot 1 — Content of `user-info.sh`

![Task 3 - Screenshot 1](./screenshots/assignment-05/task3/Screenshot%201.png)

---

#### Screenshot 2 — Output of `./user-info.sh`

![Task 3 - Screenshot 2](./screenshots/assignment-05/task3/Screenshot%202.png)

---

### Notes

Answer the following in your own words:

**1. What is a variable in Bash?**

Add your answer here.

---

**2. Why should we avoid spaces around the `=` sign when creating variables?**

Add your answer here.

---

**3. How do you access the value stored inside a Bash variable?**

Add your answer here.

---

# Task 4 — Arrays & Loops: Tools Checklist Script

## Goal

Use arrays and loops to print a checklist of tools used in Bash scripting.

### Evidence

#### Screenshot 1 — Content of `tools-checklist.sh`

![Task 4 - Screenshot 1](./screenshots/assignment-05/task4/Screenshot%201.png)

---

#### Screenshot 2 — Output of `./tools-checklist.sh`

![Task 4 - Screenshot 2](./screenshots/assignment-05/task4/Screenshot%202.png)

---

### Notes

Answer the following in your own words:

**1. What is an array in Bash?**

Add your answer here.

---

**2. Why are arrays useful in scripts?**

Add your answer here.

---

**3. What does `"${tools[@]}"` mean?**

Add your answer here.

---

**4. What is the purpose of the `for` loop in this script?**

Add your answer here.

---

# Task 5 — Loops: Number Counter Script

## Goal

Use loops to repeat a task multiple times.

### Evidence

#### Screenshot 1 — Content of `counter.sh`

![Task 5 - Screenshot 1](./screenshots/assignment-05/task5/Screenshot%201.png)

---

#### Screenshot 2 — Output of `./counter.sh`

![Task 5 - Screenshot 2](./screenshots/assignment-05/task5/Screenshot%202.png)

---

### Notes

Answer the following in your own words:

**1. What is a loop?**

Add your answer here.

---

**2. Why do we use loops in Bash scripting?**

Add your answer here.

---

**3. How many times did the loop run in your script?**

Add your answer here.

---

**4. What would you change if you wanted the loop to run 10 times?**

Add your answer here.

---

# Task 6 — Files & Conditionals: File Validation Script

## Goal

Use file checks and conditionals to verify whether files and directories exist.

### Evidence

#### Screenshot 1 — Output of `ls -lah ../test-folder`

![Task 6 - Screenshot 1](./screenshots/assignment-05/task6/Screenshot%201.png)

---

#### Screenshot 2 — Content of `file-check.sh`

![Task 6 - Screenshot 2](./screenshots/assignment-05/task6/Screenshot%202.png)

---

#### Screenshot 3 — Output of `./file-check.sh`

![Task 6 - Screenshot 3](./screenshots/assignment-05/task6/Screenshot%203.png)

---

### Notes

Answer the following in your own words:

**1. What does `-d` check in Bash?**

Add your answer here.

---

**2. What does `-f` check in Bash?**

Add your answer here.

---

**3. Why should file and directory paths be stored in variables?**

Add your answer here.

---

**4. What happens if the file does not exist?**

Add your answer here.

---

# Task 7 — Conditionals: Pass or Retry Script

## Goal

Use if-else conditionals to make decisions based on a variable value.

### Evidence

#### Screenshot 1 — Content of `score-check.sh` with `score=85`

![Task 7 - Screenshot 1](./screenshots/assignment-05/task7/Screenshot%201.png)

---

#### Screenshot 2 — Output showing `Result: Pass`

![Task 7 - Screenshot 2](./screenshots/assignment-05/task7/Screenshot%202.png)

---

#### Screenshot 3 — Content of `score-check.sh` with `score=55`

![Task 7 - Screenshot 3](./screenshots/assignment-05/task7/Screenshot%203.png)

---

#### Screenshot 4 — Output showing `Result: Retry`

![Task 7 - Screenshot 4](./screenshots/assignment-05/task6/Screenshot%204.png)

---

### Notes

Answer the following in your own words:

**1. What is the purpose of if-else in Bash?**

Add your answer here.

---

**2. What does `-ge` mean?**

Add your answer here.

---

**3. Why should conditions be tested with different values?**

Add your answer here.

---

**4. How can conditionals help in automation scripts?**

Add your answer here.

---

# Task 8 — Functions: Final Bash Automation Script

## Goal

Create a final Bash script using functions to organize reusable code.

### Evidence

#### Screenshot 1 — Content of `final-automation.sh`

![Task 8 - Screenshot 1](./screenshots/assignment-05/task8/Screenshot%201.png)

---

#### Screenshot 2 — Output of `./final-automation.sh`

![Task 8 - Screenshot 2](./screenshots/assignment-05/task8/Screenshot%202.png)

---

#### Screenshot 3 — Output of `ls -lah` showing all created scripts

![Task 8 - Screenshot 3](./screenshots/assignment-05/task8/Screenshot%203.png)

---

### Notes

Answer the following in your own words:

**1. What is a function in Bash?**

Add your answer here.

---

**2. Why are functions useful in scripts?**

Add your answer here.

---

**3. Which functions did you create in this script?**

Add your answer here.

---

**4. How does this final script combine variables, arrays, loops, conditionals, files, and functions?**

Add your answer here.

---

# LinkedIn Post (Required)

## Evidence

#### LinkedIn Post URL

Add your LinkedIn post URL here:

---

#### Screenshot — Published LinkedIn post

![LinkedIn Post](./screenshots/assignment-05/linkedin-post.png)

---

# Submission Instructions

- Add all required screenshots in your submission
- Full name must be visible in required screenshots
- All script files must be created and run successfully
- Required notes must be answered clearly for every task
- Do not expose sensitive information (keys, passwords, credentials)

---

# Completion Checklist

- [x] Task 1: Environment setup verified, workspace created (Screenshots 1–2, Notes answered)
- [x] Task 2: First script created, executed, permissions verified (Screenshots 1–3, Notes answered)
- [x] Task 3: Variables script created and run (Screenshots 1–2, Notes answered)
- [x] Task 4: Arrays and loops script created and run (Screenshots 1–2, Notes answered)
- [x] Task 5: Counter loop script created and run (Screenshots 1–2, Notes answered)
- [x] Task 6: File validation script created and run (Screenshots 1–3, Notes answered)
- [x] Task 7: Pass/Retry conditional script tested with both values (Screenshots 1–4, Notes answered)
- [x] Task 8: Final automation script created and run (Screenshots 1–3, Notes answered)
- [x] All scripts run without errors
- [x] Full Name visible in all required screenshots
- [ ] LinkedIn post published and URL submitted
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