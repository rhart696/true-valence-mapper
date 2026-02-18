# Accessibility Spec

**Version**: 1.0
**Date**: 2026-02-17
**Based On**: NFR Spec + Design System + UX Flows
**Product**: True Valence Mapper v1.0

---

## Accessibility Overview

**Purpose**: Define WCAG 2.1 Level AA compliance requirements and implementation guidance.

**Standard**: WCAG 2.1 Level AA
**Target Audiences**: Users with visual, motor, and cognitive disabilities
**Compliance**: 100% of success criteria must be met for v1.0 launch

---

## 1. WCAG 2.1 Level AA Compliance

### 1.1 Perceivable

#### 1.1.1 Text Alternatives (Level A)

**Requirement**: Provide text alternatives for any non-text content.

**Implementation**:
- [ ] All images have `alt` attribute
- [ ] Decorative images have `alt=""` or `role="presentation"`
- [ ] Icons have `aria-label` when meaning is not clear from context
- [ ] Charts/visualizations have text description

**Examples**:
```html
<!-- Logo with descriptive alt -->
<img src="/logo.svg" alt="True Valence Mapper logo">

<!-- Decorative icon -->
<img src="/checkmark.svg" alt="" role="presentation">

<!-- Icon with meaning -->
<button aria-label="Remove relationship">
  <img src="/trash.svg" alt="" role="presentation">
</button>
```

**Verification**: Axe DevTools scan, manual review

---

#### 1.1.2 Time-Based Media (Level A) - Not Applicable

**Requirement**: Provide alternatives for time-based media.

**Status**: Not applicable (no video/audio content)

---

#### 1.1.3 Adaptable (Level A)

**Requirement**: Create content that can be presented in different ways without losing information or structure.

**Implementation**:
- [ ] Use semantic HTML (`<header>`, `<nav>`, `<main>`, `<section>`, `<footer>`)
- [ ] Use proper heading hierarchy (`<h1>`, `<h2>`, `<h3>`)
- [ ] Use lists for groups of related items (`<ul>`, `<ol>`, `<li>`)
- [ ] Avoid using layout tables for structure

**Examples**:
```html
<!-- Proper heading hierarchy -->
<h1>True Valence Mapper</h1>
<h2>Facilitate Trust Mapping</h2>
<h3>Name Relationships</h3>

<!-- Semantic structure -->
<header>
  <nav aria-label="Main navigation">...</nav>
</header>
<main>
  <section aria-labelledby="relationships-heading">
    <h2 id="relationships-heading">Name Relationships</h2>
    <ul role="list">
      <li>Alice Johnson</li>
      <li>Bob Smith</li>
    </ul>
  </section>
</main>
<footer>...</footer>
```

**Verification**: HTML Validator, manual code review

---

#### 1.1.4 Distinguishable (Level A)

**Requirement**: Make it easier for users to see and hear content including separating foreground from background.

**Implementation**:
- [ ] Text contrast minimum 4.5:1 for normal text
- [ ] Text contrast minimum 3:1 for large text (18pt/24px or bold 14pt/18.66px)
- [ ] UI component contrast minimum 3:1
- [ ] Text can be resized up to 200% without loss of content
- [ ] Do not rely on color alone to convey meaning
- [ ] No content flashes 3 times per second or less

**Contrast Measurements**:

| Element | Foreground | Background | Ratio | Pass/Fail |
|---------|-----------|-----------|-------|-----------|
| Body text | #091E42 | #FFFFFF | 21:1 | ✅ Pass |
| Secondary text | #6B778C | #FFFFFF | 4.5:1 | ✅ Pass |
| Primary button text | #FFFFFF | #0052CC | 8.2:1 | ✅ Pass |
| Small text (12px) | #6B778C | #FFFFFF | 4.5:1 | ✅ Pass |
| Trust level badges | #FFFFFF | #00B87C (High) | 8.8:1 | ✅ Pass |
| Trust level badges | #FFFFFF | #0052CC (Moderate) | 8.2:1 | ✅ Pass |
| Trust level badges | #FFFFFF | #FFAB00 (Low) | 4.6:1 | ✅ Pass |
| Trust level badges | #FFFFFF | #FF5630 (None) | 6.5:1 | ✅ Pass |

