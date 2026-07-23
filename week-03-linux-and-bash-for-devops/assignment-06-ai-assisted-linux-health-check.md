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

![application are healthy](./screenshots/W3-SS-A6/W3-A6-SS-1.png)

---

#### Screenshot 2 — Output of `pwd` and `find . -maxdepth 4 -type d | sort` showing the workspace folder structure

![folder structure](./screenshots/W3-SS-A6/W3-A6-SS-2.png)

---

### Notes

Answer the following in your own words:

**1. What proves that Nginx is running?**

systemctl is-active nginx returns "active", or ps aux | grep nginx shows the Nginx master and worker processes running.

---

**2. What proves that the server is listening for HTTP traffic?**

ss -ltn | grep ':80' shows a listening socket on port 80 in LISTEN state, and curl -I http://localhost returns HTTP 200 OK.

---

**3. Why must you capture a healthy baseline before simulating an incident?**

A healthy baseline establishes expected behavior (processes running, ports listening, HTTP response codes, CPU/memory normal). Without it, you can't distinguish between incident-caused failures and pre-existing issues, making diagnosis ambiguous.

---

# Task 2 — Create Project Context and Safety Rules in CLAUDE.md

## Goal

Tell Claude exactly what this project does and what it is not allowed to do.

### Evidence

#### Screenshot 3 — CLAUDE.md open in VS Code showing all four sections (Project Overview, Incident Workflow, Safety Rules, Output Rules)

![CLAUDE.md](./screenshots/W3-SS-A6/W3-A6-SS-3.png)
 
---

### Notes

Answer the following in your own words:

**1. Why should Claude receive project-specific operational rules?**

Claude needs context about this specific infrastructure (what tools are available, what the incident workflow is, what failure modes exist) to avoid making unsafe assumptions. Generic AI behavior might suggest actions outside your environment's constraints—like trying to modify production without approval or making unauthorized AWS calls. Operational rules keep Claude focused and safe within your project's boundaries.

---

**2. Why is the human required to execute the recovery command?**

AI should gather and analyze evidence, but humans must make the decision to change infrastructure state. Recovery commands modify service status, affect users, and have business impact. If Claude could execute recovery autonomously, a misdiagnosis could worsen the incident. Human approval ensures accountability and prevents unintended cascading failures.

---

**3. Which rule prevents Claude from making an unsupported diagnosis?**

The rule that restricts Claude to only analyzing evidence collected by Bash, not inventing hypotheticals or external knowledge. This forces Claude to base conclusions solely on output from systemctl, ss, curl, and process checks—avoiding speculation like "maybe your DNS is broken" when there's no DNS evidence in the report.

---

# Task 3 — Use Agentic AI to Plan Before Writing the Script

## Goal

Use Claude Code to inspect the environment and produce a read-only plan before creating any Bash code.

### Evidence

#### Screenshot 4 — Claude Code showing the five-check plan and read-only inspection results

![CLAUDE 5 plan](./screenshots/W3-SS-A6/W3-A6-SS-4-1.png)
![CLAUDE 5 plan](./screenshots/W3-SS-A6/W3-A6-SS-4-2.png)
![CLAUDE 5 plan](./screenshots/W3-SS-A6/W3-A6-SS-4-3.png)

---

### Notes

Answer the following in your own words:

**1. Which part of this task represents the Gather phase?**

The Gather phase is the execution of read-only Linux commands: systemctl status nginx, ss -tlnp | grep ':80', curl -sS -o /dev/null -w "HTTP Status: %{http_code}\n", df -h /, and free -h. These commands collect raw evidence from the server without modifying anything. The plan's "Observed:" lines show the actual data gathered.

---

**2. Did Claude follow the instruction not to create files? How did you verify this?**

Yes. Claude ran only Bash read-only inspection commands and displayed their output in the terminal. There were no file creation commands (echo > file, touch, tee, etc.). The evidence is the command output itself, not written to disk. You can verify this by checking that no new files appear in the workspace—only command output in the Claude Code chat.

---

**3. Why is planning before coding useful in DevOps automation?**

Planning identifies exactly what to check (the 5 checks), how to check it (the commands), and what healthy vs. failed states look like before writing the script. This prevents building a triage tool that's missing critical checks, uses wrong thresholds, or returns confusing output. The plan becomes the script's specification—making development faster, more accurate, and aligned with actual monitoring needs

