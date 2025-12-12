# Product Requirements Document (Retrospective)
## True Valence Mapper - Claude Edition

**Document Type:** Retrospective PRD (Tech-Agnostic)
**Version:** Claude Edition v1.0 (Production)
**Date:** December 10, 2025
**Production URL:** https://rhart696.github.io/true-valence-mapper/
**Author:** Generated from project state analysis

---

## 1. Executive Summary

### 1.1 Product Vision
True Valence Mapper is a visual relationship trust assessment tool that makes bidirectional trust patterns visible and actionable. It helps individuals, coaches, and teams explore trust dynamics in up to 8 key relationships, identify asymmetries, and reflect on patterns for personal growth and improved collaboration.

### 1.2 Problem Statement
Trust in relationships is invisible, bidirectional, and often asymmetric. People lack tools to:
- Visualize how trust flows in both directions within their relationships
- Identify mismatches between "I trust them" and "they trust me"
- Reflect systematically on relationship health across personal and professional domains
- Track changes in trust patterns over time
- Share relationship insights with coaches or facilitators safely

### 1.3 Target Users

**Primary Users:**
- **Individual Reflectors:** People seeking self-awareness about their relationship trust patterns
- **ProActive Coaches:** Facilitators using the tool in coaching sessions to explore client relationships
- **Team Managers:** Leaders exploring team cohesion and trust dynamics

**Secondary Users:**
- **Therapists and Counselors:** Mental health professionals facilitating relationship work
- **HR Professionals:** Supporting workplace relationship health initiatives

### 1.4 Success Metrics
- **Time to First Success:** <60 seconds from arrival to completing first relationship scoring
- **Task Completion Rate:** 90%+ of users successfully create and score a relationship map
- **Error Rate:** <0.5 errors per session (down from 2.5 baseline)
- **System Usability Scale (SUS):** 82+ (from 68 baseline)
- **Emotional Safety:** 75% users report feeling "calm" (from 30%), <15% "anxious" (from 55%)
- **Accessibility:** 100% WCAG 2.1 AA compliance (Lighthouse score)

---

## 2. User Personas & Pain Points

### 2.1 Primary Persona: Individual Reflector (Self-Use)

**Profile:**
- Professional or student seeking relationship self-awareness
- May be working through workplace dynamics or personal relationship patterns
- Values privacy and control over personal data
- Varying technical comfort; needs intuitive, low-barrier tools
- Limited time; wants quick insights without lengthy setup

**Pain Points:**
1. **Invisibility of Trust Patterns:** Can't "see" how trust flows in relationships or identify where mismatches exist
2. **Overwhelm with Complexity:** Relationship dynamics feel too complex to organize mentally
3. **Fear of Getting It Wrong:** Anxiety about making mistakes or "doing it wrong" when using new tools
4. **No Clear Starting Point:** Blank canvas syndrome - don't know where to begin
5. **Privacy Concerns:** Reluctant to share sensitive relationship data in cloud services
6. **Lost Insights:** Reflections scattered across journals, notes, thoughts; hard to revisit

**Goals:**
- Gain clarity on relationship trust dynamics quickly
- Identify which relationships need attention or repair
- Understand if trust asymmetries exist ("I trust them more than they trust me")
- Reflect safely without risk of data exposure
- Track changes over time to see if interventions work

---

### 2.2 Secondary Persona: ProActive Coach (Facilitated Use)

**Profile:**
- Certified in ProActive Workplace Fundamentals methodology
- Conducts 1-on-1 coaching sessions focused on workplace relationships and engagement
- Values evidence-based tools aligned with coaching frameworks
- Needs tools that facilitate conversation without disrupting flow
- May have limited technical expertise; needs simple, reliable tools

**Pain Points:**
1. **Lack of Visual Tools:** Relationship coaching relies on conversation; hard to make patterns visible in real-time
2. **Session Time Constraints:** 60-90 minute sessions require quick setup and efficient workflows
3. **Client Anxiety with New Tools:** Clients may feel overwhelmed or resistant to unfamiliar technology
4. **No Structured Trust Assessment:** Generic tools don't provide bidirectional trust scoring framework
5. **Difficulty Demonstrating Progress:** Hard to show clients tangible evidence of relationship improvement over sessions
6. **Data Privacy Sensitivity:** Clients hesitant to use tools that store sensitive relationship data

**Goals:**
- Facilitate trust mapping in 20-minute session segments
- Guide clients to insights without imposing coach's interpretation
- Use structured framework (bidirectional scoring) to organize assessment
- Save session maps for follow-up coaching
- Respect client privacy and data ownership
- Demonstrate coaching value through visible progress

---

### 2.3 Tertiary Persona: Team Manager (Team Cohesion)

**Profile:**
- Manages 5-15 person team
- Responsible for team performance, collaboration, and culture
- May be facilitating team trust-building exercises or retrospectives
- Needs simple tools that don't require HR/IT approval
- Values team psychological safety

