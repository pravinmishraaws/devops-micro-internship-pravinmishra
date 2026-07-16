# Assignment 5 — Connecting Claude to the Outside World

## 1. Prerequisites Checklist

Before you begin, ensure you have the following:

* Assignment 4 completed
* Claude Code installed and working
* VS Code opened with your project
* GitHub account available
* Forked GitHub repository from Assignment 1
* Node.js and npm installed
* `.claude/` folder available in your project root
* `.gitignore` file available in your project

---

# 2. Step-by-Step Solution

---

# Step 1 — Create a GitHub Personal Access Token (PAT)

## 1. Open GitHub settings.

Navigate to:

```

GitHub → Profile Picture → Settings

```

![github settings](./images/ss178.png)


## 2. Navigate to Developer Settings.

1. Scroll down until you find `Developer Settings`

![github settings](./images/ss179.png)

2. Select `Personal access token` then click on the dropdown menu

![github settings](./images/ss180.png)

3. Select classic token

![github settings](./images/ss181.png)


## 3. Generate a new token.

1. Click `Generate new token` button

2. Select `Generate new token (classic)`

![generate token](./images/ss182.png)

## 4. Configure token details.

Set:

Token name:

```

Claude Code MCP - DMI

```

Expiration:

```

30 days

```

![token scopes](./images/ss183.png)


Select the following scopes:

```

repo
read:user

```

![token scopes](./images/ss184.png)


![token scopes](./images/ss185.png)


## 5. Generate and copy the token.

Click:

```

Generate token

```

![token scopes](./images/ss186.png)


Copy the token immediately.

![token scopes](./images/ss187.png)

**Important:**

- Do not share this token.
- Do not commit this token to GitHub.
- Do not include the token value in screenshots.

---

# Step 2 — Create `.mcp.json` Configuration File

## 1. Open your project in VS Code.

![project](./images/ss188.png)


## 2. Create `.mcp.json` at the project root.

![mcp file](./images/ss189.png)


## 3. Add the GitHub MCP server configuration.

Open:

```

.mcp.json

````

![mcp file](./images/ss190.png)


Add:

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


![mcp configuration](./images/ss191.png)

## 4. Save the file.

![mcp configuration](./images/ss192.png)

---

# Step 3 — Configure GitHub Token in settings.local.json

## 1. Create the `.claude/settings.local.json`

- Open git bash terminal

- Run this command

```bash
touch .claude/settings.local.json
```

![mcp configuration](./images/ss193.png)

- Confirm the `.claude/settings.local.json` is created from the VS Code explorer
- Expand the .claude folder and check it

![mcp configuration](./images/ss194.png)


## 2. Add the GitHub token configuration.

- Open the `.claude/settings.local.json` in VS Code editor

Add:

```json
{
  "env": {
    "GITHUB_PERSONAL_ACCESS_TOKEN": "your_token_here"
  },
  "enabledMcpjsonServers": ["github"]
}
```

Replace:

```
your_token_here
```

with your actual GitHub Personal Access Token.

![settings configuration](./images/ss195.png)

- Save the file.

**Important:**

* Blur or hide the token value before taking screenshots.
* Never commit this file to GitHub.

---

# Step 4 — Add settings.local.json to .gitignore

## 1. Open `.gitignore` in VS Code editor

- Add the following entry.

```
.claude/settings.local.json
```

- Save the file

![gitignore](./images/ss196.png)

## 2. Confirm Git will ignore the file.

- Open git bash terminal

Run:

```bash
git status
```

Verify that:

```
.claude/settings.local.json
```

does not appear as an untracked file.

![git status](./images/ss197.png)

---

# Step 5 — Restart Claude Code and Verify MCP Connection

## 1. Close Claude Code completely.

- Select the current Claude Code session.
- Right click and select `Kill terminal`

![git status](./images/ss198.png)

---

## 2. Reopen Claude Code.

Run:

```bash
claude
```

![claude start](./images/ss199.png)

Claude Code will load the `.mcp.json` configuration.

---

## 3. Check MCP server status.

Inside Claude Code, run:

```
/mcp
```

![mcp command](./images/ss200.png)

## 4. Verify the GitHub MCP connection.

Expected output:

```
github: connected
```

![mcp connected](./images/ss201.png)

- Press `Esc` to exit

---

# Step 6 — Run a Live GitHub Query

## 1. Ask Claude to retrieve GitHub repositories.

Enter:

```
Use GitHub MCP to get the README.md file from <your-github-username>/Ultimate-Agentic-DevOps-with-Claude-Code

