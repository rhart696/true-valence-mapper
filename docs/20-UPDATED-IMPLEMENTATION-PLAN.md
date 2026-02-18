# Updated Implementation Plan

**Version**: 2.0
**Date**: 2026-02-17
**Supersedes**: 15-IMPLEMENTATION-PLAN.md (v1.0)
**Changes**: Incorporates automation strategy, resolves artifact contradictions, adds Phase 0, reduces timeline

---

## Key Changes from v1.0

| Aspect | v1.0 (Original) | v2.0 (Updated) |
|--------|-----------------|-----------------|
| Total duration | 8 hours | 6.5 hours |
| Human time | ~8 hours | ~90 minutes |
| Automation | Implied | 82% explicit |
| Phase 0 (Resolve) | Missing | Added (30 min) |
| Architecture | Ambiguous (fork vs rewrite) | Explicit React 19 rewrite |
| Scoring model | Contradictory | Unidirectional confirmed |
| Terminology | Inconsistent | Standardized |
| HiTL checkpoints | None defined | 5 checkpoints |
| Preview deployments | None | After each phase |

---

## Phase 0: Resolve Contradictions (30 min) — HUMAN REQUIRED

**This phase is NEW. It blocks everything else.**

### 0.1 Decisions Required

| Decision | Options | Recommended | Rationale |
|----------|---------|-------------|-----------|
| Architecture | A) Keep vanilla JS, B) React 19 rewrite, C) Preact | **B) React 19 rewrite** | Component architecture needed for 13 components; React ecosystem (Radix, Hook Form) is well-specified |
| Scoring model | A) Unidirectional, B) Bidirectional | **A) Unidirectional** | Halves data model complexity; bidirectional is v1.1 |
| Trust terminology | Various | **High / Moderate / Low / None** | Matches coaching language; avoid technical "unscored" |
| Canvas type | A) Grouped cards, B) Force-directed graph | **A) Grouped cards** | Achievable in 1 day; graph visualization is v1.1 |

### 0.2 Artifact Updates After Decisions

Once decisions are confirmed, update these files (10 min, automatable):

| File | Change |
|------|--------|
| 06-UNIFIED-PRD.md | Add note: "v1.0 is React 19 rewrite, not Claude edition fork" |
| 07-USER-STORIES.md | Standardize to "High / Moderate / Low / None" |
| 14-API-CONTRACT.md | Change TrustLevel enum to `HIGH \| MODERATE \| LOW \| NONE` |
| 03-VALUE-PROPOSITION-CANVAS.md | Note: "Bidirectional scoring deferred to v1.1" |
| 04-PRIMARY-USER-PROFILE.md | Note: "Bidirectional scoring deferred to v1.1" |

### 0.3 Exit Criteria
- [ ] All 4 decisions confirmed by product owner
- [ ] Artifact updates applied
- [ ] All agents briefed on decisions

---

## Phase 1: Scaffold (30 min) — FULLY AUTOMATED

### 1.1 Parallel Agent Tasks

**Codex (15 min):**
- [ ] `npx create-next-app@latest true-valence-mapper --typescript --tailwind --app --src-dir`
- [ ] Configure Tailwind with design tokens from 09-DESIGN-SYSTEM.md
- [ ] Install dependencies: `@radix-ui/react-dialog @radix-ui/react-select @radix-ui/react-tooltip`
- [ ] Install: `react-hook-form zod @hookform/resolvers`
- [ ] Install: `jspdf html2canvas @phosphor-icons/react`
- [ ] Configure ESLint strict + Prettier
- [ ] Verify `npm run dev` starts without errors

**Claude (15 min):**
- [ ] Generate `src/types.ts` from API Contract (14) — all TypeScript interfaces
- [ ] Generate `src/constants.ts` — trust levels, colors, labels, validation rules
- [ ] Generate `src/lib/validation.ts` — all validation functions
- [ ] Generate `src/context/SessionContext.tsx` — provider, hook, actions
- [ ] Scaffold 13 component files in `src/components/` with props interfaces

