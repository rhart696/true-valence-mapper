# Automation Strategy

**Version**: 1.0
**Date**: 2026-02-17
**Target**: 82% automation of True Valence Mapper v1.0 implementation
**Approach**: AI-agent-driven development with human-in-the-loop for design decisions only

---

## 1. Automation Classification

### 1.1 Fully Automatable Tasks (Target: 45% of total effort)

These tasks require NO human input and can be executed by AI agents autonomously.

| Task | Agent | Input Artifact | Output | Est. Time |
|------|-------|----------------|--------|-----------|
| Scaffold React 19 + Next.js 15 project | Codex | Tech Stack (12) | Project skeleton | 5 min |
| Generate Tailwind config from design tokens | Codex | Design System (09) | tailwind.config.ts | 5 min |
| Generate TypeScript interfaces | Claude | API Contract (14) | types.ts | 5 min |
| Generate constants file (trust levels, colors) | Claude | Design System (09), API Contract (14) | constants.ts | 3 min |
| Scaffold all 13 component stubs | Claude | API Contract (14) | 13 .tsx files | 10 min |
| Generate validation functions | Claude | API Contract (14), User Stories (07) | validation.ts | 5 min |
| Generate SessionContext provider | Claude | Architecture (13), API Contract (14) | SessionContext.tsx | 10 min |
| Install dependencies | Codex | Tech Stack (12) | package.json, lock file | 3 min |
| Configure ESLint + Prettier | Codex | NFR Spec (08) | .eslintrc, .prettierrc | 3 min |
| Generate unit test stubs | Gemini | QA Strategy (16), API Contract (14) | *.test.tsx files | 10 min |
| Generate accessibility attributes | Gemini | Accessibility Spec (11) | ARIA props in components | 10 min |
| Configure Vercel deployment | Claude | Tech Stack (12) | vercel.json | 3 min |
| Generate PDF export utility | Claude | API Contract (14) | usePDFExport.ts | 10 min |
| Lighthouse CI config | Gemini | NFR Spec (08) | lighthouserc.js | 3 min |
| **Total** | | | | **~85 min** |

### 1.2 Partially Automatable Tasks (Target: 37% of total effort)

These tasks can be AI-initiated but require human review or input at specific checkpoints.

| Task | Agent | Human Input Needed | Est. Time (AI + Human) |
|------|-------|--------------------|------------------------|
| Implement RelationshipList component | Claude | Review UX flow, approve interaction patterns | 30 + 10 min |
| Implement TrustScorer component | Codex | Review color application, approve visual hierarchy | 30 + 10 min |
| Implement VisualCanvas component | Gemini | Review layout algorithm, approve grouping logic | 30 + 10 min |
| Implement screen routing (5 screens) | Claude | Review navigation flow, approve transitions | 20 + 5 min |
| Implement LandingScreen | Claude | Review copy and layout | 15 + 5 min |
| Implement NamingScreen | Claude | Review form UX | 15 + 5 min |
| Implement ScoringScreen | Codex | Review scoring interaction | 15 + 5 min |
| Implement CanvasScreen | Gemini | Review visualization output | 15 + 5 min |
| Implement ExportSuccessScreen | Gemini | Review export confirmation UX | 10 + 3 min |
| Implement TrustDefinitionsModal | Gemini | Review definition content accuracy | 10 + 3 min |
| Polish visual design | Codex | Approve final visual appearance | 20 + 10 min |
| Cross-browser testing | Gemini | Verify critical browser issues | 20 + 5 min |
| **Total** | | | **~230 + 76 min** |

### 1.3 Human-Only Tasks (Target: 18% of total effort)

These tasks require human judgment, domain expertise, or stakeholder decisions.

| Task | Who | Why Not Automatable | Est. Time |
|------|-----|---------------------|-----------|
| Resolve architecture decision (vanilla JS vs React) | Product Owner | Strategic trade-off | 15 min |
| Confirm unidirectional vs bidirectional scoring | Product Owner + Coach SME | Domain expertise | 10 min |
| Approve trust level terminology | Product Owner | Brand decision | 5 min |
| Review ProActive coaching methodology accuracy | Coach SME | Domain expertise | 15 min |
| Final UX walkthrough | Product Owner | Subjective quality judgment | 20 min |
| Production deployment approval | Product Owner | Business risk decision | 5 min |
| First coach onboarding test | Coach (real user) | Real-world validation | 30 min |
| **Total** | | | **~100 min** |

