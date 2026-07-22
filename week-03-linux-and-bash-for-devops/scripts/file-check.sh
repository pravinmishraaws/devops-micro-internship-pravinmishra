#!/bin/bash
# File Validation Script
test_file="$HOME/test-file.txt"
test_folder="$HOME/test-folder"

echo "================================"
echo "    FILE VALIDATION CHECK"
echo "================================"

# Check if test folder exists
if [ -d "$test_folder" ]; then
    echo "[OK] Directory exists: $test_folder"
else
    echo "[X] Directory not found: $test_folder"
fi

# Check if test file exists
if [ -f "$test_file" ]; then
    echo "[OK] File exists: $test_file"
else
    echo "[X] File not found: $test_file"
fi

echo "================================"
echo "Check completed!"
echo "================================"
