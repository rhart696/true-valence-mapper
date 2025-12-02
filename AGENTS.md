# AGENTS.md - True Valence Mapper (Parent Repository)

> **📚 GOVERNANCE DOCUMENTATION**
> - This file: Parent repository governance
> - [Full Governance Workflow](./docs/GOVERNANCE-WORKFLOW.md)
> - [Repository Structure](./docs/REPOSITORY-STRUCTURE.md)

## STOP - READ THIS FIRST

**You are in the PARENT ORCHESTRATION repository, not an edition.**

This repository coordinates 7 edition repositories. **Do NOT make code changes here** unless you are:
1. Updating shared templates or governance files
2. Modifying sync workflows
3. Working on cross-edition documentation

### If You Want to Write Code

**Go to a standalone edition repository instead:**

| Edition | Path | Focus |
|---------|------|-------|
| Claude | `/home/ichardart/dev/projects/true-valence-mapper-claude` | Reference implementation, security-first |
| Codex | `/home/ichardart/dev/projects/true-valence-mapper-codex` | GitHub Copilot workflows |
| BMAD | `/home/ichardart/dev/projects/true-valence-mapper-bmad` | BMAD-METHOD integration |
| Spec-Kit | `/home/ichardart/dev/projects/true-valence-mapper-spec-kit` | Specification-driven development |
| Magic-Path | `/home/ichardart/dev/projects/true-valence-mapper-magic-path` | UX methodology |
| OpenSpec | `/home/ichardart/dev/projects/true-valence-mapper-openspec` | OpenSpec integration |
| Gemini 3 | `/home/ichardart/dev/projects/true-valence-mapper-Gemini_3` | Google Gemini/Antigravity |

### Directory Structure

```
true-valence-mapper/              ← YOU ARE HERE
├── AGENTS.md                     ← This file
├── docs/
│   ├── GOVERNANCE-WORKFLOW.md    ← Complete governance reference
│   ├── REPOSITORY-STRUCTURE.md   ← Architecture documentation
│   └── GOVERNANCE.md             ← Decision-making process
├── shared/
│   └── templates/
│       ├── AGENTS.md.template    ← Source for edition AGENTS.md files
│       ├── AGENTS.local.md.template
│       └── editions.json         ← Edition configuration
├── versions/                     ← SUBMODULES (read-only reference)
│   ├── claude/
│   ├── codex/
│   ├── bmad/
│   ├── spec-kit/
│   ├── magic-path/
│   ├── openspec/
│   └── Gemini_3/
└── scripts/
    └── health-check.sh           ← Validation script
```

## What This Repository Contains

| Directory | Purpose | Editable? |
|-----------|---------|-----------|
| `shared/templates/` | Source templates for governance files | ✅ Yes - triggers sync to editions |
| `docs/` | Cross-edition documentation | ✅ Yes |
| `.github/workflows/` | Automation (sync, health checks) | ✅ Yes (careful) |
| `scripts/` | Operational scripts | ✅ Yes |
| `versions/` | Submodule references | ❌ No - auto-updated |

## Governance Sync System

When you edit `shared/templates/AGENTS.md.template`:
1. Commit and push to this repo
2. `sync-governance-files.yml` workflow triggers
3. All 7 editions receive the updated AGENTS.md
4. Edition-specific `AGENTS.local.md` files are preserved

## Commands

```bash
# Check health of all repositories
./scripts/health-check.sh --verbose

# Update all submodules to latest
git submodule update --remote

# Manually trigger governance sync (if needed)
gh workflow run sync-governance-files.yml
```

## Boundaries

### Do in This Repository
- Update governance templates (`shared/templates/`)
- Edit cross-edition documentation (`docs/`)
- Modify sync workflows (`.github/workflows/`)
- Run health checks

### Do NOT in This Repository
- Write application code
- Add edition-specific features
- Install npm packages
- Create React components

### Never Do
- Edit files inside `versions/` subdirectories
- Force push to main
- Delete submodule references
- Modify `.gitmodules` without understanding impact

## Related Resources

- [Governance Workflow](./docs/GOVERNANCE-WORKFLOW.md) - Complete reference
- [Repository Structure](./docs/REPOSITORY-STRUCTURE.md) - Architecture details
- [Governance Model](./docs/GOVERNANCE.md) - Decision process

---

*This is the parent orchestration repository.*
*For development work, use a standalone edition repository.*
