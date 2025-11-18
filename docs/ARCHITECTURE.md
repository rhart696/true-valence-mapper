# True Valence Mapper - Multi-Agent Architecture

## Rationale

This project uses a **multi-agent polyrepo** architecture to explore how different AI orchestrators approach the same problem space.

### Why Multiple Editions?

1. **Diverse Approaches**: Different AI tools (Claude Code, Copilot, Gemini) have unique strengths
2. **Parallel Exploration**: Test multiple solutions simultaneously
3. **Comparative Learning**: Identify best practices by comparing outcomes
4. **Risk Mitigation**: Avoid single-vendor lock-in or approach dependency

### Why Polyrepo vs Monorepo?

**Polyrepo Advantages** (our choice):
- ✅ Clear ownership boundaries per edition
- ✅ Independent release cycles
- ✅ Easier to archive failed experiments
- ✅ Low coupling between editions
- ✅ Familiar to most developers

**Monorepo Disadvantages** (why we didn't choose it):
- ❌ Complexity budget violations with 7+ editions
- ❌ Harder to isolate experimental failures
- ❌ Shared CI/CD increases blast radius
- ❌ Submodule management provides similar benefits with less complexity

## Repository Topology

```
┌─────────────────────────────────────────────┐
│   true-valence-mapper (parent)              │
│   Governance, Shared Assets, Coordination   │
└─────────────────┬───────────────────────────┘
                  │
      ┌───────────┼───────────┬───────────┐
      │           │           │           │
┌─────▼─────┐ ┌──▼──────┐ ┌──▼──────┐ ┌──▼──────┐
│  Claude   │ │  Codex  │ │  Gemini │ │   ...   │
│  Edition  │ │ Edition │ │ Edition │ │         │
└───────────┘ └─────────┘ └─────────┘ └─────────┘
 Submodule     Submodule   Submodule   Submodule
```

## Submodule Strategy

**Why Submodules?**
- Track specific versions of shared components
- Opt-in updates (editions control when to sync)
- Git history preservation
- Explicit dependency management

**Alternative Considered: npm/pip packages**
- ❌ Too heavy for this use case
- ❌ Publishing overhead
- ❌ Versioning complexity
- ✅ Submodules simpler for this scale

## Shared Component Philosophy

**What belongs in `shared/`:**
- ✅ CSS/styling used by 2+ editions
- ✅ Database schemas (Supabase)
- ✅ Security validation logic
- ✅ Test fixtures and helpers
- ✅ Proven stable components

**What stays in editions:**
- ❌ Experimental features
- ❌ Edition-specific workflows
- ❌ UI components with divergent designs
- ❌ Anything used by only 1 edition

## Edition Coordination

**Loosely Coupled**:
- Editions don't depend on each other
- Shared components are optional (can be overridden)
- No required synchronization

**Coordinated Where Valuable**:
- Weekly syncs to share learnings
- Feature promotions for valuable innovations
- Security patches distributed rapidly

## Deployment Model

Each edition deploys independently:

| Edition | Hosting | URL |
|---------|---------|-----|
| Claude | GitHub Pages | rhart696.github.io/true-valence-mapper-claude |
| Codex | GitHub Pages | rhart696.github.io/true-valence-mapper-codex |
| Gemini | GitHub Pages | rhart696.github.io/true-valence-mapper-gemini |

**Why separate deployments?**
- Independent release cycles
- Easier to compare live versions
- No single point of failure
- Users can choose preferred edition

## Scalability Considerations

**Current Scale**: 3 repos (parent + 2 editions)
**Phase 2 Scale**: 8 repos (parent + 7 editions)
**Max Recommended**: 10 repos before consolidation

**Overhead per edition**:
- ~2 hours/week maintenance
- ~30 min/week sync coordination
- ~1 hour/month dependency updates

**At 8 editions**: ~24 hours/week total (3 hours/day)

**Mitigation**:
- Automation for repetitive tasks
- Archive low-value editions
- Consolidate successful experiments

## Technology Decisions

### Frontend
- **Pure HTML/CSS/JS**: No build step, maximum compatibility
- **Rationale**: Easy for all AI agents to understand and modify

### Backend
- **Supabase**: Managed PostgreSQL + Auth + RLS
- **Rationale**: Minimal ops, security built-in, generous free tier

### Testing
- **Manual + Automated**: Balance speed and thoroughness
- **Rationale**: Early stage, changing requirements

### CI/CD
- **GitHub Actions**: Native integration, per-repo isolation
- **Rationale**: No external dependencies, easy to debug

## Future Considerations

### If Editions Converge
**Sign**: 3+ editions use identical approaches
**Action**: Consolidate to single edition, archive duplicates
**Timeline**: Evaluate quarterly

### If Overhead Exceeds Value
**Sign**: More time coordinating than developing
**Action**: Pause/archive low-value editions
**Timeline**: Evaluate monthly

### If One Edition Dominates
**Sign**: Single edition clearly superior across all metrics
**Action**: Promote to main, archive others, preserve learnings
**Timeline**: After 6 months validation

## Architectural Principles

1. **Independence**: Editions can diverge without coordination
2. **Opt-In Sharing**: Adopt shared components when valuable
3. **Evidence-Based**: Metrics guide decisions, not opinions
4. **Fail Fast**: Archive experiments that don't deliver value
5. **Document Learnings**: Every archived edition teaches something

---

**Version**: 1.0.0
**Last updated**: 2025-11-17
**Stakeholders**: Human lead + AI agent team
