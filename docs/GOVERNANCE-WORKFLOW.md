# Superseded historical governance — read CONVERGENCE first

Superseded 2026-10-05 by [CONVERGENCE](CONVERGENCE.md), [CURRENT-STATE](CURRENT-STATE.md) and root AGENTS.md. The text below is historical; independent edition development, push-to-main and template overwrite instructions are not current authority. Original copies are preserved in docs/archive/governance-2026-10-05.

---

# Governance Workflow - True Valence Mapper

> **For AI Agents:** If you're reading this, you've found the governance documentation. Start with the [Quick Reference](#quick-reference-for-ai-agents) section.

## Quick Reference for AI Agents

### 🛑 STOP - Before Taking Action

1. **Read AGENTS.md** in your current repository
2. **Read AGENTS.local.md** if it exists (edition-specific overrides)
3. **DO NOT** install packages, add dependencies, or change architecture without human approval

### Where Am I?

| If you're in... | You're working on... | Governance file |
|-----------------|---------------------|-----------------|
| `true-valence-mapper/` | Parent orchestration repo | [AGENTS.md](../AGENTS.md) |
| `true-valence-mapper/versions/{edition}/` | Submodule (read-only reference) | Check standalone instead |
| `true-valence-mapper-{edition}/` | **Standalone edition (work here)** | AGENTS.md + AGENTS.local.md |

### Key Rules

1. **Never work in submodules** - Use standalone repos for development
2. **Ask before installing packages** - They may exist in `shared/` or other editions
3. **Check AGENTS.local.md** - Edition-specific approvals may already exist
4. **Push triggers auto-sync** - Your changes will propagate to parent repo

---

## Architecture Overview

```
┌─────────────────────────────────────────────────────────────────┐
│                    PARENT REPOSITORY                             │
│              true-valence-mapper (orchestration)                 │
│                                                                  │
│  ┌─────────────────┐  ┌─────────────────┐  ┌─────────────────┐ │
│  │ shared/         │  │ docs/           │  │ .github/        │ │
│  │ └─templates/    │  │ └─GOVERNANCE-   │  │ └─workflows/    │ │
│  │   ├─AGENTS.md   │  │   WORKFLOW.md   │  │   ├─auto-sync   │ │
│  │   │ .template   │  │                 │  │   └─sync-gov    │ │
│  │   └─editions    │  └─────────────────┘  └─────────────────┘ │
│  │     .json       │                                            │
│  └─────────────────┘                                            │
│                                                                  │
│  ┌──────────────────────────────────────────────────────────┐  │
│  │ versions/ (submodules - reference only, don't edit)      │  │
│  │ ├─claude/  ├─codex/  ├─bmad/  ├─spec-kit/               │  │
│  │ ├─magic-path/  ├─openspec/  └─Gemini_3/                  │  │
│  └──────────────────────────────────────────────────────────┘  │
└─────────────────────────────────────────────────────────────────┘
                              │
                              │ Submodules point to
                              ▼
┌─────────────────────────────────────────────────────────────────┐
│                  EDITION REPOSITORIES (GitHub)                   │
│                                                                  │
│  rhart696/true-valence-mapper-claude                            │
│  rhart696/true-valence-mapper-codex                             │
│  rhart696/true-valence-mapper-bmad                              │
│  rhart696/true-valence-mapper-spec-kit                          │
│  rhart696/true-valence-mapper-magic-path                        │
│  rhart696/true-valence-mapper-openspec                          │
│  rhart696/true-valence-mapper-Gemini_3                          │
└─────────────────────────────────────────────────────────────────┘
                              │
                              │ Cloned locally as
                              ▼
┌─────────────────────────────────────────────────────────────────┐
│              STANDALONE REPOSITORIES (Local Development)         │
│                                                                  │
│  /home/ichardart/dev/projects/true-valence-mapper-claude        │
│  /home/ichardart/dev/projects/true-valence-mapper-codex         │
│  /home/ichardart/dev/projects/true-valence-mapper-bmad          │
│  /home/ichardart/dev/projects/true-valence-mapper-spec-kit      │
│  /home/ichardart/dev/projects/true-valence-mapper-magic-path    │
│  /home/ichardart/dev/projects/true-valence-mapper-openspec      │
│  /home/ichardart/dev/projects/true-valence-mapper-Gemini_3      │
│                                                                  │
│  Each contains:                                                  │
│  ├─ AGENTS.md        (global governance - auto-synced)          │
│  ├─ AGENTS.local.md  (edition-specific - manually maintained)   │
│  └─ CLAUDE.md        (symlink to AGENTS.md)                     │
└─────────────────────────────────────────────────────────────────┘
```

---

## Governance File Hierarchy

### 1. AGENTS.md (Global Governance)

**Location:** Every edition repository root
**Source:** `shared/templates/AGENTS.md.template` in parent repo
**Sync:** Automatic via GitHub Actions when template changes

**Contains:**
- Universal rules for ALL editions
- Multi-repository architecture explanation
- Approval requirements for dependencies
- Links to documentation

**DO NOT EDIT directly** - Changes will be overwritten by next sync.

### 2. AGENTS.local.md (Edition-Specific Governance)

**Location:** Edition repository root (if exists)
**Source:** Created from template on first sync, then manually maintained
**Sync:** Never overwritten - edition owners control this file

**Contains:**
- Pre-approved dependencies for this edition
- Edition-specific exceptions to global rules
- Architectural decisions unique to this edition

**Safe to edit** - Your changes are preserved.

### 3. CLAUDE.md (Alias)

**Location:** Edition repository root
**Type:** Symlink to AGENTS.md
**Purpose:** Claude-specific agents look for CLAUDE.md first

---

## Workflows

### Development Workflow (Normal Day-to-Day)

```
1. Work in standalone repo
   cd /home/ichardart/dev/projects/true-valence-mapper-{edition}

2. Read governance files
   cat AGENTS.md
   cat AGENTS.local.md  # if exists

3. Make changes (following governance)

4. Commit and push
   git add . && git commit -m "feat: description" && git push

5. Auto-sync triggers
   - notify-parent.yml in edition triggers
   - auto-sync-submodules.yml in parent updates submodule ref
```

### Adding a Dependency (Requires Approval)

```
1. Check if it exists in shared/
   ls /home/ichardart/dev/projects/true-valence-mapper/shared/

2. Check if other editions have it
   grep -r "package-name" ../true-valence-mapper-*/package.json

3. ASK THE HUMAN for approval

4. If approved, add to AGENTS.local.md
   - Document package name, version, approver, date, reason

5. Install the package
   npm install package-name
```

### Updating Global Governance

```
1. Edit template in parent repo
   vim /home/ichardart/dev/projects/true-valence-mapper/shared/templates/AGENTS.md.template

2. Bump version in editions.json
   # Change "template_version": "1.x.0" to "1.x+1.0"

3. Commit and push parent repo
   git add . && git commit -m "chore: update governance template" && git push

4. sync-governance-files.yml triggers automatically
   - Deploys to all 7 editions
   - Creates AGENTS.local.md if missing (doesn't overwrite existing)

5. Pull updates to standalone repos
   for edition in claude codex bmad spec-kit magic-path openspec Gemini_3; do
     git -C /home/ichardart/dev/projects/true-valence-mapper-$edition pull origin main
   done
```

### Adding Edition-Specific Governance

```
1. Work in standalone repo
   cd /home/ichardart/dev/projects/true-valence-mapper-{edition}

2. Create or edit AGENTS.local.md
   # Add approved dependencies, exceptions, or decisions

3. Commit and push
   git add AGENTS.local.md && git commit -m "docs: add edition-specific governance" && git push

4. This file is NEVER overwritten by global syncs
```

---

## Sync Mechanisms

### 1. Edition → Parent (notify-parent.yml)

**Trigger:** Push to main branch of any edition
**Action:** Sends repository_dispatch to parent repo
**Result:** Parent's auto-sync workflow updates submodule reference

### 2. Parent → Editions (sync-governance-files.yml)

**Trigger:** Changes to AGENTS.md.template, editions.json, or workflow file
**Action:** Generates AGENTS.md for each edition from template
**Behavior:**
- AGENTS.md: Always overwritten
- AGENTS.local.md: Created if missing, never overwritten if exists
- CLAUDE.md: Created as symlink if missing

### 3. Manual Sync Commands

```bash
# Update all submodules to latest
cd /home/ichardart/dev/projects/true-valence-mapper
git submodule update --remote

# Pull all standalone repos to latest
for edition in claude codex bmad spec-kit magic-path openspec Gemini_3; do
  git -C /home/ichardart/dev/projects/true-valence-mapper-$edition pull origin main
done

# Health check
./scripts/health-check.sh --verbose
```

---

## Discoverability

### For AI Agents

Every entry point provides governance information:

| Entry Point | First File to Read | Contains Link To |
|-------------|-------------------|------------------|
| Parent repo root | AGENTS.md | This document |
| Edition standalone root | AGENTS.md | AGENTS.local.md, this document |
| Edition submodule | AGENTS.md | Same as standalone |

### For Humans

- **This document:** Complete workflow reference
- **REPOSITORY-STRUCTURE.md:** Architecture and dual-location pattern
- **GOVERNANCE.md:** High-level principles and decision process
- **health-check.sh:** Automated validation

---

## Validation

### Health Check

```bash
cd /home/ichardart/dev/projects/true-valence-mapper
./scripts/health-check.sh --verbose
```

Checks:
- All editions in sync (submodule ↔ standalone)
- AGENTS.md present with correct version
- AGENTS.local.md presence (optional)
- CLAUDE.md symlink correct
- Documentation present

### Manual Verification

```bash
# Check governance version in an edition
grep "Template version:" /home/ichardart/dev/projects/true-valence-mapper-{edition}/AGENTS.md

# Compare to current template version
jq '.template_version' /home/ichardart/dev/projects/true-valence-mapper/shared/templates/editions.json
```

---

## Troubleshooting

### AGENTS.md Out of Date

**Symptom:** Health check shows version mismatch
**Cause:** Edition repo hasn't received latest sync
**Fix:**
```bash
# Pull latest in standalone
git -C /home/ichardart/dev/projects/true-valence-mapper-{edition} pull origin main

# Or trigger manual sync from parent
cd /home/ichardart/dev/projects/true-valence-mapper
gh workflow run sync-governance-files.yml
```

### Edition-Specific Changes Lost

**Symptom:** Custom governance rules disappeared
**Cause:** Edited AGENTS.md instead of AGENTS.local.md
**Fix:** Put edition-specific content in AGENTS.local.md (never overwritten)

### Agent Ignores Governance

**Symptom:** AI agent proceeds without asking
**Cause:** Agent may not have read AGENTS.md
**Fix:** Ensure AGENTS.md exists and contains clear STOP instructions at top

---

## Version History

| Version | Date | Changes |
|---------|------|---------|
| 1.2.0 | 2024-12-01 | Added AGENTS.local.md support, governance workflow documentation |
| 1.1.0 | 2024-12-01 | Strengthened STOP section, added prominent warnings |
| 1.0.0 | 2024-12-01 | Initial AGENTS.md deployment to all editions |

---

*This document is the canonical reference for governance workflows.*
*Last updated: 2024-12-01*
