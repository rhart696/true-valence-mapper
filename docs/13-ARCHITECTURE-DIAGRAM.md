# Architecture Diagram

**Version**: 1.0
**Date**: 2026-02-17
**Based On**: Tech Stack Decision + PRD + NFR Spec
**Product**: True Valence Mapper v1.0

---

## Architecture Overview

**Architecture Pattern**: Client-Side SPA (Single Page Application)
**Deployment Model**: Static Site (No Backend)
**Hosting**: Vercel Edge Network
**Data Flow**: Stateful session, stateless persistence (no persistence)

---

## 1. System Architecture

### 1.1 High-Level Architecture Diagram

```
┌─────────────────────────────────────────────────────────────┐
│                        USER BROWSER                          │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  ┌─────────────────────────────────────────────────────┐   │
│  │              NEXT.JS 15 APPLICATION                 │   │
│  │  (Static Export - Client-Side Only)               │   │
│  ├─────────────────────────────────────────────────────┤   │
│  │                                                     │   │
│  │  ┌─────────────────┐  ┌─────────────────┐        │   │
│  │  │  REACT 19       │  │  REACT HOOKS    │        │   │
│  │  │  Components     │  │  (useState,     │        │   │
│  │  │                 │  │   useEffect)    │        │   │
│  │  └─────────────────┘  └─────────────────┘        │   │
│  │                                                     │   │
│  │  ┌─────────────────────────────────────────────┐    │   │
│  │  │  SESSION CONTEXT (State Management)       │    │   │
│  │  │  - relationships: Relationship[]           │    │   │
│  │  │  - trustLevels: Record<string, TrustLevel> │    │   │
│  │  │  - currentStep: Step                      │    │   │
│  │  └─────────────────────────────────────────────┘    │   │
│  │                                                     │   │
│  │  ┌─────────────────┐  ┌─────────────────┐        │   │
│  │  │  UI COMPONENTS  │  │  PDF EXPORT     │        │   │
│  │  │  (Radix UI +   │  │  (jsPDF +       │        │   │
│  │  │   Tailwind)    │  │   html2canvas)  │        │   │
│  │  └─────────────────┘  └─────────────────┘        │   │
│  │                                                     │   │
│  └─────────────────────────────────────────────────────┘   │
│                                                             │
└─────────────────────────────────────────────────────────────┘
                           │
                           ▼
┌─────────────────────────────────────────────────────────────┐
│                      VERCEL EDGE NETWORK                    │
│  (Global CDN, Automatic SSL, Automatic HTTPS)                │
└─────────────────────────────────────────────────────────────┘
```

### 1.2 Architecture Characteristics

**Client-Side Only**:
- No server-side rendering (SSR)
- No server-side code
- No database
- No API endpoints

**Benefits**:
- Simple deployment (static files)
- Fast performance (no server latency)
- Lower cost (no server resources)
- Better privacy (no data storage)

**Trade-offs**:
- No server-side processing
- No server-side caching
- No server-side analytics

---

## 2. Component Architecture

### 2.1 Component Hierarchy

```
App (Root Component)
│
├── SessionProvider (Context Provider)
│   └── Session State: { relationships, trustLevels, currentStep }
│
├── Layout
│   ├── Header (Logo, optional menu)
│   └── Main Content
│
├── LandingScreen
│   ├── HeroSection
│   │   ├── Title ("Facilitate Trust Mapping")
│   │   └── Description
│   ├── TrustDefinitionsLink
│   └── CTAButton ("Start Session")
│
├── NamingScreen
│   ├── InstructionText
│   ├── RelationshipForm
│   │   ├── InputField (name)
│   │   └── AddButton
│   ├── RelationshipList
│   │   └── RelationshipCard
│   │       ├── Name
│   │       ├── EditButton
│   │       └── RemoveButton
│   └── Navigation (Back, Next)
│
├── ScoringScreen
│   ├── InstructionText
│   ├── TrustDefinitionsLink
│   ├── ProgressBar
│   ├── RelationshipScorer
│   │   ├── RelationshipCard
│   │   ├── TrustLevelSelector
│   │   │   ├── HighButton
│   │   │   ├── ModerateButton
│   │   │   ├── LowButton
│   │   │   └── NoneButton
│   │   └── TrustLevelDescription
│   └── Navigation (Back, View Canvas)
│
├── CanvasScreen
│   ├── InstructionText
│   ├── TrustCanvas
│   │   ├── TrustLevelGroup (High)
│   │   │   └── RelationshipCard[] (color-coded)
│   │   ├── TrustLevelGroup (Moderate)
│   │   │   └── RelationshipCard[]
│   │   ├── TrustLevelGroup (Low)
│   │   │   └── RelationshipCard[]
│   │   └── TrustLevelGroup (None)
│   │       └── RelationshipCard[]
│   ├── CanvasControls (Zoom, Pan - optional)
│   └── ExportButton ("Export PDF")
│
├── ExportSuccessScreen
│   ├── SuccessIcon
│   ├── SuccessMessage
│   ├── Description
│   ├── StartNewSessionButton
│   └── CloseButton
│
└── TrustDefinitionsModal
    ├── Header
    ├── TrustLevelDefinition (High)
    ├── TrustLevelDefinition (Moderate)
    ├── TrustLevelDefinition (Low)
    └── TrustLevelDefinition (None)
```