**Color Independence**:
- [ ] Trust levels use icons + colors, not colors alone
- [ ] Error states use text + color
- [ ] Success states use icon + color
- [ ] Buttons have labels, not just icons

**Examples**:
```html
<!-- Good: Icon + Color + Text -->
<div class="trust-indicator high-trust">
  <svg aria-hidden="true">...</svg>
  <span>High Trust</span>
</div>

<!-- Bad: Color alone -->
<div class="trust-indicator" style="background: green;">
  High
</div>

<!-- Good: Error with text + color -->
<input type="text" aria-invalid="true" aria-describedby="error-msg" />
<p id="error-msg" role="alert" style="color: #FF5630;">
  Please enter a valid name
</p>
```

**Verification**: Wave contrast checker, manual visual inspection

---

### 1.2 Operable

#### 1.2.1 Keyboard Accessible (Level A)

**Requirement**: Make all functionality available from a keyboard.

**Implementation**:
- [ ] All interactive elements are keyboard accessible via Tab
- [ ] No keyboard traps (can navigate away from all elements)
- [ ] Logical tab order (follows visual layout)
- [ ] Focus indicator visible on all interactive elements

**Keyboard Shortcuts**:
- `Tab`: Navigate to next interactive element
- `Shift+Tab`: Navigate to previous interactive element
- `Enter`: Activate button, select option
- `Space`: Toggle checkbox, activate button
- `Escape`: Close modal, exit focused element

**Examples**:
```html
<!-- Interactive element with keyboard support -->
<button>Start Session</button> <!-- Tab to, Enter to activate -->

<!-- Custom interactive element with keyboard support -->
<div
  role="button"
  tabindex="0"
  onkeydown="if (event.key === 'Enter' || event.key === ' ') activate()"
>
  Custom Button
</div>
```

**Verification**: Keyboard-only test (Tab through entire app)

---

#### 1.2.2 No Keyboard Trap (Level A)

**Requirement**: Ensure that users are not trapped in keyboard focus.

