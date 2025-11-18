# Feature Promotion Workflow

Process for promoting features from edition repositories to the shared library.

---

## Overview

When a feature developed in one edition proves valuable for multiple editions, it can be promoted to the `shared/` directory for reuse.

---

## Criteria for Promotion

A feature is a candidate for promotion if it meets **all** of these:

- ✅ **Applicable to 2+ editions** - Not edition-specific
- ✅ **Security reviewed** - No vulnerabilities identified
- ✅ **Well-tested** - Test coverage > 80%
- ✅ **Documented** - Clear usage instructions
- ✅ **Stable** - Used in production for 1+ week without issues
- ✅ **Positive feedback** - User or developer validation

---

## Workflow Steps

### Step 1: Propose Promotion

**Who:** Edition lead (human or AI agent)

**Action:** Create issue in parent repository

**Template:**
```markdown
Title: [Promote Feature] [Feature Name] from [Edition]

**Feature:** [Name and brief description]
**Edition:** [Claude/Codex/etc]
**Category:** [styles/components/schemas/security/tests]
**Applicability:** [Which editions can use this?]

**Benefits:**
- [Benefit 1]
- [Benefit 2]

**Test Results:**
- Coverage: [%]
- Security scan: [Pass/Fail]
- Production usage: [Duration]

**Effort to adopt:** [Low/Medium/High per edition]

**Proposal:** Move to `shared/[directory]/[filename]`

Labels: promotion-candidate, shared-component
```

### Step 2: Review in Weekly Sync

**Who:** All edition leads

**Discussion:**
- Is it truly applicable to multiple editions?
- Security concerns?
- Maintenance overhead acceptable?
- Implementation effort reasonable?

**Decision:**
- ✅ **Approved** - Proceed to Step 3
- ⏸️ **Deferred** - Not ready, needs more validation
- ❌ **Rejected** - Not suitable for sharing

### Step 3: Implement Promotion

**Who:** Original edition lead

**Actions:**

1. **Extract to shared directory:**
   ```bash
   cd /home/ichardart/dev/projects/true-valence-mapper

   # Copy feature files
   cp ../true-valence-mapper-[edition]/[file] shared/[category]/

   # Add documentation
   echo "# [Feature Name]" > shared/[category]/README.md
   ```

2. **Create pull request to parent repo:**
   ```bash
   git checkout -b feature/add-[name]-to-shared
   git add shared/[category]/[files]
   git commit -m "Add [feature] to shared library from [edition]"
   git push -u origin feature/add-[name]-to-shared
   gh pr create --title "Add [feature] to shared" --body "[Description]"
   ```

3. **Update shared component index:**
   - Add entry to `shared/README.md`
   - Document usage examples
   - List compatible editions

### Step 4: Code Review

**Who:** Other edition leads + human coordinator

**Review checklist:**
- [ ] Code quality acceptable
- [ ] Security scan passing
- [ ] Documentation clear
- [ ] Examples provided
- [ ] Tests included (if applicable)
- [ ] No edition-specific assumptions

**Approval:** Requires 1+ approving review

### Step 5: Merge to Parent

**Who:** Human coordinator

**Action:** Merge PR to parent `main` branch

**Result:** Feature now in `shared/[category]/` and available to all editions

### Step 6: Edition Adoption

**Who:** Each edition lead (opt-in basis)

**Process:**

1. **Update submodule in edition:**
   ```bash
   cd /home/ichardart/dev/projects/true-valence-mapper-[edition]
   git submodule update --remote ../true-valence-mapper
   ```

2. **Review shared component:**
   ```bash
   # Check what changed
   cd ../true-valence-mapper
   git log versions/parent --oneline | head -5
   ```

3. **Integrate into edition:**
   ```bash
   # Copy or import shared component
   cp ../true-valence-mapper/shared/[category]/[file] [local-path]

   # OR reference directly if possible
   # <script src="../true-valence-mapper/shared/[category]/[file]"></script>
   ```

4. **Test in edition:**
   - Run existing tests
   - Verify functionality
   - Check for conflicts

5. **Commit adoption:**
   ```bash
   git add .
   git commit -m "Adopt shared [feature] from parent repo"
   git push
   ```

**Timeline:** Editions adopt at their own pace (no forced updates)

---

## Shared Component Categories

### `shared/styles/`
**Purpose:** Common CSS, themes, design tokens

**Examples:**
- Color schemes
- Typography
- Layout utilities
- Animation libraries

### `shared/components/`
**Purpose:** Reusable JavaScript modules

**Examples:**
- UI widgets
- Utility functions
- State management
- API clients

### `shared/schemas/`
**Purpose:** Database schemas and migrations

**Examples:**
- Supabase table definitions
- RLS policies
- Migration scripts
- Type definitions

### `shared/security/`
**Purpose:** Security validation and protection

**Examples:**
- Input sanitization
- XSS protection
- Authentication helpers
- Permission checks

### `shared/tests/`
**Purpose:** Common test utilities and fixtures

**Examples:**
- Mock data generators
- Test helpers
- Assertion libraries
- CI/CD configurations

---

## Versioning Shared Components

**Format:** `v{major}.{minor}.{patch}-shared`

**When to bump:**
- **Major:** Breaking changes (editions must update code)
- **Minor:** New features (backward compatible)
- **Patch:** Bug fixes (drop-in replacement)

**Example:**
```bash
cd /home/ichardart/dev/projects/true-valence-mapper
git tag v1.0.0-shared
git push --tags
```

**Editions can pin to specific versions:**
```bash
cd versions/parent
git checkout v1.0.0-shared
```

---

## Handling Conflicts

### If editions have different implementations:

1. **Option A: Keep both**
   - Rename to indicate edition: `component-claude.js`, `component-codex.js`
   - Each edition uses their preferred version
   - Document differences

2. **Option B: Merge best of both**
   - Create hybrid in shared/
   - Add configuration options for edition-specific behavior
   - Test with both editions

3. **Option C: Choose one as standard**
   - Deprecate others
   - Provide migration guide
   - Set sunset date for old versions

---

## Rollback Procedure

If a promoted feature causes issues:

1. **Immediate:** Editions stop using it
   ```bash
   # Revert local changes
   git revert [commit]
   git push
   ```

2. **Parent repo:** Remove from shared/
   ```bash
   cd /home/ichardart/dev/projects/true-valence-mapper
   git revert [promotion-commit]
   git push
   ```

3. **Documentation:** Update decision log
   ```markdown
   ## Feature [Name] Rollback
   **Date:** YYYY-MM-DD
   **Reason:** [Why it was removed]
   **Alternatives:** [What editions should use instead]
   ```

---

## Metrics to Track

**Per promoted feature:**
- Adoption rate (% of editions using it)
- Issues filed
- Time to adoption per edition
- Maintenance overhead (hours/month)

**Overall:**
- Total shared components
- Code reuse percentage
- Duplicate code reduction
- Cross-edition compatibility

---

## Templates

### Promotion Issue Template

See: `.github/ISSUE_TEMPLATE/feature-promotion.md`

### Shared Component README Template

See: `shared/COMPONENT-README-TEMPLATE.md`

---

**Workflow Version:** 1.0
**Last Updated:** 2025-11-18
**Owner:** Human coordinator + all edition leads
