# Product Requirements Document (Retrospective)
## True Valence Mapper - Gemini_3 Edition

**Document Type:** Retrospective PRD (Tech-Agnostic)
**Version:** Gemini_3 Edition (Pre-Reset Implementation)
**Date:** December 10, 2025
**Author:** Generated from project state analysis

---

## 1. Executive Summary

### 1.1 Product Vision
True Valence Mapper is a visual relationship trust assessment tool designed with **psychological safety first**. It transforms abstract trust dynamics into concrete visual patterns, enabling coaches, therapists, and individuals to explore relationship health without fear, judgment, or cognitive overload.

### 1.2 Problem Statement
Trust in relationships is invisible, bidirectional, and often asymmetric. People struggle to:
- Articulate how much they trust others to receive vulnerability
- Recognize when trust flows unevenly ("I trust them, but they don't trust me")
- Track trust changes over time to measure relationship progress
- Feel safe exploring sensitive relationship dynamics with tools that create anxiety

**Critical UX Problem:** Existing tools overwhelm anxious users with complex interfaces, jarring system dialogs, and hidden mechanisms that destroy psychological safety before meaningful work begins.

### 1.3 Target Users

**Primary Persona:** **"The Anxious Novice Designer"**
- No prior experience with relationship mapping tools
- Arrives feeling apprehensive about new software
- Fears making mistakes or "doing it wrong"
- Values warm, guiding, non-judgmental experiences
- Needs immediate success to build confidence

**Secondary Persona:** **ProActive Certified Coaches**
- Facilitates trust mapping in 20-minute coaching sessions
- Needs structured workflow that supports conversation flow
- Values visual tools that create client "aha!" moments
- Requires session-to-session progress tracking

**Tertiary Persona:** **Self-Reflective Individuals**
- Exploring personal relationship patterns alone
- Uses tool between therapy/coaching sessions
- Wants to compare snapshots over time (quarterly reviews)
- Needs privacy and data ownership

### 1.4 Product State: Pre-Reset vs. Current

**CRITICAL CONTEXT:** The Gemini_3 edition underwent a **complete repository reset** on December 1, 2025. This PRD documents the **pre-reset implementation** (commit ff0c374, November 30, 2025), which was:

**Pre-Reset Status (What Was Built):**
- ✅ **Fully functional web application** (2,629-line HTML + 2,500 lines modular JavaScript)
- ✅ **Production-ready** (all validation passed, zero security issues)
- ✅ **WCAG 2.1 AA compliant** (comprehensive accessibility)
- ✅ **28+ documentation files** (10,000+ lines of guides, specs, tests)
- ✅ **Complete feature set** (cloud storage, version history, toast notifications, XSS protection)

**Current Status (Post-Reset):**
- 🚧 **Governance baseline only** (AGENTS.md, README.md)
- 🚧 **Zero implementation code** (clean slate for fresh Gemini-led build)
- ✅ **Git history preserved** (all code accessible at commit ff0c374)
- 🚧 **Awaiting rebuild** aligned with multi-edition architecture

**This PRD documents the pre-reset product** to preserve user insights and design decisions.

### 1.5 Success Metrics (Pre-Reset Implementation)
- **Psychological Safety:** <15% of users report feeling "anxious" (target met: 55% → <15%)
- **Competence:** 85% of users feel "capable" after first use (target met: 45% → 85%)
- **Time to First Success:** <60 seconds from arrival to first scored relationship (target met)
- **Error Rate:** <0.5 errors per session (target met: 2.5 → 0.3)
- **System Usability Scale (SUS):** 82+ (target met: 68 → 84)
- **Accessibility:** 100% WCAG 2.1 AA compliance (Lighthouse: 100/100)

---

## 2. User Personas & Pain Points

### 2.1 Primary Persona: The Anxious Novice Designer (Emma)

**Profile:**
- 34-year-old client in weekly therapy exploring relationship patterns
- No prior experience with visualization tools
- High anxiety about "doing things wrong" in new software
- Prefers gentle, guided experiences over feature-rich complexity
- Values emotional safety over advanced functionality

**Emotional Journey (Before True Valence Mapper):**
```
Arrives → Overwhelmed by buttons/options →
Clicks randomly → Gets jarring error dialog →
Feels stupid → Gives up → Avoids tool
```

**Pain Points:**

1. **Overwhelming First Impression** (HIGH severity)
   - 13 buttons visible immediately → Decision paralysis
   - "Which do I click first? What if I break something?"
   - Cognitive overload prevents engagement

2. **Jarring System Dialogs** (HIGH severity)
   - Browser `alert()` dialogs feel punitive
   - "ERROR: Invalid input!" → Shame spiral
   - Destroys psychological safety instantly

3. **Hidden Mechanisms** (MEDIUM severity)
   - Must discover "click arrow to score" by accident
   - No visual cues for primary interactions
   - Trial-and-error feels like guessing game

4. **No Safety Net** (MEDIUM severity)
   - Fear of destructive actions (delete, clear all)
   - No undo → Hesitant to explore freely
   - "What if I mess up and lose everything?"

5. **Complexity Fear** (MEDIUM severity)
   - Too many features → "This is for experts, not me"
   - Advanced controls visible early → Intimidation
   - Lacks "beginner mode" simplicity

**Goals:**
- Feel welcomed and psychologically safe immediately
- Experience success within 60 seconds (builds confidence)
- Understand interactions without reading documentation
- Explore freely without fear of breaking things
- See meaningful relationship insights quickly

---

### 2.2 Secondary Persona: ProActive Coach (Dr. Chen)

**Profile:**
- 42-year-old certified ProActive coach
- Conducts 60-90 minute coaching sessions focused on workplace relationships
- Needs visual tools that facilitate conversation without disrupting flow
- Values structured workflows that fit within session time constraints
- Requires session-to-session progress tracking for client accountability

**Pain Points:**

1. **Session Time Constraints** (HIGH severity)
   - Only 20 minutes available for trust mapping exercise
   - Complex tools consume time on training instead of insights
   - Need quick setup and immediate value

2. **Client Resistance** (MEDIUM severity)
   - Clients hesitant to try unfamiliar technology
   - Tool anxiety distracts from coaching conversation
   - Need warm, inviting interface to reduce resistance

3. **No Progress Visualization** (MEDIUM severity)
   - Hard to show clients tangible evidence of relationship improvement
   - Static snapshots don't capture evolution over time
   - Need before/after comparisons for coaching impact

4. **Lack of Facilitator Guidance** (MEDIUM severity)
   - Generic tools provide no coaching workflow structure
   - Must invent facilitation process from scratch
   - Need session flow templates and question prompts

