#!/bin/bash
# PostToolUse hook - logs Terraform commands
# This hook runs after Claude executes a Bash command

INPUT=$(cat)
LOG_FILE="/Users/ctu/Favour/devops-micro-internship-pravinmishra-fork/.claude/deploy.log"

# Log terraform commands
if echo "$INPUT" | grep -qi "terraform"; then
  TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")
  echo "[$TIMESTAMP] Command executed: $(echo "$INPUT" | head -c 200)" >> "$LOG_FILE"
fi

echo '{"block": false}'
