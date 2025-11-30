# GitHub Copilot Instructions for True Valence Mapper

## Repository Architecture

This repository uses a **dual-location pattern** for multi-agent AI development:

- **Standalone repos** (`/home/ichardart/dev/projects/true-valence-mapper-{edition}/`): AI agent workspaces
- **Parent repo** (`/home/ichardart/dev/projects/true-valence-mapper/`): Human coordination hub with git submodules

### Why This Architecture?

**Problem:** AI agents struggle with git submodules (nested .git dirs, detached HEAD, complex commands)
**Solution:** Agents work in standalone repos with full context, humans coordinate via parent repo with submodules

## Critical Rules (MUST FOLLOW)

### 1. NEVER Work Directly in `versions/` Directories ❌
```bash
# WRONG - Don't do this!
cd /home/ichardart/dev/projects/true-valence-mapper/versions/claude
# Making changes here breaks the dual-location pattern
```

```bash
# CORRECT - Always use standalone repos
cd /home/ichardart/dev/projects/true-valence-mapper-claude
# Work here - full git context, no submodule complexity
```

### 2. NEVER Use HTTPS Remote URLs ❌
```bash
# WRONG
git remote add origin https://github.com/rhart696/true-valence-mapper-claude.git

# CORRECT
git remote add origin git@github.com:rhart696/true-valence-mapper-claude.git
```

### 3. ALWAYS Commit Before Context Switching ✅
```bash
# Before closing IDE, switching tasks, or ending work session
git add -A
git commit -m "descriptive message"
git push origin main
```

**Why:** Uncommitted work risks data loss. We learned this the hard way (187MB at risk in Phase 1).

### 4. ALWAYS Push to Remote Immediately ✅
```bash
# After every commit
git push origin main
```

**Why:** Parent repo submodules track remote HEAD. Local-only commits break sync.

## Reference Models (Follow These Patterns)

When suggesting git workflows, follow these proven patterns:

### **codex** - Gold Standard for Commit Hygiene
- Regular commits after every logical change
- Clean git history (no force pushes)
- Zero uncommitted changes at end of session
- Descriptive commit messages

### **magic-path** - Stable Development Workflow
- Feature branches for development
- Merge to main only when complete
- Clean merges (no conflicts)
- Parent submodule updated post-merge

### **openspec** - Minimalist But Clean
- Infrequent updates (low activity edition)
- When updated, changes committed immediately
- No sync drift despite low frequency
- No manual sync commands needed

## Required Actions Before Suggesting Code

When generating code suggestions:

1. **Check Edition Context**
   - Which standalone repo are we in?
   - Is this the parent repo or an edition?

2. **Verify Sync Impact**
   - Will this change affect dual-location sync?
   - Does it require parent repo update?

3. **Follow Reference Patterns**
   - Match commit style to reference models
   - Include push commands in workflows

4. **Include Health Checks**
   ```bash
   # After git operations
   ./scripts/health-check.sh
   ```

## Health Check Integration

### Quick Validation
```bash
# In parent repo - check all editions
cd /home/ichardart/dev/projects/true-valence-mapper
./scripts/health-check.sh
```

### Detailed Analysis
```bash
# Before major changes
./scripts/sync-check-advanced.sh

# Auto-fix simple issues
./scripts/sync-check-advanced.sh --fix

# Check specific edition
./scripts/sync-check-advanced.sh --edition claude
```

### Weekly Automation
```bash
# Test the automation
./scripts/weekly-sync-automation.sh --test
```

## Documentation Priority

When answering questions, reference these docs in order:

1. **[REPOSITORY-STRUCTURE.md](docs/REPOSITORY-STRUCTURE.md)** - Architecture overview and dual-location pattern
2. **[SYNC-REFERENCE-MODELS.md](docs/SYNC-REFERENCE-MODELS.md)** - Perfect sync examples and anti-patterns
3. **[GOVERNANCE.md](docs/GOVERNANCE.md)** - Sync policies and schedules
4. **[AUTOMATION-SETUP.md](docs/AUTOMATION-SETUP.md)** - Local automation setup
5. **[GITHUB-AUTOMATION-STRATEGY.md](docs/GITHUB-AUTOMATION-STRATEGY.md)** - Cloud automation setup

## Common Workflows

### Making Changes in an Edition
```bash
# 1. Work in standalone repo only
cd /home/ichardart/dev/projects/true-valence-mapper-claude

# 2. Make changes
# ... edit files ...

# 3. Commit and push immediately
git add -A
git commit -m "feat: add new feature X

- Implemented feature logic
- Added tests
- Updated documentation

🤖 Generated with Claude Code
Co-Authored-By: Claude <noreply@anthropic.com>"
git push origin main

# 4. Parent submodule auto-updates via GitHub Actions
# (No manual intervention needed if automation is set up)
```

