# Product Requirements Document (Retrospective)
## True Valence Mapper - OpenSpec Edition

**Document Type:** Retrospective PRD (Tech-Agnostic)
**Version:** OpenSpec Edition (Specification Phase)
**Date:** December 10, 2025
**Author:** Generated from project state analysis

---

## 1. Executive Summary

### 1.1 Product Vision
True Valence Mapper (OpenSpec Edition) envisions a relationship ecosystem visualization tool that reveals hidden patterns in how people and organizations connect, evolve, and influence each other over time. The tool transforms complex, multi-dimensional relationship data into clear, actionable insights.

### 1.2 Problem Statement
**End-User Problem:** People and organizations exist within complex relationship ecosystems, but these networks are invisible. Professionals struggle to understand who influences whom, how relationships evolve, where hidden patterns exist, and which connections create value or risk.

**Development Problem:** Building such a tool requires maintaining specification integrity across multiple AI coding assistants, preventing requirement drift, and ensuring validated, testable features.

### 1.3 Current State: Meta-Product Phase
**Critical Note:** This edition is currently in a **specification-only phase**. Unlike the Claude, BMAD, and Spec-Kit editions (which have working implementations), the OpenSpec edition exists as:
- A **development methodology framework** using OpenSpec v0.15.0
- A **multi-agent collaboration platform** for Claude, Gemini, and RooCode
- A **specification governance system** for managing change proposals
- **Zero lines of implementation code** (no React components, no database, no UI)

### 1.4 Dual User Model

**Primary "Users" (Current State):** AI Coding Assistants
- Claude Code (using `.claude/commands/` slash commands)
- Google Gemini (using `.gemini/commands/` TOML configs)
- RooCode and other agents (using `.agent/workflows/`)
- **Need:** Structured workflows to create, validate, and implement specifications

**Future Users (Intended State):** Human End-Users
- Ecosystem analysts mapping complex networks
- Relationship strategists identifying key connectors
- Organizational leaders tracking stakeholder dynamics
- **Need:** Visual tools to understand and act on relationship patterns

### 1.5 Success Metrics (When Built)
- **Time to Map Ecosystem:** Users map 10-20 people/organizations in under 10 minutes
- **Pattern Discovery:** 80% of users identify at least one non-obvious relationship pattern
- **Data Integrity:** 99.9% of relationship data passes temporal validation (start < end dates)
- **Multi-Agent Coherence:** 3+ AI assistants can collaborate on same spec without conflicts

---

## 2. User Personas & Pain Points

### 2.1 Primary Persona (Future): Ecosystem Analyst (Rachel)

**Profile:**
- 38-year-old consultant mapping stakeholder ecosystems for clients
- Works with complex multi-organization networks (nonprofits, government, private sector)
- Needs to identify hidden influencers and relationship bottlenecks
- Time-constrained; prefers visual over text-based analysis
- Values data accuracy and audit trails

**Pain Points:**
1. **Invisible Networks:** "I can't see who's really connected to whom beyond org charts"
   - Relationships span organizational boundaries
   - Informal influence invisible in hierarchies

2. **Temporal Blindness:** "I don't know when relationships started deteriorating"
   - Relationship evolution happens gradually
   - No historical reference points

3. **Manual Mapping Tedium:** "Building network diagrams in PowerPoint takes hours"
   - Static tools don't scale
   - Changes require complete redrawing

4. **Data Integrity Issues:** "I find errors weeks later (e.g., overlapping roles at same org)"
   - No validation of temporal logic
   - Inconsistent relationship definitions

5. **Collaboration Friction:** "Sharing maps with team means version control nightmares"
   - Multiple people editing = conflicts
   - No single source of truth

**Goals:**
- Quickly map 50-100 person ecosystem
- Identify key influencers and bottlenecks
- Track relationship changes over time
- Validate data integrity automatically
- Collaborate with team on shared maps

---

### 2.2 Secondary Persona (Future): Relationship Strategist (David)

**Profile:**
- 45-year-old VP of Partnerships at tech company
- Manages 30+ strategic partnerships across organizations
- Needs visibility into multi-party relationship health
- Uses CRM but needs higher-level strategic view
- Reporting to C-suite; needs compelling visualizations

**Pain Points:**
1. **Fragmented Relationship Data:** "Key contacts scattered across email, CRM, and my brain"
2. **No Ecosystem View:** "CRM shows our relationships, not how our partners are connected"
3. **Pattern Blindness:** "I miss opportunities because I don't see second-degree connections"
4. **Transition Risk:** "When someone leaves, I don't know who the backup relationship is"
5. **Reporting Challenges:** "Execs want 'the big picture' but I can only show org charts"

**Goals:**
- Visualize entire partnership ecosystem
- Identify relationship redundancies and gaps
- Plan for key person dependencies
- Report strategic relationship health to leadership
- Track partnership evolution over quarters/years

