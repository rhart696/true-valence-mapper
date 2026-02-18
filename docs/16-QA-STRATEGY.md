# QA Strategy

**Version**: 1.0
**Date**: 2026-02-17
**Based On**: NFR Spec + Implementation Plan + UX Flows
**Product**: True Valence Mapper v1.0

---

## QA Strategy Overview

**Purpose**: Define comprehensive testing approach to ensure v1.0 meets quality standards.

**Approach**: Multi-layer testing (unit, integration, E2E, manual, accessibility, performance).

**Timeline**: Continuous testing throughout development, final QA in Phase 5 (1 hour).

---

## 1. Testing Pyramid

### 1.1 Testing Layers

```
                    ┌─────────────────┐
                    │   E2E Tests     │  ← 2-3 scenarios
                    │   (2-3 hours)   │
                    └─────────────────┘
                 ┌──────────────────────┐
                 │   Integration Tests │  ← 5-10 tests
                 │     (1-2 hours)     │
                 └──────────────────────┘
              ┌─────────────────────────────┐
              │       Unit Tests            │  ← 20-30 tests
              │         (2-3 hours)         │
              └─────────────────────────────┘
```

**Time Allocation**:
- Unit tests: 2-3 hours (spread across Phase 2)
- Integration tests: 1-2 hours (Phase 3)
- E2E tests: 2-3 hours (Phase 5)
- Manual testing: 1 hour (Phase 5)
- Accessibility audit: 30 minutes (Phase 5)
- **Total**: 7-10 hours (spread across 8-hour development)

---

## 2. Unit Testing

### 2.1 Scope

**What to Test**:
- Pure functions (validation, state transformations)
- Custom hooks (`useRelationshipForm`, `usePDFExport`)
- Component logic (render, props, callbacks)
- State management (SessionContext)

**What NOT to Test**:
- Third-party libraries (Radix UI, React Hook Form)
- Simple rendering (no logic)
- External APIs (none for v1.0)

### 2.2 Test Framework

**Selected**: Jest + React Testing Library

**Rationale**:
- Jest: Built-in to Next.js
- React Testing Library: Best practices for React
- TypeScript support: `ts-jest`
- Snapshot testing: UI regression detection

**Configuration**:
```javascript
// jest.config.js
module.exports = {
  preset: 'ts-jest',
  testEnvironment: 'jsdom',
  setupFilesAfterEnv: ['<rootDir>/jest.setup.js'],
  moduleNameMapper: {
    '^@/(.*)$': '<rootDir>/src/$1',
  },
  collectCoverageFrom: [
    'src/**/*.{ts,tsx}',
    '!src/**/*.d.ts',
    '!src/**/*.stories.tsx',
  ],
  coverageThreshold: {
    global: {
      branches: 50,
      functions: 50,
      lines: 50,
      statements: 50,
    },
  },
};
```

### 2.3 Test Cases

#### Validation Functions

```typescript
// validateRelationshipName.test.ts
describe('validateRelationshipName', () => {
  it('should pass for valid name', () => {
    const result = validateRelationshipName('Alice Johnson', []);
    expect(result.isValid).toBe(true);
    expect(result.error).toBeUndefined();
  });

  it('should fail for empty name', () => {
    const result = validateRelationshipName('', []);
    expect(result.isValid).toBe(false);
    expect(result.error).toBe('Please enter a relationship name');
  });

  it('should fail for duplicate name', () => {
    const result = validateRelationshipName('Alice', ['alice']);
    expect(result.isValid).toBe(false);
    expect(result.error).toBe('This relationship is already in your list');
  });

  it('should fail for name > 50 characters', () => {
    const result = validateRelationshipName('A'.repeat(51), []);
    expect(result.isValid).toBe(false);
    expect(result.error).toBe('Name must be 50 characters or less');
  });

  it('should pass for exactly 50 characters', () => {
    const result = validateRelationshipName('A'.repeat(50), []);
    expect(result.isValid).toBe(true);
  });
});
```

#### State Management

