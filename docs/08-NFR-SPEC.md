# Non-Functional Requirements (NFR) Spec

**Version**: 1.0
**Date**: 2026-02-17
**Based On**: PRD + User Interview
**Product**: True Valence Mapper v1.0

---

## NFR Overview

**Purpose**: Define cross-cutting quality attributes that must be met for v1.0 MVP to be production-ready.

**Scope**: Performance, accessibility, browser support, security, reliability, usability.

---

## 1. Performance Requirements

### 1.1 Page Load Performance

| Metric | Target | Measurement Tool |
|--------|--------|------------------|
| Initial page load (first byte) | < 1 second | Lighthouse / WebPageTest |
| Time to Interactive (TTI) | < 2 seconds | Lighthouse |
| First Contentful Paint (FCP) | < 1 second | Lighthouse |
| Largest Contentful Paint (LCP) | < 2.5 seconds | Lighthouse |

**Rationale**: Coach opens tool in session, needs immediate start without waiting. Slow load damages credibility.

### 1.2 Interaction Performance

| Metric | Target | Measurement Method |
|--------|--------|---------------------|
| Scoring action response | < 100ms | Performance API measurement |
| Relationship add/remove | < 50ms | Performance API measurement |
| Modal open/close | < 100ms | Performance API measurement |
| Canvas render (initial) | < 500ms | Performance API measurement |
| Canvas update (trust level change) | < 150ms | Performance API measurement |

**Rationale**: Interactive elements must feel instant. Any lag disrupts coaching conversation flow.

### 1.3 Export Performance

| Metric | Target | Measurement Method |
|--------|--------|---------------------|
| PDF generation time | < 5 seconds | Timer from click to download |
| PDF file size | < 1MB | File system check |
| PDF rendering quality | 300 DPI equivalent | Visual inspection |

**Rationale**: Long export times create awkward pauses in session. Large PDFs are hard to email/share.

### 1.4 Animation Performance

| Metric | Target | Measurement Method |
|--------|--------|---------------------|
| Frame rate (animations) | 60 FPS | Chrome DevTools Performance tab |
| Transition smoothness | No jank | Visual inspection |
| Micro-interaction latency | < 100ms | Performance API measurement |

**Rationale**: Smooth animations feel polished and professional. Jank feels buggy.

---

## 2. Accessibility Requirements

### 2.1 WCAG 2.1 Level AA Compliance

All content must meet WCAG 2.1 Level AA standards.

#### Perceivable

| Requirement | Target | Test Method |
|-------------|--------|-------------|
| Color contrast (text) | Minimum 4.5:1 | Wave / axe DevTools |
| Color contrast (large text) | Minimum 3:1 | Wave / axe DevTools |
| Color contrast (UI components) | Minimum 3:1 | Wave / axe DevTools |
| Text resize | Resizable to 200% without loss of content | Browser zoom test |
| Images | Alt text provided (decorative marked) | Screen reader test |

#### Operable

| Requirement | Target | Test Method |
|-------------|--------|-------------|
| Keyboard navigation | All functionality accessible via keyboard | Tab/Enter/Esc test |
| No keyboard trap | Can navigate to/from all elements | Tab-through test |
| Focus indicators | Visible focus indicator on all interactive elements | Visual inspection |
| Skip navigation | Skip link available for repeated content | Keyboard test |
| Timing | No time-limited actions (except auto-dismiss modals) | Manual review |

#### Understandable

| Requirement | Target | Test Method |
|-------------|--------|-------------|
| Page language | Language attribute (lang="en") | HTML validation |
| Error messages | Clear, associated with inputs | Form validation test |
| Labels | All form inputs have labels | axe DevTools scan |
| Consistent navigation | Same elements in same order | Manual review |

#### Robust

| Requirement | Target | Test Method |
|-------------|--------|-------------|
| HTML validity | Valid HTML5 | HTML Validator |
| ARIA attributes | Correct ARIA roles where needed | axe DevTools scan |
| Screen reader compatibility | NVDA, VoiceOver tested | Screen reader test |

### 2.2 Component-Level Accessibility

| Component | Accessibility Requirements |
|-----------|---------------------------|
| Buttons | Accessible name, keyboard focus, hover state, aria-label if icon-only |
| Inputs | Labels, error messages, keyboard navigation, aria-invalid when error |
| Modals | Focus trap, ESC key close, close button, aria-modal="true" |
| Color-based info | Non-color indicator (icon + text) |
| Canvas | Keyboard alternative description, screen reader summary |

### 2.3 Accessibility Testing Checklist

- [ ] Keyboard-only navigation test (full session flow)
- [ ] Screen reader test (NVDA on Windows, VoiceOver on macOS)
- [ ] Color blindness simulator test (Chrome extension)
- [ ] Browser zoom test (200% zoom)
- [ ] axe DevTools scan (zero critical errors)
- [ ] Manual WCAG checklist review

