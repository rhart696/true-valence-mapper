# UX Flows

**Version**: 1.0
**Date**: 2026-02-17
**Based On**: User Journey Map + PRD + Design System
**Product**: True Valence Mapper v1.0

---

## UX Flows Overview

**Purpose**: Define screen-by-screen user experience, interactions, and transitions for all user paths.

**Total Screens**: 5
**Total Flows**: 3 (Happy Path, Edge Cases, Error States)
**Primary Flow**: Session Facilitation (45-60 minutes)

---

## Flow 1: Happy Path - Complete Session

### Overview
**User**: ProActive Certified Coach
**Context**: Facilitating trust mapping session with coachee
**Duration**: 45-60 minutes
**Screens**: 5 (Landing → Naming → Scoring → Canvas → Export)

---

### Screen 1: Landing Page

**Purpose**: Coach starts new session, learns about trust mapping

**Layout**:
```
┌─────────────────────────────────────────────────────┐
│ [Logo] True Valence Mapper              [Menu]     │
├─────────────────────────────────────────────────────┤
│                                                     │
│           Facilitate Trust Mapping                  │
│                                                      
│  Help your coachees visualize their trust          │
│  landscape in 30 minutes. No setup required.        │
│                                                      
│  [What do these mean?] ← Trust definitions link     │
│                                                     │
│                                                     │
│              [Start Session] ← Primary button       │
│                                                     │
└─────────────────────────────────────────────────────┘
```

**Elements**:
- **Header**: Logo (left), optional menu (right)
- **Hero**: "Facilitate Trust Mapping" (Display Small, 24px, Semibold)
- **Description**: "Help your coachees visualize their trust landscape in 30 minutes. No setup required." (Body Large, 16px, Regular)
- **Trust Definitions Link**: "What do these mean?" (Body Small, 12px, Blue, underlined)
- **CTA Button**: "Start Session" (Primary button, Trust Blue, centered)

**Interactions**:
- **Hover on "What do these mean?"**: Underline becomes solid
- **Click on "What do these mean?"**: Opens Trust Definitions Modal
- **Hover on "Start Session"**: Button darkens (10%)
- **Click on "Start Session"**: Transitions to Screen 2 (Naming) with 200ms fade

**Transitions**:
- To: Screen 2 (Naming)
- Duration: 200ms fade
- Trigger: Click "Start Session"

**Accessibility**:
- Keyboard: Tab to "Start Session", Enter to click
- Focus: Blue outline on "Start Session" button
- Screen reader: "Start Session, button"

**Validation**:
- None (entry point)

---

### Screen 2: Relationship Naming

**Purpose**: Coach adds 12-25 relationships to map

**Layout**:
```
┌─────────────────────────────────────────────────────┐
│ [← Back]            Name Relationships      [? Help] │
├─────────────────────────────────────────────────────┤
│                                                     │
│  Add the key relationships in your coachee's       │
│  professional life. Think about who they work      │
│  with daily, trust with decisions, and rely on.    │
│                                                     │
│  ┌───────────────────────────────────────────────┐ │
│  │ [Enter relationship name...]                    │ │
│  │                      [+ Add]                   │ │
│  └───────────────────────────────────────────────┘ │
│                                                     │
│  Relationships (15/25):                            │
│                                                     │
│  ┌───────────────────────────────────────────────┐ │
│  │ ✓ Alice Johnson         [Edit] [Remove]      │ │
│  └───────────────────────────────────────────────┘ │
│  ┌───────────────────────────────────────────────┐ │
│  │ ✓ Bob Smith             [Edit] [Remove]      │ │
│  └───────────────────────────────────────────────┘ │
│  ┌───────────────────────────────────────────────┐ │
│  │ ✓ Carol Davis           [Edit] [Remove]      │ │
│  └───────────────────────────────────────────────┘ │
│  ... (more relationships)                        │
│                                                     │
│  [← Back]                        [Next →]          │
│  (disabled)                      (enabled)        │
└─────────────────────────────────────────────────────┘
```

