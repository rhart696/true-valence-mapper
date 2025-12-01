#!/bin/bash
# Health Check Script for Dual-Location Repository Pattern
# Validates synchronization between standalone repos and submodules
#
# Usage: ./scripts/health-check.sh [--verbose]
#
# Exit codes:
#   0 - All checks passed
#   1 - Warnings found (out of sync but not critical)
#   2 - Errors found (missing repos or critical issues)

set -euo pipefail

# Configuration
PARENT="/home/ichardart/dev/projects/true-valence-mapper"
EDITIONS=("claude" "codex" "bmad" "spec-kit" "magic-path" "openspec" "Gemini_3")
VERBOSE=false
WARNINGS=0
ERRORS=0

# Colors
RED='\033[0;31m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Parse arguments
if [[ "${1:-}" == "--verbose" ]]; then
    VERBOSE=true
fi

# Helper functions
log_info() {
    echo -e "${BLUE}ℹ️  $1${NC}"
}

log_success() {
    echo -e "${GREEN}✅ $1${NC}"
}

log_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
    ((WARNINGS++)) || true
}

log_error() {
    echo -e "${RED}❌ $1${NC}"
    ((ERRORS++)) || true
}

# Header
echo "════════════════════════════════════════════════════════════════"
echo "  True Valence Mapper - Repository Health Check"
echo "  Dual-Location Pattern Validation"
echo "════════════════════════════════════════════════════════════════"
echo

# Check 1: Parent repository exists
echo "📋 Checking parent repository..."
if [[ ! -d "$PARENT" ]]; then
    log_error "Parent repository not found at $PARENT"
    exit 2
fi

if [[ ! -d "$PARENT/.git" ]]; then
    log_error "Parent directory exists but is not a git repository"
    exit 2
fi

log_success "Parent repository found: $PARENT"
echo

# Check 2: Submodule configuration
echo "📋 Checking git submodule configuration..."
if [[ ! -f "$PARENT/.gitmodules" ]]; then
    log_warning "No .gitmodules file found"
else
    SUBMODULE_COUNT=$(grep -c "^\[submodule" "$PARENT/.gitmodules" || true)
    log_success "Found $SUBMODULE_COUNT submodules configured in .gitmodules"

    if [[ "$VERBOSE" == true ]]; then
        echo "   Configured submodules:"
        grep "path = " "$PARENT/.gitmodules" | sed 's/.*= /     - /'
    fi
fi
echo

# Check 3: Edition-by-edition validation
echo "📋 Checking individual editions..."
echo

