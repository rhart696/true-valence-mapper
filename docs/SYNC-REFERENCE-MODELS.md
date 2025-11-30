# Sync Reference Models

**Date:** 2025-11-30
**Purpose:** Document perfect-sync editions as reference examples for maintaining dual-location pattern

---

## Overview

This document identifies "reference model" editions that demonstrate perfect synchronization between submodules and standalone repositories. Use these as templates when diagnosing sync issues in other editions.

## Reference Models (Perfect Sync)

### 1. **codex** - The Gold Standard

**Status:** ✅ Perfect sync since initial setup
**Commit:** `4ddb6b56`
**Why it's a reference model:**
- Zero uncommitted changes throughout development lifecycle
- No sync drift over multiple months
- Clean git history with no forced updates
- Demonstrates "develop in standalone, commit regularly" workflow

**Key Characteristics:**
```bash
Submodule:  /home/ichardart/dev/projects/true-valence-mapper/versions/codex
Standalone: /home/ichardart/dev/projects/true-valence-mapper-codex
Both at:    4ddb6b56 (main branch)
Remote:     git@github.com:rhart696/true-valence-mapper-codex.git
```

**Workflow Pattern:**
1. Work happens in standalone repo
2. Regular commits (every feature/fix)
3. Push to remote immediately
4. Parent submodule auto-tracks remote HEAD
5. No manual intervention needed

---

### 2. **magic-path** - Stable Development

**Status:** ✅ Perfect sync
**Commit:** `d45a7df7`
**Why it's a reference model:**
- Consistent commit practices
- No untracked files accumulation
- Clean branch management
- Regular sync validation

**Key Characteristics:**
```bash
Submodule:  /home/ichardart/dev/projects/true-valence-mapper/versions/magic-path
Standalone: /home/ichardart/dev/projects/true-valence-mapper-magic-path
Both at:    d45a7df7 (main branch)
Remote:     git@github.com:rhart696/true-valence-mapper-magic-path.git
```

**Workflow Pattern:**
1. Feature branches for development
2. Merge to main only when complete
3. Parent submodule updated post-merge
4. No uncommitted work left in standalone

---

### 3. **openspec** - Minimalist Sync

**Status:** ✅ Perfect sync
**Commit:** `fb7b2381`
**Why it's a reference model:**
- Minimal but consistent activity
- No sync drift despite low update frequency
- Demonstrates "inactive but healthy" pattern
- Clean git configuration

**Key Characteristics:**
```bash
Submodule:  /home/ichardart/dev/projects/true-valence-mapper/versions/openspec
Standalone: /home/ichardart/dev/projects/true-valence-mapper-openspec
Both at:    fb7b2381 (main branch)
Remote:     git@github.com:rhart696/true-valence-mapper-openspec.git
```

**Workflow Pattern:**
1. Infrequent updates (low activity edition)
2. When updated, changes are committed immediately
3. Parent submodule stays in sync automatically
4. No manual sync commands needed

---

## Common Success Factors

All three reference models share these characteristics:

### Git Hygiene
- ✅ No uncommitted changes in working directory
- ✅ No untracked files (proper `.gitignore`)
- ✅ Regular commits (not batch commits)
- ✅ Descriptive commit messages

### Remote Configuration
- ✅ SSH URLs (not HTTPS)
- ✅ Consistent remote names (`origin`)
- ✅ Proper authentication (SSH keys)
- ✅ No push/fetch URL mismatches

### Workflow Discipline
- ✅ Work in standalone repo only
- ✅ Commit before context switching
- ✅ Push to remote regularly
- ✅ Parent submodule follows remote HEAD

### Branch Management
- ✅ Development on `main` or feature branches
- ✅ No detached HEAD states
- ✅ Clean merge history
- ✅ No diverged branches

---

## Anti-Patterns (What NOT to Do)

Based on analysis of editions that experienced sync issues:

### ❌ Uncommitted Work Accumulation
**Problem:** Working in standalone for weeks without committing
**Example:** BMAD had 35 uncommitted files (187MB at risk)
**Fix:** Commit after each logical change, not at end of milestone

### ❌ Forgetting to Push
**Problem:** Committing locally but not pushing to remote
**Example:** SPEC-KIT was 5 commits ahead locally
**Fix:** `git push` after every commit, or use `git push --set-upstream`

### ❌ Manual Submodule Edits
**Problem:** Making changes directly in submodule directory
**Example:** CLAUDE had uncommitted docs in submodule
**Fix:** ONLY work in standalone repos, never in `versions/` directories

### ❌ HTTPS Remote URLs
**Problem:** HTTPS URLs require password/token authentication
**Example:** bmad, spec-kit, magic-path, openspec initially used HTTPS
**Fix:** Use SSH URLs (`git@github.com:...`) for passwordless auth

