# Linux System Health Monitor

## Project Overview

The Linux System Health Monitor is a Bash scripting project that collects basic system health information on a Linux environment. It helps users check system resources and identify high memory or disk usage.

## Objectives

- Monitor hostname and system uptime.
- Display memory information and calculate memory usage percentage.
- Check disk usage and display a warning when usage reaches 80%.
- Display available CPU cores and estimate CPU usage.
- Add a timestamp to each health report.
- Save reports to a log file for later review.

## Technologies Used

- Operating System: Ubuntu on WSL2
- Scripting Language: Bash
- Commands: "hostname", "uptime", "free", "df", "nproc", "top", "awk", "date", "tee"
- Version Control: Git and GitHub

## Project Structure

linux-system-health-monitor/
├── README.md
├── scripts/
│ └── health-monitor.sh
└── logs/
    └── health.log

## How to Run

1. Open the terminal in the project directory.

2. Give the script execution permission:
   
   chmod +x scripts/health-monitor.sh

3. Run the script and save the report:
   
   ./scripts/health-monitor.sh | tee -a logs/health.log

4. View the most recent log entries:
   
   tail -n 15 logs/health.log

## Sample Results

During one test run:

- Available CPU cores: 6
- Memory usage: 13%
- Disk usage: 1%
- CPU usage: 2.8%
- Memory status: NORMAL
- Disk status: NORMAL

These values are sample observations from the test environment. They can change between runs.

## Key Learning Outcomes

This project provides hands-on practice with Bash scripting, command substitution, Linux system monitoring commands, conditional statements, percentage calculations, timestamps, and log management. It also demonstrates how command-line tools can be combined to automate routine system checks.

## Limitations

This is a basic monitoring script intended for learning. It does not run continuously in the background, send notifications, or automatically repair system issues.

## Future Improvements

- Add continuous monitoring.
- Include configurable warning thresholds.
- Add structured logs and error handling.
- Explore automated notifications for critical resource usage.
