#!/bin/bash
# ============================================================
# Script 3: Disk and Permission Auditor
# Author: Anjali Sharma | Reg No: 24BAI10310
# Course: Open Source Software | OSS NGMC Capstone
# Description: Loops through key Linux directories, reports
#              disk usage and ownership/permissions of each.
#              Also checks Linux kernel config directories.
# ============================================================

# --- List of important system directories to audit ---
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp" "/boot" "/lib/modules")

# --- Linux Kernel specific directories ---
KERNEL_DIRS=("/boot" "/lib/modules/$(uname -r)" "/etc/modprobe.d" "/etc/modules-load.d" "/proc/sys/kernel")

echo "========================================================"
echo "   DISK AND PERMISSION AUDITOR — LINUX KERNEL AUDIT    "
echo "========================================================"
echo ""

# --- Section 1: General system directory audit using a for loop ---
echo "SECTION 1: General System Directory Audit"
echo "----------------------------------------------------------"
printf "%-30s %-20s %-10s\n" "Directory" "Permissions/Owner" "Size"
echo "----------------------------------------------------------"

for DIR in "${DIRS[@]}"; do
    # Check if the directory exists before processing
    if [ -d "$DIR" ]; then
        # Extract permissions and owner using ls -ld and awk
        PERMS=$(ls -ld "$DIR" | awk '{print $1, $3, $4}')
        # Get human-readable size using du; suppress permission errors
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)
        printf "%-30s %-20s %-10s\n" "$DIR" "$PERMS" "$SIZE"
    else
        printf "%-30s %-20s\n" "$DIR" "[does not exist]"
    fi
done

echo ""

# --- Section 2: Linux Kernel specific directory audit ---
echo "SECTION 2: Linux Kernel Configuration Directories"
echo "----------------------------------------------------------"
printf "%-40s %-20s %-10s\n" "Kernel Directory" "Permissions/Owner" "Size"
echo "----------------------------------------------------------"

for KDIR in "${KERNEL_DIRS[@]}"; do
    if [ -d "$KDIR" ]; then
        PERMS=$(ls -ld "$KDIR" | awk '{print $1, $3, $4}')
        SIZE=$(du -sh "$KDIR" 2>/dev/null | cut -f1)
        printf "%-40s %-20s %-10s\n" "$KDIR" "$PERMS" "$SIZE"
    else
        printf "%-40s %-20s\n" "$KDIR" "[does not exist]"
    fi
done

echo ""

# --- Section 3: Currently loaded kernel modules count ---
echo "SECTION 3: Kernel Module Information"
echo "----------------------------------------------------------"
MODULE_COUNT=$(lsmod | tail -n +2 | wc -l)
echo "  Currently loaded kernel modules : $MODULE_COUNT"

# Show top 5 largest modules by memory size
echo "  Top 5 modules by memory usage:"
lsmod | tail -n +2 | sort -k2 -rn | head -5 | awk '{printf "    %-30s %s KB\n", $1, $2/1024}'

echo ""

# --- Section 4: /proc/sys/kernel key parameters ---
echo "SECTION 4: Key Kernel Runtime Parameters (/proc/sys/kernel)"
echo "----------------------------------------------------------"

PARAMS=("hostname" "ostype" "osrelease" "version" "pid_max")

for PARAM in "${PARAMS[@]}"; do
    PFILE="/proc/sys/kernel/$PARAM"
    if [ -f "$PFILE" ]; then
        VAL=$(cat "$PFILE")
        printf "  %-20s : %s\n" "$PARAM" "$VAL"
    fi
done

echo ""
echo "========================================================"
echo "  Audit complete. All paths belong to the open Linux    "
echo "  filesystem hierarchy — transparent and inspectable.   "
echo "========================================================"
