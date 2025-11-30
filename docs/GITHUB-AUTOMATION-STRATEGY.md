# GitHub Cloud Automation Strategy

**Date:** 2025-11-30
**Purpose:** Leverage GitHub Actions, Copilot, and cloud-based agents for multi-agent repository management

---

## Executive Summary

This document outlines recommended GitHub-based automations for the true-valence-mapper dual-location architecture. These automations complement the local cron-based health checks with cloud-based monitoring, auto-sync, and AI-assisted workflows.

**Key Benefits:**
- ✅ Runs even when local machine is off
- ✅ Automatic submodule updates on edition pushes
- ✅ AI-assisted PR reviews and code quality checks
- ✅ Cross-edition coordination and notifications
- ✅ Zero manual intervention for routine syncs

---

## Priority 1: Essential Automations (Implement First)

### 1.1 Auto-Update Parent Submodules on Edition Push

**Problem Solved:** Parent repo falls behind when editions are updated
**Current State:** Manual `git submodule update --remote` required
**Automation:** GitHub Actions workflow triggered by edition pushes

**Implementation:**

Create `.github/workflows/auto-sync-submodules.yml`:

```yaml
name: Auto-Sync Submodules

on:
  # Trigger on pushes to any edition repository
  repository_dispatch:
    types: [edition-updated]

  # Also allow manual trigger
  workflow_dispatch:
    inputs:
      edition:
        description: 'Edition name (e.g., claude, bmad)'
        required: true
        type: string

jobs:
  sync-submodule:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout parent repo
        uses: actions/checkout@v4
        with:
          token: ${{ secrets.GITHUB_TOKEN }}
          submodules: recursive

      - name: Update submodule to latest
        run: |
          EDITION="${{ github.event.client_payload.edition || github.event.inputs.edition }}"
          echo "Updating submodule: versions/$EDITION"

          git config user.name "github-actions[bot]"
          git config user.email "github-actions[bot]@users.noreply.github.com"

          # Update specific submodule
          git submodule update --remote --merge "versions/$EDITION"

          # Check if there are changes
          if git diff --quiet; then
            echo "No changes to commit"
            exit 0
          fi

          # Commit and push
          git add "versions/$EDITION"
          git commit -m "chore: auto-update $EDITION submodule to latest

          Edition $EDITION was updated at $(git -C versions/$EDITION log -1 --format='%h - %s')

          🤖 Automated submodule sync via GitHub Actions"

          git push origin main

      - name: Run health check
        run: |
          chmod +x scripts/health-check.sh
          ./scripts/health-check.sh

      - name: Create issue if health check fails
        if: failure()
        uses: actions/github-script@v7
        with:
          script: |
            github.rest.issues.create({
              owner: context.repo.owner,
              repo: context.repo.repo,
              title: 'Health Check Failed After Auto-Sync',
              body: 'Automated submodule sync completed but health check failed. Please review.',
              labels: ['automation', 'health-check', 'needs-attention']
            })
```

**Trigger from Edition Repos:**

Add to each edition repository (e.g., `true-valence-mapper-claude/.github/workflows/notify-parent.yml`):

```yaml
name: Notify Parent Repo

on:
  push:
    branches: [main]

jobs:
  notify:
    runs-on: ubuntu-latest
    steps:
      - name: Extract edition name
        id: edition
        run: echo "name=${GITHUB_REPOSITORY#*/true-valence-mapper-}" >> $GITHUB_OUTPUT

      - name: Trigger parent sync
        uses: peter-evans/repository-dispatch@v2
        with:
          token: ${{ secrets.PARENT_REPO_TOKEN }}
          repository: rhart696/true-valence-mapper
          event-type: edition-updated
          client-payload: '{"edition": "${{ steps.edition.outputs.name }}"}'
```

**Setup Required:**
1. Create GitHub Personal Access Token (PAT) with `repo` scope
2. Add as secret `PARENT_REPO_TOKEN` in each edition repository
3. Commit workflow files to each repo

**Benefits:**
- ✅ Parent always stays current with edition changes
- ✅ Reduces manual sync burden by ~90%
- ✅ Automatic health checks after each sync
- ✅ Creates GitHub issue if sync causes problems

