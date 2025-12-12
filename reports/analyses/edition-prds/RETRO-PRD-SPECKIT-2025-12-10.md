# Product Requirements Document (Retrospective)
## True Valence Mapper - Spec-Kit Edition

**Document Type:** Retrospective PRD (Tech-Agnostic)
**Version:** Spec-Kit Edition (MVP Complete)
**Date:** December 10, 2025
**Author:** Generated from project state analysis

---

## 1. Executive Summary

### 1.1 Product Vision
True Valence Mapper helps individuals **see their relationships clearly, understand them deeply, and improve them intentionally** through an interactive visual canvas that transforms vague feelings about relationships into concrete, actionable patterns.

### 1.2 Problem Statement
People struggle to understand their personal relationship landscapes. Relationships feel abstract and overwhelming—you can't "see" your social network, identify who you over-rely on, notice who you've neglected, or articulate what makes some relationships feel safe while others feel uncertain. Without visibility, people make relationship decisions blindly, miss important patterns, and fail to nurture connections that matter most.

### 1.3 Target Users
**Primary Users:**
- **Reflective Individuals:** Adults seeking personal growth and relationship self-awareness
- **Life Transition Navigators:** People in new jobs, moves, or relationship changes who need clarity
- **Therapy/Coaching Clients:** Individuals working with professionals who need structured reflection tools

**Secondary Users:**
- **Therapists and Coaches:** Professionals facilitating relationship work with clients
- **Personal Development Enthusiasts:** People using journaling, mindfulness, and growth practices

### 1.4 Success Metrics
- **Time to First Map:** Users create basic map (5-10 people) in under 3 minutes
- **Interaction Speed:** Reposition node in under 2 seconds (click, drag, release)
- **Performance:** Smooth experience with 25+ nodes at 60 FPS
- **Comprehension:** 90% of users complete basic tasks without help
- **Engagement:** Users return after first session to update/reflect
- **Pattern Recognition:** Users identify at least one meaningful insight within first session

---

## 2. User Personas & Pain Points

### 2.1 Primary Persona: The Reflective Individual (Maria)

**Profile:**
- 32-year-old employee navigating workplace relationships
- Values self-awareness and intentional personal growth
- Uses journaling, therapy, or coaching intermittently
- Technically comfortable but prefers simple, intuitive tools
- Time-constrained; needs quick insights without lengthy setup

**Pain Points:**
1. **Overwhelm:** "I have so many relationships, I don't know where to focus my energy"
   - Can't see the whole landscape at once
   - Feels reactive rather than intentional about relationship investment

2. **Confusion:** "I feel uneasy about this person but can't explain why"
   - Vague feelings without specific articulation
   - Hard to communicate relationship dynamics to therapist/coach

3. **Blind Spots:** "I didn't realize I was depending so heavily on just two people"
   - Over-reliance on certain people creates vulnerability
   - Neglected relationships drift without awareness

4. **Relationship Drift:** "We used to be close, but I can't pinpoint when things changed"
   - Gradual changes invisible without tracking
   - No reference point to compare past vs. present

**Goals:**
- Gain clarity on relationship landscape quickly
- Identify which relationships need attention or repair
- Understand specific dimensions of trust (not just "good/bad")
- Track changes over time to notice patterns
- Share visual map with therapist/coach for deeper work

---

### 2.2 Secondary Persona: Therapy/Coaching Client (Michael)

**Profile:**
- 28-year-old in weekly therapy exploring relationship patterns
- Intellectually curious about attachment and emotional patterns
- Struggles with trust and vulnerability
- Wants to apply therapy insights between sessions
- Prefers visual/spatial thinking over purely verbal processing

**Pain Points:**
1. **Verbal Limitations:** Hard to describe complex relationship dynamics in words alone
2. **Pattern Blindness:** Can't see recurring patterns across relationships
3. **Insight Retention:** Forgets therapy breakthroughs between weekly sessions
4. **Homework Resistance:** Traditional journaling feels tedious or unstructured
5. **Therapist Communication:** Difficult to show therapist the "full picture" efficiently

**Goals:**
- Visualize relationship patterns to discuss in therapy
- Apply therapy frameworks (attachment, trust) to real relationships
- Retain insights between sessions through persistent maps
- Identify specific relationships to focus therapeutic work
- Share map with therapist for collaborative exploration

---

### 2.3 Tertiary Persona: Life Transition Navigator (Priya)

**Profile:**
- 35-year-old who recently moved to new city for job
- Building new professional and social networks simultaneously
- Feeling isolated and uncertain about who to invest in
- Wants to be intentional about relationship-building
- Doesn't have established therapist/coach (not in active support)

**Pain Points:**
1. **Fresh Start Anxiety:** "I'm starting from zero—how do I build a healthy network?"
2. **Investment Uncertainty:** "Should I prioritize work friends or outside social connections?"
3. **Comparison Trap:** "My old network felt balanced; this one feels lopsided"
4. **Loneliness Risk:** "I'm so focused on work, am I neglecting personal relationships?"
5. **No Feedback Loop:** "I can't tell if my efforts are creating the network I want"

**Goals:**
- Visualize emerging network to ensure balance (work/personal)
- Track relationship-building efforts and progress
- Compare new network to old network for insights
- Avoid over-reliance on work-only relationships
- Build intentionally rather than reacting to who's available

