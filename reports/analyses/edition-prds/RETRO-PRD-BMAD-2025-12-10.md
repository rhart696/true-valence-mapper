# Product Requirements Document (Retrospective)
## True Valence Mapper - BMAD Edition

**Document Type:** Retrospective PRD (Tech-Agnostic)
**Version:** BMAD Edition (Based on Phase 4 Complete)
**Date:** December 10, 2025
**Author:** Generated from project state analysis

---

## 1. Executive Summary

### 1.1 Product Vision
True Valence Mapper is the exclusive relationship mapping tool for ProActive Certified Coaches that makes workplace relationships visible, measurable, and systematically improvable. It embeds the ProActive Workplace Fundamentals methodology to help coaches and their clients assess relationship quality, identify patterns, and track improvements over time.

### 1.2 Problem Statement
Workplace relationships are invisible yet critical drivers of employee engagement and professional success. ProActive Certified Coaches lack a digital tool aligned with their methodology to systematically assess relationship dynamics with clients. Professionals struggle to map their workplace relationships intentionally and apply coaching insights between sessions.

### 1.3 Target Users
- **Primary:** ProActive Certified Coaches (2 active coaches in pilot)
- **Secondary:** Coaching clients/coachees (~30-40 professionals initially)
- **Tertiary:** ProActive trainers and administrators

### 1.4 Success Metrics
- **Pilot Success:** 2 coaches actively using tool in coaching sessions
- **Client Engagement:** 80% of coached clients create at least one relationship map
- **Value Demonstration:** Coaches report visible relationship pattern insights in 90% of sessions
- **Data Retention:** 70% of sessions exported for record-keeping
- **Methodology Fidelity:** 100% alignment with ProActive Workplace Fundamentals framework

---

## 2. User Personas & Pain Points

### 2.1 Primary Persona: ProActive Certified Coach

**Profile:**
- Certified in ProActive Workplace Fundamentals methodology
- Conducts 1-on-1 coaching sessions with professionals
- Focuses on workplace relationships, engagement, and leadership development
- Values structured frameworks and evidence-based approaches
- Limited technical expertise; needs intuitive tools

**Pain Points:**
1. **No Methodology-Aligned Tools:** Generic tools (mind maps, org charts) don't align with ProActive's relationship assessment framework
2. **Difficulty Demonstrating Value:** Hard to show clients tangible evidence of relationship improvement over time
3. **Lost Insights:** Coaching insights scattered across paper notes, whiteboards, and memory
4. **No Structured Assessment:** Lack of systematic way to assess multi-dimensional relationship quality
5. **Client Engagement Gaps:** Clients struggle to apply coaching between sessions without tools

**Goals:**
- Conduct effective coaching sessions with clear visual tools
- Help clients see patterns in their relationship networks
- Track client progress across sessions
- Strengthen certification value through exclusive tools
- Spend time coaching, not learning complex software

---

### 2.2 Secondary Persona: Coaching Client (Coachee)

**Profile:**
- Professional seeking to improve workplace relationships and engagement
- Working with ProActive Certified Coach
- May be individual contributor, manager, or leader
- Varying technical comfort levels
- Limited time between coaching sessions

**Pain Points:**
1. **Invisible Relationships:** Can't "see" their relationship network to identify patterns
2. **Overwhelmed by Complexity:** Difficulty organizing thoughts about many workplace relationships
3. **No Self-Reflection Tool:** Can't apply coaching insights independently between sessions
4. **Hard to Articulate Relationship Quality:** Struggle to express what makes relationships work or not work
5. **No Progress Visibility:** Can't see if relationship improvements are happening over time

**Goals:**
- Understand current relationship network clearly
- Identify relationships needing attention
- Apply coaching frameworks independently
- Track personal growth in relationship-building
- Share relationship perspective with coach

---

### 2.3 Tertiary Persona: ProActive Administrator

**Profile:**
- Manages ProActive certification program
- Trains and supports coaches
- Responsible for methodology integrity
- Evaluates tools for certification value

