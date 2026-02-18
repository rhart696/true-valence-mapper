# Product Development Artifact Hierarchy

**Purpose**: Define all artifacts a high-end product development team produces from project commencement through feature set definition. Each artifact is designed to be distributed to different AI agents for parallel development.

**Target Timeline**: 1 day v1.0 MVP implementation (2026-02-16)

**Context**: True Valence Mapper - Professional facilitation tool for ProActive coaches working with executive/senior leader coachees.

---

## Artifact Overview

| Phase | Artifact | Owner Agent | Dependencies | Output |
|-------|----------|-------------|--------------|--------|
| 1. Vision | Vision Statement | Claude | None | 1-page vision |
| 1. Vision | Strategic Brief | Claude | Vision Statement | 2-page brief |
| 2. Customer | Value Proposition Canvas | Codex | Strategic Brief | Canvas + analysis |
| 2. Customer | Primary User Persona | Codex | Strategic Brief | User profile |
| 2. Customer | User Journey Map | Gemini | User Persona | Journey flow |
| 3. Requirements | PRD | Claude | All Phase 2 | Full requirements |
| 3. Requirements | User Stories | Claude | PRD | Story deck |
| 3. Requirements | NFRs | Gemini | PRD | NFR spec |
| 4. Design | Design System | Codex | Value Canvas + Vision | Design language |
| 4. Design | UX Flows | Gemini | User Journey + PRD | Flow diagrams |
| 4. Design | Accessibility Spec | Claude | Design System | WCAG checklist |
| 5. Architecture | Tech Stack Decision | Claude | NFRs + PRD | Stack rationale |
| 5. Architecture | Architecture Diagram | Claude | Tech Stack | System diagram |
| 5. Architecture | API Contract | Gemini | PRD + Architecture | Interface spec |
| 6. Implementation | Implementation Plan | Claude | All artifacts | Dev plan |
| 6. Implementation | QA Strategy | Gemini | PRD + NFRs | Test plan |
| 6. Implementation | Rollback Plan | Claude | Architecture | Safety net |

---

## Phase 1: Vision & Strategy

### 1.1 Vision Statement

**Purpose**: Inspiring 1-paragraph articulation of what we're building and why.

**Content**:
- What: Clear product identity (not "a tool for coaches" but "the primary visual facilitation tool for ProActive coaches")
- Who: Primary audience (ProActive Certified Coaches)
- Why: Core value delivered (transformative insight through structured reflection)
- Aspiration: Bold, memorable statement of future impact

**Example**:
> "True Valence Mapper is the definitive visual facilitation tool for ProActive Certified Coaches, enabling executive and senior leader coachees to achieve breakthrough insights through structured reflection on trust dynamics. We transform complex relationship patterns into actionable wisdom through beautiful, intuitive visual experiences that elevate the coaching conversation."

**Success Criteria**:
- Clear and memorable
- Differentiates from competitors
- Inspires both team and users
- Can be stated in one breath

**AI Agent**: Claude (strongest at synthesis and language)

**Deliverable**: `/home/ichardart/dev/projects/true-valence-mapper/docs/01-VISION-STATEMENT.md`

---

### 1.2 Strategic Brief

**Purpose**: 2-page strategic context document for all downstream decisions.

**Content**:
- **Business Objectives**
  - Primary objective: Establish product-market fit with ProActive coaches
  - Secondary objectives: Build user trust, generate referral network
  - Success metrics: 5 coaching sessions completed, positive coach feedback
- **Market Context**
  - Target market size: ProActive Certified Coaches (1,000+)
  - Competitive landscape: Generic coaching tools, whiteboards
  - Differentiation: Polished aesthetic, purpose-built for trust mapping
- **Constraints**
  - Timeline: Complete v1.0 in 1 day (2026-02-16)
  - Budget: Existing Claude edition foundation
  - Scope: Session-only workflow, PDF export, no persistence
  - Resources: Multi-agent AI development team
