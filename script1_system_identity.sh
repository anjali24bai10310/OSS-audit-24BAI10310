#!/bin/bash
# ============================================================
# Script 1: System Identity Report
# Author: Anjali Sharma | Reg No: 24BAI10310
# Course: Open Source Software | OSS NGMC Capstone
# Description: Displays a welcome screen with system info
#              and license details of the running OS.
# ============================================================

# --- Variables ---
STUDENT_NAME="Anjali Sharma"        # Student's full name
REG_NO="24BAI10310"                  # Registration number
SOFTWARE_CHOICE="Linux Kernel"       # Chosen OSS project

# --- Gather system information using command substitution ---
KERNEL=$(uname -r)                   # Current kernel version
USER_NAME=$(whoami)                  # Logged-in username
HOME_DIR=$HOME                       # Home directory of current user
UPTIME=$(uptime -p)                  # Human-readable uptime
CURRENT_DATE=$(date '+%A, %d %B %Y %H:%M:%S')  # Formatted date and time

# --- Detect Linux distribution name from /etc/os-release ---
if [ -f /etc/os-release ]; then
    DISTRO=$(grep -w "PRETTY_NAME" /etc/os-release | cut -d= -f2 | tr -d '"')
else
    DISTRO="Unknown Linux Distribution"
fi

# --- License message for the Linux Kernel ---
LICENSE_MSG="The Linux Kernel is licensed under the GNU General Public License v2 (GPL v2)."

# --- Display the system identity banner ---
echo "========================================================"
echo "       OPEN SOURCE AUDIT — SYSTEM IDENTITY REPORT      "
echo "========================================================"
echo ""
echo "  Student   : $STUDENT_NAME ($REG_NO)"
echo "  Project   : Auditing → $SOFTWARE_CHOICE"
echo "--------------------------------------------------------"
echo "  Distro    : $DISTRO"
echo "  Kernel    : $KERNEL"
echo "  User      : $USER_NAME"
echo "  Home Dir  : $HOME_DIR"
echo "  Uptime    : $UPTIME"
echo "  Date/Time : $CURRENT_DATE"
echo "--------------------------------------------------------"
echo "  License   : $LICENSE_MSG"
echo "========================================================"
echo ""
echo "  The Linux Kernel is the heart of every Linux system."
echo "  Its GPL v2 license ensures the source code remains"
echo "  free and open for everyone — forever."
echo "========================================================"