**Elements**:
- **Header**: Back button (left), Title "Name Relationships" (center), Help button (right)
- **Instruction**: "Add the key relationships in your coachee's professional life. Think about who they work with daily, trust with decisions, and rely on." (Body Medium, 14px)
- **Input Field**: Text input with placeholder "Enter relationship name..."
- **Add Button**: "+ Add" (Secondary button)
- **Count Badge**: "Relationships (15/25)" (Count badge)
- **Relationship List**: Cards with checkmark, name, Edit/Remove buttons
- **Navigation**: Back (disabled initially), Next (disabled until 12-25 relationships)

**Interactions**:
- **Focus on input field**: Border changes to Trust Blue, blue outline
- **Type in input field**: Text appears in real-time
- **Click "+ Add"**:
  - Validates: Not empty, not duplicate, not over 25
  - If valid: Adds relationship to list, increments count, clears input
  - If invalid: Shows error message below input
- **Click "Edit" on relationship**:
  - Replaces name with input field
  - Focus on input field
  - Save on Enter or click outside
- **Click "Remove" on relationship**:
  - Removes from list
  - Decrements count
  - Confirms with toast "Relationship removed"
- **Hover on "Next"**: Button darkens (10%)
- **Click "Next"**: Transitions to Screen 3 (Scoring) with 200ms fade

**Transitions**:
- To: Screen 1 (Landing) on "← Back"
- To: Screen 3 (Scoring) on "Next →"
- Duration: 200ms fade

**Accessibility**:
- Keyboard: Tab to input, Enter to add, Tab to relationships, Enter to edit/remove
- Focus: Blue outline on interactive elements
- Screen reader: "15 relationships, list", "Alice Johnson, button (edit)", "Bob Smith, button (edit)"

**Validation**:
- Empty input: Error "Please enter a relationship name"
- Duplicate name: Error "This relationship is already in your list"
- < 12 relationships: "Next" button disabled
- > 25 relationships: Error "Maximum 25 relationships allowed"

**Error States**:
- Empty input: Red border on input, error message below
- Duplicate: Red border on input, error message below
- Over limit: Toast notification "Maximum 25 relationships"

---

### Screen 3: Trust Scoring

**Purpose**: Coach assigns trust level to each relationship

**Layout**:
```
┌─────────────────────────────────────────────────────┐
│ [← Back]            Score Trust Levels    [? Help]  │
├─────────────────────────────────────────────────────┤
│                                                     │
│  For each relationship, score the trust level.    │
│  [What do these mean?] ← Trust definitions link     │
│                                                     │
│  Progress: 15/25 scored                           │
│                                                     │
│  ┌───────────────────────────────────────────────┐ │
│  │ Alice Johnson                                 │ │
│  │                                                │ │
│  │ [High] [Moderate] [Low] [None] ← Buttons     │ │
│  │                                                │ │
│  │  ✓ High trust: You'd trust them with...       │ │
│  └───────────────────────────────────────────────┘ │
│                                                     │
│  ┌───────────────────────────────────────────────┐ │
│  │ Bob Smith                                     │ │
│  │                                                │ │
│  │ [High] [Moderate] [Low] [None] ← Buttons     │ │
│  │                                                │ │
│  │  Select a trust level to score this...        │ │
│  └───────────────────────────────────────────────┘ │
│                                                     │
│  ... (more relationships)                        │
│                                                     │
│  [← Back]                        [View Canvas →]  │
│                                  (disabled)       │
└─────────────────────────────────────────────────────┘
```

**Elements**:
- **Header**: Back button (left), Title "Score Trust Levels" (center), Help button (right)
- **Instruction**: "For each relationship, score the trust level." (Body Medium, 14px)
- **Trust Definitions Link**: "What do these mean?" (Body Small, 12px, Blue, underlined)
- **Progress**: "Progress: 15/25 scored" (Count badge)
- **Relationship Cards**:
  - Relationship name (Heading Small, 16px, Semibold)
  - 4-level selector (High/Moderate/Low/None)
  - Selected level description (if selected)
- **Navigation**: Back, View Canvas (disabled until all scored)

**Interactions**:
- **Click "What do these mean?"**: Opens Trust Definitions Modal
- **Click trust level button**:
  - Highlights selected button (color + border)
  - Shows trust level description below
  - Updates progress count
  - Enables "View Canvas" if all scored
- **Hover on trust level button**: Slight scale (1.05), shadow
- **Click "View Canvas"**: Transitions to Screen 4 (Canvas) with 200ms fade