---

### 2.3 Tertiary Persona (Current): AI Coding Assistant (Claude)

**Profile:**
- Large language model assisting developers in building True Valence Mapper
- Works alongside Gemini and RooCode agents
- Needs structured specifications to generate correct code
- Values validation frameworks to prevent errors
- Operates within governance constraints (no rogue dependency installs)

**Pain Points:**
1. **Spec Ambiguity:** "Vague requirements lead to incorrect implementations"
2. **Requirement Drift:** "Specs diverge from code; no single source of truth"
3. **Multi-Agent Conflicts:** "Different agents interpret requirements differently"
4. **Validation Gaps:** "No way to verify implementation matches spec"
5. **Governance Violations:** "Accidentally installing dependencies affects all 7 editions"

**Goals:**
- Work from validated, unambiguous specifications
- Coordinate with other AI agents coherently
- Implement features that pass strict scenario tests
- Avoid governance violations (dependency changes, architectural shifts)
- Maintain audit trail of changes

---

## 3. User Journeys

### 3.1 Journey (Future): Ecosystem Analyst Maps Stakeholder Network

**Actors:** Rachel (Analyst), True Valence Mapper Tool

**Context:** Rachel is consulting for a nonprofit coalition addressing homelessness. The coalition includes 12 organizations, 30+ key individuals, and overlapping board members. She needs to map this ecosystem to identify coordination gaps.

**Steps:**

1. **Create New Map**
   - Rachel opens True Valence Mapper
   - Clicks "New Ecosystem Map"
   - Names it: "Bay Area Homelessness Coalition - Dec 2025"

2. **Add Organizations**
   - Adds 12 organizations:
     - City Housing Authority
     - County Health Services
     - Nonprofit A (Service Provider)
     - Nonprofit B (Advocacy)
     - Foundation X (Funder)
     - [7 more]
   - Each organization gets ID, name, industry/sector tag

3. **Add Key People**
   - Adds 30 individuals:
     - "Maria Chen" - Executive Director, Nonprofit A
     - "John Smith" - Program Officer, Foundation X
     - "Dr. Lisa Park" - County Health Director
     - [27 more]
   - Each person gets ID, name, optional title/bio

4. **Define Relationships**
   - Maps person-to-organization relationships:
     - Maria Chen → Nonprofit A (role: "Executive Director", start: 2018)
     - Maria Chen → City Task Force (role: "Board Member", start: 2020)
     - John Smith → Foundation X (role: "Program Officer", start: 2022)
   - Maps person-to-person relationships:
     - Maria Chen ↔ Dr. Lisa Park (valence: "Strong Collaboration", since: 2019)
     - John Smith ↔ Maria Chen (valence: "Professional Acquaintance", since: 2022)

5. **System Validates Data**
   - Temporal validation: Maria's board role started AFTER her ED role ✓
   - Detects potential issue: "John Smith listed as Program Officer at 2 foundations"
   - Rachel corrects: John left Foundation Y in 2021, joined Foundation X in 2022

6. **Visualize Network**
   - Rachel switches to graph view
   - Sees organizations as large nodes, people as smaller nodes
   - Relationship lines show valence (strong = thick green, weak = thin red)

7. **Identify Patterns**
   - Rachel notices:
     - **Key connector:** Maria Chen bridges 4 organizations
     - **Bottleneck:** Only 1 person connects Foundation X to service providers
     - **Cluster:** County agencies mostly isolated from nonprofits
     - **Risk:** If Maria leaves, Nonprofit A loses 3 critical partnerships

8. **Export Insight Report**
   - Rachel exports:
     - Visual network map (PNG)
     - Key connector list (CSV)
     - Relationship timeline (PDF)
   - Shares with coalition steering committee

9. **Track Changes Over Time**
   - 6 months later, Rachel reopens map
   - Updates: 2 people changed roles, 1 org joined coalition
   - Compares: "Bottleneck reduced from 1 to 3 connecting people"
   - Evidence of progress shown visually

**Pain Points Addressed:**
- ✅ Invisible networks → Full ecosystem visible in graph view
- ✅ Temporal blindness → Historical tracking + timeline export
- ✅ Manual tedium → Quick data entry with validation
- ✅ Data integrity → Automated temporal validation
- ✅ Collaboration friction → (Future: Cloud-based shared maps)

---

### 3.2 Journey (Current): AI Agent Creates Specification

**Actors:** Claude (AI Assistant), Developer (Human), OpenSpec System

**Context:** Developer wants to implement "export to CSV" feature. Claude uses OpenSpec workflow to create validated specification.

**Steps:**

1. **Human Request**
   - Developer: "I want users to export relationship data to CSV for Excel analysis"

2. **Claude Initiates Proposal**
   - Claude runs: `/proposal export-csv`
   - OpenSpec scaffolds:
     - `openspec/changes/export-csv/proposal.md`
     - `openspec/changes/export-csv/tasks.md`

