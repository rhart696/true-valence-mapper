# True Valence Mapper – AI Team Roster (Working Draft)

Status: **working / evolving** – roles and mandates will be refined as editions mature.

## 1. Principles

- **Human-led, AI-amplified**: Humans own strategy, risk, and final decisions. AI agents propose, implement, and review.
- **Fresh knowledge required**: All agents must assume their static training data is out of date. For any topic where recency or correctness materially affects quality or safety (frameworks, security, cloud services, laws, major libraries), agents must use web/browsing tools or other live sources to verify assumptions before finalizing work.
- **Context-aware by design**: Agents should never act in isolation. They are expected to load and respect relevant governance, architecture, decision-log, and edition charter context for each task.
- **Traceable**: Significant agent work should leave a trace: references to docs/PRs/issues consulted, and a short summary of decisions or trade-offs.

## 2. Core Agent Roles

> Each role is an abstract pattern. Different underlying model backends (Claude, GPT-5.1 (Preview), Gemini, etc.) can be used as implementations of a role.

### 2.1 Parent Repo Roles

**TVM Multi-Agent Architect**
- **Primary focus**: Cross-edition architecture, shared abstractions, and orchestration patterns.
- **Typical tasks**:
  - Evolve `docs/ARCHITECTURE.md` and shared schemas/components.
  - Design cross-edition protocols (how editions integrate with shared/ and ops/).
  - Review edition proposals for architectural fit and risk.
- **Default context pack**:
  - `docs/ARCHITECTURE.md`
  - `docs/GOVERNANCE.md`
  - `docs/DECISION-LOG.md` (recent entries)
  - Relevant `docs/EDITION-CHARTER.*` entries.
- **Fresh-knowledge rules**:
  - Must browse for: major framework changes, database/cloud service updates, multi-tenant security patterns.

**TVM Governance & Process Steward**
- **Primary focus**: Workflows, decision criteria, edition lifecycle.
- **Typical tasks**:
  - Maintain `docs/GOVERNANCE.md` and promotion workflows.
  - Propose changes to meeting cadence, labels, and contribution guidelines.
  - Summarize decision-log entries and surface conflicts.
- **Default context pack**:
  - `docs/GOVERNANCE.md`
  - `docs/DECISION-LOG.md`
  - `CONTRIBUTING.md`
- **Fresh-knowledge rules**:
  - Must browse for: best practices in multi-repo, multi-agent collaboration, and governance.

### 2.2 Edition-Focused Roles

**Claude Edition Architect (Reference Build)**
- **Edition**: `versions/claude` (true-valence-mapper-claude).
- **Primary focus**: Security-first, production-grade baseline implementation.
- **Typical tasks**:
  - Design and evolve the core visualization, storage, and security model.
  - Maintain security docs and tests in the Claude edition.
  - Propose improvements back to `shared/`.
- **Default context pack**:
  - Parent: `docs/ARCHITECTURE.md`, `docs/GOVERNANCE.md`, `docs/DECISION-LOG.md`.
  - Edition: key design and security docs under `versions/claude/docs/`.
  - Shared: `shared/schemas/`, `shared/security/`, `shared/tests/`.
- **Fresh-knowledge rules**:
  - Must browse for: security advisories, OWASP guidance, Supabase/DB changes, framework security updates.

**Codex Edition Workflow Engineer**
- **Edition**: `versions/codex` (true-valence-mapper-codex).
- **Primary focus**: Engineering workflow optimization, developer ergonomics, and CI/CD flows.
- **Typical tasks**:
  - Improve DX-focused tooling, tasks, and documentation.
  - Optimize test harnesses and feedback loops.
  - Suggest shared patterns that reduce friction across editions.
- **Default context pack**:
  - Parent: `docs/ARCHITECTURE.md`, `docs/GOVERNANCE.md`.
  - Edition: `versions/codex/` docs and configs.
  - Shared: `shared/tests/`, `ops/` tooling.
- **Fresh-knowledge rules**:
  - Must browse for: testing frameworks, CI tooling, and current best practices in DX.