**Pain Points:**
1. **Hidden Team Dynamics:** Trust issues within team are invisible until conflicts surface
2. **No Team Trust Assessment Tool:** Annual surveys don't capture real-time relationship health
3. **Fear of Exposing Team Members:** Don't want tool that creates awkwardness or blame
4. **Complex Enterprise Tools:** Need lightweight, accessible tools, not enterprise software
5. **Limited Facilitation Skills:** Not a professional coach; needs clear guidance

**Goals:**
- Visualize team trust patterns during retrospectives or offsites
- Identify relationship repair opportunities before conflicts escalate
- Facilitate safe conversations about trust and collaboration
- Use simple tool that team members can access easily
- Track team cohesion improvements over time

---

## 3. User Journeys

### 3.1 Journey: First-Time Self-Reflector Maps Personal Relationships

**Actors:** Individual User (Solo)

**Steps:**
1. **User arrives at tool** via web link (no signup required)
2. **Welcome modal appears** with 3-slide introduction:
   - **What:** "Map bidirectional trust in your relationships"
   - **Why:** "Identify patterns, asymmetries, and areas for growth"
   - **How:** "Add people, score trust in both directions by clicking arrows"
3. **User clicks "Try Example Map"** to see pre-populated demo
4. **Example loads** showing 6 relationships with varied trust patterns:
   - High mutual trust (both directions green)
   - Trust asymmetry (outward green, inward yellow)
   - Low mutual trust (both directions red)
5. **User clicks arrows** to cycle through trust scores (0→1→2→3→0)
6. **User sees color changes** and understands scoring mechanism
7. **User notices patterns:**
   - "I trust my manager, but they don't seem to trust me" (asymmetry)
   - "High trust cluster with my team" (pattern)
8. **User clicks "Clear Map"** to start own mapping
9. **User adds first person:** Types name "Sarah" in input field
10. **User sees person appear** on circular layout
11. **User adds 5 more people:** Manager, direct report, peer, stakeholder, mentor
12. **User scores first relationship** by clicking outward arrow (green = high trust)
13. **User scores inward arrow** (yellow = medium trust perceived)
14. **User sees asymmetry visually** (green outward, yellow inward)
15. **User continues scoring** all 6 relationships
16. **User steps back and observes patterns:**
   - "Most of my relationships show trust asymmetry"
   - "I don't trust my stakeholder, and they don't trust me either"
17. **User sees info banner:** "Your map is auto-saved locally"
18. **User closes browser** feeling accomplished
19. **User returns next day:** Map persists, picks up where they left off
20. **User reflects on insights** and decides to work on stakeholder relationship

**Pain Points Addressed:**
- ✅ Clear starting point (example map)
- ✅ Low barrier to entry (no signup, auto-save)
- ✅ Visible patterns (color-coded trust scores)
- ✅ Safe exploration (local storage, privacy-first)
- ✅ Quick success (<60 seconds to first scored relationship)

---

### 3.2 Journey: Coach Facilitates Trust Mapping Session

**Actors:** ProActive Coach, Coaching Client

**Session Flow (20 minutes):**

1. **Coach introduces tool** (2-3 minutes)
   - Explains bidirectional trust concept
   - Shows example map briefly
   - Emphasizes: "No right answers, just your perception"

2. **Client identifies relationships** (3-5 minutes)
   - Coach asks: "Who are 5-8 people you interact with regularly at work?"
   - Client lists: Manager, 2 peers, direct report, cross-functional partner, senior leader
   - Coach adds each person to map while client speaks

3. **Client scores trust levels** (8-10 minutes)
   - Coach guides: "For your manager, how much do you trust going to them?"
   - Client responds: "Depends on the situation" (medium/yellow)
   - Coach clicks outward arrow to yellow
   - Coach asks: "How much do they trust you coming to them?"
   - Client reflects: "I think they'd definitely be open" (high/green)
   - Coach clicks inward arrow to green
   - **Asymmetry revealed:** Client sees yellow→green pattern
   - Coach asks: "What do you notice about this relationship?"
   - Client insight: "I didn't realize I hold back with them, but they're actually welcoming"
   - Repeat for 5-6 priority relationships

4. **Explore patterns together** (5-7 minutes)
   - Coach asks: "What patterns do you see?"
   - Client observations:
     - "I have trust asymmetries with authority figures"
     - "My peer relationships are more balanced"
     - "I trust my direct report, but maybe they don't trust me as much"
   - Coach asks: "How does this imbalance feel for you?"
   - Client reflects: "Makes sense why I feel anxious in 1-on-1s with my manager"

5. **Action planning** (3-5 minutes)
   - Coach asks: "If you could change one arrow, which would it be?"
   - Client chooses: "I want to trust my manager more (yellow→green)"
   - Coach asks: "What small experiment could you try?"
   - Client commits: "I'll bring one vulnerable topic to our next 1-on-1"

6. **Save and close** (1-2 minutes)
   - Coach clicks "Save to Cloud" with map name: "Sarah - Nov 2025"
   - Coach shares 8-character share code with client
   - Client can revisit map between sessions
   - Coach exports JSON for client file

