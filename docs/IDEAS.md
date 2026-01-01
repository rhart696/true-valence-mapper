# Ideas - True Valence Mapper

**Purpose:** Project-specific ideas not yet committed to roadmap.
**Review Cadence:** Check during iteration planning.
**Escalation:** If idea applies beyond TVM, move to ~/dev/infrastructure/dev-env-docs/IDEAS-BACKLOG.md

---

## Status Legend

- **New** - Just captured, not yet evaluated
- **Considering** - Under active consideration
- **Approved** - Will implement (move to iteration plan)
- **Deferred** - Not now, revisit later
- **Rejected** - Won't do (note reason)
- **Done** - Implemented

---

## Active Ideas

### #001 - Dark Mode Support
**Status:** New | **Added:** 2026-01-01
**Source:** Common UX expectation

Add dark mode toggle for the visualization interface. Consider:
- CSS custom properties already in place
- User preference persistence (localStorage or Supabase)
- Respect system preference

---

### #002 - Export Visualization as Image
**Status:** New | **Added:** 2026-01-01
**Source:** User sharing needs

Allow users to export their valence map as PNG/SVG for sharing outside the app.
- D3.js can export to SVG
- html2canvas for PNG
- Consider watermark/branding

---

### #003 - Keyboard Navigation for Visualization
**Status:** New | **Added:** 2026-01-01
**Source:** Accessibility requirements

Full keyboard navigation through the valence map:
- Arrow keys to move between nodes
- Enter to select/expand
- Escape to deselect
- Tab order for all interactive elements

---

## Deferred Ideas

(None yet)

---

## Rejected Ideas

(None yet)

---

## Document History

- 2026-01-01: Created with initial seed ideas