```typescript
// useSession.test.ts
describe('useSession', () => {
  it('should add relationship', () => {
    const { result } = renderHook(() => useSession(), {
      wrapper: SessionProvider,
    });

    act(() => {
      result.current.addRelationship('Alice');
    });

    expect(result.current.relationships).toHaveLength(1);
    expect(result.current.relationships[0].name).toBe('Alice');
  });

  it('should remove relationship', () => {
    const { result } = renderHook(() => useSession(), {
      wrapper: SessionProvider,
    });

    act(() => {
      result.current.addRelationship('Alice');
    });

    const id = result.current.relationships[0].id;

    act(() => {
      result.current.removeRelationship(id);
    });

    expect(result.current.relationships).toHaveLength(0);
  });

  it('should set trust level', () => {
    const { result } = renderHook(() => useSession(), {
      wrapper: SessionProvider,
    });

    act(() => {
      result.current.addRelationship('Alice');
    });

    const id = result.current.relationships[0].id;

    act(() => {
      result.current.setTrustLevel(id, 'high');
    });

    expect(result.current.trustLevels[id]).toBe('high');
  });
});
```

#### Components

```typescript
// RelationshipCard.test.tsx
describe('RelationshipCard', () => {
  const relationship = { id: '1', name: 'Alice' };

  it('should render relationship name', () => {
    render(<RelationshipCard relationship={relationship} />);
    expect(screen.getByText('Alice')).toBeInTheDocument();
  });

  it('should call onRemove when remove button clicked', () => {
    const onRemove = jest.fn();
    render(<RelationshipCard relationship={relationship} onRemove={onRemove} />);
    
    fireEvent.click(screen.getByRole('button', { name: /remove/i }));
    
    expect(onRemove).toHaveBeenCalledWith('1');
  });

  it('should not render edit/remove buttons if editing', () => {
    render(<RelationshipCard relationship={relationship} isEditing />);
    
    expect(screen.queryByRole('button', { name: /edit/i })).not.toBeInTheDocument();
    expect(screen.queryByRole('button', { name: /remove/i })).not.toBeInTheDocument();
  });
});
```

### 2.4 Coverage Targets

| Metric | Target | Measurement |
|--------|--------|-------------|
| Branch coverage | 50% | Jest coverage |
| Function coverage | 50% | Jest coverage |
| Line coverage | 50% | Jest coverage |
| Statement coverage | 50% | Jest coverage |

**Focus Areas**:
- Validation logic: 100% coverage
- State management: 80% coverage
- Component logic: 60% coverage
- Simple rendering: 0% coverage (not worth testing)

---

## 3. Integration Testing

### 3.1 Scope

**What to Test**:
- Component integration (parent + child)
- State flow (add → update → remove)
- Navigation flow (screen transitions)
- Modal open/close
- Form submission

**What NOT to Test**:
- Third-party components (Radix UI)
- Styling (visual regression)
- External services (none)

### 3.2 Test Cases

#### Form Integration

```typescript
// RelationshipForm.integration.test.tsx
describe('RelationshipForm Integration', () => {
  it('should add relationship on submit', () => {
    const onAdd = jest.fn();
    render(<RelationshipForm onAdd={onAdd} existingNames={[]} />);
    
    fireEvent.change(screen.getByRole('textbox'), {
      target: { value: 'Alice' },
    });
    
    fireEvent.click(screen.getByRole('button', { name: /add/i }));
    
    expect(onAdd).toHaveBeenCalledWith('Alice');
  });

  it('should not add empty relationship', () => {
    const onAdd = jest.fn();
    render(<RelationshipForm onAdd={onAdd} existingNames={[]} />);
    
    fireEvent.click(screen.getByRole('button', { name: /add/i }));
    
    expect(onAdd).not.toHaveBeenCalled();
    expect(screen.getByText(/please enter/i)).toBeInTheDocument();
  });

  it('should not add duplicate relationship', () => {
    const onAdd = jest.fn();
    render(<RelationshipForm onAdd={onAdd} existingNames={['alice']} />);
    
    fireEvent.change(screen.getByRole('textbox'), {
      target: { value: 'Alice' },
    });
    
    fireEvent.click(screen.getByRole('button', { name: /add/i }));
    
    expect(onAdd).not.toHaveBeenCalled();
    expect(screen.getByText(/already in your list/i)).toBeInTheDocument();
  });
});
```