```

![github query](./images/ss206.png)


## 2. Observe MCP tool usage.

Claude should use the GitHub MCP server to retrieve information from your GitHub account.

![github query](./images/ss204.png)

![mcp response](./images/ss205.png)


## 3. Go to your GitHub account and verify README.md of your fork of Ultimate-Agentic-DevOps-with-Claude-Code has the same content

- Go to your GitHub repository
- Navigate to the forked repository - Ultimate-Agentic-DevOps-with-Claude-Code

![github query](./images/ss213.png)

- Open the repository and navigate to README.md file

![github query](./images/ss214.png)

- Go to `Raw` and right click

![github query](./images/ss215.png)

- Select `Open link in new tab`

![github query](./images/ss216.png)

- Compare the content with the output you got in step 6

![github query](./images/ss217.png)

- Output from GitHub Query in step 6

![github query](./images/ss204.png)

![mcp response](./images/ss205.png)

---

# Step 7 — Commit `.mcp.json` to GitHub

## 1. Check Git status.

- Open a regular terminal

![mcp response](./images/ss207.png)

Run:

```bash
git status
```

You should see:

```
.mcp.json
```

as a new file.

![git status mcp](./images/ss208.png)

## 2. Add and commit the file.

Run:

```bash
git add .mcp.json
git add .gitignore
git add .claude/agents/
```

![commit mcp](./images/ss209.png)

## 3. Commit and push changes.

Run:

```bash
git commit -m "Add Claude agent configurations and GitHub MCP server configuration"
git push origin main
```

![push mcp](./images/ss210.png)

## 4. Go to your GitHub account and check if the changes were added

![push mcp](./images/ss211.png)

![push mcp](./images/ss212.png)

---

# 4. Required Screenshots

---

## Screenshot 1 — GitHub token creation page showing selected scopes

![token scopes](./images/ss184.png)


![token scopes](./images/ss185.png)

---

## Screenshot 2 — `.mcp.json` open in VS Code showing GitHub MCP configuration

![mcp configuration](./images/ss191.png)

---

## Screenshot 3 — `settings.local.json` showing env section

**Token value must be hidden or blurred.**

![ss3](./images/ss195.png)

---

## Screenshot 4 — `/mcp` output showing GitHub server connected

![mcp connected](./images/ss201.png)

---

## Screenshot 5 — Claude's response showing the GitHub MCP tool call and the retrieved README.md content.

![github query](./images/ss204.png)

![mcp response](./images/ss205.png)

---

# 5. Important Security Notes

* GitHub Personal Access Tokens are sensitive credentials.
* Never commit `settings.local.json`.
* Never share your PAT in screenshots or messages.
* `.mcp.json` should be committed because it only contains the MCP server configuration.
* `settings.local.json` should remain local because it contains your personal credentials.

---

# 6. Completion Checklist

Before submission, verify:

* [ ] GitHub PAT created with `repo` and `read:user` scopes
* [ ] `.mcp.json` created at project root
* [ ] GitHub MCP server configuration added
* [ ] `settings.local.json` contains GitHub token
* [ ] Token value hidden in screenshots
* [ ] `settings.local.json` added to `.gitignore`
* [ ] `/mcp` shows `github: connected`
* [ ] Live GitHub query returned real repository data
* [ ] `.mcp.json` committed and visible in GitHub repository
* [ ] `settings.local.json` is NOT committed


