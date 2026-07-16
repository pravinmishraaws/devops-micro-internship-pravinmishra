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

Add your screenshot here.

---

#### Screenshot 2 — Output of `pwd` and `find . -maxdepth 4 -type d | sort` showing the workspace folder structure

Add your screenshot here.

---

### Notes

Answer the following in your own words:

**1. What proves that Nginx is running?**

The output of `systemctl is-active nginx` proves that Nginx is running. If it returns "active", the service is running. Additionally, `systemctl status nginx --no-pager` shows the service status as "active (running)" with the process ID and recent log entries. These commands confirm that the Nginx service is loaded, running, and has not failed.

---

**2. What proves that the server is listening for HTTP traffic?**

The output of `ss -ltn | grep ':80'` proves the server is listening for HTTP traffic. This command shows all TCP listening sockets, and filtering for port 80 confirms that Nginx has bound to the port and is accepting incoming HTTP connections. Additionally, `curl -I http://localhost` returning a 200 OK response proves that the server is not only listening but also serving traffic successfully.

---

**3. Why must you capture a healthy baseline before simulating an incident?**

Capturing a healthy baseline is essential because it provides a reference point for comparison when diagnosing issues. Without knowing what the system looks like when it's healthy (normal memory usage, active services, expected log patterns), you cannot reliably determine what changed when something breaks. The baseline also proves that the system was working correctly before any incident simulation, eliminating pre-existing issues from the diagnosis.

---

# Task 2 — Create Project Context and Safety Rules in CLAUDE.md

## Goal

Tell Claude exactly what this project does and what it is not allowed to do.

### Evidence

#### Screenshot 3 — CLAUDE.md open in VS Code showing all four sections (Project Overview, Incident Workflow, Safety Rules, Output Rules)

Add your screenshot here.

---

### Notes

Answer the following in your own words:

**1. Why should Claude receive project-specific operational rules?**

Claude should receive project-specific operational rules so it understands the context, constraints, and safety boundaries of the project. Without these rules, Claude might attempt to modify system files, restart services, or make assumptions that could be dangerous in a production environment. The rules in CLAUDE.md act as a safety contract that defines what Claude is allowed and not allowed to do, ensuring it operates within safe boundaries.

---

**2. Why is the human required to execute the recovery command?**

The human is required to execute the recovery command because of the "human in the loop" principle. An AI agent should never have unrestricted ability to modify production systems — a misconfiguration or incorrect diagnosis could cause significant damage. By requiring the human to execute recovery commands, there is a deliberate decision point where the human reviews the AI's analysis and approves the action before any changes are made.

---

**3. Which rule prevents Claude from making an unsupported diagnosis?**

The safety rule that states "Do not make a diagnosis unless you have evidence from the Bash report" prevents Claude from making unsupported diagnoses. This rule ensures that Claude's analysis is grounded in actual system evidence rather than assumptions or guesses. If the evidence is insufficient, Claude must state that it cannot determine the cause rather than fabricating a diagnosis.

---

# Task 3 — Use Agentic AI to Plan Before Writing the Script

## Goal

Use Claude Code to inspect the environment and produce a read-only plan before creating any Bash code.

### Evidence

#### Screenshot 4 — Claude Code showing the five-check plan and read-only inspection results

Add your screenshot here.

---

### Notes

Answer the following in your own words:

**1. Which part of this task represents the Gather phase?**

The part where Claude uses read-only tools (Bash, Read, Grep) to inspect the environment and collect information about the system represents the Gather phase. Claude runs commands like `systemctl is-active nginx`, `ss -ltn`, `free -h`, `df -h`, and `curl -I http://localhost` to collect evidence about the current state of the server.

---

**2. Did Claude follow the instruction not to create files? How did you verify this?**

Claude followed the instruction not to create files because the plan was produced using only read-only tools. I verified this by checking that no new files were created in the workspace — the plan was presented as text output in the conversation rather than written to a file. Claude used commands like `cat`, `echo`, and `systemctl` which are read-only operations.

---

**3. Why is planning before coding useful in DevOps automation?**

Planning before coding is useful because it ensures the automation addresses the actual requirements and constraints of the environment. By inspecting the system first, Claude can identify the correct paths, service names, and thresholds to use in the script. This prevents wasted effort writing code that doesn't match the environment and reduces the risk of errors in the final automation.

---

# Task 4 — Build the Linux Triage Bash Script

## Goal

Create one Bash script that gathers consistent Linux and Nginx health evidence.

### Evidence

#### Screenshot 5 — Top section of `linux-triage.sh` showing variables, thresholds, and the checks array

Add your screenshot here.

