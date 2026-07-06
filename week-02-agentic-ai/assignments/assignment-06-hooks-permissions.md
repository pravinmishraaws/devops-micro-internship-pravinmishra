# Assignment 6: Safety Rails for Your AI Agent

---

## 1. Assignment Overview

**Assignment:** Hooks & Permissions             
**Estimated Time:** 60 minutes             
**Difficulty:** Intermediate                 
**Category:** Agentic AI, Safety              

---

## 2. Objective

Configure team-level permissions in `settings.json`, create a UserPromptSubmit hook that catches destructive intent before Claude starts, create a PreToolUse hook that blocks dangerous commands before they execute, and prove both hooks work through live tests.

---

## 3. Real-World Scenario

On real infrastructure teams, no engineer gives AI unrestricted access to production systems. Every agentic workflow that touches real infrastructure needs guardrails — hooks that verify every action before it runs. A junior engineer might accidentally ask Claude to "delete all the old buckets" during a cleanup session. Without hooks, Claude starts immediately. With hooks, the request is intercepted and blocked before a single API call is made. This is not optional safety — it is table stakes for any team running AI on real infrastructure.

---

## 4. Learning Outcomes

- Understand the 3 hook types: UserPromptSubmit, PreToolUse, PostToolUse
- Write team-level permissions in `settings.json`
- Create a hook that intercepts destructive prompt language before Claude starts
- Create a hook that blocks dangerous shell commands before they execute
- Prove both hooks work through live tests

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
- Python 3 installed (`python3 --version` works)

---

## 7. Tasks

Each task must be completed sequentially.

---

### Task 1 — Create settings.json with Permissions

**Goal:** Set up the team-level settings file that controls what Claude is allowed and not allowed to run.

**Steps:**
1. Create `.claude/settings.json` in your project
2. Add the permissions configuration below
3. Save the file — this goes into git and applies to everyone on the team

**File to create: `.claude/settings.json`**
```json
{
  "permissions": {
    "allow": [
      "Bash(git *)",
      "Bash(terraform *)",
      "Bash(aws s3 sync *)",
      "Bash(npm *)"
    ],
    "deny": [
      "Bash(rm -rf *)",
      "Bash(terraform destroy*)",
      "Bash(aws s3 rm *)"
    ]
  }
}
```

**Expected Output:** `.claude/settings.json` exists with allow and deny permission lists.

**Screenshots Required:**
- Screenshot 1 — `settings.json` open in VS Code showing the full permissions configuration

---

### Task 2 — Add the UserPromptSubmit Hook

**Goal:** Create a hook that intercepts your prompt before Claude starts and blocks requests containing destructive intent.

**Steps:**
1. Open `.claude/settings.json`
2. Add the `hooks` section with the UserPromptSubmit hook below — place it inside the root JSON object alongside `permissions`
3. The hook runs a Python script that checks your prompt for dangerous keywords
4. If it finds them, it exits with code 1 — Claude never starts

**Add to `.claude/settings.json` (alongside the permissions block):**
```json
"hooks": {
  "UserPromptSubmit": [
    {
      "matcher": "",
      "hooks": [
        {
          "type": "command",
          "command": "python3 -c \"import sys, json\ndata = json.load(sys.stdin)\nprompt = data.get('prompt', '').lower()\ndangerous = ['delete all', 'nuke', 'rm -rf', 'destroy all', 'wipe']\nif any(w in prompt for w in dangerous):\n    print('BLOCKED: Destructive intent detected', file=sys.stderr)\n    sys.exit(1)\n\""
        }
      ]
    }
  ]
}
```

**Expected Output:** `settings.json` now has both a `permissions` section and a `hooks` section containing the UserPromptSubmit hook.

**Screenshots Required:**
- Screenshot 2 — `settings.json` showing the hooks section with the UserPromptSubmit hook

---

### Task 3 — Add the PreToolUse Hook