3. **Claude Defines Requirements**
   - Writes in `proposal.md`:
     - **WHY:** Users need Excel-compatible exports for external analysis
     - **WHAT:** Export button generates CSV with person/org/relationship rows
     - **SUCCESS:** CSV opens in Excel without errors, all data preserved

4. **Claude Writes Spec Delta**
   - In `specs/export/spec.md`:
     ```markdown
     ## ADDED Requirements
     ### Requirement: CSV Export
     System SHALL provide CSV export of all entities

     #### Scenario: Export People
     GIVEN user has 10 people in map
     WHEN user clicks "Export to CSV"
     THEN system generates people.csv with name, title, org columns

     #### Scenario: Preserve Special Characters
     GIVEN person named "O'Brien, María"
     WHEN exported to CSV
     THEN name is properly escaped: "O'Brien, María"
     ```

5. **Claude Validates Proposal**
   - Runs: `openspec validate export-csv --strict`
   - System checks:
     - ✓ proposal.md has WHY/WHAT/SUCCESS
     - ✓ spec.md has valid scenario format
     - ✓ No conflicting requirements in other specs
     - ✓ Tasks link back to requirements

6. **Human Reviews & Approves**
   - Developer reads proposal
   - Asks: "Should we support Excel formulas in export?"
   - Claude clarifies: "No, plain CSV only for MVP. Added to Out-of-Scope."
   - Developer approves proposal

7. **Claude Implements**
   - Runs: `/apply export-csv`
   - Executes tasks sequentially:
     - [ ] Task 1.1: Create ExportButton component
     - [ ] Task 1.2: Implement CSV generation utility
     - [ ] Task 1.3: Add download trigger
     - [ ] Task 2.1: Write unit tests for CSV escaping
   - Updates task checklist after each completion

8. **Validation & Testing**
   - Claude runs scenario tests:
     - ✓ Export People scenario passes
     - ✓ Preserve Special Characters scenario passes
   - All requirements validated ✓

9. **Archival**
   - Runs: `openspec archive export-csv`
   - Moves to `openspec/changes/archive/export-csv/`
   - Updates canonical spec in `openspec/specs/export/spec.md`
   - Audit trail preserved

10. **Gemini Continues**
    - Next day, Gemini agent works on "import CSV" feature
    - Reads archived export-csv spec for consistency
    - Creates new proposal following same format
    - No conflicts; specs remain coherent

**Pain Points Addressed:**
- ✅ Spec ambiguity → Structured requirements with scenarios
- ✅ Requirement drift → Specs auto-update during archival
- ✅ Multi-agent conflicts → All agents read same validated specs
- ✅ Validation gaps → Strict scenario-based testing
- ✅ Governance violations → Proposal review before implementation

---

## 4. Feature Requirements

### 4.1 Core Features (Must-Have for End Users)

#### 4.1.1 Entity Management: People & Organizations
**User Need:** Users need to capture individuals and groups as distinct entities with persistent identities.

**Capabilities:**
- User creates **Person** entity with:
  - Unique ID (auto-generated)
  - Name (required, max 100 characters)
  - Title (optional, max 100 characters)
  - Bio/notes (optional, max 500 characters)
- User creates **Organization** entity with:
  - Unique ID (auto-generated)
  - Name (required, max 100 characters)
  - Industry/sector (optional, max 50 characters)
  - Description (optional, max 500 characters)
- User edits entity details inline
- User deletes entities (with confirmation if relationships exist)
- System prevents duplicate names (warns user)

**Acceptance Criteria:**
- Create person/org in under 10 seconds (click → type → save)
- IDs are globally unique (UUID format)
- Name field enforces 100-char limit gracefully
- Delete operation warns: "This person has 3 relationships. Continue?"

---

#### 4.1.2 Relationship Tracking
**User Need:** Users need to capture connections between entities with context about nature, timing, and roles.

**Capabilities:**
- User defines **Person-to-Organization** relationship:
  - Role (e.g., "CEO", "Board Member", "Contractor")
  - Start date (required)
  - End date (optional; null = current)
  - Valence (quality: Strong/Medium/Weak/Neutral)
- User defines **Person-to-Person** relationship:
  - Nature (e.g., "Mentor", "Collaborator", "Friend")
  - Start date (required)
  - End date (optional)
  - Valence (quality: Strong/Medium/Weak/Neutral)
- User defines **Organization-to-Organization** relationship:
  - Type (e.g., "Partnership", "Subsidiary", "Competitor")
  - Start date (required)
  - End date (optional)
  - Valence

**Temporal Validation:**
- System enforces: Start date MUST be before End date
- System warns: "This role overlaps with existing role at same org"
- System flags: "Person has 3 simultaneous executive roles (unusual)"

