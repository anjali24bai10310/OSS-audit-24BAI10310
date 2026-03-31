#!/bin/bash
# ============================================================
# Script 5: Open Source Manifesto Generator
# Author: Anjali Sharma | Reg No: 24BAI10310
# Course: Open Source Software | OSS NGMC Capstone
# Description: Asks the user 3 questions interactively, then
#              composes a personalised open source philosophy
#              statement and saves it to a .txt file.
# ============================================================

# --- Alias demonstration (aliases shown as comments per task spec) ---
# In a live shell session you could define:
#   alias show_manifesto='cat manifesto_$(whoami).txt'
#   alias gen_manifesto='bash script5_manifesto_generator.sh'

# --- Get current date and output filename ---
DATE=$(date '+%d %B %Y')
OUTPUT="manifesto_$(whoami).txt"    # Dynamic filename based on logged-in user

echo "========================================================"
echo "     OPEN SOURCE MANIFESTO GENERATOR                   "
echo "     Linux Kernel Audit | Anjali Sharma | 24BAI10310  "
echo "========================================================"
echo ""
echo "  Answer three questions to generate your personal"
echo "  open source philosophy statement."
echo ""

# --- Question 1: An open-source tool used daily ---
read -p "1. Name one open-source tool you use every day: " TOOL

# --- Question 2: What freedom means to the user ---
read -p "2. In one word, what does 'freedom' mean to you? " FREEDOM

# --- Question 3: Something they would build and share ---
read -p "3. Name one thing you would build and share freely: " BUILD

echo ""
echo "Composing your manifesto..."
echo ""

# --- Compose the manifesto using string concatenation and redirection ---
echo "========================================" > "$OUTPUT"
echo "   MY OPEN SOURCE MANIFESTO             " >> "$OUTPUT"
echo "   Generated on: $DATE                  " >> "$OUTPUT"
echo "   By: $(whoami) | Anjali Sharma       " >> "$OUTPUT"
echo "========================================" >> "$OUTPUT"
echo "" >> "$OUTPUT"

echo "Every day, I rely on $TOOL — a piece of software that someone" >> "$OUTPUT"
echo "built, shared, and gave to the world without asking for anything" >> "$OUTPUT"
echo "in return. To me, that act embodies one word: $FREEDOM." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "The Linux Kernel, which powers the device running this very script," >> "$OUTPUT"
echo "is the greatest proof that open collaboration works at scale." >> "$OUTPUT"
echo "Thousands of engineers — from students to industry giants — have" >> "$OUTPUT"
echo "contributed their time freely because they believed that software" >> "$OUTPUT"
echo "should be transparent, inspectable, and shared." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "I believe in this philosophy. That is why, if I could build one" >> "$OUTPUT"
echo "thing and release it openly, it would be: $BUILD." >> "$OUTPUT"
echo "Not to make a profit, but to add one more brick to the foundation" >> "$OUTPUT"
echo "that others can build upon — just as I have built upon theirs." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "The four freedoms of free software — to use, to study, to modify," >> "$OUTPUT"
echo "and to share — are not just a license clause. They are a contract" >> "$OUTPUT"
echo "between builders and the world. I accept that contract." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "Standing on the shoulders of giants like Linus Torvalds, Richard" >> "$OUTPUT"
echo "Stallman, and the countless unnamed contributors, I commit to" >> "$OUTPUT"
echo "carrying their work forward — openly, honestly, and freely." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "========================================" >> "$OUTPUT"
echo "   Signed: Anjali Sharma | 24BAI10310  " >> "$OUTPUT"
echo "   Course: Open Source Software         " >> "$OUTPUT"
echo "   Date  : $DATE                        " >> "$OUTPUT"
echo "========================================" >> "$OUTPUT"

echo "  Manifesto saved to: $OUTPUT"
echo ""
echo "========================================================"
echo ""

cat "$OUTPUT"