**Pain Points:**
1. **Diluted Methodology:** Coaches using generic tools that don't reinforce ProActive frameworks
2. **Certification Value Concerns:** Need unique benefits to justify certification investment
3. **Quality Control:** Difficult to ensure coaches apply methodology consistently
4. **No Usage Insights:** Can't see if coaches are actively using ProActive tools

**Goals:**
- Provide coaches with high-quality, methodology-aligned tools
- Strengthen certification program value proposition
- Ensure methodology fidelity across coaches
- Demonstrate ROI to certified coaches

---

## 3. User Journeys

### 3.1 Journey: Coach Conducts Initial Relationship Mapping Session

**Actors:** ProActive Coach, Coaching Client

**Steps:**
1. **Coach logs in** to True Valence Mapper with authorized email
2. **Coach introduces tool** to client during coaching session
3. **Client identifies key workplace relationships** (manager, direct reports, peers, stakeholders)
4. **Coach adds each person to the map** with name and relationship type
5. **Visual network appears** showing client's relationship landscape
6. **Client sees patterns emerge** (clusters, isolated nodes, central connectors)
7. **Coach guides assessment** of specific relationships using ProActive dimensions
8. **Coach clicks relationship link** to open assessment interface
9. **Coach and client collaboratively score relationship** across 5 dimensions:
   - Trust Level
   - Communication Quality
   - Mutual Support
   - Professional Respect
   - Goal Alignment
10. **Visual feedback shows relationship health** (color-coded: green = healthy, orange/red = challenged)
11. **Coach adds qualitative notes** capturing client insights and context
12. **Coach repeats assessment** for priority relationships
13. **Coach and client review complete map** to identify focus areas
14. **Coach exports session** as record for client file
15. **Client leaves with visual understanding** of relationship landscape

**Pain Points Addressed:**
- ✅ Structured assessment framework (5 dimensions)
- ✅ Visual pattern recognition (force-directed layout)
- ✅ Methodology alignment (ProActive dimensions)
- ✅ Session documentation (export capability)

---

### 3.2 Journey: Client Self-Maps Between Sessions

**Actors:** Coaching Client

**Steps:**
1. **Client receives access link** from coach between sessions
2. **Client logs in** with simplified authentication
3. **Client reviews previous map** created with coach
4. **Client adds new relationship** discovered since last session
5. **Client updates assessment** for relationship that has changed
6. **Client adjusts sliders** reflecting current relationship state
7. **Client adds personal notes** about relationship dynamics
8. **Client sees visual changes** in relationship health colors
9. **Client identifies relationship to focus on** before next session
10. **Client exports updated map** to share with coach
11. **Client brings exported map** to next coaching session

**Pain Points Addressed:**
- ✅ Independent application of coaching (self-mapping capability)
- ✅ Progress tracking (compare current vs previous state)
- ✅ Actionable insights (visual priority identification)

---

### 3.3 Journey: Coach Tracks Client Progress Over Time

**Actors:** ProActive Coach, Coaching Client

**Steps:**
1. **Coach imports previous session map** at start of follow-up session
2. **Coach and client review baseline map** from 3 months ago
3. **Client identifies relationships worked on** since last mapping
4. **Coach updates assessment** for changed relationships
5. **Visual comparison shows improvements** (orange → green transitions)
6. **Coach highlights growth** in specific relationship dimensions
7. **Client sees tangible evidence** of coaching impact
8. **Coach identifies persistent challenges** (relationships still orange/red)
9. **Coach and client set new relationship goals** based on visual data
10. **Coach exports updated map** to client progress file
11. **Client feels validated** seeing visible progress

**Pain Points Addressed:**
- ✅ Tangible progress demonstration (color transitions)
- ✅ Evidence-based coaching (visual comparison)
- ✅ Client motivation (seeing improvement)

---

## 4. Feature Requirements

### 4.1 Core Features (Must-Have)

#### 4.1.1 Authentication & Access Control
**User Need:** Coaches need secure, exclusive access to protect client confidentiality; only certified coaches should access the tool.