- **Success Definition**
  - Coach can facilitate full session without technical friction
  - Coachee experiences breakthrough moment
  - Visual polish meets high-end expectations

**AI Agent**: Claude (strongest at synthesis and strategy)

**Deliverable**: `/home/ichardart/dev/projects/true-valence-mapper/docs/02-STRATEGIC-BRIEF.md`

**Dependencies**: Vision Statement

---

## Phase 2: Customer & Market Understanding

### 2.1 Value Proposition Canvas

**Purpose**: Map jobs-to-be-done, pains, and gains for both coaches and coachees.

**Content**:
- **Customer Jobs (Functional)**
  - Facilitate trust mapping session
  - Guide coachee through reflection
  - Capture session output
- **Customer Jobs (Emotional)**
  - Feel prepared and professional
  - Deliver breakthrough moments
  - Build credibility with coachee
- **Customer Jobs (Social)**
  - Demonstrate innovative facilitation
  - Differentiate from other coaches
- **Pains (Coach)**
  - Ugly/unprofessional tools damage credibility
  - Technical friction disrupts coaching flow
  - Coachee disengages from session
- **Pains (Coachee)**
  - Confusing UI distracts from reflection
  - Uncomfortable with trust concept
  - Time wasted learning tool
- **Gains (Coach)**
  - Coachee breakthrough moments
  - Enhanced professional image
  - Repeat business/referrals
- **Gains (Coachee)**
  - Clear insight on trust patterns
  - Actionable takeaways
  - Positive experience

**AI Agent**: Codex (strongest at structured analysis)

**Deliverable**: `/home/ichardart/dev/projects/true-valence-mapper/docs/03-VALUE-PROPOSITION-CANVAS.md` (CREATED)

**Dependencies**: Strategic Brief

---

### 2.2 Primary User Persona

**Purpose**: Detailed profile of the primary user (ProActive Certified Coach).

**Content**:
- **Demographics**
  - Age: 35-55
  - Background: Corporate, HR, consulting
  - Experience: 5-20 years coaching
- **Psychographics**
  - Values: Professionalism, impact, growth
  - Goals: Build practice, deliver results, differentiate
  - Fears: Damaging credibility, wasting time, losing clients
- **Technical Proficiency**
  - Comfortable with modern tools
  - Low tolerance for bugs/friction
  - Expects polished design (no "beta" feel)
- **Context**
  - Facilitating 1-5 sessions/week
  - Working with executive/senior leader coachees
  - Time pressure: Sessions are 60-90 minutes
- **Behaviors**
  - Prepares thoroughly before sessions
  - Values tools that enhance credibility
  - Demands reliability and professionalism
- **Success Metrics**
  - Session completion without technical issues
  - Coachee expresses breakthrough insight
  - Re-engagement or referral

**AI Agent**: Codex (strongest at structured user profiles)

**Deliverable**: `/home/ichardart/dev/projects/true-valence-mapper/docs/04-PRIMARY-USER-PERSONA.md` (CREATED)

**Dependencies**: Strategic Brief

---

### 2.3 User Journey Map

**Purpose**: End-to-end experience mapping for coach-facilitated session.

**Content**:
- **Pre-Session Phase** (Coach perspective)
  - User Story: As a coach, I want to prepare before the session so I can focus entirely on facilitation
  - Actions: Open tool, review trust scoring framework, prepare device setup
  - Touchpoints: Landing page, tool interface, trust definitions
  - Emotions: Confident → Prepared → Ready
  - Pain Points: Confusing onboarding, unclear trust definitions
  - Opportunities: Quick-start guide, trust definition reference