### 2.2 Component Responsibilities

| Component | Responsibility | Props | State |
|-----------|---------------|-------|-------|
| App | Root component, routing | None | None |
| SessionProvider | Global session state | children | relationships, trustLevels, currentStep |
| Layout | Page layout (header, main) | children | None |
| LandingScreen | Landing page | onStartSession | None |
| NamingScreen | Add/edit relationships | onRelationshipsChange | local form state |
| ScoringScreen | Score trust levels | onTrustLevelsChange | None |
| CanvasScreen | Display visual canvas | relationships, trustLevels | local view state |
| ExportSuccessScreen | Success message | onStartNewSession | None |
| TrustDefinitionsModal | Trust definitions | onClose | None |

---

## 3. Data Flow

### 3.1 Session State Flow

```
┌─────────────────────────────────────────────────────────────┐
│                   SESSION CONTEXT                          │
│  (Global State)                                           │
│  ┌─────────────────────────────────────────────────────┐  │
│  │ relationships: Relationship[]                       │  │
│  │   [{ id, name }, { id, name }, ...]               │  │
│  │                                                     │  │
│  │ trustLevels: Record<string, TrustLevel>            │  │
│  │   { "id-1": "high", "id-2": "moderate", ... }     │  │
│  │                                                     │  │
│  │ currentStep: 'naming' \| 'scoring' \| 'canvas'     │  │
│  └─────────────────────────────────────────────────────┘  │
└─────────────────────────────────────────────────────────────┘
         │                           │
         │                           │
         ▼                           ▼
┌─────────────────┐       ┌─────────────────┐
│ NamingScreen    │       │ ScoringScreen   │
│ (Read + Write)  │       │ (Read + Write)  │
│                 │       │                 │
│ - Read:         │       │ - Read:         │
│   relationships │       │   relationships │
│                 │       │   trustLevels   │
│ - Write:        │       │                 │
│   add(name)     │       │ - Write:        │
│   remove(id)    │       │   setLevel(id,  │
│                 │       │     level)      │
└─────────────────┘       └─────────────────┘
         │                           │
         │                           │
         └───────────┬───────────────┘
                     │
                     ▼
         ┌───────────────────────┐
         │ CanvasScreen        │
         │ (Read Only)         │
         │                     │
         │ - Read:             │
         │   relationships     │
         │   trustLevels       │
         └───────────────────────┘
                     │
                     ▼
         ┌───────────────────────┐
         │ PDF Export           │
         │ (Read Only)         │
         │                     │
         │ - Read:             │
         │   canvasRef         │
         └───────────────────────┘
```

### 3.2 User Action Flow

```
USER ACTION                    COMPONENT ACTION           STATE UPDATE
─────────────────────────────────────────────────────────────────────────
Click "Start Session"        Navigate to Naming        currentStep = 'naming'
─────────────────────────────────────────────────────────────────────────
Add relationship "Alice"     addRelationship("Alice")  relationships = [
                                                      {id, name: "Alice"}
                                                     ]
─────────────────────────────────────────────────────────────────────────
Add relationship "Bob"       addRelationship("Bob")    relationships = [
                                                      {id, name: "Alice"},
                                                      {id, name: "Bob"}
                                                     ]
─────────────────────────────────────────────────────────────────────────
Click "Next" (12+ items)   Navigate to Scoring       currentStep = 'scoring'
─────────────────────────────────────────────────────────────────────────
Select "High" for Alice     setTrustLevel(id, 'high') trustLevels = {
                                                      "id-1": "high"
                                                     }
─────────────────────────────────────────────────────────────────────────
Select "Moderate" for Bob    setTrustLevel(id, 'moderate') trustLevels = {
                                                      "id-1": "high",
                                                      "id-2": "moderate"
                                                     }
─────────────────────────────────────────────────────────────────────────
Click "View Canvas"         Navigate to Canvas       currentStep = 'canvas'
                              (all relationships     (all scored)
                               scored)
─────────────────────────────────────────────────────────────────────────
Click "Export PDF"          Generate PDF            trustLevels captured
                              (html2canvas → jsPDF)   in PDF
─────────────────────────────────────────────────────────────────────────
Click "Start New Session"   Clear state             relationships = []
                                                       trustLevels = {}
                              Navigate to Naming     currentStep = 'naming'
─────────────────────────────────────────────────────────────────────────
```