**Gemini (15 min):**
- [ ] Generate test file stubs for all components (`*.test.tsx`)
- [ ] Generate `src/lib/test-utils.tsx` — custom render with SessionProvider
- [ ] Configure Jest + React Testing Library
- [ ] Generate Playwright config for E2E
- [ ] Verify test runner starts without errors

### 1.2 Exit Criteria
- [ ] `npm run dev` — app starts, shows blank page
- [ ] `npm run lint` — zero errors
- [ ] `npm run test` — test runner starts (tests may be pending)
- [ ] 13 component files exist with correct props interfaces
- [ ] SessionContext provider exists with type-safe hook

### 1.3 Preview Deployment
- [ ] Deploy to Vercel preview URL
- [ ] Verify blank app loads on preview URL

---

## Phase 2: Core Components (3 hours) — PARTIALLY AUTOMATED

### 2.1 Hour 1: Core Components (Parallel)

**Claude — RelationshipList (60 min):**
- [ ] `RelationshipForm` — name input, add button, validation (no duplicates, 3-50 char)
- [ ] `RelationshipCard` — display name, remove button, edit capability
- [ ] `RelationshipList` — list container, count badge (X/25), min 12 validation
- [ ] Wire to SessionContext (addRelationship, removeRelationship, updateRelationship)
- [ ] "Next" button enabled when 12+ relationships exist
- [ ] Keyboard navigation: Tab through cards, Enter to edit, Delete to remove

**Codex — TrustScorer (60 min):**
- [ ] `TrustLevelSelector` — 4 color-coded buttons (High green, Moderate blue, Low amber, None red)
- [ ] `TrustScorer` — shows relationship name, selector, progress (X/Y scored)
- [ ] Visual feedback on selection (border, checkmark, scale animation)
- [ ] Trust definitions info button → opens modal
- [ ] "View Canvas" enabled when all relationships scored
- [ ] Back button returns to Naming screen

**Gemini — VisualCanvas + Context (60 min):**
- [ ] Flesh out `SessionContext` with full state management and actions
- [ ] `VisualCanvas` — groups relationships by trust level in 4 sections
- [ ] Color-coded section headers with count badges
- [ ] Responsive grid layout (1 col mobile, 2 col tablet, 4 col desktop)
- [ ] Empty state for trust levels with no relationships
- [ ] Relationship cards show name + trust level color indicator

### 2.2 HiTL-1: Component Review (30 min) — HUMAN

- [ ] Review RelationshipList: Does the form feel natural? Is validation clear?
- [ ] Review TrustScorer: Are trust level colors distinguishable? Is progress clear?
- [ ] Review VisualCanvas: Does grouping make sense? Is it visually appealing?
- [ ] Note feedback for integration phase

### 2.3 Hour 2-3: Screen Integration (90 min)

**Claude — Landing + Naming Screens (45 min):**
- [ ] `LandingScreen` — hero text, "Begin Session" CTA, brief description
- [ ] `NamingScreen` — integrates RelationshipList, header with step indicator
- [ ] Navigation: Landing → Naming (via CTA button)
- [ ] Step indicator component (Step 1 of 3)
- [ ] Responsive layout for all screens

**Codex — Scoring Screen (45 min):**
- [ ] `ScoringScreen` — integrates TrustScorer, step indicator, navigation
- [ ] Navigation: Naming → Scoring (via Next button), Scoring → Naming (via Back)
- [ ] Sequential scoring flow (one relationship at a time, or all visible)
- [ ] Progress persistence within session (scored relationships stay scored)

**Gemini — Canvas + Export + Modal (45 min):**
- [ ] `CanvasScreen` — integrates VisualCanvas, export button, step indicator
- [ ] `ExportSuccessScreen` — confirmation message, "Start New Session" button
- [ ] `TrustDefinitionsModal` — definitions for all 4 trust levels, accessible modal
- [ ] Navigation: Scoring → Canvas (via View Canvas), Canvas → Export (via Export PDF)
- [ ] "Start New Session" resets all state

### 2.4 HiTL-2: Integration Review (15 min) — HUMAN

- [ ] Complete flow walkthrough: Landing → Naming → Scoring → Canvas → Export
- [ ] Verify navigation works (Next/Back on all screens)
- [ ] Verify state persists across screens (names carry to scoring, scores carry to canvas)
- [ ] Note any UX friction points