---

## 3. User Journeys

### 3.1 Journey: First-Time Reflector Creates Relationship Map

**Actors:** Individual User (Solo)

**Context:** Maria has been feeling overwhelmed at work and wants to understand why certain relationships feel draining while others feel energizing. Her therapist suggested mapping her relationships visually.

**Steps:**

1. **Arrival**
   - Maria opens True Valence Mapper
   - Sees clean canvas with "You" node at center
   - Reads brief instruction: "Add people from your life to see your relationship landscape"

2. **Add First Person**
   - Maria clicks "Add Person" button
   - Types "Sarah (Manager)" in name field
   - Presses Enter
   - Sarah's node appears on canvas, positioned radially from center

3. **Add More People (Flow State)**
   - Maria continues adding people rapidly:
     - "Tom (Peer)"
     - "Jenna (Direct Report)"
     - "Alex (Cross-functional Partner)"
     - "David (Friend)"
     - "Lisa (Mentor)"
   - Nodes auto-arrange in radial layout around "You"
   - Maria sees her network taking shape visually

4. **Drag to Reflect Closeness**
   - Maria drags "David (Friend)" closer to center (emotionally close)
   - Drags "Alex (Partner)" slightly farther (less frequent interaction)
   - Positioning feels intuitive, like arranging photos on a desk

5. **Score First Relationship**
   - Maria double-clicks "Sarah (Manager)" node
   - Trust Score Editor modal opens
   - Sees two questions:
     - "How much do you trust going to Sarah?" → Selects "Medium"
     - "How much does Sarah trust you coming to them?" → Selects "High"
   - Checks "Uncertain" box: "This relationship feels unclear to me"
   - Clicks Save

6. **Visual Feedback**
   - Sarah's node border turns yellow-orange (medium trust outward)
   - Trust arrows appear: Yellow arrow (outward), Green arrow (inward)
   - Maria immediately sees asymmetry: "I hold back, but she's welcoming"

7. **Score Remaining Relationships**
   - Maria scores David: High mutual trust (both green)
   - Scores Tom: Medium mutual (both yellow)
   - Scores Jenna: High outward, Medium inward (asymmetry)
   - Leaves Alex and Lisa unscored for now (grey borders)

8. **Pattern Recognition**
   - Maria steps back and observes patterns:
     - "I have asymmetry with authority figures (Sarah, Lisa)"
     - "My peer relationships (Tom) are more balanced"
     - "I trust my direct report, but maybe she doesn't fully trust me yet"
     - "I only have ONE high-trust mutual relationship (David)"

9. **Insight & Action**
   - Maria identifies focus area: "I need to build trust with Jenna"
   - Realizes: "I'm holding back with Sarah unnecessarily"
   - Takes screenshot to share with therapist

10. **Auto-Save Reassurance**
    - Maria sees toast notification: "Map auto-saved locally"
    - Closes browser without manual save action
    - Feels confident she can revisit later

**Pain Points Addressed:**
- ✅ Overwhelm → Entire network visible in one view
- ✅ Confusion → Multi-dimensional trust scoring articulates specific dynamics
- ✅ Blind spots → Visual pattern (only 1 mutual high-trust relationship)
- ✅ Time efficiency → Complete map in <5 minutes

---

### 3.2 Journey: Therapy Client Explores Relationship Patterns

**Actors:** Michael (Client), Dr. Chen (Therapist)

**Context:** Michael has been in therapy for 6 months exploring trust issues stemming from childhood attachment patterns. Dr. Chen suggested using a visual tool to map current relationships.

**Steps:**

1. **Between-Session Mapping** (Solo)
   - Michael creates map with 12 people (family, friends, colleagues)
   - Scores all relationships on trust dimensions
   - Notices pattern: Low inward trust across most relationships
   - Reflection: "I don't believe people want me to come to them"

2. **Session Start** (With Therapist)
   - Michael shares screen showing relationship map
   - Dr. Chen sees entire network at a glance
   - Dr. Chen: "Tell me about the red arrows"

3. **Pattern Exploration**
   - Michael explains: "I scored my brother and my boss both Low inward trust"
   - Dr. Chen: "What's similar about those relationships?"
   - Michael: **"Oh wow—they're both reliable but feel emotionally distant"**
   - Breakthrough: Michael recognizes recurring pattern (high competence, low emotional safety)

4. **Hypothesis Testing**
   - Dr. Chen: "Click on your friend Jake. How did you score that one?"
   - Michael: "High outward, Medium inward"
   - Dr. Chen: "What would it take to test if Jake actually has high inward trust?"
   - Michael: "I could share something vulnerable and see how he responds"

5. **Action Planning**
   - Michael identifies experiment: "Share job stress with Jake this week"
   - Michael uses "Uncertain" flag on Jake's score: "I'll update this after our conversation"
   - Dr. Chen takes note of other low-trust relationships for future sessions

6. **Post-Session Reflection** (Solo, 1 Week Later)
   - Michael meets with Jake, shares vulnerable topic
   - Jake responds with empathy and offers help
   - Michael reopens map, updates Jake: High mutual trust (both green)
   - Sees visual change: Red→Green arrow shift
   - Reflection: "My perception was wrong—he does want me to come to him"