---

### 1.2 Weekly Health Check Report (Cloud-Based)

**Problem Solved:** Local cron job doesn't run if machine is off
**Current State:** Local weekly-sync-automation.sh via cron
**Automation:** GitHub Actions scheduled workflow

**Implementation:**

Create `.github/workflows/weekly-health-check.yml`:

```yaml
name: Weekly Health Check

on:
  schedule:
    # Every Monday at 10:00 AM UTC
    - cron: '0 10 * * 1'

  # Allow manual trigger
  workflow_dispatch:

jobs:
  health-check:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout repo
        uses: actions/checkout@v4
        with:
          submodules: recursive

      - name: Run health check
        id: health
        run: |
          chmod +x scripts/health-check.sh
          ./scripts/health-check.sh > health-report.txt 2>&1
          echo "exit_code=$?" >> $GITHUB_OUTPUT
        continue-on-error: true

      - name: Generate detailed report
        if: steps.health.outputs.exit_code != '0'
        run: |
          chmod +x scripts/sync-check-advanced.sh
          ./scripts/sync-check-advanced.sh --report

      - name: Upload reports
        uses: actions/upload-artifact@v3
        with:
          name: weekly-health-report
          path: |
            health-report.txt
            reports/

      - name: Post to GitHub Discussions
        if: always()
        uses: actions/github-script@v7
        with:
          script: |
            const fs = require('fs');
            const report = fs.readFileSync('health-report.txt', 'utf8');
            const status = '${{ steps.health.outputs.exit_code }}' === '0' ? '✅ HEALTHY' : '⚠️ NEEDS ATTENTION';

            // Post to Discussions (Weekly Sync category)
            await github.rest.discussions.create({
              owner: context.repo.owner,
              repo: context.repo.repo,
              category_id: 'WEEKLY_SYNC',  // Replace with actual category ID
              title: `Weekly Health Check - ${new Date().toISOString().split('T')[0]} - ${status}`,
              body: `## Weekly Health Check Report\n\n\`\`\`\n${report}\n\`\`\`\n\nFull reports available in [workflow artifacts](${context.payload.repository.html_url}/actions/runs/${context.runId})`
            });

      - name: Send Slack notification (if configured)
        if: steps.health.outputs.exit_code != '0'
        uses: slackapi/slack-github-action@v1.25.0
        with:
          payload: |
            {
              "text": "⚠️ Weekly Health Check Failed",
              "blocks": [
                {
                  "type": "section",
                  "text": {
                    "type": "mrkdwn",
                    "text": "Weekly health check detected issues. Review required.\n\n<${{ github.server_url }}/${{ github.repository }}/actions/runs/${{ github.run_id }}|View Details>"
                  }
                }
              ]
            }
        env:
          SLACK_WEBHOOK_URL: ${{ secrets.SLACK_WEBHOOK_URL }}
```

**Benefits:**
- ✅ Runs even when local machine is off
- ✅ Posts results to GitHub Discussions for async review
- ✅ Creates artifacts for historical tracking
- ✅ Optional Slack integration

---

### 1.3 GitHub Copilot Workspace Integration

**Problem Solved:** AI agents need context about repository structure
**Current State:** Manual documentation reading
**Automation:** GitHub Copilot Workspace with custom instructions

**Implementation:**

Create `.github/copilot-instructions.md`:

```markdown
# GitHub Copilot Instructions for True Valence Mapper

## Repository Architecture

This repository uses a **dual-location pattern** for multi-agent AI development:

- **Standalone repos** (`/true-valence-mapper-{edition}/`): AI agent workspaces
- **Parent repo** (`/true-valence-mapper/`): Human coordination hub with submodules

## Critical Rules

1. **NEVER work directly in `versions/` directories** - Always use standalone repos
2. **NEVER use HTTPS remotes** - Only SSH (`git@github.com:...`)
3. **ALWAYS commit before context switching** - No uncommitted work accumulation
4. **ALWAYS push to remote immediately** - Parent submodules track remote HEAD

## Reference Models

When suggesting git workflows, follow these reference models:
- **codex** (Gold standard): Regular commits, clean history
- **magic-path** (Stable): Feature branches, clean merges
- **openspec** (Minimalist): Infrequent but clean updates

