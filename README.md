# Tasks Automation Using Bash Scripting 🚀

This repository contains a professional suite of modular, defensive, and idempotent Bash shell automation scripts optimized for infrastructure-as-code and operations monitoring workflows.

## 📁 Repository Structure
*   `scripts/`: Holds all core automation shell utilities.
    *   `setup_workspace.sh`: Idempotent tool handling directory architectures and generation logging.
    *   `system_monitor.sh`: Resource diagnostic monitoring engine mapping disk space and active threads.
    *   `main_automation.sh`: Refactored script leveraging modular named functions and scoped local variables.
    *   `safe_backup.sh`: Defensive tool packing data under strict input validations and automated trap cleanups.
*   `docs/`: Environment storage repository housing workspace outputs and metadata records.
*   `screenshots/`: Visual runtime validation traces mapping clean command execution.

## 🛡️ Defensive Scripting Standards
Each automation component utilizes industry-standard safety flags to safeguard environment integrity:
*   `set -e`: Halts execution immediately if a child script routine reports a failure.
*   `set -u`: Intercepts variables to block uninitialized data leakage.
*   `set -o pipefail`: Exposes errors inside pipelined command paths.
*   `trap`: Intercepts signals (`EXIT`, `INT`, `TERM`) to execute cleanup protocols.

## 🏁 How to Execute Local Verification Diagnostics
Provide execution flags to script binaries prior to local processing:
```bash
chmod +x scripts/*.sh
./scripts/main_automation.sh
./scripts/safe_backup.sh docs/
```