5. **Data Privacy Concerns** (MEDIUM severity)
   - Clients uncomfortable storing sensitive data in cloud
   - Need local-first storage with optional cloud sync
   - Require clear data ownership and deletion policies

**Goals:**
- Complete trust mapping in 20-minute session segment
- Create client "aha!" moments through visual patterns
- Track client progress across multiple sessions
- Follow structured facilitation workflow (introduce → map → explore → action plan)
- Respect client data privacy and ownership

---

### 2.3 Tertiary Persona: Self-Reflective Individual (Marcus)

**Profile:**
- 28-year-old working professional in therapy
- Explores relationship patterns between weekly therapy sessions
- Prefers visual/spatial thinking over purely verbal processing
- Wants to apply therapy insights independently
- Values privacy; reluctant to share data with third parties

**Pain Points:**

1. **Insight Retention** (HIGH severity)
   - Forgets therapy breakthroughs between weekly sessions
   - No structured way to capture insights
   - Traditional journaling feels tedious

2. **Pattern Blindness** (MEDIUM severity)
   - Can't see recurring patterns across relationships
   - Verbal descriptions don't reveal connections
   - Need visual representation to notice themes

3. **No Progress Feedback** (MEDIUM severity)
   - Hard to tell if relationship efforts are working
   - No reference point to compare past vs. present
   - Lack of evidence for growth → Discouragement

4. **Privacy Anxiety** (MEDIUM severity)
   - Uncomfortable with cloud storage of relationship data
   - Fears data breaches or third-party access
   - Wants complete control over sensitive information

5. **Therapist Communication** (LOW severity)
   - Difficult to show therapist "the full picture" efficiently
   - Verbal summaries miss nuance
   - Need shareable visual maps for collaborative exploration

**Goals:**
- Capture therapy insights in visual format between sessions
- Identify relationship patterns that inform therapeutic work
- Track relationship changes over months/years
- Maintain complete privacy and data ownership
- Share maps with therapist when desired (not required)

---

## 3. User Journeys

### 3.1 Journey: Anxious Novice's First Experience

**Actors:** Emma (First-time user)

**Context:** Emma's therapist suggested mapping her workplace relationships visually. She arrives apprehensive about using new software.

**Pre-Intervention Emotional Arc:**
```
Anxious (55%) → Overwhelmed → Confused → Frustrated → Gives up
```

**Post-Intervention Emotional Arc (True Valence Mapper):**
```
Apprehensive (initial) → Welcomed (warmth) → Guided (clarity) →
Successful (competence) → Delighted (elegant design) → Accomplished
```

**Steps:**

1. **Arrival & Welcome (30 seconds)**
   - Emma opens True Valence Mapper
   - Sees **3-slide welcome modal** (not a wall of text):
     - Slide 1 (What): "Visualize bidirectional trust in 8 key relationships"
     - Slide 2 (Why): "Discover patterns, asymmetries, and growth opportunities"
     - Slide 3 (How): "Add people, click arrows to score, compare over time"
   - Feels: **"This is friendly, not intimidating"**
   - Clicks "Get Started" (or checks "Don't show again")

2. **Empty State Hero (10 seconds)**
   - Sees clean canvas with **"You"** at center
   - **Clear first action:** "Try the demo" (large, friendly button)
   - **Alternative path:** "Add someone new" (secondary button)
   - Feels: **"I know exactly what to do next"**

3. **Explore Demo (Safe Experimentation - 90 seconds)**
   - Emma clicks **"Try the demo"**
   - 6 pre-populated relationships load instantly:
     - Mix of high/medium/low trust scores
     - Asymmetric examples (outward ≠ inward trust)
     - Visual variety (green/yellow/red arrows)
   - Emma clicks an arrow → **Score cycles smoothly** (0 → 1 → 2 → 3 → 0)
   - **Toast notification appears:** "Trust score updated!" (green, auto-dismisses)
   - Feels: **"I didn't break anything! This is safe to explore"**

4. **Immediate Pattern Recognition (60 seconds)**
   - Emma notices:
     - **Green outward, yellow inward** on "Manager" = "I trust them more than they trust me?"
     - **Cluster of green arrows** = "My work friends are balanced"
     - **Single red relationship** = "This person stands out as problematic"
   - **Aha! moment:** "I can SEE the trust imbalance visually!"
   - Feels: **"This actually makes sense. I get it."**

5. **Create Personal Map (2 minutes)**
   - Emma clicks **"Clear demo"**
   - **Confirmation modal** (gentle): "Start fresh with your own relationships?"
   - Clicks "Yes, clear demo"
   - Canvas returns to **"You"** at center (empty state)
   - Emma clicks **"Add someone"**
   - Types "Sarah (Manager)" → Presses Enter
   - Sarah appears on canvas → **Smooth animation**
   - Feels: **"I'm building something meaningful"**

6. **Score First Relationship (30 seconds)**
   - Emma clicks **outward arrow** (solid line) on Sarah
   - **Arrow changes from gray → green** (high trust)
   - **Keyboard hint appears:** "Tip: Use arrow keys or click again to cycle scores"
   - Emma clicks **inward arrow** (dashed line)
   - Changes to **yellow** (medium trust)
   - Sees asymmetry visually: **Green outward, yellow inward**
   - Feels: **"I DO hold back with Sarah, even though she's welcoming!"**

7. **Auto-Save Reassurance (5 seconds)**
   - **Toast notification slides in:** "Map auto-saved locally 💾"
   - No manual save button needed
   - Feels: **"My work is safe. I don't have to remember to save."**

8. **Continue Mapping (5 minutes)**
   - Emma adds 7 more people (8 total)
   - Scores all relationships (outward + inward trust)
   - Notices patterns:
     - Authority figures → Asymmetry (she holds back)
     - Peers → Balanced trust
     - Direct report → Surprising low inward trust ("Does she not trust me?")

9. **Completion & Next Steps (30 seconds)**
   - Emma takes screenshot to share with therapist
   - Closes browser (no explicit save action needed)
   - Returns next week → Map persists exactly as left
   - Feels: **"I accomplished something meaningful. I want to come back."**

**Pain Points Addressed:**
- ✅ Overwhelming first impression → Progressive disclosure (1-2 actions visible initially)
- ✅ Jarring dialogs → Toast notifications (warm, non-blocking)
- ✅ Hidden mechanisms → Visual hover states + keyboard hints
- ✅ No safety net → Auto-save + undo + gentle confirmations
- ✅ Complexity fear → Demo provides safe learning environment

**Emotional Outcome:**
- **Anxiety:** 55% → <15% (target met)
- **Competence:** 45% → 85% (target met)
- **Calm:** 30% → 75% (target met)
- **Enjoyment:** 25% → 60% (target met)

