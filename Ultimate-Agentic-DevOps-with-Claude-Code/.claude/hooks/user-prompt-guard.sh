#!/bin/bash
# UserPromptSubmit hook — blocks destructive intent in user prompts

INPUT=$(cat)
PROMPT=$(echo "$INPUT" | jq -r '.prompt // empty')

if echo "$PROMPT" | grep -iqE "delete all|destroy everything|remove all resources|wipe|nuke|drop all"; then
  echo '{"decision": "block", "reason": "Destructive intent detected. Please use /tf-destroy for controlled infrastructure teardown."}'
fi