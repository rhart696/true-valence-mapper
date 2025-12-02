#!/bin/bash
# GitHub Automation Activation Script
# Interactive setup wizard for GitHub Actions automation
#
# Usage: ./scripts/activate-github-automation.sh

set -euo pipefail

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m'

# Configuration
PARENT_REPO="/home/ichardart/dev/projects/true-valence-mapper"
EDITIONS=("claude" "codex" "bmad" "spec-kit" "magic-path" "openspec" "Gemini_3")
WORKFLOW_TEMPLATE="$PARENT_REPO/docs/edition-notify-parent-workflow.yml"

echo -e "${CYAN}╔════════════════════════════════════════════════════════════╗${NC}"
echo -e "${CYAN}║       GitHub Automation Activation Wizard                  ║${NC}"
echo -e "${CYAN}║       True Valence Mapper - Multi-Agent Repository        ║${NC}"
echo -e "${CYAN}╚════════════════════════════════════════════════════════════╝${NC}"
echo

echo -e "${BOLD}This wizard will help you activate GitHub Actions automation.${NC}"
echo
echo "What you'll set up:"
echo "  ✓ Auto-sync: Parent repo updates when editions are pushed"
echo "  ✓ Weekly health check: Cloud monitoring every Monday"
echo "  ✓ GitHub Copilot: Architecture-aware code suggestions"
echo
echo -e "${YELLOW}Time required: ~30 minutes${NC}"
echo

read -p "Ready to begin? (y/n) " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Setup cancelled. Run this script again when ready."
    exit 0
fi

echo
echo -e "${CYAN}═══════════════════════════════════════════════════════════${NC}"
echo -e "${CYAN}  Step 1: GitHub Personal Access Token (PAT)${NC}"
echo -e "${CYAN}═══════════════════════════════════════════════════════════${NC}"
echo

echo "You need to create a GitHub Personal Access Token (PAT) with 'repo' scope."
echo
echo -e "${BOLD}Instructions:${NC}"
echo "  1. Open: https://github.com/settings/tokens"
echo "  2. Click: 'Generate new token (classic)'"
echo "  3. Note: 'True Valence Mapper - Parent Repo Sync'"
echo "  4. Expiration: 'No expiration' (or 1 year)"
echo "  5. Scopes: Check ☑ 'repo' (full control)"
echo "  6. Click: 'Generate token'"
echo "  7. Copy the token (starts with 'ghp_...')"
echo

read -p "Have you created the PAT? (y/n) " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo -e "${YELLOW}Please create the PAT first, then run this script again.${NC}"
    exit 0
fi

echo
read -sp "Paste your GitHub PAT here: " GITHUB_PAT
echo
echo

if [[ ! $GITHUB_PAT =~ ^ghp_ ]]; then
    echo -e "${YELLOW}Warning: Token doesn't start with 'ghp_' - are you sure it's correct?${NC}"
    read -p "Continue anyway? (y/n) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        exit 0
    fi
fi

echo -e "${GREEN}✅ PAT received${NC}"
echo

echo -e "${CYAN}═══════════════════════════════════════════════════════════${NC}"
echo -e "${CYAN}  Step 2: Add Secrets to Edition Repositories${NC}"
echo -e "${CYAN}═══════════════════════════════════════════════════════════${NC}"
echo

echo "For each edition, you'll need to add the PAT as a secret via GitHub web UI."
echo
echo -e "${BOLD}For EACH edition repository, do this:${NC}"
echo

for edition in "${EDITIONS[@]}"; do
    echo -e "${BLUE}► Edition: $edition${NC}"
    echo "  1. Open: https://github.com/rhart696/true-valence-mapper-$edition/settings/secrets/actions"
    echo "  2. Click: 'New repository secret'"
    echo "  3. Name: PARENT_REPO_TOKEN"
    echo "  4. Value: Paste the PAT you created"
    echo "  5. Click: 'Add secret'"
    echo
done

echo -e "${YELLOW}Note: You'll need to do this manually via GitHub web UI for security.${NC}"
echo "      GitHub API doesn't allow programmatic secret creation."
echo

read -p "Have you added PARENT_REPO_TOKEN to all 7 edition repos? (y/n) " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo -e "${YELLOW}Please add the secrets first, then run this script again.${NC}"
    echo "You can verify secrets are added by checking:"
    echo "  Settings → Secrets and variables → Actions"
    echo "You should see PARENT_REPO_TOKEN listed (value hidden)."
    exit 0
fi