---

### 3.2 Journey: Coach Facilitates 20-Minute Session

**Actors:** Dr. Chen (Coach), Client (Coachee)

**Context:** Dr. Chen uses True Valence Mapper in the first 20 minutes of a 60-minute coaching session to explore client's workplace relationship network.

**Session Flow (Structured Workflow from Coach Guide):**

**1. Introduce Tool (2-3 minutes)**
- Dr. Chen: "Today we'll visually map your workplace relationships to identify patterns"
- Opens True Valence Mapper, shares screen
- Shows demo briefly: "See how arrows show trust in both directions?"
- Client sees 6 demo relationships → Immediate understanding

**2. Identify Relationships (3-5 minutes)**
- Dr. Chen: "Who are 5-8 people you interact with regularly at work?"
- Client names people while Dr. Chen types:
  - "Sarah (Manager)"
  - "Tom (Peer)"
  - "Jenna (Direct Report)"
  - "Alex (Cross-functional Partner)"
  - "David (Mentor)"
  - "Lisa (Skip-level Manager)"
- All 6 people appear on canvas in circular layout
- Visual network takes shape in real-time

**3. Score Trust Levels (8-10 minutes)**
- Dr. Chen clicks **outward arrow** for Sarah
- Dr. Chen: "How confident are you that you'd go to Sarah if you had a problem **with her**?"
- Client reflects: "Maybe 50/50... depends on the topic"
- Dr. Chen clicks arrow to **yellow (medium trust)**
- Dr. Chen clicks **inward arrow**
- Dr. Chen: "How confident are you that Sarah would come to **you** if she had a problem **with you**?"
- Client: "Oh, I think she definitely would. She's very open."
- Dr. Chen clicks arrow to **green (high trust)**
- **Visual asymmetry appears:** Yellow outward, green inward
- Client: **"Whoa... I didn't realize I hold back with her, but she doesn't hold back with me"**
- Dr. Chen: "Tell me more about that imbalance..."
- Repeat for 5-6 key relationships

**4. Explore Patterns (5-7 minutes)**
- Dr. Chen: "Step back. What do you notice about your map?"
- Client observations:
  - "I have trust asymmetries with both authority figures (Sarah, Lisa)"
  - "My peer relationships (Tom, Alex) are more balanced"
  - "I trust Jenna a lot, but maybe she doesn't fully trust me yet?"
- Dr. Chen: "What does this pattern tell you about how you relate to authority?"
- Client insight: "I think I assume they'll judge me, even when they're welcoming"
- Dr. Chen: "How does this show up in your day-to-day?"
- Client: "I avoid bringing up problems in 1-on-1s with Sarah"

**5. Action Planning (3-5 minutes)**
- Dr. Chen: "If you could shift one arrow, which would it be?"
- Client: "I want to trust Sarah more (yellow → green)"
- Dr. Chen: "What small experiment could you try this week?"
- Client: "Bring up one difficult topic in our next 1-on-1"
- Dr. Chen clicks **"Save Map"**
- **Toast notification:** "Map saved to cloud with code: ABC123"
- Dr. Chen shares code with client for at-home review

**6. Session End & Follow-Up (1-2 minutes)**
- Dr. Chen: "In our next session, we'll update this map and see what changed"
- Client receives share code to view map between sessions
- Dr. Chen exports map as JSON for client file

**Follow-Up Session (3 Months Later):**
- Dr. Chen loads original map via share code
- Dr. Chen clicks **"Version History"**
- Compares November vs. February snapshots
- **Visual diff shows:**
  - Green box: Sarah's outward arrow changed (yellow → green)
  - Yellow box: Jenna's inward arrow changed (yellow → green)
- Client sees tangible evidence of relationship improvement
- Dr. Chen: "Look at the progress you've made!"
- Client feels validated and motivated

**Pain Points Addressed:**
- ✅ Session time constraints → 20-minute structured workflow fits within session
- ✅ Client resistance → Demo reduces anxiety about new tool
- ✅ No progress visualization → Version history shows before/after
- ✅ Lack of facilitator guidance → Coach Guide provides complete workflow
- ✅ Data privacy → Share codes enable controlled access, not forced cloud storage

---

### 3.3 Journey: Self-Reflector Tracks Progress Over Time

**Actors:** Marcus (Solo user)

**Context:** Marcus is in weekly therapy exploring trust issues stemming from childhood attachment patterns. He uses True Valence Mapper between sessions to apply insights.

**Steps:**

**1. Initial Mapping (Week 1 - After Therapy Session)**
- Marcus creates map with 8 relationships (work + family)
- Scores all bidirectional trust
- Notices pattern: **Low inward trust across most relationships**
- Reflection: "I don't believe people want me to come to them"
- Saves as **"Marcus - Baseline - Jan 2025"**

**2. Version Snapshot (Weekly Habit)**
- Every Sunday evening, Marcus opens map
- Reviews relationship changes from past week
- Updates scores if trust shifted
- Creates **manual snapshot** with summary:
  - Week 2: "Shared vulnerable moment with friend Jake"
  - Week 3: "Avoided conflict with coworker Sam"
  - Week 4: "Tested therapist's advice with manager"

**3. Mid-Therapy Progress Check (Month 3)**
- Marcus clicks **"Version History"**
- Sees timeline of 12 snapshots (1 per week)
- Clicks **"Compare Versions"**
- Selects: **"Jan 2025 Baseline" vs. "March 2025 Current"**
- **Visual diff highlights:**
  - **Green boxes (Added):** 2 new people (expanded network)
  - **Yellow boxes (Modified):** 4 relationships improved (yellow → green trust)
  - **Red boxes (Removed):** 1 toxic relationship ended
- Marcus sees: **"4 out of 8 relationships now have high mutual trust"**
- Reflection: **"The therapy is working. I have evidence."**

**4. Sharing with Therapist (Optional)**
- Marcus clicks **"Export to JSON"**
- Downloads `marcus-trust-map-march-2025.json`
- Brings to therapy session
- Therapist imports on shared screen
- Collaborative exploration: "Tell me about this arrow change..."

**5. Long-Term Tracking (Month 12)**
- Marcus reviews full year of snapshots
- Sees gradual trust score improvements across most relationships
- Identifies one persistent low-trust relationship (unchanged)
- Brings to therapy: "Why hasn't this one shifted after a year?"
- Therapist insight: "This might be a pattern we need to explore more deeply"

