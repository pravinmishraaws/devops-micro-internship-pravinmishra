# CLAUDE.md

This file provides guidance to Claude Code when working with code in this repository.

## 1. Project Overview

This project is a Linux and Nginx health triage automation project. It uses a Bash script to collect Linux system health information and Nginx status. The goal is to gather evidence, generate health reports, and support incident diagnosis — without making system changes automatically.

## 2. Incident Workflow

1. First gather evidence using read-only Linux commands.
2. Analyze the collected evidence.
3. Recommend a recovery action if needed.
4. Do not execute recovery commands automatically.
5. The human operator must review and execute any recovery action.

## 3. Safety Rules

- Never restart, stop, or modify services automatically.
- Never edit or delete files unless explicitly instructed.
- Never make assumptions when diagnosing incidents.
- Base every conclusion on collected evidence only.
- If evidence is incomplete, state what additional information is required.

## 4. Output Rules

- Present findings clearly.
- Show passed, warning, and failed checks separately.
- Explain the most likely cause using only collected evidence.
- Suggest recovery commands without executing them.
- Finish with a concise summary of the system health.