**Acceptance Criteria:**
- Define relationship in under 20 seconds (select entities → set dates → save)
- Temporal validation prevents logically impossible dates
- Valence is visually indicated (strong = green, weak = red)
- User can filter view: "Show only current relationships" (end date = null)

---

#### 4.1.3 Network Visualization
**User Need:** Users need to see the ecosystem as an interactive graph to identify patterns visually.

**Capabilities:**
- **Graph Canvas:**
  - Organizations appear as large nodes
  - People appear as smaller nodes
  - Relationships appear as connecting lines
  - Force-directed layout (nodes repel, relationships attract)
- **Visual Encoding:**
  - Node size reflects importance (# of connections)
  - Line thickness reflects valence strength (strong = thick, weak = thin)
  - Color-coding for valence (green = positive, red = negative, grey = neutral)
- **Interactivity:**
  - User clicks node to highlight connected relationships
  - User hovers over line to see relationship details (role, dates, valence)
  - User drags nodes to adjust layout manually
  - User zooms/pans for large networks (50+ entities)
- **Filtering:**
  - User filters by entity type (people only, orgs only, both)
  - User filters by time period ("Show relationships active in 2023")
  - User filters by valence ("Show only strong relationships")

**Acceptance Criteria:**
- Graph renders 50 entities in under 3 seconds
- Dragging node feels smooth (60 FPS)
- Hover displays relationship details in under 500ms
- Filtering updates graph in under 1 second

---

#### 4.1.4 Temporal Timeline
**User Need:** Users need to understand how the ecosystem evolved over time.

**Capabilities:**
- User views timeline showing:
  - When people joined/left organizations (horizontal bars)
  - When relationships started/ended (vertical markers)
  - Overlapping roles highlighted
- User scrubs timeline to see network state at any point in history
- User plays animation: "Show how network grew from 2020-2025"
- User exports timeline as PDF or image

**Acceptance Criteria:**
- Timeline displays up to 10 years of history
- Scrubbing timeline updates graph view in real-time
- Animation plays at adjustable speed (1 second per month to 1 second per year)
- Export includes all visible timeline data

---

#### 4.1.5 Data Import & Export
**User Need:** Users need to move data in/out of system for integration with other tools.

**Capabilities:**
- **Export:**
  - CSV (people, orgs, relationships as separate files)
  - JSON (complete ecosystem data)
  - PNG/SVG (network graph image)
  - PDF (report with graph + key insights)
- **Import:**
  - CSV (bulk upload people/orgs/relationships)
  - JSON (restore previous ecosystem state)
  - Validation during import (temporal logic, duplicate detection)

**Acceptance Criteria:**
- Export 100-entity ecosystem in under 5 seconds
- CSV opens in Excel without formatting issues
- Import detects errors before applying: "Row 23: End date before start date"
- JSON import/export round-trip preserves all data exactly

---

### 4.2 Important Features (Should-Have)

#### 4.2.1 Pattern Detection & Insights
**User Need:** Users need automated discovery of non-obvious patterns they might miss.

**Capabilities:**
- System identifies:
  - **Key Connectors:** People with most cross-org relationships
  - **Bottlenecks:** Relationships dependent on single person
  - **Clusters:** Tightly connected groups within ecosystem
  - **Outliers:** People/orgs with no/few connections
  - **Temporal Gaps:** Periods with high turnover or relationship churn
- User views insights panel with actionable findings
- User clicks insight to highlight relevant entities on graph

**Acceptance Criteria:**
- Insights calculate in under 2 seconds for 100-entity network
- Insights are accurate (manual verification matches automated detection)
- User can dismiss/save insights
- Insights link to relevant graph areas (click "Bottleneck: John" highlights John's connections)

---

#### 4.2.2 Collaboration & Sharing
**User Need:** Users need to work on maps with team members and share with stakeholders.

**Capabilities:**
- User invites collaborators via email
- Collaborators have view-only or edit access (user-defined)
- Real-time sync: Multiple users editing simultaneously see each other's changes
- Change history: "Maria added John Smith at 2:15 PM"
- User shares read-only link for stakeholder review
- User exports shareable report (PDF with insights + graph)

**Acceptance Criteria:**
- Invite sent and accepted in under 1 minute
- Real-time sync latency <2 seconds
- Change history shows last 50 actions with timestamps
- Read-only links work without requiring account signup

---

#### 4.2.3 Search & Filter
**User Need:** Users with large ecosystems (100+ entities) need quick navigation to specific items.

**Capabilities:**
- User searches by:
  - Entity name (fuzzy matching: "Mar" finds "Maria Chen")
  - Role/title (e.g., "CEO" finds all CEOs)
  - Organization (e.g., "Nonprofit A" finds all affiliated people)
  - Date range (e.g., "Active in 2023")
- Search results highlight on graph
- User saves frequent filters as named views ("My Board Members", "Active Partnerships")

**Acceptance Criteria:**
- Search returns results in under 500ms for 200-entity network
- Fuzzy matching tolerates 1-2 typos
- Saved views accessible via dropdown (1-click filter)
- Highlighted results visually distinct (pulse animation, bright color)

---

### 4.3 Nice-to-Have Features (Could-Have)

#### 4.3.1 AI-Assisted Entity Recognition
**User Need:** Users want to quickly import data from unstructured sources (emails, meeting notes).

**Capabilities:**
- User pastes text (email body, meeting transcript)
- AI extracts potential entities:
  - People names
  - Organization names
  - Relationship hints ("John joined Acme Corp as CTO")
- User reviews suggestions and confirms/rejects
- Confirmed entities auto-populate database

**Acceptance Criteria:**
- AI extracts with >80% accuracy for well-formatted text
- User can review all suggestions before committing
- Rejected suggestions don't re-appear

---

#### 4.3.2 Mobile App
**User Need:** Users want to view/update maps on tablets and phones during meetings.

**Capabilities:**
- Native iOS/Android apps
- Touch-friendly graph navigation (pinch-zoom, two-finger pan)
- Quick entity creation via mobile form
- Offline mode: Sync when connectivity returns

**Acceptance Criteria:**
- Graph renders smoothly on tablets (iPad, Android tablets)
- Entity creation takes <30 seconds on mobile
- Offline changes sync without conflicts when online

---

#### 4.3.3 Scenario Simulation
**User Need:** Users want to model "what-if" scenarios (e.g., "What if Maria leaves?").

**Capabilities:**
- User creates simulation: "Remove Maria Chen"
- System shows impact:
  - 3 relationships would break
  - Nonprofit A loses executive leadership
  - 2 key partnerships become vulnerable
- User explores mitigations: "Add backup relationship via John"
- User saves simulation for later review

**Acceptance Criteria:**
- Simulation calculates impact in under 3 seconds
- User can undo simulation (return to reality state)
- Multiple simulations can be saved and compared

---

## 5. User Experience Principles

### 5.1 Ecosystem Thinking Over Org Charts
**Principle:** Relationships span organizational boundaries; the tool must reflect reality, not hierarchies.

**Implications:**
- No forced org chart structure
- People can belong to multiple organizations simultaneously
- Relationships are primary, organizations are context
- Visual layout shows actual influence, not reporting lines

---

### 5.2 Temporal Awareness
**Principle:** Relationships evolve; static snapshots mislead.

**Implications:**
- All relationships have start/end dates
- Timeline view is core feature (not afterthought)
- System validates temporal logic automatically
- Historical comparisons are one-click accessible

---

### 5.3 Pattern Discovery Over Data Entry
**Principle:** Insights matter more than data collection; minimize manual work.

**Implications:**
- AI-assisted entity extraction (import from emails/docs)
- Automated pattern detection (don't require manual analysis)
- Suggested relationships based on existing data
- One-click exports to share insights (not raw data)

---

### 5.4 Collaboration-First
**Principle:** Ecosystems are understood collectively, not individually.

**Implications:**
- Real-time multi-user editing
- Change history for accountability
- Shareable read-only views for stakeholders
- Commenting/annotation on entities and relationships

---

### 5.5 Data Integrity as Foundation
**Principle:** Trust in data is prerequisite for trust in insights.

**Implications:**
- Strict temporal validation (start < end)
- Duplicate detection on entity creation
- Import validation before committing changes
- Audit trail for all edits (who, what, when)

---

## 6. OpenSpec Methodology (Development Workflow)

### 6.1 Three-Stage Workflow

**Stage 1: Creating Change Proposals**
- AI agent (Claude/Gemini) runs `/proposal <change-id>`
- System scaffolds: `proposal.md`, `tasks.md`, optional `design.md`
- AI writes:
  - **WHY:** Problem being solved
  - **WHAT:** Proposed solution
  - **SUCCESS:** Measurable acceptance criteria
  - **SPEC DELTA:** Added/modified/removed requirements with scenarios
- AI validates: `openspec validate <change-id> --strict`
- Human reviews and approves

**Stage 2: Implementing Changes**
- AI agent runs `/apply <change-id>`
- System reads approved proposal
- AI executes tasks sequentially:
  - Writes code
  - Updates tests
  - Validates against scenarios
  - Checks off task in `tasks.md`
- Human reviews implementation

**Stage 3: Archiving Changes**
- AI agent runs `/archive <change-id>`
- System moves proposal to `openspec/changes/archive/`
- Updates canonical specs in `openspec/specs/`
- Preserves audit trail
- Enables future agents to reference completed work

### 6.2 Multi-Agent Coordination

**Supported Agents:**
1. **Claude Code** (`.claude/commands/*.md` slash commands)
2. **Gemini** (`.gemini/commands/*.toml` configs)
3. **RooCode** (`.agent/workflows/*.md` generic workflows)

**Coordination Mechanism:**
- All agents read same canonical specs (`openspec/specs/`)
- Proposals validated against schema (prevents conflicts)
- Strict scenario format ensures testable requirements
- Archived changes provide context for future work

### 6.3 Governance Constraints

**CRITICAL RULES:**
- **STOP before** installing packages or adding dependencies
  - Why: Changes affect all 7 editions via parent repo submodules
  - Process: Check parent's `shared/` directory first, coordinate with sibling editions

- **STOP before** architectural changes
  - Why: Tech stack decisions impact entire multi-edition system
  - Process: Propose in parent repo, get human approval

- **FAVOR** straightforward, minimal implementations
  - Why: Complexity compounds across agents and editions
  - Guideline: Choose simplest solution that meets requirements

### 6.4 Decision Tree

```
Is it a bug fix?
  → YES: Implement directly (no proposal needed)

Is it a typo/formatting fix?
  → YES: Fix directly

Is it a new feature?
  → YES: Create proposal → validate → get approval → implement

Is it a breaking change?
  → YES: Create proposal → validate → get approval → implement

Are you unsure?
  → YES: Create proposal (safer)
```

---

## 7. Success Metrics & KPIs

### 7.1 End-User Metrics (When Built)

**Usability:**
- Time to map 10-entity ecosystem: <10 minutes (target: 80th percentile)
- Time to identify key connector: <2 minutes after graph rendered
- Interaction responsiveness: 60 FPS for graphs with <100 entities

**Engagement:**
- Return usage: 40% of users create 2+ maps within 30 days
- Average entities per map: 20-30 (sweet spot)
- Collaboration rate: 25% of maps shared with 2+ users

**Insight Quality:**
- Pattern discovery: 80% of users identify ≥1 non-obvious pattern
- Actionability: 60% of users export insights for stakeholder presentation
- Accuracy: <1% of data entries flagged as temporally invalid (validation works)

### 7.2 Development Metrics (Current State)

**Specification Quality:**
- Spec completeness: 100% of requirements have ≥1 testable scenario
- Validation pass rate: 95% of proposals pass `--strict` validation on first try
- Requirement clarity: <3 clarification questions per proposal (target)

**Multi-Agent Coherence:**
- Cross-agent consistency: 0 conflicts when agents work on different features
- Spec drift incidents: 0 (canonical specs remain source of truth)
- Archival completeness: 100% of implemented changes archived with audit trail

**Governance Compliance:**
- Dependency violations: 0 (no rogue installs)
- Architectural deviations: 0 (all changes approved)
- Proposal approval latency: <24 hours (target)

---

## 8. Out of Scope

### 8.1 Explicitly NOT Included

**Social Network Features:**
- No public sharing of ecosystem maps
- No community/marketplace for templates
- **Rationale:** Privacy-sensitive; professional use cases

**CRM Replacement:**
- No email integration
- No task/deal tracking
- No sales pipeline management
- **Rationale:** Complementary to CRM, not replacement

**Deep Organizational Management:**
- No HR/payroll features
- No project management (Gantt charts, Kanban)
- **Rationale:** Focused on relationship insights, not operations

**AI Content Generation:**
- No AI-written summaries of people/orgs
- No auto-generated relationship insights (beyond pattern detection)
- **Rationale:** User provides context; AI assists with structure

### 8.2 Deferred to Future Phases

**Phase 2:**
- Mobile native apps (iOS/Android)
- Advanced pattern detection (ML-based clustering)
- Scenario simulation ("what-if" modeling)

**Phase 3:**
- API for third-party integrations
- Zapier/Make connectors
- White-label versions for enterprise

**Phase 4:**
- AI entity extraction from documents
- Natural language query ("Show me who knows John")
- Predictive relationship health scoring

---

## 9. Constraints & Assumptions

### 9.1 Constraints

**Technical:**
- Web-first (no native desktop apps initially)
- Modern browser requirement (Chrome 90+, Firefox 88+, Safari 14+)
- Supabase backend (no self-hosted option initially)
- React 18 + TypeScript (no framework flexibility in MVP)

**Organizational:**
- Multi-edition architecture (changes must coordinate with 6 sibling repos)
- Shared components via parent repo (no duplication)
- OpenSpec workflow mandatory (no ad-hoc coding)

**Data:**
- Max 500 entities per map (performance target)
- Max 10 years of temporal history (before UX degrades)
- UTF-8 character support (Unicode names, notes)

### 9.2 Assumptions

**User Capabilities:**
- Users can articulate who belongs in their ecosystem (tool doesn't suggest)
- Users understand relationship context (tool doesn't infer valence)
- Users have basic graph literacy (can interpret network diagrams)

**Data Quality:**
- Users provide accurate start/end dates (tool validates logic, not truth)
- Users define relationships consistently (e.g., "Mentor" always means same thing)
- Users update maps periodically (tool doesn't auto-sync with external sources)

**Technical Environment:**
- Users have stable internet (no offline-first architecture)
- Users access from desktop/laptop primarily (mobile is secondary)
- Modern browsers with JavaScript enabled

---

## 10. Differences from Other Editions

### 10.1 OpenSpec Edition vs. Sibling Editions

| Aspect | OpenSpec Edition | BMAD Edition | Claude Edition | Spec-Kit Edition |
|--------|-----------------|--------------|----------------|------------------|
| **Current State** | Specification-only (0 LOC) | Phase 4 complete (working app) | Production v1.0 (live) | MVP complete (Feature 001) |
| **Methodology** | OpenSpec v0.15.0 | BMAD coaching framework | 7-day ship sprint | GitHub Spec-Kit |
| **Primary "User"** | AI agents (Claude/Gemini) | ProActive coaches | Individual reflectors | Any AI assistant |
| **Trust Scoring** | Valence (Strong/Medium/Weak) | 5-dimension (-5 to +5) | 4-level (0-3) | Bidirectional (Outward/Inward) |
| **Domain Focus** | Ecosystem mapping (people/orgs) | Workplace relationships | Personal relationships | Personal relationships |
| **Max Entities** | 500 (planned) | Unlimited (force graph) | 8 people maximum | Unlimited (radial layout) |
| **Multi-Agent** | Claude, Gemini, RooCode | Claude Code only | Claude Code only | Claude, Copilot, Gemini, Cursor |
| **Collaboration** | Real-time (planned) | Export/import only | Cloud sharing (anonymous auth) | localStorage only |
| **Temporal Tracking** | Core feature (start/end dates) | Deferred to Phase 5+ | Version history (auto-save) | Not yet specified |

### 10.2 Unique Value Propositions

**OpenSpec Edition:**
- **Strength:** Multi-agent collaboration, validated specifications, change audit trail
- **Weakness:** No implementation yet (entirely conceptual)
- **Best For:** Teams using multiple AI assistants, projects requiring spec rigor

**BMAD Edition:**
- **Strength:** Deep ProActive methodology integration, pilot-tested with coaches
- **Weakness:** Coach-exclusive (not general public), complex 5-dimension model
- **Best For:** ProActive certified coaches, workplace relationship coaching

**Claude Edition:**
- **Strength:** Production-ready, comprehensive security, facilitator guides
- **Weakness:** Simple 4-level scoring, 8-person limit, monolithic architecture
- **Best For:** Individual self-reflection, coach-facilitated sessions

**Spec-Kit Edition:**
- **Strength:** Technology-agnostic specs, AI-agent flexibility, incremental delivery
- **Weakness:** Single-user localStorage (no cloud sync), still in MVP phase
- **Best For:** AI-assisted development, cross-platform agent experimentation

---

## 11. Appendix: Core Data Model (Specified, Not Implemented)

### 11.1 Entity Definitions

**Person Entity:**
```typescript
interface Person {
  id: string;              // UUID (auto-generated)
  name: string;            // Required, max 100 chars
  title?: string;          // Optional, max 100 chars
  bio?: string;            // Optional, max 500 chars
  created_at: timestamp;   // Auto-generated
  updated_at: timestamp;   // Auto-updated
}
```

**Organization Entity:**
```typescript
interface Organization {
  id: string;              // UUID (auto-generated)
  name: string;            // Required, max 100 chars
  industry?: string;       // Optional, max 50 chars
  description?: string;    // Optional, max 500 chars
  created_at: timestamp;   // Auto-generated
  updated_at: timestamp;   // Auto-updated
}
```

**Relationship Entity:**
```typescript
interface Relationship {
  id: string;              // UUID (auto-generated)
  from_entity_id: string;  // Person or Organization ID
  to_entity_id: string;    // Person or Organization ID
  from_entity_type: 'person' | 'organization';
  to_entity_type: 'person' | 'organization';
  role?: string;           // E.g., "CEO", "Board Member" (for person-org)
  nature?: string;         // E.g., "Mentor", "Partner" (for person-person)
  type?: string;           // E.g., "Subsidiary", "Vendor" (for org-org)
  valence: 'strong' | 'medium' | 'weak' | 'neutral';
  start_date: date;        // Required (YYYY-MM-DD)
  end_date?: date;         // Optional; null = current
  created_at: timestamp;   // Auto-generated
  updated_at: timestamp;   // Auto-updated
}
```

**Temporal Validation Rules:**
```sql
-- Constraint: Start date must be before end date (if end date exists)
CHECK (end_date IS NULL OR start_date < end_date)

-- Warning: Detect overlapping roles at same organization
-- (Implementation: Query for existing relationships with overlapping date ranges)
```

### 11.2 Database Schema (Supabase SQL)

**Proposed in `init-core-model` change:**

```sql
-- People table
CREATE TABLE profiles (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name TEXT NOT NULL CHECK (char_length(name) <= 100),
  title TEXT CHECK (char_length(title) <= 100),
  bio TEXT CHECK (char_length(bio) <= 500),
  created_at TIMESTAMPTZ DEFAULT now(),
  updated_at TIMESTAMPTZ DEFAULT now()
);

-- Organizations table
CREATE TABLE organizations (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name TEXT NOT NULL CHECK (char_length(name) <= 100),
  industry TEXT CHECK (char_length(industry) <= 50),
  description TEXT CHECK (char_length(description) <= 500),
  created_at TIMESTAMPTZ DEFAULT now(),
  updated_at TIMESTAMPTZ DEFAULT now()
);

-- Relationships table
CREATE TABLE relationships (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  from_entity_id UUID NOT NULL,
  to_entity_id UUID NOT NULL,
  from_entity_type TEXT NOT NULL CHECK (from_entity_type IN ('person', 'organization')),
  to_entity_type TEXT NOT NULL CHECK (to_entity_type IN ('person', 'organization')),
  role TEXT,
  nature TEXT,
  type TEXT,
  valence TEXT CHECK (valence IN ('strong', 'medium', 'weak', 'neutral')),
  start_date DATE NOT NULL,
  end_date DATE,
  created_at TIMESTAMPTZ DEFAULT now(),
  updated_at TIMESTAMPTZ DEFAULT now(),
  CHECK (end_date IS NULL OR start_date < end_date)
);

-- Indexes for performance
CREATE INDEX idx_relationships_from ON relationships(from_entity_id);
CREATE INDEX idx_relationships_to ON relationships(to_entity_id);
CREATE INDEX idx_relationships_dates ON relationships(start_date, end_date);
```

**Status:** Specified in `openspec/changes/init-core-model/proposal.md` but NOT yet implemented (no migrations run, no Supabase project created).

---

## 12. Glossary

**OpenSpec Terms:**
- **Change Proposal:** Structured specification of a new feature or modification
- **Spec Delta:** Difference between current and proposed specifications (ADDED/MODIFIED/REMOVED)
- **Scenario:** Testable requirement written as GIVEN/WHEN/THEN format
- **Canonical Spec:** Single source of truth specification after archival
- **Strict Validation:** Schema-based verification of proposal completeness

**Domain Terms:**
- **Entity:** Person or Organization in the ecosystem
- **Relationship:** Connection between two entities with context (role, dates, valence)
- **Valence:** Quality or nature of a relationship (strong/medium/weak/neutral)
- **Temporal Validation:** Logic checking that dates make sense (start < end)
- **Ecosystem Map:** Complete network of entities and relationships
- **Key Connector:** Person with high cross-organizational relationship count
- **Bottleneck:** Relationship dependency on single person/entity

**Multi-Agent Terms:**
- **Slash Command:** Claude Code command (e.g., `/proposal`, `/apply`)
- **TOML Config:** Gemini command definition file
- **Workflow:** Generic agent instruction file (`.agent/workflows/`)
- **Submodule:** Git submodule linking child repo to parent

---

## Document Metadata

**Generated:** December 10, 2025
**Based on:** Codebase exploration of `/home/ichardart/dev/projects/true-valence-mapper-openspec`
**Purpose:** Retrospective PRD documenting intended product (specifications exist, no code)
**Audience:** Product managers, stakeholders, AI agents (Claude, Gemini, RooCode)
**Status:** Specification phase (0 lines of implementation code)

**Critical Context:**
This PRD describes the **intended end-user product** based on specifications and proposals, NOT a working implementation. The OpenSpec edition currently exists as:
- ✅ OpenSpec framework integration (v0.15.0)
- ✅ Multi-agent workflow configurations (Claude, Gemini, RooCode)
- ✅ One change proposal (`init-core-model`) defining Person and Organization entities
- ✅ Governance model synced from parent repo
- ❌ Zero implementation code (no React app, no Supabase database, no UI)

**Key Insights:**
- **Meta-product focus:** The current "product" is the development workflow itself (OpenSpec + multi-agent coordination)
- **Future-oriented PRD:** Describes what WILL be built once specifications are implemented
- **Dual user model:** AI agents are current users (reading/writing specs); humans are future users (using the app)
- **Domain shift:** Unlike sibling editions (personal relationships), this edition maps professional ecosystems (people + organizations)
- **Specification rigor:** All requirements must have testable scenarios (GIVEN/WHEN/THEN format)
- **Multi-agent collaboration:** Claude, Gemini, and RooCode can work coherently from same validated specs
- **Governance-constrained:** Cannot make dependency or architectural changes without coordinating across 7 editions

---

**End of Document**