**Pain Points Addressed:**
- ✅ Verbal limitations → Visual map communicates complex dynamics instantly
- ✅ Pattern blindness → Brother-boss similarity revealed visually
- ✅ Insight retention → Persistent map captures breakthrough between sessions
- ✅ Therapist communication → Shared screen enables efficient exploration

---

### 3.3 Journey: Life Transition Navigator Tracks Network Building

**Actors:** Priya (Solo)

**Context:** Priya moved to new city 3 months ago. Feels like she's only building work relationships and neglecting personal/social connections.

**Steps:**

1. **Initial Mapping (Week 1)**
   - Priya creates map with 8 people (all work colleagues)
   - Realizes: "I have ZERO personal/social relationships here yet"
   - Sets intention: "Add one non-work person per month"

2. **First Update (Month 2)**
   - Priya adds "Rachel (Neighbor)" after coffee chat
   - Adds "Gym Class Instructor" after joining fitness community
   - Scores both: Low-Medium trust (relationship too new)
   - Reflection: "Network still 80% work, but I'm making progress"

3. **Major Shift (Month 4)**
   - Priya revisits map after joining book club
   - Adds "Elena (Book Club)" and "Mark (Book Club)"
   - Updates Rachel: Medium→High trust after several hangouts
   - Notices: "I now have 4 non-work relationships (10 total)"

4. **Comparison with Old Network** (Month 6)
   - Priya clicks "Reset Map" to compare
   - Maps her old city network from memory:
     - 12 people total
     - 60% personal, 40% work
     - 8 high-trust mutual relationships
   - Returns to current map:
     - 10 people
     - 40% personal, 60% work
     - 3 high-trust mutual relationships

5. **Insight & Adjustment**
   - Priya realizes: "I'm building quantity, but not enough depth"
   - Identifies priority: "Focus on deepening trust with Rachel and Elena vs. adding more people"
   - Action: Initiates vulnerable conversations to shift Medium→High trust

6. **Long-Term Tracking** (Month 12)
   - Priya checks map quarterly
   - Sees gradual shift: 50/50 work-personal balance achieved
   - 6 high-trust mutual relationships
   - Reflection: "My network here now feels sustainable and balanced"

**Pain Points Addressed:**
- ✅ Fresh start anxiety → Visual map shows progress from zero
- ✅ Investment uncertainty → Work/personal ratio visible at a glance
- ✅ Comparison trap → Can recreate old network to compare intentionally
- ✅ No feedback loop → Quarterly check-ins reveal trajectory

---

## 4. Feature Requirements

### 4.1 Core Features (Must-Have)

#### 4.1.1 Interactive Relationship Canvas
**User Need:** Users need to see their entire relationship network spatially to identify patterns and clusters.

**Capabilities:**
- User sees clean canvas with "You" node fixed at center
- User adds people as nodes that appear around center
- Nodes are draggable to reflect emotional closeness or importance
- Radial auto-layout positions nodes evenly in circular arrangement
- Adaptive radius grows as more nodes are added (prevents overlap)
- "You" node is visually distinct (larger, different color) and not draggable
- Canvas updates in real-time as nodes are added/removed/repositioned

**Acceptance Criteria:**
- Canvas loads in under 1 second
- "You" node is immediately identifiable as the focal point
- Users can add 5-10 people in under 3 minutes
- Dragging node feels smooth and responsive (no lag)
- Layout prevents node overlap at all network sizes

---

#### 4.1.2 Add & Remove People
**User Need:** Users need to build their relationship network by adding relevant people and removing people who are no longer relevant.

**Capabilities:**
- User clicks "Add Person" button or presses keyboard shortcut
- User types person's name in input field (max 50 characters)
- User presses Enter to create node immediately
- Node appears on canvas with radial positioning
- User removes person via Delete button or keyboard shortcut (Delete key)
- Removal prompts confirmation if person has trust scores
- Clear visual feedback for add/remove actions (smooth animations)

**Acceptance Criteria:**
- Add person in under 3 seconds (click → type → Enter)
- No duplicate names allowed (validation message shown)
- Remove person updates canvas immediately
- Confirmation prevents accidental deletion of scored relationships
- Input field clears after adding person (ready for next entry)

---

#### 4.1.3 Bidirectional Trust Scoring
**User Need:** Users need to articulate trust dynamics in both directions (not just "I trust them").

**Capabilities:**
- User double-clicks node to open Trust Score Editor modal
- User answers two distinct questions:
  1. **Outward Trust:** "How much do you trust going to this person?"
  2. **Inward Trust:** "How much does this person trust you coming to them?"
- User selects from 3 levels: High, Medium, Low
- User can mark relationship as "Uncertain" if dynamics are unclear
- User clicks Save to apply scores and close modal
- Scores persist and display visually on canvas (node borders, arrows)

**Acceptance Criteria:**
- Modal opens in under 1 second (no loading delay)
- Questions are clearly worded and non-judgmental
- Trust level meanings are explained (tooltips or help text)
- "Uncertain" flag is optional (not required to save)
- Modal can be closed without saving (Cancel button or Esc key)

---

#### 4.1.4 Visual Trust Indicators
**User Need:** Users need to see trust patterns at a glance without reading text labels.

