# oss-audit-24BAI10310

> **The Open Source Audit** — OSS NGMC Capstone Project  
> Course: Open Source Software | VITyarthi  
> Units Covered: 1 – 5 | Max Marks: 100

---

## Student Details

| Field | Details |
|---|---|
| **Name** | Anjali Sharma |
| **Registration Number** | 24BAI10310 |
| **Software Audited** | Linux Kernel |
| **License** | GNU General Public License v2 (GPL v2) |

---

## About This Project

This repository contains the complete submission for the Open Source Audit capstone project. The project presents a structured audit of the **Linux Kernel** — examining its origin story, GPL v2 licence philosophy, Linux system footprint on Ubuntu, FOSS ecosystem, and a critical comparison against the Windows NT Kernel. Five shell scripts demonstrate practical Ubuntu/Debian Linux command-line skills.

---

## Repository Structure

```
oss-audit-24BAI10310/
│
├── README.md
├── OSS_Capstone_Linux_Kernel_YuvrajDwivedi.pdf
├── script1_system_identity.sh
├── script2_package_inspector.sh
├── script3_disk_permission_auditor.sh
├── script4_log_analyzer.sh
└── script5_manifesto_generator.sh
```

---

## Shell Scripts

### Script 1 — System Identity Report
Displays distro name, kernel version, logged-in user, home directory, uptime, date/time, and GPL v2 licence message.  
**Concepts:** Variables, `echo`, `$()`, `/etc/os-release`, `cut`, `tr`.  
```bash
chmod +x script1_system_identity.sh && ./script1_system_identity.sh
```

### Script 2 — FOSS Package Inspector
Checks installation of Linux kernel-related packages via `dpkg -l`, retrieves versions, and prints philosophy notes via a `case` statement.  
**Concepts:** `if-then-else`, `for` loop, `case`, `dpkg -l`, `apt-cache`, `awk`, `grep`, pipe.  
```bash
chmod +x script2_package_inspector.sh && ./script2_package_inspector.sh
```

### Script 3 — Disk and Permission Auditor
Loops through system and kernel directories reporting permissions, ownership, and disk usage. Reads live kernel parameters from `/proc/sys/kernel`.  
**Concepts:** `for` loop over arrays, `if [ -d ]`, `ls -ld`, `awk`, `du -sh`, `cut`, `lsmod`.  
```bash
chmod +x script3_disk_permission_auditor.sh && ./script3_disk_permission_auditor.sh
```

### Script 4 — Log File Analyzer
Reads a log file line by line, counts keyword occurrences, retries on empty file, and prints the last 5 matching lines.  
**Concepts:** `while read`, `if-then` counter, `$1`/`$2` arguments, `grep -iq`, `tail`, retry with `sleep`.  
```bash
chmod +x script4_log_analyzer.sh
./script4_log_analyzer.sh /var/log/syslog error
./script4_log_analyzer.sh /var/log/kern.log kernel
```

### Script 5 — Open Source Manifesto Generator
Asks three interactive questions and saves a personalised open-source philosophy statement to `manifesto_$(whoami).txt`.  
**Concepts:** `read`, string concatenation, `>` / `>>`, `date`, `cat`, alias concept in comments.  
```bash
chmod +x script5_manifesto_generator.sh && ./script5_manifesto_generator.sh
```

---

## Run All Scripts

```bash
git clone https://github.com/<your-username>/oss-audit-24BAI10310.git
cd oss-audit-24BAI10310
chmod +x *.sh
./script1_system_identity.sh
./script2_package_inspector.sh
./script3_disk_permission_auditor.sh
./script4_log_analyzer.sh /var/log/syslog error
./script5_manifesto_generator.sh
```

---

## Dependencies

All tools are pre-installed on Ubuntu/Debian: `bash`, `dpkg`, `apt-cache`, `uname`, `whoami`, `uptime`, `date`, `lsmod`, `du`, `ls`, `awk`, `cut`, `grep`, `tail`.

---

*Submitted via VITyarthi Portal | Open Source Software — OSS NGMC*