### 2.5 Exit Criteria
- [ ] All 5 screens render correctly
- [ ] Full session flow works end-to-end
- [ ] State management works across all screens
- [ ] Navigation works (forward and back)
- [ ] Preview deployment updated

---

## Phase 3: Polish (1 hour) — PARTIALLY AUTOMATED

### 3.1 Parallel Tasks

**Claude — PDF Export (30 min):**
- [ ] Implement `usePDFExport` hook using jsPDF + html2canvas
- [ ] Capture VisualCanvas as image
- [ ] Add header: "Trust Map — [Date]"
- [ ] Add footer: "Generated by True Valence Mapper"
- [ ] Loading state during export (spinner or progress bar)
- [ ] Success confirmation after export
- [ ] Test with 12, 20, and 25 relationships
- [ ] Fallback: browser print dialog if html2canvas fails

**Codex — Visual Polish (30 min):**
- [ ] Verify all colors match Design System (09)
- [ ] Verify spacing uses 8px base grid
- [ ] Verify typography uses Inter font stack
- [ ] Add hover states on all interactive elements
- [ ] Add focus-visible outlines (2px solid, 2px offset)
- [ ] Add page transitions (fade or slide, 200ms)
- [ ] Add micro-interactions (button press, card add/remove)

**Gemini — Accessibility Pass (30 min):**
- [ ] Run axe-core on all 5 screens
- [ ] Fix any critical or serious violations
- [ ] Verify keyboard-only navigation (full session without mouse)
- [ ] Verify focus trap in TrustDefinitionsModal
- [ ] Verify color contrast on all trust level indicators (>4.5:1)
- [ ] Add skip-to-content link on landing page
- [ ] Verify all images have alt text (if any)

### 3.2 HiTL-3: Polish Review (10 min) — HUMAN

- [ ] Visual design approval (does it look polished and professional?)
- [ ] PDF export test (download and review output)
- [ ] Quick keyboard navigation test (Tab through one full screen)

### 3.3 Exit Criteria
- [ ] PDF exports successfully with all relationship counts
- [ ] Visual design consistent with Design System (09)
- [ ] axe-core: zero critical errors
- [ ] Keyboard navigation works for full session
- [ ] Preview deployment updated

---

## Phase 4: Validate & Deploy (1 hour) — MOSTLY AUTOMATED

### 4.1 Automated Validation (45 min)

**All Agents (parallel):**
- [ ] Run full unit test suite — all tests pass
- [ ] Run integration tests — session flow works
- [ ] Run Playwright E2E on Chrome — full session works
- [ ] Run Lighthouse audit — Performance >90, Accessibility >90, Best Practices >90
- [ ] Run bundle analyzer — total bundle <300KB gzipped
- [ ] Run `npm run build` — zero errors
- [ ] Verify build output is valid static export

**Cross-browser Smoke Tests (automated where possible):**
- [ ] Chrome Desktop — full session
- [ ] Firefox Desktop — smoke test (landing, one relationship, one score)
- [ ] Edge Desktop — smoke test
- [ ] Safari — if available in test environment

### 4.2 HiTL-4: Deploy Decision (5 min) — HUMAN

- [ ] Review test results summary
- [ ] Review Lighthouse scores
- [ ] Approve production deployment

### 4.3 Production Deployment (10 min — automated after approval)

- [ ] `vercel --prod` or merge to main (triggers auto-deploy)
- [ ] Verify production URL loads
- [ ] Run one manual session on production (Landing → Export)
- [ ] Verify PDF download works on production

### 4.4 Exit Criteria
- [ ] All automated tests pass
- [ ] Lighthouse scores meet targets
- [ ] Production URL accessible
- [ ] Manual session completes successfully on production
- [ ] PDF downloads correctly from production

---

## Timeline Summary

