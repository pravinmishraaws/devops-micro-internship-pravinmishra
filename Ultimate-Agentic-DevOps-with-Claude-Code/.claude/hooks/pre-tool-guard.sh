#!/bin/bash
# PreToolUse hook — blocks dangerous Bash commands before execution

INPUT=$(cat)
CMD=$(echo "$INPUT" | jq -r '.tool_input.command // empty')

if echo "$CMD" | grep -qE "terraform destroy|terraform apply.*-auto-approve|aws s3 rm|aws s3 rb"; then
  echo '{"decision": "block", "reason": "Destructive command detected. Use controlled commands for infrastructure changes."}'
fi