#### Navigation Integration

```typescript
// NamingScreen.integration.test.tsx
describe('NamingScreen Navigation', () => {
  it('should disable next button with < 12 relationships', () => {
    const onNext = jest.fn();
    render(<NamingScreen relationships={[]} onNext={onNext} />);
    
    const nextButton = screen.getByRole('button', { name: /next/i });
    expect(nextButton).toBeDisabled();
  });

  it('should enable next button with 12 relationships', () => {
    const relationships = Array.from({ length: 12 }, (_, i) => ({
      id: String(i),
      name: `Person ${i}`,
    }));
    const onNext = jest.fn();
    render(<NamingScreen relationships={relationships} onNext={onNext} />);
    
    const nextButton = screen.getByRole('button', { name: /next/i });
    expect(nextButton).not.toBeDisabled();
  });

  it('should call onNext when next button clicked', () => {
    const relationships = Array.from({ length: 12 }, (_, i) => ({
      id: String(i),
      name: `Person ${i}`,
    }));
    const onNext = jest.fn();
    render(<NamingScreen relationships={relationships} onNext={onNext} />);
    
    fireEvent.click(screen.getByRole('button', { name: /next/i }));
    
    expect(onNext).toHaveBeenCalled();
  });
});
```

### 3.3 Test Framework

**Selected**: Jest + React Testing Library (same as unit tests)

**Reason**: Same framework for unit and integration tests, consistent tooling.

---

## 4. E2E Testing

### 4.1 Scope

**What to Test**:
- Complete user flow (landing → naming → scoring → canvas → export)
- Cross-browser compatibility
- Mobile compatibility
- PDF export

**What NOT to Test**:
- Styling details (visual regression)
- Edge cases (covered by unit/integration tests)

### 4.2 Test Framework

**Selected**: Playwright

**Rationale**:
- Cross-browser support (Chrome, Edge, Safari, Firefox)
- Mobile support (iOS Safari, Chrome Android)
- Fast and reliable
- TypeScript support
- Built-in to Next.js (via `@playwright/test`)

**Configuration**:
```javascript
// playwright.config.ts
import { defineConfig, devices } from '@playwright/test';

export default defineConfig({
  testDir: './e2e',
  fullyParallel: true,
  forbidOnly: !!process.env.CI,
  retries: process.env.CI ? 2 : 0,
  workers: process.env.CI ? 1 : undefined,
  reporter: 'html',
  use: {
    baseURL: 'http://localhost:3000',
    trace: 'on-first-retry',
  },
  projects: [
    {
      name: 'chromium',
      use: { ...devices['Desktop Chrome'] },
    },
    {
      name: 'firefox',
      use: { ...devices['Desktop Firefox'] },
    },
    {
      name: 'webkit',
      use: { ...devices['Desktop Safari'] },
    },
    {
      name: 'Mobile Chrome',
      use: { ...devices['Pixel 5'] },
    },
    {
      name: 'Mobile Safari',
      use: { ...devices['iPhone 12'] },
    },
  ],
});
```

### 4.3 Test Cases

#### Complete Session Flow

