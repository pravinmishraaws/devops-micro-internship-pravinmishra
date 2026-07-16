# Assignment 6 — Build an AI-Assisted Linux Health Check (AI-Assisted Linux Incident Triage)

Part of the DevOps Micro Internship (DMI) Cohort 3 with Agentic AI

---

## Purpose

In this assignment, you will build a read-only Bash triage script that checks the health of your Ubuntu server and Nginx application, connect it to Claude Code as a reusable `/linux-triage` skill, simulate a controlled Nginx incident, use the skill to gather and analyze evidence, recover the service manually, and verify recovery. The workflow follows the Agentic Loop: Gather → Analyze → Human Act → Verify.

---

# Task 1 — Confirm the Healthy Baseline and Create the Workspace

## Goal

Confirm that Nginx and the React application are healthy before building the automation.

### Evidence

#### Screenshot 1 — Output of `systemctl is-active nginx`, `ss -ltn | grep ':80'`, and `curl -I http://localhost`

![alt text](image-72.png)

---

#### Screenshot 2 — Output of `pwd` and `find . -maxdepth 4 -type d | sort` showing the workspace folder structure

![alt text](image-73.png)

---

### Notes

Answer the following in your own words:

**1. What proves that Nginx is running?**

The command " systemctl is-active nginx " returns active and running and also the site is active on broswer

---

**2. What proves that the server is listening for HTTP traffic?**

The command "ss -ltn | grep ':80'" returns port 80. This indicates nginx is listening to traffic on port 80 which is http

---

**3. Why must you capture a healthy baseline before simulating an incident?**

A healthy baseline shows how the system works normally. This makes it easier to spot what changed during the incident and helps fix the problem more quickly.

---

# Task 2 — Create Project Context and Safety Rules in CLAUDE.md

## Goal

Tell Claude exactly what this project does and what it is not allowed to do.

### Evidence

#### Screenshot 3 — CLAUDE.md open in VS Code showing all four sections (Project Overview, Incident Workflow, Safety Rules, Output Rules)

![alt text](image-81.png)

---

### Notes

Answer the following in your own words:

**1. Why should Claude receive project-specific operational rules?**

So it follows the right procedures for that project and gives consistent help.

---

**2. Why is the human required to execute the recovery command?**

To keep the system safe and make sure a person approves the changes. So, human can be in control.

---

**3. Which rule prevents Claude from making an unsupported diagnosis?**

The rule that says Claude must only use evidence before drawing conclusions.

---

# Task 3 — Use Agentic AI to Plan Before Writing the Script

## Goal

Use Claude Code to inspect the environment and produce a read-only plan before creating any Bash code.

### Evidence

#### Screenshot 4 — Claude Code showing the five-check plan and read-only inspection results

![alt text](image-82.png)

![alt text](image-83.png)

---

### Notes

Answer the following in your own words:

**1. Which part of this task represents the Gather phase?**

The Gather phase is where Claude inspected the server using read-only commands to collect system information.

---

**2. Did Claude follow the instruction not to create files? How did you verify this?**

Yes. Claude only ran read-only commands and confirmed that no files were created or edited.

---

**3. Why is planning before coding useful in DevOps automation?**

It helps identify the problem first and reduces the chance of making unnecessary or risky changes.

---

# Task 4 — Build the Linux Triage Bash Script

## Goal

Create one Bash script that gathers consistent Linux and Nginx health evidence.

### Evidence

#### Screenshot 5 — Top section of `linux-triage.sh` showing variables, thresholds, and the checks array

![alt text](image-74.png)

---

#### Screenshot 6 — Middle section showing check functions and conditionals

![alt text](image-75.png)

---

#### Screenshot 7 — Bottom section showing the loop, summary function, and exit behavior

![alt text](image-77.png)

---

#### Screenshot 8 — Output of `bash -n scripts/linux-triage.sh` (no syntax errors) and `ls -l scripts/linux-triage.sh` showing executable permission

![alt text](image-76.png)

---

### Notes

Answer the following in your own words:

**1. What is stored in the checks array?**

The checks array stores the names of the health check functions that the script will run.

---

**2. How does the `for` loop use that array?**

The for loop goes through each function in the array and runs it one by one.

---

**3. Why are the health checks separated into functions?**

It keeps the script organized, easier to read, and makes it simple to update or add new checks.

---

**4. What is the purpose of `$(...)` in this script?**

$(...) runs a command and stores its output in a variable.

---

**5. Why does the script use different exit codes for HEALTHY, WARN, and FAIL?**

Different exit codes make it easy to tell whether the system is healthy, has a warning, or has a failure.

---

# Task 5 — Run and Understand the Healthy-State Report

## Goal

Run the Bash script against the healthy server and verify that it creates a report.

### Evidence

#### Screenshot 9 — Output of `./scripts/linux-triage.sh` showing your Full Name and all five check results

![alt text](image-79.png)

---

#### Screenshot 10 — Output showing the captured exit code and final summary

![alt text](image-80.png)

---

### Notes

Answer the following in your own words:

**1. What is the overall status of your healthy baseline?**

The overall status is HEALTHY.

---

**2. Which exact Linux evidence proves the application is serving traffic?**

The HTTP check returned status code 200, showing the application is serving traffic.

---

**3. Did your script return exit code 0 or 1? Explain why.**

It returned exit code 0 because all the checks passed successfully.

---

**4. What is the difference between a warning and a failure in this script?**

A warning means something needs attention, while a failure means there is a problem that needs fixing.

---

# Task 6 — Create and Run the /linux-triage Skill

## Goal

Turn the Bash script into a reusable, manually invoked Agentic AI workflow.

### Evidence

#### Screenshot 11 — `SKILL.md` showing the frontmatter, allowed tool restrictions, and safety rules

![alt text](image-85.png)

---

#### Screenshot 12 — `/linux-triage` output for the healthy server

![alt text](image-84.png)

---

### Notes

Answer the following in your own words:

**1. Why does this skill have Bash, Read, and Grep, but not Write?**

Because it only needs to inspect the system, not make any changes.

---

**2. Why is `disable-model-invocation: true` useful for this skill?**

It keeps the skill focused and stops it from doing extra tasks.

---

**3. What part is performed by Bash, and what part is performed by Claude?**

Bash collects the system information, and Claude explains the results.

---

**4. Why is this better than asking Claude "Is my server healthy?" without giving it evidence?**

Because the answer is based on real system data, not a guess.

---

# Task 7 — Simulate an Nginx Incident and Let the Skill Diagnose It

## Goal

Create a controlled service failure, gather evidence through Bash, and let Claude analyze the evidence without taking recovery action.

### Evidence

#### Screenshot 13 — Output showing Nginx is inactive and the HTTP request fails

![alt text](image-86.png)

---

#### Screenshot 14 — `/linux-triage` output showing failed evidence, most likely cause, and a suggested recovery command

![alt text](image-87.png)

---

#### Screenshot 15 — `incident-failure-report.txt` showing the failed checks and your Full Name

![alt text](image-88.png)

---

### Notes

Answer the following in your own words:

**1. Which three checks failed?**

The Nginx service, Port 80, and the HTTP check failed.

---

**2. What evidence supports the conclusion that Nginx is unavailable?**

The service is not active, Port 80 is not listening, and the HTTP check returned status 000.

---

**3. Did Claude execute the recovery command? Why is that important?**

No. It left the recovery step for me, so no changes were made without my approval.

---

**4. Which phase of the Agentic Loop is represented by the Bash report?**

The Gather phase.

---

**5. Which phase is represented by Claude's explanation?**

The Analyze phase, because Claude explains what the results mean.

---

# Task 8 — Recover Manually, Verify Again, and Write the Incident Summary

## Goal

Recover the service as the human operator and prove that the system is healthy again.

### Evidence

#### Screenshot 16 — Output showing Nginx is active and `curl -I http://localhost` returns 200 OK

![alt text](image-89.png)

---

