# User Stories

**Version**: 1.0
**Date**: 2026-02-17
**Based On**: PRD + User Journey Map
**Product**: True Valence Mapper v1.0

---

## Story Deck Overview

**Total Stories**: 7 core stories covering the complete user journey
**Priority**: All P0 (required for v1.0 MVP)
**Effort Estimate**: Total ~20 story points (1 day development)

---

## Story 1: Quick Start Session

### User Story
> As a coach, I want to quickly start a new trust mapping session so I can begin facilitating without wasting time on setup or sign-in.

### Acceptance Criteria
- [ ] Landing page displays "Start Session" button prominently
- [ ] No sign-up or login required to begin session
- [ ] Clicking "Start Session" transitions to relationship naming screen in < 500ms
- [ ] Landing page includes brief description (2-3 sentences) of trust mapping
- [ ] Landing page includes "What do these mean?" link for trust definitions

### Definition of Done
- Landing page is polished and professional (no "beta" feel)
- "Start Session" button is clear and accessible
- Zero friction from landing to session start

### Dependencies
- None (entry point to application)

### Priority
- **P0** (blocking)

---

## Story 2: Name Relationships

### User Story
> As a coach, I want to add 12-25 relationships to map so I can help my coachee identify their trust landscape.

### Acceptance Criteria
- [ ] Coach can add relationships via text input field
- [ ] Coach can remove relationships by clicking "Remove" button
- [ ] Coach can edit relationship name by clicking "Edit" button
- [ ] Minimum 12 relationships required to proceed (error message if fewer)
- [ ] Maximum 25 relationships allowed (error message if more)
- [ ] Visual counter shows current count (e.g., "15/25 relationships")
- [ ] Relationships are listed alphabetically or in order added (user-selectable)
- [ ] Duplicate relationships are prevented (error message if duplicate name entered)
- [ ] "Next" button is disabled until 12-25 relationships are added
- [ ] Clicking "Next" transitions to trust scoring screen

### Edge Cases
- Exactly 12 relationships: "Next" button enabled
- Exactly 25 relationships: "Next" button enabled, error message if user tries to add 26th
- Duplicate name entered: Error message "This relationship name is already in your list"
- Relationship name too long (> 50 characters): Truncate with ellipsis or error message

### Definition of Done
- Coach can add/remove/edit 12-25 relationships
- Visual counter is clear and accurate
- "Next" button only enables when valid count reached

### Dependencies
- Story 1 (Quick Start Session)

### Priority
- **P0** (blocking)

---

## Story 3: Score Trust Levels

### User Story
> As a coach, I want to assign a trust level to each relationship so my coachee can see their trust patterns emerge.

### Acceptance Criteria
- [ ] Each relationship displays with 4-level trust selector (High, Moderate, Low, None)
- [ ] Trust levels are visually distinct (color-coded or icons)
- [ ] Coach can select trust level by clicking on level option
- [ ] Trust definition pop-up is accessible via "What do these mean?" link
- [ ] Trust definitions are clear and concise (3-4 sentences each)
- [ ] Coach can review all assigned trust levels in list view
- [ ] Coach can change trust level at any time before completion
- [ ] Visual indicator shows completion progress (e.g., "15/25 scored")
- [ ] "View Canvas" button is disabled until all relationships are scored
- [ ] Clicking "View Canvas" transitions to visual canvas screen

### Trust Level Definitions
- **High**: You would trust this person with critical decisions, confidential information, and your reputation. You have complete confidence in their integrity and competence.
- **Moderate**: You trust this person with routine tasks and standard information, but you'd hesitate to involve them in critical decisions. You have partial confidence in their abilities and intentions.
- **Low**: You trust this person with basic information or minor tasks, but you'd avoid involving them in anything important. You have limited confidence and proceed with caution.
- **None**: You do not trust this person with anything significant. You have no confidence in their integrity, competence, or intentions, and you minimize interactions.