## Required Actions Before Suggesting Code

1. Check current edition context (which standalone repo?)
2. Verify changes won't break dual-location sync
3. Ensure suggestions follow reference model patterns
4. Include commit and push commands in workflow

## Health Check Integration

When making repository changes:
```bash
# After any git operation
./scripts/health-check.sh

# Before major changes
./scripts/sync-check-advanced.sh
```

## Documentation Priority

- Architecture: docs/REPOSITORY-STRUCTURE.md
- Reference Models: docs/SYNC-REFERENCE-MODELS.md
- Governance: docs/GOVERNANCE.md

## Common Tasks

### Making changes in an edition:
```bash
# Work in standalone repo only
cd /home/ichardart/dev/projects/true-valence-mapper-claude
# Make changes
git add -A
git commit -m "descriptive message"
git push origin main
# Parent submodule auto-updates via GitHub Actions
```

### Checking sync status:
```bash
cd /home/ichardart/dev/projects/true-valence-mapper
./scripts/health-check.sh
```
```

**Benefits:**
- ✅ Copilot suggests architecture-aware code
- ✅ Prevents anti-patterns (working in submodules, etc.)
- ✅ Includes health checks in suggested workflows
- ✅ Context-aware git command suggestions

---

## Priority 2: Enhanced Automations (Implement After Priority 1)

### 2.1 Pre-Commit Validation (GitHub Actions)

**Problem Solved:** Catching issues before they reach remote
**Implementation:** GitHub Actions that run on PR creation

Create `.github/workflows/pr-validation.yml`:

```yaml
name: PR Validation

on:
  pull_request:
    types: [opened, synchronize, reopened]

jobs:
  validate:
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v4
        with:
          submodules: recursive

      - name: Run health check
        run: |
          chmod +x scripts/health-check.sh
          ./scripts/health-check.sh

      - name: Check for HTTPS URLs
        run: |
          if grep -r "https://github.com" .gitmodules; then
            echo "❌ Found HTTPS URLs in .gitmodules - use SSH only"
            exit 1
          fi

      - name: Validate governance compliance
        run: |
          # Check that PR updates submodule references appropriately
          if git diff --name-only origin/main | grep -q "^versions/"; then
            echo "✅ Submodule updates detected"
            # Verify corresponding edition was actually updated
            # (Add validation logic)
          fi

      - name: Post review comment
        if: failure()
        uses: actions/github-script@v7
        with:
          script: |
            github.rest.pulls.createReview({
              owner: context.repo.owner,
              repo: context.repo.repo,
              pull_number: context.issue.number,
              event: 'REQUEST_CHANGES',
              body: 'PR validation failed. Please review the health check output and governance policies.'
            })
```

---

### 2.2 Dependabot for Edition Dependencies

**Problem Solved:** Keeping dependencies updated across all editions
**Implementation:** Dependabot configuration

Create `.github/dependabot.yml`:

```yaml
version: 2
updates:
  # Parent repo dependencies
  - package-ecosystem: "github-actions"
    directory: "/"
    schedule:
      interval: "weekly"
    labels:
      - "dependencies"
      - "github-actions"

  # Edition-specific configs (if needed)
  # Add package-ecosystem configs for npm, pip, etc. in submodules
```

---

### 2.3 Cross-Edition Issue Linking

**Problem Solved:** Coordinating issues across multiple edition repos
**Implementation:** GitHub Actions with issue templates

Create `.github/ISSUE_TEMPLATE/cross-edition-issue.yml`:

```yaml
name: Cross-Edition Issue
description: Report an issue affecting multiple editions
title: "[CROSS-EDITION] "
labels: ["cross-edition", "needs-triage"]
body:
  - type: checkboxes
    id: affected-editions
    attributes:
      label: Affected Editions
      description: Which editions are impacted?
      options:
        - label: claude
        - label: codex
        - label: bmad
        - label: spec-kit
        - label: magic-path
        - label: openspec
        - label: Gemini_3

  - type: textarea
    id: description
    attributes:
      label: Issue Description
      description: Describe the cross-edition issue
    validations:
      required: true

  - type: textarea
    id: impact
    attributes:
      label: Impact Assessment
      description: How does this affect each edition?
    validations:
      required: true
