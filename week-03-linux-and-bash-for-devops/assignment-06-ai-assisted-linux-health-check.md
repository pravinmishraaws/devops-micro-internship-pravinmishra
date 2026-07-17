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

![health-status-1](/week-03-linux-and-bash-for-devops/screenshots/health-status-1.png)

---

#### Screenshot 2 — Output of `pwd` and `find . -maxdepth 4 -type d | sort` showing the workspace folder structure

![pwd-output](/week-03-linux-and-bash-for-devops/screenshots/pwd-output.png)

---

### Notes

Answer the following in your own words:

**1. What proves that Nginx is running?**

Testing the web server locally using **curl http://localhost** can prove that Nginx is running. Also you can use the server IP-address on a browser to confirm if it is running, typically you shouls see a **Welcome to Nginx** message on your screen. Any of these commands can show if Nginx is running **'sudo netstat -tlnp | grep :80', 'ps aux | grep nginx', 'sudo systemctl status nginx'**

---

**2. What proves that the server is listening for HTTP traffic?**

A server is listening for HTTP traffic when it is accepting connections on port 80, the default port for HTTP.

---

**3. Why must you capture a healthy baseline before simulating an incident?**

Capturing a healthy baseline before simulating an incident gives you a known good reference point for how the system behaves when everything is working correctly. This makes it much easier to identify what changed during the simulation and to verify that the system has recovered afterward.

---

# Task 2 — Create Project Context and Safety Rules in CLAUDE.md

## Goal

Tell Claude exactly what this project does and what it is not allowed to do.

### Evidence

#### Screenshot 3 — CLAUDE.md open in VS Code showing all four sections (Project Overview, Incident Workflow, Safety Rules, Output Rules)

![vscode-claude](/week-03-linux-and-bash-for-devops/screenshots/claudeMD-vscode.png)


![claude-md](/week-03-linux-and-bash-for-devops/screenshots/claude-md-content.png)

---

### Notes

Answer the following in your own words:

**1. Why should Claude receive project-specific operational rules?**

Claude should receive project-specific operational rules so it can provide guidance and generate outputs that are consistent with your project's standards, requirements, and workflows.

---

**2. Why is the human required to execute the recovery command?**

The human is required to execute the recovery command because recovery actions can directly affect live systems, services, and data. Keeping a human "in the loop" provides oversight and helps ensure the correct action is taken.

---

**3. Which rule prevents Claude from making an unsupported diagnosis?**

Safety Rules prevents claude from making unsupported diagnosis.

---

# Task 3 — Use Agentic AI to Plan Before Writing the Script

## Goal

Use Claude Code to inspect the environment and produce a read-only plan before creating any Bash code.

### Evidence

#### Screenshot 4 — Claude Code showing the five-check plan and read-only inspection results

![claude-report-1](/week-03-linux-and-bash-for-devops/screenshots/claude-report-1.png)
![claude-report-2](/week-03-linux-and-bash-for-devops/screenshots/claude-report-2.png)

---

### Notes

Answer the following in your own words:

**1. Which part of this task represents the Gather phase?**

Add your answer here.

---

**2. Did Claude follow the instruction not to create files? How did you verify this?**

Add your answer here.

---

**3. Why is planning before coding useful in DevOps automation?**

Add your answer here.

---

# Task 4 — Build the Linux Triage Bash Script

## Goal

Create one Bash script that gathers consistent Linux and Nginx health evidence.

### Evidence

#### Screenshot 5 — Top section of `linux-triage.sh` showing variables, thresholds, and the checks array

![triage-1](/week-03-linux-and-bash-for-devops/screenshots/triage-1.png)
![triage-2](/week-03-linux-and-bash-for-devops/screenshots/triage-2.png)
![triage-3](/week-03-linux-and-bash-for-devops/screenshots/triage-3.png)

---

#### Screenshot 6 — Middle section showing check functions and conditionals

![check-function-conditionals](/week-03-linux-and-bash-for-devops/screenshots/check-functions.png)

---

#### Screenshot 7 — Bottom section showing the loop, summary function, and exit behavior