for edition in "${EDITIONS[@]}"; do
    echo "  Checking: $edition"
    echo "  ────────────────────────────────────────"

    submodule_path="$PARENT/versions/$edition"
    standalone_path="/home/ichardart/dev/projects/true-valence-mapper-$edition"

    # Check submodule existence
    if [[ ! -d "$submodule_path" ]]; then
        log_warning "$edition: Submodule directory missing at $submodule_path"
        echo
        continue
    fi

    # Check if submodule is initialized
    if [[ ! -e "$submodule_path/.git" ]]; then
        log_warning "$edition: Submodule not initialized (run: git submodule update --init)"
        echo
        continue
    fi

    # Get submodule commit
    sub_commit=$(git -C "$submodule_path" rev-parse HEAD 2>/dev/null || echo "UNKNOWN")
    sub_branch=$(git -C "$submodule_path" rev-parse --abbrev-ref HEAD 2>/dev/null || echo "DETACHED")

    # Check standalone existence
    if [[ ! -d "$standalone_path" ]]; then
        log_info "$edition: Submodule only (standalone not present)"
        if [[ "$VERBOSE" == true ]]; then
            echo "     Submodule commit: ${sub_commit:0:8}"
            echo "     Submodule branch: $sub_branch"
        fi
        echo
        continue
    fi

    # Check standalone is git repo
    if [[ ! -d "$standalone_path/.git" ]]; then
        log_error "$edition: Standalone directory exists but is not a git repository"
        echo
        continue
    fi

    # Get standalone commit
    sta_commit=$(git -C "$standalone_path" rev-parse HEAD 2>/dev/null || echo "UNKNOWN")
    sta_branch=$(git -C "$standalone_path" rev-parse --abbrev-ref HEAD 2>/dev/null || echo "UNKNOWN")

    # Compare commits
    if [[ "$sub_commit" == "UNKNOWN" ]] || [[ "$sta_commit" == "UNKNOWN" ]]; then
        log_error "$edition: Unable to determine git commit"
        echo
        continue
    fi

    if [[ "$sub_commit" != "$sta_commit" ]]; then
        log_warning "$edition: Out of sync"
        echo "     Submodule: ${sub_commit:0:8} (branch: $sub_branch)"
        echo "     Standalone: ${sta_commit:0:8} (branch: $sta_branch)"

        # Determine which is ahead
        if git -C "$standalone_path" merge-base --is-ancestor "$sub_commit" "$sta_commit" 2>/dev/null; then
            echo "     → Standalone is ahead (run: git submodule update --remote versions/$edition)"
        elif git -C "$standalone_path" merge-base --is-ancestor "$sta_commit" "$sub_commit" 2>/dev/null; then
            echo "     → Submodule is ahead (unusual - check if parent was updated manually)"
        else
            echo "     → Diverged (branches have different histories)"
        fi
    else
        log_success "$edition: In sync (${sub_commit:0:8})"
        if [[ "$VERBOSE" == true ]]; then
            echo "     Branch: $sta_branch"

            # Check for uncommitted changes
            if [[ -n $(git -C "$standalone_path" status --porcelain) ]]; then
                echo "     ⚠️  Uncommitted changes in standalone repo"
            fi
        fi
    fi

    # Check remote configuration
    if [[ "$VERBOSE" == true ]]; then
        sub_remote=$(git -C "$submodule_path" config --get remote.origin.url 2>/dev/null || echo "NONE")
        sta_remote=$(git -C "$standalone_path" config --get remote.origin.url 2>/dev/null || echo "NONE")

        if [[ "$sub_remote" != "$sta_remote" ]]; then
            log_warning "$edition: Remotes differ"
            echo "     Submodule remote: $sub_remote"
            echo "     Standalone remote: $sta_remote"
        fi
    fi

    echo
done

# Check 4: Shared components (if they exist)
echo "📋 Checking shared components..."
if [[ -d "$PARENT/shared" ]]; then
    SHARED_FILES=$(find "$PARENT/shared" -type f ! -name "README.md" ! -name ".gitkeep" 2>/dev/null | wc -l)

    if [[ $SHARED_FILES -eq 0 ]]; then
        log_info "Shared directory exists but contains no components yet"
    else
        log_success "Found $SHARED_FILES shared component file(s)"

        if [[ "$VERBOSE" == true ]]; then
            echo "   Shared components:"
            find "$PARENT/shared" -type f ! -name "README.md" ! -name ".gitkeep" | sed 's|.*/shared/|     - |'
        fi
    fi
else
    log_warning "Shared directory not found at $PARENT/shared"
fi
echo

# Check 5: Operational scripts
echo "📋 Checking operational scripts..."
SCRIPTS_DIR="$PARENT/scripts"
EXPECTED_SCRIPTS=("sync-shared-to-edition.sh" "validate-setup.sh")

if [[ ! -d "$SCRIPTS_DIR" ]]; then
    log_warning "Scripts directory not found at $SCRIPTS_DIR"
else
    for script in "${EXPECTED_SCRIPTS[@]}"; do
        if [[ -f "$SCRIPTS_DIR/$script" ]]; then
            if [[ -x "$SCRIPTS_DIR/$script" ]]; then
                log_success "Script found and executable: $script"
            else
                log_warning "Script found but not executable: $script (run: chmod +x scripts/$script)"
            fi
        else
            log_info "Optional script not present: $script"
        fi
    done
fi
echo

# Check 6: Documentation
echo "📋 Checking documentation..."
DOCS_DIR="$PARENT/docs"
EXPECTED_DOCS=("GOVERNANCE.md" "ARCHITECTURE.md" "REPOSITORY-STRUCTURE.md")

