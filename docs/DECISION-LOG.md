# True Valence Mapper - Decision Log

Records major decisions, rationale, and outcomes for the multi-agent architecture.

## Format

```
### YYYY-MM-DD: Decision Title
**Context**: What prompted this decision?
**Options Considered**: What alternatives were evaluated?
**Decision**: What was chosen and why?
**Outcome**: What happened after implementation? (updated later)
**Metrics**: Quantitative results (updated later)
```

---

## Decisions

### 2025-11-17: Adopt Phased Multi-Agent Rollout (3 repos initially)

**Context**: Codex proposed creating 8 repositories immediately (parent + 7 editions). Analysis revealed this might be premature without validation that multi-repo architecture provides value.

**Options Considered**:
1. **Full rollout (8 repos)**: Create all editions immediately
   - Pro: Maximum experimentation
   - Con: High overhead, unproven value
2. **Phased rollout (3 repos)**: Start with parent + 2 editions
   - Pro: Lower risk, validate before scaling
   - Con: Slower to full experimentation
3. **Monorepo with branches**: Single repo, edition branches
   - Pro: Lowest overhead
   - Con: Less isolation for experiments

**Decision**: **Option 2 - Phased Rollout**
- Phase 1: Create parent + Claude + Codex editions (3 repos)
- Validate for 2-4 weeks
- Phase 2: Add more editions if validated

**Rationale**:
- Solo developer context (limited time budget)
- Aligns with IDP Testing Framework ("simulate first, minimize errors")
- Reversible if overhead exceeds value
- Can scale up based on evidence, not speculation

**Success Criteria**:
- Overhead < 2 hours/week
- Different approaches emerge between Claude and Codex
- Governance workflows are smooth
- Value > complexity cost

**Outcome**: _To be updated after 2-4 week validation period_

**Metrics**: _To be tracked weekly_
- Time spent on cross-edition governance
- Number of unique approaches discovered
- Features promoted to shared library
- User-facing improvements per edition

---

### 2025-11-17: Choose Polyrepo Over Monorepo

**Context**: Need to decide repository structure for multi-agent architecture.

**Options Considered**:
1. **Polyrepo (multiple repositories)**: Separate repo per edition
2. **Monorepo (single repository)**: All editions in one repo with directories
3. **Hybrid**: Core in monorepo, experiments in separate repos

**Decision**: **Option 1 - Polyrepo**

**Rationale**:
- Clear ownership boundaries per edition
- Independent release cycles valuable for experimentation
- Easier to archive failed experiments
- Familiar to most developers
- Complexity stays distributed vs centralized

**Trade-offs Accepted**:
- More repositories to manage (8 vs 1)
- Submodule complexity for shared components
- Need coordination mechanisms (governance docs)

**Outcome**: _To be evaluated after Phase 1 completion_

---

### 2025-11-17: Implement Dry-Run Mode for Automation

**Context**: Repository creation script could fail and create broken repos. Need safety mechanism.

**Options Considered**:
1. **No dry-run**: Run directly in production
   - Pro: Faster
   - Con: Risky, hard to test
2. **Dry-run mode**: Test without creating repos
   - Pro: Safe, allows validation
   - Con: Extra code complexity
3. **Sandbox testing**: Test in separate GitHub org
   - Pro: Full validation
   - Con: Requires additional setup

**Decision**: **Option 2 - Dry-Run Mode** + logging

**Rationale**:
- Low implementation cost (30 lines of code)
- High safety value
- Enables iterative testing
- Logging provides audit trail

**Outcome**: ✅ Successfully implemented and tested
- Dry-run mode works correctly
- Logging captures all operations
- Phase control allows gradual rollout

**Metrics**:
- Dry-run test passed: ✅
- Log file created: ✅
- Would have created 3 repos correctly: ✅

---

## Template for New Decisions

```markdown
### YYYY-MM-DD: Decision Title

**Context**:

**Options Considered**:
1. Option A
   - Pro:
   - Con:
2. Option B
   - Pro:
   - Con:

**Decision**:

**Rationale**:

**Success Criteria**:
-
-

**Outcome**: _To be updated_

**Metrics**: _To be tracked_
-
-
```

---

**Maintained by**: Human lead + AI agents
**Review frequency**: Monthly
**Retention**: Permanent (all decisions preserved)
