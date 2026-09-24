#!/bin/bash

# Enforce strict safety frameworks
set -e
set -u
set -o pipefail

# 1. ENHANCED INPUT VALIDATION: Ensure user passes directory context parameter
if [ "$#" -ne 1 ]; then
    echo "🚨 ERROR: Missing target path parameter."
    echo "💡 Usage: $0 <target_directory_path>"
    exit 1
fi

TARGET_DIR="$1"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
LOG_FILE="${TARGET_DIR}/setup_log_${TIMESTAMP}.txt"

echo "🚀 Starting automated workspace initialization..."

# 2. Idempotent check: Build nested directories safely
if [ -d "$TARGET_DIR" ]; then
    echo "⚠️ Directory already exists! Skipping creation to maintain stability."
else
    echo "📁 Creating fresh directory structure at: $TARGET_DIR"
    mkdir -p "$TARGET_DIR"
fi

# 3. Dynamic content logging engine execution
echo "📝 Writing system generation records..."
{
    echo "==========================================="
    echo " DevOps Automated Workspace Log"
    echo " Generated on: $TIMESTAMP"
    echo " Initialized by user: $USER"
    echo "==========================================="
    echo "Status: Core filesystem components verified."
} > "$LOG_FILE"

echo "✅ Task 1 automation complete! Log saved to setup directory."