| Time | Phase | Duration | Automation | Human Time |
|------|-------|----------|------------|------------|
| 09:00 - 09:30 | Phase 0: Resolve | 30 min | 0% | 30 min |
| 09:30 - 10:00 | Phase 1: Scaffold | 30 min | 93% | 2 min |
| 10:00 - 11:00 | Phase 2a: Core Components | 60 min | 100% | 0 min |
| 11:00 - 11:30 | HiTL-1: Component Review | 30 min | 0% | 30 min |
| 11:30 - 13:00 | Phase 2b: Screen Integration | 90 min | 100% | 0 min |
| 13:00 - 13:15 | HiTL-2: Integration Review | 15 min | 0% | 15 min |
| 13:15 - 14:15 | Phase 3: Polish | 60 min | 83% | 10 min |
| 14:15 - 14:25 | HiTL-3: Polish Review | 10 min | 0% | 10 min |
| 14:25 - 15:10 | Phase 4a: Validation | 45 min | 92% | 0 min |
| 15:10 - 15:15 | HiTL-4: Deploy Decision | 5 min | 0% | 5 min |
| 15:15 - 15:30 | Phase 4b: Deploy | 15 min | 80% | 3 min |
| **Total** | | **6.5 hours** | **82%** | **~105 min** |

**Finish time**: ~15:30 (vs original 17:00) — **1.5 hours saved**

---

## Agent Responsibilities (Updated)

### Claude (Orchestrator + Core Logic)
| Phase | Tasks | Time |
|-------|-------|------|
| 0 | Coordinate decisions, update artifacts | 10 min |
| 1 | Types, constants, validation, context, stubs | 15 min |
| 2 | RelationshipList, LandingScreen, NamingScreen, routing | 105 min |
| 3 | PDF export | 30 min |
| 4 | Build, deploy, production verification | 15 min |
| **Total** | | **~175 min** |

### Codex (Design System + UI Polish)
| Phase | Tasks | Time |
|-------|-------|------|
| 1 | Project scaffold, Tailwind config, dependencies | 15 min |
| 2 | TrustScorer, ScoringScreen | 105 min |
| 3 | Visual polish, animations, hover/focus states | 30 min |
| 4 | Cross-browser visual verification | 10 min |
| **Total** | | **~160 min** |

### Gemini (Testing + Accessibility + QA)
| Phase | Tasks | Time |
|-------|-------|------|
| 1 | Test stubs, Playwright config | 15 min |
| 2 | VisualCanvas, CanvasScreen, ExportSuccess, Modal, Context | 105 min |
| 3 | Accessibility audit and fixes | 30 min |
| 4 | Unit tests, E2E tests, Lighthouse, bundle analysis | 35 min |
| **Total** | | **~185 min** |

---

## Risk Register (Updated)

| Risk | Prob | Impact | Mitigation | Owner |
|------|------|--------|------------|-------|
| React 19 + Next.js 15 scaffold has breaking changes | Medium | High | Pin exact versions from Tech Stack (12); test immediately | Codex |
| 3-agent parallel work creates merge conflicts | Medium | Medium | Each agent owns distinct files; no shared source files during parallel phases | Claude (orchestrator) |
| html2canvas fails on complex canvas layouts | Medium | High | Test PDF export in Phase 2 (not Phase 3); browser print fallback | Claude |
| Radix UI components don't match design system tokens | Low | Medium | Codex verifies Radix ↔ Tailwind integration in Phase 1 | Codex |
| Real coaches find 4-level scoring too simplistic | High | Low (v1.0) | Document as known limitation; v1.1 decision point | Product Owner |
| WCAG 2.1 AA full compliance not achievable in 1 day | Medium | Medium | Prioritize: (1) keyboard nav, (2) color contrast, (3) ARIA, (4) screen reader | Gemini |

---

## Post-Deployment Checklist

- [ ] Monitor Vercel logs for errors (24 hours)
- [ ] Schedule 3 coach pilot sessions within 1 week
- [ ] Collect feedback on: scoring simplicity, canvas readability, PDF quality
- [ ] Create v1.1 backlog based on feedback:
  - Bidirectional scoring (if coaches request)
  - Force-directed graph visualization (if card layout insufficient)
  - Session persistence (if coaches want to resume)
  - Dark mode (if requested)

---

**Plan Status**: Complete
**Dependencies**: Phase 0 decisions from product owner
**Estimated Completion**: 15:30 (6.5 hours from start)
**Automation Coverage**: 82%