**Pain Points Addressed:**
- ✅ Structured framework (bidirectional scoring)
- ✅ Visual conversation tool (patterns emerge live)
- ✅ Session time efficiency (20-minute flow)
- ✅ Client safety (privacy-first, no judgments)
- ✅ Tangible deliverable (saved map + share code)

---

### 3.3 Journey: User Tracks Trust Changes Over Time

**Actors:** Individual User (Returning)

**Steps:**
1. **User returns after 3 months** to reassess relationships
2. **User opens "My Cloud Maps"** and selects "Sarah - Nov 2025"
3. **User loads previous map** to review baseline
4. **User notices past patterns:**
   - Manager relationship was yellow outward, green inward
   - Peer relationships mostly green mutual
   - Direct report showed trust asymmetry
5. **User creates version snapshot** with summary: "Baseline - Before manager 1-on-1s"
6. **User updates manager relationship:**
   - Changes outward arrow from yellow→green
   - Inward arrow stays green
   - Now shows mutual high trust (both green)
7. **User sees visual improvement** (color change from asymmetry to balance)
8. **User reflects:** "The vulnerable 1-on-1s worked - I trust them now"
9. **User updates other relationships** that have changed
10. **User compares versions** using version history feature
11. **User sees progress:** 2 relationships improved from yellow→green
12. **User exports updated map** as JSON for personal records
13. **User saves new version** with summary: "Feb 2025 - Post-intervention"
14. **User feels validated** seeing tangible evidence of relationship growth

**Pain Points Addressed:**
- ✅ Progress tracking (version history)
- ✅ Evidence of improvement (visual before/after)
- ✅ Motivation to continue (seeing growth)
- ✅ Longitudinal reflection (3-month snapshots)

---

## 4. Feature Requirements

### 4.1 Core Features (Must-Have)

#### 4.1.1 Visual Relationship Canvas
**User Need:** Users need to see all their relationships spatially to identify patterns and clusters.

**Capabilities:**
- User views circular layout with "You" at center
- Up to 8 people arranged in equal radial spacing around center
- Central "You" node is visually distinct (larger, navy blue)
- Peripheral nodes show person's name clearly
- Lines connect "You" to each person (relationship links)
- Layout is clean, uncluttered, and legible

**Acceptance Criteria:**
- Canvas displays immediately on page load
- "You" node is clearly the focal point
- All person names are readable without overlap
- Layout adapts gracefully from 1-8 people
- Visual hierarchy guides attention to center→periphery

---

#### 4.1.2 Bidirectional Trust Scoring
**User Need:** Users need a structured way to assess trust in both directions for each relationship.

**Capabilities:**
- Each relationship has two directional trust assessments:
  - **Outward Arrow (Solid):** "How much do I trust going to them?"
  - **Inward Arrow (Dashed):** "How much do they trust coming to me?"
- Four trust levels with clear meanings:
  - **Score 3 (Green):** High trust - "I'd definitely go to them"
  - **Score 2 (Yellow):** Medium trust - "Depends on the situation"
  - **Score 1 (Red):** Low trust - "Unlikely or uncomfortable"
  - **Score 0 (Gray):** Not yet scored
- User clicks arrow to cycle through scores (0→1→2→3→0)
- Visual feedback shows color change immediately
- Color legend visible on screen for reference

**Acceptance Criteria:**
- Both arrows clickable and responsive
- Color changes reflect score accurately
- Score meanings are clear and intuitive
- User can change score at any time
- Visual distinction between outward (solid) and inward (dashed) arrows

---

#### 4.1.3 Add/Remove People
**User Need:** Users need to build their relationship network by adding relevant people and removing irrelevant ones.

**Capabilities:**
- User adds person by typing name in input field
- Person appears immediately on canvas
- User can add up to 8 people maximum
- User can remove person via delete/remove action
- Clear visual feedback when adding/removing
- Input validation prevents empty names or duplicates
- Character limit enforced (20 characters for names)

**Acceptance Criteria:**
- Add person in <3 seconds (smooth UX)
- Person appears on canvas immediately
- Remove person updates canvas in real-time
- Validation shows helpful error messages (non-blocking)
- Maximum capacity (8 people) communicated clearly
- No duplicate names allowed

---

#### 4.1.4 Automatic Local Persistence
**User Need:** Users need their work saved automatically so they never lose progress.

**Capabilities:**
- Map data auto-saves to browser local storage
- No manual "save" action required
- Data persists across browser close/reopen
- User can continue exactly where they left off
- Auto-save happens after every change (debounced)
- Info message reassures user: "Your map is auto-saved locally"

**Acceptance Criteria:**
- All changes save within 2 seconds
- Data survives browser refresh
- Data survives computer restart
- No data loss during normal usage
- User never sees unsaved changes indicator

---

#### 4.1.5 Privacy-First Design
**User Need:** Users need confidence that sensitive relationship data is private and secure.

**Capabilities:**
- Default storage is local-only (browser localStorage)
- No account required for basic usage
- No data transmitted to servers by default
- Cloud storage is opt-in, not default
- Anonymous authentication for cloud saves (no email/password)
- Clear messaging about where data is stored
- Export capability gives user full data portability