- **During Session Phase** (Joint perspective)
  - User Story: As a coach, I want to guide coachee through scoring with minimal friction so the conversation flows naturally
  - Actions: Present relationship names, guide scoring, explain trust dimensions
  - Touchpoints: Scoring interface, trust definition pop-up, visual canvas
  - Emotions: Engaged → Reflective → Curious
  - Pain Points: Complex UI, unclear instructions, slow performance
  - Opportunities: Intuitive scoring, contextual definitions, real-time visualization
- **Post-Session Phase** (Coach perspective)
  - User Story: As a coach, I want to export and share results with coachee so they have a takeaway
  - Actions: Generate PDF, send to coachee, discuss insights
  - Touchpoints: Export button, PDF generation, email
  - Emotions: Satisfied → Accomplished → Professional
  - Pain Points: Export fails, poor PDF quality, no clear action items
  - Opportunities: One-click export, high-quality PDF, session summary

**AI Agent**: Gemini (strongest at flows and sequences)

**Deliverable**: `/home/ichardart/dev/projects/true-valence-mapper/docs/05-USER-JOURNEY-MAP.md`

**Dependencies**: Primary User Persona

---

## Phase 3: Product Requirements

### 3.1 Product Requirements Document (PRD)

**Purpose**: Complete specification of product requirements.

**Content**:
- **Product Overview**
  - Vision statement
  - Target users
  - Primary use case
- **Feature Requirements** (v1.0 MVP)
  - Visual canvas with flexible 12-25 relationship cap
  - 4-level trust scoring (High, Moderate, Low, None)
  - Trust definitions pop-up during scoring
  - PDF export of completed canvas
  - Session-only workflow (no persistence)
  - Polished visual design
- **Out of Scope**
  - User accounts/authentication
  - Session history/persistence
  - Sharing via URL/code
  - Multi-session tracking
  - Analytics
  - Cloud storage
- **Functional Requirements**
  - FR-001: Coach can name 12-25 relationships
  - FR-002: Coach can assign trust level to each relationship
  - FR-003: Coach can view trust definitions during scoring
  - FR-004: Coach can export completed canvas as PDF
  - FR-005: Visual design meets high-end aesthetic standards
- **Non-Functional Requirements** (see NFR spec)
- **Acceptance Criteria**
  - Coach can complete full session in 30 minutes
  - Visual polish meets "high-end" standard
  - PDF export works on first try
  - No crashes or errors during session
- **Success Metrics**
  - 5 coaching sessions completed
  - Positive coach feedback (NPS > 8)
  - Zero critical bugs reported

**AI Agent**: Claude (strongest at comprehensive specs)

**Deliverable**: `/home/ichardart/dev/projects/true-valence-mapper/docs/06-PRD.md` (CREATED)

**Dependencies**: All Phase 2 artifacts

---

### 3.2 User Story Deck

**Purpose**: User stories with acceptance criteria for development.

**Content**:
- **Story 1: Name Relationships**
  - As a coach, I want to name relationships so I can map my coachee's trust landscape
  - Acceptance:
    - Can add 12-25 relationships
    - Can edit/remove relationships
    - Visual count shows remaining capacity
- **Story 2: Score Trust**
  - As a coach, I want to score trust level so coachee sees relationship patterns
  - Acceptance:
    - 4-level scoring (High, Moderate, Low, None)
    - Visual differentiation for each level
    - Trust definitions available on-demand
- **Story 3: View Canvas**
  - As a coach, I want to see visual representation so coachee gains insight
  - Acceptance:
    - Relationships displayed visually
    - Color-coded by trust level
    - Layout is intuitive and polished
- **Story 4: Export PDF**
  - As a coach, I want to export as PDF so coachee has a takeaway
  - Acceptance:
    - PDF generates in < 5 seconds
    - High-quality formatting
    - Includes all relationship data

**AI Agent**: Claude (strongest at user story formulation)

**Deliverable**: `/home/ichardart/dev/projects/true-valence-mapper/docs/07-USER-STORIES.md`

**Dependencies**: PRD

---

### 3.3 Non-Functional Requirements (NFR) Spec

