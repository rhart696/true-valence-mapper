# GitHub Automation Setup Guide - Step by Step

**Time Required:** ~30 minutes
**Difficulty:** Easy (copy-paste workflows)
**Value:** Eliminates 90% of manual sync work

---

## What You're Setting Up

1. **Auto-Sync Submodules** - Parent repo automatically updates when editions are pushed
2. **Weekly Health Check** - Cloud-based health monitoring (runs even if machine is off)
3. **GitHub Copilot Instructions** - AI-aware code suggestions

---

## Prerequisites Checklist

Before starting, ensure you have:

- [x] GitHub account with access to all repositories
- [x] Ability to create GitHub Personal Access Tokens
- [x] Ability to add secrets to repositories
- [x] GitHub Actions enabled (should be enabled by default)

---

## Step 1: Create GitHub Personal Access Token (PAT)

**Duration:** 5 minutes

### 1.1 Generate Token

1. Go to: https://github.com/settings/tokens
2. Click **"Generate new token (classic)"**
3. Configure:
   - **Note:** `True Valence Mapper - Parent Repo Sync`
   - **Expiration:** `No expiration` (or 1 year if you prefer)
   - **Scopes:** Select **`repo`** (full control of private repositories)
4. Click **"Generate token"**
5. **IMPORTANT:** Copy the token immediately (starts with `ghp_...`)
   - You won't be able to see it again!
   - Save it temporarily in a secure note

### 1.2 Add Token to Edition Repositories

For **each edition** repository, add the token as a secret:

**Editions to configure:**
- `true-valence-mapper-claude`
- `true-valence-mapper-codex`
- `true-valence-mapper-bmad`
- `true-valence-mapper-spec-kit`
- `true-valence-mapper-magic-path`
- `true-valence-mapper-openspec`
- `true-valence-mapper-Gemini_3`

**For each repository:**

1. Go to: `https://github.com/rhart696/true-valence-mapper-{edition}/settings/secrets/actions`
   - Replace `{edition}` with actual edition name (e.g., `claude`)
2. Click **"New repository secret"**
3. Configure:
   - **Name:** `PARENT_REPO_TOKEN`
   - **Value:** Paste the PAT you copied
4. Click **"Add secret"**

**Verification:** You should see "PARENT_REPO_TOKEN" in the secrets list for each edition.

---

## Step 2: Setup Parent Repository Workflows

**Duration:** 5 minutes

### 2.1 Verify Workflows Are Committed

The workflows are already committed in this repository:
- `.github/workflows/auto-sync-submodules.yml` ✅
- `.github/workflows/weekly-health-check.yml` ✅
- `.github/copilot-instructions.md` ✅

### 2.2 Push to GitHub (if not already pushed)

```bash
cd /home/ichardart/dev/projects/true-valence-mapper
git add .github/
git commit -m "ci: add GitHub Actions automation workflows

- Auto-sync submodules on edition pushes
- Weekly health check in cloud
- GitHub Copilot instructions

🤖 Generated with Claude Code
Co-Authored-By: Claude <noreply@anthropic.com>"
git push origin main
```

### 2.3 Verify Workflows Are Registered

1. Go to: https://github.com/rhart696/true-valence-mapper/actions
2. You should see:
   - **Auto-Sync Submodules** (repository_dispatch, workflow_dispatch)
   - **Weekly Health Check** (schedule, workflow_dispatch)

---

## Step 3: Setup Edition Repository Workflows

**Duration:** 15 minutes (2 minutes per edition)

### 3.1 Template Workflow File

The workflow template is at: `docs/edition-notify-parent-workflow.yml`

### 3.2 Install in Each Edition

**For each edition** repository:

```bash
# Example for claude edition
cd /home/ichardart/dev/projects/true-valence-mapper-claude

# Create workflows directory
mkdir -p .github/workflows

# Copy template (adjust path if needed)
cp ../true-valence-mapper/docs/edition-notify-parent-workflow.yml .github/workflows/notify-parent.yml

# Commit and push
git add .github/workflows/notify-parent.yml
git commit -m "ci: add parent repo notification workflow

Automatically notifies parent repo when this edition is pushed.
Triggers parent submodule auto-sync via GitHub Actions.

🤖 Generated with Claude Code
Co-Authored-By: Claude <noreply@anthropic.com>"
git push origin main
```

**Repeat for all editions:**
- claude ✅
- codex ✅
- bmad ✅
- spec-kit ✅
- magic-path ✅
- openspec ✅
- Gemini_3 ✅

### 3.3 Verify Edition Workflows

