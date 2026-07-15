# Assignment 6: Safety Rails for Your AI Agent

---

## 1. Assignment Overview

**Assignment:** Hooks & Permissions     
**Estimated Time:** 60 minutes             
**Difficulty:** Intermediate                 
**Category:** Agentic AI, Safety              

---

## 2. Objective

Configure team-level permissions in `settings.json`, create a UserPromptSubmit hook that catches destructive intent before Claude processes the request, create a PreToolUse hook that blocks dangerous commands before they execute, and prove both hooks work through live tests.

---

## 3. Real-World Scenario

On real infrastructure teams, no engineer gives AI unrestricted access to production systems. Every agentic workflow that touches real infrastructure needs guardrails — hooks that validate requests and tool actions before execution. A junior engineer might accidentally ask Claude to "delete all the old buckets" during a cleanup session. Without hooks, Claude may proceed with the requested action without additional validation before tool execution. With hooks, the request is intercepted and blocked before a single API call is made. This is not optional safety — it is table stakes for any team running AI on real infrastructure.

---

## 4. Learning Outcomes

- Understand the 3 hook types: `UserPromptSubmit`, `PreToolUse`, and `PostToolUse`
- Write team-level permissions in `settings.json`
- Create a hook that intercepts destructive prompt language before Claude processes the request
- Create a hook that blocks dangerous shell commands before they execute
- Create a hook that records executed commands using a post-execution logging hook
- Configure external hook scripts and connect them through `settings.json`
- Prove all three hooks work through live tests:
  - UserPromptSubmit blocks destructive prompts
  - PreToolUse blocks dangerous Bash commands
  - PostToolUse logs successful command executions
---

## 5. Important Instructions (Global Rules)

**Key Rules:**
- Full name must be visible in required screenshots
- Do not expose sensitive information (keys, passwords, account IDs)
- Follow screenshot requirements exactly as specified in tasks
- Submission must clearly match task outputs
- Missing or incorrect proof may result in rejection

---

## 6. Prerequisites

- Assignment 3 completed (skills in place)
- Assignment 4 completed (agents in place)
- `jq` installed and available in PATH

---

## 7. Tasks

Each task must be completed sequentially.

---

### Task 1 — Create Claude Code Configuration Structure

**Goal:** Create the `.claude` directory structure required for team-level Claude Code configuration.

**Steps:**

1. Inside `.claude`, create the following files and folders:

```
.claude/

├──settings.json
├──hooks/
   ├── user-prompt-guard.sh
   ├── pre-tool-guard.sh
   └── post-tool-logger.sh

```

3. Save the empty files.

4. Provide execute permission for the script files.

### Linux/macOS users

Run:

```bash
chmod +x .claude/hooks/*.sh
```

This gives execute permission to all hook scripts.

### Windows users

Do not run the `chmod` command.

Use **Git Bash** as the terminal when working with Claude Code hooks. Windows users do not need to manually add execute permissions.


**Expected Output:**

Your project should contain the Claude Code configuration structure:

```
.claude/

├──settings.json
├──hooks/
   ├── user-prompt-guard.sh
   ├── pre-tool-guard.sh
   └── post-tool-logger.sh

```

**Screenshots Required:**

* Screenshot 1 — `.claude` folder structure visible in VS Code Explorer

---

### Task 2 — Create the UserPromptSubmit Hook Script

**Goal:** Create a hook that checks user prompts before Claude processes them and blocks requests containing destructive intent.

**Steps:**

1. Open the file:

```

.claude/hooks/user-prompt-guard.sh

```

2. Copy and paste the following content:

```bash
#!/bin/bash
# UserPromptSubmit hook — blocks destructive intent in user prompts

INPUT=$(cat)
PROMPT=$(echo "$INPUT" | jq -r '.prompt // empty')

if echo "$PROMPT" | grep -iqE "delete all|destroy everything|remove all resources|wipe|nuke|drop all"; then
  echo '{"decision": "block", "reason": "Destructive intent detected. Please use /tf-destroy for controlled infrastructure teardown."}'
fi
```

3. Save the file.

**Expected Output:**

The file exists:

```
.claude/hooks/user-prompt-guard.sh
```

and contains the UserPromptSubmit hook script.

**Screenshots Required:**

* Screenshot 2 — `user-prompt-guard.sh` open in VS Code showing the hook script