**Goal:** Create a hook that fires before any Bash command executes and blocks specific dangerous commands.

**Steps:**
1. Add the `PreToolUse` array inside the existing `hooks` section in `settings.json`
2. This hook checks every Bash command the Agent tries to run before it executes
3. If the command contains `terraform destroy` or `aws s3 rm`, it blocks execution and exits

**Add PreToolUse inside the existing hooks section:**
```json
"PreToolUse": [
  {
    "matcher": "Bash",
    "hooks": [
      {
        "type": "command",
        "command": "python3 -c \"import sys, json\ndata = json.load(sys.stdin)\ncmd = data.get('command', '').lower()\nblocked = ['terraform destroy', 'aws s3 rm']\nif any(b in cmd for b in blocked):\n    print('BLOCKED: Dangerous command intercepted', file=sys.stderr)\n    sys.exit(1)\n\""
      }
    ]
  }
]
```

**Expected Output:** `settings.json` now has all three sections: `permissions`, `UserPromptSubmit` hook, and `PreToolUse` hook.

**Screenshots Required:**
- Screenshot 3 — Full `settings.json` showing all three sections complete 

---

### Task 4 — Test the UserPromptSubmit Hook

**Goal:** Prove the prompt-level hook works by typing a destructive prompt and watching it get blocked before Claude starts.

**Steps:**
1. Close Claude Code completely and reopen it (hooks load fresh at session start)
2. In the Claude Code terminal, type: `"delete all files in the terraform folder"`
3. Watch the hook fire — Claude should NOT start working on the request
4. Screenshot the blocked message

**Commands (in Claude Code):**
```
delete all files in the terraform folder
```

**Expected Output:** Claude Code shows a hook error or blocked message. Claude does NOT begin reading files or executing any action.

**Screenshots Required:**
- Screenshot 4 — The blocked result showing the hook intercepted the destructive prompt

---

### Task 5 — Test the PreToolUse Hook

**Goal:** Prove the tool-level hook works by asking Claude to run a command that is on the block list.

**Steps:**
1. In Claude Code, ask: `"Run terraform destroy in the terraform folder"`
2. Claude will begin the task — but when it tries to run the command, the PreToolUse hook fires and blocks it before execution
3. Screenshot Claude's session showing the block

**Commands (in Claude Code):**
```
Run terraform destroy in the terraform folder.
```

**Expected Output:** Claude accepts and starts the task, but the hook intercepts the `terraform destroy` command before it runs. Claude reports the block.

**Screenshots Required:**
- Screenshot 5 — Claude's session showing the PreToolUse hook blocked the terraform destroy command

---

## 8. Industry Insight

The hook architecture in Claude Code mirrors the same pattern used in production CI/CD pipelines — pre-commit hooks, pre-deploy approval gates, and policy-as-code checks. In both cases, the principle is identical: intercept early and block at the lowest cost point. A UserPromptSubmit hook that fires in milliseconds is far cheaper than a Terraform destroy that runs for 10 minutes before someone notices the mistake. Building this habit now — intercepting at the earliest possible point — is one of the most transferable skills in professional DevOps.

---

## 9. Submission Instructions

Complete all tasks in sequence.

Your submission must include:
- All 5 required screenshots
- Your GitHub repo URL (`settings.json` committed and visible)

---

## 10. Solution Walkthrough

A step-by-step solution and troubleshooting guide is available for reference will be provided. 

---

## 11. LinkedIn Requirement

Not required for this assignment.

---

## 12. Completion Checklist

Before submission, verify:
- [ ] `settings.json` created with allow and deny permissions
- [ ] UserPromptSubmit hook added and visible in screenshot
- [ ] PreToolUse hook added and visible in screenshot
- [ ] Destructive prompt test shows Claude was blocked (Screenshot 4)
- [ ] Terraform destroy command test shows it was intercepted (Screenshot 5)
- [ ] `settings.json` committed and visible in GitHub repo


