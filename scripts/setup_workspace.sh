
#!/bin/bash

# ==============================================================================
# Task 1: Automate Directory and File Creation (Idempotent & Safe)
# ==============================================================================

# 1. Enable strict error handling rules
set -e          # Exit immediately if a command fails
set -u          # Exit immediately if an uninitialized variable is used
set -o pipefail # Track failures hidden inside pipelines

# 2. Define our target environment variables
TARGET_DIR="$HOME/bash-automation-project/docs/generated_workspace"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
LOG_FILE="${TARGET_DIR}/setup_log_${TIMESTAMP}.txt"

echo "🚀 Starting automated workspace initialization..."

# 3. Idempotent check: Build nested directories safely
if [ -d "$TARGET_DIR" ]; then
    echo "⚠️ Directory already exists! Skipping creation to maintain stability."
else
    echo "📁 Creating fresh directory structure at: $TARGET_DIR"
    mkdir -p "$TARGET_DIR"
fi

# 4. Generate dynamic file content with a timestamp trace
echo "📝 Writing system generation records..."
{
    echo "==========================================="
    echo " DevOps Automated Workspace Log"
    echo " Generated on: $TIMESTAMP"
    echo " Initialized by user: $USER"
    echo "==========================================="
    echo "Status: Core filesystem components verified."
} > "$LOG_FILE"

echo "✅ Task 1 automation complete! Log saved to: setup_log_${TIMESTAMP}.txt"