---

## 4. Technology Stack Layers

### 4.1 Layered Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                     PRESENTATION LAYER                      │
│  ┌─────────────────────────────────────────────────────┐   │
│  │  React 19 Components                                │   │
│  │  - LandingScreen, NamingScreen, ScoringScreen     │   │
│  │  - CanvasScreen, ExportSuccessScreen               │   │
│  │  - TrustDefinitionsModal                           │   │
│  └─────────────────────────────────────────────────────┘   │
│  ┌─────────────────────────────────────────────────────┐   │
│  │  UI Component Library                              │   │
│  │  - Radix UI (Dialog, Dropdown, Tooltip, etc.)     │   │
│  │  - Phosphor Icons                                  │   │
│  └─────────────────────────────────────────────────────┘   │
│  ┌─────────────────────────────────────────────────────┐   │
│  │  Styling                                            │   │
│  │  - Tailwind CSS (utility classes)                   │   │
│  │  - CSS Modules (complex components)                │   │
│  └─────────────────────────────────────────────────────┘   │
└─────────────────────────────────────────────────────────────┘
                           │
                           ▼
┌─────────────────────────────────────────────────────────────┐
│                      BUSINESS LOGIC LAYER                   │
│  ┌─────────────────────────────────────────────────────┐   │
│  │  State Management                                    │   │
│  │  - React Context (Session Context)                  │   │
│  │  - React Hooks (useState, useEffect, useCallback)   │   │
│  └─────────────────────────────────────────────────────┘   │
│  ┌─────────────────────────────────────────────────────┐   │
│  │  Form Management                                     │   │
│  │  - React Hook Form (form state, validation)        │   │
│  │  - Zod (schema validation)                          │   │
│  └─────────────────────────────────────────────────────┘   │
│  ┌─────────────────────────────────────────────────────┐   │
│  │  Business Rules                                      │   │
│  │  - Minimum 12 relationships                        │   │
│  │  - Maximum 25 relationships                        │   │
│  │  - No duplicate names                              │   │
│  │  - All relationships must be scored                │   │
│  └─────────────────────────────────────────────────────┘   │
└─────────────────────────────────────────────────────────────┘
                           │
                           ▼
┌─────────────────────────────────────────────────────────────┐
│                      DATA LAYER                            │
│  ┌─────────────────────────────────────────────────────┐   │
│  │  In-Memory State                                    │   │
│  │  - relationships: Relationship[]                   │   │
│  │  - trustLevels: Record<string, TrustLevel>        │   │
│  │  - currentStep: Step                              │   │
│  └─────────────────────────────────────────────────────┘   │
│  ┌─────────────────────────────────────────────────────┐   │
│  │  PDF Generation                                     │   │
│  │  - html2canvas (DOM to canvas)                     │   │
│  │  - jsPDF (canvas to PDF)                           │   │
│  └─────────────────────────────────────────────────────┘   │
└─────────────────────────────────────────────────────────────┘
                           │
                           ▼
┌─────────────────────────────────────────────────────────────┐
│                     PLATFORM LAYER                          │
│  ┌─────────────────────────────────────────────────────┐   │
│  │  Next.js 15 (Static Export)                        │   │
│  │  - Build tool                                      │   │
│  │  - Routing (client-side)                           │   │
│  │  - Image optimization                              │   │
│  └─────────────────────────────────────────────────────┘   │
│  ┌─────────────────────────────────────────────────────┐   │
│  │  Vercel (Deployment)                               │   │
│  │  - Edge network (CDN)                              │   │
│  │  - Automatic SSL/HTTPS                              │   │
│  │  - Preview deployments                            │   │
│  └─────────────────────────────────────────────────────┘   │
└─────────────────────────────────────────────────────────────┘
```

---

## 5. Data Structures

### 5.1 TypeScript Interfaces

```typescript
// Relationship
interface Relationship {
  id: string;              // UUID
  name: string;            // "Alice Johnson"
}

