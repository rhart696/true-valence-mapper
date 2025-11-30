#!/bin/bash
# Weekly Sync Automation - Cron-Compatible Health Check
# Purpose: Automated repository health monitoring with email/notification on issues
#
# Installation:
#   1. Make executable: chmod +x scripts/weekly-sync-automation.sh
#   2. Test run: ./scripts/weekly-sync-automation.sh --test
#   3. Install cron: crontab -e
#      Add: 0 10 * * 1 /home/ichardart/dev/projects/true-valence-mapper/scripts/weekly-sync-automation.sh
#      (Runs every Monday at 10:00 AM)
#
# Options:
#   --test     Run in test mode (outputs to console, no notifications)
#   --fix      Auto-fix simple issues (use with caution)
#   --email    Send email report (requires mail command)

set -euo pipefail

# Configuration
REPO_ROOT="/home/ichardart/dev/projects/true-valence-mapper"
REPORT_DIR="$REPO_ROOT/reports/weekly-sync"
TIMESTAMP=$(date +%Y-%m-%d-%H%M%S)
REPORT_FILE="$REPORT_DIR/sync-report-$TIMESTAMP.txt"
LATEST_LINK="$REPORT_DIR/latest.txt"

# Notification settings
NOTIFY_EMAIL="${SYNC_NOTIFY_EMAIL:-}"  # Set via environment variable
TEST_MODE=false
FIX_MODE=false
SEND_EMAIL=false

# Colors (only for test mode)
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# Parse arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        --test)
            TEST_MODE=true
            shift
            ;;
        --fix)
            FIX_MODE=true
            shift
            ;;
        --email)
            SEND_EMAIL=true
            shift
            ;;
        *)
            echo "Unknown option: $1"
            exit 1
            ;;
    esac
done

# Helper functions
log() {
    local message="$1"
    if [[ "$TEST_MODE" == true ]]; then
        echo -e "${BLUE}[$(date +'%H:%M:%S')]${NC} $message"
    else
        echo "[$(date +'%Y-%m-%d %H:%M:%S')] $message" >> "$REPORT_FILE"
    fi
}

log_success() {
    local message="$1"
    if [[ "$TEST_MODE" == true ]]; then
        echo -e "${GREEN}✅${NC} $message"
    else
        echo "✅ $message" >> "$REPORT_FILE"
    fi
}

log_warning() {
    local message="$1"
    if [[ "$TEST_MODE" == true ]]; then
        echo -e "${YELLOW}⚠️${NC} $message"
    else
        echo "⚠️ $message" >> "$REPORT_FILE"
    fi
}

log_error() {
    local message="$1"
    if [[ "$TEST_MODE" == true ]]; then
        echo -e "${RED}❌${NC} $message"
    else
        echo "❌ $message" >> "$REPORT_FILE"
    fi
}

# Initialize
if [[ "$TEST_MODE" == false ]]; then
    mkdir -p "$REPORT_DIR"
    echo "╔════════════════════════════════════════════════════════════╗" > "$REPORT_FILE"
    echo "║       Weekly Sync Automation Report                        ║" >> "$REPORT_FILE"
    echo "║       True Valence Mapper - Multi-Agent Repository        ║" >> "$REPORT_FILE"
    echo "╚════════════════════════════════════════════════════════════╝" >> "$REPORT_FILE"
    echo >> "$REPORT_FILE"
else
    echo "╔════════════════════════════════════════════════════════════╗"
    echo "║       Weekly Sync Automation (TEST MODE)                   ║"
    echo "╚════════════════════════════════════════════════════════════╝"
    echo
fi

log "Starting weekly sync health check..."
log "Timestamp: $(date +'%Y-%m-%d %H:%M:%S')"
log "Repository: $REPO_ROOT"
log "Fix mode: $FIX_MODE"
echo

# Change to repo directory
cd "$REPO_ROOT"

# Run health check
log "Running health check..."
echo

HEALTH_CHECK_OUTPUT=$(./scripts/health-check.sh 2>&1)
HEALTH_EXIT_CODE=$?

if [[ "$TEST_MODE" == true ]]; then
    echo "$HEALTH_CHECK_OUTPUT"