---

### Task 3 — Create the PreToolUse Hook Script

**Goal:** Create a hook that runs before Claude executes Bash commands and blocks dangerous infrastructure commands.

**Steps:**

1. Open the file:

```

.claude/hooks/pre-tool-guard.sh

```

2. Copy and paste the following content:

```bash
#!/bin/bash
# PreToolUse hook — blocks dangerous Bash commands before execution

INPUT=$(cat)
CMD=$(echo "$INPUT" | jq -r '.tool_input.command // empty')

if echo "$CMD" | grep -qE "terraform destroy|terraform apply.*-auto-approve|aws s3 rm|aws s3 rb"; then
  echo '{"decision": "block", "reason": "Destructive command detected. Use /tf-destroy or /tf-apply commands for safety."}'
fi
```

3. Save the file.

**Expected Output:**

The file exists:

```
.claude/hooks/pre-tool-guard.sh
```

and contains the PreToolUse hook script.

**Screenshots Required:**

* Screenshot 3 — `pre-tool-guard.sh` open in VS Code showing the hook script

---

### Task 4 — Create the PostToolUse Hook Script

**Goal:** Create a hook that runs after Claude executes a Bash command and logs selected Terraform commands.

**Steps:**

1. Open the file:

```
.claude/hooks/post-tool-logger.sh
```

2. Copy and paste the following content:

```bash
#!/bin/bash
# PostToolUse hook — logs Terraform validation and formatting commands

INPUT=$(cat)
CMD=$(echo "$INPUT" | jq -r '.tool_input.command // empty')

if echo "$CMD" | grep -qE "terraform fmt|terraform validate"; then
  echo "[$(date -u +%Y-%m-%dT%H:%M:%SZ)] Terraform command executed: $CMD" >> .claude/deploy.log
fi
```

3. Save the file.

**Expected Output:**

The file exists:

```
.claude/hooks/post-tool-logger.sh
```

and contains the PostToolUse hook script.

**Screenshots Required:**

- Screenshot 4 — `post-tool-logger.sh` open in VS Code showing the hook script

---

### Task 5 — Configure settings.json to Connect Hook Scripts

**Goal:** Configure Claude Code permissions and connect the hook scripts created in the previous tasks.

**Steps:**

1. Open the file:

```

.claude/settings.json

```

2. Copy and paste the following configuration:

```json
{
  "alwaysThinkingEnabled": true,
  "permissions": {
    "allow": [
      "Bash(cd terraform && terraform init*)",
      "Bash(cd terraform && terraform plan*)",
      "Bash(cd terraform && terraform output*)",
      "Bash(cd terraform && terraform show*)",
      "Bash(cd terraform && terraform fmt*)",
      "Bash(cd terraform && terraform validate*)",
      "Bash(aws s3 ls*)",
      "Bash(aws cloudfront get-distribution*)",
      "Bash(aws sts get-caller-identity)"
    ],
    "deny": [
      "Bash(rm -rf *)",
      "Bash(aws iam *)"
    ]
  },
  "hooks": {
    "UserPromptSubmit": [
      {
        "matcher": "",
        "hooks": [
          {
            "type": "command",
            "command": "bash .claude/hooks/user-prompt-guard.sh"
          }
        ]
      }
    ],
    "PreToolUse": [
      {
        "matcher": "Bash",
        "hooks": [
          {
            "type": "command",
            "command": "bash .claude/hooks/pre-tool-guard.sh"
          }
        ]
      }
    ],
    "PostToolUse": [
      {
        "matcher": "Bash",
        "hooks": [
          {
            "type": "command",
            "command": "bash .claude/hooks/post-tool-logger.sh"
          }
        ]
      }
    ]
  }
}
```

3. Save the file.

**Expected Output:**

Your `.claude/settings.json` should contain:

```
settings.json

├── alwaysThinkingEnabled
├── permissions
│   ├── allow
│   └── deny
└── hooks
    ├── UserPromptSubmit
    ├── PreToolUse
    └── PostToolUse
```

**Screenshots Required:**

* Screenshot 5 — `settings.json` open in VS Code showing permissions and hooks configuration

---

### Task 6 — Test the UserPromptSubmit Hook

**Goal:** Prove the prompt-level hook works by typing a destructive prompt and verifying it is blocked before Claude processes the request.

**Steps:**

