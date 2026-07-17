#!/bin/bash
# Score Check Script
score=85

echo "================================"
echo "      SCORE CHECK"
echo "================================"
echo "Score: $score"

if [ $score -ge 70 ]; then
    echo "Result: Pass"
else
    echo "Result: Retry"
fi
echo "================================"
