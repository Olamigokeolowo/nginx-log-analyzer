#!/bin/bash

# Log file path
LOG_FILE="nginx-access.log"

# Check if log file exists
if [ ! -f "$LOG_FILE" ]; then
  echo "Log file $LOG_FILE not found!"
  exit 1
fi

echo "Top 5 IP addresses with the most requests:"
awk '{print $1}' "$LOG_FILE" | sort | uniq -c | sort -rn | head -5
echo

echo "Top 5 most requested paths:"
awk '{print $7}' "$LOG_FILE" | sort | uniq -c | sort -rn | head -5
echo

echo "Top 5 response status codes:"
awk '{print $9}' "$LOG_FILE" | sort | uniq -c | sort -rn | head -5
echo

echo "Top 5 user agents:"
awk -F\" '{print $6}' "$LOG_FILE" | sort | uniq -c | sort -rn | head -5

