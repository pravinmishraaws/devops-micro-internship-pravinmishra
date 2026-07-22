#!/bin/bash
# Run all Assignment 5 tasks and display output

cd "$(dirname "$0")"

echo "============================================"
echo "  ASSIGNMENT 5 - BASH SCRIPT AUTOMATION"
echo "============================================"
echo ""

echo "=== TASK 1: Shell & Workspace ==="
echo "Shell: $SHELL"
bash --version | head -1
echo ""
echo "Working directory:"
pwd
echo ""
echo "Directory contents:"
ls -lah
echo ""

echo "=== TASK 2: First Script ==="
echo "--- Content of first-script.sh ---"
cat first-script.sh
echo ""
echo "--- Output ---"
./first-script.sh
echo ""
echo "--- Permissions ---"
ls -l first-script.sh
echo ""

echo "=== TASK 3: User Info Script ==="
echo "--- Content of user-info.sh ---"
cat user-info.sh
echo ""
echo "--- Output ---"
./user-info.sh
echo ""

echo "=== TASK 4: Tools Checklist ==="
echo "--- Content of tools-checklist.sh ---"
cat tools-checklist.sh
echo ""
echo "--- Output ---"
./tools-checklist.sh
echo ""

echo "=== TASK 5: Counter Script ==="
echo "--- Content of counter.sh ---"
cat counter.sh
echo ""
echo "--- Output ---"
./counter.sh
echo ""

echo "=== TASK 6: File Check Script ==="
echo "--- Content of file-check.sh ---"
cat file-check.sh
echo ""
echo "--- Output ---"
./file-check.sh
echo ""

echo "=== TASK 7: Score Check (Pass) ==="
echo "--- Content (score=85) ---"
cat score-check.sh
echo ""
echo "--- Output ---"
./score-check.sh
echo ""

echo "=== TASK 7: Score Check (Retry) ==="
sed -i '' 's/score=85/score=55/' score-check.sh
echo "--- Content (score=55) ---"
cat score-check.sh
echo ""
echo "--- Output ---"
./score-check.sh
sed -i '' 's/score=55/score=85/' score-check.sh
echo ""

echo "=== TASK 8: Final Automation Script ==="
echo "--- Content of final-automation.sh ---"
cat final-automation.sh
echo ""
echo "--- Output ---"
./final-automation.sh
echo ""

echo "=== All Scripts ==="
ls -lah
echo ""
echo "============================================"
echo "  ALL TASKS COMPLETED SUCCESSFULLY"
echo "============================================"