![loop-summary](/week-03-linux-and-bash-for-devops/screenshots/loop-summary.png)

---

#### Screenshot 8 — Output of `bash -n scripts/linux-triage.sh` (no syntax errors) and `ls -l scripts/linux-triage.sh` showing executable permission

![no-error-exec-permission](/week-03-linux-and-bash-for-devops/screenshots/no-error-display.png)

---

### Notes

Answer the following in your own words:

**1. What is stored in the checks array?**

The checks array stores the names of the health check functions that the script should execute.

---

**2. How does the `for` loop use that array?**

The for loop goes through each function name in the checks array and executes it.

---

**3. Why are the health checks separated into functions?**

Separating the health checks into functions makes the script modular, organized, and easier to maintain.

---

**4. What is the purpose of `$(...)` in this script?**

$(...) is a command substitution. It runs a command and replaces the expression with the command's output.

---

**5. Why does the script use different exit codes for HEALTHY, WARN, and FAIL?**

The script uses different exit codes so that other programs, automation tools, or monitoring systems can determine the overall health of the system.

---

# Task 5 — Run and Understand the Healthy-State Report

## Goal

Run the Bash script against the healthy server and verify that it creates a report.

### Evidence

#### Screenshot 9 — Output of `./scripts/linux-triage.sh` showing your Full Name and all five check results

![report-on-triage](/week-03-linux-and-bash-for-devops/screenshots/report-triage.png)

---

#### Screenshot 10 — Output showing the captured exit code and final summary

![exit-code-summary](/week-03-linux-and-bash-for-devops/screenshots/exit-code-summary.png)

---

### Notes

Answer the following in your own words:

**1. What is the overall status of your healthy baseline?**

The overall status of the healthy baseline is HEALTHY. As indicated by the report summary
Overall Status: HEALTHY
PASS: 5
WARN: 0
FAIL: 0
---

**2. Which exact Linux evidence proves the application is serving traffic?**

The strongest evidence is [PASS] Local HTTP check returned status 200. An HTTP 200 (OK) response means the web server successfully received and processed the request, indicating that the application is serving HTTP traffic. Additional supporting evidence is **'PASS' Nginx service is active.**

---

**3. Did your script return exit code 0 or 1? Explain why.**

The script returned exit code 0. because every health check passed,there were 0 warnings, there were 0 failures, the overall system status was HEALTHY.

---

**4. What is the difference between a warning and a failure in this script?**

A warning indicates a condition that should be monitored but is not yet critical, while a failure indicates a critical problem that requires attention. 
A warning results in an overall WARN status (exit code 1) if there are no failures, while any failure results in an overall FAIL status (exit code 2), indicating that immediate attention is needed.

---

# Task 6 — Create and Run the /linux-triage Skill

## Goal

Turn the Bash script into a reusable, manually invoked Agentic AI workflow.

### Evidence

#### Screenshot 11 — `SKILL.md` showing the frontmatter, allowed tool restrictions, and safety rules

![skillsMD](/week-03-linux-and-bash-for-devops/screenshots/skillsMD.png)

---

#### Screenshot 12 — `/linux-triage` output for the healthy server

![Report-1](/week-03-linux-and-bash-for-devops/screenshots/report-triage-1.png)
![Report-2](/week-03-linux-and-bash-for-devops/screenshots/report-triage-2.png)
---

### Notes

Answer the following in your own words:

**1. Why does this skill have Bash, Read, and Grep, but not Write?**

This skill has Bash, Read, and Grep because it is designed for investigation and analysis, not making changes to the system.

---

**2. Why is `disable-model-invocation: true` useful for this skill?**

disable-model-invocation: true is useful for the skill because Claude cannot automatically decide to run this skill on its own. The skill must be explicitly requested by the human.

---

**3. What part is performed by Bash, and what part is performed by Claude?**

Bash performs the technical health checks like collecting evidence through checking things like Nginx service status, Port 80 availability, HTTP response status, Disk usage, Memory availability, Recent Nginx logs.

