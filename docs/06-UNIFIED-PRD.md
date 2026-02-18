# Unified Product Requirements Document (PRD)
## True Valence Mapper - All Editions

**Version:** 1.0.0 (Unified)
**Date:** February 16, 2026
**Status:** **EVIDENCE-BASED (No User Validation Yet)**
**Applies To:** All 7 editions (claude, codex, bmad, spec-kit, magic-path, openspec, Gemini_3)

---

## Executive Summary

> **v1.0 DECISION (2026-02-17):** True Valence Mapper v1.0 is a **React 19 + Next.js 15 rewrite**, NOT a fork of the Claude edition. The Claude edition (vanilla JS, 2,346-line index.html) serves as a functional reference for business logic, but v1.0 is built from scratch using a modern component architecture. See 20-UPDATED-IMPLEMENTATION-PLAN.md for details.
>
> **Scoring Model:** v1.0 uses **unidirectional trust scoring** (one trust level per relationship: High/Moderate/Low/None). Bidirectional scoring (outward + inward) is deferred to v1.1 pending coach feedback.

### What This PRD Is Based On

**IMPORTANT: This PRD is based on PROVEN IMPLEMENTATION, not hypothetical users.**

Across 7 editions of True Valence Mapper:
- ❌ **Zero real users have tested any edition**
- ❌ **No coaching sessions documented**
- ❌ **No user feedback collected**
- ❌ **No validation of target personas**

