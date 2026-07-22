#!/bin/bash
# Tools Checklist Script
tools=("Bash" "Git" "Nginx" "Docker" "Kubernetes" "Terraform" "Ansible" "AWS" "Azure" "Linux")

echo "================================"
echo "   DEVOPS TOOLS CHECKLIST"
echo "================================"

for tool in "${tools[@]}"; do
    echo "[ ] $tool"
done

echo "================================"
echo "Total tools: ${#tools[@]}"
echo "================================"
