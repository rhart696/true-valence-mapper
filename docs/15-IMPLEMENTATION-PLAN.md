# Implementation Plan

> **SUPERSEDED by 20-UPDATED-IMPLEMENTATION-PLAN.md (v2.0)**
> This plan (v1.0) contained unresolved contradictions. See the updated plan for the corrected version with 82% automation, Phase 0 contradiction resolution, and 6.5-hour revised timeline.

**Version**: 1.0 (SUPERSEDED)
**Date**: 2026-02-17
**Based On**: All Artifacts (Phases 1-5)
**Product**: True Valence Mapper v1.0

---

## Implementation Plan Overview

**Timeline**: 1 day (8 hours) - 2026-02-17
**Approach**: Parallel development with 3 AI agents (Claude, Codex, Gemini)
**Foundation**: Claude edition (2,346-line production codebase)
**Strategy**: Remove unused features, add v1.0 requirements, polish and deploy

---

## 1. Timeline Overview

### 1.1 Phases

| Phase | Duration | Primary Agent | Output |
|-------|----------|---------------|--------|
| Phase 1: Setup | 1 hour | Claude + Codex + Gemini | Clean codebase, design system, project structure |
| Phase 2: Core Components | 3 hours | Claude + Codex + Gemini | 3 core components functional |
| Phase 3: Integration | 2 hours | Claude + Codex + Gemini | Integrated user flow working |
| Phase 4: Polish | 1 hour | Claude + Codex | Polished, animated, accessible |
| Phase 5: QA & Deploy | 1 hour | All agents | Deployed, tested, verified |
| **Total** | **8 hours** | | **v1.0 MVP** |

### 1.2 Daily Schedule (2026-02-17)

| Time | Phase | Activity | Agents |
|------|-------|----------|--------|
| 09:00 - 10:00 | Phase 1 | Setup | Claude + Codex + Gemini |
| 10:00 - 13:00 | Phase 2 | Core Components (parallel) | Claude + Codex + Gemini |
| 13:00 - 15:00 | Phase 3 | Integration | Claude + Codex + Gemini |
| 15:00 - 16:00 | Phase 4 | Polish | Claude + Codex |
| 16:00 - 17:00 | Phase 5 | QA & Deploy | All agents |

---

## 2. Phase 1: Setup (1 Hour)

### 2.1 Objectives
- Fork Claude edition to new v1.0 branch
- Remove unused features (~500 lines)
- Set up design system (Tailwind config, colors, typography)
- Set up project structure for new components

### 2.2 Agent Responsibilities

**Claude (30 minutes)**:
- [ ] Fork Claude edition to `v1.0` branch
- [ ] Remove persistence features (localStorage, session history)
- [ ] Remove share codes feature
- [ ] Remove cloud storage integration
- [ ] Remove toast notifications
- [ ] Remove version history
- [ ] Verify app still runs

**Codex (20 minutes)**:
- [ ] Set up Tailwind config with design system tokens
- [ ] Configure color palette (trust blue, green, orange, red, grays)
- [ ] Configure typography (Inter font family)
- [ ] Configure spacing scale (8px base)
- [ ] Configure border radius tokens
- [ ] Verify Tailwind builds without errors

**Gemini (10 minutes)**:
- [ ] Create component directory structure
- [ ] Set up TypeScript types file
- [ ] Set up constants file (trust definitions, etc.)
- [ ] Verify project structure matches architecture

### 2.3 Deliverables
- Clean codebase (no unused features)
- Design system configured in Tailwind
- Project structure organized
- App runs successfully (`npm run dev`)

### 2.4 Success Criteria
- [ ] App runs without errors
- [ ] No unused code (linter clean)
- [ ] Design system tokens defined and working
- [ ] Project structure organized

---

## 3. Phase 2: Core Components (3 Hours, Parallel)

### 3.1 Objectives
- Build 3 core components (RelationshipList, TrustScorer, VisualCanvas)
- Implement session state management
- Implement form validation

### 3.2 Agent Responsibilities

**Claude (RelationshipList Component - 1 hour)**:
- [ ] Create `RelationshipList` component
- [ ] Create `RelationshipCard` component
- [ ] Create `RelationshipForm` component
- [ ] Implement add relationship logic
- [ ] Implement remove relationship logic
- [ ] Implement edit relationship logic
- [ ] Validate minimum 12 relationships
- [ ] Validate maximum 25 relationships
- [ ] Validate no duplicate names
- [ ] Count badge (X/25 relationships)
- [ ] "Next" button state (enabled/disabled)
- [ ] Unit tests for validation logic
- [ ] Verify component works in isolation

