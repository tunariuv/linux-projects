# linux-projects
A collection of automated backup scripts and centralized syslog configurations built on Ubuntu.


This repository contains practical projects focused on Linux administration, system automation, and networking. These solutions were built and tested on **Ubuntu Server 24.04 LTS** environments.

## 📂 Projects Included

### 1. Automated Backup & Disaster Recovery (`/Backup-System`)
A Bash-based solution to automate the archiving and rotation of critical system files.
* **Features:**
  * Uses `tar` for compression.
  * Checks available disk space (`df -BG`) before executing to prevent kernel panics.
  * Automatically rotates and deletes backups older than 7 days (`find -mtime +7`).
  * Custom logging output (success/failure tracking).

**📸 Proof of Concept - Execution & Verification:**
> The script successfully executed the backup process, logged the output, and the verification script confirmed the existence of 3 rotated backup archives.

<img width="758" height="363" alt="Screenshot 2026-03-06 145502" src="https://github.com/user-attachments/assets/a80489e8-896a-4bda-a347-3f376b4b2be8" />


---

### 2. Centralized Syslog Server (`/Syslog-Server`)
A network architecture utilizing `rsyslog` to collect, filter, and organize logs from multiple remote client machines.
* **Features:**
  * Configured to listen on **UDP port 514**.
  * Uses custom `rsyslog` templates to dynamically sort incoming logs into specific directories based on `%HOSTNAME%` and `%PROGRAMNAME%`.
  * Secured via UFW Firewall.

**📸 Proof of Concept - Live Network Logging:**
> Real-time demonstration of remote logging. The client machine (right terminal) sends a UDP packet via port 514 to the server's IP. The Server (left terminal) automatically receives it, creates a directory for the remote host (`ubuntu1`), and writes the log.

<img width="548" height="122" alt="Screenshot 2026-03-06 145829" src="https://github.com/user-attachments/assets/71037aeb-af24-47e4-8bf9-88365d0ac5dd" />
<img width="1822" height="689" alt="Screenshot 2026-03-06 152242" src="https://github.com/user-attachments/assets/aed1ec78-2a1f-4685-9514-c40a6a19a8c6" />


## 🛠️ Tech Stack
**OS:** Linux (Ubuntu 24.04 LTS) | **Scripting:** Bash | **Networking:** TCP/IP, UDP, SSH | **Tools:** Cron, Rsyslog, Tar
