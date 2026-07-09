# Assignment 7 — A Claude That Remembers

## 1. Prerequisites Checklist

Before you begin, ensure you have the following:

- Assignment 2 completed (`CLAUDE.md` in place)
- Claude Code installed and working
- VS Code opened with your portfolio project
- Git configured and repository initialized

Your project should contain:

```

CLAUDE.md
index.html
style.css
images/
README.md
terraform/

```

---

# 2. Step-by-Step Solution

---

## Step 1 — Start Claude Code

1. Open your project in VS Code.

![project](./images/ss267.png)

2. Open Git Bash terminal.

![terminal](./images/ss268.png)

3. Start Claude Code:

```bash
claude
```

![claude](./images/ss269.png)

---

# Step 2 — Find the Memory File Location

### Goal:

Identify where Claude Code stores project memory.

1. Ask Claude the following question:

```
Where does your memory file live for this project? Show me the full path.
```

![memory path prompt](./images/ss270.png)

2. Claude will provide the location of the memory file.

Example:

```
~/.claude/projects/<encoded-project-path>/memory/MEMORY.md
```

![memory path response](./images/ss271.png)

3. Navigate to the memory file location.

For example:

```bash
cd ~/.claude/projects/
```

Navigate through the folders until you find:

```
memory/MEMORY.md
```

![memory file](./images/ss273.png)

> The file may be empty if no memory has been created yet. This is expected.

---

# Step 3 — Add Information to Claude Memory

### Goal:

Store project-specific information that Claude can recall in future sessions.

1. In Claude Code, provide the following prompt:

```
Remember the following for all future sessions: The CSS hero section uses a dark gradient from #1a1a2e to #16213e. The mobile breakpoints are 900px, 768px, and 600px. Never suggest adding JavaScript to this project. Save this to your memory file now.
```

![memory prompt](./images/ss272.png)

2. Claude will update the memory file.

![memory saved](./images/ss274.png)

3. Open `MEMORY.md` in VS Code.

- Go to the location of memory.md file
- Right click the MEMORy folder
- Select `Open with code`

![memory saved](./images/ss275.png)

- Review the contents of the memory.md file
- New file called `design_constraints.md` has been created and it is mentioned in the memory.md file as well. It contains the details we mentioned to claude code. 

![memory content](./images/ss276.png)

![memory content](./images/ss277.png)

---

# Step 4 — Close Claude Code Session Completely

### Goal:

Start a completely new session to prove memory persistence.

1. Exit Claude Code:

```
/exit
```

![exit](./images/ss278.png)

2. Close VS Code completely.

![exit](./images/ss279.png)

3. Wait a few seconds (30s)

4. Reopen VS Code.

5. Open the same project folder.

6. Start Claude Code again:

```bash
claude
```

![new session](./images/ss280.png)

The new session should not contain the previous conversation.

---

# Step 5 — Test Memory Recall

### Goal:

Verify Claude remembers previous information without being told again.

---

## Test 1 — Recall Hero Colors

Ask:

```
What colors are used in the hero section of this project?
```

![hero question](./images/ss281.png)

Expected response:

Claude should mention:

```
#1a1a2e
#16213e
```

without you providing the information again.

![hero recall](./images/ss282.png)

---

## Test 2 — Recall Mobile Breakpoints

Ask:

```
What are the mobile breakpoints for this project?
```

![breakpoint question](./images/ss283.png)

Expected response:

Claude should recall:

```
900px
768px
600px
```

![breakpoint question](./images/ss284.png)

---

## Test 3 — Verify Memory Rule Enforcement

Ask:

```
Should I add a JavaScript animation to the hero section?
```

![javascript question](./images/ss285.png)

Expected response:

Claude should warn against adding JavaScript because the memory states:

```
Never suggest adding JavaScript to this project.
```

![javascript response](./images/ss286.png)

---

# Step 6 — Commit and Push Changes

1. Open regular terminal

2. Run git status command:

```bash
git status
```

![ss6](./images/ss287.png)

3. Add this folder and file to .gitignore and save the .gitignore file

```
.claude/agent-memory/
.claude/deploy.log
```

![ss6](./images/ss288.png)


4. Run `git status` again and verify files that added to .gitignore are not appear in `Untracked files:` section.

![ss6](./images/ss289.png)

5. Add other files to the staging area:

```bash
git add .
```

![ss6](./images/ss290.png)

6. Commit the changes:

```bash
git commit -m "Add Claude memory demonstration"
```

![ss6](./images/ss291.png)

7. Push the changes to GitHub repository

```bash
git push origin main
```

![ss6](./images/ss292.png)

8. Open your GitHub account in the browser.

![ss6](./images/ss293.png)

9. Navigate to the forked repository

![ss6](./images/ss294.png)

10. Navigate to .claude folder

11. Verify the changes have been updated

![ss6](./images/ss294.png)

---

# 3. Required Screenshots

---

## Screenshot 1 — Memory file path shown by Claude

![ss1](./images/ss271.png)

---

## Screenshot 2 — Claude confirming the memory was saved

![ss2](./images/ss274.png)

---

## Screenshot 3 — The `MEMORY.md` file open in VS Code showing the saved content

![ss3](./images/ss276.png)

![ss3](./images/ss277.png)

---

## Screenshot 4 — VS Code reopened with a fresh Claude Code session showing no previous conversation

![ss4](./images/ss280.png)

---

## Screenshot 5 — Claude recalling hero section colors

![ss5](./images/ss282.png)

---

## Screenshot 6 — Claude refusing JavaScript request based on memory rule

![ss6](./images/ss286.png)

---

# 5. Troubleshooting

---

## Issue 1 — Claude Does Not Remember Previous Information

Solution:

1. Confirm `MEMORY.md` contains the information.

2. Close Claude Code completely.

3. Start a new session:

```bash
claude
```

4. Test again.

---

## Issue 2 — MEMORY.md Cannot Be Found

Solution:

Ask Claude:

```
Where does your memory file live for this project? Show me the full path.
```

Claude will provide the correct location.

---

## Issue 3 — Memory Was Not Saved

Solution:

Repeat the memory prompt and explicitly ask:

```
Save this information to your memory file now.
```

---

# 6. Completion Checklist

Before submission, verify:

* [ ] Memory file location identified
* [ ] Memory entry created successfully
* [ ] MEMORY.md contains the three required facts
* [ ] Claude Code session completely closed
* [ ] New session started successfully
* [ ] Claude recalled hero colors
* [ ] Claude recalled mobile breakpoints
* [ ] Claude followed the JavaScript restriction
* [ ] All 6 screenshots captured
* [ ] Changes pushed to GitHub


