# Automation Setup Guide

**Purpose:** Configure automated weekly health checks and sync monitoring

---

## Quick Start

### 1. Test the Automation

```bash
cd /home/ichardart/dev/projects/true-valence-mapper
./scripts/weekly-sync-automation.sh --test
```

**Expected output:** Health check summary with status report

### 2. Install Cron Job (Optional)

For automatic weekly checks every Monday at 10:00 AM:

```bash
# Open crontab editor
crontab -e

# Add this line (replace path if needed):
0 10 * * 1 /home/ichardart/dev/projects/true-valence-mapper/scripts/weekly-sync-automation.sh

# Save and exit
```

**Verify installation:**
```bash
crontab -l | grep weekly-sync
```

### 3. Configure Email Notifications (Optional)

```bash
# Install mail utilities (if not present)
sudo apt-get update
sudo apt-get install mailutils

# Set notification email
export SYNC_NOTIFY_EMAIL="your-email@example.com"

# Test email notification
./scripts/weekly-sync-automation.sh --test --email
```

**Make permanent:** Add to `~/.bashrc` or `~/.profile`:
```bash
echo 'export SYNC_NOTIFY_EMAIL="your-email@example.com"' >> ~/.bashrc
source ~/.bashrc
```

---

## Usage Examples

### Manual Weekly Check
```bash
./scripts/weekly-sync-automation.sh --test
```
- Runs health check
- Displays results in terminal
- No files created
- Safe for testing

### Production Run (Cron Mode)
```bash
./scripts/weekly-sync-automation.sh
```
- Runs health check
- Saves report to `reports/weekly-sync/`
- Creates `latest.txt` symlink
- Silent unless errors

### Auto-Fix Mode
```bash
./scripts/weekly-sync-automation.sh --fix
```
- Runs health check
- Automatically fixes simple issues
- Commits changes if needed
- **Use with caution** - review before production use

### Email Notification
```bash
./scripts/weekly-sync-automation.sh --email
```
- Sends email with full report
- Requires `SYNC_NOTIFY_EMAIL` environment variable
- Requires `mail` command installed

---

## Report Locations

### Weekly Reports
- **Directory:** `/home/ichardart/dev/projects/true-valence-mapper/reports/weekly-sync/`
- **Format:** `sync-report-YYYY-MM-DD-HHMMSS.txt`
- **Latest:** Symlink at `reports/weekly-sync/latest.txt`

### Detailed Analysis Reports
- **Directory:** `/home/ichardart/dev/projects/true-valence-mapper/reports/`
- **Format:** `sync-check-YYYY-MM-DD-HHMMSS.json` (if using `--report` flag)

---

## Automation Options

### Option 1: Cron (Linux/WSL/Mac)

**Pros:**
- Built-in to OS
- Reliable
- No dependencies

**Cons:**
- Requires system access
- Not portable

**Setup:**
```bash
crontab -e
# Add: 0 10 * * 1 /full/path/to/weekly-sync-automation.sh
```

### Option 2: GitHub Actions (CI/CD)

**Pros:**
- Cloud-based (runs even when local machine off)
- Version controlled
- Can post to Issues/Discussions

**Cons:**
- Requires GitHub repo
- Network dependency

**Example workflow:** (Create `.github/workflows/weekly-sync.yml`)
```yaml
name: Weekly Sync Check
on:
  schedule:
    - cron: '0 10 * * 1'  # Monday 10:00 AM UTC
  workflow_dispatch:  # Manual trigger

jobs:
  sync-check:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
        with:
          submodules: recursive

      - name: Run health check
        run: ./scripts/health-check.sh

      - name: Upload report
        if: failure()
        uses: actions/upload-artifact@v3
        with:
          name: sync-report
          path: reports/
```

### Option 3: systemd Timer (Linux)

**Pros:**
- More modern than cron
- Better logging
- Dependency management

**Cons:**
- Linux-only
- More complex setup