---

## 3. Browser Support

### 3.1 Supported Browsers

| Browser | Minimum Version | Support Level |
|---------|-----------------|---------------|
| Chrome | Latest 2 versions | Full support |
| Edge | Latest 2 versions | Full support |
| Safari | Latest 2 versions | Full support |
| Firefox | Latest 2 versions | Full support |

### 3.2 Mobile Browser Support

| Browser | Minimum Version | Support Level |
|---------|-----------------|---------------|
| Chrome Android | Latest 2 versions | Full support |
| iOS Safari | iOS 15+ | Full support |

**Rationale**: Modern browsers only to reduce testing scope and leverage latest APIs.

### 3.3 Browser Testing Matrix

| Device/Browser | Test Level | Priority |
|----------------|------------|----------|
| Chrome Desktop | Full testing | P0 |
| Edge Desktop | Full testing | P0 |
| Safari Desktop | Full testing | P0 |
| Firefox Desktop | Smoke testing | P1 |
| Chrome Android | Full testing | P0 |
| iOS Safari | Full testing | P0 |

**Smoke testing**: Critical path only (landing → naming → scoring → canvas → export)

---

## 4. Security Requirements

### 4.1 Privacy by Design

| Requirement | Target | Implementation |
|-------------|--------|-----------------|
| Data storage | No user data stored | Client-side only, no persistence |
| Cookies | No cookies or local storage | Stateless session |
| Data transmission | No data sent to server | Client-side only |
| Third-party tracking | No analytics or tracking | No GA, no pixels |

**Rationale**: Coach/coachee trust is sensitive. Zero data retention ensures privacy.

### 4.2 Input Validation

| Requirement | Target | Implementation |
|-------------|--------|-----------------|
| Relationship names | Sanitize to prevent XSS | Escape HTML entities |
| User input | Length validation (max 50 chars) | Client-side validation |
| File uploads | Not supported | N/A |
| URL parameters | Not used | N/A |

### 4.3 HTTPS Enforcement

| Requirement | Target | Implementation |
|-------------|--------|-----------------|
| Production | HTTPS only | Vercel automatic SSL |
| Development | HTTPS preferred | Local dev with self-signed cert |

### 4.4 XSS Prevention

| Requirement | Target | Implementation |
|-------------|--------|-----------------|
| XSS vulnerabilities | Zero critical XSS bugs | Automated scan (OWASP ZAP) |
| Content Security Policy | Strict CSP header | Vercel configuration |

---

## 5. Reliability Requirements

### 5.1 Uptime

| Metric | Target | Measurement |
|--------|--------|-------------|
| Availability | 99.9% (max 43 min downtime/month) | Uptime monitoring (Vercel) |
| Error rate | < 0.1% of requests | Error tracking (Vercel logs) |

**Rationale**: Tool must work reliably during coaching sessions. Failures damage coach credibility.

### 5.2 Error Handling

| Requirement | Target | Implementation |
|-------------|--------|-----------------|
| Graceful errors | User-friendly error messages | Try-catch blocks, error boundaries |
| No white screens | All errors have UI feedback | Error boundaries with fallback |
| Error recovery | User can continue after error | Retry mechanisms where appropriate |
| Logging | All errors logged for debugging | Vercel log capture |

### 5.3 Crash Prevention

| Requirement | Target | Implementation |
|-------------|--------|-----------------|
| Memory leaks | Zero memory leaks | Chrome DevTools Memory profiler |
| Memory usage | < 100MB during session | Performance monitoring |
| Crash rate | Zero crashes during session | Error boundary coverage |

---

## 6. Usability Requirements

### 6.1 Learnability

| Metric | Target | Measurement |
|--------|--------|-------------|
| Time to first session | < 5 minutes from landing to canvas completion | User testing |
| Zero documentation required | Coach can use tool without reading docs | User testing |

**Rationale**: Coaches are busy, no time for training. Tool must be intuitive.

### 6.2 Task Efficiency

| Metric | Target | Measurement |
|--------|--------|-------------|
| Full session time | 30-45 minutes (naming + scoring + visualization) | User testing |
| Steps to complete session | 4 screens (landing → naming → scoring → canvas) | User testing |
| Clicks to complete session | ~50 clicks (naming 12-25, scoring 12-25, export) | User testing |

### 6.3 Error Prevention

| Requirement | Target | Implementation |
|-------------|--------|-----------------|
| Invalid state prevention | "Next" button disabled until valid count | UI state management |
| Duplicate prevention | Error message on duplicate names | Validation logic |
| Guidance | Clear instructions on each screen | UX copy |

### 6.4 Satisfaction Metrics

| Metric | Target | Measurement |
|--------|--------|-------------|
| NPS (Coach) | > 8 | Post-session survey |
| "Easy to use" rating | > 4.5/5 | Post-session survey |
| "Professional appearance" rating | > 4.5/5 | Post-session survey |