**Acceptance Criteria:**
- Local storage is default behavior
- Cloud save is clearly optional
- User understands data location at all times
- No PII collected beyond user-provided names
- User can export all data as JSON file

---

#### 4.1.6 Color-Coded Visual Feedback
**User Need:** Users need to identify relationship health at a glance without reading text.

**Capabilities:**
- Trust scores represented by colors:
  - **Green:** High trust (positive, healthy)
  - **Yellow:** Medium trust (neutral, contextual)
  - **Red:** Low trust (challenged, needs attention)
  - **Gray:** Not yet scored (neutral, incomplete)
- Color legend displayed prominently
- Arrows change color immediately when clicked
- High-contrast colors meet accessibility standards
- Colors supplemented by patterns (solid vs dashed) for colorblind users

**Acceptance Criteria:**
- Colors are distinguishable at a glance
- Color meanings are intuitive (green=good, red=challenged)
- WCAG 2.1 AA contrast ratios met
- Colorblind-safe design (patterns supplement colors)
- Legend always visible for reference

---

### 4.2 Important Features (Should-Have)

#### 4.2.1 Cloud Storage with Sharing
**User Need:** Users need to save maps to cloud for access across devices and to share with coaches/facilitators.

**Capabilities:**
- User clicks "Save to Cloud" to upload map
- Anonymous authentication initializes automatically
- User provides map name (e.g., "Work Relationships - Nov 2025")
- System generates unique 8-character share code
- User can copy share link to clipboard
- Recipients load map in read-only mode via share link
- User accesses "My Cloud Maps" to see all saved maps
- User can delete cloud-saved maps

**Acceptance Criteria:**
- Cloud save completes in <5 seconds
- Share code is unique, short (8 chars), human-readable
- Share link works across browsers and devices
- Read-only access enforced for recipients
- User can see list of all their cloud maps
- Delete operation requires confirmation

---

#### 4.2.2 Version History & Snapshots
**User Need:** Users need to track how relationships change over time and compare past states.

**Capabilities:**
- System auto-saves version snapshot every 5 minutes (if changes detected)
- User can create manual snapshot with custom summary
- Up to 10 versions stored in local storage
- User views version history list with timestamps and summaries
- User loads previous version to compare with current state
- User exports individual versions as JSON
- User restores previous version if desired
- Version comparison feature shows differences (diff analysis)

**Acceptance Criteria:**
- Auto-save versions without user intervention
- Manual snapshots include user-provided summary
- Version list shows meaningful labels (timestamp + summary)
- User can navigate between versions smoothly
- Version comparison highlights changes clearly
- Restore operation includes confirmation

---

#### 4.2.3 Import/Export
**User Need:** Users need to export maps for record-keeping and import previously exported maps.

**Capabilities:**
- User exports map as JSON file
- Exported file includes:
  - All relationships (person names)
  - All trust scores (bidirectional)
  - Metadata (creation date, last updated)
- File naming includes timestamp for organization
- User imports previously exported JSON file
- Import validates file integrity before loading
- Import replaces current map (with confirmation)
- Invalid files rejected with clear error message

**Acceptance Criteria:**
- Export creates valid JSON file
- Exported file name includes readable timestamp
- Import loads all data accurately
- Invalid files show helpful error message
- Import warns before overwriting current map
- Exported data is human-readable (not obfuscated)

---

#### 4.2.4 Example/Demo Map
**User Need:** New users need a quick starting point to understand how the tool works.

**Capabilities:**
- User clicks "Try Example Map" button
- Demo map loads with 6 pre-populated relationships:
  - Mix of high/medium/low trust scores
  - Examples of trust asymmetries
  - Examples of mutual trust
- Example names are generic/fictional (e.g., "Manager", "Peer A")
- User can interact with example (click arrows, explore)
- User clicks "Clear Map" to start their own mapping
- Example provides learning without commitment

**Acceptance Criteria:**
- Example loads in <2 seconds
- Example demonstrates all key concepts (bidirectional, asymmetry, patterns)
- Example names don't imply specific identities
- Clear path to exit example and start own map
- Example includes varied trust patterns (not all green or all red)

---

#### 4.2.5 Onboarding Welcome Flow
**User Need:** First-time users need orientation to understand purpose, value, and usage.

**Capabilities:**
- Welcome modal appears on first visit (detectable via localStorage flag)
- 3-slide carousel covers:
  - **Slide 1 (What):** "Visualize bidirectional trust in your relationships"
  - **Slide 2 (Why):** "Identify patterns, asymmetries, and growth areas"
  - **Slide 3 (How):** "Add people, score trust by clicking arrows"
- User navigates slides with Next/Back buttons
- User skips with "Skip" or "Don't show again" checkbox
- Modal closes after last slide or when skipped
- User can access help/instructions anytime via "?" button