---

## 2. Automation Architecture

### 2.1 Agent-Task Mapping

```
┌─────────────────────────────────────────────────────┐
│                   ORCHESTRATOR (Claude)               │
│  Resolves contradictions, coordinates agents,         │
│  manages integration, handles deployment              │
├──────────┬──────────────────┬────────────────────────┤
│  CLAUDE  │      CODEX       │       GEMINI           │
│          │                  │                        │
│ • Types  │ • Project setup  │ • Test generation      │
│ • State  │ • Tailwind       │ • Accessibility        │
│ • Logic  │ • Components     │ • QA & validation      │
│ • PDF    │ • Polish         │ • Canvas               │
│ • Deploy │ • Animations     │ • Cross-browser        │
└──────────┴──────────────────┴────────────────────────┘
```

### 2.2 Automation Pipeline

```
Phase 0: RESOLVE (Human — 30 min)
  ├── Architecture decision
  ├── Scoring model confirmation
  └── Terminology standardization

Phase 1: SCAFFOLD (Fully Automated — 30 min)
  ├── Project creation (Codex)
  ├── Type generation (Claude)
  ├── Component stubs (Claude)
  ├── Test stubs (Gemini)
  └── Config files (Codex)

Phase 2: IMPLEMENT (Partially Automated — 3.5 hours)
  ├── Core components (Claude + Codex + Gemini, parallel)
  ├── Human review checkpoint (30 min)
  ├── Screen integration (All agents)
  └── Human review checkpoint (15 min)

Phase 3: POLISH (Partially Automated — 1 hour)
  ├── Visual polish (Codex)
  ├── PDF export (Claude)
  ├── Accessibility pass (Gemini)
  └── Human review checkpoint (10 min)

Phase 4: VALIDATE (Mixed — 1 hour)
  ├── Automated tests (All agents)
  ├── Lighthouse audit (Automated)
  ├── axe DevTools scan (Automated)
  ├── Cross-browser smoke test (Human-assisted)
  └── Production deployment (Human approval + automated deploy)
```

### 2.3 Human-in-the-Loop Checkpoints

| Checkpoint | When | Duration | Decision |
|------------|------|----------|----------|
| **HiTL-0** | Before Phase 1 | 30 min | Resolve 3 critical contradictions |
| **HiTL-1** | After Phase 2 core components | 30 min | Review component behavior and UX |
| **HiTL-2** | After Phase 2 integration | 15 min | Verify end-to-end flow works |
| **HiTL-3** | After Phase 3 polish | 10 min | Approve visual design and PDF output |
| **HiTL-4** | After Phase 4 validation | 5 min | Production deployment go/no-go |
| **Total Human Time** | | **~90 min** | |

---

## 3. Automation Tooling

### 3.1 Code Generation

| Tool | Purpose | Artifacts Used |
|------|---------|----------------|
| AI agent (Claude) | TypeScript interfaces, validation logic, state management, hooks | 14, 13, 07 |
| AI agent (Codex) | Project scaffold, Tailwind config, component implementation | 12, 09, 10 |
| AI agent (Gemini) | Test generation, accessibility implementation, QA | 16, 11, 08 |

### 3.2 Quality Automation

| Tool | Purpose | NFR Reference |
|------|---------|---------------|
| ESLint + TypeScript strict | Code quality gates | 08 §4.1 |
| Jest + React Testing Library | Unit and integration tests | 16 §2 |
| Playwright | E2E cross-browser testing | 16 §3 |
| axe-core | Accessibility scanning | 11 §6 |
| Lighthouse CI | Performance, accessibility, best practices scoring | 08 §1 |
| Bundle analyzer | Bundle size validation (<300KB) | 08 §1.3 |