---

## 7. Internationalization (Out of Scope for v1.0)

| Requirement | Target | Note |
|-------------|--------|------|
| Multi-language support | English only for v1.0 | Target US/UK/ProActive coaches |
| Date/time formatting | Local browser locale | Simple date format |
| Number formatting | Local browser locale | Simple numbers |
| RTL languages | Not supported | English only |

**Rationale**: Reduces scope for v1.0. Expand based on user feedback.

---

## 8. Scalability (Not Applicable for v1.0)

| Requirement | Target | Note |
|-------------|--------|------|
| Concurrent users | No limit (client-side only) | No backend, no database |
| Data storage | N/A | No persistence |
| API rate limiting | N/A | No APIs |

**Rationale**: v1.0 is client-side only, no scaling concerns.

---

## 9. Maintainability

### 9.1 Code Quality

| Metric | Target | Measurement |
|--------|--------|-------------|
| TypeScript strict mode | Enabled | tsconfig.json |
| Linting | Zero errors | ESLint |
| Code formatting | Prettier | Automated |
| Test coverage | Minimum 50% unit, critical path E2E | Coverage report |

### 9.2 Documentation

| Requirement | Target | Implementation |
|-------------|--------|-----------------|
| Component docs | Storybook for all components | Storybook |
| API docs | TypeScript comments and JSDoc | Inline documentation |
| README | Clear setup and usage instructions | Project README |

---

## NFR Acceptance Criteria

### Must-Have (Blocking)
- ✅ All WCAG 2.1 Level AA requirements met
- ✅ Page load < 2 seconds
- ✅ Interaction response < 100ms
- ✅ PDF export < 5 seconds, file size < 1MB
- ✅ Cross-browser tested (Chrome, Edge, Safari, Firefox)
- ✅ Mobile responsive (iOS Safari, Chrome Android)
- ✅ Zero user data storage (privacy-by-design)
- ✅ HTTPS enforced
- ✅ 99.9% uptime (Vercel reliability)

### Should-Have (Important)
- ✅ Error handling with user-friendly messages
- ✅ Keyboard navigation fully supported
- ✅ Focus indicators on all interactive elements
- ✅ Color contrast minimum 4.5:1 for text
- ✅ Lighthouse performance score > 90
- ✅ Accessibility scan (axe DevTools) zero critical errors

### Nice-to-Have (Enhancements)
- ⭕ 60 FPS animations
- ⭕ Advanced error recovery mechanisms
- ⭕ Detailed performance monitoring
- ⭕ Automated accessibility testing in CI

---

## NFR Testing Plan

### Pre-Deployment Checklist

#### Performance
- [ ] Lighthouse score > 90 (Performance, Accessibility, Best Practices)
- [ ] Page load time < 2 seconds
- [ ] Interaction latency < 100ms
- [ ] PDF export < 5 seconds

#### Accessibility
- [ ] axe DevTools scan: Zero critical errors
- [ ] Keyboard navigation test: Full session flow
- [ ] Screen reader test: NVDA and VoiceOver
- [ ] Color contrast test: All text > 4.5:1
- [ ] WCAG 2.1 AA checklist: All items pass

#### Cross-Browser
- [ ] Chrome Desktop: Full session test
- [ ] Edge Desktop: Full session test
- [ ] Safari Desktop: Full session test
- [ ] Firefox Desktop: Smoke test
- [ ] Chrome Android: Full session test
- [ ] iOS Safari: Full session test

#### Security
- [ ] No data stored in cookies/localStorage
- [ ] HTTPS enforced in production
- [ ] Input validation tested
- [ ] XSS vulnerability scan: Zero critical issues

#### Usability
- [ ] Complete full session in < 5 minutes (without coachee)
- [ ] No documentation required to use tool
- [ ] Error messages are clear and actionable

---

## NFR Violation Handling

### Severity Levels

| Severity | Definition | Response Time |
|----------|------------|---------------|
| P0 - Critical | Tool unusable, data loss, security breach | Immediate (fix and rollback) |
| P1 - High | Major NFR violation (performance, accessibility) | 4 hours |
| P2 - Medium | Minor NFR violation | 24 hours |
| P3 - Low | Cosmetic or minor UX issue | Next sprint |

### Response Process

1. **Detect**: Automated monitoring or user report
2. **Assess**: Determine severity and impact
3. **Triage**: Assign to appropriate agent (Claude, Codex, Gemini)
4. **Fix**: Implement fix based on severity timeline
5. **Verify**: Regression testing
6. **Deploy**: Deploy fix (or rollback if P0)

---

**NFR Spec Status**: Complete
**Dependencies**: PRD, User Interview
**Next Steps**: Create Phase 4 artifacts (Design System, UX Flows, Accessibility Spec)