**Acceptance Criteria:**
- Modal appears only on first visit (or if user clears browser data)
- Slides are concise (2-3 sentences each)
- Visual examples supplement text
- User can skip easily without frustration
- "Don't show again" preference persists

---

#### 4.2.6 Toast Notification System
**User Need:** Users need non-intrusive feedback for actions without blocking workflows.

**Capabilities:**
- Toast notifications appear for key actions:
  - Success: "Map saved to cloud" (green)
  - Error: "Failed to save map" (red)
  - Info: "Your map is auto-saved locally" (blue)
  - Warning: "Maximum 8 people reached" (amber)
- Toasts slide in from right side of screen
- Auto-dismiss after 4 seconds
- User can dismiss manually by clicking close icon
- Multiple toasts stack vertically
- Screen reader announcements for accessibility

**Acceptance Criteria:**
- Toasts don't block user from continuing work
- Toast types are visually distinct (color + icon)
- Auto-dismiss timing feels natural (not too fast/slow)
- Toasts are accessible to screen readers
- Multiple toasts don't overlap or obscure content

---

### 4.3 Nice-to-Have Features (Could-Have)

#### 4.3.1 Keyboard Navigation
**User Need:** Power users and accessibility users need efficient keyboard-only navigation.

**Capabilities:**
- Full keyboard support for all interactive elements
- Logical tab order (input → add button → arrows → actions)
- Keyboard shortcuts for common actions:
  - `Ctrl/Cmd + S`: Save to cloud
  - `Ctrl/Cmd + E`: Export map
  - `Ctrl/Cmd + Z`: Undo last action
  - `?`: Open help modal
  - `Esc`: Close modals
- Visible focus indicators (high-contrast outline)
- Arrow keys to navigate between people/arrows
- Enter/Space to activate buttons/arrows

**Acceptance Criteria:**
- All features accessible without mouse
- Tab order follows logical flow
- Focus indicators clearly visible (WCAG 2.1 AA)
- Keyboard shortcuts documented in help modal
- Screen reader compatible

---

#### 4.3.2 Undo/Redo System
**User Need:** Users need to reverse mistakes quickly without anxiety.

**Capabilities:**
- Undo last action with button or keyboard shortcut
- 10-second undo window for accidental deletions
- Undo history (up to 10 actions)
- Redo previously undone action
- Clear indication of what will be undone
- Toast confirmation: "Person removed (Undo?)"

**Acceptance Criteria:**
- Undo reverses last action accurately
- Undo history preserved across multiple actions
- Redo restores undone action correctly
- User can undo/redo without data corruption
- Undo window provides safety net for accidents

---

#### 4.3.3 Mobile-Optimized Interface
**User Need:** Users on tablets and phones need touch-friendly, responsive design.

**Capabilities:**
- Responsive layout adapts to screen sizes (320px - 1920px)
- Touch-friendly controls (minimum 44px touch targets)
- Bottom navigation sheet for mobile (instead of top buttons)
- Swipe gestures for version history navigation
- Touch-optimized arrow clicking (larger tap areas)
- Legible text and icons on small screens
- Hamburger menu for secondary actions

**Acceptance Criteria:**
- Usable on phones (375px width)
- Smooth on tablets (768px - 1024px)
- No horizontal scrolling required
- Touch interactions feel natural
- Text remains readable at mobile sizes

---

#### 4.3.4 Relationship Notes/Context
**User Need:** Users need to capture qualitative context beyond numeric scores.

**Capabilities:**
- User adds notes to each relationship
- Notes field appears when relationship is selected
- Notes support multi-line text (up to 500 characters)
- Notes persist with map data
- Notes visible in exported JSON
- Optional field (not required to use tool)

**Acceptance Criteria:**
- Notes field easy to access
- Character limit enforced gracefully
- Notes save automatically
- Notes included in export/import
- Notes don't clutter main interface

---

#### 4.3.5 Pattern Insights & Suggestions
**User Need:** Users need automated insights to surface patterns they might miss.

**Capabilities:**
- System analyzes completed map and identifies:
  - Trust asymmetries (outward ≠ inward)
  - Clusters of low trust (multiple red relationships)
  - Isolated high trust (only 1-2 green relationships)
  - Universal patterns (e.g., "trust asymmetries with authority")
- Insights displayed in non-intrusive panel
- User can dismiss insights if not relevant
- Insights based on actual data, not assumptions
- Suggestions align with coaching frameworks (e.g., ProActive)

**Acceptance Criteria:**
- Insights are accurate and relevant
- Suggestions enhance, not replace, user judgment
- User can ignore/dismiss insights easily
- Insights don't create anxiety or judgment
- Patterns align with established relationship frameworks

---

## 5. User Experience Principles

### 5.1 Psychological Safety First
**Principle:** Users must feel safe exploring sensitive relationship dynamics without judgment or risk.

**Implications:**
- No right/wrong answers messaging
- Privacy-first default (local storage, not cloud)
- Clear data ownership (user can export/delete anytime)
- Reassuring microcopy ("You can always undo", "No one else can see this")
- Non-blocking validation (helpful hints, not angry alerts)
- Calm, neutral visual design (no harsh reds or aggressive tones)