### Checking Sync Status
```bash
# In parent repo
cd /home/ichardart/dev/projects/true-valence-mapper
./scripts/health-check.sh

# Expected output for healthy repo:
# ✅ claude: In sync (0768b551)
# ✅ codex: In sync (4ddb6b56)
# ✅ bmad: In sync (d95e5517)
# ... etc
```

### Fixing Sync Issues
```bash
# If health check shows warnings
cd /home/ichardart/dev/projects/true-valence-mapper

# Run detailed analysis
./scripts/sync-check-advanced.sh --edition <edition-name>

# Review output and follow suggested remediation
# Consult docs/SYNC-REFERENCE-MODELS.md for patterns
```

## Anti-Patterns to Avoid

### ❌ Uncommitted Work Accumulation
```bash
# BAD - Working for days without commits
# ... 100+ files changed ...
# ... still not committed ...

# GOOD - Commit after every logical change
git commit -m "feat: add user authentication"
git commit -m "test: add auth tests"
git commit -m "docs: update auth documentation"
```

### ❌ Forgetting to Push
```bash
# BAD
git commit -m "important changes"
# ... close laptop, push to remote later ...

# GOOD
git commit -m "important changes"
git push origin main  # Immediate push
```

### ❌ Working in Submodule Directories
```bash
# BAD
cd /home/ichardart/dev/projects/true-valence-mapper/versions/claude
vim src/main.py

# GOOD
cd /home/ichardart/dev/projects/true-valence-mapper-claude
vim src/main.py
```

### ❌ Manual Submodule Updates (When Automation Exists)
```bash
# BAD (if GitHub Actions auto-sync is enabled)
git submodule update --remote versions/claude
git add versions/claude
git commit -m "update submodule"

# GOOD - Let automation handle it
# Push to edition repo, GitHub Actions updates parent automatically
```

## Code Generation Guidelines

### Always Include Full Workflow
```bash
# When suggesting git operations, include complete workflow:

# BAD - Incomplete suggestion
echo "Hello" > test.txt

# GOOD - Complete workflow
echo "Hello" > test.txt
git add test.txt
git commit -m "chore: add test file"
git push origin main
```

### Include Health Checks for Significant Changes
```bash
# After significant git operations
./scripts/health-check.sh

# If making changes that might affect sync
./scripts/sync-check-advanced.sh --edition <edition-name>
```

### Follow Governance Policies
```bash
# Commit messages should include:
# - Type: feat, fix, docs, chore, test, refactor
# - Description: what changed
# - Body (optional): why it changed
# - Footer: 🤖 Generated with Claude Code

git commit -m "feat: implement new feature

- Added feature logic
- Updated tests
- Fixed edge cases

🤖 Generated with Claude Code
Co-Authored-By: Claude <noreply@anthropic.com>"
```

## Edition-Specific Contexts

When working in a specific edition, be aware of its purpose:

- **claude** - Claude AI agent development workspace
- **codex** - GitHub Copilot/Codex development workspace
- **bmad** - BMAD methodology integration
- **spec-kit** - Specification-driven development
- **magic-path** - Magic Path methodology
- **openspec** - OpenSpec framework integration
- **Gemini_3** - Google Gemini AI agent workspace (submodule-only)

## Automation Context

### Local Automation (Cron)
- Runs weekly health check on local machine
- Reports saved to `reports/weekly-sync/`
- Requires cron job setup

### Cloud Automation (GitHub Actions)
- Auto-updates parent submodules on edition pushes
- Runs weekly health check in cloud (even if machine off)
- Creates issues on failures
- Posts to GitHub Discussions

## Error Handling

### If Health Check Fails
```bash
# 1. Review output
./scripts/health-check.sh

# 2. Run detailed analysis
./scripts/sync-check-advanced.sh

# 3. Consult reference models
cat docs/SYNC-REFERENCE-MODELS.md

# 4. Apply remediation workflow
# (Follow specific guidance in SYNC-REFERENCE-MODELS.md)
```

### If Sync Drift Detected
```bash
# Check which edition is out of sync
./scripts/sync-check-advanced.sh

# Review the specific edition
./scripts/sync-check-advanced.sh --edition <edition-name>

# Apply auto-fix (if appropriate)
./scripts/sync-check-advanced.sh --edition <edition-name> --fix
```

## Performance Considerations

### Token Economy
- Reference docs by filename only, not full content
- Use short examples, not full workflows
- Link to existing documentation rather than repeating

### Efficiency
- Suggest parallel operations when possible
- Avoid unnecessary file reads
- Use existing scripts rather than reinventing

## Security Reminders

- ✅ SSH keys for authentication (not passwords)
- ✅ Secrets stored in GitHub (not in code)
- ❌ Never commit credentials
- ❌ Never commit `.env` files with secrets

---

**Last Updated:** 2025-11-30
**Maintained By:** Repository Governance Team
**Version:** 1.0.0

🤖 These instructions help GitHub Copilot understand the dual-location architecture and suggest better code!