**Capabilities:**
- Coach logs in with authorized email address
- System verifies coach against allowlist of certified coaches
- Unauthorized users cannot access mapping functionality
- Session persists across browser refresh
- Coach can log out securely

**Acceptance Criteria:**
- Only allowlisted emails can log in
- Invalid emails receive clear rejection message
- Session state survives page reload
- Logout clears all session data

---

#### 4.1.2 Interactive Relationship Mapping
**User Need:** Coaches and clients need to visualize relationship networks to identify patterns and prioritize focus areas.

**Capabilities:**
- Coach adds people to the map with names and relationship types
- Visual network displays all relationships spatially
- Nodes automatically arrange to show relationship clusters
- Coach can drag nodes to adjust layout
- Visual layout reflects relationship importance and centrality
- Map updates in real-time as people are added
- Clear visual distinction between different relationship types

**Acceptance Criteria:**
- Coach can add person with name and role
- Network graph displays immediately
- Nodes are draggable with smooth animation
- Layout adjusts automatically when new nodes added
- Relationship type visible on each node

---

#### 4.1.3 Multi-Dimensional Relationship Assessment
**User Need:** Coaches need a structured framework aligned with ProActive methodology to assess relationship quality across multiple dimensions.

**Capabilities:**
- Coach clicks relationship link to open assessment interface
- Assessment covers 5 core dimensions:
  1. **Trust Level** - Reliability, integrity, safety
  2. **Communication Quality** - Clarity, frequency, openness
  3. **Mutual Support** - Reciprocity, assistance, collaboration
  4. **Professional Respect** - Recognition, competence, boundaries
  5. **Goal Alignment** - Shared objectives, compatible priorities
- Each dimension scored on scale from -5 (toxic) to +5 (vital)
- Neutral midpoint (0) represents absence of dimension
- Visual slider interface for intuitive scoring
- Coach adds qualitative notes for context and observations
- Assessment saves automatically
- Visual feedback shows relationship health via color coding:
  - Green: Healthy/positive valence
  - Orange: Challenged/neutral valence
  - Red: Toxic/negative valence

**Acceptance Criteria:**
- All 5 dimensions assessable for each relationship
- Slider range clearly labeled (-5 to +5)
- Notes field accepts text input
- Assessment saves without explicit "save" action
- Relationship link color reflects aggregate valence score
- Coach can edit assessment after initial scoring

---

#### 4.1.4 Data Persistence
**User Need:** Coaches need session data preserved between coaching sessions and across browser sessions.

**Capabilities:**
- Session data saves automatically as coach works
- Data persists after browser close/reopen
- Coach can resume session from exactly where they left off
- No manual "save" action required
- Data stored securely and privately per coach

**Acceptance Criteria:**
- All nodes, relationships, and assessments persist across sessions
- Data survives browser refresh
- No data loss during normal usage
- Each coach's data isolated from other coaches

---

#### 4.1.5 Session Export
**User Need:** Coaches need to export session data for client records, progress tracking, and offline review.

**Capabilities:**
- Coach exports complete session with single click
- Export includes all nodes, relationships, valence scores, and notes
- Export format preserves all assessment data
- Exported file includes timestamp for version tracking
- File naming includes date for easy organization
- Exported data sanitized to prevent security issues

**Acceptance Criteria:**
- Export button accessible from main interface
- Exported file contains complete session state
- File name includes readable timestamp
- Exported data can be stored in client files
- No sensitive authentication data in export

---

### 4.2 Important Features (Should-Have)

#### 4.2.1 Session Import
**User Need:** Coaches need to load previous sessions to track client progress over time.

**Capabilities:**
- Coach imports previously exported session file
- Imported data replaces current session
- All nodes, relationships, and assessments restored exactly
- Coach can compare current state with previous session
- Import validates file integrity before loading

**Acceptance Criteria:**
- Import button accessible from main interface
- Valid exported files load correctly
- Invalid files rejected with clear error message
- Imported session displays exactly as when exported
- Import warns before overwriting current session