**Transitions**:
- To: Screen 2 (Naming) on "← Back"
- To: Screen 4 (Canvas) on "View Canvas →"
- Duration: 200ms fade

**Accessibility**:
- Keyboard: Tab to trust level buttons, Enter to select
- Focus: Blue outline on selected trust level
- Screen reader: "Alice Johnson, High trust, button, selected", "Bob Smith, Select trust level"

**Validation**:
- None (all levels valid)

**Error States**:
- None (error-free experience)

---

### Screen 4: Visual Canvas

**Purpose**: Coach and coachee review completed trust landscape

**Layout**:
```
┌─────────────────────────────────────────────────────┐
│ [← Back]          Trust Landscape         [? Help]  │
├─────────────────────────────────────────────────────┤
│                                                     │
│  Your coachee's trust landscape:                   │
│                                                     │
│  High Trust (5):                                    │
│  ┌─────┐ ┌─────┐ ┌─────┐ ┌─────┐ ┌─────┐          │
│  │Alice│ │Bob  │ │Carol│ │Dave │ │Eve  │          │
│  └─────┘ └─────┘ └─────┘ └─────┘ └─────┘          │
│                                                     │
│  Moderate Trust (7):                               │
│  ┌─────┐ ┌─────┐ ┌─────┐ ┌─────┐                  │
│  │Frank│ │Grace│ │Henry│ │Iris │                  │
│  └─────┘ └─────┘ └─────┘ └─────┘                  │
│  ┌─────┐ ┌─────┐ ┌─────┐                          │
│  │Jack │ │Kate │ │Leo  │                          │
│  └─────┘ └─────┘ └─────┘                          │
│                                                     │
│  Low Trust (2):                                     │
│  ┌─────┐ ┌─────┐                                  │
│  │Mia  │ │Noah │                                  │
│  └─────┘ └─────┘                                  │
│                                                     │
│  No Trust (1):                                     │
│  ┌─────┐                                           │
│  │Oscar│                                           │
│  └─────┘                                           │
│                                                     │
│              [Export PDF] ← Primary button        │
│                                                     │
└─────────────────────────────────────────────────────┘
```

**Elements**:
- **Header**: Back button (left), Title "Trust Landscape" (center), Help button (right)
- **Instruction**: "Your coachee's trust landscape:" (Body Medium, 14px)
- **Trust Level Groups**: Labeled by trust level (e.g., "High Trust (5)")
- **Relationship Cards**: Squares or circles with name, color-coded by trust level
- **Export Button**: "Export PDF" (Primary button, centered)

**Interactions**:
- **Hover on relationship card**:
  - Slight scale (1.05)
  - Shadow increases
  - Tooltip shows "Alice Johnson - High Trust"
- **Click on relationship card**:
  - Opens edit modal (optional, for v1.2)
  - v1.0: No action (read-only)
- **Hover on "Export PDF"**: Button darkens (10%)
- **Click "Export PDF"**: Generates PDF with loading indicator

**Transitions**:
- To: Screen 3 (Scoring) on "← Back"
- To: Success state on PDF export completion
- Duration: 200ms fade

**Accessibility**:
- Keyboard: Tab to relationship cards (read-only), Tab to Export
- Focus: Blue outline on Export button
- Screen reader: "High Trust, 5 relationships", "Alice Johnson, High Trust, card", "Export PDF, button"

**Validation**:
- None (all relationships already scored)

**Error States**:
- PDF generation failure: Error message "Unable to generate PDF. Please try again."

---

### Screen 5: Export Complete

**Purpose**: PDF successfully exported, coach can close session

**Layout**:
```
┌─────────────────────────────────────────────────────┐
│                                                     │
│                                                     │
│          ✓ PDF Exported Successfully!              │
│                                                      
│  Your trust map has been saved. You can now        │
│  share it with your coachee or start a new         │
│  session.                                           │
│                                                     │
│              [Start New Session]                    │
│                                                     │
│              [Close]                                 │
│                                                     │
│                                                     │
└─────────────────────────────────────────────────────┘
```

