#!/bin/bash

# ==============================================================================
# Task 3: Refactoring Using Functions (Modular Automation Controls)
# ==============================================================================

# 1. Enforce strict safety frameworks
set -eu
set -o pipefail

# 2. Reusable Modular Logging Engine
# Accepts two input arguments: $1 (Status Type), $2 (Log Message)
log_message() {
    local type="$1"
    local message="$2"
    local timestamp
    timestamp=$(date +"%Y-%m-%d %H:%M:%S")
    echo "[${timestamp}] [${type}] ${message}"
}

# 3. Modular System Verification Function
check_disk_space() {
    log_message "INFO" "Scanning local storage architecture..."
    local current_usage
    # Using '|| true' to gracefully handle pipeline exits without triggering pipefail flags
    current_usage=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//' || true)
    
    log_message "STATUS" "Primary volume utilization is currently at ${current_usage}%."
}

# 4. Modular Task Scanning Function
show_top_tasks() {
    log_message "INFO" "Polling active high-resource CPU process threads..."
    echo "============================================="
    # Safely pipelines process data down into the table framework
    ps -Ao pcpu,comm -r | head -n 4 || true
    echo "============================================="
}

# ==============================================================================
# Main Orchestration Loop Engine
# ==============================================================================
main() {
    log_message "START" "Initializing master modular infrastructure checks..."
    echo ""
    
    # Trigger functions sequentially
    check_disk_space
    echo ""
    show_top_tasks
    
    log_message "SUCCESS" "All modular monitoring steps executed cleanly."
}

# Fire the main driver logic loop
main

