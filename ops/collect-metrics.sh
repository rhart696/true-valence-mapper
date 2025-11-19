#!/usr/bin/env bash

set -euo pipefail

# Collect metrics from all editions for the status dashboard
# Outputs JSON file with current status

OUTPUT_FILE="${1:-ops/status.json}"
TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

echo "Collecting metrics for True Valence Mapper editions..."

# Initialize JSON
cat > "${OUTPUT_FILE}" <<EOF
{
  "timestamp": "${TIMESTAMP}",
  "parent": {
    "repo": "rhart696/true-valence-mapper",
    "url": "https://github.com/rhart696/true-valence-mapper"
  },
  "editions": []
}
EOF

# Function to collect edition metrics
collect_edition_metrics() {
  local edition="$1"
  local repo="rhart696/true-valence-mapper-${edition}"

  echo "Collecting metrics for ${edition}..."

  # Check if repo exists
  if ! gh repo view "${repo}" >/dev/null 2>&1; then
    echo "  ⚠️  Repository not found: ${repo}"
    return
  fi

  # Get basic repo info
  REPO_INFO=$(gh repo view "${repo}" --json name,description,url,isPrivate,createdAt,pushedAt,defaultBranchRef)

  # Get commit count (last 7 days)
  COMMITS_WEEK=$(gh api "repos/${repo}/commits" --jq '. | length' 2>/dev/null || echo "0")

  # Get open issues
  OPEN_ISSUES=$(gh issue list --repo "${repo}" --state open --json number --jq '. | length' 2>/dev/null || echo "0")

  # Get open PRs
  OPEN_PRS=$(gh pr list --repo "${repo}" --state open --json number --jq '. | length' 2>/dev/null || echo "0")

  # Get latest commit
  LATEST_COMMIT=$(gh api "repos/${repo}/commits" --jq '.[0] | {sha: .sha[0:7], message: .commit.message | split("\n")[0], author: .commit.author.name, date: .commit.author.date}' 2>/dev/null || echo '{}')

  # Check if GitHub Pages is deployed
  PAGES_URL="https://rhart696.github.io/true-valence-mapper-${edition}/"
  PAGES_STATUS="unknown"
  if curl -s -o /dev/null -w "%{http_code}" "${PAGES_URL}" | grep -q "200"; then
    PAGES_STATUS="deployed"
  else
    PAGES_STATUS="not-deployed"
  fi

  # Build JSON for this edition
  cat <<EDITION_EOF
{
  "name": "${edition}",
  "repo": "${repo}",
  "info": ${REPO_INFO},
  "metrics": {
    "commits_this_week": ${COMMITS_WEEK},
    "open_issues": ${OPEN_ISSUES},
    "open_prs": ${OPEN_PRS},
    "pages_status": "${PAGES_STATUS}",
    "pages_url": "${PAGES_URL}"
  },
  "latest_commit": ${LATEST_COMMIT}
}
EDITION_EOF
}

# Collect metrics for each edition
CLAUDE_JSON=$(collect_edition_metrics "claude")
CODEX_JSON=$(collect_edition_metrics "codex")
BMAD_JSON=$(collect_edition_metrics "bmad")
SPECKIT_JSON=$(collect_edition_metrics "spec-kit")
MAGICPATH_JSON=$(collect_edition_metrics "magic-path")
OPENSPEC_JSON=$(collect_edition_metrics "openspec")

# Combine into single JSON (simplified - would use jq in production)
cat > "${OUTPUT_FILE}" <<EOF
{
  "timestamp": "${TIMESTAMP}",
  "parent": {
    "repo": "rhart696/true-valence-mapper",
    "url": "https://github.com/rhart696/true-valence-mapper"
  },
  "editions": [
    ${CLAUDE_JSON},
    ${CODEX_JSON},
    ${BMAD_JSON},
    ${SPECKIT_JSON},
    ${MAGICPATH_JSON},
    ${OPENSPEC_JSON}
  ]
}
EOF

echo "✓ Metrics collected: ${OUTPUT_FILE}"
echo "View dashboard: open ops/index.html"