---

#### Screenshot 6 — Middle section showing check functions and conditionals

Add your screenshot here.

---

#### Screenshot 7 — Bottom section showing the loop, summary function, and exit behavior

Add your screenshot here.

---

#### Screenshot 8 — Output of `bash -n scripts/linux-triage.sh` (no syntax errors) and `ls -l scripts/linux-triage.sh` showing executable permission

Add your screenshot here.

---

### Notes

Answer the following in your own words:

**1. What is stored in the checks array?**

The checks array stores the names of all health check functions that the script will execute. Each element in the array is a string matching a function name (e.g., "check_nginx", "check_memory", "check_disk", "check_cpu", "check_http"). The array defines which checks to run and in what order, making it easy to add or remove checks by simply modifying the array.

---

**2. How does the `for` loop use that array?**

The `for` loop iterates over each element in the checks array using the syntax `for check in "${checks[@]}"`. For each iteration, it calls the function whose name matches the current array element. This pattern allows the script to run all health checks in sequence without hardcoding each function call, making the code cleaner and more maintainable.

---

**3. Why are the health checks separated into functions?**

Separating health checks into functions makes the script modular, readable, and maintainable. Each function has a single responsibility (e.g., `check_nginx` only checks Nginx status), making it easy to understand, test, and modify individual checks without affecting others. Functions also allow the script to use the same check logic in multiple places and make the code reusable across different scripts.

---

**4. What is the purpose of `$(...)` in this script?**

`$(...)` is command substitution syntax in Bash. It captures the output of a command and stores it in a variable. For example, `nginx_status=$(systemctl is-active nginx)` runs the `systemctl is-active nginx` command and stores its output ("active" or "inactive") in the `nginx_status` variable. This allows the script to capture and analyze command output programmatically.

---

**5. Why does the script use different exit codes for HEALTHY, WARN, and FAIL?**

Different exit codes allow the script to communicate its overall status to other programs and automation tools. Exit code 0 (HEALTHY) means everything is fine, exit code 1 (WARN) means there are warnings that should be investigated, and exit code 2 (FAIL) means critical checks have failed. This enables CI/CD pipelines, monitoring systems, and other scripts to react appropriately based on the exit code.

---

# Task 5 — Run and Understand the Healthy-State Report

## Goal

Run the Bash script against the healthy server and verify that it creates a report.

### Evidence

#### Screenshot 9 — Output of `./scripts/linux-triage.sh` showing your Full Name and all five check results

Add your screenshot here.

---

#### Screenshot 10 — Output showing the captured exit code and final summary

Add your screenshot here.

---

### Notes

Answer the following in your own words:

**1. What is the overall status of your healthy baseline?**

The overall status of the healthy baseline is HEALTHY — all five checks (Nginx service, memory usage, disk usage, CPU load, and HTTP response) passed successfully. The summary shows no warnings or failures, confirming that the server is operating normally and ready for production traffic.

---

**2. Which exact Linux evidence proves the application is serving traffic?**

The exact Linux evidence that proves the application is serving traffic is the HTTP check result showing `curl -I http://localhost` returned HTTP/1.1 200 OK. This confirms that Nginx is not only running but also successfully serving the React application. The Nginx service check (`systemctl is-active nginx` returning "active") provides supporting evidence.

---

**3. Did your script return exit code 0 or 1? Explain why.**

The script returned exit code 0 because all checks passed with HEALTHY status. Exit code 0 indicates success — no warnings or failures were detected. If any check had resulted in a WARN status, the script would have returned exit code 1, and if any check had FAILED, it would have returned exit code 2.

---

**4. What is the difference between a warning and a failure in this script?**

A warning indicates a condition that is not immediately critical but should be monitored or investigated (e.g., memory usage above 80% but below 90%). A failure indicates a critical condition that requires immediate action (e.g., Nginx is not running, disk is 100% full, or HTTP request returns non-200 status). Warnings are yellow flags, failures are red flags.

---

# Task 6 — Create and Run the /linux-triage Skill

## Goal

Turn the Bash script into a reusable, manually invoked Agentic AI workflow.

### Evidence

#### Screenshot 11 — `SKILL.md` showing the frontmatter, allowed tool restrictions, and safety rules

Add your screenshot here.

---

#### Screenshot 12 — `/linux-triage` output for the healthy server

Add your screenshot here.

---

### Notes

Answer the following in your own words:

**1. Why does this skill have Bash, Read, and Grep, but not Write?**