**Purpose**: Performance, security, accessibility, and quality requirements.

**Content**:
- **Performance**
  - Page load: < 2 seconds
  - Scoring action: < 100ms response
  - PDF export: < 5 seconds
  - Canvas rendering: 60 FPS
- **Accessibility**
  - WCAG 2.1 AA compliance
  - Keyboard navigation fully supported
  - Screen reader compatibility
  - Color contrast minimum 4.5:1
- **Browser Support**
  - Chrome/Edge (latest 2 versions)
  - Safari (latest 2 versions)
  - Firefox (latest 2 versions)
  - Mobile responsive (iOS Safari, Chrome Android)
- **Security**
  - No user data storage (privacy-by-design)
  - HTTPS required in production
  - Input validation on all fields
  - XSS prevention (sanitized inputs)
- **Reliability**
  - 99.9% uptime during session (no crashes)
  - Graceful error handling
  - Clear error messages
- **Usability**
  - Zero learning curve for coaches
  - Intuitive scoring interaction
  - Clear visual hierarchy
  - Consistent terminology

**AI Agent**: Gemini (strongest at technical specs and cross-cutting concerns)

**Deliverable**: `/home/ichardart/dev/projects/true-valence-mapper/docs/08-NFR-SPEC.md`

**Dependencies**: PRD

---

## Phase 4: Design & UX

### 4.1 Design System Brief

**Purpose**: Define visual language and component specifications.

