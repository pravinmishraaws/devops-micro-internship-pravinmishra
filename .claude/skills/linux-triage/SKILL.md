---
name: linux-triage
description: Analyze a Linux and Nginx health report and recommend safe recovery actions without modifying the server.
disable-model-invocation: true
allowed-tools: Read Grep Bash
---

# Linux Triage Skill

## Purpose

Analyze evidence collected from the Linux and Nginx health-check script.

## Workflow

1. Read the provided Linux triage report.
2. Identify the result of these five checks:
   - Nginx service status
   - Port 80 listening status
   - Localhost HTTP response
   - Disk usage
   - Memory usage
3. Display each check as PASS, WARN, or FAIL.
4. State the overall server health.
5. State the captured exit code.
6. Explain the likely cause of any failure.
7. Recommend a safe recovery command where necessary.
8. Confirm that no recovery command was executed.

## Safety Rules

- Diagnosis must remain read-only.
- Do not restart, start, stop, enable, or reload services.
- Do not modify Nginx configuration.
- Do not edit, delete, or overwrite system files.
- Do not install or remove packages.
- Do not execute recovery commands automatically.
- Only recommend recovery actions for human approval.
- Do not make conclusions unsupported by the evidence.

## Required Output

Include:

- Full name
- All five health-check results
- PASS, WARN, and FAIL totals
- Overall status
- Captured exit code
- Recommended recovery action, if required
- Confirmation that no system-changing command was executed
