# True Valence Mapper — Roadmap

**Last Updated:** 2026-02-20
**Reference:** [IDEAS.md](./IDEAS.md) for full idea inventory | [ISSUES.md](./ISSUES.md) for bugs/gaps

---

## Versioning Convention

- **v1.x** — Iterative improvements to the current single-session model. No backend. No login.
- **v2.x** — Introduces persistence (localStorage or cloud). Sessions survive browser close.
- **v3.x** — Longitudinal tracking. Multiple sessions per coachee. Comparison views.

---

## Current: v1.0 — Deployed ✅

**Status:** Live at https://v1-rhart696s-projects.vercel.app
**Shipped:** 2026-02-20

Core coaching tool — single session, no backend.

| Feature | Notes |
|---------|-------|
| Hub-and-spoke SVG map | Adaptive ellipse, 1–25 nodes |
| Bidirectional scoring | Outbound + inbound per relationship, click-to-cycle |
| Arrow dash patterns | WCAG 1.4.1 — colour + pattern both encode score |
| Persistent legend | Always-visible score key on canvas |
| Score pills + right-click reset | In panel and on canvas |
| Relationship notes | Per-person notes with 2-line preview |
| Coachee name personalisation | Updates hub label and PDF filename |
| Scored/total counter | "{n}/{total} ↗↙" in panel header |
| Inline name edit | Pencil icon per row, Enter/Escape |
| Insights panel | Mapped / Strong / Asymmetric / Low — live metrics |
| Demo data button | "Load example map" — 7-person pre-scored map |
| Export PDF | Personalised filename, map only |
| Back to map / Start new session | Full session preserved after export |

---

## Next: v1.1 — Quick Wins

**Target:** 1–2 sessions
**Theme:** Polish the single-session experience before adding persistence.

| # | Feature | Idea | Effort | Value | Notes |
|---|---------|------|--------|-------|-------|
| 1 | **Notes in PDF export** | #010 | Low | High | Append per-relationship notes below the map in the PDF — currently notes are lost on export |
| 2 | **Export map as image (PNG)** | #002 | Low | Medium | Serialise existing SVG → PNG via canvas; useful for pasting into slide decks |
| 3 | **Coachee name on hub — fit more text** | #011 | Low | Medium | Current truncation at 6 chars feels tight; explore wrapping or initials+tooltip |
| 4 | **Print/print-to-PDF fallback** | #009 | Low | Low | `window.print()` + print stylesheet as a no-JS-dependency fallback |

---

## v1.2 — Accessibility & Onboarding

**Target:** 2–3 sessions
**Theme:** First-time experience and keyboard users.

| # | Feature | Idea | Effort | Value | Notes |
|---|---------|------|--------|-------|-------|
| 1 | **Welcome onboarding slides** | #007 | Medium | High | 3-slide first-visit modal: What is TVM / How to score / What to do with the map. Show once; skippable. |
| 2 | **Keyboard navigation on canvas** | #003 | Medium | Medium | Tab through nodes, Space/Enter to cycle score, Escape to deselect |
| 3 | **Dark mode** | #001 | Medium | Low | CSS custom properties already in place; respect `prefers-color-scheme` |

---

## v2.0 — Session Persistence

**Target:** 3–4 sessions
**Theme:** Sessions survive browser close. No login required.

This is the most impactful single upgrade for real coaching use — currently, closing the tab loses everything.

| # | Feature | Idea | Effort | Value | Notes |
|---|---------|------|--------|-------|-------|
| 1 | **Auto-save to localStorage** | #004 | Medium | Critical | Serialise `SessionState` on every change. On mount: detect saved state, offer "Resume" or "Start fresh". |
| 2 | **Cloud save + share link** | #005 | High | High | Supabase (infrastructure existed in HTML prototype). Save map, generate 6-char share code. Anonymous by default, 30-day TTL. |

**Dependency:** #005 (cloud) depends on #004 (local) being solid first — local persistence is the simpler and more private option for most coaching sessions.

---

## v3.0 — Longitudinal Tracking

**Target:** Future — after v2.0 is validated in real sessions
**Theme:** "How has this map changed over 3 months?"

| # | Feature | Idea | Effort | Value | Notes |
|---|---------|------|--------|-------|-------|
| 1 | **Named session snapshots** | #006 | High | High | Save named versions ("Session 1 — March"). Manual "Save snapshot" button with optional label. |
| 2 | **Session comparison view** | #006 | High | High | Two maps side-by-side, or overlay with diff colouring. The signature longitudinal feature. |
| 3 | **Context-sensitive coaching questions** | #008 | High | Speculative | Pattern-triggered questions (asymmetric, bilateral low, etc.). Requires careful copy authorship; risk of feeling generic. Validate with coaches before building. |

---

## Out of Scope (for now)

| Feature | Reason |
|---------|--------|
| User accounts / login | Adds friction and privacy risk. Anonymous sessions preferred for coaching context. |
| Real-time collaboration | Two people editing same map simultaneously — not a coaching use case. |
| Mobile app (native) | Web is sufficient; no install barrier is a feature. |
| AI-generated relationship insights | Needs authoritative coaching input first; #008 (coaching questions) is the lighter-weight precursor. |

---

## Priority Rationale

The ordering is driven by three factors:
1. **Coaching session realism** — What breaks a real coaching use of the tool today? (Answer: data loss on close → v2.0 persistence is the most impactful upgrade.)
2. **Effort-to-value ratio** — v1.1 quick wins ship fast and add visible polish.
3. **Dependency order** — Don't build version history (#006) before basic persistence (#004) is stable.

---

## Document History

- 2026-02-20: Created. Based on IDEAS.md inventory and cross-version UX review.