```

**Automation to create linked issues:**

Create `.github/workflows/cross-edition-issues.yml`:

```yaml
name: Cross-Edition Issue Handler

on:
  issues:
    types: [labeled]

jobs:
  create-linked-issues:
    if: contains(github.event.issue.labels.*.name, 'cross-edition')
    runs-on: ubuntu-latest

    steps:
      - name: Parse affected editions
        id: editions
        uses: actions/github-script@v7
        with:
          script: |
            const body = context.payload.issue.body;
            const editions = ['claude', 'codex', 'bmad', 'spec-kit', 'magic-path', 'openspec', 'Gemini_3'];
            const affected = editions.filter(ed => body.includes(`- [x] ${ed}`));
            core.setOutput('affected', JSON.stringify(affected));

      - name: Create issues in edition repos
        uses: actions/github-script@v7
        with:
          github-token: ${{ secrets.PARENT_REPO_TOKEN }}
          script: |
            const affected = JSON.parse('${{ steps.editions.outputs.affected }}');
            const parentIssue = context.payload.issue;

            for (const edition of affected) {
              const repo = `true-valence-mapper-${edition}`;

              await github.rest.issues.create({
                owner: 'rhart696',
                repo: repo,
                title: `[FROM PARENT] ${parentIssue.title}`,
                body: `This issue was created from parent repo issue #${parentIssue.number}\n\n${parentIssue.body}\n\n---\nParent Issue: ${parentIssue.html_url}`,
                labels: ['from-parent', 'cross-edition']
              });
            }
```

---

## Priority 3: AI-Assisted Code Quality (Optional)

### 3.1 GitHub Copilot Code Review

**Automatic AI reviews on every PR**

Create `.github/workflows/copilot-review.yml`:

```yaml
name: AI Code Review

on:
  pull_request:
    types: [opened, synchronize]

jobs:
  ai-review:
    runs-on: ubuntu-latest
    permissions:
      pull-requests: write
      contents: read

    steps:
      - uses: actions/checkout@v4

      - name: AI-Powered Code Review
        uses: github/copilot-review-action@v1
        with:
          github-token: ${{ secrets.GITHUB_TOKEN }}
          instructions: |
            Review this PR against the dual-location architecture:
            1. Does it modify submodules correctly?
            2. Are SSH URLs used (not HTTPS)?
            3. Are governance policies followed?
            4. Is documentation updated if needed?

            Reference: docs/REPOSITORY-STRUCTURE.md, docs/GOVERNANCE.md
```

---

### 3.2 Automated Documentation Updates

**Keep docs in sync with code changes**

Create `.github/workflows/update-docs.yml`:

```yaml
name: Auto-Update Documentation

on:
  push:
    branches: [main]
    paths:
      - 'scripts/**'
      - '.gitmodules'
      - 'versions/**'

jobs:
  update-docs:
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v4

      - name: Check if docs need updating
        id: check
        run: |
          # Check if scripts changed
          if git diff --name-only HEAD~1 | grep -q "^scripts/"; then
            echo "needs_update=true" >> $GITHUB_OUTPUT
          fi

      - name: AI-generate documentation updates
        if: steps.check.outputs.needs_update == 'true'
        uses: github/copilot-cli-action@v1
        with:
          command: |
            Update docs/AUTOMATION-SETUP.md to reflect changes in:
            $(git diff --name-only HEAD~1 | grep "^scripts/")

      - name: Create PR with doc updates
        if: steps.check.outputs.needs_update == 'true'
        uses: peter-evans/create-pull-request@v5
        with:
          commit-message: "docs: auto-update documentation for script changes"
          title: "Auto-Update Documentation"
          body: "Automated documentation update based on recent script changes"
          labels: documentation, automated
