# How to Fork & Submit Your Assignments

## What You're Looking At

This is the **official DevOps Micro Internship repository** by Pravin Mishra.

**Week 0** is submitted via Google Form (selection assignment — before you join the program).

**From Week 1 onwards**, all assignments are submitted via GitHub. You create your own personal copy of this repo — called a **fork** — and work there. Your fork is yours. Every assignment you submit lives in your fork.

---

## Step 1 — Fork This Repo

1. Make sure you are logged into your GitHub account
2. Go to: https://github.com/pravinmishraaws/devops-micro-internship-pravinmishra
3. Click the **Fork** button at the top-right
4. Under "Owner", select **your GitHub username**
5. Keep the repo name as `devops-micro-internship-pravinmishra`
6. Click **Create fork**

You now have your own copy at:
```
https://github.com/YOUR-USERNAME/devops-micro-internship-pravinmishra
```

---

## Step 2 — Clone It to Your Computer

Open your terminal and run:

```bash
git clone https://github.com/YOUR-USERNAME/devops-micro-internship-pravinmishra
cd devops-micro-internship-pravinmishra
```

---

## Step 3 — Fill In Your Details

Open `README.md` and update the **About Me** section with your:
- Name
- LinkedIn profile URL
- Location
- Background
- Goal

---

## Step 4 — Complete Your Weekly Assignment

1. Open the folder for the current week (e.g. `week-03-linux-and-bash-for-devops/`)
2. Open each `assignment-XX-*.md` file inside that folder (e.g. `assignment-01-....md`)
3. Fill in your answers where you see "Add your screenshot here" and other placeholder text
4. Add your screenshots to the `screenshots/` folder inside that week
5. Update the progress table in the main `README.md`:
   - Change ⬜ to 🔄 when you start
   - Change 🔄 to ✅ when you finish
   - Paste your LinkedIn post URL in the LinkedIn Post column

> **Week 02 only:** `week-02-agentic-ai/assignment-briefs/` holds the detailed assignment briefs (scenario, objective, learning outcomes) and `week-02-agentic-ai/assignment-solutions/` holds a fully worked example for reference — your own answers still go in the `assignment-XX-*.md` files in the week folder root.

---

## Step 5 — Push Your Changes

```bash
git add .
git commit -m "Week 03 - Linux for DevOps assignment"
git push
```

---

## Step 6 — Submit

Paste your **forked repo URL** into the Google Form submission link shared in the Discord / live session.

```
https://github.com/YOUR-USERNAME/devops-micro-internship-pravinmishra
```

---

## How to Sync Updates from the Original Repo

When Pravin updates this repo (new weeks, corrections, new content), you can pull those updates into your fork:

```bash
# Do this once to link the original repo
git remote add upstream https://github.com/pravinmishraaws/devops-micro-internship-pravinmishra

# Each time you want to sync
git fetch upstream
git merge upstream/main
git push
```

---

## What Your Repo Looks Like vs. The Original

| | **Pravin's Repo (this one)** | **Your Fork** |
|---|---|---|
| README.md | Placeholder — "Your Name" | Filled with your real details |
| Week folders | Empty templates | Your actual answers + screenshots |
| Progress table | All ⬜ Not Started | Updates as you complete weeks |
| Achievements | Empty | Your Champion badges & rank |
| Stack badges | All commented out | Uncommented as you earn them |

---

## Rules

- Every screenshot must show **your name or username** — no copying from others
- Each week's LinkedIn post must include the credit line (see each week's assignment-*.md files)
- Submit before the deadline shared in the live session

---

> Questions? Ask in the Discord: https://discord.pravinmishra.com?utm_source=github&utm_medium=readme