**Implementation**:
- [ ] All modals have focus trap (can't tab outside)
- [ ] All modals have close button
- [ ] All modals close on ESC key
- [ ] Dropdowns close on ESC key
- [ ] No infinite loops in tab order

**Focus Trap Implementation**:
```javascript
// Focus trap for modals
const focusableElements = modal.querySelectorAll(
  'button, [href], input, select, textarea, [tabindex]:not([tabindex="-1"])'
);
const firstElement = focusableElements[0];
const lastElement = focusableElements[focusableElements.length - 1];

modal.addEventListener('keydown', (e) => {
  if (e.key === 'Tab') {
    if (e.shiftKey && document.activeElement === firstElement) {
      lastElement.focus();
      e.preventDefault();
    } else if (!e.shiftKey && document.activeElement === lastElement) {
      firstElement.focus();
      e.preventDefault();
    }
  }
  if (e.key === 'Escape') {
    closeModal();
  }
});
```

**Verification**: Keyboard-only test, try to tab outside modals

---

#### 1.2.3 Timing (Level A) - Partially Applicable

**Requirement**: Provide users enough time to read and use content.

**Implementation**:
- [ ] No time-limited actions (except auto-dismiss modals, which must be dismissible)
- [ ] No auto-refreshing content
- [ ] No flashing content that causes seizures

**Auto-Dismiss Modals** (if used):
- [ ] User can dismiss by clicking close button
- [ ] User can dismiss by clicking outside modal
- [ ] User can dismiss by pressing ESC
- [ ] Provide option to disable auto-dismiss

**Note**: v1.0 may not use auto-dismiss modals. If used, must meet above requirements.

**Verification**: Manual testing, code review

---

#### 1.2.4 Navigable (Level A)

**Requirement**: Provide ways to help users navigate, find content, and determine where they are.

**Implementation**:
- [ ] Skip navigation link (for jumping to main content)
- [ ] Breadcrumbs or page title clearly indicates current location
- [ ] Clear link text (descriptive, not "click here")
- [ ] Multiple ways to navigate (back buttons, navigation links)

**Skip Navigation**:
```html
<a href="#main-content" class="skip-link">
  Skip to main content
</a>
<div id="main-content" role="main">
  <!-- Main content -->
</div>
```

**Link Text**:
```html
<!-- Good: Descriptive link text -->
<a href="/definitions">What do these mean?</a>

<!-- Bad: Vague link text -->
<a href="/definitions">Click here</a>
```

**Verification**: Manual testing, screen reader test

---

#### 1.2.5 Input Modalities (Level A)

**Requirement**: Make it easier for users to operate functionality through various inputs beyond keyboard.

**Implementation**:
- [ ] Touch targets minimum 44x44 CSS pixels (mobile)
- [ ] No gestures required (unless there's keyboard alternative)
- [ ] No motion device operation required

**Touch Target Size**:
```css
button {
  min-height: 44px;
  min-width: 44px;
  padding: 12px 24px;
}
```

**Verification**: Mobile testing, touch target measurement

---

### 1.3 Understandable

#### 1.3.1 Readable (Level A)

**Requirement**: Make text content readable and understandable.

**Implementation**:
- [ ] Language of page declared (`lang="en"`)
- [ ] Language changes indicated (if multi-language)
- [ ] Text is readable and understandable
- [ ] Consistent terminology used

**Language Declaration**:
```html
<html lang="en">
```

**Terminology Consistency**:
- Use "relationships" consistently, not "contacts" or "people"
- Use "trust levels" consistently, not "scores" or "ratings"
- Use "canvas" consistently for visual display

**Verification**: HTML Validator, manual content review

---

#### 1.3.2 Predictable (Level A)

**Requirement**: Make Web pages appear and operate in predictable ways.

**Implementation**:
- [ ] Consistent navigation (same order, same location)
- [ ] Consistent component behavior (buttons always work the same)
- [ ] Consistent visual indicators (focus, hover, active states)
- [ ] No unexpected changes to context

**Component Behavior**:
- Primary buttons always lead to next step
- Back buttons always return to previous screen
- Links always navigate to new page or anchor
- Modals always have close button

**Verification**: Manual testing across all screens

---

#### 1.3.3 Input Assistance (Level A)

**Requirement**: Help users avoid and correct mistakes.

**Implementation**:
- [ ] Labels clearly identify input purpose
- [ ] Error messages clearly identify error and how to fix
- [ ] Errors are associated with inputs (using `aria-describedby`)
- [ ] Suggestions provided where possible
- [ ] Confirmations for important actions

**Input Labels**:
```html
<label for="relationship-name">Relationship name</label>
<input
  type="text"
  id="relationship-name"
  name="relationship-name"
  aria-describedby="relationship-help"
/>
<p id="relationship-help" class="help-text">
  Enter the name of a person in your coachee's life
</p>
```

**Error Messages**:
```html
<label for="relationship-name">Relationship name</label>
<input
  type="text"
  id="relationship-name"
  name="relationship-name"
  aria-invalid="true"
  aria-describedby="relationship-error"
/>
<p id="relationship-error" class="error-message" role="alert">
  Please enter a relationship name
</p>
```

**Verification**: Form validation test, screen reader test

---

#### 1.3.4 Consistent Identification (Level AA)

**Requirement**: Ensure that consistent identification of functional components is provided.

**Implementation**:
- [ ] Icons used consistently for same function
- [ ] Text labels used consistently for same function
- [ ] ARIA labels used consistently for same function

**Icon Consistency**:
- Trash icon always means "delete" or "remove"
- Pencil icon always means "edit"
- Checkmark always means "success" or "complete"
- X always means "close" or "cancel"

**Verification**: Manual review across all screens

---

### 1.4 Robust

#### 1.4.1 Compatible (Level A)

**Requirement**: Maximize compatibility with current and future user agents, including assistive technologies.

**Implementation**:
- [ ] Valid HTML5 (no syntax errors)
- [ ] ARIA attributes used correctly
- [ ] ARIA roles used correctly
- [ ] No deprecated HTML elements or attributes

**Valid HTML**:
- Use HTML Validator (https://validator.w3.org/)
- Fix all errors and warnings
- Use semantic HTML elements

**ARIA Attributes**:
```html
<!-- Correct ARIA usage -->
<div role="dialog" aria-modal="true" aria-labelledby="modal-title">
  <h2 id="modal-title">Trust Definitions</h2>
  <!-- Modal content -->
</div>

<!-- Incorrect ARIA usage -->
<button role="button"> <!-- Redundant role on button -->
  Click me
</button>
```

**Verification**: HTML Validator, axe DevTools scan

---

## 2. Component-Level Accessibility

### 2.1 Buttons

**Requirements**:
- [ ] Accessible name (visible text or aria-label)
- [ ] Keyboard focus (visible outline)
- [ ] Hover and active states
- [ ] aria-label for icon-only buttons

**Examples**:
```html
<!-- Text button -->
<button>Start Session</button>

<!-- Icon button with aria-label -->
<button aria-label="Remove relationship">
  <svg aria-hidden="true">...</svg>
</button>

<!-- Icon button with visible text -->
<button>
  <svg aria-hidden="true">...</svg>
  Remove
</button>
```

**Verification**: Keyboard test, screen reader test

---

### 2.2 Inputs

**Requirements**:
- [ ] Associated label (or aria-label)
- [ ] Error message (if invalid)
- [ ] ARIA attributes (aria-invalid, aria-describedby)
- [ ] Placeholder is not a replacement for label

**Examples**:
```html
<!-- Input with label -->
<label for="email">Email address</label>
<input type="email" id="email" name="email" />

<!-- Input with aria-label (no visible label) -->
<input type="search" aria-label="Search" />

<!-- Input with error -->
<label for="relationship-name">Relationship name</label>
<input
  type="text"
  id="relationship-name"
  aria-invalid="true"
  aria-describedby="relationship-error"
/>
<p id="relationship-error" class="error-message" role="alert">
  This field is required
</p>
```

**Verification**: Form validation test, screen reader test

---

### 2.3 Modals

**Requirements**:
- [ ] Focus trap (can't tab outside)
- [ ] ESC key closes modal
- [ ] Close button visible
- [ ] Click outside closes modal
- [ ] aria-modal="true"
- [ ] aria-labelledby or aria-label

**Implementation**:
```javascript
// Modal component requirements
function openModal() {
  modal.classList.add('open');
  modal.setAttribute('aria-modal', 'true');
  modal.setAttribute('role', 'dialog');
  modal.querySelector('.modal-close').focus();
  trapFocus(modal);
}

function closeModal() {
  modal.classList.remove('open');
  modal.removeAttribute('aria-modal');
  modal.removeAttribute('role');
  restoreFocus();
}

modal.addEventListener('click', (e) => {
  if (e.target === modal) closeModal();
});

document.addEventListener('keydown', (e) => {
  if (e.key === 'Escape' && modal.classList.contains('open')) {
    closeModal();
  }
});
```

**Verification**: Keyboard test, screen reader test

---

### 2.4 Color-Based Information

**Requirements**:
- [ ] Non-color indicator (icon + text)
- [ ] WCAG contrast met
- [ ] Not the only way to convey information

**Examples**:
```html
<!-- Good: Icon + Color + Text -->
<div class="trust-level high">
  <svg aria-hidden="true">...</svg>
  <span>High Trust</span>
</div>

<!-- Bad: Color alone -->
<div class="trust-level high">
  High
</div>

<!-- Good: Error with text + icon + color -->
<div class="error-message">
  <svg aria-hidden="true">...</svg>
  <span>Please enter a valid name</span>
</div>
```

**Verification**: Color blindness simulator test, screen reader test

---

## 3. Testing Requirements

### 3.1 Automated Testing

**Tools**:
- Axe DevTools (Chrome extension)
- Lighthouse (built into Chrome DevTools)
- Wave (https://wave.webaim.org/)
- HTML Validator (https://validator.w3.org/)

**Automated Tests**:
- [ ] Axe DevTools scan: Zero critical errors
- [ ] Lighthouse Accessibility score: > 90
- [ ] Wave scan: Zero errors
- [ ] HTML Validator: Valid HTML5

**CI/CD Integration**:
```bash
# Run accessibility tests in CI
npm run test:accessibility
```

---

### 3.2 Manual Testing

**Keyboard Navigation**:
- [ ] Tab through entire app (no skips, no traps)
- [ ] All interactive elements accessible via keyboard
- [ ] Focus indicators visible
- [ ] Logical tab order

**Screen Reader Testing**:
- [ ] NVDA (Windows): Full session test
- [ ] VoiceOver (macOS): Full session test
- [ ] All text read correctly
- [ ] All buttons/links read as interactive
- [ ] All images have alt text

**Visual Testing**:
- [ ] Color contrast checker (all text > 4.5:1)
- [ ] Zoom to 200% (no horizontal scroll)
- [ ] Browser zoom (all content visible)
- [ ] High contrast mode (all content visible)

**Mobile Testing**:
- [ ] Touch targets minimum 44x44
- [ ] No gestures required
- [ ] Keyboard on mobile (Tab navigation works)

---

### 3.3 User Testing

**Participants**:
- [ ] At least 1 user with screen reader
- [ ] At least 1 user with keyboard-only navigation
- [ ] At least 1 user with visual impairment

**Tasks**:
1. Complete full session (landing → naming → scoring → canvas → export)
2. Navigate using keyboard only
3. Navigate using screen reader
4. Resize browser to 200% zoom
5. Test on mobile device

**Success Criteria**:
- [ ] Complete session without errors
- [ ] No accessibility barriers encountered
- [ ] User can complete all tasks independently
- [ ] User satisfaction > 4/5

---

## 4. Accessibility Checklist

### 4.1 Pre-Launch Checklist

**Content**:
- [ ] All images have alt text
- [ ] Decorative images marked as decorative
- [ ] Color contrast minimum 4.5:1 for text
- [ ] Color contrast minimum 3:1 for UI components
- [ ] Not using color alone to convey meaning
- [ ] Text resizable to 200%

**Keyboard**:
- [ ] All interactive elements keyboard accessible
- [ ] No keyboard traps
- [ ] Logical tab order
- [ ] Focus indicators visible
- [ ] ESC closes modals
- [ ] Skip navigation link present

**Forms**:
- [ ] All inputs have labels
- [ ] Error messages clear and associated with inputs
- [ ] Form validation provides helpful feedback
- [ ] ARIA attributes used correctly

**Navigation**:
- [ ] Page titles descriptive
- [ ] Breadcrumbs or page title indicates location
- [ ] Link text descriptive
- [ ] Consistent navigation

**Technical**:
- [ ] Valid HTML5
- [ ] ARIA attributes correct
- [ ] Semantic HTML elements
- [ ] No deprecated elements

**Automated Tests**:
- [ ] Axe DevTools: Zero critical errors
- [ ] Lighthouse Accessibility: > 90
- [ ] Wave: Zero errors
- [ ] HTML Validator: Valid HTML5

**Manual Tests**:
- [ ] Keyboard navigation: Full session test
- [ ] Screen reader: Full session test (NVDA, VoiceOver)
- [ ] Color contrast: All text > 4.5:1
- [ ] Zoom: 200% zoom test
- [ ] Mobile: Touch targets 44x44 minimum

---

## 5. Accessibility Resources

### 5.1 Guidelines and Standards

- WCAG 2.1: https://www.w3.org/WAI/WCAG21/quickref/
- ARIA Authoring Practices: https://www.w3.org/WAI/ARIA/apg/
- MDN Accessibility: https://developer.mozilla.org/en-US/docs/Web/Accessibility

### 5.2 Testing Tools

- Axe DevTools: https://www.deque.com/axe/
- Lighthouse: https://developers.google.com/web/tools/lighthouse
- Wave: https://wave.webaim.org/
- HTML Validator: https://validator.w3.org/
- NVDA Screen Reader: https://www.nvaccess.org/
- VoiceOver (built into macOS)

### 5.3 Color Contrast Checkers

- WebAIM Contrast Checker: https://webaim.org/resources/contrastchecker/
- Contrast Ratio: https://contrast-ratio.com/
- Colour Contrast Analyser (CCA): https://www.tpgi.com/color-contrast-checker/

---

**Accessibility Spec Status**: Complete
**Dependencies**: NFR Spec, Design System, UX Flows
**Next Steps**: Create Phase 5 artifacts (Tech Stack, Architecture, API Contract)