---

# Task 4 — Build the Linux Triage Bash Script

## Goal

Create one Bash script that gathers consistent Linux and Nginx health evidence.

### Evidence

#### Screenshot 5 — Top section of `linux-triage.sh` showing variables, thresholds, and the checks array

![linux-triage.sh](./screenshots/W3-SS-A6/W3-A6-SS-5.png)

---

#### Screenshot 6 — Middle section showing check functions and conditionals

![linux-triage.sh-mid](./screenshots/W3-SS-A6/W3-A6-SS-6.png)

---

#### Screenshot 7 — Bottom section showing the loop, summary function, and exit behavior

![linux-triage.sh-bottom](./screenshots/W3-SS-A6/W3-A6-SS-7.png)

---

#### Screenshot 8 — Output of `bash -n scripts/linux-triage.sh` (no syntax errors) and `ls -l scripts/linux-triage.sh` showing executable permission


![linux-triage.sh-bottom](./screenshots/W3-SS-A6/W3-A6-SS-8.png)

---

### Notes

Answer the following in your own words:

**1. What is stored in the checks array?**

The checks array stores the names of each health check function as strings: checks=("nginx_status" "port_80_listening" "http_response" "disk_usage" "available_memory"). Each element is a function name that the script will call later.

---

**2. How does the `for` loop use that array?**

The for loop iterates through each element: for check in "${checks[@]}"; do $check; done. For each iteration, it calls the function by name using $check (command substitution), running nginx_status, then port_80_listening, etc., in sequence. This way, one loop drives all checks without repeating code.

---

**3. Why are the health checks separated into functions?**

Functions make the script modular and reusable. Each check is isolated logic that can be tested independently, modified without affecting others, and called multiple times. It's also easier to add or remove checks—just change the array. Without functions, the script would be a long linear block of commands, harder to read and maintain.

---

**4. What is the purpose of `$(...)` in this script?**

$(...) is command substitution—it runs the command inside and captures its output as a string. For example, $(systemctl is-active nginx) runs the systemctl command and stores the result (like "active") in a variable. This allows the script to use command output in conditionals and variable assignments.

---

**5. Why does the script use different exit codes for HEALTHY, WARN, and FAIL?**

Exit codes allow external tools (other scripts, monitoring systems, CI/CD pipelines) to detect the overall status without parsing text. Exit code 0 signals success (all healthy), 1 signals partial or full failure, and intermediate codes (like 2 for warnings) communicate severity. This enables automation to respond differently: ignore a WARN, but page on-call for a FAIL.

---

# Task 5 — Run and Understand the Healthy-State Report

## Goal

Run the Bash script against the healthy server and verify that it creates a report.

### Evidence

#### Screenshot 9 — Output of `./scripts/linux-triage.sh` showing your Full Name and all five check results

![linux-triage.sh output](./screenshots/W3-SS-A6/W3-A6-SS-9.png)

---

#### Screenshot 10 — Output showing the captured exit code and final summary

![linux-triage.sh summary](./screenshots/W3-SS-A6/W3-A6-SS-10.png)

---

### Notes

Answer the following in your own words:

**1. What is the overall status of your healthy baseline?**

Overall status is HEALTHY with warnings. All five checks completed: Nginx is active and running, port 80 is listening, HTTP returns 200, root disk is at 70% (acceptable), but available memory is tight at 403Mi out of 951Mi total. No critical failures, but disk and memory should be monitored.

---

**2. Which exact Linux evidence proves the application is serving traffic?**

Two pieces of evidence:

ss -tlnp | grep ':80' shows LISTEN 0.0.0.0:80 bound to an nginx process, proving the server is listening.
curl -sS -o /dev/null -w "HTTP Status: %{http_code}\n" http://localhost/ returns HTTP Status: 200, proving the application is responding to HTTP requests.

---

**3. Did your script return exit code 0 or 1? Explain why.**