---

#### 4.2.2 Client Self-Mapping Interface
**User Need:** Clients need simplified interface to map relationships independently between coaching sessions.

**Capabilities:**
- Client accesses simplified version of mapping tool
- Interface focuses on essential mapping functions
- Client can add people to their own network
- Client can assess relationships using same 5 dimensions
- Client can update existing assessments
- Client exports map to share with coach
- Simplified language and reduced complexity vs. coach interface

**Acceptance Criteria:**
- Client interface removes advanced coaching features
- Client can perform core mapping independently
- Client assessments use same 5-dimension framework
- Client can export map in compatible format
- Interface usable without coaching expertise

---

#### 4.2.3 Keyboard Navigation
**User Need:** Coaches need to navigate efficiently during live sessions without constant mouse usage.

**Capabilities:**
- Coach navigates between nodes using keyboard
- Coach opens assessment using keyboard shortcut
- Coach moves between dimension sliders using Tab key
- Coach adds notes using keyboard only
- All interactive elements keyboard-accessible

**Acceptance Criteria:**
- All functions accessible without mouse
- Tab order follows logical flow
- Keyboard shortcuts documented in interface
- Focus indicators clearly visible
- Screen reader compatible

---

#### 4.2.4 Error Handling & Recovery
**User Need:** Coaches need graceful error handling so technical issues don't disrupt coaching sessions.

**Capabilities:**
- System recovers from unexpected errors without data loss
- Clear, non-technical error messages displayed
- Coach can continue session after error
- Failed operations don't corrupt session data
- Network issues handled gracefully

**Acceptance Criteria:**
- Errors display user-friendly messages
- Session data protected during errors
- Coach can retry failed operations
- No technical jargon in error messages
- Automatic recovery where possible

---

### 4.3 Nice-to-Have Features (Could-Have)

#### 4.3.1 Bidirectional Trust Assessment
**User Need:** Coaches need to capture both how client trusts others AND how others trust client.

**Capabilities:**
- Coach assesses trust in both directions for relationship
- Visual indicators show trust asymmetry
- Coach identifies relationships with trust imbalances
- Separate sliders for "Client trusts Person" vs "Person trusts Client"

**Acceptance Criteria:**
- Both trust directions assessable
- Visual distinction between directions
- Asymmetric trust clearly visible
- Assessment interface not overwhelming

---

#### 4.3.2 Relationship History Timeline
**User Need:** Coaches need to track how specific relationships change across multiple coaching sessions.

**Capabilities:**
- Coach views history of assessments for single relationship
- Timeline shows how valence scores changed over time
- Coach identifies improvement trends
- Coach correlates coaching interventions with relationship changes

**Acceptance Criteria:**
- Historical data preserved across sessions
- Timeline visualization clear and readable
- Coach can see dimension-by-dimension trends
- Historical view doesn't clutter main interface

---

#### 4.3.3 Pattern Recognition Insights
**User Need:** Coaches need automated insights about relationship patterns to focus coaching conversations.

**Capabilities:**
- System identifies clusters of challenged relationships
- System highlights relationships with low trust but high interaction
- System suggests priority relationships based on valence scores
- System identifies isolated nodes (potential disengagement risk)

**Acceptance Criteria:**
- Insights based on actual assessment data
- Suggestions align with ProActive methodology
- Insights enhance rather than replace coach judgment
- Insights dismissible if not relevant

---

#### 4.3.4 Mobile-Optimized Interface
**User Need:** Coaches need to access tool on tablets during coaching sessions in various settings.

**Capabilities:**
- Interface adapts to tablet screen sizes
- Touch-friendly controls for node dragging
- Touch-optimized sliders for assessments
- Legible text and icons on smaller screens

**Acceptance Criteria:**
- Usable on tablets 10" and larger
- Touch interactions smooth and responsive
- No loss of functionality on mobile
- Layout adjusts appropriately

---

#### 4.3.5 Multiple Map Templates
**User Need:** Coaches need different starting templates for different coaching contexts.