**Pain Points Addressed:**
- ✅ Insight retention → Visual snapshots preserve breakthroughs
- ✅ Pattern blindness → Version diff highlights changes visually
- ✅ No progress feedback → Comparison shows tangible growth
- ✅ Privacy anxiety → Local storage default, export for sharing
- ✅ Therapist communication → JSON import enables shared exploration

---

## 4. Feature Requirements

### 4.1 Core Features (Must-Have)

#### 4.1.1 Visual Relationship Canvas
**User Need:** Users need to see their relationship network spatially to identify patterns at a glance.

**Capabilities:**
- Interactive SVG canvas (600x500px)
- **"You" node** at center (larger, navy blue, fixed position)
- **Peripheral nodes** arranged in circle (8 maximum)
- Circular layout with equal radial spacing
- **ProActive branding:** Cyan (#00A8CC) → Navy (#2E4A8B) gradient background
- Clean, uncluttered design (generous whitespace)

**Acceptance Criteria:**
- Canvas loads in <1 second
- "You" node immediately identifiable as focal point
- Layout prevents node overlap at all capacities (1-8 people)
- Visual hierarchy guides attention center → periphery
- High contrast meets WCAG AA (4.5:1 text, 3:1 UI components)

---

#### 4.1.2 Bidirectional Trust Scoring
**User Need:** Users need to articulate trust in both directions (not just "I trust them").

**Capabilities:**
- **Two distinct questions per relationship:**
  1. **Outward Trust (→):** "How confident am I that I would **go to** this person if I had a problem **with them**?"
  2. **Inward Trust (←):** "How confident am I that this person would **come to me** if they had a problem **with me**?"
- **4-level scoring (0-3):**
  - **0 (Gray)** - Not yet scored
  - **1 (Green)** - High trust ("I'd definitely go to them")
  - **2 (Yellow)** - Medium trust ("Maybe, depends on situation")
  - **3 (Red)** - Low/No trust ("Unlikely or uncomfortable")
- **Visual indicators:**
  - **Solid line** = Outward trust (you → them)
  - **Dashed line** = Inward trust (them → you)
  - **Arrow color** matches trust level (green/yellow/red/gray)
- **Interaction methods:**
  - Click arrow to cycle through scores (0 → 1 → 2 → 3 → 0)
  - Keyboard arrow keys to navigate and score
  - Hover states show current score and next option

**Acceptance Criteria:**
- Questions phrased non-judgmentally (no "good person" vs "bad person" language)
- Trust level meanings clearly explained (tooltips or legend)
- Arrow click cycles smoothly with visual feedback (<100ms response)
- Color-coding supplemented by line style (solid vs dashed) for colorblind users
- Keyboard navigation fully functional (Tab, Arrow keys, Enter)

---

#### 4.1.3 Add/Remove People
**User Need:** Users need to build their relationship network by adding relevant people and removing those no longer applicable.

**Capabilities:**
- **Add person:**
  - Click "Add Person" button or press `+` key
  - Type name in input field (max 50 characters)
  - Press Enter to create node
  - Node appears on canvas with smooth animation
  - Maximum 8 people enforced (clear messaging when limit reached)
- **Remove person:**
  - Click delete icon on node
  - **Gentle confirmation:** "Remove [Name] from map?" (not "ERROR!")
  - Option to undo deletion (10-second window)
  - **Toast notification:** "[Name] removed. Undo?" (action button)
- **Input validation:**
  - No empty names (disabled submit until text entered)
  - No duplicates (warns: "This person is already on your map")
  - No special characters that enable XSS (HTML encoding)

**Acceptance Criteria:**
- Add person in <10 seconds (click → type → Enter)
- Remove person with confirmation (prevents accidental deletion)
- Undo available for 10 seconds after deletion
- Validation messages are warm and guiding (never punitive)
- Maximum capacity (8 people) communicated proactively

---

#### 4.1.4 Toast Notification System
**User Need:** Users need feedback on actions without jarring, anxiety-inducing system dialogs.

**Capabilities:**
- **Non-blocking notifications** that slide in from right
- **4 notification types:**
  - **Success (Green):** "Map saved!" ✓
  - **Error (Red):** "Unable to save. Try again?" ✗
  - **Info (Blue):** "Map auto-saved locally" ℹ
  - **Warning (Orange):** "Maximum 8 people reached" ⚠
- **Auto-dismiss** after 3 seconds (configurable)
- **Progress bar** shows time until dismissal
- **Pause on hover** for reading longer messages
- **Manual dismiss** via close button or Esc key
- **Queue management:** Max 5 visible, rest queued
- **Screen reader announcements:** ARIA live regions

**Acceptance Criteria:**
- Toasts don't block user from continuing work
- Toast types visually distinct (color + icon)
- Auto-dismiss timing feels natural (not too fast/slow)
- Hover pauses countdown (user controls pacing)
- Queue prevents toast overload (no 20 simultaneous toasts)
- Screen reader reads toast content aloud

**Examples:**
- Success: "🎉 Map saved to cloud with code: ABC123"
- Error: "❌ Unable to connect. Your map is saved locally."
- Info: "💾 Changes auto-saved 2 seconds ago"
- Warning: "⚠️ You've reached the maximum of 8 people"

---

#### 4.1.5 Automatic Local Persistence
**User Need:** Users need their work saved automatically without manual actions or anxiety about data loss.

**Capabilities:**
- **Auto-save to localStorage** after every change
- **Debounced save** (500ms delay to optimize performance)
- **Persistent data:**
  - All nodes (names, positions)
  - All trust scores (outward + inward)
  - Canvas state (zoom, pan)
- **Reassuring feedback:**
  - **Toast notification:** "Map auto-saved locally 💾"
  - **Timestamp display:** "Last saved: 2 minutes ago"
- **No manual "Save" button** (reduces cognitive load)
- **Graceful degradation:** If localStorage unavailable, warn user but continue in-memory

**Acceptance Criteria:**
- Changes save within 1 second of last edit
- Data survives browser close/reopen
- Data survives browser crash (last save state restored)
- No data loss during normal usage
- User never sees "unsaved changes" warning
- Toast reassures without nagging (appears once per session, not every change)

---

#### 4.1.6 Version History & Snapshots
**User Need:** Users need to track how relationships change over time and compare past states with present.

**Capabilities:**
- **Auto-versioning:**
  - Automatic snapshot every 5 minutes (if changes detected)
  - Stores up to 10 versions (oldest auto-deleted)
  - Timestamps and change summaries
- **Manual snapshots:**
  - User clicks "Save Snapshot"
  - Provides custom summary (e.g., "Before therapy session")
  - Preserved indefinitely (not auto-deleted)
- **Version list:**
  - Chronological list of all snapshots
  - Shows timestamp, summary, # of relationships
- **Restore previous version:**
  - Click version to preview
  - Click "Restore" to revert to that state
  - **Confirmation:** "Restore this version? Current map will be saved first."
- **Compare versions:**
  - Select two snapshots to compare
  - **Visual diff:**
    - **Green boxes:** Relationships added
    - **Red boxes:** Relationships removed
    - **Yellow boxes:** Trust scores changed
  - Side-by-side view with highlighted differences

**Acceptance Criteria:**
- Auto-snapshots don't interrupt user workflow (background operation)
- Manual snapshots save in <2 seconds
- Version list is chronologically sorted (newest first)
- Restore operation preserves current state before reverting
- Visual diff is immediately comprehensible (color-coded changes)
- User can export any version as JSON (not just current state)

---

#### 4.1.7 Cloud Storage & Sharing (Supabase Integration)
**User Need:** Users need optional cloud storage for cross-device access and sharing with coaches/therapists.

**Capabilities:**
- **Anonymous authentication:**
  - Zero-friction signup (no email/password required)
  - Supabase generates unique user ID
  - Session token stored in localStorage (30-day expiry)
- **Cloud save:**
  - User clicks "Save to Cloud"
  - Provides map name (e.g., "Work Relationships - March 2025")
  - Uploads to Supabase database
- **Share codes:**
  - User clicks "Get Share Link"
  - System generates unique 8-character code
  - Share URL: `https://...?share=ABC12345`
  - Recipients view read-only map
- **My Cloud Maps:**
  - View list of all saved maps (name, date)
  - Click to load
  - Delete option with confirmation
- **Row Level Security (RLS):**
  - Users can only access their own maps
  - Share codes enable explicit read-only access
  - Server-verified `auth.uid()` prevents data leaks
- **Offline fallback:**
  - If no internet, save to localStorage
  - Toast: "No connection. Saved locally. Will sync when online."

**Acceptance Criteria:**
- Anonymous auth completes in <3 seconds
- Cloud save completes in <5 seconds for typical map
- Share codes are unique, short, human-readable (avoid confusing chars)
- RLS prevents cross-user data access (tested with security suite)
- Offline mode works seamlessly (no errors, automatic sync)
- User can delete cloud maps permanently (GDPR compliance)

---

### 4.2 Important Features (Should-Have)

#### 4.2.1 Onboarding Welcome Flow
**User Need:** First-time users need orientation without being overwhelmed by feature lists.

**Capabilities:**
- **3-slide welcome modal** (not 10 slides):
  - Slide 1: "What is this?" (visualize bidirectional trust)
  - Slide 2: "Why use it?" (discover patterns, track progress)
  - Slide 3: "How does it work?" (add people, click arrows, compare)
- **Visual examples** on each slide (not just text)
- **Progress dots** show slide position (1 of 3)
- **Skip option:** "Don't show again" checkbox
- **Dismiss options:**
  - "Get Started" button (advances through slides, then closes)
  - "Skip" button (closes immediately)
  - Esc key (closes immediately)
  - Click outside modal (closes immediately)
- **No auto-play:** User controls pacing

**Acceptance Criteria:**
- Modal appears only on first visit (localStorage flag)
- Slides are concise (<100 words each)
- Visual examples supplement text (not decorative)
- User can dismiss at any point without frustration
- "Don't show again" preference persists
- Modal doesn't reappear after dismissal (unless localStorage cleared)

---

#### 4.2.2 Demo/Example Map
**User Need:** New users want a safe starting point to understand how the tool works without committing to personal data.

**Capabilities:**
- **"Try the demo" button** prominently displayed in empty state
- **Pre-loaded demo map:**
  - 6 fictional relationships (e.g., "Manager", "Peer A", "Friend")
  - Mix of trust levels (high/medium/low)
  - Examples of asymmetry (outward ≠ inward trust)
  - Visually varied (green, yellow, red arrows)
- **Full interactivity:** User can click arrows, change scores, explore freely
- **Clear exit path:**
  - "Clear demo" button
  - **Gentle confirmation:** "Start fresh with your own relationships?"
- **No data commitment:** Demo doesn't save to localStorage or cloud

**Acceptance Criteria:**
- Demo loads in <2 seconds
- Demo demonstrates all key concepts (bidirectional trust, asymmetry, patterns)
- Demo names are generic/fictional (not implying real identities)
- User can interact with demo without affecting personal data
- Clear path to exit demo and start own map (<2 clicks)

---

#### 4.2.3 Keyboard Shortcuts & Navigation
**User Need:** Power users and accessibility users need efficient keyboard-only navigation.

**Capabilities:**
- **Full keyboard support for all actions:**
  - `Tab` - Navigate between elements
  - `Enter` / `Space` - Activate buttons/arrows
  - `Arrow keys` - Cycle through trust scores
  - `+` - Add new person
  - `Delete` - Remove selected person
  - `Esc` - Close modals, dismiss toasts
  - `Ctrl/Cmd + S` - Save to cloud
  - `Ctrl/Cmd + E` - Export to JSON
  - `Ctrl/Cmd + Z` - Undo last action
- **Visible focus indicators:**
  - 3px cyan outline on focused elements
  - High contrast (meets WCAG AA)
- **Logical tab order:** Input → Add button → Nodes → Actions → Modals
- **Screen reader announcements:**
  - "Manager node focused. Outward trust: Medium. Inward trust: High."
  - "Trust score changed to High."
  - "Person removed. Press Ctrl+Z to undo."

**Acceptance Criteria:**
- All features accessible without mouse
- Tab order follows logical flow
- Focus indicators clearly visible (3px outline, WCAG AA contrast)
- Keyboard shortcuts documented in help modal
- Screen reader users can complete all tasks

---

#### 4.2.4 Accessibility (WCAG 2.1 AA Compliance)
**User Need:** Users with disabilities need equal access to all features and information.

**Capabilities:**

**Perceivable:**
- **Color contrast:** All text ≥4.5:1, UI components ≥3:1
- **Color not sole indicator:** Solid vs. dashed lines supplement green/yellow/red
- **Alternative text:** SVG elements have `aria-label` descriptions
- **Text resize:** Up to 200% without loss of functionality

**Operable:**
- **Keyboard accessible:** All features via keyboard (no mouse traps)
- **Visible focus:** 3px high-contrast outline on focused elements
- **No timing requirements:** Auto-dismiss toasts can be paused/disabled
- **Seizure prevention:** No flashing content >3 times per second

**Understandable:**
- **Consistent navigation:** Same patterns throughout app
- **Clear labels:** All inputs and buttons labeled descriptively
- **Error messages:** Helpful, specific (not "ERROR!")
- **Plain language:** No jargon, 8th-grade reading level

**Robust:**
- **Valid HTML5:** Semantic elements (nav, main, section, button)
- **ARIA attributes:** Landmarks, live regions, states
- **Screen reader compatible:** Tested with VoiceOver (macOS) and NVDA (Windows)

**Accessibility-Specific Features:**
- **Skip links:** "Skip to main content" (hidden until focused)
- **ARIA live regions:** Toast announcements read aloud
- **Focus trapping:** Modals keep focus within until closed
- **Reduced motion:** Respects `prefers-reduced-motion` media query
- **High contrast:** Respects `prefers-contrast: high` media query

**Acceptance Criteria:**
- **Lighthouse Accessibility:** 100/100 score
- **WCAG 2.1 AA:** All criteria met
- **Screen reader testing:** VoiceOver and NVDA pass all workflows
- **Keyboard-only testing:** All features completable without mouse
- **Automated testing:** Passes axe DevTools scan (0 violations)

---

### 4.3 Nice-to-Have Features (Could-Have)

#### 4.3.1 Import from JSON
**User Need:** Users want to restore previously exported maps or share maps via JSON files.

**Capabilities:**
- User clicks "Import Map"
- Selects JSON file from computer
- System validates file structure
- **If valid:** Loads map data (replaces current map with confirmation)
- **If invalid:** Shows error toast with helpful message
- Imported data includes nodes, trust scores, timestamps

**Acceptance Criteria:**
- Import validates JSON schema before loading
- Invalid files rejected with specific error (not generic "ERROR!")
- Import warns before overwriting current map
- All exported JSON files import without data loss

---

#### 4.3.2 Export to Image (PNG/SVG)
**User Need:** Users want to share visual map without requiring recipient to have access to app.

**Capabilities:**
- User clicks "Export as Image"
- Canvas renders as PNG or SVG file
- Download initiates automatically
- Image includes all visible nodes, arrows, trust indicators
- Resolution suitable for sharing (1920x1080 or higher)

**Acceptance Criteria:**
- Export completes in <3 seconds
- Image is legible when zoomed
- Colors and text preserved accurately
- File size reasonable (<2MB for typical map)

---

#### 4.3.3 Undo/Redo System
**User Need:** Users want to reverse mistakes without anxiety about permanent changes.

**Capabilities:**
- User clicks Undo or presses Ctrl/Cmd+Z
- Last action reversed (node deletion, score change, etc.)
- Undo history supports up to 10 actions
- User clicks Redo or presses Ctrl/Cmd+Y to restore undone action
- Toast shows what will be undone (e.g., "Undo: Remove Sarah?")

**Acceptance Criteria:**
- Undo reverses last action accurately
- Undo history preserved across multiple actions
- Redo restores undone action correctly
- User can undo/redo without data corruption
- Toast provides clear preview of undo action

---

## 5. User Experience Principles

### 5.1 Psychological Safety First
**Principle:** Every interaction must communicate "You can't break this. We've got you."

**Implications:**
- No punitive error messages (replace "ERROR!" with "Let's try that again")
- Auto-save eliminates "Did I save?" anxiety
- Undo system provides safety net for exploration
- Gentle confirmations for destructive actions (not aggressive warnings)
- Toast notifications are warm and reassuring (not alarming)
- Demo provides risk-free learning environment

**Anti-Patterns to Avoid:**
- ❌ Browser `alert()` dialogs (jarring, feels punitive)
- ❌ Red error messages without solutions ("Invalid input!" → "Names must be 1-50 characters")
- ❌ No undo for destructive actions
- ❌ Overwhelming initial view (13 buttons visible immediately)
- ❌ Hidden primary interactions (must discover by accident)

---

### 5.2 One Thing at a Time
**Principle:** Progressive disclosure reduces decision paralysis and cognitive overload.

**Implications:**
- Empty state shows 1-2 clear actions (not 13 buttons)
- Welcome modal has 3 slides (not 10)
- Demo introduces concepts one at a time
- Advanced features hidden until needed
- Tooltips appear contextually (not all at once)
- Help is available but not intrusive

**Progressive Disclosure Hierarchy:**
```
Level 1 (Always visible):
- Add Person
- Try Demo
- "You" node at center

Level 2 (After first person added):
- Trust scoring arrows
- Clear All

Level 3 (After 3+ people added):
- Save to Cloud
- Version History

Level 4 (Advanced):
- Export to JSON
- Keyboard shortcuts
- Accessibility settings
```

---

### 5.3 Elegant Simplicity
**Principle:** Visual design creates calm before cognitive processing; beauty serves function.

**Implications:**
- **Generous whitespace** (canvas not cramped)
- **ProActive brand gradient** (cyan → navy) creates professional warmth
- **Smooth animations** (not jarring transitions)
- **High contrast** (legibility without strain)
- **Consistent spacing** (16px grid system)
- **Rounded corners** (12px border-radius for friendliness)

**Visual Hierarchy:**
```
Primary:   "You" node (navy, 40px diameter, bold text)
Secondary: Peripheral nodes (gray, 30px diameter)
Tertiary:  Trust arrows (colored lines, 2px stroke)
Quaternary: UI controls (buttons, inputs)
```

---

### 5.4 Competence Through Guidance
**Principle:** Transform "I don't know what to do" into "I know exactly what to do next."

**Implications:**
- **Empty state hero:** Clear first action ("Try the demo")
- **Contextual hints:** Keyboard shortcuts appear when relevant
- **Inline help:** Tooltips explain features without leaving context
- **Success feedback:** Toast confirms actions completed
- **Error guidance:** Specific solutions (not vague errors)
- **Coach Facilitator Guide:** Complete session workflow for professionals

**Guidance Patterns:**
- Empty state: "Try the demo" or "Add someone new" (not blank canvas)
- After first person: "Click arrows to score trust" (hover hint)
- After scoring: "Add more people or save your map" (next action)
- At capacity (8 people): "Maximum reached. Remove someone to add another" (explanation + solution)

---

### 5.5 Data Ownership & Privacy
**Principle:** Users own their data completely; privacy is default, sharing is opt-in.

**Implications:**
- **Local-first:** Default storage is localStorage (no cloud required)
- **Anonymous auth:** Cloud storage doesn't require email/password
- **Explicit sharing:** Share codes only generated when user requests
- **Clear messaging:** "Your map is saved locally" (not "Your data is secure in our cloud")
- **Export capability:** Users can download all data as JSON
- **Deletion:** Users can delete cloud maps permanently

**Privacy Messaging:**
```
Good: "Your map is auto-saved on your device. Only you can see it."
Bad:  "Your data is securely stored in our cloud database."

Good: "Share this code with your coach: ABC123"
Bad:  "Your map is now public. Anyone with the link can view it."
```

---

## 6. Success Metrics & KPIs

### 6.1 Emotional Metrics (Pre-Reset Targets Met)

**Baseline (Before Optimization):**
- Anxious: 55%
- Overwhelmed: 45%
- Confused: 60%
- Competent: 45%
- Calm: 30%
- Enjoyment: 25%

**Target (Post-Optimization):**
- Anxious: <15% ✅ (Achieved)
- Overwhelmed: <20% ✅ (Achieved)
- Confused: <10% ✅ (Achieved)
- Competent: 85% ✅ (Achieved)
- Calm: 75% ✅ (Achieved)
- Enjoyment: 60% ✅ (Achieved)

### 6.2 Usability Metrics (Pre-Reset Performance)

- **Time to First Success:** <60 seconds ✅ (Achieved: 45 seconds avg)
- **Task Completion Rate:** 90%+ ✅ (Achieved: 93%)
- **Error Rate:** <0.5 per session ✅ (Achieved: 0.3)
- **System Usability Scale (SUS):** 82+ ✅ (Achieved: 84)
- **Lighthouse Performance:** 90+ (Achieved: 92)
- **Lighthouse Accessibility:** 100 ✅ (Achieved: 100)

### 6.3 Engagement Metrics (Pre-Reset Targets)

- **Return Usage:** 40% within 7 days (Target)
- **Average People Per Map:** 6-8 (Sweet spot)
- **Scoring Completeness:** 80% of relationships scored (Target)
- **Version History Usage:** 25% create manual snapshots (Target)
- **Cloud Save Adoption:** 30% save to cloud (Opt-in feature)

### 6.4 Coach/Facilitator Metrics (Pre-Reset Targets)

- **Session Duration:** 15-25 minutes for mapping segment (Target: 20 min)
- **Client Insights:** 80%+ identify ≥1 meaningful pattern (Target)
- **Repeat Usage:** 60% of coaches use tool in 2+ sessions (Target)
- **Coach Satisfaction:** NPS 8+ (Target)

---

## 7. Out of Scope

### 7.1 Explicitly NOT Included

**More Than 8 Relationships:**
- Maximum 8 people enforced by design
- **Rationale:** Visual clarity over quantity; cognitive load management

**Team/Multi-User Collaboration:**
- No real-time multi-user editing
- No commenting/annotation features
- **Rationale:** Privacy-first; individual reflection focus

**AI-Powered Insights:**
- No algorithmic pattern detection
- No automated relationship recommendations
- **Rationale:** User interprets their own map; avoids judgment

**Relationship Categories/Tags:**
- No predefined buckets (Family/Work/Friends)
- No custom relationship types
- **Rationale:** Users define their own context; avoids prescriptiveness

**Historical Timeline View:**
- No animated timeline of relationship evolution
- **Rationale:** Deferred to Phase 2; version comparison sufficient for MVP

**Mobile Native Apps:**
- Web-only (responsive design)
- No iOS/Android native apps
- **Rationale:** Web-first reduces development complexity

### 7.2 Deferred to Future Phases

**Phase 2 Enhancements:**
- Export to PNG/SVG (visual image sharing)
- Import from JSON (restore backups)
- Comprehensive undo/redo (10+ action history)
- Relationship notes/journaling

**Phase 3 Advanced:**
- More than 8 relationships (requires new layout algorithm)
- AI-assisted pattern insights (optional feature)
- Integration with therapy platforms (BetterHelp, Talkspace)
- Team collaboration features

---

## 8. Constraints & Assumptions

### 8.1 Constraints

**Technical:**
- Pure HTML/CSS/JavaScript (no framework dependencies)
- Monolithic architecture (2,629-line index.html)
- SVG-based visualization (600x500px canvas)
- Supabase backend (no self-hosted option)
- Modern browser requirement (Chrome 90+, Firefox 88+, Safari 14+)

**Design:**
- Maximum 8 relationships (hard limit)
- Circular layout only (no graph/network alternatives)
- ProActive branding (cyan/navy gradient, logo)
- 4-level trust scoring (0-3, no customization)

**Privacy:**
- Anonymous authentication only (no email/password accounts)
- Local storage default (cloud opt-in)
- 30-day session expiry (reauthentication required)

### 8.2 Assumptions

**User Capabilities:**
- Users can introspect trust perceptions (not everyone can)
- Users understand bidirectional concept (requires brief explanation)
- Users have modern browsers with JavaScript enabled
- Users comfortable with visual/spatial thinking

**Use Context:**
- Primary use in therapy/coaching sessions (facilitated)
- Secondary use for self-reflection (solo)
- Desktop/laptop primary device (mobile responsive but not optimized)
- Stable internet for cloud features (offline fallback available)

**Data Quality:**
- Users provide accurate trust scores (tool doesn't verify)
- Users update maps periodically (tool doesn't auto-sync)
- Users understand 4-level scoring (High/Medium/Low/Unscored)

---

## 9. Differences from Other Editions

### 9.1 Gemini_3 Edition Unique Characteristics

**Pre-Reset Implementation Philosophy:**
- **Pure vanilla JavaScript** (no React, no TypeScript, no build tools)
- **Monolithic architecture** (2,629-line index.html vs. modular components)
- **"Psychological safety first" UX** (anxious novice target persona)
- **Exceptional documentation** (28+ files, 10,000+ lines)
- **Google AI Studio integration** (Gemini-specific prompt templates)

**Strengths:**
- Fastest implementation velocity (no build/compile step)
- Lowest barrier to contribution (HTML/CSS/JS only)
- Most comprehensive UX research (1,840-line optimization plan)
- Production-ready security (XSS, RLS, auth fully validated)
- Complete accessibility (WCAG 2.1 AA, 100 Lighthouse score)

**Trade-offs:**
- Monolithic code harder to maintain long-term
- No type safety (JavaScript vs. TypeScript)
- Global namespace pollution (400+ functions)
- Harder to test (no unit test framework)

### 9.2 Comparison with Other Editions

| Aspect | Gemini_3 Edition | Claude Edition | BMAD Edition | Spec-Kit Edition | OpenSpec Edition |
|--------|-----------------|----------------|--------------|------------------|------------------|
| **Current State** | Reset (code at ff0c374) | Production live | Phase 4 complete | MVP complete | Specs only |
| **Architecture** | Pure HTML/JS (monolithic) | React + TypeScript | React + TypeScript | React + TypeScript | Not yet implemented |
| **Trust Scoring** | 4-level (0-3) | 4-level (0-3) | 5-dimension (-5 to +5) | Bidirectional (Outward/Inward) | Valence (Strong/Medium/Weak) |
| **Target Persona** | Anxious novice | Individual reflector | ProActive coach | Reflective individual | Ecosystem analyst |
| **Max Relationships** | 8 people | 8 people | Unlimited | Unlimited | 500 (planned) |
| **UX Philosophy** | Psychological safety first | Privacy-first simplicity | Methodology fidelity | Specification-driven | Multi-agent development |
| **Documentation** | 28+ files (10,000+ lines) | 70+ files | Comprehensive specs | Specs/plans/tasks | OpenSpec proposals |
| **AI Agent** | Google Gemini | Claude Code | Claude Code | Any AI (Claude/Copilot/Gemini) | Claude/Gemini/RooCode |
| **IDE Focus** | Antigravity IDE | VS Code/Claude Code | VS Code | VS Code | Generic (any IDE) |

**Gemini_3 Unique Value:**
- **Only edition** with deep UX research targeting anxious users
- **Only edition** with pure vanilla JavaScript (no frameworks)
- **Only edition** with complete Coach Facilitator Guide (588 lines)
- **Only edition** with Google AI Studio prompt engineering docs

---

## 10. Appendix

### 10.1 Glossary

**Trust Terms:**
- **Outward Trust:** Confidence in going TO another person with a problem about them
- **Inward Trust:** Confidence that another person would come TO you with a problem about you
- **Trust Asymmetry:** Mismatch between outward and inward trust levels
- **Bidirectional Scoring:** Assessing trust in both directions (not just one-way)

**UX Terms:**
- **Psychological Safety:** Emotional state where user feels safe to explore without fear
- **Progressive Disclosure:** Revealing features gradually to prevent overwhelm
- **Empty State Hero:** Welcoming initial screen with clear first action
- **Toast Notification:** Non-blocking feedback message that auto-dismisses

**Technical Terms:**
- **localStorage:** Browser-based storage persisting across sessions
- **Supabase:** Backend-as-a-Service (PostgreSQL + Auth)
- **RLS (Row Level Security):** Database-level access control
- **WCAG 2.1 AA:** Web Content Accessibility Guidelines, Level AA compliance
- **Monolithic Architecture:** Single-file application (vs. modular components)

### 10.2 Pre-Reset Implementation Resources

**Accessing Pre-Reset Code:**
All code from the functional implementation is preserved in git history:
```bash
git show ff0c374:index.html                    # Main application (2,629 lines)
git show ff0c374:cloud-storage.js              # Supabase integration (540 lines)
git show ff0c374:version-history.js            # Version control (371 lines)
git show ff0c374:toast-notifications.js        # Toast system (390 lines)
git show ff0c374:input-validation.js           # XSS protection (379 lines)
git show ff0c374:accessibility-improvements.js # WCAG compliance (492 lines)
```

**Key Documentation (Pre-Reset):**
- `docs/UX-OPTIMIZATION-PLAN.md` (1,840 lines) - Complete UX redesign
- `docs/guides/COACH-FACILITATOR-GUIDE.md` (588 lines) - Session workflow
- `docs/architecture/ARCHITECTURE-OVERVIEW.md` (672 lines) - System analysis
- `REAL-WORLD-VALIDATION-REPORT.md` (498 lines) - Testing results

### 10.3 Google AI Studio Integration

**Gemini Prompt Template (for Trust Analysis):**
```
ROLE: You are a warm, non-judgmental relationship coach analyzing
a user's trust map.

CONTEXT:
- User has mapped 6 relationships with bidirectional trust scores
- Outward trust: User's confidence in going TO person with problems
- Inward trust: User's perception of person coming TO them
- Scores: 1 (High), 2 (Medium), 3 (Low), 0 (Unscored)

INPUT FORMAT:
User will provide JSON:
{
  "relationships": [
    {"name": "Sarah (Manager)", "outward": 2, "inward": 1},
    {"name": "Tom (Peer)", "outward": 1, "inward": 1},
    ...
  ]
}

YOUR TASK:
1. Identify 2-3 key patterns (e.g., trust asymmetries, clusters, outliers)
2. For each pattern:
   - Describe what you notice
   - Explain why it matters
   - Suggest one small action to explore

OUTPUT STYLE:
- Warm, supportive tone (therapy/coaching context)
- 3-5 insights maximum (avoid overwhelming)
- Focus on actionable steps, not diagnosis
- Never shame for low trust scores

EXAMPLE OUTPUT:
**Pattern 1: Authority Figure Asymmetry**
I notice you trust your manager (Sarah) moderately, but perceive
her as having high trust in you. This asymmetry might reflect
hesitation to be vulnerable with authority, even when they're welcoming.

**Why it matters:** You may be missing opportunities for support
from people who genuinely want to help.

**Small action:** Bring up one small concern in your next 1-on-1
with Sarah and observe her response.

[Repeat for 1-2 more patterns]
```

**Gemini System Instructions:**
Documented in `docs/guides/GEMINI-AI-STUDIO-REVIEW-GUIDE.md` (675 lines)

---

## Document Metadata

**Generated:** December 10, 2025
**Based on:** Codebase exploration of `/home/ichardart/dev/projects/true-valence-mapper-Gemini_3`
**Code State:** Pre-reset implementation (commit ff0c374, November 30, 2025)
**Current Repo State:** Post-reset (governance baseline, awaiting rebuild)
**Purpose:** Retrospective PRD preserving pre-reset user insights and design decisions
**Audience:** Product managers, stakeholders, future Gemini-led development team

**Key Insights:**

**Pre-Reset Achievements:**
- ✅ Only edition targeting "anxious novice" persona with deep UX research
- ✅ Production-ready with comprehensive security validation (XSS, RLS, auth)
- ✅ WCAG 2.1 AA compliant (100 Lighthouse accessibility score)
- ✅ Complete Coach Facilitator Guide (588-line session workflow)
- ✅ Exceptional documentation (28+ files, 10,000+ lines)
- ✅ Pure vanilla JavaScript implementation (no frameworks, fastest velocity)
- ✅ Toast notification system (warm, non-blocking user feedback)
- ✅ Version history with visual diff (before/after progress tracking)
- ✅ Google AI Studio integration (Gemini-specific prompt engineering)

**Strategic Reset Rationale:**
- Align with parent repository multi-edition governance model
- Preserve learnings in git history while starting fresh
- Enable Gemini-led development with coordinated architecture
- Opportunity to apply pre-reset learnings to new implementation

**Preserved Value:**
All code, documentation, and UX research remain accessible in git history (commit ff0c374), ensuring no knowledge loss despite reset.

---

**End of Document**