```typescript
// complete-session.spec.ts
test('complete session flow', async ({ page }) => {
  // Step 1: Landing page
  await page.goto('/');
  await expect(page.locator('h1')).toContainText('Facilitate Trust Mapping');
  await page.click('button:has-text("Start Session")');

  // Step 2: Add 12 relationships
  for (let i = 1; i <= 12; i++) {
    await page.fill('input[placeholder*="Enter relationship"]', `Person ${i}`);
    await page.click('button:has-text("Add")');
  }

  await expect(page.locator('text=Relationships (12/25)')).toBeVisible();
  await page.click('button:has-text("Next")');

  // Step 3: Score trust levels
  for (let i = 1; i <= 12; i++) {
    await page.click(`text=Person ${i}`);
    await page.click('button:has-text("High")');
  }

  await expect(page.locator('text=Progress: 12/12 scored')).toBeVisible();
  await page.click('button:has-text("View Canvas")');

  // Step 4: View canvas
  await expect(page.locator('text=Trust Landscape')).toBeVisible();
  await expect(page.locator('text=High Trust (12)')).toBeVisible();

  // Step 5: Export PDF
  const downloadPromise = page.waitForEvent('download');
  await page.click('button:has-text("Export PDF")');
  const download = await downloadPromise;
  expect(download.suggestedFilename()).toMatch(/trust-map-.*\.pdf/);
});

test('validation: minimum 12 relationships', async ({ page }) => {
  await page.goto('/');
  await page.click('button:has-text("Start Session")');

  // Add only 11 relationships
  for (let i = 1; i <= 11; i++) {
    await page.fill('input[placeholder*="Enter relationship"]', `Person ${i}`);
    await page.click('button:has-text("Add")');
  }

  const nextButton = page.locator('button:has-text("Next")');
  await expect(nextButton).toBeDisabled();
  await expect(page.locator('text=Add 1 more relationship')).toBeVisible();
});

test('validation: maximum 25 relationships', async ({ page }) => {
  await page.goto('/');
  await page.click('button:has-text("Start Session")');

  // Add 25 relationships
  for (let i = 1; i <= 25; i++) {
    await page.fill('input[placeholder*="Enter relationship"]', `Person ${i}`);
    await page.click('button:has-text("Add")');
  }

  await expect(page.locator('text=Relationships (25/25)')).toBeVisible();

  // Try to add 26th
  await page.fill('input[placeholder*="Enter relationship"]', 'Person 26');
  await page.click('button:has-text("Add")');
  await expect(page.locator('text=Maximum 25 relationships')).toBeVisible();
});
```

### 4.4 Test Scenarios

| Scenario | Browser | Priority |
|----------|---------|----------|
| Complete session flow | Chrome | P0 |
| Validation (min 12) | Chrome | P0 |
| Validation (max 25) | Chrome | P0 |
| PDF export | Chrome | P0 |
| Complete session flow | Safari | P0 |
| Complete session flow | Firefox | P1 |
| Complete session flow | Edge | P1 |
| Complete session flow | Mobile Safari | P0 |
| Complete session flow | Mobile Chrome | P0 |

---

## 5. Manual Testing

### 5.1 Test Scenarios

#### Happy Path Tests

**Scenario 1: Complete Session (12 relationships)**
1. Open app
2. Click "Start Session"
3. Add 12 relationships
4. Click "Next"
5. Score all 12 relationships (High)
6. Click "View Canvas"
7. Click "Export PDF"
8. Verify PDF downloaded
9. Verify PDF contains all 12 relationships

**Scenario 2: Complete Session (25 relationships)**
1. Open app
2. Click "Start Session"
3. Add 25 relationships
4. Click "Next"
5. Score all 25 relationships (various levels)
6. Click "View Canvas"
7. Click "Export PDF"
8. Verify PDF downloaded
9. Verify PDF contains all 25 relationships

**Scenario 3: Trust Definitions Modal**
1. Open app
2. Click "What do these mean?"
3. Verify all 4 trust definitions displayed
4. Click "× Close"
5. Verify modal closed

#### Edge Case Tests

**Scenario 4: Duplicate Name**
1. Open app
2. Click "Start Session"
3. Add "Alice"
4. Try to add "alice" (case-insensitive duplicate)
5. Verify error message displayed
6. Verify "Alice" not added twice

**Scenario 5: Remove Relationship**
1. Open app
2. Click "Start Session"
3. Add "Alice"
4. Click "Remove" on Alice
5. Verify "Alice" removed
6. Verify count decreased

**Scenario 6: Edit Relationship**
1. Open app
2. Click "Start Session"
3. Add "Alice"
4. Click "Edit" on Alice
5. Change name to "Alice Johnson"
6. Verify name updated

#### Error Case Tests

**Scenario 7: PDF Export Failure**
1. Open app
2. Complete session (12 relationships)
3. Simulate PDF export failure (mock html2canvas error)
4. Verify error message displayed
5. Verify user can retry

#### Accessibility Tests

**Scenario 8: Keyboard Navigation**
1. Open app
2. Use Tab to navigate to "Start Session"
3. Press Enter
4. Use Tab to navigate through naming screen
5. Add relationship (Enter)
6. Tab to "Next" (if enabled)
7. Press Enter
8. Continue through entire session using only keyboard

