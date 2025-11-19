#!/usr/bin/env bash

set -euo pipefail

# Comprehensive validation of all editions
# Tests: repos exist, submodules configured, READMEs present, installations viable

echo "═══════════════════════════════════════════════════════════"
echo " True Valence Mapper - Edition Validation"
echo "═══════════════════════════════════════════════════════════"
echo ""

PARENT_DIR="/home/ichardart/dev/projects/true-valence-mapper"
ERRORS=0
WARNINGS=0

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

log_success() {
  echo -e "${GREEN}✓${NC} $1"
}

log_error() {
  echo -e "${RED}✗${NC} $1"
  ((ERRORS++))
}

log_warning() {
  echo -e "${YELLOW}⚠${NC} $1"
  ((WARNINGS++))
}

log_info() {
  echo -e "${BLUE}ℹ${NC} $1"
}

# Test 1: Verify parent repository structure
echo "Test 1: Parent Repository Structure"
echo "-----------------------------------"

if [[ -d "${PARENT_DIR}/.git" ]]; then
  log_success "Parent repository exists"
else
  log_error "Parent repository not found"
fi

REQUIRED_DIRS=("docs" "shared" "versions" "ops" "scripts")
for dir in "${REQUIRED_DIRS[@]}"; do
  if [[ -d "${PARENT_DIR}/${dir}" ]]; then
    log_success "Directory exists: ${dir}/"
  else
    log_error "Missing directory: ${dir}/"
  fi
done

REQUIRED_FILES=("README.md" "LICENSE" ".gitmodules" "PHASE-1-COMPLETE.md" "PHASE-2-COMPLETE.md" "PHASE-3-COMPLETE.md")
for file in "${REQUIRED_FILES[@]}"; do
  if [[ -f "${PARENT_DIR}/${file}" ]]; then
    log_success "File exists: ${file}"
  else
    log_error "Missing file: ${file}"
  fi
done

echo ""

# Test 2: Verify all edition repositories exist on GitHub
echo "Test 2: GitHub Repository Verification"
echo "--------------------------------------"

EDITIONS=("claude" "codex" "bmad" "spec-kit" "magic-path" "openspec")
for edition in "${EDITIONS[@]}"; do
  REPO="rhart696/true-valence-mapper-${edition}"
  if gh repo view "${REPO}" >/dev/null 2>&1; then
    log_success "GitHub repo exists: ${REPO}"
  else
    log_error "GitHub repo NOT found: ${REPO}"
  fi
done

echo ""

# Test 3: Verify submodule configuration
echo "Test 3: Git Submodule Configuration"
echo "-----------------------------------"

cd "${PARENT_DIR}"

for edition in "${EDITIONS[@]}"; do
  SUBMODULE_PATH="versions/${edition}"
  if git config --file .gitmodules --get "submodule.${SUBMODULE_PATH}.url" >/dev/null 2>&1; then
    log_success "Submodule configured: ${edition}"

    # Check if submodule is initialized
    if [[ -d "${SUBMODULE_PATH}/.git" ]]; then
      log_success "  Submodule initialized: ${edition}"
    else
      log_warning "  Submodule NOT initialized: ${edition} (run: git submodule update --init)"
    fi
  else
    log_error "Submodule NOT configured: ${edition}"
  fi
done

echo ""

# Test 4: Verify edition READMEs exist and contain key information
echo "Test 4: Edition README Validation"
echo "---------------------------------"

for edition in "${EDITIONS[@]}"; do
  README_PATH="versions/${edition}/README.md"
  if [[ -f "${README_PATH}" ]]; then
    log_success "README exists: ${edition}"

    # Check for key sections
    if grep -q "True Valence" "${README_PATH}"; then
      log_success "  Contains 'True Valence' branding"
    else
      log_warning "  Missing 'True Valence' branding"
    fi

    if grep -q "Installation" "${README_PATH}" || grep -q "Setup" "${README_PATH}"; then
      log_success "  Contains installation/setup instructions"
    else
      log_warning "  Missing installation/setup section"
    fi
  else
    log_error "README missing: ${edition}"
  fi
done

echo ""

# Test 5: Verify tool-specific configurations
echo "Test 5: Tool-Specific Configuration"
echo "-----------------------------------"

# BMAD: Check for package.json
if [[ -f "versions/bmad/package.json" ]]; then
  log_success "BMAD: package.json exists"
  if grep -q "bmad-method" "versions/bmad/package.json"; then
    log_success "  BMAD dependency declared"
    VERSION=$(grep -oP '(?<="bmad-method": ")[^"]*' "versions/bmad/package.json" || echo "unknown")
    log_info "  Version: ${VERSION}"
  else
    log_warning "  BMAD dependency not found in package.json"
  fi
else
  log_warning "BMAD: package.json missing"
fi

# Spec-Kit: Check README mentions uv or specify-cli
if grep -q "uv tool install" "versions/spec-kit/README.md" 2>/dev/null; then
  log_success "Spec-Kit: Installation method documented (uv)"
elif grep -q "specify" "versions/spec-kit/README.md" 2>/dev/null; then
  log_success "Spec-Kit: Specify CLI documented"
else
  log_warning "Spec-Kit: Installation method unclear"
fi

# OpenSpec: Check for version mention
if grep -q "v0.15.0" "versions/openspec/README.md" 2>/dev/null; then
  log_success "OpenSpec: Version v0.15.0 documented"
else
  log_warning "OpenSpec: Version not clearly documented"
