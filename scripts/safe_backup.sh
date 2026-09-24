#!/bin/bash

# ==============================================================================
# Task 4: Implement Input Validation and Safety (Defensive Automation Scripting)
# ==============================================================================

# 1. Enforce safety and failure intercept rules
set -e
set -u
set -o pipefail

# 2. Establish a dynamic temporary workspace path
TEMP_DIR="/tmp/backup_workspace_$$"

# 3. Defensive Cleanup Routine using System Traps
cleanup() {
    echo ""
    echo "🧹 Clean-up engine triggered! Removing temporary workspace artifacts..."
    rm -rf "$TEMP_DIR"
    echo "✨ Work environment scrub complete."
}

# Trap exits, failures, and manual cancel combinations (Control + C)
trap cleanup EXIT INT TERM

# Initialize the temporary directory sandbox
mkdir -p "$TEMP_DIR"

# 4. Input Validation Check
# Ensures the user passed exactly 1 argument to the script
if [ "$#" -ne 1 ]; then
    echo "🚨 ERROR: Missing target pathway parameter."
    echo "💡 Usage: $0 <target_directory_path>"
    exit 1
fi

TARGET_PATH="$1"

# Verifies if the user-provided folder path actually exists on disk
if [ ! -d "$TARGET_PATH" ]; then
    echo "❌ ERROR: Validating path failed. Directory does not exist: $TARGET_PATH"
    exit 1
fi

# 5. Execute Safe Backup Simulation Loop
echo "🎯 Path validation check passed: Found directory at $TARGET_PATH"
echo "📦 Packing files into secure temporary workspace container at: $TEMP_DIR"

# Simulate writing a compressed archive backup structure
cp -R "$TARGET_PATH" "$TEMP_DIR/archive_backup"

echo "🏁 Backup simulation finished cleanly! Terminating script loop execution."