**Scenario 9: Screen Reader**
1. Open app with NVDA (Windows) or VoiceOver (macOS)
2. Listen to screen reader announcement
3. Verify all elements announced correctly
4. Navigate through session using screen reader

### 5.2 Test Results Template

| Scenario | Expected | Actual | Pass/Fail | Notes |
|----------|----------|--------|-----------|-------|
| Complete session (12) | Successful | | | |
| Complete session (25) | Successful | | | |
| Trust definitions modal | Modal opens, displays 4 definitions | | | |
| Duplicate name | Error message | | | |
| Remove relationship | Removed, count decreased | | | |
| Edit relationship | Name updated | | | |
| PDF export failure | Error message, retry available | | | |
| Keyboard navigation | Full session via keyboard | | | |
| Screen reader | All elements announced correctly | | | |

---

## 6. Accessibility Testing

### 6.1 Automated Accessibility Testing

**Tool**: axe DevTools (Chrome extension)

**Process**:
1. Open app in Chrome
2. Open axe DevTools
3. Run scan
4. Review results
5. Fix critical/serious issues
6. Re-scan until zero critical errors

**Acceptance Criteria**:
- Zero critical errors
- Zero serious errors
- Minor warnings acceptable (documented)

### 6.2 Manual Accessibility Testing

#### Keyboard Navigation

**Test Procedure**:
1. Open app
2. Use Tab key only
3. Navigate through entire session
4. Verify:
   - [ ] Tab order is logical
   - [ ] Focus indicator visible on all interactive elements
   - [ ] No keyboard traps
   - [ ] Esc closes modals
   - [ ] Enter/Space activates buttons

**Browser**: Chrome, Safari, Firefox, Edge

#### Screen Reader Testing

**Test Procedure** (NVDA - Windows):
1. Start NVDA
2. Open app
3. Navigate through session using NVDA
4. Verify:
   - [ ] All text is announced
   - [ ] Buttons/links announced as interactive
   - [ ] Form fields announced with labels
   - [ ] Error messages announced
   - [ ] Modal content announced when opened

**Test Procedure** (VoiceOver - macOS):
1. Start VoiceOver (Cmd + F5)
2. Open app in Safari
3. Navigate through session using VoiceOver
4. Verify same criteria as NVDA

#### Color Contrast Testing

**Tool**: WebAIM Contrast Checker

**Test Procedure**:
1. Sample all text colors
2. Check contrast against background
3. Verify:
   - [ ] Normal text: Minimum 4.5:1
   - [ ] Large text: Minimum 3:1
   - [ ] UI components: Minimum 3:1

#### Zoom Testing

**Test Procedure**:
1. Zoom browser to 200%
2. Navigate through session
3. Verify:
   - [ ] No horizontal scroll
   - [ ] All text readable
   - [ ] All interactive elements accessible

### 6.3 Accessibility Checklist

**WCAG 2.1 Level AA**:
- [ ] Text contrast > 4.5:1
- [ ] Large text contrast > 3:1
- [ ] UI component contrast > 3:1
- [ ] Keyboard navigation fully supported
- [ ] Focus indicators visible
- [ ] No keyboard traps
- [ ] ESC closes modals
- [ ] All images have alt text
- [ ] Color not used alone to convey meaning
- [ ] Forms have labels
- [ ] Error messages clear and associated
- [ ] Skip navigation link present
- [ ] Language declared (lang="en")
- [ ] Consistent navigation
- [ ] Consistent terminology

---

## 7. Performance Testing

### 7.1 Lighthouse Testing

**Tool**: Lighthouse (built into Chrome DevTools)

**Test Procedure**:
1. Open app
2. Open Chrome DevTools
3. Go to Lighthouse tab
4. Run audit
5. Review scores

**Acceptance Criteria**:
- Performance: > 90
- Accessibility: > 90
- Best Practices: > 90
- SEO: > 90 (optional, not critical for v1.0)

### 7.2 Manual Performance Testing

**Page Load Time**:
1. Open browser devtools (Network tab)
2. Refresh page
3. Measure time to first byte (TTFB)
4. Measure time to interactive (TTI)
5. Verify:
   - [ ] TTFB < 1 second
   - [ ] TTI < 2 seconds

