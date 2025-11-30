# Repository Structure: Dual-Location Pattern

**Last Updated:** 2025-11-29
**Status:** Production Architecture
**Pattern:** Multi-Agent AI Development Optimized

---

## Overview

This project uses a **dual-location pattern** specifically optimized for multi-agent AI development. This is not duplication—it's an intentional architecture that separates AI agent workspaces from human coordination infrastructure.

---

## Architecture Diagram

```
┌─────────────────────────────────────────────────────────────────┐
│  AI AGENT WORKSPACES (Standalone Repositories)                  │
│  Location: /home/ichardart/dev/projects/true-valence-mapper-*   │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐          │
│  │    Claude    │  │    Codex     │  │   Gemini     │          │
│  │   Edition    │  │   Edition    │  │   Edition    │  ...     │
│  └──────────────┘  └──────────────┘  └──────────────┘          │
│                                                                  │
│  Purpose: Full context for AI agents                            │
│  Benefit: No submodule complexity, complete codebase visibility │
│  Workflow: git commit && git push (simple)                      │
└─────────────────────────────────────────────────────────────────┘
                              ↕
                    (Same GitHub Remotes)
                              ↕
┌─────────────────────────────────────────────────────────────────┐
│  HUMAN COORDINATION HUB (Parent with Submodules)                │
│  Location: /home/ichardart/dev/projects/true-valence-mapper/    │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  versions/                                                       │
│  ├── claude/      ← submodule → github.com/.../mapper-claude    │
│  ├── codex/       ← submodule → github.com/.../mapper-codex     │
│  ├── gemini/      ← submodule → github.com/.../mapper-gemini    │
│  └── ...                                                         │
│                                                                  │
│  Purpose: Governance, cross-edition view, version tracking      │
│  Benefit: Single git clone --recursive gets full project        │
│  Workflow: git submodule update --remote (coordination)         │
└─────────────────────────────────────────────────────────────────┘
```

---

## Locations Explained

### 1. Standalone Repositories (AI Agent Workspaces)

**Path Pattern:** `/home/ichardart/dev/projects/true-valence-mapper-{edition}/`

**Examples:**
- `/home/ichardart/dev/projects/true-valence-mapper-claude/`
- `/home/ichardart/dev/projects/true-valence-mapper-codex/`
- `/home/ichardart/dev/projects/true-valence-mapper-Gemini_3/`

**Purpose:**
- Active development workspace for AI agents
- Each AI agent (Claude, Codex, Gemini) owns one edition
- Full repository context without submodule indirection

**Key Benefits:**
1. **AI Context Windows**: Agents see complete codebase structure
2. **No Submodule Friction**: No `git submodule update --init --recursive` complexity
3. **Simple Workflows**: Standard git commands (commit, push, pull)
4. **IDE Integration**: Claude Code, VS Code, IDEs work naturally

**Remote Connection:**
```bash
$ git -C ~/dev/projects/true-valence-mapper-claude remote -v
origin  git@github.com:rhart696/true-valence-mapper-claude.git (fetch)
origin  git@github.com:rhart696/true-valence-mapper-claude.git (push)
```

---

### 2. Parent Repository with Submodules (Human Coordination Hub)

**Path:** `/home/ichardart/dev/projects/true-valence-mapper/`

**Structure:**
```
true-valence-mapper/
├── docs/              # Cross-edition governance
├── shared/            # Shared components library
├── ops/               # Monitoring and metrics
├── scripts/           # Automation tools
├── versions/          # Edition submodules
│   ├── claude/        # Submodule → standalone repo
│   ├── codex/
│   ├── bmad/
│   ├── spec-kit/
│   ├── magic-path/
│   ├── openspec/
│   └── Gemini_3/
└── .gitmodules        # Submodule configuration
```

**Purpose:**
- Human coordination and governance
- Cross-edition documentation
- Shared component distribution
- Unified project view for onboarding

**Key Benefits:**
1. **Single Clone Discovery**: `git clone --recursive` gets entire project
2. **Version Tracking**: Submodules pin specific commits per edition
3. **Governance Enforcement**: Central location for policies, SOPs
4. **Cross-Edition View**: See all editions in one place

