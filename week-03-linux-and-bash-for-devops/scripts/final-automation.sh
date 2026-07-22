#!/bin/bash
# Final Bash Automation Script

# Configuration variables
name="Eze Favour"
group="DMI Cohort 3"
week="5"
score=85
tools=("Bash" "Git" "Nginx" "Docker" "Kubernetes" "Terraform")
test_file="$HOME/test-file.txt"

# Function: Print header
print_header() {
    echo "========================================"
    echo "  FINAL BASH AUTOMATION SCRIPT"
    echo "  $name - $group - Week $week"
    echo "========================================"
}

# Function: Check shell environment
check_shell() {
    echo ""
    echo "[TASK] Shell Environment"
    echo "Shell: $SHELL"
    echo "Version: $(bash --version | head -1)"
    echo "User:  $(whoami)"
    echo "Date:  $(date)"
}

# Function: List tools
list_tools() {
    echo ""
    echo "[TASK] DevOps Tools Checklist"
    for tool in "${tools[@]}"; do
        echo "  [ ] $tool"
    done
    echo "  Total: ${#tools[@]} tools"
}

# Function: Check score
check_score() {
    echo ""
    echo "[TASK] Score Evaluation"
    echo "  Score: $score"
    if [ $score -ge 70 ]; then
        echo "  Result: Pass"
    else
        echo "  Result: Retry"
    fi
}

# Function: Validate file
validate_file() {
    echo ""
    echo "[TASK] File Validation"
    if [ -f "$test_file" ]; then
        echo "  [OK] File exists: $test_file"
    else
        echo "  [X] File not found: $test_file"
    fi
}

# Main function
main() {
    print_header
    check_shell
    list_tools
    check_score
    validate_file
    echo ""
    echo "========================================"
    echo "  Automation completed successfully!"
    echo "========================================"
}

# Execute main
main