**Interaction Latency**:
1. Open app
2. Click "Start Session"
3. Measure time to transition to naming screen
4. Add relationship
5. Measure time to add
6. Verify:
   - [ ] Page transition < 200ms
   - [ ] Add relationship < 50ms
   - [ ] Score trust level < 50ms

**PDF Export Time**:
1. Complete session (12 relationships)
2. Click "Export PDF"
3. Measure time to download
4. Verify:
   - [ ] PDF export < 5 seconds

**Bundle Size**:
1. Run `npm run build`
2. Check bundle analyzer
3. Verify:
   - [ ] Total JavaScript < 300KB
   - [ ] Total CSS < 50KB
   - [ ] Total fonts < 100KB

---

## 8. Cross-Browser Testing

### 8.1 Browser Matrix

| Browser | Version | Test Level | Priority |
|---------|---------|-----------|----------|
| Chrome | Latest 2 | Full session | P0 |
| Edge | Latest 2 | Full session | P0 |
| Safari | Latest 2 | Full session | P0 |
| Firefox | Latest 2 | Smoke test | P1 |

### 8.2 Test Procedure (Per Browser)

**Full Session Test**:
1. Open app
2. Complete session (12 relationships)
3. Verify:
   - [ ] Landing page displays correctly
   - [ ] Naming screen works
   - [ ] Scoring screen works
   - [ ] Canvas screen works
   - [ ] PDF export works
   - [ ] No console errors

**Smoke Test** (Firefox only):
1. Open app
2. Navigate through session
3. Verify:
   - [ ] No critical errors
   - [ ] Core functionality works
   - [ ] Minor styling differences acceptable

### 8.3 Known Browser Issues

**Safari (macOS/iOS)**:
- Potential issue: html2canvas may have rendering differences
- Mitigation: Test PDF export, adjust canvas config if needed

**Firefox**:
- Potential issue: Flexbox/Grid differences
- Mitigation: Test layout, add browser-specific CSS if needed

---

## 9. Mobile Testing

### 9.1 Device Matrix

| Device | Browser | Test Level | Priority |
|--------|---------|-----------|----------|
| iPhone 12/13/14 | Safari | Full session | P0 |
| iPad | Safari | Full session | P0 |
| Pixel 5/6 | Chrome | Full session | P0 |
| Samsung Galaxy | Chrome | Full session | P0 |

### 9.2 Test Procedure (Per Device)

**Full Session Test**:
1. Open app on mobile browser
2. Complete session (12 relationships)
3. Verify:
   - [ ] Layout responsive (single column)
   - [ ] Touch targets minimum 44x44
   - [ ] No horizontal scroll
   - [ ] Keyboard works (on mobile)
   - [ ] PDF export works
   - [ ] No console errors

### 9.3 Mobile-Specific Checks

**Touch Targets**:
- [ ] All buttons minimum 44x44
- [ ] All interactive elements minimum 44x44
- [ ] Adequate spacing between elements

**Responsive Layout**:
- [ ] Single column layout on mobile
- [ ] Stacked elements (not side-by-side)
- [ ] Font sizes readable (14px minimum)

**Mobile Keyboard**:
- [ ] Input fields don't zoom page
- [ ] Keyboard doesn't overlap important elements
- [ ] Keyboard dismisses when done

---

## 10. QA Checklist

### 10.1 Pre-Launch Checklist

**Unit Tests**:
- [ ] All tests pass
- [ ] Coverage > 50%
- [ ] No flaky tests

**Integration Tests**:
- [ ] All tests pass
- [ ] Component integration working
- [ ] State flow working

**E2E Tests**:
- [ ] Chrome: Full session passes
- [ ] Safari: Full session passes
- [ ] Mobile Safari: Full session passes
- [ ] Mobile Chrome: Full session passes
- [ ] PDF export works

**Manual Tests**:
- [ ] Complete session (12 relationships)
- [ ] Complete session (25 relationships)
- [ ] Trust definitions modal works
- [ ] Duplicate name validation works
- [ ] Remove relationship works
- [ ] Edit relationship works