**Remote Connection:**
```bash
$ git -C ~/dev/projects/true-valence-mapper/versions/claude remote -v
origin  git@github.com:rhart696/true-valence-mapper-claude.git (fetch)
origin  git@github.com:rhart696/true-valence-mapper-claude.git (push)
```

---

## Why This Pattern Exists

### Problem: AI Agents Struggle with Git Submodules

**Submodule Complexity Issues:**
- Nested `.git` directories confuse AI agent file navigation
- Require multi-step initialization (`git submodule init && update`)
- Detached HEAD states are error-prone
- Context window fragmentation (agent sees pointer files, not code)

**Solution: Standalone Repos**
- AI agents work in clean, complete repositories
- Standard git workflows (no submodule commands)
- Full codebase context for intelligent suggestions

### Problem: Human Coordination Across 7+ Editions

**Multi-Repo Coordination Challenges:**
- Discovering all editions requires knowing 7+ GitHub URLs
- Tracking which commit each edition is on manually
- Distributing shared components across repos
- Enforcing consistent governance policies

**Solution: Parent Repo with Submodules**
- Single source of truth for project structure
- Git submodules track exact commit per edition
- Shared components in central location
- Governance docs apply across all editions

---

## This is NOT Duplication

### Common Misconception

"We have the same code in two places—that's wasteful duplication!"

### Reality: Different Purposes, Shared Remote

**Submodules are 43-byte pointer files:**
```bash
$ cat versions/claude/.git
gitdir: ../../.git/modules/versions/claude
```

**Both locations point to same GitHub remote:**
- Standalone: `true-valence-mapper-claude/.git` → `github.com/rhart696/true-valence-mapper-claude`
- Submodule: `true-valence-mapper/versions/claude` → same remote

**Disk Usage:**
- Submodule: ~43 bytes (pointer) + shared objects in parent `.git/modules/`
- Standalone: ~5.2 MB (full working tree)
- Total overhead: Minimal (git deduplicates objects)

---

## Workflows

### AI Agent Development Workflow

**Typical Claude Code Session:**

```bash
# 1. Agent opens workspace
cd ~/dev/projects/true-valence-mapper-claude

# 2. Agent makes changes
# (editing index.html, scripts.js, etc.)

# 3. Agent commits
git add .
git commit -m "feat: Add dark mode toggle

Implemented user-requested dark mode with localStorage persistence.

🤖 Generated with Claude Code
Co-Authored-By: Claude <noreply@anthropic.com>"

# 4. Agent pushes
git push origin main

# Done! No submodule commands needed.
```

**Why This Works:**
- Full repository context in agent's working directory
- Standard git commands (agent training data includes these)
- No special submodule knowledge required
- IDE integrations work naturally

---

### Human Coordination Workflow

**Weekly Sync Review:**

```bash
# 1. Update parent repo with latest from all editions
cd ~/dev/projects/true-valence-mapper
git submodule update --remote --merge

# 2. Review what changed across all editions
git status
# Shows which submodules have new commits

# 3. Review specific edition changes
cd versions/claude
git log --oneline -5  # Last 5 commits
cd ../codex
git log --oneline -5

# 4. Commit updated submodule pointers (optional)
cd ../..  # Back to parent
git add versions/claude versions/codex
git commit -m "chore: Update edition submodules to latest

Claude: v1.2.0 - Added dark mode
Codex: v0.8.0 - Improved test coverage"
git push

# 5. Run validation
./scripts/health-check.sh
```

**Why This Works:**
- Human sees all editions in unified view
- Submodule pointers track exact versions
- Cross-edition comparison is easy
- Governance docs in central location

---

### Shared Component Distribution Workflow

**When Shared Components Exist:**