**Codex (TrustScorer Component - 1 hour)**:
- [ ] Create `TrustScorer` component
- [ ] Create `TrustLevelSelector` component
- [ ] Implement 4-level scoring (High, Moderate, Low, None)
- [ ] Color-code trust levels
- [ ] Trust definitions pop-up
- [ ] Progress indicator (X/Y scored)
- [ ] "View Canvas" button state
- [ ] Validate all relationships scored
- [ ] Visual feedback on selection
- [ ] Unit tests for scoring logic
- [ ] Verify component works in isolation

**Gemini (Session Context + VisualCanvas - 1 hour)**:
- [ ] Create `SessionContext` provider
- [ ] Implement `useSession` hook
- [ ] State management (relationships, trustLevels, currentStep)
- [ ] Actions (add, remove, setTrustLevel, setCurrentStep)
- [ ] Create `VisualCanvas` component
- [ ] Implement trust level grouping
- [ ] Implement color coding
- [ ] Implement responsive layout
- [ ] Unit tests for context logic
- [ ] Verify components work together

### 3.3 Deliverables
- `RelationshipList` component with validation
- `TrustScorer` component with 4-level scoring
- `VisualCanvas` component with grouping
- `SessionContext` provider with state management
- Unit tests for validation and state logic

### 3.4 Success Criteria
- [ ] All 3 components functional
- [ ] Validation logic works correctly
- [ ] State management works correctly
- [ ] Components work in isolation (Storybook or manual test)
- [ ] Unit tests pass (>50% coverage)

---

## 4. Phase 3: Integration (2 Hours)

### 4.1 Objectives
- Integrate core components into full user flow
- Implement screen routing
- Connect components to SessionContext
- Fix integration bugs

### 4.2 Agent Responsibilities

**Claude (50 minutes)**:
- [ ] Create `LandingScreen` component
- [ ] Create `NamingScreen` component
- [ ] Integrate `RelationshipList` into `NamingScreen`
- [ ] Implement navigation (Next button)
- [ ] Test landing → naming flow
- [ ] Fix bugs found during testing

**Codex (50 minutes)**:
- [ ] Create `ScoringScreen` component
- [ ] Integrate `TrustScorer` into `ScoringScreen`
- [ ] Implement navigation (Next/Back buttons)
- [ ] Test naming → scoring flow
- [ ] Fix bugs found during testing

**Gemini (20 minutes)**:
- [ ] Create `CanvasScreen` component
- [ ] Integrate `VisualCanvas` into `CanvasScreen`
- [ ] Create `ExportSuccessScreen` component
- [ ] Create `TrustDefinitionsModal` component
- [ ] Implement modal state management

**All Agents (15 minutes)**:
- [ ] End-to-end test (landing → naming → scoring → canvas → export)
- [ ] Fix critical bugs blocking flow
- [ ] Verify all screens render correctly

### 4.3 Deliverables
- All 5 screens functional
- Full user flow working (landing to export)
- Navigation working (Next/Back buttons)
- TrustDefinitionsModal working

### 4.4 Success Criteria
- [ ] Complete session flow works (landing → naming → scoring → canvas → export)
- [ ] Navigation works (Next/Back buttons)
- [ ] No critical bugs blocking flow
- [ ] All screens render correctly

---

## 5. Phase 4: Polish (1 Hour)

### 5.1 Objectives
- Polish visual design (colors, spacing, typography)
- Add animations (micro-interactions, transitions)
- Implement PDF export
- Accessibility audit and fixes

### 5.2 Agent Responsibilities

**Claude (30 minutes)**:
- [ ] Implement PDF export (html2canvas + jsPDF)
- [ ] Add loading state during export
- [ ] Add success message after export
- [ ] Test PDF export with different canvas sizes
- [ ] Fix PDF export bugs

**Codex (30 minutes)**:
- [ ] Polish colors (ensure design system compliance)
- [ ] Polish spacing (consistent 8px base)
- [ ] Polish typography (Inter font, proper sizes)
- [ ] Add hover states (buttons, cards)
- [ ] Add transitions (page transitions, modal transitions)
- [ ] Add focus states (accessibility)

### 5.3 Deliverables
- PDF export working
- Polished visual design
- Animations and transitions
- Focus states for accessibility

### 5.4 Success Criteria
- [ ] PDF exports successfully on first try
- [ ] Visual design matches design system
- [ ] Animations smooth (60 FPS)
- [ ] Focus indicators visible on all interactive elements

---

## 6. Phase 5: QA & Deploy (1 Hour)

### 6.1 Objectives
- Cross-browser testing
- Mobile testing
- Accessibility audit
- Deploy to production

### 6.2 Agent Responsibilities

**Claude (20 minutes)**:
- [ ] Chrome Desktop test (full session)
- [ ] Edge Desktop test (full session)
- [ ] Build production bundle (`npm run build`)
- [ ] Deploy to Vercel
- [ ] Verify deployment works

