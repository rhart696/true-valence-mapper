# True Valence Mapper - Multi-Agent Governance

This document defines how different AI-led editions coordinate development and share innovations.

## Principles

1. **Edition Independence**: Each edition operates autonomously with its own roadmap
2. **Shared Innovation**: Valuable features can be promoted to shared library
3. **Opt-In Adoption**: Editions choose when to adopt shared components
4. **Evidence-Based**: Decisions driven by metrics and validation, not speculation

## Synchronization Policies

### Repository Sync Requirements

**Frequency**: After every development session (before closing IDE)
**Validation**: Weekly health checks (Mondays, 10:00 AM)
**Tools**:
- `./scripts/health-check.sh` - Quick validation
- `./scripts/sync-check-advanced.sh` - Detailed analysis

**Mandatory Sync Actions**:
1. **After Each Work Session**:
   ```bash
   # In standalone repo
   git add -A
   git commit -m "descriptive message"
   git push origin main
   ```

2. **Weekly Validation**:
   ```bash
   # In parent repo
   ./scripts/health-check.sh
   # Fix any warnings immediately
   ```

3. **Monthly Deep Check**:
   ```bash
   # In parent repo
   ./scripts/sync-check-advanced.sh --report
   # Review reports/ directory for issues
   ```

**Reference Models**: See [SYNC-REFERENCE-MODELS.md](SYNC-REFERENCE-MODELS.md) for examples of perfect sync:
- **codex**: Gold standard for commit hygiene
- **magic-path**: Stable development workflow
- **openspec**: Minimalist but clean sync

**Anti-Patterns to Avoid**:
- ❌ Uncommitted work accumulation (commit regularly!)
- ❌ Forgetting to push to remote
- ❌ Working directly in `versions/` submodules (use standalone only)
- ❌ Using HTTPS remote URLs (use SSH)

### Weekly Sync Schedule

**When**: Every Monday, 10:00 AM (documented async if solo developer)
**Duration**: 30 minutes
**Attendees**: Edition leads (human + primary AI agent per edition)

**Agenda**:
1. **Repository health review** (5 min) - Review health-check.sh output
2. Edition status updates (5 min each)
3. Demo new features (10 min)
4. Promotion candidates (10 min)
5. Blockers and cross-edition issues (5 min)

## Feature Promotion Workflow

### 1. Identify Candidate

Feature developed in edition repository demonstrates value:
- Solves user need effectively
- Has test coverage > 80%
- Security reviewed and passing
- Applicable to other editions

### 2. Propose Promotion

Edition lead creates issue in parent repo:
- Label: `promotion-candidate`
- Include: feature description, metrics, test results, security review
- Estimate: effort for other editions to adopt

### 3. Review and Decide

**Criteria for promotion to `shared/`:**
- ✅ Applicable to 2+ editions
- ✅ No security vulnerabilities
- ✅ Well-tested and documented
- ✅ Positive user feedback (if applicable)
- ✅ Maintenance overhead acceptable

**Decision makers**: Weekly sync meeting (majority vote if multiple editions)

### 4. Implementation

**If approved:**
1. Refactor feature into `shared/` directory
2. Create PR to parent repo
3. Update shared component documentation
4. Notify other editions (GitHub discussion post)

**Editions adopt via:**
```bash
cd true-valence-mapper-{edition}
git submodule update --remote parent
# Review changes in shared/
# Integrate into edition codebase
git commit -m "Adopt shared feature X from parent"
```

## Issue Labeling Strategy

Use these labels across all edition repositories:

| Label | Usage |
|-------|-------|
| `edition:claude` | Specific to Claude edition |
| `edition:codex` | Specific to Codex edition |
| `cross-edition` | Affects multiple editions |
| `shared-component` | Related to `shared/` directory |
| `promotion-candidate` | Feature proposed for sharing |
| `governance` | Process or coordination issue |

## Semantic Versioning

**Format**: `v{major}.{minor}.{patch}-{edition}`

**Examples**:
- `v1.0.0-claude` - Claude edition release
- `v1.1.0-codex` - Codex edition with new feature
- `v2.0.0-shared` - Shared component library major update

**When to tag**:
- **Major**: Breaking changes, architecture shifts
- **Minor**: New features, non-breaking additions
- **Patch**: Bug fixes, documentation updates

## Edition Success Criteria

Track these metrics to evaluate edition value:

### Quantitative
- Lines of code added/modified/deleted (churn rate)
- Test coverage percentage
- Security audit pass rate
- Deployment frequency
- Issue resolution time

### Qualitative
- Unique approaches discovered
- User experience improvements
- Code quality innovations
- Architectural insights

## Edition Lifecycle

### Active Development
- Regular commits (at least weekly)
- Participation in sync meetings
- Responsive to issues

### Paused
- No active development but maintained
- May resume later
- Status updated in parent README

### Archived
- Experiment concluded (success or failure)
- Repository made read-only
- Learnings documented in decision log
- Code preserved for reference

**Archive criteria**:
- 4+ weeks of inactivity
- OR objectives achieved and merged to main edition
- OR approach proven non-viable

## Conflict Resolution

**If editions disagree on shared component**:
1. Present evidence (metrics, user feedback, technical analysis)
2. Time-boxed discussion (15 min max)
3. Vote (1 vote per active edition)
4. Tie-breaker: Human lead decides based on project goals

**If issue blocks multiple editions**:
1. Label `blocker` + `cross-edition`
2. Emergency sync meeting within 24 hours
3. Highest-priority resolution

## Merge Protocols

### Shared → Edition
**When**: Edition decides to adopt shared components
**How**:
```bash
git -C versions/{edition} submodule update --remote
# Review changes
# Integrate as needed
```

### Edition → Shared
**When**: Feature approved for promotion
**How**:
1. Extract feature to `shared/` directory
2. PR to parent repo with tests and docs
3. Code review by 1+ other edition leads
4. Merge to main after approval

### Edition → Main Edition
**When**: Experiment succeeds and consolidates
**How**:
1. Feature freeze on experimental edition
2. Cherry-pick valuable commits to main
3. Document learnings
4. Archive experimental repo

## Communication Channels

- **GitHub Issues**: Feature proposals, bugs, questions
- **GitHub Discussions**: Async coordination, announcements
- **Decision Log**: Record of major decisions and rationale
- **Weekly sync**: Real-time coordination

## Amendments

This governance document can be updated:
1. Propose change via PR to parent repo
2. Label: `governance`
3. Review in weekly sync
4. Requires 2/3 vote of active editions
5. Document rationale in decision log

---

**Version**: 1.1.0
**Last updated**: 2025-11-30 (Added synchronization policies and reference models)
**Next review**: 2025-12-30 (monthly)
