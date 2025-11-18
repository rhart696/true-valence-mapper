#!/usr/bin/env bash

set -euo pipefail

# Script to sync shared components from parent repo to an edition
# Usage: ./sync-shared-to-edition.sh [edition-name] [component-path]

EDITION="${1:-}"
COMPONENT="${2:-}"
PARENT_DIR="/home/ichardart/dev/projects/true-valence-mapper"
DRY_RUN="${DRY_RUN:-false}"

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

usage() {
  cat <<EOF
Usage: $0 <edition-name> [component-path]

Sync shared components from parent repo to an edition.

Arguments:
  edition-name    Name of edition (claude, codex, gemini, etc.)
  component-path  Optional: Specific component to sync (e.g., shared/styles/theme.css)
                  If omitted, syncs all shared components

Examples:
  # Sync all shared components to Claude edition
  $0 claude

  # Sync specific component to Codex edition
  $0 codex shared/security/input-validation.js

  # Dry run (preview changes without copying)
  DRY_RUN=true $0 claude

Environment Variables:
  DRY_RUN    Set to 'true' to preview changes without copying (default: false)

EOF
  exit 1
}

log_info() {
  echo -e "${GREEN}ℹ${NC} $*"
}

log_warn() {
  echo -e "${YELLOW}⚠${NC} $*"
}

log_error() {
  echo -e "${RED}✗${NC} $*"
}

# Validate arguments
if [[ -z "${EDITION}" ]]; then
  log_error "Edition name required"
  usage
fi

EDITION_DIR="/home/ichardart/dev/projects/true-valence-mapper-${EDITION}"

# Check edition directory exists
if [[ ! -d "${EDITION_DIR}" ]]; then
  log_error "Edition directory not found: ${EDITION_DIR}"
  log_info "Available editions:"
  ls -d /home/ichardart/dev/projects/true-valence-mapper-* 2>/dev/null | xargs -n1 basename || true
  exit 1
fi

# Check parent repo exists
if [[ ! -d "${PARENT_DIR}/shared" ]]; then
  log_error "Parent repo shared directory not found: ${PARENT_DIR}/shared"
  exit 1
fi

log_info "=== Shared Component Sync ==="
log_info "Edition: ${EDITION}"
log_info "Edition directory: ${EDITION_DIR}"
log_info "Parent directory: ${PARENT_DIR}"
log_info "Dry run: ${DRY_RUN}"
echo ""

# Determine what to sync
if [[ -n "${COMPONENT}" ]]; then
  # Sync specific component
  COMPONENT_FULL="${PARENT_DIR}/${COMPONENT}"

  if [[ ! -e "${COMPONENT_FULL}" ]]; then
    log_error "Component not found: ${COMPONENT}"
    exit 1
  fi

  log_info "Syncing specific component: ${COMPONENT}"

  # Determine destination
  DEST="${EDITION_DIR}/${COMPONENT#shared/}"
  DEST_DIR=$(dirname "${DEST}")

  log_info "Source: ${COMPONENT_FULL}"
  log_info "Destination: ${DEST}"

  if [[ "${DRY_RUN}" == "true" ]]; then
    log_warn "DRY RUN: Would copy ${COMPONENT} to ${DEST}"
  else
    mkdir -p "${DEST_DIR}"
    cp -v "${COMPONENT_FULL}" "${DEST}"
    log_info "✓ Copied ${COMPONENT}"
  fi

else
  # Sync all shared components
  log_info "Syncing all shared components..."

  SYNCED=0
  SKIPPED=0

  # Find all files in shared/
  while IFS= read -r file; do
    REL_PATH="${file#${PARENT_DIR}/shared/}"
    DEST="${EDITION_DIR}/shared/${REL_PATH}"
    DEST_DIR=$(dirname "${DEST}")

    # Skip README files (documentation only)
    if [[ "$(basename "$file")" == "README.md" ]]; then
      continue
    fi

    if [[ "${DRY_RUN}" == "true" ]]; then
      log_warn "DRY RUN: Would copy shared/${REL_PATH}"
      ((SYNCED++))
    else
      mkdir -p "${DEST_DIR}"
      cp -v "${file}" "${DEST}"
      ((SYNCED++))
    fi

  done < <(find "${PARENT_DIR}/shared" -type f -not -name "README.md")

  echo ""
  log_info "Summary: ${SYNCED} component(s) synced"

  if [[ ${SYNCED} -eq 0 ]]; then
    log_warn "No shared components found to sync"
    log_info "Shared components are added via feature promotion workflow"
  fi
fi

echo ""

if [[ "${DRY_RUN}" == "true" ]]; then
  log_warn "DRY RUN completed - no files were actually copied"
  log_info "Run without DRY_RUN=true to perform actual sync"
else
  log_info "✓ Sync completed successfully!"
  log_info ""
  log_info "Next steps:"
  log_info "1. Review changes: cd ${EDITION_DIR} && git status"
  log_info "2. Test integration: [run your edition's tests]"
  log_info "3. Commit: git add . && git commit -m 'Adopt shared component updates'"
  log_info "4. Push: git push origin main"
fi
