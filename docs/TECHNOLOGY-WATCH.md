# Technology Watch

**Purpose:** Track technologies under evaluation for potential future adoption.
**Review Cadence:** Check during major iteration planning (Phase transitions).
**Central Registry:** ~/dev/infrastructure/dev-env-docs/IDEAS-BACKLOG.md

---

## Watched Technologies

### A2UI (Agent-to-User Interface)
**Status:** Watching | **Added:** 2026-01-01 | **Last Reviewed:** 2026-01-01

**What:** Google's framework for AI agents to generate UIs via declarative JSON specification. Security-first (whitelist component catalog), framework-agnostic (React, Flutter, Lit, Angular).

**Central Evaluation:** DEC-037, IDEA-027 in ~/dev/infrastructure/dev-env-docs/

**Relevance to This Project:**

| Feature | A2UI Applicability | Priority |
|---------|-------------------|----------|
| AI-powered insights (Phase 2) | High - dynamic visualization of AI analysis | Medium-High |
| Coach sharing | Medium - dynamic input forms for coach feedback | Medium |
| Core visualization | Low - already built with D3.js | Low |

**Project-Specific Use Cases:**
1. **Dynamic insight panels:** AI agent generates visualization recommendations, A2UI renders appropriate chart type
2. **Adaptive coach forms:** Different coaches get tailored input interfaces based on their specialty
3. **Progressive disclosure:** Complex valence data shown incrementally based on user expertise level

**Trigger to Adopt:**
- [ ] Starting Phase 2 implementation with AI-powered insights
- [ ] A2UI reaches v1.0 stable release
- [ ] Need for agent-generated dynamic dashboards arises
- [ ] Current React component approach becomes limiting for AI-driven features

**Resources:**
- https://a2ui.org/
- https://github.com/google/A2UI
- Blog: https://developers.googleblog.com/introducing-a2ui-an-open-project-for-agent-driven-interfaces/

**Notes:**
- Current version: v0.8 (public preview)
- Protocol stack context: A2UI (UI spec) sits above AG-UI (events) and A2A (agent-agent)
- Would complement existing MCP infrastructure for agent-driven features

---

## Review Process

When starting a new phase or major iteration:

1. Check this file for watched technologies
2. Evaluate if any triggers have been met
3. If adopting, create an ADR in `docs/adr/` and update central tracking
4. Update "Last Reviewed" dates

---

## Document History

- 2026-01-01: Created with A2UI entry (per DEC-037, IDEA-027)