**Capabilities:**
- Node borders are color-coded by outward trust:
  - **High Trust:** Green border
  - **Medium Trust:** Yellow/orange border
  - **Low Trust:** Red border
  - **Unscored:** Grey border
- Bidirectional arrows show trust direction:
  - **Outward arrow (solid):** User's trust in person
  - **Inward arrow (dashed):** Person's trust in user
- Arrows use same color-coding (green/yellow/red)
- Arrows positioned with perpendicular offset for clarity (don't overlap)
- User can toggle trust indicators on/off if desired

**Acceptance Criteria:**
- Colors are distinguishable for colorblind users (patterns supplement colors)
- Arrow directions are intuitive (no confusion about meaning)
- High-contrast design meets WCAG AA standards
- Indicators don't clutter canvas at high node counts (25+ nodes)
- User can identify trust asymmetries in under 5 seconds

---

#### 4.1.5 Drag & Drop Node Positioning
**User Need:** Users need to arrange nodes spatially to reflect relationship importance or emotional closeness.

**Capabilities:**
- User clicks and holds on node to initiate drag
- Node follows cursor smoothly during drag
- Cursor changes to indicate draggable state (grab/grabbing)
- User releases mouse to drop node at new position
- Position persists across sessions (auto-saved)
- "You" node is fixed at center (cannot be dragged)
- Dragging works on mouse, trackpad, and touch devices

**Acceptance Criteria:**
- Drag initiation feels responsive (no delay)
- Node follows cursor at 60 FPS (smooth animation)
- Release positions node exactly where cursor is (no snapping)
- Drag operations work on devices with touch screens
- User can reposition node in under 2 seconds

---

#### 4.1.6 Automatic Data Persistence
**User Need:** Users need their work saved automatically so they never lose progress or insights.

**Capabilities:**
- Canvas state saves to browser localStorage automatically
- Save is debounced (500ms after last change) to optimize performance
- All data persists: nodes, positions, trust scores, zoom/pan state
- User sees reassuring toast: "Map auto-saved locally"
- No manual "Save" button required
- Data survives browser close/reopen
- Graceful degradation if localStorage unavailable (in-memory only)

**Acceptance Criteria:**
- Changes save within 1 second of last edit
- Data survives browser restart
- No data loss during normal usage
- User never sees "unsaved changes" warning
- Toast notification is non-intrusive (auto-dismisses after 3 seconds)

---

#### 4.1.7 Canvas Navigation (Zoom & Pan)
**User Need:** Users with large networks (15+ people) need to zoom and pan to focus on specific areas.

**Capabilities:**
- User zooms via:
  - Zoom controls (+/- buttons)
  - Mouse wheel scroll
  - Keyboard shortcuts (+/- keys)
  - Pinch-to-zoom on touch devices
- Zoom range: 50% to 200%
- User pans by dragging on empty canvas space
- User centers canvas with keyboard shortcut (C key)
- Zoom/pan state persists across sessions

**Acceptance Criteria:**
- Zoom feels smooth (60 FPS, no stuttering)
- Pan differentiates from node dragging (no accidental moves)
- Zoom maintains center of viewport as focal point
- Keyboard shortcuts documented in help/tooltip
- Navigation works on desktop, laptop trackpad, and tablet touch

---

### 4.2 Important Features (Should-Have)

#### 4.2.1 Inline Node Editing
**User Need:** Users need to rename people if they made typos or want to add context (e.g., "Sarah" → "Sarah (Manager)").

**Capabilities:**
- User clicks on node label to enter edit mode
- Text field becomes editable with cursor positioned
- User types new name (max 50 characters)
- User presses Enter or clicks outside to save
- User presses Esc to cancel without saving
- Name updates immediately on canvas

**Acceptance Criteria:**
- Edit mode activates in under 1 second (click → edit)
- Cursor is positioned at end of existing text
- Character limit enforced gracefully (no angry errors)
- Duplicate names prevented (validation message)
- Saving/canceling works via keyboard and mouse

---

#### 4.2.2 Keyboard Shortcuts
**User Need:** Power users need efficient keyboard-only navigation for speed and accessibility.

**Capabilities:**
- Full keyboard support for all core actions:
  - **Arrow keys:** Pan canvas
  - **+/- keys:** Zoom in/out
  - **C key:** Center canvas
  - **Delete key:** Remove selected node
  - **Enter:** Open trust editor for selected node
  - **Esc:** Close modals
  - **Tab:** Navigate between UI elements
- Visible focus indicators show keyboard position
- Shortcuts documented in help panel (? key opens help)

**Acceptance Criteria:**
- All features accessible without mouse
- Focus indicators meet WCAG AA contrast standards
- Shortcuts feel intuitive (match common conventions)
- No keyboard traps (user can always Esc out)
- Help panel lists all shortcuts clearly

---

#### 4.2.3 Reset Map with Confirmation
**User Need:** Users need to start fresh (e.g., life transition) without losing current map accidentally.

**Capabilities:**
- User clicks "Reset Map" button
- Confirmation dialog appears: "This will clear all people and scores. Are you sure?"
- User confirms (Yes) or cancels (No)
- If confirmed, canvas clears to blank state (only "You" node remains)
- Previous data is not recoverable after reset (permanent action)

**Acceptance Criteria:**
- Confirmation dialog prevents accidental resets
- Dialog clearly explains consequences (data loss)
- User can cancel easily (Esc key, No button, X button)
- Reset completes in under 1 second after confirmation
- No residual data remains (trust scores, positions cleared)

---

#### 4.2.4 Responsive Design (Desktop & Tablet)
**User Need:** Users need usable experience across device sizes (laptop, desktop monitor, tablet).

**Capabilities:**
- Layout adapts to screen widths: 768px - 2560px
- Canvas scales to available viewport height
- UI controls reposition responsively (buttons, modals)
- Touch-friendly on tablets (44px minimum touch targets)
- Readable text at all supported screen sizes

**Acceptance Criteria:**
- Usable on 13" laptop (1366x768)
- Optimized for 24" monitor (1920x1080)
- Works on iPad (768x1024)
- No horizontal scrolling required at any size
- Text legible without zooming browser

---

#### 4.2.5 Performance with Large Networks
**User Need:** Users with extensive networks (20-30 people) need smooth performance without lag.

**Capabilities:**
- Canvas maintains 60 FPS with 25+ nodes
- Drag operations feel responsive at all network sizes
- Zoom/pan remain smooth with large node counts
- Auto-save debouncing prevents performance degradation
- Visual indicators load instantly (no delayed rendering)

**Acceptance Criteria:**
- No stuttering or lag during drag operations
- Zoom maintains 60 FPS target
- Auto-save doesn't block UI interactions
- Large networks (30+ nodes) remain usable (may not be 60 FPS but no crashes)

---

### 4.3 Nice-to-Have Features (Could-Have)

#### 4.3.1 Relationship Notes
**User Need:** Users want to capture qualitative context beyond numeric trust scores.

**Capabilities:**
- User adds notes to each relationship (optional field)
- Notes support multi-line text (up to 500 characters)
- Notes visible when hovering over node or in trust editor
- Notes persist with map data
- Notes included in exports (future feature)

**Acceptance Criteria:**
- Notes field easy to find in trust editor
- Character limit enforced gracefully
- Notes don't clutter canvas (show on hover only)
- Formatting preserved (line breaks, basic punctuation)

---

#### 4.3.2 Example/Demo Map
**User Need:** First-time users want a quick starting point to understand how the tool works.

**Capabilities:**
- User clicks "Load Example Map" button
- Demo map loads with 8 pre-populated relationships:
  - Mix of high/medium/low trust scores
  - Examples of trust asymmetries
  - Varied positioning (close/far from center)
- Example names are generic (e.g., "Friend A", "Manager", "Sibling")
- User can interact with example (drag, edit, score)
- User can clear example to start their own map

**Acceptance Criteria:**
- Example loads in under 2 seconds
- Example demonstrates all key concepts (bidirectional trust, positioning)
- Clear path to exit example and start own map
- Example doesn't feel judgmental or prescriptive

---

#### 4.3.3 Export Map as Image
**User Need:** Users want to share visual map with therapist/coach via email/chat without screen sharing.

**Capabilities:**
- User clicks "Export as Image" button
- Canvas renders as PNG file
- Download initiates automatically
- Image includes all visible nodes, arrows, and trust indicators
- Image resolution is high-quality (readable when zoomed)

**Acceptance Criteria:**
- Export completes in under 3 seconds
- Image is legible at standard sizes (1920x1080)
- Colors and text preserved accurately
- File size is reasonable (<2MB for typical maps)

---

#### 4.3.4 Undo/Redo Actions
**User Need:** Users want to reverse mistakes (accidental deletions, wrong scores) without anxiety.

**Capabilities:**
- User clicks Undo button or presses Ctrl/Cmd+Z
- Last action is reversed (node deletion, score change, position change)
- Undo history supports up to 10 actions
- User clicks Redo button or presses Ctrl/Cmd+Y to restore undone action
- Clear indication of what will be undone (tooltip or message)

**Acceptance Criteria:**
- Undo reverses last action accurately
- Undo history preserved across multiple actions
- Redo restores undone action correctly
- User can undo/redo without data corruption

---

#### 4.3.5 Relationship Categories/Tags
**User Need:** Users want to organize relationships by category (Family, Work, Friends, etc.).

**Capabilities:**
- User assigns category to each person (optional)
- Categories are color-coded or icon-marked
- User filters view by category (show only Work, hide Family, etc.)
- Categories are user-defined (not predefined)

**Acceptance Criteria:**
- Category assignment is optional (not required)
- User can create custom categories
- Filtering is instant (no page reload)
- Categories don't clutter interface (collapsible)

---

## 5. User Experience Principles

### 5.1 Reflection Over Judgment
**Principle:** The tool facilitates self-understanding, not scoring people as "good" or "bad."

**Implications:**
- Trust levels are described non-judgmentally ("High trust" not "Good person")
- "Uncertain" flag normalizes relationship ambiguity
- No AI insights that label relationships as "toxic" or "healthy"
- Visual design is calm and neutral (not harsh reds/greens)
- Language throughout is curious, not prescriptive ("How much do you trust...?" not "Rate this person")

---

### 5.2 Privacy First
**Principle:** Relationship data is deeply personal; users must control it completely.

**Implications:**
- Default storage is local-only (browser localStorage, no servers)
- No account required for basic usage
- No cloud sync without explicit opt-in (future feature)
- No analytics tracking user behavior
- Export capability gives users full data portability
- Clear messaging: "Your data stays on your device"

---

### 5.3 Simplicity Over Features
**Principle:** Reflection shouldn't feel like work; lightweight interactions enable flow state.

**Implications:**
- Single-click/drag interactions (no multi-step wizards)
- Auto-save eliminates manual save actions
- Minimal UI chrome (no cluttered toolbars)
- Progressive disclosure (advanced features hidden until needed)
- Fast time-to-first-value (<3 minutes to complete first map)

---

### 5.4 Visual Clarity
**Principle:** The map should reveal patterns, not obscure them.

**Implications:**
- High-contrast visual design (WCAG AA compliance)
- Color-coding supplements spatial positioning (redundant encoding)
- Generous whitespace (not cramped)
- Readable text at default zoom (no squinting)
- Visual hierarchy guides attention (center → periphery)

---

### 5.5 Graceful Growth
**Principle:** The tool should work for 5 people or 50; early simplicity shouldn't create later pain.

**Implications:**
- Radial layout algorithm scales without overlap
- Zoom/pan enable navigation of large networks
- Performance targets account for 25+ nodes
- Data model supports future features (notes, categories, history) without breaking changes

---

## 6. Success Metrics & KPIs

### 6.1 Usability Metrics
- **Time to First Map:** <3 minutes to add 5-10 people
- **Target:** 80% of users achieve this
- **Interaction Speed:** <2 seconds to reposition node (click, drag, release)
- **Target:** 95% of drag operations
- **Task Completion:** Percentage of users who score at least 5 relationships
- **Target:** 70% within first session
- **Comprehension:** Percentage who complete tasks without help
- **Target:** 90%

### 6.2 Engagement Metrics
- **Return Rate:** Users who return after first session
- **Target:** 40% within 7 days
- **Network Size:** Average number of people per map
- **Target:** 8-12 people
- **Scoring Completeness:** Percentage of nodes with trust scores
- **Target:** 60% of nodes scored
- **Session Duration:** Time spent in active mapping session
- **Target:** 10-20 minutes (sweet spot for reflection)

### 6.3 Insight Metrics
- **Pattern Recognition:** Users who identify at least one insight
- **Target:** 75% report meaningful insight in post-session survey
- **Common Insights:**
  - "I didn't realize I was over-relying on X"
  - "I have asymmetry with authority figures"
  - "I'm neglecting personal relationships"
- **Action Planning:** Users who identify specific relationship to focus on
- **Target:** 50% identify action after mapping

### 6.4 Technical Metrics
- **Performance:** Canvas maintains 60 FPS with 25 nodes
- **Target:** 95% of interactions
- **Data Loss:** Incidents of data loss due to bugs
- **Target:** 0 incidents (zero tolerance)
- **Error Rate:** JavaScript errors per session
- **Target:** <0.1 errors per session
- **Browser Compatibility:** Works on Chrome, Firefox, Safari, Edge
- **Target:** 100% of listed browsers

---

## 7. Out of Scope

### 7.1 Explicitly NOT Included (Initial Release)

**Social/Collaboration Features:**
- No sharing maps with friends
- No multi-user real-time editing
- No community/public maps
- **Rationale:** Privacy-first; reflection is personal

**AI/Algorithmic Insights:**
- No AI-generated relationship advice
- No pattern detection algorithms
- No automated suggestions ("You should talk to X")
- **Rationale:** User interprets their own map; avoids judgment

**Cross-Device Sync:**
- No cloud storage
- No mobile app
- No account system
- **Rationale:** Complexity vs. value; localStorage sufficient for MVP

**Historical Tracking:**
- No timeline of trust score changes
- No versioning/snapshots
- No before/after comparisons
- **Rationale:** Deferred to Phase 2; adds complexity

**Export/Reporting:**
- No PDF export
- No data export (CSV/JSON)
- No formatted reports
- **Rationale:** Deferred to Phase 2; not critical for core value

**Predefined Categories:**
- No built-in Family/Work/Friends buckets
- No relationship type templates
- **Rationale:** Users define their own context; avoids prescriptiveness

---

### 7.2 Deferred to Future Versions

**Phase 2 Enhancements:**
- Cloud storage with optional account
- Export map as image (PNG/PDF)
- Historical snapshots (quarterly comparisons)
- Relationship notes/journaling

**Phase 3 Advanced:**
- Mobile app (iOS/Android)
- Multi-user collaboration (coach/therapist shared view)
- Custom trust dimensions (beyond outward/inward)
- Relationship action plans

**Phase 4 Ecosystem:**
- Integration with journaling apps (Day One, Notion)
- Integration with therapy platforms (BetterHelp, Talkspace)
- API for third-party developers

---

## 8. Constraints & Assumptions

### 8.1 Constraints
- **Browser-Only:** Web application only (no native mobile/desktop apps)
- **Local Storage Limits:** ~5-10MB typical browser limit (sufficient for 100+ maps)
- **Single Device:** Data stored per-device (no cross-device sync)
- **Modern Browsers:** Requires Chrome 90+, Firefox 88+, Safari 14+, Edge 90+
- **No Offline Mode:** Requires internet for initial load (works offline after cached)

### 8.2 Assumptions
- **Users can introspect:** Users are capable of assessing their own trust perceptions
- **Bidirectional framing is intuitive:** Users understand "my trust in them" vs. "their trust in me"
- **Visual thinking works:** Users benefit from spatial/visual representation (not purely verbal)
- **Privacy matters:** Users prefer local-first storage over cloud convenience
- **Reflection is valuable:** Users are motivated to invest 10-20 minutes in relationship mapping
- **Context is personal:** Users know who to map (tool doesn't suggest specific people)

---

## 9. Design Principles (SpecKit Edition-Specific)

### 9.1 Specification-Driven Development
**Principle:** Features are defined through structured specs before implementation begins.

**Implications:**
- Every feature has: spec.md, plan.md, data-model.md, tasks.md
- User stories drive task organization (P1, P2, P3 prioritization)
- Success criteria are measurable and testable
- Technology decisions are documented with rationale

---

### 9.2 AI-Agent Collaboration
**Principle:** Development workflow supports multiple AI coding assistants (Claude, Copilot, Gemini, Cursor).

**Implications:**
- Specs are technology-agnostic (describe "what" not "how")
- Task dependencies are explicit (parallel vs. sequential)
- Each task is independently testable
- Clarification limits prevent spec ambiguity (max 3 [NEEDS CLARIFICATION] markers)

---

### 9.3 User Story Independence
**Principle:** Each user story delivers independent value and can be shipped/tested in isolation.

**Implications:**
- MVP = User Story 1 only (can ship P1, defer P2/P3)
- Each story has distinct acceptance criteria
- Stories don't create technical debt that blocks future stories
- Demo/test routes enable isolated story validation

---

### 9.4 Incremental Delivery
**Principle:** Ship small, gather feedback, iterate based on real usage.

**Implications:**
- Phase 1 = Core canvas (P1 user stories only)
- Phase 2 = Trust scoring (P2 stories)
- Phase 3 = Data persistence & navigation (P3 stories)
- Each phase is production-ready (no half-built features)

---

## 10. Differences from Other Editions

### 10.1 SpecKit Edition Differentiators

**Unique to SpecKit Edition:**
- **Specification Workflow:** Natural language → structured specs → implementation plans → ordered tasks
- **AI Agent Commands:** 9 slash commands for AI-guided development (/speckit.specify, /speckit.plan, etc.)
- **Technology-Agnostic Specs:** Specs describe user value, not React/TypeScript specifics
- **Task Dependency Graphs:** Explicit parallel vs. sequential task organization
- **Quality Checklists:** Validation gates at each phase (requirements, planning, implementation)

**What's Shared Across Editions:**
- Core product value: Relationship mapping with trust scoring
- Target users: Reflective individuals, therapy/coaching clients
- Privacy-first philosophy: Local storage default
- Visual design principles: Color-coding, radial layout

**Comparison to Other Editions:**

| Aspect | SpecKit Edition | BMAD Edition | Claude Edition |
|--------|----------------|--------------|----------------|
| **Methodology** | GitHub SpecKit framework | BMAD coaching methodology | Claude Code 7-day sprint |
| **Trust Scoring** | Bidirectional (Outward/Inward) | 5-dimension valence (-5 to +5) | 4-level bidirectional (0-3) |
| **Development Approach** | Spec-driven, AI-agent guided | Phase-based (Analysis→Planning→Solutioning) | "Ship, don't infrastructure" |
| **Documentation Focus** | Specs, plans, tasks, checklists | PRD, user stories, architecture | Coach guides, security audits |
| **Target Agent** | Any AI (Claude, Copilot, Gemini) | Claude Code (pilot-exclusive) | Claude Code (production-ready) |
| **Max Relationships** | Unlimited (radial layout scales) | Unlimited (force-directed graph) | 8 people maximum |
| **Current Status** | MVP complete (Feature 001) | Phase 4 complete (pilot-ready) | Production v1.0 (live deployment) |

---

## 11. SpecKit Workflow Overview

### 11.1 AI Agent Commands (9 Slash Commands)

**Specification Phase:**
1. `/speckit.specify` - Transforms natural language feature request into structured spec.md
2. `/speckit.clarify` - Resolves ambiguities in specifications (max 3 clarifications per spec)

**Planning Phase:**
3. `/speckit.plan` - Generates technical implementation plan (plan.md, data-model.md)
4. `/speckit.tasks` - Breaks plan into dependency-ordered task list (tasks.md)

**Implementation Phase:**
5. `/speckit.implement` - Guides implementation in phases (executes tasks)
6. `/speckit.taskstoissues` - Converts tasks to GitHub issues for tracking

**Quality Assurance:**
7. `/speckit.analyze` - Analyzes consistency across artifacts (spec, plan, code)
8. `/speckit.checklist` - Validates completeness using quality checklists
9. `/speckit.constitution` - Manages project principles and governance

### 11.2 Artifact Structure (Example: Feature 001)

**Directory:** `/specs/001-relationship-canvas/`

**Files:**
- `spec.md` - User stories, requirements, success criteria (124 lines)
- `plan.md` - Technical architecture, component design, tech stack
- `data-model.md` - Entity definitions (PersonNode, TrustScore, CanvasState)
- `tasks.md` - 37 implementation tasks organized by user story priority
- `research.md` - Technology decisions and rationale (D3 vs custom, state management)
- `quickstart.md` - Development environment setup guide
- `checklists/requirements.md` - Quality validation checklist

### 11.3 Task Organization Example

**User Story 1 (P1):** "As a user, I can see an interactive canvas with me at the center"
- **Tasks:** 17 tasks (US1.1 - US1.17)
- **Dependency:** All sequential (build foundation first)

**User Story 2 (P2):** "As a user, I can add people to my network"
- **Tasks:** 10 tasks (US2.1 - US2.10)
- **Dependency:** Parallel after US1 complete

**User Story 3 (P3):** "As a user, I can reposition people via drag-and-drop"
- **Tasks:** 10 tasks (US3.1 - US3.10)
- **Dependency:** Parallel after US1 complete

**Benefits:**
- Clear MVP scope (US1 = 17 tasks)
- Parallel implementation opportunities (US2 + US3 can proceed simultaneously)
- Independent testing (each user story testable in isolation)

---

## 12. User Needs Summary (Consolidated)

### 12.1 Core Emotional Needs

**Clarity:** "I need to SEE my relationships, not just think about them"
- Addressed by: Interactive canvas, visual trust indicators

**Safety:** "I need to explore relationships without judgment"
- Addressed by: Non-judgmental language, privacy-first design, "Uncertain" flag

**Control:** "I need to own my data and interpretations"
- Addressed by: Local storage, no AI insights, export capability

**Efficiency:** "I don't have time for complex tools"
- Addressed by: Auto-save, single-click interactions, fast time-to-first-value

**Growth:** "I need to track if I'm improving relationships"
- Addressed by: Persistent maps, visual trust indicators (future: historical snapshots)

### 12.2 Functional Needs

**Add/Remove People:** Build relationship network dynamically
**Position People:** Arrange spatially to reflect closeness
**Score Trust:** Articulate bidirectional trust levels
**See Patterns:** Identify asymmetries, clusters, blind spots at a glance
**Navigate Large Networks:** Zoom/pan for 15+ people
**Persist Data:** Never lose insights or progress
**Share with Professionals:** Export/screenshot for therapy/coaching

---

## 13. Appendix

### 13.1 Glossary

**Canvas:** The interactive visual workspace where relationship nodes are displayed
**Node:** A visual representation of a person in the relationship network
**Self Node:** The "You" node fixed at the center of the canvas
**Radial Layout:** Automatic positioning algorithm that arranges nodes in circular pattern
**Outward Trust:** User's trust in going to another person with needs/concerns
**Inward Trust:** User's perception of how much the other person trusts coming to them
**Trust Asymmetry:** Mismatch between outward and inward trust levels (e.g., High vs. Medium)
**Uncertain Flag:** Marker indicating relationship dynamics are unclear or ambiguous
**Auto-Save:** Automatic persistence to localStorage (debounced 500ms)
**SpecKit:** GitHub's specification-driven development framework for AI coding assistants

### 13.2 SpecKit Resources

**Documentation:**
- SpecKit Framework: https://github.com/github/specify
- Agent Commands: `.claude/commands/speckit.*.md` (9 files)
- Agent Definitions: `.github/agents/speckit.*.agent.md` (9 files)

**Templates:**
- Spec Template: `.specify/templates/spec.md.template`
- Plan Template: `.specify/templates/plan.md.template`
- Tasks Template: `.specify/templates/tasks.md.template`

**Scripts:**
- Setup Agent Context: `.specify/scripts/bash/update-agent-context.sh`
- Check Prerequisites: `.specify/scripts/bash/check-prerequisites.sh`

### 13.3 Related Project Resources

**Multi-Edition Architecture:**
- Parent Repository: https://github.com/rhart696/true-valence-mapper
- BMAD Edition: `/home/ichardart/dev/projects/true-valence-mapper-bmad`
- Claude Edition: `/home/ichardart/dev/projects/true-valence-mapper-claude`

**Governance:**
- Global Rules: `AGENTS.md` (auto-synced from parent)
- Edition Overrides: `AGENTS.local.md` (edition-specific)

---

## Document Metadata

**Generated:** December 10, 2025
**Based on:** Codebase exploration of `/home/ichardart/dev/projects/true-valence-mapper-spec-kit`
**Purpose:** Retrospective PRD documenting as-built product state
**Audience:** Product managers, stakeholders, AI agents (Claude, Copilot, Gemini, Cursor)
**Status:** MVP complete (Feature 001: Relationship Canvas - 37/37 tasks complete)

**Key Insights:**
- Functional React/TypeScript application with interactive relationship mapping
- SpecKit methodology enables AI-agent collaboration across multiple platforms
- Specification-driven workflow: Natural language → specs → plans → tasks → implementation
- 9 slash commands guide AI agents through structured development process
- Technology-agnostic specs allow flexibility in tech stack choices
- User story independence enables incremental delivery (ship P1, defer P2/P3)
- Privacy-first design with local storage default (no cloud/accounts)
- Bidirectional trust scoring articulates asymmetries ("I trust them ≠ they trust me")
- Visual clarity principles: Color-coding, radial layout, high-contrast design
- Strong foundation for Phase 2 enhancements (notes, categories, export, history)

---

**End of Document**