fi

# Magic-Path: Check for custom methodology documentation
if grep -q "Custom Methodology" "versions/magic-path/README.md" 2>/dev/null || grep -q "Magic-Path" "versions/magic-path/README.md" 2>/dev/null; then
  log_success "Magic-Path: Custom methodology documented"
else
  log_warning "Magic-Path: Methodology documentation unclear"
fi

echo ""

# Test 6: Verify parent repo documentation updated
echo "Test 6: Parent Documentation Updates"
echo "------------------------------------"

# Check README mentions all editions
MISSING_EDITIONS=()
for edition in "${EDITIONS[@]}"; do
  if grep -q "true-valence-mapper-${edition}" "${PARENT_DIR}/README.md"; then
    log_success "README mentions: ${edition}"
  else
    log_error "README missing: ${edition}"
    MISSING_EDITIONS+=("${edition}")
  fi
done

# Check dashboard includes all editions
for edition in "${EDITIONS[@]}"; do
  EDITION_NAME="${edition^}"  # Capitalize first letter
  if grep -q "${edition}" "${PARENT_DIR}/ops/index.html"; then
    log_success "Dashboard includes: ${edition}"
  else
    log_error "Dashboard missing: ${edition}"
  fi
done

# Check metrics script includes all editions
if grep -q "bmad" "${PARENT_DIR}/ops/collect-metrics.sh" && \
   grep -q "spec-kit" "${PARENT_DIR}/ops/collect-metrics.sh" && \
   grep -q "magic-path" "${PARENT_DIR}/ops/collect-metrics.sh" && \
   grep -q "openspec" "${PARENT_DIR}/ops/collect-metrics.sh"; then
  log_success "Metrics script includes all new editions"
else
  log_warning "Metrics script may be missing some editions"
fi

echo ""

# Test 7: Verify installations can be performed (dry-run where possible)
echo "Test 7: Installation Viability"
echo "------------------------------"

# Test BMAD installation command exists
if command -v npx >/dev/null 2>&1; then
  log_success "npx available for BMAD installation"
  # Verify BMAD package exists
  if npm view bmad-method@alpha version >/dev/null 2>&1; then
    BMAD_VERSION=$(npm view bmad-method@alpha version)
    log_success "  BMAD package accessible: v${BMAD_VERSION}"
  else
    log_error "  BMAD package NOT accessible via npm"
  fi
else
  log_warning "npx not available (Node.js required for BMAD)"
fi

# Test if uv is available for Spec-Kit
if command -v uv >/dev/null 2>&1; then
  log_success "uv available for Spec-Kit installation"
else
  log_warning "uv not installed (recommended for Spec-Kit)"
  log_info "  Install: curl -LsSf https://astral.sh/uv/install.sh | sh"
fi

# Test if Python 3.11+ available for Spec-Kit and OpenSpec
if command -v python3 >/dev/null 2>&1; then
  PYTHON_VERSION=$(python3 --version | grep -oP '\d+\.\d+')
  log_success "Python available: ${PYTHON_VERSION}"
  if [[ $(echo "${PYTHON_VERSION} >= 3.11" | bc -l 2>/dev/null || echo 0) -eq 1 ]]; then
    log_success "  Python version sufficient for Spec-Kit/OpenSpec"
  else
    log_warning "  Python < 3.11 (Spec-Kit requires 3.11+)"
  fi
else
  log_error "Python3 not available"
fi

# Check Node.js for Magic-Path (future implementation)
if command -v node >/dev/null 2>&1; then
  NODE_VERSION=$(node --version)
  log_success "Node.js available for Magic-Path: ${NODE_VERSION}"
else
  log_warning "Node.js not available (recommended for Magic-Path UX development)"
fi

echo ""

# Test 8: Test GitHub API access
echo "Test 8: GitHub API & CLI Access"
echo "-------------------------------"

if command -v gh >/dev/null 2>&1; then
  log_success "GitHub CLI (gh) available"

  # Test authentication
  if gh auth status >/dev/null 2>&1; then
    log_success "  GitHub CLI authenticated"
  else
    log_warning "  GitHub CLI not authenticated"
  fi
else
  log_error "GitHub CLI not available"
fi

echo ""

# Summary
echo "═══════════════════════════════════════════════════════════"
echo " Validation Summary"
echo "═══════════════════════════════════════════════════════════"
echo ""
echo "Total Editions Validated: ${#EDITIONS[@]}"
echo -e "Errors:   ${RED}${ERRORS}${NC}"
echo -e "Warnings: ${YELLOW}${WARNINGS}${NC}"
echo ""

if [[ ${ERRORS} -eq 0 ]]; then
  echo -e "${GREEN}✓ All critical validations passed!${NC}"
  echo ""
  echo "Next steps:"
  echo "  1. Review warnings (if any) and address as needed"
  echo "  2. Test tool installations in each edition:"
  echo "     - BMAD: cd versions/bmad && npm run install-bmad"
  echo "     - Spec-Kit: uv tool install specify-cli --from git+https://github.com/github/spec-kit.git"
  echo "     - OpenSpec: npm install -g openspec@0.15.0"
  echo "  3. View dashboard: open ops/index.html"
  echo "  4. Begin validation period with parallel development"
  exit 0
else
  echo -e "${RED}✗ Validation failed with ${ERRORS} error(s)${NC}"
  echo ""
  echo "Please address errors above before proceeding."
  exit 1
fi