Exit code 0 (success). Although disk usage and available memory triggered WARN status (they're noted but not critical), there were no FAIL results. The script's exit logic only returns 1 if a health check explicitly fails; warnings are logged but don't cause exit code 1. This allows monitoring systems to treat WARN as "watch but don't page" and FAIL as "page on-call."

---

**4. What is the difference between a warning and a failure in this script?**

A WARN means a metric is approaching a problem threshold (disk at 70% approaching 85%–90%, memory low but not exhausted) but the service is still functioning normally. A FAIL means the metric is at or past the critical threshold and the service is compromised (disk 100% blocks writes, memory exhausted triggers OOM killer). FAIL causes exit code 1; WARN does not, allowing gradual degradation to be tracked without false alarms.

---

# Task 6 — Create and Run the /linux-triage Skill

## Goal

Turn the Bash script into a reusable, manually invoked Agentic AI workflow.

### Evidence

#### Screenshot 11 — `SKILL.md` showing the frontmatter, allowed tool restrictions, and safety rules

![SKILL.md](./screenshots/W3-SS-A6/W3-A6-SS-11.png)

---

#### Screenshot 12 — `/linux-triage` output for the healthy server

![/linux-triage](./screenshots/W3-SS-A6/W3-A6-SS-12.png)

---

### Notes

Answer the following in your own words:

**1. Why does this skill have Bash, Read, and Grep, but not Write?**

This skill is read-only by design—it diagnoses problems but does not fix them. Bash runs inspection commands (systemctl, ss, curl, df, free). Read allows Claude to see CLAUDE.md's operational rules and config. Grep filters output for clarity. Write is excluded because the skill should never modify files, restart services, or change infrastructure—only gather and analyze evidence. This enforces the human-approval boundary.

---

**2. Why is `disable-model-invocation: true` useful for this skill?**

It prevents Claude from auto-invoking other MCP tools or making external API calls. Without this setting, Claude might decide to query AWS, call external monitoring APIs, or invoke unrelated tools. With it enabled, Claude is restricted to analyzing only the evidence Bash collected, staying focused and predictable. This ensures the skill does exactly one thing: run triage and explain findings.

---

**3. What part is performed by Bash, and what part is performed by Claude?**

Bash collects raw infrastructure evidence: runs systemctl status nginx, ss -tlnp, curl tests, df disk checks, and free memory checks. It outputs the exact server state. Claude receives that output and analyzes it: compares results against thresholds, identifies failure patterns, diagnoses root cause, and suggests the most likely recovery action.

---

**4. Why is this better than asking Claude "Is my server healthy?" without giving it evidence?**

Without evidence, Claude falls back on training data and makes assumptions: "Maybe your DNS is misconfigured," "Check your cloud provider," or other generic troubleshooting. With actual command output (e.g., "Nginx is inactive," "port 80 has no listener"), Claude diagnoses based on facts from your exact server state, avoiding hallucinations and generic speculation. Evidence grounds analysis in reality.

---

# Task 7 — Simulate an Nginx Incident and Let the Skill Diagnose It

## Goal

Create a controlled service failure, gather evidence through Bash, and let Claude analyze the evidence without taking recovery action.

### Evidence

#### Screenshot 13 — Output showing Nginx is inactive and the HTTP request fails

![/linux-triage](./screenshots/W3-SS-A6/W3-A6-SS-13.png)

---

#### Screenshot 14 — `/linux-triage` output showing failed evidence, most likely cause, and a suggested recovery command


![/linux-triage](./screenshots/W3-SS-A6/W3-A6-SS-14.png)

---

#### Screenshot 15 — `incident-failure-report.txt` showing the failed checks and your Full Name

![/linux-triage](./screenshots/W3-SS-A6/W3-A6-SS-15.png)

---

### Notes

Answer the following in your own words:

**1. Which three checks failed?**

Nginx service status, port 80 listening state, and localhost HTTP response. When Nginx was stopped, it became inactive (failed check 1), released port 80 (failed check 2), and stopped responding to HTTP requests (failed check 3). Disk usage and available memory remained unchanged from the healthy baseline.

---

**2. What evidence supports the conclusion that Nginx is unavailable?**

systemctl status nginx returns inactive (dead) instead of active (running)
ss -tlnp | grep ':80' produces no output—nothing is listening on port 80
curl -sS -o /dev/null -w "HTTP Status: %{http_code}\n" http://localhost/ returns HTTP Status: 000 (connection refused), not 200

These three pieces of evidence together prove the application cannot serve traffic.

---

**3. Did Claude execute the recovery command? Why is that important?**

No. Claude proposed the recovery command (e.g., systemctl start nginx) but explicitly did not execute it. This is critical because only humans can authorize infrastructure changes. If Claude autonomously restarted Nginx, a misdiagnosis could mask a deeper problem or violate change-control policy. Human execution ensures accountability and allows the operator to verify context before acting.

---

**4. Which phase of the Agentic Loop is represented by the Bash report?**

The Gather phase. The Bash triage script collects raw evidence: service status, port state, HTTP responses, disk, and memory. No analysis or action yet—just facts.

---

**5. Which phase is represented by Claude's explanation?**

The Analyze phase. Claude interprets the evidence, identifies the pattern (three failed checks pointing to Nginx down), determines the root cause, and recommends the most likely recovery action. Still no action—only reasoning.

---

# Task 8 — Recover Manually, Verify Again, and Write the Incident Summary

## Goal

Recover the service as the human operator and prove that the system is healthy again.

### Evidence

#### Screenshot 16 — Output showing Nginx is active and `curl -I http://localhost` returns 200 OK

![Nginx is active](./screenshots/W3-SS-A6/W3-A6-SS-16.png)

---

#### Screenshot 17 — Second `/linux-triage` output showing successful recovery with no FAIL results

![successful](./screenshots/W3-SS-A6/W3-A6-SS-17.png)

---

#### Screenshot 18 — Output of `ls -lah reports` showing both `incident-failure-report.txt` and `recovery-report.txt`

![successful](./screenshots/W3-SS-A6/W3-A6-SS-18.png)

---

#### Screenshot 19 — `incident-summary.md` showing all required sections and your Full Name

![successful](./screenshots/W3-SS-A6/W3-A6-SS-19-1.png)

---

### Notes

Answer the following in your own words:

**1. What action did you execute manually?**

I executed systemctl start nginx to restart the Nginx service on the EC2 instance. This was the human-approved recovery action based on Claude's evidence-based diagnosis.
---

**2. What evidence proves that the service recovered?**

systemctl status nginx shows active (running) status
curl -sS -o /dev/null -w "HTTP Status: %{http_code}\n" http://localhost/ returns HTTP Status: 200
The second /linux-triage run shows all five checks passing with no FAIL results
ss -tlnp | grep ':80' shows port 80 is again bound to the nginx process

---

**3. Why is the second triage run necessary?**

The second triage run proves that the recovery action actually worked and didn't create new problems. Without it, you only assume the service restarted—the second run is empirical verification. It also checks all five dimensions again (service, port, HTTP, disk, memory) to ensure the recovery didn't introduce side effects like disk exhaustion or memory leak.

---

**4. What could go wrong if an AI agent automatically restarted every failed service?**

Masking root cause: A restarting service might be crashing due to bad config, missing dependency, or resource limit—auto-restart hides the real problem
Violating change control: Infrastructure changes need human review and logging for compliance and incident tracking
Cascading failures: Restarting one service could overload dependent systems or break load balancer state
Business impact: Auto-restart during peak hours could worsen user impact if the service needs different recovery steps
Accountability: If auto-restart makes things worse, who is responsible?

---

**5. In one sentence, explain the difference between using AI as a chatbot and using AI in this agentic workflow.**

A chatbot answers questions from general knowledge; an agentic workflow gathers evidence from your actual infrastructure, analyzes it, lets the human decide on action, and verifies the outcome—replacing speculation with facts and human oversight.

---

# Incident Summary

Fill in all seven sections below in your own words.

**Full Name:** Ronnie Santos

**Date:** 23/07/2026

---

**1. Reported Symptom**

Nginx service was not responding to HTTP requests. The web application that was previously serving traffic on localhost:80 became inaccessible—attempts to connect returned connection refused errors.

---

**2. Evidence Collected**

Three checks failed:

Nginx service status: systemctl status nginx returned inactive (dead) instead of active (running)
Port 80 listening state: ss -tlnp | grep ':80' produced no output—port 80 was no longer bound to any process
Localhost HTTP response: curl -sS -o /dev/null -w "HTTP Status: %{http_code}\n" http://localhost/ returned HTTP Status: 000 (connection refused)

Two checks remained healthy: disk usage at 70% and available memory at 403Mi.

---

**3. Most Likely Cause**

Nginx process was stopped or killed. The evidence shows no service running, no listener on port 80, and no HTTP response—all consistent with a stopped service rather than a misconfiguration, port conflict, or resource exhaustion. The root cause was service unavailability, not infrastructure problems.

---

**4. Human-Approved Recovery Action**

After reviewing Claude's diagnosis and proposed command, I manually executed:


systemctl start nginx

This command started the Nginx service on the EC2 instance, restoring it to active status.

---

**5. Verification**

Two outputs proved recovery:

systemctl status nginx returned active (running) with the service running for 0s (just started)
curl -sS -o /dev/null -w "HTTP Status: %{http_code}\n" http://localhost/ returned HTTP Status: 200, confirming the application was serving traffic again
A second /linux-triage run showed all five checks passing with no FAIL results

---

**6. Safety Decision**

The AI skill was restricted to read-only tools (Bash, Read, Grep) with Write explicitly excluded. This allows Claude to gather evidence (systemctl, ss, curl, df, free) and analyze it (diagnose root cause, suggest recovery). However, executing recovery commands requires human judgment because:

The diagnosis could be incomplete or wrong
Service restarts affect real users and may trigger cascading failures
Change control and accountability require human approval
Automated recovery without human context could mask deeper problems

---

**7. Agentic Loop Mapping**

This incident followed the four-phase Agentic Loop:

Gather: Bash triage script collected evidence—systemctl status, port listening state, HTTP response code, disk/memory metrics. Raw facts, no interpretation.
Analyze: Claude reviewed the evidence, noticed three failed checks (service down, port not listening, no HTTP response), and concluded: "Nginx is stopped." Proposed recovery: systemctl start nginx.
Human Act: I read Claude's analysis, verified the reasoning matched the evidence, and manually executed systemctl start nginx as the authorized operator. No automation; explicit human decision.
Verify: I re-ran /linux-triage to confirm all checks now passed, proving Nginx recovered and the application returned to serving traffic on port 80.

Result: Incident diagnosed and resolved without AI autonomy, maintaining human control over infrastructure state changes.

---

# LinkedIn Post (Required)

## Evidence

#### LinkedIn Post URL

Paste your LinkedIn post URL here:

`https://www.linkedin.com/posts/ronnie-santos-131856184_devops-cloudcomputing-aws-ugcPost-7486123391440052225-PeIa/?utm_source=share&utm_medium=member_desktop&rcm=ACoAACuNXjUByrzjuiXUdcAXl7CkJp7IYHpF-S8`

---

#### Screenshot — Published LinkedIn post

![successful](./screenshots/W3-SS-A6/W3-A6-SS-19.png)

---

# GitHub Repository URL

Paste the URL of your GitHub folder or repository containing the assignment files here:

`Add your URL here`

---

# Submission Instructions

- Add all required screenshots in your submission
- Full Name must be visible in required screenshots and the Bash report
- All written answers must be in your own words
- Do not expose sensitive information (keys, passwords, AWS account IDs, tokens)
- GitHub URL must be included in this document

---

# Completion Checklist

- [✓] Task 1: Healthy baseline confirmed, workspace created (Screenshots 1–2, Notes answered)
- [✓] Task 2: CLAUDE.md created with all four sections (Screenshot 3, Notes answered)
- [✓] Task 3: Five-check plan produced by Claude using read-only tools (Screenshot 4, Notes answered)
- [✓] Task 4: `linux-triage.sh` created, syntax validated, executable permission set (Screenshots 5–8, Notes answered)
- [✓] Task 5: Healthy-state report generated with no FAIL result (Screenshots 9–10, Notes answered)
- [✓] Task 6: `/linux-triage` skill created and run successfully on healthy server (Screenshots 11–12, Notes answered)
- [✓] Task 7: Nginx incident simulated, failed evidence captured, Claude did not execute recovery (Screenshots 13–15, Notes answered)
- [✓] Task 8: Nginx recovered manually, recovery verified, reports saved, incident summary complete (Screenshots 16–19, Notes answered)
- [✓] Incident summary contains all seven required sections
- [✓] LinkedIn post published and URL submitted
- [✓] Full Name visible in all required screenshots and the Bash report
- [✓] Skill does not have Write permission
- [✓] Skill did not execute any recovery commands
- [✓] No sensitive data exposed

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