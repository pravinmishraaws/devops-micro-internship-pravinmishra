# Reflection – Week 2

**By Ubani Onu Chukwu**

## 1. Biggest technical insight I got this week

The biggest thing that clicked for me this week was realizing that Agentic AI isn't just about giving Claude a bigger prompt — it's about giving it *structure*. CLAUDE.md, skills, subagents, hooks, and memory each solve a different problem: CLAUDE.md gives Claude durable context about the project, skills turn repeated workflows into single commands with tool restrictions baked in, subagents let you delegate work to a specialist with only the permissions it needs, and hooks act as a safety net that runs *before* or *after* Claude does anything, regardless of what it "decides" to do. Seeing the `tf-plan` skill configured with `allowed-tools: Bash, Read, Grep` — no Write — made the least-privilege principle real to me in a way reading about it never did.

## 2. Biggest insight I got about myself this week

I noticed I move fast and assume rather than verify. Several times this week I was working in the wrong repository or wrong folder without immediately catching it, because I trusted my mental model of where I was instead of actually checking. I also learned that I genuinely prefer working through problems step by step with verification at each stage, rather than pushing a large batch of changes and hoping it all works.

## 3. My biggest weakness or loop I noticed

My repeated loop this week was moving forward before fully confirming a previous step actually landed correctly — saving a screenshot but not confirming the exact filename, editing a file but not confirming it actually saved before committing, pushing code without first checking `git status` for surprises. More than once I had to backtrack and re-verify something I assumed was already done.

## 4. One system I will implement from this week

Before running `git add` and `git commit`, I will always run `git status` first and read the full output before proceeding. I will do this on every single commit, starting with Week 3, so that I catch unintended files (or missing ones) before they get pushed, rather than after.

## 5. What I learned about Agentic AI and DevOps

I learned that Agentic AI in a DevOps context is not about replacing judgment — it's about encoding judgment into guardrails so it applies consistently even when I'm not watching closely. A hook that blocks `terraform destroy` doesn't need me to remember to be careful every single time; it's careful by design. That said, I also saw firsthand that human review still matters — Claude caught an inaccurate fact I asked it to memorize by checking it against the actual codebase first, rather than blindly trusting me.

## 6. My Week 2 highlight

My highlight was watching my own `pre-tool-guard.sh` hook actually catch and block a live `terraform destroy -auto-approve` command mid-session, and watching Claude explain — clearly and without me prompting — exactly why it wouldn't try to work around its own safety guard without my explicit permission. That's the moment agentic safety stopped being a concept and became something I'd actually built and watched work.

---

*This post is a part of DevOps Micro Internship with Agentic AI Cohort-3 by Pravin Mishra. You can start your DevOps journey by joining this Discord community (https://discord.pravinmishra.com/).*

#DMIByPravinMishra #AgenticAI #ClaudeCode #DevOps #LearningInPublic