# Advanced DevOps Tasks Automation Using Bash Scripting 🚀

This repository houses a production-grade, highly secure, and modular suite of Bash automation utilities. The architecture strictly follows defensive programming paradigms, making all processes idempotent, safe against data corruption, and self-cleaning.

---

## 📁 Repository Architectural Structure

*   **`scripts/`**: Core automated execution binaries.
    *   `setup_workspace.sh`: An idempotent directory initialization utility.
    *   `system_monitor.sh`: A threshold-driven environment health scanner.
    *   `main_automation.sh`: A fully modular script utilizing scoped local memory states.
    *   `safe_backup.sh`: A validation-guarded, trap-enabled backup engine.
*   **`docs/`**: Persistent data storage area for environment outputs.
*   **`screenshots/`**: Diagnostic audit logs and runtime execution proofs.

---

## 🛠️ Detailed Script Functional Breakdowns

### 1️⃣ Directory and File Creation (`setup_workspace.sh`)
*   **Purpose**: Dynamically provisions nested environment layouts without overriding active states.
*   **Logic & Idempotence**: Before running `mkdir -p`, it invokes an `if [ -d "$TARGET_DIR" ]` conditional check. If the workspace already exists, it skips execution instead of crashing. It leverages `date +"%Y-%m-%d_%H-%M-%S"` for dynamic log creation.
*   **Process**:
    1. Evaluates path variables.
    2. Runs directory existence conditions.
    3. Writes structured system metadata (Timestamp, Operating User, Verification Tags) to disk.

### 2️⃣ System Health Monitor (`system_monitor.sh`)
*   **Purpose**: Audits system parameters against operational warning limits to maintain compute performance.
*   **Logic & Conditions**: Collects volume usage using `df -h /`. Filters percentages via `awk` stream engines. Compares active values against a hardcoded `$DISK_THRESHOLD` (80%) using `-gt` (Greater Than) evaluation flags.
*   **Process**:
    1. Evaluates disk capacity.
    2. Isolates the top 3 high-resource CPU process threads via `ps -Ao pcpu,comm -r`.
    3. Exits with exit code `0` for stability or exit code `1` if warning limits are breached.

### 3️⃣ Refactored Modular System (`main_automation.sh`)
*   **Purpose**: Packages logic configurations into maintainable code structures.
*   **Logic & Scope**: Implements the `local` keyword inside named functions (`check_disk_space`, `show_top_tasks`). This restricts memory leak vulnerabilities by keeping variables confined strictly inside their respective function blocks. 
*   **Process**: 
    1. Slices logging routines into a `log_message()` wrapper accepting arguments (`$1` = severity, `$2` = message text).
    2. Runs sequential tracking pipelines.

### 4️⃣ Input Validation & Safety Sandbox (`safe_backup.sh`)
*   **Purpose**: Executes secure resource preservation targets under absolute environment safety.
*   **Logic & Fail-Safes**: Employs structural inputs parameter counting validation via `if [ "$#" -ne 1 ]`. Verifies directory authenticity with `-d "$TARGET_PATH"`. Uses `trap cleanup EXIT INT TERM` to clear the temporary `/tmp` sandbox immediately upon completion or cancellation.

---

## 🛡️ Strict Defensive Scripting Configurations
To enforce total operational robustness, all scripts initialize with:
*   `set -e`: Aborts script execution immediately if any internal command errors out.
*   `set -u`: Treats uninitialized variables as fatal errors to prevent empty state leaks.
*   `set -o pipefail`: Forces pipelines to pass down inner failure codes rather than masking them.

---

## 🏁 Verification Diagnostics Execution Guide
Grant binaries system execution rights before triggering orchestration:
```bash
chmod +x scripts/*.sh
./scripts/main_automation.sh
./scripts/safe_backup.sh docs/
```
