#!/bin/bash
# ============================================================
# Script 2: FOSS Package Inspector
# Author: Anjali Sharma | Reg No: 24BAI10310
# Course: Open Source Software | OSS NGMC Capstone
# Description: Checks if an OSS package is installed,
#              retrieves its version, and prints a philosophy
#              note using a case statement.
# ============================================================

# --- Define packages related to Linux Kernel ecosystem ---
PACKAGES_TO_CHECK=("linux-generic" "linux-headers-generic" "gcc" "make" "git")

echo "========================================================"
echo "       FOSS PACKAGE INSPECTOR — LINUX KERNEL AUDIT     "
echo "========================================================"
echo ""

# --- Function to check package installation via dpkg ---
check_package() {
    local PKG=$1

    # Use dpkg -l to check if package is installed (Ubuntu/Debian)
    if dpkg -l "$PKG" &>/dev/null 2>&1; then
        echo "[INSTALLED] $PKG"
        # Retrieve version using dpkg and filter relevant fields
        dpkg -l "$PKG" | grep "^ii" | awk '{print "  Version : " $3}'
        # Get description using apt-cache if available
        if command -v apt-cache &>/dev/null; then
            DESC=$(apt-cache show "$PKG" 2>/dev/null | grep -m1 "^Description:" | cut -d: -f2-)
            echo "  Summary : $DESC"
        fi
    else
        echo "[NOT FOUND] $PKG is not installed on this system."
    fi
    echo ""
}

# --- Check each package in the list ---
echo "Checking Linux Kernel related packages:"
echo "----------------------------------------"
for PKG in "${PACKAGES_TO_CHECK[@]}"; do
    check_package "$PKG"
done

# --- Show current running kernel version ---
echo "--------------------------------------------------------"
echo "Currently Running Kernel Version : $(uname -r)"
echo "Architecture                     : $(uname -m)"
echo "--------------------------------------------------------"
echo ""

# --- Case statement: philosophy notes for each package ---
echo "Open Source Philosophy Notes:"
echo "----------------------------------------"

for PKG in "${PACKAGES_TO_CHECK[@]}"; do
    case $PKG in
        linux-generic)
            echo "[$PKG] — The Linux kernel: a collaborative masterpiece built"
            echo "   by thousands of volunteers and companies across the globe."
            ;;
        linux-headers-generic)
            echo "[$PKG] — Open headers mean anyone can build modules and drivers"
            echo "   freely — transparency is the foundation of trust in software."
            ;;
        gcc)
            echo "[$PKG] — The GNU Compiler: the free tool that compiles the free"
            echo "   kernel. Without GCC, the open source world would not exist."
            ;;
        make)
            echo "[$PKG] — GNU Make automates the build process, a tool built"
            echo "   openly and shared freely under the GPL license."
            ;;
        git)
            echo "[$PKG] — Git: built by Linus Torvalds when proprietary version"
            echo "   control failed him. The tool that powers all open collaboration."
            ;;
        *)
            echo "[$PKG] — An open source tool: free to use, study, modify, and share."
            ;;
    esac
    echo ""
done

echo "========================================================"
echo "  Linux Kernel License: GNU General Public License v2  "
echo "  'Free software' means freedom — not just free price. "
echo "========================================================"