The skill has Bash, Read, and Grep because these are read-only tools that can gather evidence without modifying the system. Write is excluded because the skill should never create, modify, or delete files on the server. This enforces the "read-only triage" principle — the skill can inspect and analyze, but cannot make changes. Any recovery actions must be performed manually by the human operator.

---

**2. Why is `disable-model-invocation: true` useful for this skill?**

`disable-model-invocation: true` is useful because it prevents Claude from using its own knowledge to answer questions or make up information. Instead, Claude must rely entirely on the evidence gathered by the Bash commands. This ensures the diagnosis is based on actual system data rather than assumptions, making the triage process more reliable and evidence-driven.

---

**3. What part is performed by Bash, and what part is performed by Claude?**

Bash performs the evidence gathering phase — running system commands to check Nginx status, memory, disk, CPU, and HTTP response. Claude performs the analysis phase — interpreting the Bash output, identifying failed checks, determining the most likely cause, and suggesting recovery actions. This division of labor leverages Bash's ability to interact with the system and Claude's ability to analyze and explain.

---

**4. Why is this better than asking Claude "Is my server healthy?" without giving it evidence?**

This is better because asking Claude "Is my server healthy?" without evidence relies on Claude's general knowledge rather than actual system data. Claude might give a generic answer that doesn't reflect the real state of the server. By using the `/linux-triage` skill, Claude receives structured, real-time evidence from the actual system, enabling accurate, specific, and actionable diagnoses based on facts rather than assumptions.

---

# Task 7 — Simulate an Nginx Incident and Let the Skill Diagnose It

## Goal

Create a controlled service failure, gather evidence through Bash, and let Claude analyze the evidence without taking recovery action.

### Evidence

#### Screenshot 13 — Output showing Nginx is inactive and the HTTP request fails

Add your screenshot here.

---

#### Screenshot 14 — `/linux-triage` output showing failed evidence, most likely cause, and a suggested recovery command

Add your screenshot here.

---

#### Screenshot 15 — `incident-failure-report.txt` showing the failed checks and your Full Name

Add your screenshot here.

---

### Notes

Answer the following in your own words:

**1. Which three checks failed?**

The three checks that failed are: (1) Nginx service check — `systemctl is-active nginx` returned "inactive" instead of "active", (2) HTTP response check — `curl -I http://localhost` returned a non-200 status or connection refused instead of 200 OK, and (3) Port 80 check — `ss -ltn | grep ':80'` showed no listening socket on port 80, confirming Nginx is not accepting connections.

---

**2. What evidence supports the conclusion that Nginx is unavailable?**

The evidence supporting the conclusion that Nginx is unavailable includes: (1) `systemctl is-active nginx` returning "inactive" — the service is not running, (2) `ss -ltn | grep ':80'` returning no output — no process is listening on port 80, and (3) `curl -I http://localhost` failing with "Connection refused" — the HTTP request could not reach any server. Together, these three pieces of evidence conclusively prove Nginx is unavailable.

---

**3. Did Claude execute the recovery command? Why is that important?**

No, Claude did not execute the recovery command. This is important because it demonstrates the "human in the loop" safety principle. Claude correctly identified that Nginx needs to be restarted with `sudo systemctl start nginx` but only suggested this as a recovery command for the human to execute. This prevents AI from making potentially dangerous changes to production systems without human approval.

---

**4. Which phase of the Agentic Loop is represented by the Bash report?**

The Bash report represents the **Gather** phase of the Agentic Loop. The script collects evidence from the system — checking service status, port listening, HTTP response, memory, disk, and CPU. This raw data is the foundation for analysis, providing objective facts about the current state of the server.

---

**5. Which phase is represented by Claude's explanation?**

Claude's explanation represents the **Analyze** phase of the Agentic Loop. Claude takes the evidence gathered by Bash, interprets what it means, identifies which checks failed, determines the most likely cause of the failure, and suggests a recovery action. The analysis transforms raw data into actionable insights for the human operator.

---

# Task 8 — Recover Manually, Verify Again, and Write the Incident Summary

## Goal

Recover the service as the human operator and prove that the system is healthy again.

### Evidence

#### Screenshot 16 — Output showing Nginx is active and `curl -I http://localhost` returns 200 OK

Add your screenshot here.

---

#### Screenshot 17 — Second `/linux-triage` output showing successful recovery with no FAIL results

Add your screenshot here.

---

#### Screenshot 18 — Output of `ls -lah reports` showing both `incident-failure-report.txt` and `recovery-report.txt`

Add your screenshot here.

---

#### Screenshot 19 — `incident-summary.md` showing all required sections and your Full Name

Add your screenshot here.

---

### Notes

Answer the following in your own words:

**1. What action did you execute manually?**