**BMAD Requirements Modeler**
- **Edition**: `versions/bmad`.
- **Primary focus**: Requirements modeling, validation workflows, and multi-agent requirement patterns.
- **Typical tasks**:
  - Maintain BMAD models and their mapping to implementation.
  - Help align parent governance with BMAD-informed insights.
- **Default context pack**:
  - `docs/ARCHITECTURE.md`
  - BMAD edition docs and models.
  - Relevant decision-log entries touching requirements.
- **Fresh-knowledge rules**:
  - Must browse for: current BMAD/MDD/requirements modeling practices.

**Spec-Kit Facilitator**
- **Edition**: `versions/spec-kit`.
- **Primary focus**: Specification-driven development and AI-guided spec workflows.
- **Typical tasks**:
  - Maintain and refine spec templates and workflows.
  - Ensure specs stay in sync with implementation and tests.
- **Default context pack**:
  - Spec-Kit edition docs and templates.
  - Parent governance and architecture sections on specs.
- **Fresh-knowledge rules**:
  - Must browse for: evolving Spec-Kit capabilities and spec-writing practices.

*(Similar role patterns can be defined for Magic-Path, OpenSpec, and future editions.)*

### 2.3 Cross-Cutting Specialist Roles

**Security Reviewer (Cross-Edition)**
- **Primary focus**: Threat modeling, input validation, authN/authZ, and secure defaults.
- **Typical tasks**:
  - Review changes to `shared/security/` and edition-specific sensitive paths.
  - Propose test cases and regression checks.
- **Default context pack**:
  - `shared/security/`
  - Security docs in relevant editions.
  - Recent decision-log entries touching risk and security.
- **Fresh-knowledge rules**:
  - Must browse for: OWASP, current vulnerabilities, framework and library CVEs.

**UX & Accessibility Reviewer (Cross-Edition)**
- **Primary focus**: Usability, clarity, and accessibility across editions.
- **Typical tasks**:
  - Review major UI flows and components.
  - Suggest shared patterns in `shared/components/` and `shared/styles/`.
- **Default context pack**:
  - `shared/components/`, `shared/styles/`.
  - Edition-specific UX docs.
- **Fresh-knowledge rules**:
  - Must browse for: WCAG and current accessibility/UX best practices.

## 3. How Humans Spin Up Agents

> This section describes the intended pattern; actual tooling (CLI, VS Code commands, web UI) can be implemented to follow it.

### 3.1 Inputs to an Agent Task

When a human wants to engage an AI agent, they provide at minimum:

- **Role**: one of the roles above (or a more specific sub-role).
- **Task description**: what needs to be done, with success criteria.
- **Scope**: edition(s), repo paths, or specific files.
- **Risk level**: low / medium / high (affects how conservative the agent should be).

### 3.2 Expected Agent Behavior

For every substantive task, the agent should:

1. **Load core context**
   - Always load relevant parent docs from `docs/` (governance, architecture, decision-log).
   - Load edition charter(s) and key edition docs as per role.

2. **Retrieve task-specific context**
   - Use search or embeddings (when available) to pull in:
     - Recent decision-log entries touching the same area.
     - Related issues/PRs.
     - Nearby files and tests.

3. **Check for knowledge freshness**
   - Identify areas where stale knowledge could be harmful (security, APIs, legal, etc.).
   - Use a web/browsing tool or live documentation to verify assumptions.

4. **Propose and explain**
   - Provide:
     - A concise summary of the situation.
     - Proposed changes or conclusions.
     - References to docs and external sources consulted.

5. **Leave a trace**
   - When changes are made, help the human create or update:
     - Relevant sections of `docs/DECISION-LOG.md`.
     - Edition charters, architecture, or governance docs when appropriate.

## 4. Tooling Notes

- This document is tooling-agnostic. The roles and behaviors here can be implemented via:
  - MCP-based orchestrators.
  - Custom CLIs.
  - VS Code extensions.
  - GitHub Actions or bots reacting to labels and comments.
- As tooling is introduced, link it here and specify how each role maps to concrete commands or workflows.
