#!/bin/bash
# Advanced Sync Checker with Remediation Suggestions
# Extends health-check.sh with detailed analysis and actionable fixes
#
# Usage: ./scripts/sync-check-advanced.sh [--fix] [--edition EDITION_NAME]
#
# Options:
#   --fix              Automatically fix simple issues (commits, syncs)
#   --edition NAME     Check only specific edition
#   --report          Generate JSON report for automation

set -euo pipefail

# Configuration
PARENT="/home/ichardart/dev/projects/true-valence-mapper"
EDITIONS=("claude" "codex" "bmad" "spec-kit" "magic-path" "openspec" "Gemini_3")
FIX_MODE=false
SPECIFIC_EDITION=""
REPORT_MODE=false
TIMESTAMP=$(date +%Y-%m-%d-%H%M%S)
REPORT_FILE="$PARENT/reports/sync-check-$TIMESTAMP.json"

# Colors
RED='\033[0;31m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m'

# Parse arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        --fix)
            FIX_MODE=true
            shift
            ;;
        --edition)
            SPECIFIC_EDITION="$2"
            shift 2
            ;;
        --report)
            REPORT_MODE=true
            shift
            ;;
        *)
            echo "Unknown option: $1"
            exit 1
            ;;
    esac
done

# Helper functions
log_section() {
    echo
    echo -e "${CYAN}═══════════════════════════════════════════════════════${NC}"
    echo -e "${CYAN}  $1${NC}"
    echo -e "${CYAN}═══════════════════════════════════════════════════════${NC}"
    echo
}

log_info() { echo -e "${BLUE}ℹ️  $1${NC}"; }
log_success() { echo -e "${GREEN}✅ $1${NC}"; }
log_warning() { echo -e "${YELLOW}⚠️  $1${NC}"; }
log_error() { echo -e "${RED}❌ $1${NC}"; }
log_fix() { echo -e "${CYAN}🔧 $1${NC}"; }

# Initialize JSON report
if [[ "$REPORT_MODE" == true ]]; then
    mkdir -p "$PARENT/reports"
    echo "{\"timestamp\": \"$TIMESTAMP\", \"editions\": {" > "$REPORT_FILE"
fi