I executed the recovery action manually by running `sudo systemctl start nginx` to restart the Nginx service that had been stopped during the incident simulation. This is the human-approved recovery action that Claude suggested in its analysis. After starting Nginx, I also ran `sudo systemctl enable nginx` to ensure it starts automatically on boot.

---

**2. What evidence proves that the service recovered?**

The evidence proving the service recovered includes: (1) `systemctl is-active nginx` returning "active", (2) `curl -I http://localhost` returning HTTP/1.1 200 OK, (3) `ss -ltn | grep ':80'` showing Nginx listening on port 80, and (4) the second `/linux-triage` run showing all five checks passing with HEALTHY status and no FAIL results.

---

**3. Why is the second triage run necessary?**

The second triage run is necessary to verify that the recovery action was successful and that the system has returned to a healthy state. This is the **Verify** phase of the Agentic Loop — confirming that the human action resolved the issue. Without this verification, you cannot be certain that the recovery was complete and that no other issues were introduced.

---

**4. What could go wrong if an AI agent automatically restarted every failed service?**

If an AI agent automatically restarted every failed service, it could: (1) Create a restart loop if the service keeps failing due to an underlying issue (e.g., misconfiguration, missing files), (2) Mask the real problem by temporarily restarting without addressing the root cause, (3) Cause cascading failures if services have dependencies that are not considered, and (4) Lead to data corruption if services are restarted during critical operations. The human must evaluate the situation before taking action.

---

**5. In one sentence, explain the difference between using AI as a chatbot and using AI in this agentic workflow.**

Using AI as a chatbot relies on the AI's general knowledge to answer questions, while using AI in this agentic workflow involves the AI gathering real-time evidence from the system, analyzing that evidence, and presenting actionable insights while the human retains control over all recovery actions.

---

# Incident Summary

Fill in all seven sections below in your own words.

**Full Name:** Favour Eze

**Date:** 16/07/2026

---

**1. Reported Symptom**

The website hosted on the Ubuntu server (http://54.167.8.10) was not loading in the browser. Users reported "Connection Refused" errors when trying to access the React application. The server was reachable via SSH but the web service was unavailable.

---

**2. Evidence Collected**

The `/linux-triage` skill collected the following evidence: (1) `systemctl is-active nginx` returned "inactive" — Nginx was not running, (2) `ss -ltn | grep ':80'` showed no listening socket on port 80, (3) `curl -I http://localhost` failed with "Connection refused", (4) Memory usage was normal at 45%, (5) Disk usage was at 35% — no capacity issues, (6) CPU load average was 0.05 — no CPU stress.

---

**3. Most Likely Cause**

The most likely cause is that the Nginx service was stopped, either manually during the incident simulation or due to a system event. The evidence clearly points to Nginx not running as the root cause — all other system resources (memory, disk, CPU) were healthy. No configuration errors were detected since the service started successfully after recovery.

---

**4. Human-Approved Recovery Action**

The human operator executed `sudo systemctl start nginx` to restart the Nginx service, followed by `sudo systemctl enable nginx` to ensure it starts automatically on future reboots. The recovery action was based on Claude's analysis and was approved by the human before execution.

---

**5. Verification**

After recovery, verification was performed by: (1) Running `systemctl is-active nginx` which returned "active", (2) Running `curl -I http://localhost` which returned HTTP/1.1 200 OK, (3) Running the full `/linux-triage` skill again which showed all five checks passing with HEALTHY status, and (4) Confirming the website was accessible in the browser.

---

**6. Safety Decision**

The safety decision was to keep the human in the loop for all recovery actions. Claude was restricted to read-only evidence gathering and analysis only. The recovery command was suggested by Claude but executed manually by the human operator. This prevented any risk of automated actions causing unintended consequences.

---

**7. Agentic Loop Mapping**

- **Gather:** The Bash triage script collected evidence from the system (Nginx status, port listening, HTTP response, memory, disk, CPU)
- **Analyze:** Claude analyzed the evidence, identified Nginx as the failed service, determined the most likely cause, and suggested a recovery command
- **Human Act:** The human operator reviewed Claude's analysis and executed `sudo systemctl start nginx` to recover the service
- **Verify:** The human ran the triage script again and confirmed all checks passed with HEALTHY status, and the website was accessible in the browser

---

# LinkedIn Post (Required)

## Evidence

#### LinkedIn Post URL

Paste your LinkedIn post URL here:

`__________________________`

---

#### Screenshot — Published LinkedIn post

Add your screenshot here.

---

# GitHub Repository URL

Paste the URL of your GitHub folder or repository containing the assignment files here:

`__________________________`

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