// Trust Level
type TrustLevel = 'high' | 'moderate' | 'low' | 'none';

// Session State
interface SessionState {
  relationships: Relationship[];
  trustLevels: Record<string, TrustLevel>;
  currentStep: 'naming' | 'scoring' | 'canvas' | 'complete';
}

// Trust Definition
interface TrustDefinition {
  level: TrustLevel;
  label: string;
  description: string;
  color: string;
}

// Export Data (for PDF)
interface ExportData {
  relationships: Relationship[];
  trustLevels: Record<string, TrustLevel>;
  exportedAt: Date;
}
```

### 5.2 Data Flow Diagrams

#### Adding a Relationship

```
User Input
    │
    ▼
┌─────────────────┐
│ Input Field    │
│ (name: "Alice")│
└─────────────────┘
    │
    ▼
┌─────────────────┐
│ React Hook Form│
│ Validation     │
│ (Zod schema)  │
└─────────────────┘
    │
    ▼
┌─────────────────┐
│ addRelationship│
│ (Session       │
│  Context)      │
└─────────────────┘
    │
    ▼
┌─────────────────┐
│ relationships  │
│ (State)        │
│ [              │
│  {id, name:   │
│   "Alice"}     │
│ ]              │
└─────────────────┘
```

#### Scoring a Relationship

```
User Click
    │
    ▼
┌─────────────────┐
│ Trust Level    │
│ Selector       │
│ (Click "High") │
└─────────────────┘
    │
    ▼
┌─────────────────┐
│ setTrustLevel  │
│ (id, 'high')   │
│ (Session       │
│  Context)      │
└─────────────────┘
    │
    ▼
┌─────────────────┐
│ trustLevels    │
│ (State)        │
│ {              │
│  "id-1":      │
│  "high"       │
│ }              │
└─────────────────┘
```

#### Exporting to PDF

```
User Click
    │
    ▼
┌─────────────────┐
│ Export Button  │
│ (Click)        │
└─────────────────┘
    │
    ▼
┌─────────────────┐
│ html2canvas    │
│ (DOM to canvas)│
└─────────────────┘
    │
    ▼
┌─────────────────┐
│ Canvas Image   │
│ (PNG base64)   │
└─────────────────┘
    │
    ▼
┌─────────────────┐
│ jsPDF          │
│ (Canvas to PDF) │
└─────────────────┘
    │
    ▼
┌─────────────────┐
│ PDF File       │
│ (Download)      │
└─────────────────┘
```

---

## 6. Deployment Architecture

### 6.1 Deployment Flow

```
┌─────────────────────────────────────────────────────────────┐
│                    DEVELOPMENT LOCAL                         │
│  ┌─────────────────────────────────────────────────────┐   │
│  │  next dev (localhost:3000)                        │   │
│  │  - Hot reload                                      │   │
│  │  - Fast refresh                                    │   │
│  │  - Error overlay                                   │   │
│  └─────────────────────────────────────────────────────┘   │
└─────────────────────────────────────────────────────────────┘
                           │
                           │ git push
                           ▼
┌─────────────────────────────────────────────────────────────┐
│                    GITHUB REPOSITORY                       │
│  ┌─────────────────────────────────────────────────────┐   │
│  │  main branch (production)                           │   │
│  │  - Source code                                      │   │
│  │  - Configuration files                              │   │
│  └─────────────────────────────────────────────────────┘   │
└─────────────────────────────────────────────────────────────┘
                           │
                           │ Vercel webhook
                           ▼
┌─────────────────────────────────────────────────────────────┐
│                    VERCEL BUILD                           │
│  ┌─────────────────────────────────────────────────────┐   │
│  │  next build (static export)                        │   │
│  │  - TypeScript compilation                          │   │
│  │  - ESLint checking                                │   │
│  │  - Tailwind CSS generation                         │   │
│  │  - Static HTML/CSS/JS output                       │   │
│  └─────────────────────────────────────────────────────┘   │
└─────────────────────────────────────────────────────────────┘
                           │
                           ▼
