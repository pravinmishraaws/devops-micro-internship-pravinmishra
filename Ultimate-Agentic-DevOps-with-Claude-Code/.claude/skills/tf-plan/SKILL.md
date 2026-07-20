---
name: tf-plan
description: Run terraform plan and analyze the output for risks. Use before applying any infrastructure changes.
allowed-tools: Bash, Read, Grep
disable-model-invocation: true
---

Run `cd terraform && terraform plan -no-color` and analyze the output.

Summarize:
- [ ] How many resources will be added, changed, or destroyed
- [ ] Any potential issues or risks (e.g., resource replacements, security group changes, data loss)
- [ ] Estimated blast radius

If the plan fails, diagnose the error and suggest a fix.
