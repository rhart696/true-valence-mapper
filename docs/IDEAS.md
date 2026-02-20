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

## Done

### #D01 - Dash patterns on arrows (WCAG 1.4.1)
**Status:** Done | **Completed:** 2026-02-20 (v1.0)
Arrows now encode score with both colour and dash pattern (solid/dash/dot/long-dash) so colour is not the only visual indicator.

### #D02 - Persistent legend on canvas
**Status:** Done | **Completed:** 2026-02-20 (v1.0)
Always-visible score key in bottom-right corner of SVG. No need to open the definitions modal to understand the colours.

### #D03 - Scored/total arrows counter
**Status:** Done | **Completed:** 2026-02-20 (v1.0)
"{n}/{total} ↗↙" indicator in panel header — coaches can see at a glance how complete the map is.

### #D04 - Inline name edit
**Status:** Done | **Completed:** 2026-02-20 (v1.0)
Pencil icon per relationship row. Click to enter edit mode, Enter to save, Escape to cancel.

### #D05 - Insights panel
**Status:** Done | **Completed:** 2026-02-20 (v1.0)
4 coaching metrics (Mapped / Strong / Asymmetric / Low) shown live in the panel when 2+ relationships exist.

### #D06 - Demo data / example map
**Status:** Done | **Completed:** 2026-02-20 (v1.0)
"Load example map" button on landing screen. Pre-built 7-person map with all score patterns.

### #007 - Welcome Onboarding (First-Time Experience)
**Status:** Done | **Completed:** 2026-02-20 (v1.2)
3-slide first-visit modal: (1) What is True Valence / the two questions, (2) How to score / all four levels with badges, (3) What the map reveals / three coaching patterns. Shown once; localStorage gate (`tvm-onboarding-v1-complete`); skip/dismiss at any slide.

### #002 - Export Visualization as Image
**Status:** Done | **Completed:** 2026-02-20 (v1.1)
PNG export via shared SVG→canvas pipeline (3× scale for slide-deck quality). "PNG" button in panel footer alongside "Export PDF". Personalised filename includes coachee name slug.

### #003 - Keyboard Navigation for Visualization
**Status:** Done (partial) | **Completed:** 2026-02-20 (v1.2)
All 14 arrows on the canvas are tabbable (`tabIndex=0`). Visible dashed navy focus ring appears on focused arrow badge. Enter/Space cycles score. Full node-level arrow-key navigation deferred — current implementation covers the primary keyboard use case.

### #009 - Print / Print-to-PDF Fallback
**Status:** Done | **Completed:** 2026-02-20 (v1.0)
`window.print()` called in PDF export catch block as fallback if jsPDF fails.

### #010 - Relationship Notes Export in PDF
**Status:** Done | **Completed:** 2026-02-20 (v1.0)
Notes page appended to PDF when any relationship has a non-empty note. Each entry shows name — note text, wrapped to page width.

### #011 - Coachee Name on Hub Node (Full Name)
**Status:** Done | **Completed:** 2026-02-20 (v1.1)
`hubLabelLines()` supports names up to ~14 chars with natural two-line word wrap (splits at first space ≤9 chars; hard split at char 7 otherwise). Font size 10px for two-line; single-line sizes unchanged.

---

## Active Ideas

### #004 - Session Persistence (localStorage)
**Status:** Approved (v2.0) | **Added:** 2026-02-20
**Source:** Prototype review — original HTML prototype had local save/load

Auto-save the current session to localStorage on every change. Restore on page load with a "Resume last session" prompt. Prevents data loss when the browser is accidentally closed during a coaching session.

Implementation notes:
- Serialize `SessionState` to JSON on every `setState`
- On mount, check localStorage; if found, offer "Resume" or "Start fresh"
- No backend required for this level of persistence

---

### #005 - Cloud Save / Share Link
**Status:** Approved (v2.0) | **Added:** 2026-02-20
**Source:** Prototype review — original had Supabase backend with share codes

Save a map to the cloud and generate a short share code (e.g., 6-char alphanumeric). Coach can share URL with coachee or access across devices.

Implementation notes:
- Supabase infrastructure already existed in original prototype (`index-cloud.html`)
- Share code resolves to a read-only snapshot (not live session)
- Privacy: maps should be anonymous by default (no login required)
- Consider TTL on shared maps (e.g., expire after 30 days)

---

### #006 - Version History / Longitudinal Tracking
**Status:** Approved (v3.0) | **Added:** 2026-02-20
**Source:** Prototype review — original had auto-save + manual save with labels

Allow coaches to save named snapshots ("Session 1 — March", "Session 3 — May") and compare two snapshots side-by-side. Most powerful use case: showing coachee how their map changed over 3-6 months.

Implementation notes:
- Depends on #004 (persistence) or #005 (cloud) for storage
- Comparison view: two maps side-by-side, or overlay with diff colouring
- Manual "Save snapshot" button with optional label
- Version list modal with restore and compare actions

---

### #008 - Context-Sensitive Coaching Questions
**Status:** Approved (v3.0) | **Added:** 2026-02-20
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

## Deferred Ideas

### #001 - Dark Mode Support
**Status:** Deferred | **Added:** 2026-01-01 | **Deferred:** 2026-02-20
**Source:** Common UX expectation
**Value:** Low — coaching sessions are typically in well-lit office environments.
**Effort:** Medium-high — all components use inline hex values; full refactor needed to use CSS variables throughout.

**Trigger to revisit:** Coach or coachee explicitly requests it, OR usage data surfaces sessions in low-light environments.

**Note:** CSS custom property tokens are in place in `globals.css` (`@theme inline`). The infrastructure is ready; the effort is converting ~15 components from inline hex to CSS var references.

---

## Rejected Ideas

(None yet)

---

## Document History

- 2026-01-01: Created with initial seed ideas
- 2026-02-20: Added #D01–#D06 (implemented), #004–#011 from prototype review + focus group
- 2026-02-20: Updated — #002, #003, #007, #009, #010, #011 moved to Done (v1.1/v1.2). #001 moved to Deferred with trigger condition. #004–#006, #008 updated to Approved status with target version.