┌─────────────────────────────────────────────────────────────┐
│                    VERCEL EDGE NETWORK                     │
│  ┌─────────────────────────────────────────────────────┐   │
│  │  Global CDN (100+ locations)                      │   │
│  │  - Automatic SSL/HTTPS                            │   │
│  │  - Edge caching                                   │   │
│  │  - Fast response times                            │   │
│  └─────────────────────────────────────────────────────┘   │
└─────────────────────────────────────────────────────────────┘
                           │
                           ▼
┌─────────────────────────────────────────────────────────────┐
│                    USER BROWSER                            │
│  ┌─────────────────────────────────────────────────────┐   │
│  │  Static files served from CDN                      │   │
│  │  - HTML                                            │   │
│  │  - CSS                                             │   │
│  │  - JavaScript (React app)                           │   │
│  └─────────────────────────────────────────────────────┘   │
└─────────────────────────────────────────────────────────────┘
```

### 6.2 Deployment Configuration

**next.config.js** (Static Export):
```javascript
/** @type {import('next').NextConfig} */
const nextConfig = {
  output: 'export', // Static export (no server)
  images: {
    unoptimized: true, // Required for static export
  },
  trailingSlash: true, // Better for static sites
};

module.exports = nextConfig;
```

**vercel.json** (Optional):
```json
{
  "buildCommand": "npm run build",
  "outputDirectory": "out",
  "framework": "nextjs",
  "regions": ["iad1"] // Default to US East
}
```

---

## 7. Security Architecture

### 7.1 Security Diagram

```
┌─────────────────────────────────────────────────────────────┐
│                    CLIENT SIDE                             │
│  ┌─────────────────────────────────────────────────────┐   │
│  │  Input Validation (Zod)                            │   │
│  │  - Relationship name: 1-50 characters             │   │
│  │  - No duplicates                                  │   │
│  │  - No HTML/JS injection                           │   │
│  └─────────────────────────────────────────────────────┘   │
│  ┌─────────────────────────────────────────────────────┐   │
│  │  XSS Prevention                                    │   │
│  │  - React auto-escapes HTML                        │   │
│  │  - No dangerouslySetInnerHTML (unless sanitized)    │   │
│  │  - CSP header (Content Security Policy)             │   │
│  └─────────────────────────────────────────────────────┘   │
└─────────────────────────────────────────────────────────────┘
                           │
                           ▼
┌─────────────────────────────────────────────────────────────┐
│                    HTTPS ENFORCEMENT                        │
│  ┌─────────────────────────────────────────────────────┐   │
│  │  Vercel Automatic SSL                              │   │
│  │  - HTTPS only                                      │   │
│  │  - Automatic certificate renewal                    │   │
│  │  - HSTS header                                     │   │
│  └─────────────────────────────────────────────────────┘   │
└─────────────────────────────────────────────────────────────┘
```

### 7.2 Privacy by Design

**No Data Storage**:
- No cookies
- No localStorage
- No sessionStorage
- No IndexedDB
- No server-side database

**No Data Transmission**:
- No API calls
- No analytics
- No tracking
- No beacons

**Benefits**:
- Zero data breach risk
- GDPR compliant (no personal data)
- User privacy guaranteed
- No data retention requirements

---

## 8. Performance Architecture

### 8.1 Performance Optimization

```
┌─────────────────────────────────────────────────────────────┐
│                    BUILD TIME                              │
│  ┌─────────────────────────────────────────────────────┐   │
│  │  Code Splitting (Next.js)                           │   │
│  │  - One bundle per page (screen)                     │   │
│  │  - Lazy load components                            │   │
│  │  - Tree shaking (unused code removed)               │   │
│  └─────────────────────────────────────────────────────┘   │
│  ┌─────────────────────────────────────────────────────┐   │
│  │  CSS Optimization (Tailwind)                        │   │
│  │  - Purge unused styles                             │   │
│  │  - Minify CSS                                      │   │
│  │  - Critical CSS extraction                         │   │
│  └─────────────────────────────────────────────────────┘   │
└─────────────────────────────────────────────────────────────┘
                           │
                           ▼
┌─────────────────────────────────────────────────────────────┐
│                    RUNTIME                                 │
│  ┌─────────────────────────────────────────────────────┐   │
│  │  React 19 Optimizations                             │   │
│  │  - Concurrent rendering                             │   │
│  │  - Automatic batching                               │   │
│  │  - Memoization (useMemo, useCallback)               │   │
│  └─────────────────────────────────────────────────────┘   │
│  ┌─────────────────────────────────────────────────────┐   │
│  │  State Management (React Context)                   │   │
│  │  - Minimal re-renders (small state)                │   │
│  │  - Context splitting (multiple providers)           │   │
│  │  - Selector pattern (if needed)                    │   │
│  └─────────────────────────────────────────────────────┘   │
└─────────────────────────────────────────────────────────────┘
                           │
                           ▼
