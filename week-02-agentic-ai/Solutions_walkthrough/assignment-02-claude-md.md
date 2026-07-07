# Assignment 2 — Teaching Claude Your Project

## 1. Prerequisites Checklist

Before you begin, ensure you have the following:

- Assignment 1 completed
- Claude Code running inside your portfolio project
- VS Code opened with the portfolio project
- No `CLAUDE.md` file exists in the project root

Your project should contain only the following files and folders:

```
index.html
style.css
images/
README.md
privacy.html 
terms.html
```

![project folder](./images/ss67.png)

If a `CLAUDE.md` file already exists, delete it before starting this assignment.

---

## 2. Step-by-Step Solution

---
### Step 0 - Commit the deleted files in first assignment.

1. Open your portfolio project in VS Code.

![project](./images/ss46.png)

2. Verify that there is **no `CLAUDE.md`** file.

![project](./images/ss67.png)

3. Open the git bash terminal.

![terminal](./images/ss68.png)

![terminal](./images/ss69.png)

4. Check the status

```bash
git status
```
![project folder](./images/ss73.png)

5. Confirm the directory, Stage the changes and commit them

```bash
pwd
git add .
git commit -m "Deleted claude related files"
```

![project folder](./images/ss74.png)

### Step 1 — Start claue code in your terminal

1. Start Claude Code.

```bash
claude
```

![claude](./images/ss70.png)

Output:

![claude](./images/ss71.png)

2. Ask Claude the following question:

Copy and paste this prompt, press `Enter`

```
What is this project and how should I deploy it?
```

![prompt](./images/ss72.png)

3. Claude gives a generic response because it only sees the HTML and CSS files. 

![response](./images/ss75.png)

![response](./images/ss76.png)

![response](./images/ss77.png)

---

### Step 2 — Generate the Initial CLAUDE.md

1. In the Claude terminal, run:

```
/init
```

![init](./images/ss78.png)

2. Select `Project CLAUDE.md` and press `Enter` (It may display another sugession for you to confirm)

![init](./images/ss79.png)

3. If prompted to this, select this option and press `Enter`

![init](./images/ss80.png)

4. Provide approval

![init](./images/ss81.png)

5. If prompted to this, select this option and press `Enter`

![init](./images/ss82.png)

![init](./images/ss83.png)

Use arrow keys and navigate to `submit` then press `1` to confirm

![init](./images/ss84.png)

6. Select `yes` and press `Enter`

![init](./images/ss85.png)

7. Claude scans the project and generated a `CLAUDE.md` file.

8. Open the generated `CLAUDE.md` in VS Code.

![claudemd](./images/ss86.png)

![claudemd](./images/ss87.png)

![claudemd](./images/ss88.png)

---

### Step 3 — Customize CLAUDE.md

Open `CLAUDE.md` and replace or update the contents.

Update the **Project Overview** section.

```text
## Project Overview

Static HTML/CSS portfolio website deployed to AWS using S3 and CloudFront, provisioned with Terraform, and automated via GitHub Actions.
```

Update the **Architecture** section.

```text
## Architecture

- Pure HTML5 and CSS3
- No JavaScript
- No build step
- No framework
```

Add a **Commands** section.

```text
## Commands

- terraform init
- terraform plan
- terraform apply
```

Add a **Conventions** section.

```text
## Conventions

- All infrastructure changes go through Terraform — never modify AWS resources manually
- No JavaScript in this project
- CSS uses mobile-first approach with breakpoints at 900px, 768px, and 600px
```

Add a **Safety** section.

```text
## Safety

Never put secrets in this file. No API keys, passwords, or AWS credentials.
```

Save the file.

![claudemd](./images/ss89.png)

![claudemd](./images/ss94.png)

---

### Step 4 — Test That CLAUDE.md Changes Claude's Behaviour

1. Close the current Claude Code session. (Right click and kill terminal)

![newsession](./images/ss90.png)

2. Open a **new Claude Code session**.

```bash
claude
```

![newsession](./images/ss91.png)

![newsession](./images/ss92.png)

![newsession](./images/ss93.png)

---

#### Test 1

* Copy and paste this in the claude code terminal session.

```
What is this project and how should I deploy it?
```

![prompt](./images/ss95.png)

Claude now provides a much more specific answer because it has read your `CLAUDE.md`.

![prompt](./images/ss96.png)

It should mention:

- S3
- CloudFront
- Terraform
- GitHub Actions

---

#### Test 2

* Copy and paste this in the claude code terminal session

```
Add a React component to the homepage.
```

![react](./images/ss97.png)

Claude should refuse or warn against adding React because your project conventions explicitly state:

- No JavaScript
- No framework

![response](./images/ss98.png)

---

### Step 5 — Commit and Push Your Changes

1. Verify your Git status.

```bash
git status
```

2. Stage the changes.

```bash
git add CLAUDE.md
```

3. Commit the changes.

```bash
git commit -m "Add project-specific CLAUDE.md"
```

4. Push the changes.

```bash
git push origin main
```

> If your default branch is `master`, replace `main` with `master`.

![push](./images/ss99.png)

![push](./images/ss100.png)

5. Open your GitHub repository and verify that `CLAUDE.md` appears in the repository.

![github](./images/ss101.png)

![github](./images/ss102.png)

![github](./images/ss103.png)

---

## 3. Required Screenshots

*(Split into multiple screenshots if the file does not fit on one screen.)*

### Screenshot 1 — Claude’s generic response before CLAUDE.md exists (project contains only `index.html`, `style.css`, `images/`, `README.MD`, `privacy.html`, `terms.html`)


![response](./images/ss75.png)

![response](./images/ss76.png)

![response](./images/ss77.png)

---

### Screenshot 2 — The auto-generated CLAUDE.md open in VS Code showing its content

![claudemd](./images/ss86.png)

![claudemd](./images/ss87.png)

![claudemd](./images/ss88.png)
---

### Screenshot 3 — Customized CLAUDE.md showing all five sections

![claudemd](./images/ss89.png)

---

### Screenshot 4 — Claude's specific, detailed answer after reading CLAUDE.md (Claude mentioning S3, CloudFront and Terraform)

![ss4](./images/ss96.png)

---

### Screenshot 5 — Screenshot 5 — Claude refusing or warning against adding React because of the "No JavaScript" convention defined in CLAUDE.md

![ss5](./images/ss98.png)

---

### Screenshot 6 — `CLAUDE.md` visible in your GitHub repository after pushing the commit

![ss6](./images/ss102.png)