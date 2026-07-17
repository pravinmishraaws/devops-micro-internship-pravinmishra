#!/bin/bash
# UserPromptSubmit hook - blocks destructive prompts
# This hook runs before Claude processes a user prompt

INPUT=$(cat)

# Block prompts containing destructive intent
if echo "$INPUT" | grep -qiE "(delete everything|remove all files|destroy all|rm -rf /|format disk)"; then
  echo '{"block": true, "message": "BLOCKED: Destructive operation detected. This action is not permitted."}'
  exit 0
fi

echo '{"block": false}'