```bash
# 1. Human develops shared component
cd ~/dev/projects/true-valence-mapper
vim shared/components/toast-notifications.js

# 2. Commit to parent repo
git add shared/components/toast-notifications.js
git commit -m "feat(shared): Add toast notification component"
git push

# 3. GitHub Action notifies editions
# (automated via .github/workflows/notify-editions-on-shared-update.yml)

# 4. AI agent in edition decides to adopt
cd ~/dev/projects/true-valence-mapper-claude
cp ../true-valence-mapper/shared/components/toast-notifications.js ./components/
# Or use sync script:
~/dev/projects/true-valence-mapper/scripts/sync-shared-to-edition.sh claude
git commit -m "chore: Adopt shared toast notifications component"
git push
```

**Note:** Currently `shared/` directory contains only README. This workflow activates when shared components are actually developed.

---

## When to Use Which Location

### Work in Standalone Repos When:

✅ **AI agent is actively developing** (primary use case)
✅ **Implementing edition-specific features**
✅ **Testing changes before coordination**
✅ **Need full IDE/tooling support**
✅ **Want simple git workflows**

**Example:** Claude Code adding new feature to claude edition

---

### Work in Parent Repo When:

✅ **Reviewing cross-edition changes** (human coordination)
✅ **Updating governance documentation**
✅ **Developing shared components**
✅ **Onboarding new contributors** (discover all editions)
✅ **Running validation scripts** (ops/, scripts/)

**Example:** Human reviewing what all AI agents accomplished this week

---

## Maintenance

### Daily: AI Agents Work in Standalone Repos

No maintenance needed. AI agents commit and push normally.

### Weekly: Human Syncs Parent Repo

```bash
cd ~/dev/projects/true-valence-mapper
git submodule update --remote --merge
./scripts/health-check.sh
```

**Time: 2-3 minutes**

### Monthly: Health Check for Drift

```bash
./scripts/health-check.sh
# Validates standalone and submodule locations are in sync
```

**Time: 30 seconds**

---

## Troubleshooting

### "Standalone and Submodule Commits Don't Match"

**Symptom:**
```
⚠️  claude: Submodule (abc123) != Standalone (def456)
```

**Cause:** Changes pushed to standalone but parent not updated

**Fix:**
```bash
cd ~/dev/projects/true-valence-mapper
git submodule update --remote versions/claude
git add versions/claude
git commit -m "chore: Sync claude submodule to latest"
```

**This is normal and expected.** Parent repo lags behind by design (opt-in updates).

---

### "Edition Only Exists as Submodule, Not Standalone"

**Symptom:**
```
ℹ️  bmad: Submodule only (standalone not needed)
```

**Cause:** Edition not actively developed by AI agent yet

**Action Required:** None. Create standalone clone only when AI agent needs to work on this edition.

**To Create Standalone:**
```bash
cd ~/dev/projects
git clone git@github.com:rhart696/true-valence-mapper-bmad.git
```

---

### "I Changed Code in Submodule Path—Changes Lost"

**Problem:** Editing files in `true-valence-mapper/versions/claude/` directly

**Why This Happens:** Submodule working trees can be detached from branch

**Best Practice:**
1. Always develop in standalone repos (`true-valence-mapper-claude/`)
2. Use parent repo for **reading** editions, not editing
3. If you must edit in submodule:
   ```bash
   cd versions/claude
   git checkout main  # Ensure on branch
   # Make changes
   git push origin main
   ```

---

## Scaling Considerations

### Current Scale: 7 Editions

**Performance:**
- Parent repo size: ~418 MB (mostly submodule working trees)
- Clone time: ~30 seconds (with `--recursive`)
- Update time: ~5 seconds (`git submodule update --remote`)
- Disk usage: Acceptable (~450 MB total)

**Verdict:** ✅ Pattern works well at current scale

---

### Projected Scale: 15-20 Editions

**Expected Performance:**
- Parent repo size: ~1.2 GB
- Clone time: ~90 seconds
- Update time: ~10 seconds
- Disk usage: Still acceptable

**Recommendation:** Continue with current pattern

---

### If Scale Exceeds 50 Editions

**Re-evaluate if:**
- Parent repo >3 GB
- Clone time >5 minutes
- Coordination overhead >1 hour/week

**Alternative Architectures to Consider:**
1. True polyrepo (drop parent, use discovery service)
2. Monorepo (if editions converge significantly)
3. Service mesh (MCP-based coordination)