**Codex (10 minutes)**:
- [ ] Safari Desktop test (full session)
- [ ] Firefox Desktop test (smoke test)
- [ ] Visual polish verification (colors, spacing, typography)

**Gemini (30 minutes)**:
- [ ] iOS Safari mobile test (full session)
- [ ] Chrome Android mobile test (full session)
- [ ] Accessibility audit (axe DevTools scan)
- [ ] Keyboard navigation test (full session)
- [ ] Screen reader test (VoiceOver)
- [ ] Color contrast test (all text > 4.5:1)
- [ ] Document any accessibility issues found

**All Agents (0 minutes)**:
- [ ] Cross-validation: Test each other's work
- [ ] Final bug triage and fixes
- [ ] Sign-off for production deployment

### 6.3 Deliverables
- Cross-browser tested (Chrome, Edge, Safari, Firefox)
- Mobile tested (iOS Safari, Chrome Android)
- Accessibility audit passed (axe DevTools zero critical errors)
- Deployed to production

### 6.4 Success Criteria
- [ ] Full session works on Chrome, Edge, Safari, Firefox
- [ ] Full session works on iOS Safari, Chrome Android
- [ ] axe DevTools scan: Zero critical errors
- [ ] Lighthouse score: Performance > 90, Accessibility > 90, Best Practices > 90
- [ ] Production deployment successful
- [ ] Manual test: Complete session works end-to-end

---

## 7. Risk Mitigation

### 7.1 Risks and Mitigations

| Risk | Probability | Impact | Mitigation |
|------|-------------|--------|------------|
| Phase 2 takes longer than 3 hours | Medium | High | Reduce scope (remove animations, defer polish) |
| Integration bugs found late | Medium | High | Continuous integration testing after each phase |
| PDF export fails | Low | High | Test early in Phase 4, have fallback (print) |
| Browser incompatibility | Low | Medium | Test all browsers in Phase 5 |
| Accessibility issues found late | Low | High | Accessibility review during Phase 2-4, not just Phase 5 |

### 7.2 Contingency Plans

**Phase 2 Takes Longer**:
- Cut: Animations (defer to v1.1)
- Cut: Hover effects (defer to v1.1)
- Cut: Modal transitions (defer to v1.1)
- Keep: Core functionality (naming, scoring, canvas, export)

**PDF Export Fails**:
- Fallback: Print to PDF (browser print dialog)
- Alternative: Use React-PDF (if html2canvas fails)

**Browser Incompatibility**:
- Fallback: Polyfills for older browsers
- Alternative: Browser-specific CSS overrides

---

## 8. Communication Protocol

### 8.1 Standup Schedule

**Hourly Standups (15 minutes each)**:
- Time: Start of each hour (10:00, 11:00, 12:00, 13:00, 14:00, 15:00, 16:00)
- Agenda:
  1. What did you complete last hour?
  2. What will you do this hour?
  3. Any blockers or issues?

**Final Sync (30 minutes)**:
- Time: 17:00 (end of Phase 5)
- Agenda:
  1. Demo of working product
  2. Final bug triage
  3. Production deployment sign-off
  4. Lessons learned

### 8.2 Issue Escalation

**Immediate Escalation**:
- Critical bugs blocking core functionality
- Security vulnerabilities
- Accessibility violations

**Email/Notification**:
- All agents CC'd on critical issues
- Tag issues by priority (P0, P1, P2)
- Assign to appropriate agent

### 8.3 Code Review Process

**Before Integration**:
- Each agent reviews their own code (self-review)
- Cross-review: Claude reviews Codex, Codex reviews Gemini, Gemini reviews Claude
- Use GitHub PRs or git diff review

**Review Criteria**:
- Code quality (ESLint, TypeScript)
- Functionality (matches requirements)
- Accessibility (WCAG compliance)
- Performance (no obvious bottlenecks)

---

## 9. Deliverables Checklist

### 9.1 Phase 1 Deliverables
- [ ] Clean codebase (no unused features)
- [ ] Design system configured (Tailwind)
- [ ] Project structure organized
- [ ] App runs successfully

### 9.2 Phase 2 Deliverables
- [ ] `RelationshipList` component
- [ ] `TrustScorer` component
- [ ] `VisualCanvas` component
- [ ] `SessionContext` provider
- [ ] Unit tests (>50% coverage)

### 9.3 Phase 3 Deliverables
- [ ] `LandingScreen` component
- [ ] `NamingScreen` component
- [ ] `ScoringScreen` component
- [ ] `CanvasScreen` component
- [ ] `ExportSuccessScreen` component
- [ ] `TrustDefinitionsModal` component
- [ ] Full user flow working