---

### 5.2 Progressive Disclosure
**Principle:** Simple tasks stay simple; complexity available when needed.

**Implications:**
- Initial view shows only essential actions (Add Person, Try Example)
- Advanced features (cloud save, version history, export) revealed progressively
- Welcome flow introduces core concepts, not every feature
- Empty states guide next action clearly
- Features appear contextually (e.g., "Save to Cloud" after map is populated)

---

### 5.3 Fast Time-to-First-Success
**Principle:** Users should experience success within 60 seconds to build confidence.

**Implications:**
- "Try Example Map" provides instant gratification (no thinking required)
- Adding first person takes <10 seconds (simple input + click)
- First arrow click gives immediate visual feedback (color change)
- Auto-save eliminates "where do I save?" confusion
- Onboarding is skippable for users who want to dive in

---

### 5.4 Visual Clarity Over Feature Density
**Principle:** Relationship patterns should be visible at a glance without cognitive overload.

**Implications:**
- Clean, uncluttered canvas (generous whitespace)
- Color-coded trust scores for instant comprehension
- Maximum 8 relationships (clarity over quantity)
- High-contrast visual design (WCAG AA compliance)
- Patterns (solid vs dashed arrows) supplement colors for accessibility

---

### 5.5 Facilitator-Friendly Design
**Principle:** Tool should support coached sessions without dominating the conversation.

**Implications:**
- Coach can drive (add people, score) while client speaks
- Screen-shareable layout (legible at distance)
- Minimal clicks for common actions (add, score, save)
- No distracting animations or auto-play elements
- Export/share enables asynchronous follow-up

---

## 6. Success Metrics & KPIs

### 6.1 Usability Metrics
- **Time to First Success:** <60 seconds (from arrival to first scored relationship)
- **Target:** 80% of users achieve this
- **Task Completion Rate:** Percentage of users who complete at least one relationship map
- **Target:** 90%+
- **Error Rate:** Number of errors per session
- **Target:** <0.5 (down from 2.5 baseline)
- **System Usability Scale (SUS):** Post-session survey score
- **Target:** 82+ (from 68 baseline)

### 6.2 Engagement Metrics
- **Relationships Mapped:** Average number of people per map
- **Target:** 5-8 (optimal range)
- **Scoring Completeness:** Percentage of relationships with both arrows scored
- **Target:** 85%+
- **Return Usage:** Users who create 2+ maps
- **Target:** 40% within 30 days
- **Cloud Save Adoption:** Percentage of users who save to cloud
- **Target:** 25% (opt-in feature)

### 6.3 Emotional Metrics
- **Calm:** Percentage of users reporting feeling "calm" during use
- **Target:** 75% (from 30% baseline)
- **Anxious:** Percentage reporting feeling "anxious"
- **Target:** <15% (from 55% baseline)
- **Competent:** Percentage feeling "competent/capable"
- **Target:** 85% (from 45% baseline)
- **Enjoyment:** Percentage who "enjoyed the experience"
- **Target:** 60% (from 25% baseline)

### 6.4 Technical Metrics
- **Page Load Time:** Time to interactive
- **Target:** <3 seconds
- **Lighthouse Performance Score:** Google Lighthouse audit
- **Target:** >90
- **Accessibility Score:** WCAG 2.1 AA compliance
- **Target:** 100 (Lighthouse Accessibility)
- **Error-Free Sessions:** Percentage of sessions without JavaScript errors
- **Target:** 99%+

---

## 7. Out of Scope

### 7.1 Excluded from This Version
- **More than 8 relationships:** Intentionally limited for visual clarity
- **Organizational charts:** Not a replacement for hierarchical org structures
- **Performance reviews:** Not a performance management tool
- **Team collaboration mode:** Focus is individual reflection, not real-time multi-user editing
- **AI-powered insights:** No algorithmic recommendations (manual pattern recognition only)
- **Email/password accounts:** Anonymous authentication only (no user registration)
- **Native mobile apps:** Web-only, responsive design
- **Export to PDF/PNG:** JSON export only (no visual image export)

### 7.2 Deferred to Future Versions
- **Relationship history timelines:** Automated tracking of trust changes over months/years
- **Relationship action plans:** Structured improvement plans per relationship
- **Integration with CRM/HR systems:** Standalone tool only
- **Multi-language support:** English only initially
- **Customizable trust dimensions:** Fixed 4-level scoring (not customizable)
- **Team/group mapping:** Individual perspective only (not collective team view)
- **Video/audio annotations:** Text-based notes only

---

## 8. Constraints & Assumptions

### 8.1 Constraints
- **Maximum 8 relationships:** Design decision for visual clarity and cognitive load
- **Anonymous sessions:** Device/browser-specific; no cross-device sync for anonymous users
- **Local storage limits:** ~5-10MB typical browser limit (sufficient for 100+ maps)
- **Web-only deployment:** No native mobile/desktop apps
- **Client-side rendering:** All computation happens in browser (no server-side processing)