**Accessibility**:
- [ ] axe DevTools: Zero critical errors
- [ ] Keyboard navigation: Full session works
- [ ] Screen reader: Full session works (NVDA, VoiceOver)
- [ ] Color contrast: All text > 4.5:1
- [ ] Zoom: 200% zoom works

**Performance**:
- [ ] Lighthouse: Performance > 90
- [ ] Lighthouse: Accessibility > 90
- [ ] Lighthouse: Best Practices > 90
- [ ] Page load < 2 seconds
- [ ] Interaction < 100ms
- [ ] PDF export < 5 seconds
- [ ] Bundle size < 300KB

**Cross-Browser**:
- [ ] Chrome: Full session works
- [ ] Edge: Full session works
- [ ] Safari: Full session works
- [ ] Firefox: Smoke test works

**Mobile**:
- [ ] iOS Safari: Full session works
- [ ] Chrome Android: Full session works
- [ ] Touch targets: Minimum 44x44
- [ ] Responsive layout: Works

---

## 11. Bug Triage Process

### 11.1 Bug Severity

| Severity | Definition | Response Time |
|----------|-----------|---------------|
| P0 - Critical | Blocks core functionality, data loss, security breach | Immediate (fix now) |
| P1 - High | Major functionality broken, significant UX issue | 1 hour |
| P2 - Medium | Minor functionality broken, minor UX issue | 4 hours |
| P3 - Low | Cosmetic issue, edge case | Next sprint |

### 11.2 Bug Template

```markdown
## Bug Title: [Short description]

**Severity**: P0/P1/P2/P3
**Priority**: Critical/High/Medium/Low

**Steps to Reproduce**:
1. Open app
2. Click "Start Session"
3. ...

**Expected Behavior**:
[What should happen]

**Actual Behavior**:
[What actually happens]

**Browser**: Chrome/Edge/Safari/Firefox + version
**OS**: Windows/macOS/Linux + version

**Screenshots** (if applicable):
[Attach screenshots]

**Console Errors** (if applicable):
```javascript
[Paste console errors]
```
```

### 11.3 Bug Fixing Workflow

1. **Report**: Bug reported in GitHub Issues
2. **Triage**: Assign severity and owner
3. **Fix**: Owner implements fix
4. **Test**: Owner tests fix
5. **Review**: Peer review of fix
6. **Deploy**: Deploy fix to production
7. **Verify**: Verify fix in production

---

## 12. QA Strategy Summary

### 12.1 Testing Coverage

| Test Type | Count | Duration | Owner |
|-----------|-------|----------|-------|
| Unit tests | 20-30 | 2-3 hours | All agents (Phase 2) |
| Integration tests | 5-10 | 1-2 hours | Claude (Phase 3) |
| E2E tests | 2-3 | 2-3 hours | Gemini (Phase 5) |
| Manual tests | 9 | 1 hour | All agents (Phase 5) |
| Accessibility tests | 10+ | 30 minutes | Gemini (Phase 5) |
| Performance tests | 7 | 15 minutes | Claude (Phase 5) |

### 12.2 Success Metrics

| Metric | Target | Measurement |
|--------|--------|-------------|
| Test pass rate | 100% | Jest, Playwright |
| Test coverage | > 50% | Jest coverage |
| Lighthouse scores | > 90 (all) | Lighthouse |
| Accessibility audit | Zero critical errors | axe DevTools |
| Cross-browser pass | 100% (P0 browsers) | Manual testing |
| Mobile pass | 100% | Manual testing |

### 12.3 Quality Gates

**Before Production Deployment**:
- [ ] All tests passing (unit, integration, E2E)
- [ ] Test coverage > 50%
- [ ] Lighthouse scores > 90
- [ ] Accessibility audit passed (zero critical errors)
- [ ] Cross-browser tested (Chrome, Edge, Safari)
- [ ] Mobile tested (iOS Safari, Chrome Android)
- [ ] Manual testing complete (all scenarios pass)
- [ ] No P0/P1 bugs outstanding
- [ ] Code reviewed and approved
- [ ] Deployment tested in staging (if available)

---

**QA Strategy Status**: Complete
**Dependencies**: NFR Spec, Implementation Plan, UX Flows
**Next Steps**: Create Rollback Plan artifact