else
    echo "$HEALTH_CHECK_OUTPUT" >> "$REPORT_FILE"
fi

echo
log "Health check completed with exit code: $HEALTH_EXIT_CODE"

# Interpret results
WARNINGS_COUNT=$(echo "$HEALTH_CHECK_OUTPUT" | grep -c "⚠️" || true)
ERRORS_COUNT=$(echo "$HEALTH_CHECK_OUTPUT" | grep -c "❌" || true)
SUCCESS_COUNT=$(echo "$HEALTH_CHECK_OUTPUT" | grep -c "✅" || true)

echo
log "Summary:"
log "  Success checks: $SUCCESS_COUNT"
log "  Warnings: $WARNINGS_COUNT"
log "  Errors: $ERRORS_COUNT"
echo

# Run detailed analysis if issues found
if [[ $HEALTH_EXIT_CODE -ne 0 ]]; then
    log "Issues detected. Running detailed sync analysis..."
    echo

    if [[ "$FIX_MODE" == true ]]; then
        log "Auto-fix mode enabled. Attempting automatic remediation..."
        SYNC_CHECK_OUTPUT=$(./scripts/sync-check-advanced.sh --fix 2>&1)
    else
        SYNC_CHECK_OUTPUT=$(./scripts/sync-check-advanced.sh 2>&1)
    fi

    if [[ "$TEST_MODE" == true ]]; then
        echo "$SYNC_CHECK_OUTPUT"
    else
        echo "$SYNC_CHECK_OUTPUT" >> "$REPORT_FILE"
    fi
fi

# Generate summary
echo
log "╔════════════════════════════════════════════════════════════╗"
log "║                    FINAL SUMMARY                           ║"
log "╚════════════════════════════════════════════════════════════╝"
echo

if [[ $HEALTH_EXIT_CODE -eq 0 ]]; then
    log_success "All editions are perfectly synchronized!"
    log_success "No action required."
    OVERALL_STATUS="HEALTHY"
elif [[ $ERRORS_COUNT -eq 0 ]]; then
    log_warning "Repository functional with $WARNINGS_COUNT warning(s)"
    log "Review warnings and schedule remediation if needed."
    OVERALL_STATUS="WARNING"
else
    log_error "Critical issues found: $ERRORS_COUNT error(s), $WARNINGS_COUNT warning(s)"
    log_error "Immediate attention required!"
    OVERALL_STATUS="ERROR"
fi

echo
log "Next steps:"
if [[ $HEALTH_EXIT_CODE -ne 0 ]] && [[ "$FIX_MODE" == false ]]; then
    log "  1. Review this report: $REPORT_FILE"
    log "  2. Run manual fix: ./scripts/sync-check-advanced.sh --fix"
    log "  3. Or schedule fixes during weekly sync meeting"
else
    log "  1. Continue normal development"
    log "  2. Next check: $(date -d 'next Monday 10:00' +'%Y-%m-%d %H:%M')"
fi

echo

# Update "latest" symlink
if [[ "$TEST_MODE" == false ]]; then
    ln -sf "$REPORT_FILE" "$LATEST_LINK"
    log "Report saved: $REPORT_FILE"
    log "Latest report: $LATEST_LINK"
fi

# Send email notification if configured
if [[ "$SEND_EMAIL" == true ]] && [[ -n "$NOTIFY_EMAIL" ]] && [[ "$TEST_MODE" == false ]]; then
    SUBJECT="Weekly Sync Report: $OVERALL_STATUS - $(date +'%Y-%m-%d')"

    if command -v mail &> /dev/null; then
        mail -s "$SUBJECT" "$NOTIFY_EMAIL" < "$REPORT_FILE"
        log "Email notification sent to: $NOTIFY_EMAIL"
    else
        log_warning "Email requested but 'mail' command not available"
        log "Install mailutils: sudo apt-get install mailutils"
    fi
fi

# Exit with appropriate code
if [[ $HEALTH_EXIT_CODE -eq 0 ]]; then
    exit 0
elif [[ $ERRORS_COUNT -eq 0 ]]; then
    exit 1  # Warnings only
else
    exit 2  # Errors found
fi