### Edge Cases
- Coach clicks "What do these mean?": Modal opens with all 4 definitions
- Coach tries to proceed with unassigned trust level: "View Canvas" button disabled, visual indicator shows incomplete
- Coach wants to change previously assigned level: Click on new level, updates immediately

### Definition of Done
- Coach can score all relationships with 4-level selector
- Trust definitions are accessible and clear
- "View Canvas" button only enables when all relationships scored

### Dependencies
- Story 2 (Name Relationships)

### Priority
- **P0** (blocking)

---

## Story 4: View Visual Canvas

### User Story
> As a coach, I want to see a visual representation of relationships and trust levels so my coachee can gain insight into their trust landscape.

### Acceptance Criteria
- [ ] All relationships are displayed visually on canvas
- [ ] Relationships are color-coded by trust level (green=High, blue=Moderate, amber=Low, red=None)
- [ ] Relationships are arranged in organized, non-overlapping layout
- [ ] Canvas is readable and uncluttered (works well with 12-25 items)
- [ ] Coach can hover over relationship to see details (name + trust level)
- [ ] Coach can zoom in/out if canvas is large
- [ ] Canvas is responsive (works on tablet/laptop)
- [ ] Visual design is polished and professional
- [ ] "Export PDF" button is prominent and accessible

### Layout Rules
- Relationships grouped by trust level (e.g., all High trust together)
- Within each trust level, relationships sorted alphabetically
- Adequate spacing between relationships (no overlapping)
- Consistent visual hierarchy (trust level labels, relationship names)

### Edge Cases
- 12 relationships: Compact layout, all visible without scrolling
- 25 relationships: Larger layout, may require zoom or scrolling
- All relationships at same trust level: Single group, still visually organized

### Definition of Done
- Canvas is clear, readable, and polished
- All relationships visible and identifiable
- Coach can facilitate insight discussion without technical issues

### Dependencies
- Story 3 (Score Trust Levels)

### Priority
- **P0** (blocking)

---

## Story 5: Export PDF

### User Story
> As a coach, I want to export the completed trust canvas as a PDF so my coachee has a meaningful takeaway from the session.

### Acceptance Criteria
- [ ] "Export PDF" button is prominent on canvas screen
- [ ] PDF generates in < 5 seconds
- [ ] PDF includes all relationships with trust levels
- [ ] PDF is high-quality (text is readable, colors are accurate)
- [ ] PDF includes date and session metadata
- [ ] PDF includes coach/coachee labels (optional, editable)
- [ ] PDF filename is meaningful (e.g., "trust-map-2026-02-17.pdf")
- [ ] PDF file size is reasonable (< 1MB)
- [ ] Download completes successfully without errors

### PDF Content Requirements
- Title: "Trust Mapping Session"
- Date: Session date
- Trust definitions summary (optional, one-liner per level)
- All relationships grouped by trust level
- Each relationship shows: Name + Trust Level
- Footer with tool name and date

### Edge Cases
- Export fails: Error message "Unable to generate PDF. Please try again."
- Large canvas (25 relationships): PDF formatting adapts to multiple pages if needed
- PDF generation slow: Loading indicator with progress

### Definition of Done
- PDF exports successfully on first try
- PDF is high-quality and professional
- All session data is included

### Dependencies
- Story 4 (View Visual Canvas)

### Priority
- **P0** (blocking)

---

## Story 6: Understand Trust Definitions

### User Story
> As a coach, I want to access trust definitions during the session so I can explain trust levels to my coachee.

### Acceptance Criteria
- [ ] "What do these mean?" link is available on landing page
- [ ] "What do these mean?" link is available on trust scoring screen
- [ ] Clicking link opens modal with all 4 trust level definitions
- [ ] Modal can be closed by clicking "X" or outside modal
- [ ] Definitions are clear and concise (3-4 sentences each)
- [ ] Definitions are consistent with ProActive framework
- [ ] Modal is accessible via keyboard (ESC to close)

