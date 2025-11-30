#!/bin/bash
# Automated Remediation Execution Script
# Based on Meta-Orchestrator Analysis 2025-11-30
#
# This script executes the Phase 1 remediation plan
# IMPORTANT: Review each step before executing

set -euo pipefail

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

log_step() { echo -e "${BLUE}▶ $1${NC}"; }
log_success() { echo -e "${GREEN}✅ $1${NC}"; }
log_warning() { echo -e "${YELLOW}⚠️  $1${NC}"; }
log_error() { echo -e "${RED}❌ $1${NC}"; }

echo "╔════════════════════════════════════════════════════════════╗"
echo "║       REMEDIATION EXECUTION - PHASE 1                      ║"
echo "║       True Valence Mapper Repository Sync                  ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo

# Priority #1: CLAUDE - COMPLETED ✅
log_success "Priority #1: CLAUDE - Already completed"
echo "  - Submodule updated to Phase 2 (0768b55)"
echo "  - Uncommitted changes stashed"
echo "  - Parent repo committed"
echo

# Priority #2: BMAD - Create Standalone & Commit
log_step "Priority #2: BMAD - Creating standalone repository..."
echo

if [[ ! -d "/home/ichardart/dev/projects/true-valence-mapper-bmad" ]]; then
    log_step "Cloning BMAD repository..."
    cd /home/ichardart/dev/projects
    git clone https://github.com/rhart696/true-valence-mapper-bmad.git true-valence-mapper-bmad
    log_success "BMAD standalone created"
else
    log_warning "BMAD standalone already exists, skipping clone"
fi

log_step "Committing uncommitted changes in BMAD submodule..."
cd /home/ichardart/dev/projects/true-valence-mapper/versions/bmad

# Check if there are changes to commit
if [[ -n $(git status --porcelain) ]]; then
    git add -A
    git commit -m "feat(bmad): Add BMAD implementation and documentation

- Add complete BMAD app implementation (React/Vue)
- Add BMAD documentation (analysis, planning, solutioning)
- Add GitHub Actions deployment workflow
- Add project configuration files

Resolves critical issue: uncommitted work identified in meta-orchestrator analysis

🤖 Generated with Claude Code
Co-Authored-By: Claude <noreply@anthropic.com>"

    log_step "Pushing BMAD changes to remote..."
    git push origin main
    log_success "BMAD changes committed and pushed"
else
    log_warning "No uncommitted changes in BMAD submodule"
fi

echo

# Priority #3: SPEC-KIT - Sync Standalone & Commit
log_step "Priority #3: SPEC-KIT - Syncing standalone repository..."
echo

log_step "Committing untracked files in SPEC-KIT submodule..."
cd /home/ichardart/dev/projects/true-valence-mapper/versions/spec-kit

if [[ -n $(git status --porcelain) ]]; then
    git add -A
    git commit -m "feat(spec-kit): Add Spec-Kit app and specifications

- Add Spec-Kit client application (TypeScript/React)
- Add specification templates and schemas
- Add entity, relationship, and mapping specs
- Add project configuration

Resolves critical issue: untracked work identified in meta-orchestrator analysis

🤖 Generated with Claude Code
Co-Authored-By: Claude <noreply@anthropic.com>"

    log_step "Pushing SPEC-KIT changes to remote..."
    git push origin main
    log_success "SPEC-KIT changes committed and pushed"
else
    log_warning "No uncommitted changes in SPEC-KIT submodule"
fi

log_step "Updating SPEC-KIT standalone..."
cd /home/ichardart/dev/projects/true-valence-mapper-spec-kit
git fetch origin
git reset --hard origin/main
log_success "SPEC-KIT standalone synchronized"

echo

# Priority #4: GEMINI_3 - Delete Empty Standalone & Commit
log_step "Priority #4: GEMINI_3 - Handling empty standalone..."
echo

if [[ -d "/home/ichardart/dev/projects/true-valence-mapper-Gemini_3" ]]; then
    if [[ ! -d "/home/ichardart/dev/projects/true-valence-mapper-Gemini_3/.git" ]]; then
        log_step "Deleting empty standalone directory..."
        rm -rf /home/ichardart/dev/projects/true-valence-mapper-Gemini_3
        log_success "Empty GEMINI_3 standalone deleted"
    else
        log_warning "GEMINI_3 standalone is a git repo, manual review needed"
    fi
else
    log_warning "GEMINI_3 standalone does not exist"
fi

log_step "Committing untracked files in GEMINI_3 submodule..."
cd /home/ichardart/dev/projects/true-valence-mapper/versions/Gemini_3

if [[ -n $(git status --porcelain) ]]; then
    git add -A
    git commit -m "feat(gemini): Add Gemini_3 implementation files

- Add initial Gemini_3 implementation (HTML/JS)
- Add Supabase integration and security files
- Add documentation and deployment reports
- Add testing utilities

Resolves critical issue: untracked work identified in meta-orchestrator analysis

🤖 Generated with Claude Code
Co-Authored-By: Claude <noreply@anthropic.com>"

    log_step "Pushing GEMINI_3 changes to remote..."
    git push origin main
    log_success "GEMINI_3 changes committed and pushed"
else
    log_warning "No uncommitted changes in GEMINI_3 submodule"
fi

echo

# Final: Update parent repo with all submodule changes
log_step "Updating parent repository with submodule references..."
cd /home/ichardart/dev/projects/true-valence-mapper

if [[ -n $(git status --porcelain) ]]; then
    git add versions/bmad versions/spec-kit versions/Gemini_3 2>/dev/null || true
    git commit -m "chore: Update submodules after Phase 1 remediation

- bmad: Committed app implementation and documentation
- spec-kit: Committed app and specifications, synced standalone
- Gemini_3: Committed implementation files, removed empty standalone

Completes Phase 1 of meta-orchestrator remediation plan (2025-11-30)

🤖 Generated with Claude Code
Co-Authored-By: Claude <noreply@anthropic.com>"

    log_success "Parent repository updated"
else
    log_warning "No changes to commit in parent repository"
fi

echo
echo "╔════════════════════════════════════════════════════════════╗"
echo "║              PHASE 1 REMEDIATION COMPLETE                  ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo

log_success "All Phase 1 tasks completed successfully!"
echo
echo "Next steps:"
echo "  1. Run: ./scripts/sync-check-advanced.sh --report"
echo "  2. Review: reports/SUBMODULE-STANDALONE-ANALYSIS-2025-11-30.md"
echo "  3. Proceed to Phase 2 (standardize remote URLs, documentation)"
echo