### 9.4 Phase 4 Deliverables
- [ ] PDF export working
- [ ] Polished visual design
- [ ] Animations and transitions
- [ ] Focus states (accessibility)

### 9.5 Phase 5 Deliverables
- [ ] Cross-browser tested
- [ ] Mobile tested
- [ ] Accessibility audit passed
- [ ] Deployed to production
- [ ] Manual test complete

---

## 10. Success Metrics

### 10.1 Technical Metrics

| Metric | Target | Measurement |
|--------|--------|-------------|
| Build time | < 2 minutes | `npm run build` |
| Bundle size | < 300KB | Bundle analyzer |
| Lighthouse Performance | > 90 | Lighthouse |
| Lighthouse Accessibility | > 90 | Lighthouse |
| Lighthouse Best Practices | > 90 | Lighthouse |
| Test coverage | > 50% | Jest coverage |
| Zero critical bugs | 0 | Bug tracking |

### 10.2 User Experience Metrics

| Metric | Target | Measurement |
|--------|--------|-------------|
| Page load time | < 2 seconds | Lighthouse |
| Interaction latency | < 100ms | Performance API |
| PDF export time | < 5 seconds | Timer |
| Session completion rate | 100% (manual test) | Manual testing |
| Zero technical issues | 0 | Manual testing |

### 10.3 Deployment Metrics

| Metric | Target | Measurement |
|--------|--------|-------------|
| Deployment success | 100% | Vercel logs |
| Downtime | 0 minutes | Uptime monitoring |
| Rollback required | No | Deployment monitoring |

---

## 11. Post-Implementation Tasks

### 11.1 Immediate Post-Launch (After 17:00)

- [ ] Monitor for bugs/errors (Vercel logs)
- [ ] Collect feedback from first users
- [ ] Document lessons learned
- [ ] Update documentation if needed

### 11.2 Week 1 Follow-Up

- [ ] Schedule 5 coaching sessions with coaches
- [ ] Collect qualitative feedback
- [ ] Track usage metrics (if any)
- [ ] Prioritize v1.1 features based on feedback

### 11.3 v1.1 Planning

Based on feedback, consider:
- User accounts (if multiple coaches request)
- Session persistence (if coaches request)
- Dark mode (if users request)
- Mobile app (if heavy mobile usage)
- Additional modalities (values, strengths, etc.)

---

## 12. Agent Roles Summary

### 12.1 Claude
**Primary Responsibilities**:
- Setup (fork, cleanup)
- `RelationshipList` component
- `LandingScreen`, `NamingScreen`
- Integration coordination
- PDF export
- Deployment (build + deploy)

**Strengths**: Orchestration, state management, coordination

### 12.2 Codex
**Primary Responsibilities**:
- Design system (Tailwind)
- `TrustScorer` component
- `ScoringScreen`
- Polish (colors, spacing, typography)
- Animations and transitions
- Visual polish verification

**Strengths**: Design systems, UI components, visual polish

### 12.3 Gemini
**Primary Responsibilities**:
- Project structure
- `SessionContext` provider
- `VisualCanvas` component
- `CanvasScreen`, `ExportSuccessScreen`, `TrustDefinitionsModal`
- QA (mobile, accessibility, keyboard)
- Cross-browser testing

**Strengths**: Accessibility, testing, quality assurance

---

## 13. Final Checklist

### Before 17:00 (End of Day)

**Code Quality**:
- [ ] ESLint: Zero errors
- [ ] TypeScript: Zero errors
- [ ] Tests: All passing
- [ ] Bundle size: < 300KB

**Functionality**:
- [ ] Complete session works (landing → naming → scoring → canvas → export)
- [ ] PDF exports successfully
- [ ] All validation works
- [ ] Navigation works

**Accessibility**:
- [ ] axe DevTools: Zero critical errors
- [ ] Keyboard navigation: Full session works
- [ ] Focus indicators: All interactive elements
- [ ] Color contrast: All text > 4.5:1

**Testing**:
- [ ] Chrome Desktop: Full session works
- [ ] Edge Desktop: Full session works
- [ ] Safari Desktop: Full session works
- [ ] Firefox Desktop: Smoke test
- [ ] iOS Safari: Full session works
- [ ] Chrome Android: Full session works

**Deployment**:
- [ ] Build successful
- [ ] Deployed to Vercel
- [ ] Production URL works
- [ ] SSL certificate valid

**Documentation**:
- [ ] README updated
- [ ] Setup instructions clear
- [ ] Known issues documented (if any)

---

**Implementation Plan Status**: Complete
**Dependencies**: All Artifacts (Phases 1-5)
**Next Steps**: Begin Phase 1 (Setup) immediately