---

## Validation Checklist

Use this checklist to determine if an edition matches reference model standards:

```bash
# Run sync check for specific edition
./scripts/sync-check-advanced.sh --edition <edition-name>

# Expected output for reference model:
✅ <edition>: Commits match (<commit-hash>)
  Submodule Status:
    Modified files: 0
    Untracked files: 0
  Standalone Status:
    Modified files: 0
```

### Perfect Sync Criteria
- [ ] Submodule and standalone commits match
- [ ] Zero uncommitted changes in both locations
- [ ] Zero untracked files in both locations
- [ ] Both on same branch (usually `main`)
- [ ] Remote URLs are SSH format
- [ ] `git status` is clean in both repos

---

## Remediation Workflows

If an edition doesn't match reference model standards:

### Scenario 1: Uncommitted Changes
```bash
# In standalone repo
cd /home/ichardart/dev/projects/true-valence-mapper-<edition>
git status
git add -A
git commit -m "feat: commit accumulated changes"
git push origin main

# Update parent submodule
cd /home/ichardart/dev/projects/true-valence-mapper
git submodule update --remote versions/<edition>
git add versions/<edition>
git commit -m "chore: update <edition> submodule"
```

### Scenario 2: Standalone Ahead of Submodule
```bash
# Update parent submodule to latest
cd /home/ichardart/dev/projects/true-valence-mapper
git submodule update --remote versions/<edition>
git add versions/<edition>
git commit -m "chore: sync <edition> to latest"
```

### Scenario 3: Submodule Ahead of Standalone (Unusual)
```bash
# Reset standalone to match submodule
cd /home/ichardart/dev/projects/true-valence-mapper-<edition>
SUBMODULE_COMMIT=$(git -C ../true-valence-mapper/versions/<edition> rev-parse HEAD)
git fetch origin
git reset --hard $SUBMODULE_COMMIT
```

### Scenario 4: Diverged Histories
```bash
# Investigate divergence
cd /home/ichardart/dev/projects/true-valence-mapper-<edition>
git log --oneline --graph --all --decorate -20

# Determine correct branch
# Option A: Force standalone to match remote
git fetch origin
git reset --hard origin/main

# Option B: Manual merge (if local changes needed)
git merge origin/main
```

---

## Maintenance Schedule

To maintain reference model status across all editions:

### Daily (Automated)
- ✅ Commit after each work session
- ✅ Push to remote before closing IDE
- ✅ No uncommitted changes at day end

### Weekly (Manual)
```bash
# Run comprehensive health check
./scripts/health-check.sh

# Or detailed analysis
./scripts/sync-check-advanced.sh --report
```

### Monthly (Governance)
- Review sync-check reports
- Identify editions drifting from reference model
- Apply remediation workflows
- Update this documentation with new patterns

---

## Reference Model Selection Criteria

An edition qualifies as a reference model when:

1. **Perfect Sync Duration:** ≥30 days with matching commits
2. **Zero Drift:** No uncommitted changes during review period
3. **Clean History:** No forced updates or hard resets
4. **Active or Stable:** Either regular commits OR intentionally inactive
5. **Proper Configuration:** SSH remotes, correct branch tracking

### Current Reference Models Summary

| Edition | Commit | Since | Activity Level | Sync Score |
|---------|--------|-------|----------------|------------|
| **codex** | 4ddb6b56 | Initial | Low (stable) | 100% |
| **magic-path** | d45a7df7 | Initial | Medium | 100% |
| **openspec** | fb7b2381 | Initial | Low (inactive) | 100% |

### Graduated Models (Previously Required Remediation)

| Edition | Remediation Date | Issue Fixed | Current Status |
|---------|-----------------|-------------|----------------|
| **claude** | 2025-11-30 | 2 uncommitted files | ✅ Now reference model candidate |
| **bmad** | 2025-11-30 | 35 uncommitted files, no standalone | ✅ Now reference model candidate |
| **spec-kit** | 2025-11-30 | 39 uncommitted files, 5 commits ahead | ✅ Now reference model candidate |

**Note:** Graduated models need 30-day observation period before qualifying as reference models.

---

## See Also

- [Repository Structure](REPOSITORY-STRUCTURE.md) - Dual-location pattern overview
- [Health Check Script](../scripts/health-check.sh) - Automated sync validation
- [Sync Check Advanced](../scripts/sync-check-advanced.sh) - Remediation automation
- [Submodule Analysis Report](../reports/SUBMODULE-STANDALONE-ANALYSIS-2025-11-30.md) - Full forensic analysis

---

**Last Updated:** 2025-11-30
**Maintained By:** Repository Governance Team
**Review Schedule:** Monthly or when sync issues detected