**Capabilities:**
- Coach selects template when starting new map:
  - Individual Contributor (peers, manager, stakeholders)
  - People Manager (direct reports, manager, peers)
  - Cross-Functional Leader (team, partners, executives)
- Template pre-populates relationship types
- Coach customizes after template selection

**Acceptance Criteria:**
- 3+ templates available
- Template selection during map creation
- Pre-populated types editable
- Templates align with ProActive methodology

---

## 5. User Experience Principles

### 5.1 Coaching Session Flow
**Principle:** The tool should facilitate coaching conversations, not interrupt them.

**Implications:**
- Minimal clicks to perform common actions
- No complex configuration during sessions
- Auto-save eliminates manual save actions
- Visual feedback immediate and intuitive
- Coach attention stays on client, not software

---

### 5.2 Visual Clarity
**Principle:** Relationship patterns should be immediately visible without explanation.

**Implications:**
- Color coding reflects relationship health intuitively (green = good, red = challenged)
- Node layout shows relationship centrality and clusters
- Text labels clear and readable at default zoom
- Visual hierarchy guides attention to priority relationships

---

### 5.3 Methodology Fidelity
**Principle:** Every feature must align with ProActive Workplace Fundamentals framework.

**Implications:**
- 5-dimension assessment matches ProActive coaching model
- Relationship types reflect ProActive workplace categories
- Language and terminology consistent with ProActive training
- Visual design reinforces ProActive brand identity

---

### 5.4 Progressive Disclosure
**Principle:** Simple tasks simple; complex tasks possible.

**Implications:**
- Basic mapping requires minimal learning
- Advanced features hidden until needed
- Client interface simpler than coach interface
- Guidance available but not intrusive

---

### 5.5 Data Ownership
**Principle:** Coaches and clients own their relationship data completely.

**Implications:**
- Export capability gives coaches full data portability
- No vendor lock-in to proprietary formats
- Client data never used for other purposes
- Clear data privacy and retention policies

---

## 6. Success Metrics & KPIs

### 6.1 Adoption Metrics
- **Active Coaches:** Number of coaches logging in at least monthly
- **Target:** 100% of pilot coaches (2/2) within first month
- **Sessions Created:** Number of mapping sessions initiated
- **Target:** Average 3 sessions per coach per month
- **Client Maps:** Number of unique client maps created
- **Target:** 80% of coached clients have at least one map

### 6.2 Engagement Metrics
- **Session Duration:** Time spent in active mapping session
- **Target:** Average 20-30 minutes per session
- **Assessments Completed:** Number of relationships assessed
- **Target:** Average 8-12 relationships per client map
- **Export Usage:** Percentage of sessions exported
- **Target:** 70% of sessions exported for records

### 6.3 Value Metrics
- **Coach Satisfaction:** NPS or satisfaction score from coaches
- **Target:** 8+ out of 10 satisfaction rating
- **Client Insights:** Coach-reported frequency of pattern insights
- **Target:** 90% of sessions yield visible insights
- **Repeat Usage:** Coaches returning for follow-up sessions
- **Target:** 60% of coaches conduct 2+ sessions with same client

### 6.4 Quality Metrics
- **Error Rate:** Frequency of errors disrupting sessions
- **Target:** <1 error per 100 sessions
- **Data Loss:** Incidents of session data loss
- **Target:** 0 data loss incidents
- **Methodology Alignment:** ProActive administrator assessment
- **Target:** 100% methodology fidelity rating

---

## 7. Out of Scope

### 7.1 Excluded from This Version
- **Organizational Charts:** Not a replacement for org structure diagrams
- **Performance Reviews:** Not a performance management tool
- **Scheduling/Calendar:** Not a session booking or calendar tool
- **Communication Platform:** Not a messaging or collaboration tool
- **Public Access:** Not available to non-certified coaches
- **Team Mapping:** Focus on individual client perspective, not team dynamics
- **Automated Insights:** No AI-driven relationship recommendations
- **Real-Time Collaboration:** No simultaneous multi-user editing
- **Mobile App:** Web-only, no native mobile applications