For each edition:
1. Go to: `https://github.com/rhart696/true-valence-mapper-{edition}/actions`
2. You should see: **"Notify Parent Repo"** workflow

---

## Step 4: Test the Automation

**Duration:** 5 minutes

### 4.1 Test Auto-Sync (Edition → Parent)

```bash
# 1. Make a test change in any edition
cd /home/ichardart/dev/projects/true-valence-mapper-claude
echo "# Test auto-sync" >> README.md
git add README.md
git commit -m "test: trigger auto-sync"
git push origin main

# 2. Wait 2-3 minutes

# 3. Check parent repo
cd /home/ichardart/dev/projects/true-valence-mapper
git pull origin main

# 4. Verify automatic commit
git log -1 --oneline
# Should show: "chore: auto-update claude submodule to latest"
```

**What should happen:**
1. ✅ Edition push triggers `notify-parent.yml` workflow
2. ✅ Parent receives `repository_dispatch` event
3. ✅ Parent runs `auto-sync-submodules.yml` workflow
4. ✅ Parent updates submodule and commits
5. ✅ Health check runs automatically
6. ✅ Issue created if health check fails (otherwise silent success)

### 4.2 Test Weekly Health Check

```bash
# Trigger manually (don't wait for Monday 10 AM)
# 1. Go to: https://github.com/rhart696/true-valence-mapper/actions
# 2. Click "Weekly Health Check"
# 3. Click "Run workflow" dropdown
# 4. Click green "Run workflow" button
# 5. Wait 2-3 minutes
# 6. Check workflow run results
```

**What should happen:**
1. ✅ Workflow runs health check
2. ✅ Uploads report artifacts
3. ✅ Creates issue if errors found (otherwise posts summary)
4. ✅ Report available in workflow run

### 4.3 Test GitHub Copilot Instructions

```bash
# 1. Open any file in VS Code with GitHub Copilot enabled
# 2. Start typing a git command in a comment
# 3. Copilot should suggest architecture-aware commands

# Example:
# Type: "# commit and push changes"
# Copilot should suggest:
git add -A
git commit -m "descriptive message"
git push origin main
```

---

## Step 5: Configure Optional Features

### 5.1 Enable GitHub Discussions (Optional)

**For weekly health check reports:**

1. Go to: https://github.com/rhart696/true-valence-mapper/settings
2. Scroll to "Features" section
3. Enable **"Discussions"**
4. Create category: **"Weekly Sync"**
5. Weekly reports will post to Discussions automatically

### 5.2 Add Slack Integration (Optional)

**For failure notifications:**

1. Create Slack incoming webhook:
   - Go to your Slack workspace
   - Add "Incoming WebHooks" app
   - Create webhook for desired channel
   - Copy webhook URL

2. Add webhook as secret:
   - Go to: https://github.com/rhart696/true-valence-mapper/settings/secrets/actions
   - Click "New repository secret"
   - Name: `SLACK_WEBHOOK_URL`
   - Value: Paste webhook URL
   - Click "Add secret"

3. Update workflow (already configured in `weekly-health-check.yml`):
   - Slack notifications will trigger on health check failures
   - No additional changes needed

---

## Verification Checklist

### Parent Repository

- [ ] `.github/workflows/auto-sync-submodules.yml` exists and pushed
- [ ] `.github/workflows/weekly-health-check.yml` exists and pushed
- [ ] `.github/copilot-instructions.md` exists and pushed
- [ ] Workflows appear in Actions tab
- [ ] Auto-sync test successful (edition push → parent update)
- [ ] Weekly health check test successful (manual trigger)

### Edition Repositories (All 7)

For each edition:
- [ ] `PARENT_REPO_TOKEN` secret added
- [ ] `.github/workflows/notify-parent.yml` exists and pushed
- [ ] Workflow appears in Actions tab
- [ ] Test push triggers parent update

**Quick check script:**
```bash
for edition in claude codex bmad spec-kit magic-path openspec Gemini_3; do
  echo "=== $edition ==="
  if [ -f "/home/ichardart/dev/projects/true-valence-mapper-$edition/.github/workflows/notify-parent.yml" ]; then
    echo "✅ Workflow file exists"
  else
    echo "❌ Workflow file missing"
  fi
done
```

---

## Troubleshooting

### Issue: Auto-sync not triggering

**Symptoms:** Edition pushed, but parent repo not auto-updating

**Check:**
1. Edition workflow ran successfully?
   - Go to edition repo → Actions tab
   - Verify "Notify Parent Repo" ran without errors

2. Parent repo received dispatch?
   - Go to parent repo → Actions tab
   - Verify "Auto-Sync Submodules" ran

