# Assignment 7: A Claude That Remembers

---

## 1. Assignment Overview

**Assignment:** Memory               
**Estimated Time:** 45 minutes          
**Difficulty:** Intermediate                
**Category:** Agentic AI, Memory               

---

## 2. Objective

Understand how auto-memory works and where the memory file lives, write a structured memory entry, close the session completely, and prove in a brand new session that Claude recalls the information — without being told again.

---

## 3. Real-World Scenario

Every time you open a new Claude Code session, Claude starts completely fresh — no memory of what you discussed, decided, or instructed before. On a real project that runs for months, this is a serious problem. Team conventions get forgotten. Architectural decisions have to be re-explained. Mistakes get repeated. The memory system solves this: engineers use it to store the decisions, patterns, and rules that should carry across every session — so the AI learns the project the same way a long-tenured team member does.

---

## 4. Learning Outcomes

- Understand where Claude Code stores memory and how it loads automatically at session start
- Distinguish between project-level memory (shared across all sessions) and agent memory (per-subagent)
- Write a structured memory entry with actionable information
- Prove memory persists across a complete session close and reopen
- Understand the 200-line limit and why concise memory entries matter

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

- Assignment 2 completed (CLAUDE.md in place)
- Claude Code running in the portfolio project

---

## 7. Tasks

Each task must be completed sequentially.

---

### Task 1 — Find the Memory File Location

**Goal:** Discover exactly where Claude Code stores memory for this project.

**Steps:**
1. Open Claude Code in your project
2. Ask this exact question: `"Where does your memory file live for this project? Show me the full path."`
3. Claude will tell you the path — something like `~/.claude/projects/<encoded-path>/memory/MEMORY.md`
4. Navigate to that path in your terminal or Finder and open the file

**Commands (in Claude Code):**
```
Where does your memory file live for this project? Show me the full path.
```

**Expected Output:** Claude gives you the full absolute path to the `MEMORY.md` file. The file may be empty or not yet exist — that is fine.

**Screenshots Required:**
- Screenshot 1 — Claude's response showing the full memory file path

---

### Task 2 — Give Claude Information to Remember

**Goal:** Teach Claude three specific facts about the project and instruct it to save them to the memory file.

**Steps:**
1. In Claude Code, type the prompt below exactly as written
2. Watch Claude confirm it saved the memory
3. Open the `MEMORY.md` file and verify all three facts are written there

**Commands (in Claude Code):**
```
Remember the following for all future sessions: The CSS hero section uses a dark gradient from #1a1a2e to #16213e. The mobile breakpoints are 900px, 768px, and 600px. Never suggest adding JavaScript to this project. Save this to your memory file now.
```

**Expected Output:** Claude confirms the memory was saved. The `MEMORY.md` file now contains all three pieces of information.

**Screenshots Required:**
- Screenshot 2 — Claude confirming the memory was saved
- Screenshot 3 — The `MEMORY.md` file open in VS Code showing the saved content

---

### Task 3 — Close the Session Completely

**Goal:** Fully end the current Claude Code session so that memory is the only way Claude can recall what it was told.

**Steps:**
1. Type `/exit` in Claude Code or close the terminal tab completely
2. Close VS Code entirely
3. Wait 30 seconds
4. Reopen VS Code and start a fresh Claude Code session in the same project folder

**Commands (in Claude Code):**
```
/exit
```

**Expected Output:** Claude Code session is fully closed. A fresh session is opened with no previous conversation visible.

**Screenshots Required:**
- Screenshot 4 — VS Code reopened with a fresh Claude Code session showing no previous conversation

---

### Task 4 — Prove Memory Recall Across Sessions

**Goal:** Run three tests that prove Claude remembers what you told it — without you saying it again in the new session.

**Steps:**
1. In the new Claude Code session, ask: `"What colors are used in the hero section of this project?"`
2. Claude should recall the gradient values from memory
3. Ask: `"What are the mobile breakpoints for this project?"`
4. Claude should recall all three breakpoints
5. Ask: `"Should I add a JavaScript animation to the hero section?"`
6. Claude should refuse — because the memory says no JavaScript

**Commands (in Claude Code, new session):**
```
What colors are used in the hero section of this project?
What are the mobile breakpoints for this project?
Should I add a JavaScript animation to the hero section?
```

**Expected Output:**
- Question 1: Claude recalls `#1a1a2e` to `#16213e` without being told
- Question 2: Claude recalls 900px, 768px, 600px without being told
- Question 3: Claude refuses the JavaScript request — citing the memory rule

**Screenshots Required:**
- Screenshot 5 — Claude recalling the hero section colors correctly in the new session
- Screenshot 6 — Claude refusing to add JavaScript (memory rule enforced in the new session)

---

## 8. Industry Insight

The 200-line limit on the memory file is not a bug — it is a design decision. The first 200 lines load into every session automatically. If you fill memory with noise, you waste the space that should hold the things that actually matter. Professional engineers treat their memory files like a curated knowledge base: they add deliberately, prune regularly, and keep entries short and actionable. The same discipline that makes a good runbook makes a good memory file.

---

## 9. Submission Instructions

Complete all tasks in sequence.

Your submission must include:
- All 6 required screenshots
- Your GitHub repo URL
- 
---

## 10. Solution Walkthrough

A step-by-step solution and troubleshooting guide is available for reference:
Full solution walkthrough → (LINK)

---

## 11. LinkedIn Requirement

Create a LinkedIn post including:
- Screenshot 5 or 6 — Claude recalling information in a brand new session
- Caption: "My AI agent just remembered a project decision from a previous session — without me repeating it. This is what professional agentic DevOps looks like."
- Tag: #DMIProgram #AgenticAI #ClaudeCode #DevOps

**Submit:**
- LinkedIn post URL
- Screenshot of the post

---

## 12. Completion Checklist

Before submission, verify:
- [ ] Memory file path identified and shown in Screenshot 1
- [ ] Three facts saved to memory and visible in MEMORY.md (Screenshot 3)
- [ ] Session fully closed and fresh session opened (Screenshot 4)
- [ ] Claude recalled hero colors in new session without prompting (Screenshot 5)
- [ ] Claude refused JavaScript — memory rule enforced (Screenshot 6)
- [ ] All 6 screenshots captured and updated in GitHub folder

