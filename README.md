# True Valence Relationship Mapper

**Parent repository coordinating all True Valence Mapper agent editions**

## Overview

This repository serves as the governance and coordination hub for the True Valence Mapper multi-agent development architecture. Different AI orchestrators (Claude Code, GitHub Copilot/Codex, Gemini, etc.) lead development of parallel editions to explore diverse implementation approaches.

## Editions

| Edition | Repository | Status | Lead Agent | Focus |
|---------|-----------|--------|------------|-------|
| Claude Code | [true-valence-mapper-claude](https://github.com/rhart696/true-valence-mapper-claude) | ✅ Active | Claude Code | Reference build, security-first |
| Codex | [true-valence-mapper-codex](https://github.com/rhart696/true-valence-mapper-codex) | 🚧 In Progress | GitHub Copilot/Codex | Engineering workflow optimization |
| Multi Path | [true-valence-mapper-multipath](https://github.com/rhart696/true-valence-mapper-multipath) | 📅 Planned | Multi Path | Orchestration experiments |
| Gemini | [true-valence-mapper-gemini](https://github.com/rhart696/true-valence-mapper-gemini) | 📅 Planned | Gemini AI Studio | AI-powered insights |
| BMAD Method | [true-valence-mapper-bmad-method](https://github.com/rhart696/true-valence-mapper-bmad-method) | 📅 Planned | TBD | Coaching methodology |
| Stitch | [true-valence-mapper-stitch](https://github.com/rhart696/true-valence-mapper-stitch) | 📅 Planned | TBD | Automation platform |
| Speckit | [true-valence-mapper-speckit](https://github.com/rhart696/true-valence-mapper-speckit) | 📅 Planned | TBD | Enablement focus |

Legend: ✅ Shipped | 🚧 In Progress | 📅 Planned | ⏸️ Paused | 🗄️ Archived

## Repository Structure

```
true-valence-mapper/
├── docs/              # Cross-edition documentation
│   ├── GOVERNANCE.md  # Workflow and decision processes
│   ├── ARCHITECTURE.md # Multi-agent architecture rationale
│   └── DECISION-LOG.md # Edition comparison tracking
├── shared/            # Common assets used by all editions
│   ├── styles/        # Shared CSS
│   ├── components/    # Reusable JavaScript modules
│   ├── schemas/       # Supabase database schemas
│   ├── security/      # Input validation and XSS protection
│   └── tests/         # Common test fixtures
├── versions/          # Edition repositories (submodules)
│   ├── claude/        # → true-valence-mapper-claude
│   └── codex/         # → true-valence-mapper-codex
└── ops/               # Monitoring and status tracking
```

## Quick Start

### Clone with Submodules

```bash
git clone --recursive git@github.com:rhart696/true-valence-mapper.git
cd true-valence-mapper
```

### Update All Editions

```bash
git submodule update --remote --merge
```

### Check Edition Status

```bash
# View comparison dashboard
open ops/status-dashboard.html

# Check specific edition
cd versions/claude && git status
```

## Governance

See [GOVERNANCE.md](docs/GOVERNANCE.md) for:
- Weekly sync meeting schedule
- Feature promotion workflow (edition → shared)
- Cross-edition issue coordination
- Decision criteria for archiving editions

## Feature Comparison

| Feature | Claude | Codex | Gemini | Notes |
|---------|--------|-------|--------|-------|
| Core visualization | ✅ v1.0 | 🚧 | 📅 | Claude baseline complete |
| Cloud storage (anon) | ✅ v1.0 | 🚧 | 📅 | Supabase RLS implemented |
| Toast notifications | ✅ v1.0 | 🚧 | 📅 | Comprehensive UX feedback |
| Version history | ✅ v1.0 | 🚧 | 📅 | Cloud-synced history |
| Input validation | ✅ v1.0 | 🚧 | 📅 | XSS + injection protection |
| AI-powered insights | 📅 | 📅 | 🚧 | Gemini experiment |
| Coach sharing | 📅 | 📅 | 📅 | Planned Phase 2 |

## Contributing

Each edition repository has its own contribution guidelines. For cross-edition work:

1. Propose in parent repo issues with `cross-edition` label
2. Discuss in weekly sync meeting
3. Implement in `shared/` directory
4. Editions opt-in via submodule update

See [CONTRIBUTING.md](CONTRIBUTING.md) for details.

## License

MIT License - see [LICENSE](LICENSE)

## Links

- [Multi-Agent Version Plan](https://github.com/rhart696/true-valence-mapper-claude/blob/main/docs/planning/MULTI-AGENT-VERSION-PLAN.md)
- [Claude Edition (Baseline)](https://rhart696.github.io/true-valence-mapper-claude/)
- [Security Documentation](https://github.com/rhart696/true-valence-mapper-claude/tree/main/docs/security)

---

**Coordinated development by human + AI agent teams | © 2024-2025**