if [[ ! -d "$DOCS_DIR" ]]; then
    log_warning "Docs directory not found at $DOCS_DIR"
else
    for doc in "${EXPECTED_DOCS[@]}"; do
        if [[ -f "$DOCS_DIR/$doc" ]]; then
            log_success "Documentation found: $doc"
        else
            log_warning "Documentation missing: $doc"
        fi
    done
fi
echo

# Check 7: AGENTS.md governance files
echo "📋 Checking AGENTS.md governance files..."
TEMPLATE_FILE="$PARENT/shared/templates/AGENTS.md.template"
EDITIONS_FILE="$PARENT/shared/templates/editions.json"

if [[ ! -f "$TEMPLATE_FILE" ]]; then
    log_warning "AGENTS.md template not found at $TEMPLATE_FILE"
else
    log_success "AGENTS.md template found"
    TEMPLATE_VERSION=$(jq -r '.template_version' "$EDITIONS_FILE" 2>/dev/null || echo "unknown")
    echo "     Template version: $TEMPLATE_VERSION"
fi

# Check AGENTS.md in each edition
for edition in "${EDITIONS[@]}"; do
    standalone_path="/home/ichardart/dev/projects/true-valence-mapper-$edition"

    if [[ ! -d "$standalone_path" ]]; then
        continue
    fi

    agents_file="$standalone_path/AGENTS.md"
    claude_file="$standalone_path/CLAUDE.md"

    if [[ -f "$agents_file" ]]; then
        # Check template version in file (strip markdown formatting like *italics*)
        file_version=$(grep "Template version:" "$agents_file" 2>/dev/null | sed 's/.*: //' | tr -d '*' || echo "unknown")
        if [[ "$file_version" != "$TEMPLATE_VERSION" ]] && [[ "$TEMPLATE_VERSION" != "unknown" ]]; then
            log_warning "$edition: AGENTS.md version mismatch (file: $file_version, template: $TEMPLATE_VERSION)"
        else
            log_success "$edition: AGENTS.md present (v$file_version)"
        fi

        # Check CLAUDE.md symlink
        if [[ -L "$claude_file" ]]; then
            target=$(readlink "$claude_file")
            if [[ "$target" == "AGENTS.md" ]]; then
                if [[ "$VERBOSE" == true ]]; then
                    echo "     CLAUDE.md symlink: OK"
                fi
            else
                log_warning "$edition: CLAUDE.md symlink points to wrong target ($target)"
            fi
        elif [[ -f "$claude_file" ]]; then
            log_warning "$edition: CLAUDE.md exists but is not a symlink (should link to AGENTS.md)"
        else
            log_warning "$edition: CLAUDE.md missing (run: cd $standalone_path && ln -s AGENTS.md CLAUDE.md)"
        fi
    else
        log_warning "$edition: AGENTS.md missing (run: ./scripts/deploy-governance-files.sh)"
    fi
done
echo

# Summary
echo "════════════════════════════════════════════════════════════════"
echo "  Health Check Summary"
echo "════════════════════════════════════════════════════════════════"
echo

if [[ $ERRORS -eq 0 ]] && [[ $WARNINGS -eq 0 ]]; then
    log_success "All checks passed! Repository is healthy."
    echo
    echo "Your dual-location pattern is working correctly."
    exit 0
elif [[ $ERRORS -eq 0 ]]; then
    log_warning "Checks completed with $WARNINGS warning(s)"
    echo
    echo "Repository is functional but has minor issues."
    echo "Review warnings above for optimization opportunities."
    echo
    echo "Common warnings and fixes:"
    echo "  • Out of sync: Run 'git submodule update --remote' in parent repo"
    echo "  • Submodule only: This is normal for editions not actively developed"
    echo "  • Missing docs: See docs/REPOSITORY-STRUCTURE.md for pattern details"
    exit 1
else
    log_error "Checks completed with $ERRORS error(s) and $WARNINGS warning(s)"
    echo
    echo "Repository has critical issues that need attention."
    echo "Review errors above and fix before proceeding."
    exit 2
fi
