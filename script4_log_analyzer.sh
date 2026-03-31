#!/bin/bash
# ============================================================
# Script 4: Log File Analyzer
# Author: Anjali Sharma | Reg No: 24BAI10310
# Course: Open Source Software | OSS NGMC Capstone
# Description: Reads a log file line by line, counts keyword
#              occurrences, and prints a summary with last 5
#              matching lines. Supports retry if file is empty.
# Usage: ./script4_log_analyzer.sh [logfile] [keyword]
# Example: ./script4_log_analyzer.sh /var/log/syslog kernel
# ============================================================

# --- Accept log file path as first argument ---
LOGFILE=${1:-"/var/log/syslog"}      # Default to syslog if not provided

# --- Accept keyword as second argument, default is 'error' ---
KEYWORD=${2:-"error"}

# --- Counter variable for matching lines ---
COUNT=0

# --- Maximum retry attempts if file is empty ---
MAX_RETRIES=3
ATTEMPT=0

echo "========================================================"
echo "      LOG FILE ANALYZER — LINUX KERNEL AUDIT           "
echo "========================================================"
echo ""
echo "  Log file : $LOGFILE"
echo "  Keyword  : '$KEYWORD'"
echo ""

# --- Check if the log file exists ---
if [ ! -f "$LOGFILE" ]; then
    echo "ERROR: File '$LOGFILE' not found."
    echo "Tip: Try /var/log/kern.log for kernel messages on Ubuntu."
    exit 1
fi

# --- Do-while style retry loop: retry if file is empty ---
while true; do
    ATTEMPT=$((ATTEMPT + 1))
    if [ ! -s "$LOGFILE" ]; then
        echo "WARNING: '$LOGFILE' appears to be empty. (Attempt $ATTEMPT/$MAX_RETRIES)"
        if [ "$ATTEMPT" -ge "$MAX_RETRIES" ]; then
            echo "Maximum retries reached. Exiting."
            exit 1
        fi
        echo "Retrying in 2 seconds..."
        sleep 2
    else
        break
    fi
done

# --- Analyze the log file line by line using while-read loop ---
echo "Analyzing log file..."
echo "--------------------------------------------------------"

while IFS= read -r LINE; do
    # Check if the current line contains the keyword (case-insensitive)
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))
    fi
done < "$LOGFILE"

# --- Print summary results ---
echo ""
echo "  SUMMARY"
echo "  -------"
echo "  Keyword '$KEYWORD' found : $COUNT time(s)"
echo "  Total lines in file      : $(wc -l < "$LOGFILE")"
echo ""

# --- Print last 5 matching lines using tail + grep ---
if [ "$COUNT" -gt 0 ]; then
    echo "  Last 5 matching lines containing '$KEYWORD':"
    echo "  -----------------------------------------------"
    grep -i "$KEYWORD" "$LOGFILE" | tail -5 | while IFS= read -r MLINE; do
        echo "  > $MLINE"
    done
else
    echo "  No lines containing '$KEYWORD' were found."
    echo "  Try a different keyword like: kernel, error, warning, fail"
fi

echo ""
echo "========================================================"
echo "  Linux kernel logs are fully open and inspectable —   "
echo "  a direct benefit of open source transparency.        "
echo "========================================================"