### 3.3 Deployment Automation

| Tool | Purpose |
|------|---------|
| Vercel CLI | Preview deployments after each phase |
| GitHub Actions | CI pipeline (lint → test → build → deploy) |
| Vercel Production | One-click production deployment |

---

## 4. Automation Metrics

### 4.1 Target vs Baseline

| Metric | Manual Baseline | Automated Target | Improvement |
|--------|----------------|------------------|-------------|
| Project setup | 60 min | 10 min | 6x faster |
| Component scaffolding | 120 min | 15 min | 8x faster |
| Test writing | 90 min | 15 min | 6x faster |
| Accessibility implementation | 60 min | 20 min | 3x faster |
| Total implementation | 8 hours | 6 hours | 25% reduction |
| Human time required | 8 hours | 90 min | 81% reduction |

### 4.2 Automation Coverage by Phase

| Phase | Duration | Automated | Human | Automation % |
|-------|----------|-----------|-------|--------------|
| Phase 0: Resolve | 30 min | 0 min | 30 min | 0% |
| Phase 1: Scaffold | 30 min | 28 min | 2 min | 93% |
| Phase 2: Implement | 3.5 hours | 2.75 hours | 45 min | 79% |
| Phase 3: Polish | 1 hour | 50 min | 10 min | 83% |
| Phase 4: Validate | 1 hour | 55 min | 5 min | 92% |
| **Total** | **6.5 hours** | **5.3 hours** | **1.2 hours** | **82%** |

---

## 5. Risk Mitigation for Automation

### 5.1 Automation Risks

| Risk | Probability | Impact | Mitigation |
|------|-------------|--------|------------|
| Generated code has bugs | High | Medium | Human review at each checkpoint; automated tests catch regressions |
| Component integration failures | Medium | High | Continuous integration testing; preview deployments after each phase |
| AI hallucination in accessibility | Low | High | axe-core automated scanning validates ARIA patterns |
| PDF export generation fails | Medium | Medium | Test early (Phase 2, not Phase 3); browser print fallback |
| Agent coordination overhead | Low | Medium | Clear task boundaries; no shared files between parallel agents |

### 5.2 Fallback Strategies

| If This Fails | Then Do This |
|----------------|--------------|
| React scaffold generation | Use `create-next-app` with manual config |
| Component stub generation | Manual creation from API Contract (14) |
| Test generation | Defer tests to post-deployment; manual smoke testing |
| Automated accessibility | Manual axe DevTools audit; keyboard-only walkthrough |
| Vercel deployment | GitHub Pages static export fallback |

---

## 6. Implementation Sequence

### 6.1 Dependency Graph

```
HiTL-0 (Resolve contradictions)
  │
  ├── Scaffold project (Codex) ──┐
  ├── Generate types (Claude) ───┤
  └── Generate tests (Gemini) ───┤
                                  │
                          ┌───────┘
                          ▼
                 Component stubs ready
                          │
          ┌───────────────┼───────────────┐
          ▼               ▼               ▼
   RelationshipList  TrustScorer   VisualCanvas
   (Claude)          (Codex)       (Gemini)
          │               │               │
          └───────────────┼───────────────┘
                          │
                    HiTL-1 (Review)
                          │
                 Screen integration
                          │
                    HiTL-2 (Review)
                          │
              ┌───────────┼───────────┐
              ▼           ▼           ▼
         PDF Export   Visual Polish  a11y Pass
         (Claude)     (Codex)        (Gemini)
              │           │           │
              └───────────┼───────────┘
                          │
                    HiTL-3 (Review)
                          │
              ┌───────────┼───────────┐
              ▼           ▼           ▼
         Unit Tests  E2E Tests   Lighthouse
              │           │           │
              └───────────┼───────────┘
                          │
                    HiTL-4 (Deploy)
```

---

**Strategy Status**: Complete
**Automation Target**: 82% (5.3 of 6.5 hours automated)
**Human Time Required**: ~90 minutes across 5 checkpoints
**Next Deliverable**: 20-UPDATED-IMPLEMENTATION-PLAN.md