### 8.2 Assumptions
- **Users have stable internet:** For cloud save feature (local storage works offline)
- **Modern browsers:** Chrome 90+, Firefox 88+, Safari 14+, Edge 90+
- **Basic computer literacy:** Can use web applications comfortably
- **Trust is assessable:** Users can introspect and score their trust perceptions
- **Bidirectional framing is intuitive:** Users understand "my trust in them" vs "their trust in me"
- **Privacy matters:** Users prefer local-first storage over mandatory cloud accounts

---

## 9. Accessibility Requirements

### 9.1 WCAG 2.1 AA Compliance (Must-Have)

**Perceivable:**
- Color contrast ratios ≥4.5:1 for text, ≥3:1 for UI components
- Color not sole means of conveying information (patterns supplement colors)
- Text resizable up to 200% without loss of functionality
- Alternative text for SVG elements

**Operable:**
- All functionality keyboard-accessible
- No keyboard traps (modals can be escaped)
- Visible focus indicators (3px outline, high contrast)
- Minimum 44px touch targets for mobile
- Timing adjustable (auto-dismiss toasts can be disabled)

**Understandable:**
- Consistent navigation patterns
- Clear labels on all inputs and buttons
- Error messages are descriptive and helpful
- Language is plain, jargon-free

**Robust:**
- Valid HTML5 semantic markup
- ARIA labels where needed (landmarks, live regions)
- Compatible with assistive technologies (screen readers, magnifiers)

### 9.2 Screen Reader Support

**Required Features:**
- ARIA labels on all interactive elements
- Live region announcements for dynamic changes (toasts, map updates)
- Semantic HTML (nav, main, section, button elements)
- Alternative text for visual-only information
- Focus management in modals (trap focus, return on close)

**Acceptance Criteria:**
- Passes VoiceOver (macOS/iOS) testing
- Passes NVDA (Windows) testing
- All user journeys completable without sight
- Announcements are meaningful and timely

### 9.3 Motion & Animation Preferences

**Reduced Motion Support:**
- Respects `prefers-reduced-motion` media query
- Disables toast slide-in animations when reduced motion preferred
- Replaces transitions with instant state changes
- No auto-playing animations or carousels

---

## 10. Security & Privacy

### 10.1 Input Validation & XSS Protection

**Threat Model:** Malicious user attempts to inject scripts via person names or notes.

**Mitigations:**
- Comprehensive input sanitization module
- HTML tag stripping via regex before storage
- Special character encoding for safe display
- SVG-specific injection prevention (no dynamic `<script>` tags)
- URL validation blocks `javascript:` and `data:` protocols
- Character limits enforced (20 chars for names, 500 for notes)

**Acceptance Criteria:**
- XSS test suite passes (337-line test file validates)
- Malicious inputs render harmlessly
- No script execution from user-provided data

### 10.2 Cloud Storage Security

**Threat Model:** User A attempts to access User B's maps.

**Mitigations:**
- Row Level Security (RLS) policies on database
- Anonymous authentication with server-verified `auth.uid()`
- Users can only access maps with matching `device_id`
- Share codes enable read-only access (explicit opt-in)
- Input validation before all database operations
- Session tokens in localStorage (30-day expiry, auto-refresh)

**Acceptance Criteria:**
- RLS test suite passes (526-line security test file)
- Cross-user access attempts fail with 403 Forbidden
- Share codes work only for explicitly shared maps
- Anonymous sessions isolated per device/browser

### 10.3 Data Privacy

**Privacy-First Principles:**
- Default storage: Local-only (no server transmission)
- Cloud save: Opt-in, anonymous (no email/password/name)
- No PII collected beyond user-provided relationship names
- No analytics tracking or third-party scripts
- User can export all data and delete cloud maps anytime
- No data sharing with third parties

**Acceptance Criteria:**
- Privacy policy clearly states data handling
- User controls all data (export/delete)
- No unexpected data transmission
- Anonymous sessions cannot be linked to real-world identity

---

## 11. Differences from BMAD Edition

### 11.1 Philosophical Differences

**Claude Edition:**
- **Philosophy:** "Ship, don't infrastructure" - functional over perfect
- **Development:** 7-day sprint to production
- **Architecture:** Monolithic, vanilla JavaScript (no frameworks)
- **Focus:** Production-ready v1.0 with comprehensive documentation

**BMAD Edition:**
- **Philosophy:** Methodologically rigorous, coaching-centric
- **Development:** BMAD-structured phases (Analysis → Planning → Solutioning → Implementation)
- **Architecture:** React + TypeScript, modular components, modern build tools
- **Focus:** Pilot with 2 ProActive coaches, methodology fidelity

### 11.2 Feature Differences