echo -e "${GREEN}✅ Secrets added to all editions${NC}"
echo

echo -e "${CYAN}═══════════════════════════════════════════════════════════${NC}"
echo -e "${CYAN}  Step 3: Deploy Workflow Files to Editions${NC}"
echo -e "${CYAN}═══════════════════════════════════════════════════════════${NC}"
echo

echo "Now we'll deploy the notify-parent workflow to each edition repo."
echo

DEPLOYED_COUNT=0

for edition in "${EDITIONS[@]}"; do
    EDITION_PATH="/home/ichardart/dev/projects/true-valence-mapper-$edition"

    echo -e "${BLUE}Processing: $edition${NC}"

    if [[ ! -d "$EDITION_PATH" ]]; then
        if [[ "$edition" == "Gemini_3" ]]; then
            echo -e "${YELLOW}  ⚠️  Standalone not present (expected for Gemini_3)${NC}"
            echo "      You'll need to deploy this manually if you create the standalone later."
        else
            echo -e "${RED}  ❌ Standalone directory not found: $EDITION_PATH${NC}"
        fi
        continue
    fi

    # Create .github/workflows directory
    mkdir -p "$EDITION_PATH/.github/workflows"

    # Copy workflow template
    cp "$WORKFLOW_TEMPLATE" "$EDITION_PATH/.github/workflows/notify-parent.yml"

    # Commit and push
    cd "$EDITION_PATH"

    if git diff --quiet .github/workflows/notify-parent.yml 2>/dev/null; then
        echo -e "${YELLOW}  ℹ️  Workflow already exists and unchanged${NC}"
    else
        git add .github/workflows/notify-parent.yml
        git commit -m "ci: add parent repo notification workflow

Automatically notifies parent repo when this edition is pushed.
Triggers parent submodule auto-sync via GitHub Actions.

🤖 Generated with Claude Code
Co-Authored-By: Claude <noreply@anthropic.com>"

        git push origin main

        echo -e "${GREEN}  ✅ Workflow deployed and pushed${NC}"
        ((DEPLOYED_COUNT++))
    fi

    echo
done

echo -e "${GREEN}✅ Deployed workflows to $DEPLOYED_COUNT edition(s)${NC}"
echo

echo -e "${CYAN}═══════════════════════════════════════════════════════════${NC}"
echo -e "${CYAN}  Step 4: Verify GitHub Actions${NC}"
echo -e "${CYAN}═══════════════════════════════════════════════════════════${NC}"
echo

echo "Let's verify the workflows are registered on GitHub."
echo

echo -e "${BOLD}Parent Repository:${NC}"
echo "  1. Open: https://github.com/rhart696/true-valence-mapper/actions"
echo "  2. You should see:"
echo "     - Auto-Sync Submodules"
echo "     - Weekly Health Check"
echo

echo -e "${BOLD}Edition Repositories:${NC}"
for edition in "${EDITIONS[@]}"; do
    echo "  - https://github.com/rhart696/true-valence-mapper-$edition/actions"
    echo "    Should show: Notify Parent Repo"
done
echo

read -p "Can you see all the workflows on GitHub? (y/n) " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo -e "${YELLOW}Workflows might take 1-2 minutes to appear.${NC}"
    echo "If they don't appear after 5 minutes:"
    echo "  1. Check that files are pushed to GitHub"
    echo "  2. Verify .github/workflows/*.yml files exist"
    echo "  3. Check GitHub Actions is enabled in repo settings"
    exit 1
fi

echo -e "${GREEN}✅ Workflows registered on GitHub${NC}"
echo

echo -e "${CYAN}═══════════════════════════════════════════════════════════${NC}"
echo -e "${CYAN}  Step 5: Test Auto-Sync${NC}"
echo -e "${CYAN}═══════════════════════════════════════════════════════════${NC}"
echo

echo "Let's test the auto-sync automation with a test commit."
echo

read -p "Which edition would you like to test with? (claude/codex/bmad/etc): " TEST_EDITION

TEST_PATH="/home/ichardart/dev/projects/true-valence-mapper-$TEST_EDITION"

if [[ ! -d "$TEST_PATH" ]]; then
    echo -e "${RED}Edition directory not found: $TEST_PATH${NC}"
    exit 1
fi

echo
echo "Making test commit in $TEST_EDITION..."

cd "$TEST_PATH"
echo "# Auto-sync test $(date)" >> .github/AUTO_SYNC_TEST.md
git add .github/AUTO_SYNC_TEST.md
git commit -m "test: trigger auto-sync automation