# Main analysis function
analyze_edition() {
    local edition=$1
    local submodule_path="$PARENT/versions/$edition"
    local standalone_path="/home/ichardart/dev/projects/true-valence-mapper-$edition"

    log_section "Analyzing Edition: $edition"

    # Check if submodule exists
    if [[ ! -d "$submodule_path" ]]; then
        log_error "$edition: Submodule directory missing"
        return 1
    fi

    # Check if standalone exists
    local standalone_exists=true
    if [[ ! -d "$standalone_path" ]]; then
        log_warning "$edition: Standalone directory missing"
        standalone_exists=false
    elif [[ ! -d "$standalone_path/.git" ]]; then
        log_warning "$edition: Standalone exists but is not a git repo"
        standalone_exists=false
    fi

    # Get submodule info
    local sub_commit=$(git -C "$submodule_path" rev-parse HEAD 2>/dev/null || echo "UNKNOWN")
    local sub_branch=$(git -C "$submodule_path" rev-parse --abbrev-ref HEAD 2>/dev/null || echo "DETACHED")
    local sub_dirty=$(git -C "$submodule_path" status --porcelain 2>/dev/null | wc -l)
    local sub_untracked=$(git -C "$submodule_path" ls-files --others --exclude-standard 2>/dev/null | wc -l)

    echo "  Submodule Status:"
    echo "    Path: $submodule_path"
    echo "    Commit: ${sub_commit:0:8}"
    echo "    Branch: $sub_branch"
    echo "    Modified files: $sub_dirty"
    echo "    Untracked files: $sub_untracked"

    # Get standalone info if exists
    local sta_commit="NONE"
    local sta_branch="NONE"
    local sta_dirty=0
    if [[ "$standalone_exists" == true ]]; then
        sta_commit=$(git -C "$standalone_path" rev-parse HEAD 2>/dev/null || echo "UNKNOWN")
        sta_branch=$(git -C "$standalone_path" rev-parse --abbrev-ref HEAD 2>/dev/null || echo "UNKNOWN")
        sta_dirty=$(git -C "$standalone_path" status --porcelain 2>/dev/null | wc -l)

        echo
        echo "  Standalone Status:"
        echo "    Path: $standalone_path"
        echo "    Commit: ${sta_commit:0:8}"
        echo "    Branch: $sta_branch"
        echo "    Modified files: $sta_dirty"

        # Compare commits
        echo
        if [[ "$sub_commit" == "$sta_commit" ]]; then
            log_success "$edition: Commits match (${sub_commit:0:8})"
        else
            log_warning "$edition: Commits differ"
            echo "    Submodule: ${sub_commit:0:8}"
            echo "    Standalone: ${sta_commit:0:8}"

            # Determine which is ahead
            if git -C "$standalone_path" merge-base --is-ancestor "$sub_commit" "$sta_commit" 2>/dev/null; then
                echo "    📊 Standalone is ahead"
                if [[ "$FIX_MODE" == true ]]; then
                    log_fix "Updating submodule to match standalone..."
                    (cd "$PARENT" && git submodule update --remote "versions/$edition")
                    log_success "Submodule updated"
                else
                    log_info "Fix: Run 'git submodule update --remote versions/$edition'"
                fi
            elif git -C "$standalone_path" merge-base --is-ancestor "$sta_commit" "$sub_commit" 2>/dev/null; then
                echo "    📊 Submodule is ahead"
                if [[ "$FIX_MODE" == true ]]; then
                    log_fix "Updating standalone to match submodule..."
                    (cd "$standalone_path" && git fetch origin && git reset --hard "$sub_commit")
                    log_success "Standalone updated"
                else
                    log_info "Fix: cd $standalone_path && git reset --hard $sub_commit"
                fi
            else
                log_error "Branches have diverged (different histories)"
                log_info "Manual resolution required"
            fi
        fi
    else
        # Standalone doesn't exist
        echo
        log_warning "$edition: No standalone repository"
        if [[ "$FIX_MODE" == true ]]; then
            log_fix "Creating standalone repository..."
            local remote_url=$(git -C "$submodule_path" config --get remote.origin.url)
            git clone "$remote_url" "$standalone_path"
            log_success "Standalone created"
        else
            log_info "Fix: git clone <remote-url> $standalone_path"
        fi
    fi

    # Check for uncommitted changes
    echo
    if [[ $sub_dirty -gt 0 ]]; then
        log_warning "$edition: Submodule has $sub_dirty uncommitted changes"
        git -C "$submodule_path" status --short | head -10
        if [[ $(git -C "$submodule_path" status --short | wc -l) -gt 10 ]]; then
            echo "    ... and $(($(git -C "$submodule_path" status --short | wc -l) - 10)) more"
        fi
        if [[ "$FIX_MODE" == true ]]; then
            log_fix "Committing changes..."
            (cd "$submodule_path" && git add -A && git commit -m "chore: Auto-commit pending changes")
            log_success "Changes committed"
        else
            log_info "Fix: cd $submodule_path && git add -A && git commit -m 'commit message'"
        fi
    fi

    if [[ $sub_untracked -gt 0 ]]; then
        log_warning "$edition: Submodule has $sub_untracked untracked files"
        git -C "$submodule_path" ls-files --others --exclude-standard | head -10
        if [[ $(git -C "$submodule_path" ls-files --others --exclude-standard | wc -l) -gt 10 ]]; then
            echo "    ... and $(($(git -C "$submodule_path" ls-files --others --exclude-standard | wc -l) - 10)) more"
        fi
        log_info "Fix: Review and either commit or add to .gitignore"
    fi

    # Generate JSON report entry if requested
    if [[ "$REPORT_MODE" == true ]]; then
        cat >> "$REPORT_FILE" << EOF
    "$edition": {
      "submodule_commit": "${sub_commit:0:8}",
      "standalone_commit": "${sta_commit:0:8}",
      "commits_match": $([ "$sub_commit" == "$sta_commit" ] && echo "true" || echo "false"),
      "submodule_dirty": $sub_dirty,
      "submodule_untracked": $sub_untracked,
      "standalone_exists": $standalone_exists
    },
EOF
    fi

    echo
}

# Main execution
log_section "True Valence Mapper - Advanced Sync Analysis"

echo "Configuration:"
echo "  Parent: $PARENT"
echo "  Fix mode: $FIX_MODE"
echo "  Report mode: $REPORT_MODE"
if [[ -n "$SPECIFIC_EDITION" ]]; then
    echo "  Checking: $SPECIFIC_EDITION only"
fi
echo

# Analyze editions
if [[ -n "$SPECIFIC_EDITION" ]]; then
    analyze_edition "$SPECIFIC_EDITION"
else
    for edition in "${EDITIONS[@]}"; do
        analyze_edition "$edition"
    done
fi

# Finalize JSON report
if [[ "$REPORT_MODE" == true ]]; then
    # Remove trailing comma and close JSON
    sed -i '$ s/,$//' "$REPORT_FILE"
    echo "  }}" >> "$REPORT_FILE"
    log_success "Report generated: $REPORT_FILE"
fi

log_section "Analysis Complete"

if [[ "$FIX_MODE" == true ]]; then
    log_success "Automatic fixes applied where possible"
    log_info "Review changes and commit to parent repo if needed"
else
    log_info "Re-run with --fix to apply automatic remediation"
fi

echo