3. Token configured correctly?
   - Go to edition repo → Settings → Secrets
   - Verify `PARENT_REPO_TOKEN` exists

**Solution:**
```bash
# Re-add token to edition repo
# Go to: https://github.com/rhart696/true-valence-mapper-{edition}/settings/secrets/actions
# Delete PARENT_REPO_TOKEN
# Re-add with correct value
```

### Issue: Weekly health check not running

**Symptoms:** Monday 10 AM, no workflow execution

**Check:**
1. Workflow file exists?
   ```bash
   cat .github/workflows/weekly-health-check.yml
   ```

2. Schedule is correct?
   ```yaml
   schedule:
     - cron: '0 10 * * 1'  # Monday 10 AM UTC
   ```

**Solution:**
- Test manual trigger first (see Step 4.2)
- Verify GitHub Actions is enabled
- Check workflow syntax with GitHub Actions validator

### Issue: Health check fails

**Symptoms:** Workflow runs but reports errors

**Check:**
1. View workflow logs:
   - Go to Actions → Weekly Health Check → Latest run
   - Expand "Run health check" step
   - Review output

2. Download artifacts:
   - Click on workflow run
   - Scroll to "Artifacts" section
   - Download `weekly-health-report-*`

**Solution:**
```bash
# Run locally for debugging
cd /home/ichardart/dev/projects/true-valence-mapper
./scripts/health-check.sh
./scripts/sync-check-advanced.sh
```

### Issue: Copilot not using instructions

**Symptoms:** Copilot suggestions don't follow architecture rules

**Check:**
1. File exists?
   ```bash
   cat .github/copilot-instructions.md
   ```

2. Copilot feature enabled?
   - VS Code: Check Copilot extension is active
   - GitHub: Verify Copilot subscription

**Solution:**
- Restart VS Code
- Reload Copilot extension
- Verify file is pushed to GitHub (Copilot reads from remote)

---

## Monitoring and Maintenance

### Daily
- No action required - automation handles everything

### Weekly
- Review health check results (automated Monday 10 AM)
- Check for any auto-created issues
- Verify auto-sync is working smoothly

### Monthly
- Review GitHub Actions minutes usage
  - Go to: https://github.com/rhart696/settings/billing
  - Check Actions usage (should be <150 min/month)
- Review artifact storage
  - Go to repository Settings → Actions → General
  - Check storage usage (should be <10 MB)

### Quarterly
- Review automation effectiveness
- Update workflows if patterns change
- Adjust schedules if needed

---

## Rollback Plan

If automation causes issues, you can disable it:

### Disable Auto-Sync
```bash
# In each edition repo, delete workflow file
cd /home/ichardart/dev/projects/true-valence-mapper-claude
git rm .github/workflows/notify-parent.yml
git commit -m "ci: disable auto-sync temporarily"
git push origin main
```

### Disable Weekly Health Check
```bash
# In parent repo, disable workflow
cd /home/ichardart/dev/projects/true-valence-mapper
mv .github/workflows/weekly-health-check.yml .github/workflows/weekly-health-check.yml.disabled
git add .github/workflows/
git commit -m "ci: disable weekly health check temporarily"
git push origin main
```

### Fallback: Manual Sync
```bash
# Use local scripts as before
./scripts/health-check.sh
./scripts/weekly-sync-automation.sh
```

---

## Next Steps After Setup

1. **Monitor First Week**
   - Watch for auto-sync commits
   - Verify weekly health check runs Monday
   - Check for any issues

2. **Fine-Tune If Needed**
   - Adjust schedules
   - Add/remove notifications
   - Customize workflows

3. **Consider Phase 3 Automations** (see [GITHUB-AUTOMATION-STRATEGY.md](GITHUB-AUTOMATION-STRATEGY.md))
   - PR validation
   - Cross-edition issue linking
   - AI code reviews

---

## Success Criteria

You'll know setup is successful when:

- ✅ Edition push → Parent auto-updates within 3 minutes
- ✅ Weekly health check posts results Monday 10 AM
- ✅ GitHub Copilot suggests architecture-aware code
- ✅ No manual sync commands needed
- ✅ Zero time spent on repository maintenance

---

## Support

**Questions?** Create an issue with label `automation`

**Documentation:**
- [Automation Strategy](GITHUB-AUTOMATION-STRATEGY.md) - Full strategy
- [Repository Structure](REPOSITORY-STRUCTURE.md) - Architecture overview
- [Governance](GOVERNANCE.md) - Policies and schedules

---

**Last Updated:** 2025-11-30
**Maintained By:** Repository Automation Team
**Time to Complete:** ~30 minutes
**Estimated ROI:** 10+ hours saved per month