**Elements**:
- **Success Icon**: Checkmark circle (Green, 48px)
- **Success Message**: "PDF Exported Successfully!" (Display Small, 24px, Semibold)
- **Description**: "Your trust map has been saved. You can now share it with your coachee or start a new session." (Body Large, 16px)
- **Primary CTA**: "Start New Session" (Primary button)
- **Secondary CTA**: "Close" (Secondary button, link-style)

**Interactions**:
- **Hover on "Start New Session"**: Button darkens (10%)
- **Click "Start New Session"**: Clears all session data, returns to Screen 1 (Landing)
- **Hover on "Close"**: Underline
- **Click "Close"**: Allows closing browser tab (no action needed)

**Transitions**:
- To: Screen 1 (Landing) on "Start New Session"
- Duration: 200ms fade

**Accessibility**:
- Keyboard: Tab to "Start New Session", Tab to "Close"
- Focus: Blue outline on buttons
- Screen reader: "PDF Exported Successfully, heading", "Start New Session, button", "Close, link"

**Validation**:
- None (export already complete)

---

## Flow 2: Edge Cases

### Edge Case 2.1: Minimum Relationships (12)

**Screen**: Naming Screen
**Context**: Coach has exactly 12 relationships
**Behavior**:
- Count badge shows "Relationships (12/25)"
- "Next" button enabled (minimum met)
- Visual indicator (green checkmark or border) confirms minimum met

### Edge Case 2.2: Maximum Relationships (25)

**Screen**: Naming Screen
**Context**: Coach has 25 relationships
**Behavior**:
- Count badge shows "Relationships (25/25)"
- "Next" button enabled
- "Add" button disabled or hidden (at limit)
- If coach tries to add 26th: Error message "Maximum 25 relationships allowed"

### Edge Case 2.3: All Same Trust Level

**Screen**: Visual Canvas
**Context**: All relationships scored as High Trust
**Behavior**:
- Canvas shows single group "High Trust (25)"
- All cards in green
- Still visually organized (grid layout)
- No "empty" groups (hide Low/None/Moderate if zero)

### Edge Case 2.4: Duplicate Relationship Name

**Screen**: Naming Screen
**Context**: Coach enters duplicate name
**Behavior**:
- Input field shows red border
- Error message below: "This relationship is already in your list"
- "Add" button disabled until duplicate resolved
- Focus stays on input field

### Edge Case 2.5: PDF Export Failure

**Screen**: Canvas Screen
**Context**: PDF generation fails
**Behavior**:
- Loading indicator disappears
- Error message appears: "Unable to generate PDF. Please try again."
- "Export PDF" button remains enabled (retry possible)
- No data loss (session persists)

---

## Flow 3: Error States

### Error State 3.1: Network Error (Not Applicable)

**Note**: Client-side only, no network calls for core functionality. Only applicable for font loading, which fails gracefully.

### Error State 3.2: JavaScript Error

**Screen**: Any screen
**Context**: Unhandled JavaScript error
**Behavior**:
- Error boundary catches error
- Shows user-friendly message: "Something went wrong. Please refresh the page."
- Error logged to console for debugging
- "Refresh Page" button (Primary button)

### Error State 3.3: Browser Not Supported

**Screen**: Landing page (detected on load)
**Context**: Using outdated browser
**Behavior**:
- Shows message: "Your browser is not supported. Please use Chrome, Edge, Safari, or Firefox."
- "Download Chrome" link (external)
- "Continue anyway" link (dismiss warning)

---

## Modal Flows

### Modal 1: Trust Definitions

**Purpose**: Explain trust levels to coach

**Layout**:
```
┌─────────────────────────────────────────────┐
│ Trust Definitions              [× Close]    │
├─────────────────────────────────────────────┤
│                                             │
│ High Trust                                 │
│ You would trust this person with critical  │
│ decisions, confidential information, and   │
│ your reputation.                            │
│                                             │
│ Moderate Trust                             │
│ You trust this person with routine tasks   │
│ and standard information, but you'd hesitate│
│ to involve them in critical decisions.     │
│                                             │
│ Low Trust                                  │
│ You trust this person with basic           │
│ information or minor tasks, but you'd avoid│
│ involving them in anything important.      │
│                                             │
│ No Trust                                   │
│ You do not trust this person with anything │
│ significant. You have no confidence in     │
│ their integrity, competence, or intentions.│
│                                             │
└─────────────────────────────────────────────┘
```