**Timeline for reconsideration:** 12-24 months (if project reaches this scale)

---

## Design Decisions & Rationale

### Why Not Monorepo?

**Monorepo Disadvantages:**
- AI agents must navigate massive codebase (context window strain)
- Merge conflicts across 7+ concurrent editions
- Single CI/CD pipeline = shared blast radius
- Harder to archive failed experimental editions

**Polyrepo Advantages:**
- Clear ownership (one AI agent per edition)
- Independent release cycles
- Low coupling (editions can diverge)
- Easy to archive experiments

**See:** [ARCHITECTURE.md](ARCHITECTURE.md) for full analysis

---

### Why Not Git Subtree?

**Subtree Disadvantages:**
- Parent repo bloats with full history of all editions (2+ GB)
- Push changes from parent to editions (we never do this)
- Merge conflicts when multiple editions update simultaneously
- Shallow clones break (can't `--depth=1`)

**Submodule Advantages:**
- Parent repo stays small (submodules are pointers)
- Pull changes from editions to parent (matches our workflow)
- No merge conflicts (editions isolated)
- Shallow clones work fine

**See:** Black Hat Analysis report for detailed comparison

---

### Why Not NPM/Package Manager for Shared Components?

**Package Manager Disadvantages:**
- Overhead: Publishing, versioning, registry management
- Supply chain risk: NPM vulnerabilities, typosquatting
- Forced coupling: All editions must update to compatible versions
- Complexity: Build pipelines, node_modules bloat

**Current Approach Advantages:**
- Simple: Copy files from `shared/` when needed
- Opt-in: Editions choose when to adopt shared components
- Zero overhead: No registry, no publishing ceremony
- Safe: No external dependencies

**Reconsider if:**
- 10+ shared components with complex dependencies
- Frequent version conflicts
- Need semantic versioning enforcement

**Timeline:** 12+ months (validate need first)

---

## Future Enhancements

### Potential Improvements (If Metrics Prove Necessary)

#### 1. Automated Sync Validation (CI/CD)

**Trigger:** If drift between standalone/submodule becomes common

**Implementation:**
```yaml
# .github/workflows/health-check.yml
name: Repository Health Check
on:
  schedule:
    - cron: '0 9 * * 1'  # Weekly on Monday
jobs:
  health-check:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
        with:
          submodules: recursive
      - run: ./scripts/health-check.sh
```

---

#### 2. MCP-Based Agent Coordination

**Trigger:** If 3+ AI agents actively coordinating becomes overhead

**Use Case:** Agent-to-agent feature sharing (NOT git coordination)

**Timeline:** 6-12 months (only if multi-agent coordination becomes bottleneck)

**See:** Expert Analysis report for MCP evaluation

---

#### 3. Shared Component Registry

**Trigger:** If 5+ shared components with complex adoption tracking

**Implementation:** Metadata-driven component catalog

**Timeline:** 6+ months (only if shared library grows significantly)

---

## References

- [ARCHITECTURE.md](ARCHITECTURE.md) - Multi-agent architecture rationale
- [GOVERNANCE.md](GOVERNANCE.md) - Cross-edition coordination workflows
- [FEATURE-PROMOTION-WORKFLOW.md](FEATURE-PROMOTION-WORKFLOW.md) - Sharing innovations
- [Red Team Security Analysis](../scripts/red-team-analysis.md) - Architecture security review
- [Black Hat Critical Analysis](../scripts/black-hat-analysis.md) - Cost-benefit assessment

---

## Version History

- **v1.0.0** (2025-11-29): Initial documentation of dual-location pattern
- Architecture established: November 2024
- Active since: 7 editions, 1 human coordinator, 3+ AI agents

---

**Questions or Issues?**

1. Check [GOVERNANCE.md](GOVERNANCE.md) for coordination processes
2. Run `./scripts/health-check.sh` to validate repository health
3. Review [ARCHITECTURE.md](ARCHITECTURE.md) for design rationale

---

**Pattern Status:** ✅ Production-Ready | 🏗️ Under Active Use | 📊 Validated at 7-Edition Scale