**Setup:**
```bash
# Create service file
sudo nano /etc/systemd/system/tvm-sync.service

# Content:
[Unit]
Description=True Valence Mapper Weekly Sync Check

[Service]
Type=oneshot
ExecStart=/home/ichardart/dev/projects/true-valence-mapper/scripts/weekly-sync-automation.sh
User=ichardart

# Create timer file
sudo nano /etc/systemd/system/tvm-sync.timer

# Content:
[Unit]
Description=Weekly Sync Check Timer

[Timer]
OnCalendar=Mon *-*-* 10:00:00
Persistent=true

[Install]
WantedBy=timers.target

# Enable and start
sudo systemd enable tvm-sync.timer
sudo systemd start tvm-sync.timer
```

---

## Monitoring and Alerts

### Check Last Run Status

```bash
# View latest report
cat reports/weekly-sync/latest.txt

# Or with colors and paging
less -R reports/weekly-sync/latest.txt
```

### Parse Exit Codes

The automation script returns:
- `0` = All checks passed (healthy)
- `1` = Warnings only (functional but needs attention)
- `2` = Errors found (critical issues)

**Use in scripts:**
```bash
if ./scripts/weekly-sync-automation.sh; then
  echo "Repository healthy"
else
  EXIT_CODE=$?
  if [ $EXIT_CODE -eq 1 ]; then
    echo "Warnings found - review recommended"
  else
    echo "Critical errors - immediate action required"
  fi
fi
```

### Integration with Chat/Slack

**Send to Slack webhook:**
```bash
# After running automation
SLACK_WEBHOOK="https://hooks.slack.com/services/YOUR/WEBHOOK/URL"
REPORT=$(cat reports/weekly-sync/latest.txt)

curl -X POST -H 'Content-type: application/json' \
  --data "{\"text\":\"Weekly Sync Report:\\n\`\`\`$REPORT\`\`\`\"}" \
  $SLACK_WEBHOOK
```

---

## Troubleshooting

### Issue: Cron job not running

**Check cron service:**
```bash
sudo service cron status
```

**Check cron logs:**
```bash
grep CRON /var/log/syslog | tail -20
```

**Verify path is absolute:**
```bash
# Wrong (relative path):
0 10 * * 1 ./scripts/weekly-sync-automation.sh

# Correct (absolute path):
0 10 * * 1 /home/ichardart/dev/projects/true-valence-mapper/scripts/weekly-sync-automation.sh
```

### Issue: Email not sending

**Check mail command:**
```bash
which mail
# If not found: sudo apt-get install mailutils
```

**Test email:**
```bash
echo "Test email" | mail -s "Test Subject" your-email@example.com
```

**Check environment variable:**
```bash
echo $SYNC_NOTIFY_EMAIL
# Should output your email address
```

### Issue: Permission denied

**Make script executable:**
```bash
chmod +x /home/ichardart/dev/projects/true-valence-mapper/scripts/weekly-sync-automation.sh
```

**Check file ownership:**
```bash
ls -la /home/ichardart/dev/projects/true-valence-mapper/scripts/weekly-sync-automation.sh
# Should show your username
```

---

## Best Practices

### 1. Test Before Production
Always run with `--test` flag first:
```bash
./scripts/weekly-sync-automation.sh --test
```

### 2. Review Auto-Fix
Before enabling `--fix` in cron, manually review what it would change:
```bash
./scripts/sync-check-advanced.sh --fix
```

### 3. Keep Reports
Don't delete old reports - they provide history:
```bash
# Archive old reports quarterly
tar -czf reports-archive-Q4-2025.tar.gz reports/weekly-sync/sync-report-2025-10-*.txt
```

### 4. Monitor Trends
Track warning/error counts over time:
```bash
# Count issues by week
grep -c "⚠️" reports/weekly-sync/*.txt
```

### 5. Update Schedule
If Monday 10 AM doesn't work, adjust cron:
```bash
# Wednesday 2 PM:
0 14 * * 3 /path/to/weekly-sync-automation.sh

# Every Friday 5 PM:
0 17 * * 5 /path/to/weekly-sync-automation.sh
```

---

## See Also

- [Health Check Script](../scripts/health-check.sh) - Manual validation
- [Sync Check Advanced](../scripts/sync-check-advanced.sh) - Detailed analysis
- [Governance Documentation](GOVERNANCE.md) - Sync policies
- [Reference Models](SYNC-REFERENCE-MODELS.md) - Perfect sync examples

---

**Last Updated:** 2025-11-30
**Maintained By:** Repository Automation Team
**Support:** Create issue with label `automation`
