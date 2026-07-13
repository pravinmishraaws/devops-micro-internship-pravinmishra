# Assignment 5: Connecting Claude to the Outside World

---

## 1. Assignment Overview

**Assignment:** MCP Servers          
**Estimated Time:** 60 minutes            
**Difficulty:** Intermediate             
**Category:** Agentic AI, MCP              

---

## 2. Objective

Understand why MCP exists, configure the GitHub MCP server in `.mcp.json`, store credentials securely in `settings.local.json`, verify the connection with `/mcp`, and run a live query that proves Claude is working with real external data — not training data.

---

## 3. Real-World Scenario

Without MCP, Claude works from training data — which can be months old and knows nothing about your actual accounts, your real repositories, or your live infrastructure. MCP changes this fundamentally. It connects Claude directly to external services so every answer is grounded in real, live data. Production teams connect Claude Code to GitHub for PR reviews, to AWS for live resource queries, and to databases for real analytics — all through MCP. This assignment sets up your first live external connection.

---

## 4. Learning Outcomes

- Understand what MCP (Model Context Protocol) is and why it exists
- Create and configure `.mcp.json` for a project-scoped MCP server
- Understand the difference between `.mcp.json` (team config) and `settings.local.json` (personal credentials)
- Connect the GitHub MCP server and verify with `/mcp`
- Prove live data access with a real GitHub query

---

## 5. Important Instructions (Global Rules)

**Key Rules:**
- Full name must be visible in required screenshots
- Do **not** expose your GitHub token in any screenshot — blur or hide the token value
- Do not expose sensitive information (keys, passwords, account IDs)
- Follow screenshot requirements exactly as specified in tasks
- Submission must clearly match task outputs
- Missing or incorrect proof may result in rejection

---

## 6. Prerequisites

- Assignment 2 completed (CLAUDE.md in place)
- GitHub account with the forked repository from Assignment 1
- Node.js and npm installed

---

## 7. Tasks

Each task must be completed sequentially.

---

### Task 1 — Create a GitHub Personal Access Token

**Goal:** Generate a GitHub PAT that the MCP server will use to authenticate with your GitHub account.

**Steps:**
1. Go to GitHub → **Settings** → **Developer Settings** → **Personal Access Tokens** → **Tokens (classic)**
2. Click **Generate new token (classic)**
3. Set name: `Claude Code MCP - DMI`
4. Set expiry: 30 days
5. Select scopes: `repo`, `read:user`
6. Click **Generate token**
7. Copy the token immediately — GitHub will not show it again

**Important:** Do NOT screenshot the token value itself. Only screenshot the scope selection page.

**Expected Output:** A GitHub token starting with `ghp_...`

**Screenshots Required:**
- Screenshot 1 — GitHub token creation page showing the selected scopes (`repo`, `read:user`) — token value must NOT be visible

---

### Task 2 — Create .mcp.json at the Project Root

**Goal:** Set up the MCP server configuration file that Claude Code reads at startup.

**Steps:**
1. In VS Code, create a new file at the project root named `.mcp.json`
2. Add the GitHub MCP server configuration exactly as shown below
3. Save the file

**File to create: `.mcp.json` (project root)**
```json
{
  "mcpServers": {
    "github": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-github"],
      "env": {}
    }
  }
}
```

**Expected Output:** `.mcp.json` exists at the project root with the GitHub server configuration.

**Screenshots Required:**
- Screenshot 2 — `.mcp.json` open in VS Code showing the full configuration

---

### Task 3 — Add Your Token to settings.local.json

**Goal:** Store your GitHub token in the local credentials file — gitignored, never committed, never shared.

**Steps:**
1. Open `.claude/settings.local.json` (create it if it does not exist)
2. Add the GitHub token and enable the server as shown below
3. Save the file
4. Confirm `.claude/settings.local.json` is listed in your `.gitignore` — it must never be committed

**Content for `.claude/settings.local.json`:**
```json
{
  "env": {
    "GITHUB_PERSONAL_ACCESS_TOKEN": "your_token_here"
  },
  "enabledMcpjsonServers": ["github"]
}
```

**Expected Output:** `settings.local.json` has the token in the `env` section and `github` listed in `enabledMcpjsonServers`.

**Screenshots Required:**
- Screenshot 3 — `settings.local.json` open in VS Code showing the `env` section — **blur or cover the actual GitHub token value**

---

### Task 4 — Verify the Connection with /mcp

**Goal:** Confirm the GitHub MCP server is connected and ready. 

**Steps:**
1. Close Claude Code completely and reopen it (so it picks up the new `.mcp.json`)
2. In the Claude Code terminal, type `/mcp`
3. Check that `github` shows as **connected**

**Commands (in Claude Code):**
```
/mcp
```

**Expected Output:** `/mcp` output shows `github` server with status `connected`.

**Screenshots Required:**
- Screenshot 4 — `/mcp` output showing `github: connected`

---

## Task 5 — Run a Live GitHub Query

**Goal:** Prove the MCP connection works by asking Claude to retrieve real data from GitHub using the GitHub MCP server.

**Steps:**

1. In Claude Code, run the following prompt:

```

Use GitHub MCP to get the README.md file from <your-github-username>/Ultimate-Agentic-DevOps-with-Claude-Code

```

2. Watch Claude call the GitHub MCP tool to retrieve the README.md file from the GitHub repository.

3. Verify that Claude's response contains the actual README.md content from GitHub.

**Expected Output:**

- Claude calls the GitHub MCP server and retrieves the README.md content from the live GitHub repository.
- The response should include the actual repository content fetched from GitHub — not guessed information from Claude's training data.
- You can verify the retrieved content by navigating to the same README.md file in your GitHub repository and comparing it with Claude's response.

**Screenshots Required:**

* Screenshot 5 — Claude's response showing the GitHub MCP tool call and the retrieved README.md content.

---

## 8. Industry Insight

MCP is an open standard — Anthropic created it but anyone can build on top of it. This means the same integration pattern you used for GitHub works identically for hundreds of other tools: Sentry for production errors, PostgreSQL for database queries, Jira for ticket management, Notion for documentation. Once you understand how to configure and verify one MCP server, every other server follows exactly the same pattern. The investment you make here pays off across every agentic tool you use in your career.

---

## 9. Submission Instructions

Complete all tasks in sequence.

Your submission must include:
- All 5 required screenshots
- A note confirming `settings.local.json` is in your `.gitignore`
- Your GitHub repo URL (`.mcp.json` committed and visible, `settings.local.json` NOT committed)

---

## 10. Solution Walkthrough

A step-by-step solution and troubleshooting guide is available for reference:
Full solution walkthrough → [Click here](../Solutions_walkthrough/assignment-05-mcp.md)

---

## 11. LinkedIn Requirement

Not required for this assignment.

---

## 12. Completion Checklist

Before submission, verify:
- [-] GitHub PAT created with correct scopes (`repo`, `read:user`)
- [-] `.mcp.json` at project root with GitHub server configured
- [-] `settings.local.json` has the token — token value blurred in screenshot
- [-] `settings.local.json` is gitignored and NOT committed
- [-] `/mcp` shows `github: connected`
- [-] Live GitHub query returned real repository data
- [-] `.mcp.json` committed and visible in GitHub repo