### 7.2 Deferred to Future Versions
- **Historical Trending:** Automated tracking of relationship changes over time
- **Report Generation:** Formatted PDF reports for client delivery
- **Integration with CRM:** Sync with coaching practice management tools
- **Video/Audio Annotations:** Multimedia notes on relationships
- **Relationship Action Plans:** Structured improvement planning per relationship
- **Coach-to-Coach Sharing:** Peer consultation features

---

## 8. Constraints & Assumptions

### 8.1 Constraints
- **Pilot-Only Access:** Limited to 2 coaches initially; scalability not required in V1
- **Manual Onboarding:** Coaches require guided setup and training
- **ProActive-Exclusive:** Not marketed or available outside ProActive ecosystem
- **Web-Only:** No native mobile/desktop applications
- **Coach-Led Usage:** Designed for coach-facilitated sessions, not fully self-service

### 8.2 Assumptions
- **Coaches have basic computer skills:** Can use web applications comfortably
- **Coaching sessions conducted remotely or with shared screen:** Tool visible to both coach and client
- **Clients willing to participate:** Coachees engaged in coaching process
- **Relationship data relatively stable:** Not changing daily; monthly updates sufficient
- **ProActive methodology stable:** No major framework changes during development
- **Internet connectivity available:** No offline usage required

---

## 9. Appendix: ProActive Methodology Alignment

### 9.1 Five Dimensions of Workplace Relationships

The 5-dimension assessment framework derives directly from ProActive Workplace Fundamentals:

1. **Trust Level**
   - ProActive Foundation: Trust is the foundation of psychological safety and engagement
   - Assessment Focus: Reliability, integrity, confidentiality, vulnerability safety

2. **Communication Quality**
   - ProActive Foundation: Open communication enables clarity and alignment
   - Assessment Focus: Frequency, clarity, openness, active listening, feedback quality

3. **Mutual Support**
   - ProActive Foundation: Reciprocity builds sustainable relationships
   - Assessment Focus: Collaboration, assistance, recognition, backing/advocacy

4. **Professional Respect**
   - ProActive Foundation: Respect for competence and boundaries enables productivity
   - Assessment Focus: Competence recognition, boundary respect, professionalism

5. **Goal Alignment**
   - ProActive Foundation: Shared purpose drives collective engagement
   - Assessment Focus: Compatible priorities, shared objectives, complementary roles

### 9.2 Relationship Types (ProActive Categories)

- **Manager/Supervisor:** Direct reporting relationship upward
- **Direct Report:** Direct reporting relationship downward (for managers)
- **Peer/Colleague:** Same level, same team or department
- **Cross-Functional Partner:** Different department, collaborative relationship
- **Stakeholder:** Indirect influence relationship (sponsors, customers, etc.)
- **Mentor/Mentee:** Developmental relationship outside reporting structure

### 9.3 Visual Design Alignment

- **Color Palette:** ProActive brand colors (purple primary, teal accent)
- **Logo Placement:** ProActive trillium logo reinforces brand
- **Language:** Coaching-centric terminology aligned with training materials

---

## 10. Glossary

- **Valence:** The quality or "charge" of a relationship, ranging from toxic (-5) to vital (+5)
- **Node:** A person in the relationship network
- **Link:** A relationship connection between two people
- **Mapping Session:** A coaching session focused on creating or updating a relationship map
- **ProActive Workplace Fundamentals:** The coaching methodology developed by ProActive Resolutions
- **Certified Coach:** A coach who has completed ProActive's certification program
- **Coachee/Client:** The person receiving coaching services
- **Force-Directed Graph:** A visualization layout where nodes arrange based on relationship connections

---

**End of Document**

---

## Document Change History

| Version | Date | Changes | Author |
|---------|------|---------|--------|
| 1.0 (Retrospective) | 2025-12-10 | Initial retrospective PRD based on Phase 4 complete state | Generated from project analysis |