1. Close Claude Code completely and reopen it (hooks load fresh when Claude Code starts).
2. In the Claude Code terminal, type:

```

delete all files in the terraform folder

```

3. Observe the response.
4. The `UserPromptSubmit` hook should detect the destructive intent and block the request before Claude starts working on it.
5. Capture the blocked message.

**Command (in Claude Code):**

```

delete all files in the terraform folder

```

**Expected Output:**

Claude Code shows a blocked message similar to:

```

UserPromptSubmit operation blocked by hook:
Destructive intent detected.

```

Claude should not start reading files or executing commands.

**Screenshots Required:**

- Screenshot 6 — UserPromptSubmit hook blocking the destructive prompt

---

### Task 7 — Test the PreToolUse Hook

**Goal:** Prove the tool-level hook works by asking Claude to execute a dangerous Bash command.

**Steps:**

1. In Claude Code, type:

```

Run terraform destroy in the terraform folder.

```

2. Claude will understand the request and attempt to execute the Terraform command.
3. Before the Bash command runs, the `PreToolUse` hook checks the command.
4. The hook should block the execution.
5. Capture the blocked message.

**Command (in Claude Code):**

```

Run terraform destroy in the terraform folder.

```

**Expected Output:**

Claude starts processing the request, but the `PreToolUse` hook blocks the dangerous command before execution.

Example:

```

PreToolUse operation blocked by hook:
Destructive command detected.

```

**Screenshots Required:**

- Screenshot 7 — PreToolUse hook blocking terraform destroy

---

### Task 8 — Test the PostToolUse Logging Hook

**Goal:** Prove the logging hook runs after a successful command execution and records Terraform operations.

**Steps:**

1. In Claude Code, type:

```

Run terraform validate in the terraform folder.

```

2. Claude executes the Terraform validation command.
3. After the command completes, the `PostToolUse` hook runs automatically.
4. Open the generated log file:

```

.claude/deploy.log

```

5. Verify that the Terraform command was recorded.

**Command (in Claude Code):**

```

Run terraform validate in the terraform folder.

```

**Expected Output:**

Terraform validation succeeds:

```

Success! The configuration is valid.

```

A log entry is created in:

```

.claude/deploy.log

```

Example:

```

[2026-07-08T...] Terraform command executed: terraform validate

```

**Screenshots Required:**

- Screenshot 8 — Claude running terraform validate successfully
- Screenshot 9 — `.claude/deploy.log` showing the logged command

---

## 8. Industry Insight

The hook architecture in Claude Code mirrors the same pattern used in production CI/CD pipelines — pre-commit hooks, pre-deploy approval gates, and policy-as-code checks. In both cases, the principle is identical: intercept early and block at the lowest cost point. A UserPromptSubmit hook that fires in milliseconds is far cheaper than a Terraform destroy that runs for 10 minutes before someone notices the mistake. Building this habit now — intercepting at the earliest possible point — is one of the most transferable skills in professional DevOps.

---

## 9. Submission Instructions

Complete all tasks in sequence.

Your submission must include:
- All 9 required screenshots
- Your GitHub repo URL (`settings.json` and hooks folder committed and visible)

---

## 10. Solution Walkthrough

A step-by-step solution and troubleshooting guide is available for reference:
Full solution walkthrough → [Click here](../Solutions_walkthrough/assignment-06-hooks-permissions.md)

---

## 11. LinkedIn Requirement

Not required for this assignment.

---

## 12. Completion Checklist

Before submission, verify:

- [ ] `.claude` folder structure created correctly
- [ ] `user-prompt-guard.sh` created with UserPromptSubmit hook logic
- [ ] `pre-tool-guard.sh` created with PreToolUse hook logic
- [ ] `post-tool-logger.sh` created with PostToolUse logging logic
- [ ] `settings.json` created with allow and deny permissions
- [ ] `settings.json` configured to connect all three hooks:
  - [ ] UserPromptSubmit
  - [ ] PreToolUse
  - [ ] PostToolUse
- [ ] Destructive prompt test shows UserPromptSubmit blocked the request
- [ ] Terraform destroy command test shows PreToolUse intercepted the command
- [ ] Terraform validate test shows PostToolUse created the log entry
- [ ] All required screenshots are captured
- [ ] `.claude/settings.json` and `.claude/hooks/` files are committed and visible in the GitHub repository