| Feature | Claude Edition | BMAD Edition |
|---------|---------------|--------------|
| **Trust Scoring** | 4-level bidirectional (0-3) | 5-dimension valence (-5 to +5) |
| **Max Relationships** | 8 people | Unlimited (performance degrades >100) |
| **Assessment Framework** | Simple trust levels (High/Medium/Low) | Trust, Communication, Support, Respect, Alignment |
| **Cloud Storage** | Supabase anonymous auth, share codes | Planned (Supabase declared, not yet integrated) |
| **Version History** | 10 versions, auto-save every 5 min | Planned (Phase 5) |
| **Import/Export** | JSON import/export functional | Export only (import planned Phase 5) |
| **Onboarding** | 3-slide welcome modal, example map | Planned (demo instructions exist) |
| **Accessibility** | WCAG 2.1 AA compliant (100 Lighthouse) | Planned (Phase 5 keyboard navigation) |
| **Deployment** | Live production (GitHub Pages) | Local dev only (Vercel deployment documented) |

### 11.3 Target User Differences

**Claude Edition:**
- **Primary:** Individual self-reflectors (solo use)
- **Secondary:** Coaches (facilitator role)
- **Use Case:** Personal relationship awareness, coaching sessions

**BMAD Edition:**
- **Primary:** ProActive Certified Coaches (exclusive tool)
- **Secondary:** Coaching clients (guided by coaches)
- **Use Case:** ProActive methodology coaching sessions, client engagement

---

## 12. Development History & Context

### 12.1 Ship Timeline

**7-Day Development Sprint (November 2025):**
- **Day 1-2:** Core visualization + trust scoring
- **Day 3-4:** Cloud storage + version history + security hardening
- **Day 5-6:** Accessibility + onboarding + toast notifications
- **Day 7:** Documentation + deployment + validation

**Production Launch:** November 2025 (https://rhart696.github.io/true-valence-mapper/)

### 12.2 Multi-Agent Architecture Context

**Claude Edition Role:**
- Reference implementation for comparison
- Baseline for evaluating other AI agent approaches
- "Pure Claude Code" example (no human intervention)

**Planned Sister Editions:**
- Codex Edition (GPT-5 automation focus)
- Multi Path Edition (parallel agent workflows)
- Gemini Edition (Google Gemini 2.5 optimization)
- BMAD-Method Edition (BMAD coaching methodology)
- Stitch Edition (automation platform integration)
- Speckit Edition (enablement workflow focus)

**Parent Repository:**
- `true-valence-mapper` (governance, comparison matrix, shared assets)
- Git submodules track all editions
- Cross-edition evaluation rubrics

---

## 13. Appendix

### 13.1 Glossary

**Trust Scoring Terms:**
- **Outward Arrow (Solid):** Represents "my trust in going to them"
- **Inward Arrow (Dashed):** Represents "their trust in coming to me"
- **Trust Asymmetry:** Mismatch between outward and inward scores (e.g., I trust them more than they trust me)
- **Trust Level:** Score from 0-3 (Gray=unscored, Red=low, Yellow=medium, Green=high)

**Technical Terms:**
- **Local Storage:** Browser-based storage (persists data without servers)
- **Anonymous Auth:** Authentication without email/password (device/browser-specific)
- **RLS (Row Level Security):** Database access control enforcing user data isolation
- **Share Code:** 8-character unique identifier for sharing maps via URL
- **Version Snapshot:** Saved state of map at specific point in time

**Accessibility Terms:**
- **WCAG 2.1 AA:** Web Content Accessibility Guidelines, Level AA compliance
- **Screen Reader:** Assistive technology that reads screen content aloud
- **Focus Indicator:** Visual outline showing keyboard-focused element
- **ARIA:** Accessible Rich Internet Applications (markup for assistive tech)

### 13.2 Related Resources

**Live Product:**
- Production URL: https://rhart696.github.io/true-valence-mapper/
- GitHub Repository: https://github.com/rhart696/true-valence-mapper-claude

**Documentation:**
- Coach Facilitator Guide: 20-page session facilitation manual
- UX Optimization Plan: Baseline → target metrics with improvement roadmap
- Security Documentation: XSS protection, RLS policies, auth risk analysis
- Accessibility Guide: WCAG 2.1 AA implementation details

**Multi-Agent Family:**
- Parent Repository: https://github.com/rhart696/true-valence-mapper
- BMAD Edition: `/home/ichardart/dev/projects/true-valence-mapper-bmad`

---

## Document Metadata

**Generated:** December 10, 2025
**Based on:** Codebase exploration of `/home/ichardart/dev/projects/true-valence-mapper-claude`
**Purpose:** Retrospective PRD documenting as-built product state
**Audience:** Product managers, stakeholders evaluating completed work, future developers
**Status:** Production v1.0 live deployment

**Key Insights:**
- Functional production application built in 7-day sprint (November 2025)
- Privacy-first design with local storage default, opt-in cloud sharing
- WCAG 2.1 AA accessibility compliance (100 Lighthouse score)
- Comprehensive security (XSS protection, RLS policies, anonymous auth)
- Facilitator-friendly design for coached sessions (20-minute workflow)
- Simple 4-level trust scoring vs BMAD's 5-dimension valence assessment
- Monolithic architecture trade-off (ship fast vs modular structure)
- Strong foundation for UX enhancements (progressive disclosure, undo system planned)

---

**End of Document**