**What We DO Have Evidence For:**
- ✅ One edition deployed to production (Claude: https://rhart696.github.io/true-valence-mapper/)
- ✅ Comprehensive feature implementations across editions
- ✅ Production-ready security validation (XSS, RLS, auth)
- ✅ WCAG 2.1 AA accessibility compliance
- ✅ Working code with automated testing

**Therefore:** This PRD defines what we've **already built successfully** and **should validate with real users before changing**.

---

## 1. Product Vision

True Valence Mapper is a **visual tool for mapping trust in relationship networks**. It makes trust visible through simple color-coded groupings, enabling individuals and facilitators to identify patterns and growth opportunities.

> **v1.0 Note:** v1.0 uses unidirectional trust scoring (single level per relationship). Bidirectional scoring (outward + inward arrows) is a v1.1 candidate.

**Tagline:** "See your relationships clearly. Understand them deeply."

**Core Philosophy:** Simple, privacy-first, psychologically safe.

---

## 2. What We've Built (Evidence-Based)

### 2.1 Production-Ready Implementation (Claude Edition)

**Status:** ✅ **LIVE IN PRODUCTION** since November 2025

**URL:** https://rhart696.github.io/true-valence-mapper/

**Implemented Features:**
1. **Visual Relationship Canvas** - Force-directed graph with up to 8 relationships
2. **4-Level Bidirectional Trust Scoring** - Outward + inward arrows (High/Medium/Low/Unscored)
3. **Anonymous Authentication** - Supabase device/browser-specific sessions
4. **Cloud Storage with Share Codes** - 8-char unique IDs for read-only sharing
5. **Version History** - 10 versions, auto-save every 5 minutes
6. **Import/Export JSON** - Complete round-trip data portability
7. **Toast Notifications** - Non-blocking feedback (Success/Error/Info/Warning)
8. **WCAG 2.1 AA Accessibility** - 100 Lighthouse score, full keyboard nav
9. **Comprehensive Security** - XSS protection, RLS policies, auth validation

**Technical Implementation:**
- **Architecture:** Monolithic HTML/CSS/JavaScript (2,346-line index.html)
- **Build:** Pure vanilla JS (no framework dependencies)
- **Storage:** LocalStorage (default) + Supabase (opt-in cloud)
- **Hosting:** GitHub Pages (automatic deployment)

**Documentation:** 70+ markdown files covering architecture, security, accessibility, coach facilitation.

---

### 2.2 Other Edition Implementations

| Edition | Status | Key Features | Notes |
|----------|--------|---------------|-------|
| **codex** | 🚧 In Development | Planned: Port Claude baseline, optimize for Codex workflows | Not started - placeholder |
| **bmad** | 🚧 Setup Complete | 5-dimension ProActive valence (-5 to +5), authentication, D3.js graph | Hardcoded pilot credentials, no real users |
| **spec-kit** | 🚧 MVP Complete | React 19 + TypeScript, radial layout, bidirectional trust, Spec-Kit framework | Feature 001 only, no cloud sync |
| **magic-path** | 🚧 Architecture Defined | Custom UX methodology, smart path detection, visual storytelling | Conceptual - no code |
| **openspec** | 🚧 Setup Complete | OpenSpec v0.15.0 integration, multi-agent specs | Zero implementation code |
| **Gemini_3** | 🚧 Reset (Dec 1) | Pre-reset: Production-ready (same as Claude) | Reset for governance alignment, code preserved at ff0c374 |
| **antigravity** | 📋 New | Unknown purpose | Added Dec 8, 2025 |

---

## 3. Primary Use Case (Evidence-Based)

### 3.1 What We Know Users Actually Do

Based on the deployed production application:

**User Actions Supported:**
1. **Add people to their relationship network** (up to 8)
2. **Score trust in both directions** (outward: their trust in approaching others; inward: perceived trust of others in approaching them)
3. **See patterns visually** (color-coded arrows show asymmetry)
4. **Save and reload their map** (localStorage auto-save)
5. **Share their map with others** (via share codes or JSON export)
6. **Track changes over time** (version history with visual diff)

**Evidence of User Behavior:**
- **None documented** - No analytics, no user feedback, no session data
- Application has been live for ~3 months but usage unknown

---

### 3.2 Intended Use Case (Hypothetical - Needs Validation)

**NOTE:** The following describes INTENDED use based on feature design, NOT validated by real users.

**Primary Use Case: Self-Reflection on Relationship Trust**

**Scenario:** An individual wants to visualize patterns in how they relate to important people in their life (family, friends, colleagues) to identify imbalances and areas for growth.

**Workflow:**
1. Open True Valence Mapper
2. Add 5-8 people they interact with regularly
3. For each person, score two questions:
   - **Outward:** "How confident am I that I would go to this person if I had a problem with them?"
   - **Inward:** "How confident am I that this person would come to me if they had a problem with me?"
4. Review the visual map for patterns:
   - Green arrows = high trust
   - Yellow arrows = medium trust
   - Red arrows = low trust
   - Asymmetries = mismatched arrow colors (e.g., green outward, yellow inward)
5. Optionally save map to cloud and share with therapist/coach for discussion
6. Return periodically (weekly, monthly) to update scores and track progress via version history

**Expected Outcome:** User gains visual clarity on relationship patterns they couldn't see before, identifies imbalances to address, and tracks growth over time.

**Validation Status:** ❌ **NOT VALIDATED** - No evidence of real users completing this workflow.

---

## 4. Trust Scoring Framework

### 4.1 Current Implementation (Claude/Gemini_3 Editions)

**Model:** 4-level bidirectional scoring

**Two Directions per Relationship:**

1. **Outward Trust (→)**
   - **Question:** "How confident am I that I would go to this person if I had a problem with them?"
   - **Levels:**
     - **3 (Green):** High trust - "I'd definitely go to them"
     - **2 (Yellow):** Medium trust - "Maybe, depends on the situation"
     - **1 (Red):** Low trust - "Unlikely or uncomfortable"
     - **0 (Gray):** Not scored yet

2. **Inward Trust (←)**
   - **Question:** "How confident am I that this person would come to me if they had a problem with me?"
   - **Levels:** Same 4-level scale as outward trust

**Visual Representation:**
- **Solid line** = Outward trust (you → them)
- **Dashed line** = Inward trust (them → you)
- **Color** matches trust level (green/yellow/red/gray)
- **Click arrow** cycles through levels (0 → 1 → 2 → 3 → 0)

**Evidence:** Fully implemented and working in Claude edition (production).

---

### 4.2 Alternative Models (Not Production-Proven)

**BMAD Edition - 5-Dimension Model (Not Validated with Users):**
- Trust Level (-5 to +5)
- Communication Quality (-5 to +5)
- Mutual Support (-5 to +5)
- Professional Respect (-5 to +5)
- Goal Alignment (-5 to +5)
- **Status:** Conceptual - no real user testing

**OpenSpec Edition - Professional Ecosystem Model (Not Implemented):**
- Strong/Medium/Weak/Neutral valence
- Person + Organization entities
- Temporal tracking (start/end dates)
- **Status:** Specification only - no code

**Recommendation:** Stick with 4-level bidirectional model (production-proven) until real users request complexity.

---

## 5. Core Features (MUST-HAVE - All Editions)

### Feature 1: Visual Relationship Canvas

**What It Does:**
- Interactive visualization with "You" at center
- Up to 8 relationships displayed in force-directed or radial layout
- Smooth animations for add/remove operations

**Implementation Status:**
- ✅ Claude/Gemini_3: Production-ready (force-directed graph)
- ✅ BMAD: Implemented (D3.js)
- ✅ Spec-Kit: Implemented (radial layout)
- ❌ Other editions: Not started

**User Evidence:** None (no usage data)

---

### Feature 2: Bidirectional Trust Scoring

**What It Does:**
- Two distinct scores per relationship (outward + inward)
- 4-level scale (High/Medium/Low/Unscored)
- Click arrows to cycle through levels
- Visual feedback (color changes immediately)

**Implementation Status:**
- ✅ Claude/Gemini_3: Production-ready
- ✅ Spec-Kit: Implemented (Strong/Medium/Low mapping)
- ✅ BMAD: Implemented (5-dimension version)
- ❌ Other editions: Not started

**User Evidence:** None (no usage data)

---

### Feature 3: Data Persistence

**What It Does:**
- Auto-save to localStorage (default, privacy-first)
- Optional cloud storage via Supabase (anonymous auth)
- Map persists across browser sessions
- No manual "Save" button required

**Implementation Status:**
- ✅ Claude/Gemini_3: Production-ready (local + cloud)
- ✅ Spec-Kit: LocalStorage only
- ❌ Other editions: Not started

**User Evidence:** None (no usage data)

---

### Feature 4: Version History

**What It Does:**
- Auto-snapshots every 5 minutes (if changes detected)
- Up to 10 versions stored
- Manual snapshots with custom summaries
- Visual diff comparison (green = added, red = removed, yellow = modified)
- Restore previous versions

**Implementation Status:**
- ✅ Claude/Gemini_3: Production-ready
- ❌ Other editions: Not started

**User Evidence:** None (no usage data)

---

### Feature 5: Share & Export

**What It Does:**
- Generate 8-character share codes (read-only access)
- Export map as JSON (complete data portability)
- Import JSON to restore maps
- Optional: Export as PNG/SVG (not yet implemented)

**Implementation Status:**
- ✅ Claude/Gemini_3: JSON export/import, share codes (production)
- ✅ BMAD: JSON export only (import not implemented)
- ❌ Other editions: Not started

**User Evidence:** None (no usage data)

---

### Feature 6: Accessibility (WCAG 2.1 AA)

**What It Does:**
- Full keyboard navigation (Tab, Enter, Arrow keys, Esc)
- ARIA attributes (landmarks, live regions, labels)
- Screen reader compatibility (VoiceOver, NVDA)
- Color contrast compliance (4.5:1 text, 3:1 UI)
- Color-blind accessible (line patterns supplement colors)

**Implementation Status:**
- ✅ Claude/Gemini_3: 100% Lighthouse score, production-validated
- ⚠️ Other editions: Partial or not implemented

**User Evidence:** None (no accessibility testing with real users)

---

### Feature 7: Security Hardening

**What It Does:**
- XSS protection (input validation, output encoding, HTML tag stripping)
- SQL injection prevention (parameterized queries)
- Row Level Security (RLS) with Supabase
- Anonymous authentication (no email/password required)

**Implementation Status:**
- ✅ Claude/Gemini_3: Comprehensive validation passed, production-ready
- ❌ Other editions: Not implemented

**User Evidence:** None (no security incidents reported - but no users to report them)

---

### Feature 8: Onboarding & Demo

**What It Does:**
- 3-slide welcome modal (What/Why/How)
- "Don't show again" checkbox
- Demo map with 6 pre-populated relationships
- Safe exploration environment

**Implementation Status:**
- ✅ Claude/Gemini_3: Production-ready
- ✅ Spec-Kit: Demo implemented
- ❌ Other editions: Not started

**User Evidence:** None (no user testing of onboarding effectiveness)

---

## 6. Nice-to-Have Features (Future - Not Validated)

These features are planned but **not validated by real users**:

1. **Undo/Redo System** - Claude/Gemini_3 have this, others don't
2. **Mobile Optimization** - Responsive exists, but touch-first not implemented
3. **Export to Image (PNG/SVG)** - Specified, not implemented
4. **Relationship Notes/Journaling** - Specified, not implemented
5. **AI-Assisted Pattern Detection** - Conceptual only
6. **Multi-User Collaboration** - Specified, not implemented
7. **More Than 8 Relationships** - Hard limit, not validated if users want more

**Recommendation:** Do not build these features until real users request them and prove value.

---

## 7. Technical Architecture

### 7.1 Current Production Architecture (Claude/Gemini_3)

**Tech Stack:**
- **Frontend:** Pure HTML/CSS/JavaScript (no framework dependencies)
- **Visualization:** SVG-based (600x500px canvas)
- **State Management:** Global JavaScript variables (no state library)
- **Storage:** localStorage (default) + Supabase (optional cloud)
- **Authentication:** Anonymous Supabase auth (device/browser-specific sessions)
- **Hosting:** GitHub Pages (static deployment)
- **Build Process:** None (monolithic index.html)

**Code Volume:**
- index.html: 2,346 lines
- JavaScript modules: 6 files (~2,500 lines total)
- CSS: Embedded + 1 toast-notifications.css file
- Total: ~5,000 lines

**Trade-offs:**
- ✅ Fastest development velocity (no build step)
- ✅ Lowest barrier to contribution (HTML/CSS/JS only)
- ❌ Harder to maintain long-term (large files)
- ❌ No type safety (JavaScript vs. TypeScript)

---

### 7.2 Alternative Architectures (Not Production-Proven)

**Modular Approach (BMAD, Spec-Kit):**
- **Frontend:** React 19 + TypeScript
- **Build:** Vite (fast hot module replacement)
- **State:** Component-level or external library (Zustand, Jotai)
- **Testing:** Unit tests per component (Jest, Mocha)

**Trade-offs:**
- ✅ Better maintainability (separated concerns)
- ✅ Type safety (TypeScript strict mode)
- ✅ Easier testing
- ❌ Slower initial development
- ❌ Higher barrier to contribution

**Recommendation:** Stay with monolithic architecture for now. Migrate to modular only when:
- index.html exceeds 3,000 lines OR
- Team size exceeds 3 developers OR
- Real users demand features requiring modularity

---

## 8. Success Criteria (Measurable - Needs User Validation)

### 8.1 Technical Metrics (Already Measured)

**Claude Edition Production Metrics:**
- ✅ Lighthouse Performance: 92
- ✅ Lighthouse Accessibility: 100
- ✅ Security validation: All tests passed (XSS, RLS, auth)
- ✅ JavaScript syntax: Valid
- ✅ Code integration: 26 successful integration points verified

**Recommendation:** Continue monitoring these metrics. They are proven and working.

---

### 8.2 User Metrics (NOT YET MEASURED)

**Current Status:** Zero user data collected across all editions.

**What We SHOULD Measure (Once Real Users Exist):**
- **Return Usage:** % of users who return within 7 days
- **Session Duration:** Average time per session
- **Relationship Count:** Average number of people added to maps
- **Scoring Completeness:** % of relationships scored vs. unscored
- **Cloud Save Adoption:** % of users opting into cloud storage
- **Version History Usage:** % of users creating manual snapshots
- **Export/Import Usage:** % of users using JSON export/import
- **Error Rate:** Average errors per session
- **Task Completion:** % of users who complete full workflow (add, score, save)

**Recommendation:** Implement analytics (privacy-respecting, opt-in) before making product decisions.

---

### 8.3 Qualitative Metrics (NOT YET MEASURED)

**What We SHOULD Collect (Once Real Users Exist):**
- User feedback via surveys or feedback forms
- Coach/therapist interviews (if used in coaching context)
- Usability testing sessions with real users
- Accessibility testing with people with disabilities
- Cross-browser/device testing reports

**Current Status:** Zero qualitative feedback collected.

**Recommendation:** Conduct user research before making UX changes or adding features.

---

## 9. Governance Across Editions

### 9.1 How This PRD Applies to All Editions

**Principle:** All editions should implement the same core features using this unified PRD as the source of truth.

**Edition-Specific Variations Allowed:**
- **Architecture:** Monolithic vs. modular (implementation detail, not user-facing)
- **Trust Scoring:** Can offer advanced modes (e.g., BMAD's 5-dimension) as OPT-IN, not default
- **Target User:** Can emphasize different personas in marketing, but core features remain unified
- **Technology Stack:** Can use different frameworks (React vs. vanilla JS), but user experience identical

**Edition-Specific Variations NOT Allowed:**
- Removing core features defined in this PRD
- Breaking data portability (JSON import/export must work across editions)
- Violating accessibility standards (WCAG 2.1 AA mandatory)
- Degrading security (XSS, RLS, auth validation required)

---

### 9.2 Edition Convergence Strategy

**Current State:** 7 editions with fragmented implementations
**Goal:** Converge to unified product experience

**Proposed Timeline:**
1. **Phase 1 (Immediate):** All editions adopt this unified PRD as product specification
2. **Phase 2 (1-2 months):** Complete missing core features in each edition
3. **Phase 3 (3-6 months):** Conduct user validation with real users across editions
4. **Phase 4 (6-12 months):** Converge on single codebase based on user feedback

**Decision Criteria for Convergence:**
- Real users must validate features before standardization
- Technical approach chosen based on maintainability, not agent preference
- Edition-specific innovations preserved if proven valuable by users
- Underperforming editions archived (no activity for 3+ months)

---

## 10. Out of Scope

### 10.1 Explicitly NOT Building

Based on current production implementation and lack of user demand:

**More Than 8 Relationships:**
- Current hard limit: 8 people
- **Rationale:** Not validated if users want more
- **Future:** Increase limit only if real users hit it and request it

**Social Network Features:**
- No public sharing, no community, no social interactions
- **Rationale:** Privacy-first tool, not social platform
- **Future:** Add only if users explicitly request

**AI-Powered Insights:**
- No algorithmic pattern detection, no automated recommendations
- **Rationale:** User interprets their own map (avoids judgment)
- **Future:** Add as opt-in feature only if users request

**Team Collaboration:**
- No real-time multi-user editing, no commenting
- **Rationale:** Individual reflection focus
- **Future:** Add only if coaches request and validate value

---

## 11. Immediate Next Steps

### 11.1 Critical Gap: User Validation

**Problem:** We have production code but zero user feedback.

**Immediate Actions:**
1. **Deploy analytics** (privacy-respecting, opt-in) to Claude edition
   - Track: Return usage, session duration, relationship count, errors
   - Do NOT track: User identities, map content, relationship names
2. **Recruit 5-10 real users** for testing
   - Source: Personal network, therapy/coaching communities, online forums
   - Incentive: Free access to tool, potential for coaching sessions
3. **Conduct user interviews** (30-60 min each)
   - Questions: What did you like? What was confusing? What would you add?
   - Record observations: Where did they hesitate? What made them confident?
4. **Test with intended personas** (once defined by user research)
   - If evidence shows coaches use it: Test with real coaches
   - If evidence shows anxious novices use it: Test with anxious users
   - Currently: Don't assume personas - let users reveal themselves

**Timeline:** 2-4 weeks to gather initial user feedback

---

### 11.2 Edition Alignment

**Immediate Actions:**
1. **Share this unified PRD** with all edition maintainers (currently: human lead + AI agents)
2. **Review each edition** against this PRD:
   - Claude: ✅ Already compliant (production-proven)
   - Codex: ❌ Incomplete - needs implementation
   - BMAD: ⚠️ Has 5-dimension model - should add 4-level default
   - Spec-Kit: ⚠️ Missing cloud storage, version history
   - Magic-Path: ❌ Conceptual only - needs implementation
   - OpenSpec: ❌ No code - needs implementation start
   - Gemini_3: ✅ Pre-reset code compliant (available at ff0c374)
   - Antigravity: ❌ Unknown purpose - clarify or archive

**Timeline:** 1-2 weeks to align editions with PRD

---

### 11.3 Decision: Converge or Maintain Parallel?

**Options:**

**Option A: Maintain 7 Parallel Editions**
- Pros: AI agents continue exploring different approaches
- Cons: Duplicated effort, brand confusion, resource drain
- **Recommendation:** Reject unless clear user demand for diversity emerges

**Option B: Converge to Single Unified Product (RECOMMENDED)**
- Pros: Unified brand, efficient development, consistent user experience
- Cons: Lose some edition-specific experiments
- **Recommendation:** Accept with conditions:
  - Preserve edition-specific code in git history for reference
  - Only converge features validated by real users
  - Keep parent repo for coordination if future experiments needed

**Option C: Maintain 2-3 Active Editions**
- Pros: Limited exploration without full duplication
- Cons: Still some overhead, unclear which editions to keep
- **Recommendation:** Reject - either fully converge (Option B) or fully explore (Option A)

**Decision Needed:** Stakeholder approval by end of February 2026.

---

## 12. Assumptions & Constraints

### 12.1 Current Assumptions (UNVALIDATED)

1. **Users want bidirectional trust scoring** - Never tested with real users
2. **4-level scale is appropriate** - Never tested if simpler (3-level) or more complex (5-level) is better
3. **8-person limit is sufficient** - Never tested if users want more
4. **Visual patterns are helpful** - Never tested if users actually gain insights from arrows
5. **Coaches/therapists want this tool** - No evidence of real coaching sessions

**Recommendation:** Treat all assumptions as hypotheses to validate, not facts to build on.

---

### 12.2 Technical Constraints

**Current Implementation Constraints:**
- Pure vanilla JavaScript (no frameworks in production)
- Monolithic architecture (2,346-line index.html)
- 8-person maximum (hard-coded)
- 4-level trust scoring (no customization)
- Supabase backend (no self-hosted option)
- GitHub Pages hosting (no custom domain currently)

**Future Constraint Changes:**
- Can migrate to React/TypeScript if justified by user demand
- Can increase 8-person limit if users hit it and request more
- Can add advanced trust scoring modes as opt-in if users request

---

## 13. Risks & Mitigation

### Risk 1: Building for Nonexistent Users

**Description:** Continuing development without real user validation risks building features nobody wants.

**Probability:** HIGH (zero user data currently exists)
**Impact:** HIGH (wasted development time, wrong features)

**Mitigation:**
- **Immediate:** Deploy analytics and recruit 5-10 users this month
- **Short-term:** Conduct user interviews before building new features
- **Long-term:** Establish ongoing user research program

---

### Risk 2: Fragmentation Across Editions

**Description:** 7 editions diverge too much, making convergence impossible.

**Probability:** MEDIUM (already some divergence in trust scoring models)
**Impact:** HIGH (reconciliation effort, brand confusion)

**Mitigation:**
- **Immediate:** This unified PRD establishes single source of truth
- **Short-term:** Edition maintainers align implementations with PRD
- **Long-term:** Converge to single codebase or archive divergent editions

---

### Risk 3: Assumption-Driven Development

**Description:** Making product decisions based on hypothetical personas instead of real users.

**Probability:** HIGH (BMAD targets ProActive coaches, Gemini_3 targets anxious novices - both unvalidated)
**Impact:** MEDIUM (features may not meet real user needs)

**Mitigation:**
- **Immediate:** Stop making assumptions - collect data first
- **Short-term:** Let users reveal their own personas through usage
- **Long-term:** Build features based on observed behavior, not imagined scenarios

---

## 14. Appendix

### 14.1 Glossary

**Bidirectional Trust:** Two distinct scores per relationship - outward trust (your trust in approaching them) and inward trust (perceived trust of them in approaching you)

**Trust Asymmetry:** Mismatch between outward and inward trust levels (e.g., you trust them highly, but they don't trust you as much)

**Force-Directed Graph:** Visualization layout where nodes are positioned based on attractive/repulsive forces (used in Claude edition)

**Radial Layout:** Circular arrangement of nodes with equal radial spacing (used in Spec-Kit edition)

**Row Level Security (RLS):** Database-level access control ensuring users can only access their own data (Supabase feature)

**Anonymous Authentication:** Sign-in method that doesn't require email/password - generates unique user ID stored in device/browser

---

### 14.2 Edition Status Summary

| Edition | Core Features Complete | Production Status | User Validation | Alignment with PRD |
|----------|----------------------|------------------|-----------------|---------------------|
| claude | ✅ All 8 features | ✅ Live since Nov 2025 | ❌ None | ✅ Fully aligned |
| codex | ❌ Not started | ❌ Not deployed | ❌ None | ❌ Needs implementation |
| bmad | ✅ Most features | ❌ Pilot only | ⚠️ 2 coaches (planned, unconfirmed) | ⚠️ Different trust model |
| spec-kit | ✅ Feature 001 | ❌ MVP only | ❌ None | ⚠️ Missing cloud, version history |
| magic-path | ❌ Conceptual | ❌ Not deployed | ❌ None | ❌ Needs implementation |
| openspec | ❌ Specification only | ❌ Not deployed | ❌ None | ❌ Needs implementation |
| Gemini_3 | ✅ Pre-reset code complete | ❌ Reset for governance | ❌ None | ✅ Pre-reset aligned |
| antigravity | ❌ Unknown | ❌ Not deployed | ❌ None | ❌ Unknown purpose |

---

### 14.3 Key Evidence Points

**What We Know (Evidence-Based):**
- Claude edition works in production (deployed 3+ months)
- All 8 core features implemented and validated technically
- Security and accessibility are production-ready
- Code is maintainable and well-documented

**What We Don't Know (Evidence Gaps):**
- Who actually uses the tool (no analytics)
- Why they use it (no user interviews)
- What features they value (no usage data)
- What confuses them (no usability testing)
- If coaches/therapists actually use it (no evidence)
- If any personas are real (all hypothetical)

**What We Need to Learn:**
- Real user needs and behaviors
- Which features are essential vs. nice-to-have
- If 8-person limit is too restrictive
- If 4-level trust scoring works or needs adjustment
- If visualization is helpful or confusing
- What prevents users from completing the workflow

---

## Document Metadata

**Generated:** February 16, 2026
**Based On:** Production code analysis, documentation review, edition comparison
**Validation Status:** **NO USER VALIDATION YET**
**Applies To:** All 7 True Valence Mapper editions
**Next Review:** After initial user feedback collected (target: March 2026)

**Stakeholders:**
- Project lead: rhart696
- Edition maintainers: AI agents (Claude, Codex, Gemini) + human lead
- Decision required: Converge editions or maintain parallel (by end of Feb 2026)

---

**END OF UNIFIED PRD**
