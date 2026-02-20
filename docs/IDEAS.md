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

## Done (Implemented in v1 — 2026-02-20)

### #D01 - Dash patterns on arrows (WCAG 1.4.1)
**Status:** Done | **Completed:** 2026-02-20
Arrows now encode score with both colour and dash pattern (solid/dash/dot/long-dash) so colour is not the only visual indicator.

### #D02 - Persistent legend on canvas
**Status:** Done | **Completed:** 2026-02-20
Always-visible score key in bottom-right corner of SVG. No need to open the definitions modal to understand the colours.

### #D03 - Scored/total arrows counter
**Status:** Done | **Completed:** 2026-02-20
"{n}/{total} ↗↙" indicator in panel header — coaches can see at a glance how complete the map is.

### #D04 - Inline name edit
**Status:** Done | **Completed:** 2026-02-20
Pencil icon per relationship row. Click to enter edit mode, Enter to save, Escape to cancel. Removes the friction of having to delete and re-add a mistyped name.

### #D05 - Insights panel
**Status:** Done | **Completed:** 2026-02-20
4 coaching metrics (Mapped / Strong / Asymmetric / Low) shown live in the panel when 2+ relationships exist. Gives the coach a debrief scaffold without leaving the map.

### #D06 - Demo data / example map
**Status:** Done | **Completed:** 2026-02-20
"Load example map" button on landing screen. Pre-built 7-person map with all score patterns (bilateral high, asymmetric, low, unscored) — useful for demos and first-time users learning the tool.

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
- SVG export is straightforward (serialise the existing SVG element)
- html2canvas for PNG with branding
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

### #004 - Session Persistence (localStorage)
**Status:** New | **Added:** 2026-02-20
**Source:** Prototype review — original HTML prototype had local save/load

Auto-save the current session to localStorage on every change. Restore on page load with a "Resume last session" prompt. Prevents data loss when the browser is accidentally closed during a coaching session.

Implementation notes:
- Serialize `SessionState` to JSON on every `setState`
- On mount, check localStorage; if found, offer "Resume" or "Start fresh"
- No backend required for this level of persistence

---

### #005 - Cloud Save / Share Link
**Status:** New | **Added:** 2026-02-20
**Source:** Prototype review — original had Supabase backend with share codes

Save a map to the cloud and generate a short share code (e.g., 6-char alphanumeric). Coach can share URL with coachee or access across devices.

Implementation notes:
- Supabase infrastructure already existed in original prototype (`index-cloud.html`)
- Share code resolves to a read-only snapshot (not live session)
- Privacy: maps should be anonymous by default (no login required)
- Consider TTL on shared maps (e.g., expire after 30 days)

---

### #006 - Version History / Longitudinal Tracking
**Status:** New | **Added:** 2026-02-20
**Source:** Prototype review — original had auto-save + manual save with labels

Allow coaches to save named snapshots ("Session 1 — March", "Session 3 — May") and compare two snapshots side-by-side. Most powerful use case: showing coachee how their map changed over 3-6 months.

Implementation notes:
- Depends on #004 (persistence) or #005 (cloud) for storage
- Comparison view: two maps side-by-side, or overlay with diff colouring
- Manual "Save snapshot" button with optional label
- Version list modal with restore and compare actions

---

### #007 - Welcome Onboarding (First-Time Experience)
**Status:** New | **Added:** 2026-02-20
**Source:** Prototype review — original had multi-slide welcome modal with dot navigation

Show a 3-slide modal on first visit: (1) What is True Valence, (2) How to score, (3) What to do with the map. Only shown once; skippable; "Don't show again" checkbox.

Implementation notes:
- Use localStorage to track first-visit state
- Slides already drafted conceptually in REVISED-UX-OPTIMIZATION-PLAN.md
- Complements rather than replaces the definitions modal (which stays)

---

### #008 - Context-Sensitive Coaching Questions
**Status:** New | **Added:** 2026-02-20
**Source:** Prototype review — original generated questions based on map state

After scoring, show a set of debrief questions tailored to the map's pattern (e.g., if asymmetric relationships detected, surface questions about those). Questions update as scores change.

Example triggers:
- 3+ asymmetric relationships → "What patterns do you notice in where you're the one approaching?"
- Any bilateral low → "What has happened in this relationship that affects your confidence in both directions?"
- All scored high → "What has made these relationships feel safe in both directions?"

Implementation notes:
- Question bank needs careful authorship (ProActive ReSolutions expertise)
- Could be static rule-based (pattern matching) or LLM-generated
- Risk: generic questions feel cheap — needs thoughtful copy
- Recommend: coach review before shipping

---

### #009 - Print / Print-to-PDF Fallback
**Status:** New | **Added:** 2026-02-20
**Source:** Prototype review — original had a Print button in the quick-actions menu

`window.print()` with a print stylesheet that shows just the map and legend. Fallback for environments where the PDF export library is unavailable or slow.

---

### #010 - Relationship Notes Export in PDF
**Status:** New | **Added:** 2026-02-20
**Source:** Gap identified during focus group testing

Currently the PDF export shows the SVG map only. Notes (per-relationship text) are not included. Add a notes section to the PDF: each relationship with its note, grouped below the map.

---

### #011 - Coachee Name on Hub Node (Full Name)
**Status:** Considering | **Added:** 2026-02-20
**Source:** Focus group observation

The hub currently truncates the coachee name to ~6 chars. Consider fitting more text, or using initials with a full-name tooltip on hover. Would make the map more personal and recognizable in the PDF.

---

## Deferred Ideas

(None yet)

---

## Rejected Ideas

(None yet)

---

## Document History

- 2026-01-01: Created with initial seed ideas
- 2026-02-20: Added #D01–#D06 (implemented), #004–#011 from prototype review + focus group
