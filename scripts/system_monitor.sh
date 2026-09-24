#!/bin/bash

# ==============================================================================
# Task 2: Build a System Health Monitor (Thresholds & Conditionals)
# ==============================================================================

# 1. Enforce safety and data validation standards
set -e
set -u
set -o pipefail

# 2. Define warning baseline thresholds
DISK_THRESHOLD=80
ALERT_STATUS=0

echo "📊 Gathering real-time Mac system health metrics..."
echo "=================================================="

# 3. Assess Hard Drive Disk Capacity Natively
# Extracts the capacity percentage of your primary boot partition
CURRENT_DISK_USAGE=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')
echo "💾 Primary Hard Drive Disk Usage: ${CURRENT_DISK_USAGE}%"

if [ "$CURRENT_DISK_USAGE" -gt "$DISK_THRESHOLD" ]; then
    echo "🚨 WARNING: Disk utilization has crossed safe levels (${DISK_THRESHOLD}%)!"
    ALERT_STATUS=1
else
    echo "✅ Disk space levels are currently stable."
fi

echo "--------------------------------------------------"

# 4. Identify Top Resource-Consuming Running Processes
echo "🔥 Top 3 Running Tasks by CPU Processing Allocation:"
ps -Ao pcpu,comm -r | head -n 4

echo "=================================================="

# 5. Evaluate overall health assessment signal via standard Exit Codes
if [ "$ALERT_STATUS" -ne 0 ]; then
    echo "⚠️ System health inspection finished with warnings detected."
    exit 1
else
    echo "🎉 System health check complete! Everything is running smoothly."
    exit 0
fi


