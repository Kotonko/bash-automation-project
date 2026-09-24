#!/bin/bash

# Enforce strict safety and failure intercept rules
set -e
set -u
set -o pipefail

# 1. ROBUST VALIDATION: Verify threshold definition parameters exist safely
DISK_THRESHOLD=80
ALERT_STATUS=0

if [ -z "${DISK_THRESHOLD}" ] || [ "${DISK_THRESHOLD}" -le 0 ]; then
    echo "🚨 FATAL CONFIG ERROR: System threshold parameter validation failed."
    exit 1
fi

echo "📊 Gathering real-time Mac system health metrics..."
echo "=================================================="

# 2. Assess Hard Drive Disk Capacity Natively
CURRENT_DISK_USAGE=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//' || true)
echo "💾 Primary Hard Drive Disk Usage: ${CURRENT_DISK_USAGE}%"

if [ "$CURRENT_DISK_USAGE" -gt "$DISK_THRESHOLD" ]; then
    echo "🚨 WARNING: Disk utilization has crossed safe levels (${DISK_THRESHOLD}%)!"
    ALERT_STATUS=1
else
    echo "✅ Disk space levels are currently stable."
fi

echo "--------------------------------------------------"

# 3. Identify Top Resource-Consuming Running Processes
echo "🔥 Top 3 Running Tasks by CPU Processing Allocation:"
ps -Ao pcpu,comm -r | head -n 4 || true

echo "=================================================="

# 4. Evaluate overall health assessment signal via standard Exit Codes
if [ "$ALERT_STATUS" -ne 0 ]; then
    echo "⚠️ System health inspection finished with warnings detected."
    exit 1
else
    echo "🎉 System health check complete! Everything is running smoothly."
    exit 0
fi