**Content**:
- **Color Palette** (Priority #1 per user interview)
  - Primary: Deep trust blue (#0052CC)
  - Secondary: Growth green (#00B87C)
  - Accent: Insight orange (#FF6B35)
  - Neutral: Professional grays (#F4F5F7, #091E42, #6B778C)
  - Usage rules: When to use each, color combinations
- **Typography** (Priority #2)
  - Headings: Inter Bold (24-32px)
  - Body: Inter Regular (14-16px)
  - Labels: Inter Medium (12-14px)
  - Line height: 1.5 for body, 1.2 for headings
  - Hierarchy: Clear visual hierarchy through size/weight
- **Iconography** (Priority #3)
  - Style: Outline icons, consistent stroke width
  - Trust levels: Custom icons for High/Moderate/Low/None
  - Actions: Chevron right for next, download for export, question for help
  - Source: Phosphor Icons (consistent set)
- **Spacing** (Priority #4)
  - Unit: 8px base
  - Component padding: 16px (small), 24px (medium), 32px (large)
  - Section spacing: 48px between major sections
  - Grid: 12-column, 16px gutters
- **Animation** (Priority #5)
  - Micro-interactions: 200ms ease-out
  - Page transitions: 300ms ease-in-out
  - Canvas updates: 150ms spring
  - Hover states: 100ms fade

**AI Agent**: Codex (strongest at design systems and specifications)

**Deliverable**: `/home/ichardart/dev/projects/true-valence-mapper/docs/09-DESIGN-SYSTEM.md`

**Dependencies**: Value Proposition Canvas + Vision Statement

---

### 4.2 UX Flow Documentation

**Purpose**: Screen-by-screen flow and interaction patterns.

**Content**:
- **Screen 1: Landing Page**
  - Purpose: Quick start for coach
  - Elements: Title, brief description, "Start Session" button
  - Flow: Click "Start" → Screen 2
- **Screen 2: Relationship Naming**
  - Purpose: Add relationships to map
  - Elements: Text input, relationship list, "Next" button (disabled until 12-25 names)
  - Flow: Add names → Click "Next" → Screen 3
  - Validation: Must be 12-25 relationships, no duplicates
- **Screen 3: Trust Scoring**
  - Purpose: Score trust level for each relationship
  - Elements: Relationship list, 4-level selector, trust definition pop-up
  - Flow: Select level → Repeat for all → Click "View Canvas" → Screen 4
  - Validation: All relationships must be scored
- **Screen 4: Visual Canvas**
  - Purpose: Display relationships visually
  - Elements: Relationship cards color-coded by trust level, spatial layout
  - Flow: View → Click "Export PDF" → Download → Done
  - Interaction: Hover to see details, click to edit (optional)
- **Screen 5: Trust Definitions (Modal)**
  - Purpose: Define each trust level
  - Elements: 4-level definitions, clear language
  - Flow: Open → Read → Close
  - Trigger: "What do these mean?" link on scoring screen

**AI Agent**: Gemini (strongest at flows and sequences)

**Deliverable**: `/home/ichardart/dev/projects/true-valence-mapper/docs/10-UX-FLOWS.md`

**Dependencies**: User Journey Map + PRD

---

### 4.3 Accessibility Standards

**Purpose**: WCAG compliance checklist and implementation guidance.

**Content**:
- **WCAG 2.1 Level AA Requirements**
  - Perceivable
    - [ ] Color contrast minimum 4.5:1 for text, 3:1 for large text
    - [ ] Text resizable up to 200% without loss of content
    - [ ] Images have alt text (decorative images marked as such)
  - Operable
    - [ ] All functionality available via keyboard
    - [ ] No keyboard trap
    - [ ] Clear focus indicators
    - [ ] Skip navigation link
  - Understandable
    - [ ] Page language identified
    - [ ] Error messages clearly associated with inputs
    - [ ] Labels clearly indicate purpose
  - Robust
    - [ ] Valid HTML5
    - [ ] ARIA roles where needed
    - [ ] Screen reader testing
- **Component-Level Checklist**
  - Buttons: Accessible name, keyboard focus, hover state
  - Inputs: Labels, error messages, keyboard navigation
  - Modals: Focus trap, escape key, close button
  - Color-based info: Non-color indicator (icon + text)
- **Testing Requirements**
  - Keyboard-only navigation test
  - Screen reader test (NVDA, VoiceOver)
  - Color blindness simulator test
  - Browser zoom test (200%)

**AI Agent**: Claude (strongest at compliance and checklists)

**Deliverable**: `/home/ichardart/dev/projects/true-valence-mapper/docs/11-ACCESSIBILITY-SPEC.md`

**Dependencies**: Design System

---

## Phase 5: Architecture & Technical Decisions

### 5.1 Tech Stack Decision

**Purpose**: Rationale for technology choices.

**Content**:
- **Frontend Framework**
  - Decision: React 19 with Next.js 15
  - Rationale:
    - Claude edition built on React/Next.js (existing foundation)
    - Server components for performance
    - Strong ecosystem and community
    - Excellent PDF export libraries (jsPDF, React-PDF)
- **UI Component Library**
  - Decision: Radix UI + Tailwind CSS
  - Rationale:
    - Radix: Unstyled, accessible primitives (perfect for custom design)
    - Tailwind: Utility-first, rapid development, consistent with Claude edition
    - Built-in accessibility (Radix)
- **PDF Export**
  - Decision: jsPDF + html2canvas
  - Rationale:
    - Client-side export (no server needed)
    - High-quality rendering
    - Widely used and battle-tested
    - Works with custom design system
- **State Management**
  - Decision: React Context + useState
  - Rationale:
    - Simple session-only workflow
    - No persistence required
    - Sufficient for 12-25 items
- **Alternatives Considered and Rejected**
  - Vue.js: Less familiar, no existing foundation
  - Angular: Overkill for simple session workflow
  - Vanilla JS: No component library, harder accessibility
- **Technical Constraints**
  - Single-page application (no routing complexity)
  - Client-side only (no backend)
  - No external dependencies (minimal bundle)

**AI Agent**: Claude (strongest at architectural decisions)

**Deliverable**: `/home/ichardart/dev/projects/true-valence-mapper/docs/12-TECH-STACK.md`

**Dependencies**: NFR Spec + PRD

---

### 5.2 Architecture Diagram

**Purpose**: Visual representation of system architecture.

**Content**:
- **System Overview**
  - Single-page React application
  - No backend (client-side only)
  - Static hosting (Vercel/Netlify)
- **Component Architecture**
  - App Container: Main application wrapper
  - Session State Manager: Context provider for session data
  - Screen Router: Simple conditional rendering (not full router)
  - Screens: Landing, Naming, Scoring, Canvas
- **Data Flow**
  1. User lands → App initializes session state
  2. Naming phase → Add relationships to state
  3. Scoring phase → Assign trust levels
  4. Canvas phase → Render visual from state
  5. Export phase → Generate PDF from canvas
- **Tech Stack Layers**
  - UI Layer: Radix UI components + custom design system
  - State Layer: React Context + hooks
  - Business Logic: Trust scoring rules, validation
  - Export Layer: jsPDF + html2canvas
- **Deployment Architecture**
  - Build: Next.js build (static export)
  - Host: Vercel (CDN)
  - Domain: Custom domain (to be configured)
  - SSL: Automatic (Vercel)

**AI Agent**: Claude (strongest at architecture)

**Deliverable**: `/home/ichardart/dev/projects/true-valence-mapper/docs/13-ARCHITECTURE-DIAGRAM.md`

**Dependencies**: Tech Stack Decision

---

### 5.3 API Contract

**Purpose**: Interface specifications (minimal for this project).

**Content**:
- **Note**: Client-side only, no external APIs
- **Internal Component APIs**
  - `useSessionState` hook
    - Input: None
    - Output: `{ relationships, trustLevels, currentStep }`
    - Actions: `addRelationship`, `setTrustLevel`, `nextStep`
  - `RelationshipList` component
    - Props: `{ relationships, onAdd, onRemove }`
    - Events: `onChange`, `onRemove`
  - `TrustScorer` component
    - Props: `{ relationship, onScore }`
    - Events: `onSelectLevel`
  - `VisualCanvas` component
    - Props: `{ relationships, trustLevels }`
    - Events: None (read-only display)
  - `PDFExporter` component
    - Props: `{ canvasRef }`
    - Events: `onSuccess`, `onError`
- **Data Structures**
  ```typescript
  interface Relationship {
    id: string;
    name: string;
  }

  interface TrustLevel {
    id: 'high' | 'moderate' | 'low' | 'none';
    label: string;
    definition: string;
  }

  interface SessionState {
    relationships: Relationship[];
    trustLevels: Record<string, TrustLevel>;
    currentStep: 'naming' | 'scoring' | 'canvas' | 'complete';
  }
  ```

**AI Agent**: Gemini (strongest at interface specifications)

**Deliverable**: `/home/ichardart/dev/projects/true-valence-mapper/docs/14-API-CONTRACT.md`

**Dependencies**: PRD + Architecture Diagram

---

## Phase 6: Implementation Planning

### 6.1 Implementation Plan

**Purpose**: Step-by-step development plan for 1-day timeline.

**Content**:
- **Timeline Overview**
  - Total: 1 day (8 hours)
  - Parallel: 2-3 agents working on different components
- **Phase 1: Setup (1 hour)**
  - Claude: Fork Claude edition, clean up unused code
  - Codex: Set up design system variables in Tailwind config
  - Gemini: Set up project structure for new components
- **Phase 2: Core Components (3 hours, parallel)**
  - Claude: RelationshipList component (naming screen)
  - Codex: TrustScorer component with definitions
  - Gemini: VisualCanvas component with layout
- **Phase 3: Integration (2 hours)**
  - Claude: Screen router and session state
  - Codex: Design system integration across components
  - Gemini: Testing and bug fixes
- **Phase 4: Polish (1 hour)**
  - Claude: PDF export integration
  - Codex: Visual polish and animations
  - Gemini: Accessibility review and fixes
- **Phase 5: QA & Deploy (1 hour)**
  - All agents: Cross-validation testing
  - Claude: Deploy to Vercel
  - Gemini: Final accessibility audit
- **Agent Responsibilities**
  - Claude: Orchestration, session state, export, deployment
  - Codex: Design system, visual components, polish
  - Gemini: UX flows, accessibility, testing
- **Deliverables per Phase**
  - Phase 1: Clean codebase, design system vars, project structure
  - Phase 2: 3 core components functional
  - Phase 3: Integrated user flow working
  - Phase 4: Polished, animated, accessible
  - Phase 5: Deployed, tested, verified

**AI Agent**: Claude (strongest at project planning and orchestration)

**Deliverable**: `/home/ichardart/dev/projects/true-valence-mapper/docs/15-IMPLEMENTATION-PLAN.md`

**Dependencies**: All artifacts

---

### 6.2 QA Strategy

**Purpose**: Testing approach to ensure quality.

**Content**:
- **Testing Levels**
  - Unit Tests: Individual components (50% coverage minimum)
  - Integration Tests: User flows (critical paths only)
  - E2E Tests: Full session flow (1-2 key scenarios)
  - Manual Testing: Visual polish, accessibility
- **Test Scenarios**
  - Happy Path: Complete session from start to PDF export
  - Edge Cases:
    - Exactly 12 relationships (minimum)
    - Exactly 25 relationships (maximum)
    - 18 relationships (middle range)
    - All same trust level
    - All different trust levels
- **Accessibility Testing**
  - Keyboard navigation full session
  - Screen reader test (VoiceOver)
  - Color contrast checker
  - Zoom to 200%
- **Performance Testing**
  - Page load time (< 2s)
  - Scoring response (< 100ms)
  - PDF export (< 5s)
  - 60 FPS canvas rendering
- **Browser Testing**
  - Chrome/Edge (latest)
  - Safari (latest)
  - Firefox (latest)
  - Mobile: iOS Safari, Chrome Android
- **Acceptance Criteria**
  - All user stories pass
  - All NFRs met
  - Zero critical bugs
  - Accessibility audit passes

**AI Agent**: Gemini (strongest at testing strategies and quality assurance)

**Deliverable**: `/home/ichardart/dev/projects/true-valence-mapper/docs/16-QA-STRATEGY.md`

**Dependencies**: PRD + NFR Spec

---

### 6.3 Rollback Plan

**Purpose**: Safety net if deployment fails or issues arise.

**Content**:
- **Pre-Deployment Checklist**
  - [ ] All acceptance criteria met
  - [ ] Accessibility audit passed
  - [ ] Performance benchmarks met
  - [ ] Cross-browser tested
  - [ ] PDF export verified
- **Deployment Rollback Triggers**
  - Critical bugs discovered post-deploy
  - Performance degradation > 50%
  - Accessibility regression
  - PDF export failure
- **Rollback Procedures**
  - Vercel: One-click rollback to previous deployment
  - Time to rollback: < 5 minutes
  - Impact: Users experience brief downtime (2-5 min)
- **Hotfix Process**
  - Identify issue (priority: P0 critical)
  - Create hotfix branch
  - Implement fix (target: < 1 hour)
  - Deploy hotfix
  - Verify fix
- **Communication Plan**
  - Internal: Notify team immediately
  - Users: Post-mortem if downtime > 30 min
  - Post-mortem: Document root cause, learnings

**AI Agent**: Claude (strongest at contingency planning)

**Deliverable**: `/home/ichardart/dev/projects/true-valence-mapper/docs/17-ROLLBACK-PLAN.md`

**Dependencies**: Implementation Plan + Architecture Diagram

---

## Artifact Distribution Matrix

### Which AI Agent Gets Which Artifact

| Artifact | Primary Agent | Secondary Review | Parallel Work? |
|----------|---------------|------------------|----------------|
| Vision Statement | Claude | Codex | ❌ Sequential |
| Strategic Brief | Claude | Gemini | ❌ Sequential |
| Value Proposition Canvas | Codex | Claude | ✅ Parallel with Persona |
| Primary User Persona | Codex | Claude | ✅ Parallel with Canvas |
| User Journey Map | Gemini | Claude | ❌ Sequential |
| PRD | Claude | Codex, Gemini | ❌ Sequential |
| User Stories | Claude | Codex | ❌ Sequential |
| NFR Spec | Gemini | Claude | ✅ Parallel with Design System |
| Design System | Codex | Claude | ✅ Parallel with NFR Spec |
| UX Flows | Gemini | Claude | ❌ Sequential |
| Accessibility Spec | Claude | Gemini | ❌ Sequential |
| Tech Stack Decision | Claude | Codex | ❌ Sequential |
| Architecture Diagram | Claude | Gemini | ❌ Sequential |
| API Contract | Gemini | Claude | ❌ Sequential |
| Implementation Plan | Claude | Codex, Gemini | ❌ Sequential |
| QA Strategy | Gemini | Claude | ✅ Parallel with Rollback |
| Rollback Plan | Claude | Gemini | ✅ Parallel with QA |

### Parallel Development Waves

**Wave 1 (Vision & Strategy)**
- Claude: Vision Statement, Strategic Brief
- Output: Strategic direction

**Wave 2 (Customer Understanding)**
- Codex: Value Proposition Canvas, Primary User Persona (parallel)
- Claude: Review and integrate
- Output: User-centered foundation

**Wave 3 (Requirements)**
- Claude: PRD, User Stories
- Gemini: NFR Spec (parallel with Design System)
- Codex: Design System (parallel with NFR Spec)
- Output: Complete requirements

**Wave 4 (Design & Architecture)**
- Gemini: UX Flows, API Contract
- Claude: Accessibility Spec, Tech Stack, Architecture
- Codex: Review design integration
- Output: Design and architecture

**Wave 5 (Planning)**
- Claude: Implementation Plan, Rollback Plan
- Gemini: QA Strategy (parallel)
- Codex: Review and validate
- Output: Ready for development

---

## Implementation Workflow

### How to Use This Artifact Hierarchy

1. **Start with Phase 1 (Vision & Strategy)**
   - Read Vision Statement and Strategic Brief
   - Align on product direction

2. **Create Phase 2 (Customer Understanding)**
   - Codex: Create Value Proposition Canvas
   - Codex: Create Primary User Persona
   - Review and iterate

3. **Build Phase 3 (Requirements)**
   - Claude: Create comprehensive PRD
   - Claude: Break down into User Stories
   - Gemini: Create NFR Spec in parallel

4. **Design Phase 4 (Design & Architecture)**
   - Codex: Create Design System
   - Gemini: Create UX Flows and API Contract
   - Claude: Create Accessibility Spec and Architecture

5. **Plan Phase 5 (Implementation)**
   - Claude: Create Implementation Plan and Rollback Plan
   - Gemini: Create QA Strategy
   - Review and validate

6. **Execute Development**
   - Follow Implementation Plan
   - Use artifacts as specifications
   - Cross-validate across agents

---

## Success Metrics for Artifacts

Each artifact is successful if:
- ✅ Clear and actionable (no ambiguity)
- ✅ Consistent with other artifacts (no contradictions)
- ✅ Enables development work (not just documentation)
- ✅ Reviewed by at least 2 agents (quality assurance)
- ✅ Aligned with 1-day timeline (scope control)

---

## Next Steps

1. **Review this artifact hierarchy**
2. **Assign primary ownership** for each artifact
3. **Create artifacts in order** (phases 1-6)
4. **Cross-validate** across agents
5. **Begin development** once all artifacts complete

---

**Document Version**: 1.0
**Last Updated**: 2026-02-16
**Status**: Ready for artifact creation
