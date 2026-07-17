#!/bin/bash
# PreToolUse hook - blocks dangerous infrastructure commands
# This hook runs before Claude executes a Bash command

INPUT=$(cat)

# Block terraform destroy and other destructive commands
if echo "$INPUT" | grep -qiE "(terraform destroy|aws s3 rb|aws s3api delete-bucket|kubectl delete namespace)"; then
  echo '{"block": true, "message": "BLOCKED: This infrastructure command is not permitted via Claude. Use approved change management process."}'
  exit 0
fi

echo '{"block": false}'
