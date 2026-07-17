# Reflection – Week 2

**Author: Eze Favour**

---

Week 2 of the DevOps Micro Internship (DMI) Cohort 3 with Agentic AI has been an eye-opening journey into the world of AI-assisted DevOps. This week, I explored how Claude Code can transform the way we approach infrastructure and development workflows through agentic AI capabilities.

## Claude Code and the Agentic Loop

The week started with setting up Claude Code CLI and experiencing the Agentic Loop — Gather, Act, Verify. Watching Claude read files, execute commands, and verify results in real-time was fascinating. It's not just about getting answers; it's about having an AI collaborator that follows a structured process to solve problems. The `/init` command to generate CLAUDE.md was particularly useful, as it created a project-specific instruction file that guides Claude's behavior.

## Building Skills and Subagents

Creating custom skills in `.claude/skills/` was where things got really interesting. I built four skills: `scaffold-terraform`, `tf-plan`, `security-audit`, and `cost-estimate`. Each skill has defined tool permissions and model configurations. The `tf-plan` skill, for example, has `allowed-tools: Bash, Read, Grep` with `disable-model-invocation: true` — meaning it can only read and analyze, never modify infrastructure.

Subagents took this further by creating specialized AI team members. I configured three agents:

- **Security Auditor** (Sonnet model) — analyzes Terraform for vulnerabilities
- **Cost Optimizer** (Haiku model) — identifies cost-saving opportunities
- **Terraform Writer** (inherit model) — generates infrastructure code

The key insight was understanding why different models and tools are assigned to different agents — matching capability to task complexity.

## MCP, Hooks, and Memory

Connecting Claude to GitHub via MCP (Model Context Protocol) was a game-changer. It allowed Claude to access live repository data, making it truly connected to external systems. The `.mcp.json` configuration and secure token storage in `settings.local.json` demonstrated how to maintain security while enabling powerful integrations.

Safety hooks were another critical component. I implemented three hooks:

1. **UserPromptSubmit** — blocks destructive prompts before processing
2. **PreToolUse** — intercepts dangerous infrastructure commands
3. **PostToolUse** — logs Terraform commands for audit trails

Finally, the memory system showed how Claude can persist knowledge across sessions using `MEMORY.md`. This enables truly persistent context — Claude remembered hero section colors and project rules even after a complete session restart.

## Challenges and Mindset

The biggest challenge was understanding the granularity of tool permissions and how they affect agent behavior. It took several iterations to get the skill configurations right — especially understanding when to use `disable-model-invocation` and how `allowed-tools` restrictions cascade.

## Habit I Plan to Implement

Moving forward, I plan to implement a "document-as-you-configure" habit. Every time I create a skill, agent, or hook, I will immediately document its purpose, configuration choices, and expected behavior. This ensures that the `.claude/` directory remains self-documenting and maintainable.

## Conclusion

Week 2 has fundamentally changed how I think about DevOps automation. Agentic AI isn't just about running commands faster — it's about creating structured, safe, and reusable AI workflows that can be shared across teams. The combination of skills, subagents, MCP integrations, hooks, and memory creates a powerful platform for building AI-assisted DevOps pipelines.

---

_This blog is part of the DevOps Micro Internship (DMI) Cohort 3 — Agentic AI Track._