On the other hand Claude performs the analysis and reporting through Reading the report generated after running the BAsh end of it, based on the report it Identifies the overall status of things, it will then highlight WARN or FAIL conditions and then goes ahead to explains what the evidence means, then it can Suggest a safe recovery command for human review and the Provides a verification command.


---

**4. Why is this better than asking Claude "Is my server healthy?" without giving it evidence?**
This approach is better because it is evidence based troubleshooting instead of guessing. Without evidence, it could only provide general advice or make unsupported assumptions. With this skill, Claude receives actual Linux evidence:


---

# Task 7 — Simulate an Nginx Incident and Let the Skill Diagnose It

## Goal

Create a controlled service failure, gather evidence through Bash, and let Claude analyze the evidence without taking recovery action.

### Evidence

#### Screenshot 13 — Output showing Nginx is inactive and the HTTP request fails

![nginx-inactive](/week-03-linux-and-bash-for-devops/screenshots/nginx-inactive-http-failed.png)

---

#### Screenshot 14 — `/linux-triage` output showing failed evidence, most likely cause, and a suggested recovery command

![triage-fail-1](/week-03-linux-and-bash-for-devops/screenshots/triage-fail-report-1.png)
![triage-fail-2](/week-03-linux-and-bash-for-devops/screenshots/triage-fail-report-2.png)
![triage-fail-3](/week-03-linux-and-bash-for-devops/screenshots/triage-fail-report-3.png)

---

#### Screenshot 15 — `incident-failure-report.txt` showing the failed checks and your Full Name

![incident-failure-report](/week-03-linux-and-bash-for-devops/screenshots/incident-failure-report.png)

---

### Notes

Answer the following in your own words:

**1. Which three checks failed?**

These are the checks that failed;
1. Nginx service is not active
2. Port 80 is not listening
3. Local HTTP check returned status 000

---

**2. What evidence supports the conclusion that Nginx is unavailable?**

The report provides multiple pieces of evidence.
1. The service status shows: [FAIL] Nginx service is not active.
2. Port 80 is not accepting connections: [FAIL] Port 80 is not listening.
3. The HTTP health check failed with status 000, indicating no response was received from the web server.
4. The recent logs show that Nginx was stopped.

---

**3. Did Claude execute the recovery command? Why is that important?**

No. Based on the incident report, there is no evidence that Claude executed any recovery command (such as sudo systemctl start nginx). It was clearly stated in the safety section of the skills that it should not do anything like executing a command. This is important because an AI assistant should analyze and recommend corrective actions rather than automatically making changes to a production system. Leaving execution to the user ensures:
Human oversight and approval.
Reduced risk of unintended system changes.
Compliance with the principle of safe, controlled operations.

---

**4. Which phase of the Agentic Loop is represented by the Bash report?**

The Bash report represents the Observe phase of the Agentic Loop because it collects and reports the current system state (service status, port status, HTTP response, disk usage, memory, and logs).

---

**5. Which phase is represented by Claude's explanation?**

Claude's explanation represents the Think (Reason) phase of the Agentic Loop because it interprets the collected evidence, identifies the likely cause of the failure, and recommends an appropriate recovery action without executing it.

---

# Task 8 — Recover Manually, Verify Again, and Write the Incident Summary

## Goal

Recover the service as the human operator and prove that the system is healthy again.

### Evidence

#### Screenshot 16 — Output showing Nginx is active and `curl -I http://localhost` returns 200 OK

![rcovery](/week-03-linux-and-bash-for-devops/screenshots/recovery-display.png)

---

#### Screenshot 17 — Second `/linux-triage` output showing successful recovery with no FAIL results

![recovery-triage-report](/week-03-linux-and-bash-for-devops/screenshots/recovery-triage-report.png)

---

#### Screenshot 18 — Output of `ls -lah reports` showing both `incident-failure-report.txt` and `recovery-report.txt`

![list-reports](/week-03-linux-and-bash-for-devops/screenshots/Display-all-reports.png)

---

#### Screenshot 19 — `incident-summary.md` showing all required sections and your Full Name

![incident-summary](/week-03-linux-and-bash-for-devops/screenshots/incident-summary.png)

---

### Notes

Answer the following in your own words:

**1. What action did you execute manually?**

I restarted nginx manually by executing the following command **sudo systemctl start nginx**

---

**2. What evidence proves that the service recovered?**

When I ran the following commands systemctl is-active nginx and curl -I http://localhost,
it returned active status for my nginx and the http request showed that it was listening on port 80.

---

**3. Why is the second triage run necessary?**

The second triage run is necessary to verify that the recovery action was successful.

After the issue is fixed (for example, by running sudo systemctl start nginx), a second execution of the triage script confirms that:
- The Nginx service is active.
- Port 80 is listening for incoming connections.
- The HTTP health check returns a successful response (such as HTTP 200 instead of status 000).
- The system's overall status changes from FAIL to PASS, if the problem has been resolved.

---

**4. What could go wrong if an AI agent automatically restarted every failed service?**

If an AI agent automatically restarted every failed service, several problems could occur like
- Restarting a service may temporarily restore it, but the underlying cause (such as a configuration error, missing dependency, 
  or software bug) would remain unresolved.
- It could make the situation worse.
- If the service failed because of corrupted data, insufficient resources, or a security issue, repeatedly restarting it could 
  lead to repeated crashes, data corruption, or higher system load.
- It could disrupt users.
- Restarting services without approval can interrupt active connections or ongoing transactions, causing downtime or loss of work.
- It could interfere with incident investigation.
- Automatic restarts may overwrite logs or alter the system state, making it harder for administrators to determine why the 
  service failed.
- It could create security risks.

---

**5. In one sentence, explain the difference between using AI as a chatbot and using AI in this agentic workflow.**

Using AI as a chatbot mainly provides answers to questions, while using AI in an agentic workflow involves observing system data, reasoning about it, and recommending or carrying out actions to achieve a specific goal.

---

# Incident Summary

Fill in all seven sections below in your own words.

**Full Name:** GEORGE ADIMOWEI EPEBIFIE

**Date:** 17/07/2026

---

**1. Reported Symptom**

The Nginx web server was unavailable, causing the local website to be inaccessible.

---

**2. Evidence Collected**

The triage report showed that the Nginx service was not active, Port 80 was not listening, and the local HTTP health check returned status 000. The system logs also confirmed that the Nginx service had been stopped. Disk usage (63%) and available memory (357 MB) were both within acceptable limits.

---

**3. Most Likely Cause**

The most likely cause was that the Nginx service had been stopped, preventing it from listening on Port 80 and serving HTTP requests.

---

**4. Human-Approved Recovery Action**

After reviewing Claude's recommendation, the approved recovery action was to restart the Nginx service using sudo systemctl start nginx and then rerun the triage script to confirm the issue was resolved.

---

**5. Verification**

A second triage run should confirm that the Nginx service is active, Port 80 is listening, the HTTP health check succeeds (for example, returning HTTP 200), and the overall system status changes from FAIL to PASS.

---

**6. Safety Decision**

The AI assistant did not execute the recovery command automatically. Instead, it analyzed the incident and recommended a recovery action, leaving the final decision and execution to a human administrator to ensure safe and controlled system management.

---

**7. Agentic Loop Mapping**

- Observe: The Bash script collected system information, service status, port status, HTTP check results, resource usage, and 
  logs.

- Think: Claude analyzed the collected evidence, identified that Nginx was stopped, and determined the most likely cause.

- Act: A human approved and executed the recommended recovery action by restarting the Nginx service.

- Observe (Verification): The triage script was run again to verify that the service was restored and operating correctly.

---

# LinkedIn Post (Required)

## Evidence

#### LinkedIn Post URL

Paste your LinkedIn post URL here: https://www.linkedin.com/posts/wisgeorge1_devops-cloudengineering-linux-share-7483985907503489024-4fGd/?utm_source=share&utm_medium=member_desktop&rcm=ACoAADp8HhoB_UGFhHiID8Ba-4DVResYfMJJsuY

`__________________________`

---

#### Screenshot — Published LinkedIn post

![AI-assisted](/week-03-linux-and-bash-for-devops/screenshots/AI-assisted.png)

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