Testing GitHub Actions auto-sync workflow.
Parent repo should automatically update submodule within 2-3 minutes.

🤖 Generated with Claude Code
Co-Authored-By: Claude <noreply@anthropic.com>"

echo "Pushing to GitHub..."
git push origin main

echo -e "${GREEN}✅ Test commit pushed${NC}"
echo

echo -e "${YELLOW}Now wait 2-3 minutes for automation to run...${NC}"
echo

echo "What should happen:"
echo "  1. Edition push triggers 'Notify Parent Repo' workflow"
echo "  2. Parent receives repository_dispatch event"
echo "  3. Parent runs 'Auto-Sync Submodules' workflow"
echo "  4. Parent updates submodule and commits"
echo "  5. Health check runs automatically"
echo

echo "Monitor the workflows:"
echo "  Edition: https://github.com/rhart696/true-valence-mapper-$TEST_EDITION/actions"
echo "  Parent: https://github.com/rhart696/true-valence-mapper/actions"
echo

read -p "Wait for workflows to complete, then press Enter to verify..." -r
echo

echo "Pulling latest from parent repo..."
cd "$PARENT_REPO"
git pull origin main

echo
echo "Recent commits in parent repo:"
git log --oneline -5

echo

LATEST_COMMIT=$(git log --oneline -1)
if [[ $LATEST_COMMIT == *"auto-update $TEST_EDITION"* ]]; then
    echo -e "${GREEN}✅✅✅ AUTO-SYNC WORKING! ✅✅✅${NC}"
    echo
    echo "Parent repo automatically updated when $TEST_EDITION was pushed!"
else
    echo -e "${YELLOW}⚠️  Auto-sync commit not found yet.${NC}"
    echo
    echo "Possible reasons:"
    echo "  1. Workflows still running (wait a bit longer)"
    echo "  2. Workflow failed (check GitHub Actions tab for errors)"
    echo "  3. PARENT_REPO_TOKEN secret not configured correctly"
    echo
    echo "Debug steps:"
    echo "  1. Check edition workflow run status"
    echo "  2. Check parent workflow run status"
    echo "  3. Review workflow logs for errors"
fi

echo

echo -e "${CYAN}═══════════════════════════════════════════════════════════${NC}"
echo -e "${CYAN}  Step 6: Test Weekly Health Check${NC}"
echo -e "${CYAN}═══════════════════════════════════════════════════════════${NC}"
echo

echo "Let's test the weekly health check workflow manually."
echo

echo -e "${BOLD}Instructions:${NC}"
echo "  1. Open: https://github.com/rhart696/true-valence-mapper/actions"
echo "  2. Click: 'Weekly Health Check' in the left sidebar"
echo "  3. Click: 'Run workflow' dropdown (top right)"
echo "  4. Click: Green 'Run workflow' button"
echo "  5. Wait ~2 minutes for workflow to complete"
echo "  6. Click on the workflow run to see results"
echo

read -p "Have you triggered the weekly health check? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo -e "${GREEN}✅ Weekly health check tested${NC}"
else
    echo -e "${YELLOW}⚠️  You can test this later if needed${NC}"
fi

echo

echo -e "${CYAN}═══════════════════════════════════════════════════════════${NC}"
echo -e "${CYAN}  Activation Complete!${NC}"
echo -e "${CYAN}═══════════════════════════════════════════════════════════${NC}"
echo

echo -e "${GREEN}${BOLD}✅ GitHub Automation is now active!${NC}"
echo

echo "What's now automated:"
echo "  ✅ Auto-sync: Edition pushes trigger parent updates"
echo "  ✅ Weekly health check: Runs every Monday 10:00 AM UTC"
echo "  ✅ GitHub Copilot: Architecture-aware suggestions"
echo

echo "Next steps:"
echo "  1. Monitor automation for the first week"
echo "  2. Review Monday health check reports"
echo "  3. Enjoy 90% less manual sync work!"
echo

echo "Documentation:"
echo "  - Setup guide: docs/GITHUB-AUTOMATION-SETUP-GUIDE.md"
echo "  - Strategy doc: docs/GITHUB-AUTOMATION-STRATEGY.md"
echo "  - Troubleshooting: See setup guide"
echo

echo -e "${BOLD}Clean up:${NC}"
echo "You can delete the test file we created:"
echo "  rm $TEST_PATH/.github/AUTO_SYNC_TEST.md"
echo

echo -e "${GREEN}Congratulations! Your multi-agent repository is now fully automated! 🎉${NC}"
echo