```

---

## Setup Checklist

### Immediate Setup (Priority 1)

- [ ] **GitHub Personal Access Token**
  - Create PAT with `repo` scope
  - Add as `PARENT_REPO_TOKEN` secret in each edition repo
  - Add as `PARENT_REPO_TOKEN` secret in parent repo

- [ ] **Auto-Sync Submodules**
  - [ ] Add `auto-sync-submodules.yml` to parent repo
  - [ ] Add `notify-parent.yml` to each edition repo
  - [ ] Test with manual workflow trigger

- [ ] **Weekly Health Check**
  - [ ] Add `weekly-health-check.yml` to parent repo
  - [ ] Create "Weekly Sync" category in GitHub Discussions
  - [ ] Test with manual workflow trigger

- [ ] **GitHub Copilot Instructions**
  - [ ] Add `.github/copilot-instructions.md` to parent repo
  - [ ] Verify Copilot respects instructions in suggestions

### Optional Setup (Priority 2 & 3)

- [ ] **Slack Integration** (if desired)
  - Create Slack webhook
  - Add `SLACK_WEBHOOK_URL` secret

- [ ] **PR Validation**
  - Add `pr-validation.yml`
  - Test with sample PR

- [ ] **Cross-Edition Issues**
  - Add issue template
  - Add automation workflow
  - Test issue creation

- [ ] **Dependabot**
  - Add `dependabot.yml`
  - Review first automated PRs

---

## Cost Considerations

### GitHub Actions Minutes (Free Tier: 2,000 min/month)

**Estimated Usage:**
- Auto-sync on push: ~2 min/run × 10 pushes/week = 80 min/month
- Weekly health check: ~5 min/run × 4 runs/month = 20 min/month
- PR validation: ~3 min/PR × 8 PRs/month = 24 min/month
- **Total: ~124 min/month** (well within free tier)

### GitHub Copilot ($10/month per user)

Already included if you have Copilot subscription. No additional cost.

### Storage (Free Tier: 500 MB)

- Weekly report artifacts: ~100 KB/week × 52 = 5.2 MB/year
- Well within free tier

**Recommendation:** Start with free tier, upgrade only if needed

---

## Testing Strategy

### Phase 1: Test Auto-Sync
```bash
# 1. Make change in edition repo
cd /home/ichardart/dev/projects/true-valence-mapper-claude
echo "test" > test.txt
git add test.txt
git commit -m "test: trigger auto-sync"
git push origin main

# 2. Wait 2-3 minutes

# 3. Check parent repo
cd /home/ichardart/dev/projects/true-valence-mapper
git pull origin main
git log -1 --oneline
# Should show automated submodule update commit
```

### Phase 2: Test Weekly Health Check
```bash
# Trigger manually
# Go to: https://github.com/rhart696/true-valence-mapper/actions
# Select "Weekly Health Check"
# Click "Run workflow"
# Verify report appears in Discussions
```

### Phase 3: Test PR Validation
```bash
# Create test branch
git checkout -b test/validation
echo "test" > test.txt
git add test.txt
git commit -m "test: PR validation"
git push origin test/validation

# Create PR via GitHub UI
# Verify health check runs
```

---

## Monitoring and Maintenance

### Weekly Review
- Check GitHub Actions runs for failures
- Review automated discussion posts
- Verify auto-sync is working

### Monthly Review
- Review Actions minutes usage
- Check artifact storage usage
- Update workflows if patterns change

### Quarterly Review
- Review automation effectiveness
- Adjust schedules if needed
- Add new automations based on pain points

---

## Migration from Local Cron

### Current: Local Cron
```bash
0 10 * * 1 /home/ichardart/dev/projects/true-valence-mapper/scripts/weekly-sync-automation.sh
```

### Recommended: Hybrid Approach

**Keep local cron for:**
- Immediate feedback (runs when you're working)
- Development environment validation
- Offline testing

**Add GitHub Actions for:**
- Reliability (runs even when machine is off)
- Visibility (results in GitHub Discussions)
- Integration (can trigger other workflows)

**Best of both worlds:** Local cron as primary, GitHub Actions as backup

---

## See Also

- [Automation Setup Guide](AUTOMATION-SETUP.md) - Local cron setup
- [Governance Policies](GOVERNANCE.md) - Sync requirements
- [Repository Structure](REPOSITORY-STRUCTURE.md) - Architecture overview

---

**Last Updated:** 2025-11-30
**Maintained By:** Repository Automation Team
**Questions:** Create issue with label `automation`