#### Screenshot 17 — Second `/linux-triage` output showing successful recovery with no FAIL results

![alt text](image-90.png)

---

#### Screenshot 18 — Output of `ls -lah reports` showing both `incident-failure-report.txt` and `recovery-report.txt`

![alt text](image-91.png)

---

#### Screenshot 19 — `incident-summary.md` showing all required sections and your Full Name

![alt text](image-92.png)

---

### Notes

Answer the following in your own words:

**1. What action did you execute manually?**

I manually started the Nginx service.

---

**2. What evidence proves that the service recovered?**

The second report shows all five checks passed and the HTTP status returned 200.

---

**3. Why is the second triage run necessary?**

It confirms that the issue has been fixed.

---

**4. What could go wrong if an AI agent automatically restarted every failed service?**

It could cause more problems or restart the wrong service.

---

**5. In one sentence, explain the difference between using AI as a chatbot and using AI in this agentic workflow.**

A chatbot answers questions, while an agent follows a structured process using real system data.

---

# Incident Summary

Fill in all seven sections below in your own words.

**Full Name:** Ibitoye Oloni

**Date:** 16/07/2026

---

**1. Reported Symptom**

Nginx stopped running, and the website was not responding

---

**2. Evidence Collected**

The service was inactive, Port 80 was not listening, and the HTTP check returned status 000.

---

**3. Most Likely Cause**

The Nginx service had been stopped.

---

**4. Human-Approved Recovery Action**

I manually started the Nginx service.

---

**5. Verification**

I ran the triage again, and all five checks passed with HTTP status 200.

---

**6. Safety Decision**

No changes were made until I approved and ran the recovery command.

---

**7. Agentic Loop Mapping**

Gather: collected evidence. Analyze: reviewed the results. Act: manually started Nginx. Verify: ran the checks again to confirm it was fixed.

---

# LinkedIn Post (Required)

## Evidence

#### LinkedIn Post URL

Paste your LinkedIn post URL here:

https://www.linkedin.com/posts/ibitoye-oloni_devops-aws-linux-share-7483576101680783360-2p22/?utm_source=share&utm_medium=member_desktop&rcm=ACoAAABp_1YBcUgsxYJIdRCX9CFvm17K_adeV6E

---

#### Screenshot — Published LinkedIn post

![alt text](image-93.png)

---

# GitHub Repository URL

Paste the URL of your GitHub folder or repository containing the assignment files here:

https://github.com/excelchips/devops-micro-internship-pravinmishra/tree/main/week-03-linux-for-devops

---

# Submission Instructions

- Add all required screenshots in your submission
- Full Name must be visible in required screenshots and the Bash report
- All written answers must be in your own words
- Do not expose sensitive information (keys, passwords, AWS account IDs, tokens)
- GitHub URL must be included in this document

---

# Completion Checklist

- [ ] Task 1: Healthy baseline confirmed, workspace created (Screenshots 1–2, Notes answered)
- [ ] Task 2: CLAUDE.md created with all four sections (Screenshot 3, Notes answered)
- [ ] Task 3: Five-check plan produced by Claude using read-only tools (Screenshot 4, Notes answered)
- [ ] Task 4: `linux-triage.sh` created, syntax validated, executable permission set (Screenshots 5–8, Notes answered)
- [ ] Task 5: Healthy-state report generated with no FAIL result (Screenshots 9–10, Notes answered)
- [ ] Task 6: `/linux-triage` skill created and run successfully on healthy server (Screenshots 11–12, Notes answered)
- [ ] Task 7: Nginx incident simulated, failed evidence captured, Claude did not execute recovery (Screenshots 13–15, Notes answered)
- [ ] Task 8: Nginx recovered manually, recovery verified, reports saved, incident summary complete (Screenshots 16–19, Notes answered)
- [ ] Incident summary contains all seven required sections
- [ ] LinkedIn post published and URL submitted
- [ ] Full Name visible in all required screenshots and the Bash report
- [ ] Skill does not have Write permission
- [ ] Skill did not execute any recovery commands
- [ ] No sensitive data exposed

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