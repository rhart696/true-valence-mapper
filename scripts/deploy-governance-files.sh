#!/bin/bash
# Deploy AGENTS.md governance files to all edition repositories
# Usage: ./scripts/deploy-governance-files.sh [--dry-run] [edition1,edition2,...]

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PARENT_DIR="$(dirname "$SCRIPT_DIR")"
TEMPLATE_FILE="$PARENT_DIR/shared/templates/AGENTS.md.template"
LOCAL_TEMPLATE_FILE="$PARENT_DIR/shared/templates/AGENTS.local.md.template"
EDITIONS_FILE="$PARENT_DIR/shared/templates/editions.json"

DRY_RUN=false
TARGET_EDITIONS=""

# Parse arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        --dry-run)
            DRY_RUN=true
            shift
            ;;
        *)
            TARGET_EDITIONS="$1"
            shift
            ;;
    esac
done

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}  Governance File Deployment${NC}"
echo -e "${BLUE}========================================${NC}"
echo ""

if [ "$DRY_RUN" = true ]; then
    echo -e "${YELLOW}DRY RUN MODE - No changes will be made${NC}"
    echo ""
fi

# Check required files
if [ ! -f "$TEMPLATE_FILE" ]; then
    echo -e "${RED}ERROR: Template file not found: $TEMPLATE_FILE${NC}"
    exit 1
fi

if [ ! -f "$EDITIONS_FILE" ]; then
    echo -e "${RED}ERROR: Editions config not found: $EDITIONS_FILE${NC}"
    exit 1
fi

# Get template version
TEMPLATE_VERSION=$(jq -r '.template_version' "$EDITIONS_FILE")
SYNC_DATE=$(date -u +"%Y-%m-%d")

echo "Template Version: $TEMPLATE_VERSION"
echo "Sync Date: $SYNC_DATE"
echo ""

# Get list of editions
if [ -z "$TARGET_EDITIONS" ]; then
    EDITIONS=$(jq -r '.editions | keys[]' "$EDITIONS_FILE")
else
    EDITIONS=$(echo "$TARGET_EDITIONS" | tr ',' '\n')
fi

# Process each edition
for EDITION in $EDITIONS; do
    echo -e "${BLUE}--- Processing: $EDITION ---${NC}"

    # Get edition config
    EDITION_NAME=$(jq -r ".editions[\"$EDITION\"].name" "$EDITIONS_FILE")
    EDITION_FOCUS=$(jq -r ".editions[\"$EDITION\"].focus" "$EDITIONS_FILE")
    EDITION_REPO=$(jq -r ".editions[\"$EDITION\"].repo" "$EDITIONS_FILE")

    if [ "$EDITION_NAME" = "null" ]; then
        echo -e "${YELLOW}  Skipping unknown edition: $EDITION${NC}"
        continue
    fi

    echo "  Name: $EDITION_NAME"
    echo "  Focus: $EDITION_FOCUS"
    echo "  Repo: $EDITION_REPO"

    # Find local repo path
    EDITION_PATH="$PARENT_DIR/../$EDITION_REPO"

    if [ ! -d "$EDITION_PATH" ]; then
        echo -e "${YELLOW}  WARNING: Local repo not found at $EDITION_PATH${NC}"
        echo -e "${YELLOW}  Skipping (clone the repo first)${NC}"
        continue
    fi

    # Generate AGENTS.md from template
    GENERATED_FILE=$(mktemp)
    sed -e "s/{{EDITION_NAME}}/$EDITION_NAME/g" \
        -e "s|{{EDITION_FOCUS}}|$EDITION_FOCUS|g" \
        -e "s/{{TEMPLATE_VERSION}}/$TEMPLATE_VERSION/g" \
        -e "s/{{SYNC_DATE}}/$SYNC_DATE/g" \
        "$TEMPLATE_FILE" > "$GENERATED_FILE"

    if [ "$DRY_RUN" = true ]; then
        echo -e "${YELLOW}  Would create/update AGENTS.md${NC}"
        echo -e "${YELLOW}  Would create symlink CLAUDE.md -> AGENTS.md${NC}"
        echo -e "${YELLOW}  Would create AGENTS.local.md (if not exists)${NC}"
    else
        # Copy AGENTS.md
        cp "$GENERATED_FILE" "$EDITION_PATH/AGENTS.md"
        echo -e "${GREEN}  Created AGENTS.md${NC}"

        # Create/update CLAUDE.md symlink
        cd "$EDITION_PATH"
        if [ -f "CLAUDE.md" ] && [ ! -L "CLAUDE.md" ]; then
            rm CLAUDE.md
        fi
        if [ ! -L "CLAUDE.md" ]; then
            ln -sf AGENTS.md CLAUDE.md
            echo -e "${GREEN}  Created CLAUDE.md symlink${NC}"
        else
            echo -e "${GREEN}  CLAUDE.md symlink already exists${NC}"
        fi

        # Create AGENTS.local.md only if it doesn't exist (preserve edition-specific content)
        if [ ! -f "AGENTS.local.md" ] && [ -f "$LOCAL_TEMPLATE_FILE" ]; then
            sed -e "s/{{EDITION_NAME}}/$EDITION_NAME/g" \
                -e "s|{{EDITION_FOCUS}}|$EDITION_FOCUS|g" \
                -e "s/{{SYNC_DATE}}/$SYNC_DATE/g" \
                "$LOCAL_TEMPLATE_FILE" > "AGENTS.local.md"
            echo -e "${GREEN}  Created AGENTS.local.md (edition-specific)${NC}"
        else
            echo -e "${YELLOW}  AGENTS.local.md already exists (preserved)${NC}"
        fi

        # Git operations
        if git diff --quiet AGENTS.md 2>/dev/null && git diff --quiet AGENTS.local.md 2>/dev/null; then
            echo -e "${YELLOW}  No changes to commit${NC}"
        else
            git add AGENTS.md CLAUDE.md
            if [ -f "AGENTS.local.md" ]; then
                git add AGENTS.local.md
            fi
            git commit -m "chore: sync governance files from parent template (v$TEMPLATE_VERSION)

Template version: $TEMPLATE_VERSION
Sync date: $SYNC_DATE

Files synced:
- AGENTS.md (always updated)
- CLAUDE.md (symlink)
- AGENTS.local.md (created if new)

See: https://github.com/rhart696/true-valence-mapper/blob/main/docs/GOVERNANCE-WORKFLOW.md"
            echo -e "${GREEN}  Committed changes${NC}"
        fi

        cd "$PARENT_DIR"
    fi

    rm "$GENERATED_FILE"
    echo ""
done

echo -e "${BLUE}========================================${NC}"
echo -e "${GREEN}  Deployment Complete${NC}"
echo -e "${BLUE}========================================${NC}"
echo ""
echo "Next steps:"
echo "1. Review changes in each edition repo"
echo "2. Push changes: cd ../true-valence-mapper-{edition} && git push"
echo "3. Or push all: for d in ../true-valence-mapper-*; do (cd \$d && git push); done"