### Definition Formatting
- **High Trust**: [definition]
- **Moderate Trust**: [definition]
- **Low Trust**: [definition]
- **No Trust**: [definition]

### Edge Cases
- Coach opens modal on landing page: Shows definitions, can close to return to landing
- Coach opens modal during scoring: Modal overlays scoring screen, doesn't lose progress
- Coach uses keyboard: ESC key closes modal

### Definition of Done
- Trust definitions are easily accessible
- Definitions are clear and coach-friendly
- Modal works smoothly without disrupting session flow

### Dependencies
- None (can be accessed independently)

### Priority
- **P0** (blocking)

---

## Story 7: Complete Session

### User Story
> As a coach, I want to cleanly end the session so I can transition to next steps without technical clutter or confusion.

### Acceptance Criteria
- [ ] After PDF export, success message displays "PDF downloaded successfully!"
- [ ] "Start New Session" button is available
- [ ] "Start New Session" clears all current session data
- [ ] No persistence or session history (tool is stateless)
- [ ] Tool can be closed without saving or cleanup
- [ ] No logout or account management needed

### Session End Flow
1. Coach clicks "Export PDF"
2. PDF downloads successfully
3. Success message appears
4. Coach has option to:
   - Start new session
   - Close browser tab (session ends)

### Edge Cases
- Coach accidentally clicks "Start New Session": Confirmation dialog "This will clear your current session. Continue?"
- Coach wants to keep working on current session: Can stay on canvas screen indefinitely

### Definition of Done
- Session ends cleanly without technical issues
- Coach can start new session or close tool without friction
- No session data persists (privacy-by-design)

### Dependencies
- Story 5 (Export PDF)

### Priority
- **P0** (blocking)

---

## Story Priority Matrix

| Story | Priority | Dependencies | Estimated Points |
|-------|----------|--------------|------------------|
| Story 1: Quick Start Session | P0 | None | 2 |
| Story 2: Name Relationships | P0 | Story 1 | 3 |
| Story 3: Score Trust Levels | P0 | Story 2 | 5 |
| Story 4: View Visual Canvas | P0 | Story 3 | 5 |
| Story 5: Export PDF | P0 | Story 4 | 3 |
| Story 6: Understand Trust Definitions | P0 | None | 2 |
| Story 7: Complete Session | P0 | Story 5 | 2 |
| **Total** | | | **22 points** |

---

## Definition of Ready (DoR)

A story is ready for development when:
- [ ] Acceptance criteria are clear and unambiguous
- [ ] Dependencies are resolved (or clearly identified)
- [ ] Design specifications are available (Design System artifact)
- [ ] UI/UX requirements are documented (UX Flows artifact)
- [ ] Testing scenarios are defined

---

## Definition of Done (DoD)

A story is complete when:
- [ ] All acceptance criteria are met
- [ ] Code is reviewed and approved
- [ ] Unit tests pass (minimum 50% coverage)
- [ ] Accessibility requirements met (WCAG 2.1 AA)
- [ ] Cross-browser tested (Chrome, Edge, Safari, Firefox)
- [ ] Mobile responsive tested (iOS Safari, Chrome Android)
- [ ] Performance benchmarks met (page load < 2s, interaction < 100ms)
- [ ] No critical bugs or P0 issues

---

## Out-of-Scope Stories (Deferred to v2.0)

- [ ] User accounts and authentication
- [ ] Session history and persistence
- [ ] Share via URL or code
- [ ] Multi-session tracking and comparison
- [ ] Coachee self-access (coach-only facilitation)
- [ ] Analytics and usage tracking
- [ ] Collaboration features
- [ ] Multiple modalities (values, strengths, etc.)
- [ ] Dark mode
- [ ] Advanced PDF customization

---

**User Stories Status**: Complete
**Dependencies**: PRD, User Journey Map
**Next Steps**: Create Phase 3 artifact (NFR Spec), then Phase 4 artifacts (Design System, UX Flows, Accessibility)