┌─────────────────────────────────────────────────────────────┐
│                    NETWORK                                  │
│  ┌─────────────────────────────────────────────────────┐   │
│  │  Vercel Edge Network                                │   │
│  │  - Global CDN (100+ locations)                      │   │
│  │  - Edge caching (static assets)                      │   │
│  │  - Fast response times (< 100ms)                    │   │
│  └─────────────────────────────────────────────────────┘   │
└─────────────────────────────────────────────────────────────┘
```

### 8.2 Bundle Size Targets

| Asset | Target | Actual (Est.) |
|-------|--------|---------------|
| JavaScript (total) | < 200KB | ~150KB |
| CSS (total) | < 50KB | ~30KB |
| Fonts (Inter) | < 100KB | ~80KB |
| Icons (Phosphor) | < 50KB | ~20KB |
| **Total** | **< 400KB** | **~280KB** |

---

## 9. Accessibility Architecture

### 9.1 Accessibility Layers

```
┌─────────────────────────────────────────────────────────────┐
│                    COMPONENT LAYER                         │
│  ┌─────────────────────────────────────────────────────┐   │
│  │  Radix UI Components                               │   │
│  │  - Built-in ARIA attributes                        │   │
│  │  - Keyboard navigation                             │   │
│  │  - Focus management                               │   │
│  │  - WCAG 2.1 AA compliant                          │   │
│  └─────────────────────────────────────────────────────┘   │
└─────────────────────────────────────────────────────────────┘
                           │
                           ▼
┌─────────────────────────────────────────────────────────────┐
│                    CUSTOM COMPONENTS                       │
│  ┌─────────────────────────────────────────────────────┐   │
│  │  ARIA Attributes                                    │   │
│  │  - aria-label (icon-only buttons)                  │   │
│  │  - aria-describedby (error messages)               │   │
│  │  - aria-invalid (form validation)                  │   │
│  │  - role="dialog" (modals)                         │   │
│  └─────────────────────────────────────────────────────┘   │
│  ┌─────────────────────────────────────────────────────┐   │
│  │  Keyboard Support                                   │   │
│  │  - Tab navigation                                  │   │
│  │  - Enter/Space activation                          │   │
│  │  - ESC key (modals)                               │   │
│  │  - Focus indicators                                │   │
│  └─────────────────────────────────────────────────────┘   │
└─────────────────────────────────────────────────────────────┘
                           │
                           ▼
┌─────────────────────────────────────────────────────────────┐
│                    STYLING LAYER                          │
│  ┌─────────────────────────────────────────────────────┐   │
│  │  Color Contrast                                     │   │
│  │  - Text > 4.5:1                                    │   │
│  │  - UI components > 3:1                             │   │
│  │  - Color independence (icon + color)               │   │
│  └─────────────────────────────────────────────────────┘   │
│  ┌─────────────────────────────────────────────────────┐   │
│  │  Typography                                        │   │
│  │  - Readable font sizes (14px minimum)             │   │
│  │  - Line height 1.5                                │   │
│  │  - Resizable to 200%                              │   │
│  └─────────────────────────────────────────────────────┘   │
└─────────────────────────────────────────────────────────────┘
```

---

## 10. Architecture Summary

### 10.1 Key Architectural Decisions

| Decision | Rationale | Trade-off |
|----------|-----------|-----------|
| Client-side only | Simpler deployment, better privacy | No server-side processing |
| Static export | Fast builds, low cost | No SSR, no server-side caching |
| React Context for state | Sufficient for simple state | Not suitable for complex state |
| No database | Zero data breach risk | No session persistence |
| Radix UI for components | Accessibility-first | Limited customization |
| Tailwind CSS for styling | Rapid development | Larger initial bundle |

### 10.2 Architecture Principles

1. **Simplicity**: Client-side only, no backend complexity
2. **Privacy**: Zero data storage, zero data transmission
3. **Performance**: Small bundle, fast load times
4. **Accessibility**: WCAG 2.1 AA compliant
5. **Maintainability**: TypeScript, ESLint, Prettier
6. **Scalability**: Stateless, horizontal scaling (CDN)

---

**Architecture Diagram Status**: Complete
**Dependencies**: Tech Stack Decision, PRD, NFR Spec
**Next Steps**: Create API Contract artifact