**Interactions**:
- **Click "What do these mean?"**: Opens modal
- **Click "× Close"**: Closes modal
- **Click outside modal**: Closes modal
- **Press ESC**: Closes modal
- **Focus**: Trapped within modal (for accessibility)

**Accessibility**:
- Role: `dialog` or `alertdialog`
- `aria-modal="true"`
- Focus trap: Tab cycles within modal
- ESC key closes modal

---

## Transition Animations

### Page Transitions
- **Type**: Fade in/out
- **Duration**: 200ms
- **Easing**: Ease-in-out
- **Trigger**: Click "Next", "Back", or navigation buttons

### Modal Transitions
- **Type**: Fade in + scale
- **Duration**: 300ms
- **Easing**: Ease-out
- **Open**: Fade in from 0% opacity, scale from 0.95 to 1
- **Close**: Fade out to 0% opacity, scale from 1 to 0.95

### Button Hover States
- **Type**: Background color shift
- **Duration**: 200ms
- **Easing**: Ease-out
- **Change**: Darken 10% on hover

### Input Focus States
- **Type**: Border color + outline
- **Duration**: 100ms
- **Easing**: Ease-out
- **Change**: Border changes to Trust Blue, blue outline appears

---

## Responsive Layouts

### Mobile (< 640px)

**Landing Page**:
- Hero text: Single column, centered
- CTA button: Full width

**Naming Screen**:
- Input field: Full width
- Relationship list: Single column, stacked
- "Add" button: Full width (below input)

**Scoring Screen**:
- Relationship cards: Single column, stacked
- Trust level buttons: Stacked vertically

**Canvas Screen**:
- Trust level groups: Single column, stacked
- Relationship cards: Grid (2 columns) or stacked
- Export button: Full width

### Tablet (640px - 1023px)

**Landing Page**:
- Hero text: Single column, centered

**Naming Screen**:
- Input field: Full width
- Relationship list: 2-column grid

**Scoring Screen**:
- Relationship cards: 2-column grid
- Trust level buttons: Horizontal row

**Canvas Screen**:
- Trust level groups: Single column
- Relationship cards: 3-column grid

### Desktop (> 1024px)

**Landing Page**:
- Hero text: Single column, centered

**Naming Screen**:
- Input field: 50% width (centered)
- Relationship list: 3-column grid

**Scoring Screen**:
- Relationship cards: 3-column grid
- Trust level buttons: Horizontal row

**Canvas Screen**:
- Trust level groups: Horizontal layout (2 columns)
- Relationship cards: 5-column grid

---

## Keyboard Navigation

### Tab Order (Landing Page)
1. "What do these mean?" link
2. "Start Session" button

### Tab Order (Naming Screen)
1. "← Back" button
2. Relationship name input
3. "+ Add" button
4. First relationship (Edit button)
5. First relationship (Remove button)
6. Second relationship (Edit)
7. Second relationship (Remove)
8. ...
9. "Next →" button

### Tab Order (Scoring Screen)
1. "← Back" button
2. "What do these mean?" link
3. First relationship (High button)
4. First relationship (Moderate button)
5. First relationship (Low button)
6. First relationship (None button)
7. Second relationship (High)
8. ...
9. "View Canvas →" button

### Tab Order (Canvas Screen)
1. "← Back" button
2. First relationship card (read-only, focus for accessibility)
3. Second relationship card
4. ...
5. "Export PDF" button

### Tab Order (Export Complete Screen)
1. "Start New Session" button
2. "Close" link

---

## Accessibility Features

### Focus Indicators
- All interactive elements have blue outline (2px) on focus
- Focus-visible only (not on mouse click)
- Consistent focus indicator across all screens

### Screen Reader Support
- All images/icons have alt text or aria-label
- Buttons have descriptive labels
- Lists have proper role="list" and li items
- Modals have role="dialog" and aria-modal="true"

### Color Independence
- Trust levels use icons + colors (not color alone)
- Error states use text + color
- Success states use icon + color

### Reduced Motion
- Respect `prefers-reduced-motion` media query
- Disable animations if reduced motion preferred

---

**UX Flows Status**: Complete
**Dependencies**: User Journey Map, PRD, Design System
**Next Steps**: Create Accessibility Spec artifact
