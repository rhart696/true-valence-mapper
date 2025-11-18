# Shared Component Library

Common assets used across True Valence Mapper editions.

---

## Overview

This directory contains code, styles, schemas, and utilities shared between edition repositories. Editions can opt-in to using shared components via submodule updates.

---

## Directory Structure

```
shared/
├── styles/        # Common CSS, themes, design tokens
├── components/    # Reusable JavaScript modules
├── schemas/       # Database schemas and migrations
├── security/      # Security validation and protection
└── tests/         # Common test utilities and fixtures
```

---

## Shared Components

### Styles

| Component | Version | Description | Editions Using |
|-----------|---------|-------------|----------------|
| *None yet* | - | - | - |

### Components

| Component | Version | Description | Editions Using |
|-----------|---------|-------------|----------------|
| *None yet* | - | - | - |

### Schemas

| Component | Version | Description | Editions Using |
|-----------|---------|-------------|----------------|
| *None yet* | - | - | - |

### Security

| Component | Version | Description | Editions Using |
|-----------|---------|-------------|----------------|
| *None yet* | - | - | - |

### Tests

| Component | Version | Description | Editions Using |
|-----------|---------|-------------|----------------|
| *None yet* | - | - | - |

---

## Adding a New Shared Component

1. **Propose:** Create issue with `promotion-candidate` label
2. **Review:** Discuss in weekly sync meeting
3. **Implement:** Follow [Feature Promotion Workflow](../docs/FEATURE-PROMOTION-WORKFLOW.md)
4. **Document:** Add README to component directory
5. **Announce:** Notify editions via GitHub Discussion

---

## Using Shared Components in Editions

### Option 1: Copy files (simple)

```bash
cd /home/ichardart/dev/projects/true-valence-mapper-[edition]
cp ../true-valence-mapper/shared/[category]/[file] [destination]
git add [destination]
git commit -m "Adopt shared [component]"
```

### Option 2: Reference via submodule (advanced)

```html
<!-- In HTML -->
<script src="../true-valence-mapper/shared/components/[file].js"></script>
<link rel="stylesheet" href="../true-valence-mapper/shared/styles/[file].css">
```

### Option 3: Build pipeline integration (future)

```javascript
// Import from shared library
import { Component } from '@true-valence/shared/components';
```

---

## Versioning

Shared components use semantic versioning:

**Format:** `v{major}.{minor}.{patch}-shared`

**Tags:**
- `v1.0.0-shared` - Initial shared library
- `v1.1.0-shared` - Added new component
- `v2.0.0-shared` - Breaking change

**Editions can pin to versions:**
```bash
cd versions/parent
git checkout v1.0.0-shared
```

---

## Maintenance

**Owner:** Human coordinator
**Review Frequency:** Monthly
**Deprecation Policy:** 90-day notice before removing components

---

## Guidelines

### When to Share

✅ **DO share if:**
- Used by 2+ editions
- Well-tested (>80% coverage)
- Security reviewed
- Documented with examples
- Stable (1+ week in production)

❌ **DON'T share if:**
- Edition-specific logic
- Experimental/unstable
- Security concerns
- Poorly documented
- High maintenance overhead

### Quality Standards

All shared components must:
- [ ] Pass security scan
- [ ] Include documentation (README + examples)
- [ ] Have test coverage > 80% (if applicable)
- [ ] Use consistent coding style
- [ ] Have clear API/interface
- [ ] No hard-coded edition assumptions

---

## Support

**Questions:** Open issue with `shared-component` label
**Bugs:** Open issue with `cross-edition` + `bug` labels
**Proposals:** Use feature promotion issue template

---

**Library Version:** 1.0.0
**Last Updated:** 2025-11-18
**Components:** 0 (ready for additions)
