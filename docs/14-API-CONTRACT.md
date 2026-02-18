# API Contract

**Version**: 1.0
**Date**: 2026-02-17
**Based On**: PRD + Architecture Diagram + Tech Stack Decision
**Product**: True Valence Mapper v1.0

---

## API Contract Overview

**Purpose**: Define internal component APIs and data contracts.

**Scope**: Client-side only (no external APIs or backend services).

**Type**: Internal component contracts (React props, hooks, types).

---

## 1. API Design Philosophy

### 1.1 API Principles

**Explicit Over Implicit**:
- All props must have clear, descriptive names
- No implicit behavior or side effects
- Callbacks explicitly named (e.g., `onAdd` not `add`)

**Type Safety**:
- All APIs fully typed with TypeScript
- No `any` types (except where unavoidable)
- Exported types for external consumption

**Minimal API Surface**:
- Only expose necessary props and methods
- Avoid prop drilling (use Context where appropriate)
- Single Responsibility Principle (each API has one purpose)

**Error Handling**:
- Errors thrown explicitly (not silent failures)
- Error types documented
- Error recovery strategies defined

---

## 2. Component APIs

### 2.1 App Component

**Purpose**: Root component, manages application state and routing.

**Props**:
```typescript
interface AppProps {
  children?: React.ReactNode;
}
```

**Usage**:
```tsx
export default function App() {
  return (
    <SessionProvider>
      <Layout>
        <Router />
      </Layout>
    </SessionProvider>
  );
}
```

**Responsibilities**:
- Wrap app in SessionProvider
- Define routing logic
- Manage global error boundaries

---

### 2.2 SessionProvider Component

**Purpose**: Global state management for session data.

**Props**:
```typescript
interface SessionProviderProps {
  children: React.ReactNode;
}
```

**Context Value**:
```typescript
interface SessionContextValue {
  // State
  relationships: Relationship[];
  trustLevels: Record<string, TrustLevel>;
  currentStep: 'naming' | 'scoring' | 'canvas' | 'complete';

  // Actions
  addRelationship: (name: string) => void;
  removeRelationship: (id: string) => void;
  updateRelationship: (id: string, name: string) => void;
  setTrustLevel: (id: string, level: TrustLevel) => void;
  setCurrentStep: (step: SessionContextValue['currentStep']) => void;
  clearSession: () => void;
}
```

**Usage**:
```tsx
function Component() {
  const {
    relationships,
    addRelationship,
    setTrustLevel,
    setCurrentStep,
  } = useSession();

  return <div>...</div>;
}
```

**Responsibilities**:
- Manage relationships state
- Manage trust levels state
- Manage current step state
- Provide actions for state mutations

---

### 2.3 Layout Component

**Purpose**: Page layout (header, main content).

**Props**:
```typescript
interface LayoutProps {
  children: React.ReactNode;
}
```

**Usage**:
```tsx
<Layout>
  <LandingScreen />
</Layout>
```

**Responsibilities**:
- Render header with logo
- Render main content area
- Responsive layout (mobile/tablet/desktop)

---

### 2.4 LandingScreen Component

**Purpose**: Landing page with CTA to start session.

**Props**:
```typescript
interface LandingScreenProps {
  onStartSession: () => void;
  onOpenDefinitions: () => void;
}
```

**Usage**:
```tsx
<LandingScreen
  onStartSession={() => setCurrentStep('naming')}
  onOpenDefinitions={() => setShowModal(true)}
/>
```

**Responsibilities**:
- Display hero section
- Display CTA button
- Link to trust definitions modal

---

### 2.5 NamingScreen Component

**Purpose**: Add/edit relationships.

**Props**:
```typescript
interface NamingScreenProps {
  relationships: Relationship[];
  onAdd: (name: string) => void;
  onRemove: (id: string) => void;
  onUpdate: (id: string, name: string) => void;
  onNext: () => void;
  onBack: () => void;
  onOpenDefinitions: () => void;
}
```

**Usage**:
```tsx
<NamingScreen
  relationships={relationships}
  onAdd={addRelationship}
  onRemove={removeRelationship}
  onUpdate={updateRelationship}
  onNext={() => setCurrentStep('scoring')}
  onBack={() => setCurrentStep('landing')}
  onOpenDefinitions={() => setShowModal(true)}
/>
```

**Responsibilities**:
- Display relationship form
- Display relationship list
- Validate inputs (min 12, max 25, no duplicates)
- Enable/disable "Next" button based on validation

---

### 2.6 RelationshipForm Component

**Purpose**: Input form for adding relationships.

**Props**:
```typescript
interface RelationshipFormProps {
  onAdd: (name: string) => void;
  existingNames: string[];
  disabled?: boolean;
}
```

**Usage**:
```tsx
<RelationshipForm
  onAdd={addRelationship}
  existingNames={relationships.map(r => r.name)}
  disabled={relationships.length >= 25}
/>
```

**Responsibilities**:
- Validate input (not empty, not duplicate)
- Call `onAdd` with validated name
- Display error messages
- Disable if max relationships reached

---

### 2.7 RelationshipCard Component

**Purpose**: Display relationship with edit/remove actions.

**Props**:
```typescript
interface RelationshipCardProps {
  relationship: Relationship;
  onEdit?: (id: string) => void;
  onRemove?: (id: string) => void;
  isEditing?: boolean;
  onEditSave?: (id: string, name: string) => void;
  onEditCancel?: () => void;
}
```

**Usage**:
```tsx
<RelationshipCard
  relationship={relationship}
  onEdit={onEdit}
  onRemove={onRemove}
/>
```

**Responsibilities**:
- Display relationship name
- Show edit/remove buttons
- Edit mode (if `isEditing` is true)
- Save/cancel edit

---

### 2.8 ScoringScreen Component

**Purpose**: Score trust levels for relationships.

**Props**:
```typescript
interface ScoringScreenProps {
  relationships: Relationship[];
  trustLevels: Record<string, TrustLevel>;
  onSetTrustLevel: (id: string, level: TrustLevel) => void;
  onNext: () => void;
  onBack: () => void;
  onOpenDefinitions: () => void;
}
```

**Usage**:
```tsx
<ScoringScreen
  relationships={relationships}
  trustLevels={trustLevels}
  onSetTrustLevel={setTrustLevel}
  onNext={() => setCurrentStep('canvas')}
  onBack={() => setCurrentStep('naming')}
  onOpenDefinitions={() => setShowModal(true)}
/>
```

**Responsibilities**:
- Display relationships with trust level selectors
- Show progress (X/Y scored)
- Enable/disable "View Canvas" based on completion

---

### 2.9 TrustLevelSelector Component

**Purpose**: Select trust level for a relationship.

**Props**:
```typescript
interface TrustLevelSelectorProps {
  relationshipId: string;
  selectedLevel?: TrustLevel;
  onSelect: (id: string, level: TrustLevel) => void;
}
```

**Usage**:
```tsx
<TrustLevelSelector
  relationshipId={relationship.id}
  selectedLevel={trustLevels[relationship.id]}
  onSelect={setTrustLevel}
/>
```

**Responsibilities**:
- Display 4 trust level buttons (High, Moderate, Low, None)
- Highlight selected level
- Call `onSelect` when level selected

---

### 2.10 CanvasScreen Component

**Purpose**: Display visual trust canvas.

**Props**:
```typescript
interface CanvasScreenProps {
  relationships: Relationship[];
  trustLevels: Record<string, TrustLevel>;
  onExport: () => Promise<void>;
  onBack: () => void;
}
```

**Usage**:
```tsx
<CanvasScreen
  relationships={relationships}
  trustLevels={trustLevels}
  onExport={exportPDF}
  onBack={() => setCurrentStep('scoring')}
/>
```

**Responsibilities**:
- Display relationships grouped by trust level
- Color-code by trust level
- Handle zoom/pan (optional)
- Call `onExport` when "Export PDF" clicked

---

### 2.11 TrustCanvas Component

**Purpose**: Visual display of trust landscape.

**Props**:
```typescript
interface TrustCanvasProps {
  relationships: Relationship[];
  trustLevels: Record<string, TrustLevel>;
}
```

**Usage**:
```tsx
<TrustCanvas
  relationships={relationships}
  trustLevels={trustLevels}
/>
```

**Responsibilities**:
- Render relationships as cards
- Group by trust level
- Color-code by trust level
- Responsive layout (grid)

---

### 2.12 ExportSuccessScreen Component

**Purpose**: Display success message after PDF export.

**Props**:
```typescript
interface ExportSuccessScreenProps {
  onStartNewSession: () => void;
}
```

**Usage**:
```tsx
<ExportSuccessScreen
  onStartNewSession={() => {
    clearSession();
    setCurrentStep('landing');
  }}
/>
```

**Responsibilities**:
- Display success message
- Display "Start New Session" button
- Display "Close" link

---

### 2.13 TrustDefinitionsModal Component

**Purpose**: Display trust definitions modal.

**Props**:
```typescript
interface TrustDefinitionsModalProps {
  isOpen: boolean;
  onClose: () => void;
}
```

**Usage**:
```tsx
<TrustDefinitionsModal
  isOpen={showModal}
  onClose={() => setShowModal(false)}
/>
```

**Responsibilities**:
- Display trust definitions
- Focus trap (accessibility)
- Close on ESC or click outside

---

## 3. Hooks APIs

### 3.1 useSession Hook

**Purpose**: Access session state and actions.

**Signature**:
```typescript
function useSession(): SessionContextValue;
```

**Returns**:
```typescript
interface SessionContextValue {
  // State
  relationships: Relationship[];
  trustLevels: Record<string, TrustLevel>;
  currentStep: 'naming' | 'scoring' | 'canvas' | 'complete';

  // Actions
  addRelationship: (name: string) => void;
  removeRelationship: (id: string) => void;
  updateRelationship: (id: string, name: string) => void;
  setTrustLevel: (id: string, level: TrustLevel) => void;
  setCurrentStep: (step: SessionContextValue['currentStep']) => void;
  clearSession: () => void;
}
```

**Usage**:
```tsx
function Component() {
  const { relationships, addRelationship, setTrustLevel } = useSession();

  return <div>...</div>;
}
```

**Error Handling**:
- Throws error if used outside `SessionProvider`

---

### 3.2 useRelationshipForm Hook

**Purpose**: Manage relationship form state and validation.

**Signature**:
```typescript
function useRelationshipForm(args: {
  existingNames: string[];
  onAdd: (name: string) => void;
}): {
  value: string;
  error: string | null;
  isAdding: boolean;
  handleChange: (value: string) => void;
  handleSubmit: () => void;
  canSubmit: boolean;
};
```

**Usage**:
```tsx
function RelationshipForm() {
  const { value, error, handleChange, handleSubmit, canSubmit } = useRelationshipForm({
    existingNames: relationships.map(r => r.name),
    onAdd: addRelationship,
  });

  return (
    <form onSubmit={handleSubmit}>
      <input
        value={value}
        onChange={(e) => handleChange(e.target.value)}
      />
      {error && <p className="error">{error}</p>}
      <button type="submit" disabled={!canSubmit}>Add</button>
    </form>
  );
}
```

---

### 3.3 usePDFExport Hook

**Purpose**: Export canvas to PDF.

**Signature**:
```typescript
function usePDFExport(): {
  isExporting: boolean;
  error: string | null;
  exportPDF: (canvasRef: RefObject<HTMLElement>) => Promise<void>;
};
```

**Usage**:
```tsx
function CanvasScreen() {
  const canvasRef = useRef<HTMLDivElement>(null);
  const { isExporting, error, exportPDF } = usePDFExport();

  const handleExport = async () => {
    await exportPDF(canvasRef);
  };

  return (
    <div>
      <div ref={canvasRef}>
        {/* Canvas content */}
      </div>
      <button onClick={handleExport} disabled={isExporting}>
        {isExporting ? 'Exporting...' : 'Export PDF'}
      </button>
      {error && <p className="error">{error}</p>}
    </div>
  );
}
```

**Error Handling**:
- Sets error message if export fails
- Sets `isExporting` to false after export (success or failure)

---

## 4. Data Types

### 4.1 Core Types

```typescript
// Relationship
interface Relationship {
  id: string;
  name: string;
}

// Trust Level
type TrustLevel = 'high' | 'moderate' | 'low' | 'none';

// Step
type Step = 'naming' | 'scoring' | 'canvas' | 'complete';

// Session State
interface SessionState {
  relationships: Relationship[];
  trustLevels: Record<string, TrustLevel>;
  currentStep: Step;
}
```

### 4.2 UI Types

```typescript
// Trust Definition
interface TrustDefinition {
  level: TrustLevel;
  label: string;
  description: string;
  color: string;
}

// Toast Message
interface ToastMessage {
  id: string;
  type: 'success' | 'error' | 'warning';
  message: string;
}

// Form Error
interface FormError {
  field: string;
  message: string;
}
```

### 4.3 Export Types

```typescript
// Export Options
interface ExportOptions {
  scale?: number; // Canvas scale (default: 2)
  filename?: string; // PDF filename (default: "trust-map-YYYY-MM-DD.pdf")
}

// Export Result
interface ExportResult {
  success: boolean;
  filename?: string;
  error?: string;
}
```

---

## 5. Validation Rules

### 5.1 Relationship Name Validation

**Rules**:
1. Not empty (minimum 1 character)
2. Maximum 50 characters
3. Not duplicate (case-insensitive)
4. No HTML/JS injection (sanitized)

**Validation Function**:
```typescript
function validateRelationshipName(
  name: string,
  existingNames: string[]
): { isValid: boolean; error?: string } {
  // Rule 1: Not empty
  if (name.trim().length === 0) {
    return { isValid: false, error: 'Please enter a relationship name' };
  }

  // Rule 2: Max 50 characters
  if (name.length > 50) {
    return { isValid: false, error: 'Name must be 50 characters or less' };
  }

  // Rule 3: No duplicates
  const normalized = name.toLowerCase().trim();
  if (existingNames.some(existing => existing.toLowerCase() === normalized)) {
    return { isValid: false, error: 'This relationship is already in your list' };
  }

  return { isValid: true };
}
```

### 5.2 Relationships Count Validation

**Rules**:
1. Minimum 12 relationships to proceed
2. Maximum 25 relationships allowed

**Validation Function**:
```typescript
function validateRelationshipsCount(count: number): {
  isValid: boolean;
  canProceed: boolean;
  error?: string;
} {
  if (count < 12) {
    return {
      isValid: true,
      canProceed: false,
      error: `Add ${12 - count} more relationships to proceed`,
    };
  }

  if (count > 25) {
    return {
      isValid: false,
      canProceed: false,
      error: 'Maximum 25 relationships allowed',
    };
  }

  return {
    isValid: true,
    canProceed: true,
  };
}
```

### 5.3 Trust Level Validation

**Rules**:
1. Must be valid trust level ('high' | 'moderate' | 'low' | 'none')
2. All relationships must be scored to proceed

**Validation Function**:
```typescript
function validateTrustLevel(level: unknown): level is TrustLevel {
  return typeof level === 'string' && ['high', 'moderate', 'low', 'none'].includes(level);
}

function validateAllTrustLevels(
  relationships: Relationship[],
  trustLevels: Record<string, TrustLevel>
): { isValid: boolean; error?: string } {
  const unscored = relationships.filter(r => !trustLevels[r.id]);

  if (unscored.length > 0) {
    return {
      isValid: false,
      error: `Please score ${unscored.length} more relationships`,
    };
  }

  return { isValid: true };
}
```

---

## 6. Error Handling

### 6.1 Error Types

```typescript
// ValidationError
interface ValidationError {
  type: 'validation';
  field: string;
  message: string;
}

// ExportError
interface ExportError {
  type: 'export';
  message: string;
  details?: string;
}

// StateError
interface StateError {
  type: 'state';
  message: string;
}

// AppError
type AppError = ValidationError | ExportError | StateError;
```

### 6.2 Error Handling Pattern

```typescript
// Component error handling
function Component() {
  const [error, setError] = useState<string | null>(null);

  const handleAction = async () => {
    try {
      setError(null);
      await performAction();
    } catch (err) {
      if (err instanceof ValidationError) {
        setError(err.message);
      } else if (err instanceof ExportError) {
        setError(`Failed to export: ${err.message}`);
      } else {
        setError('Something went wrong. Please try again.');
      }
    }
  };

  return (
    <div>
      {error && <div className="error">{error}</div>}
      <button onClick={handleAction}>Action</button>
    </div>
  );
}
```

---

## 7. Event Types

### 7.1 User Events

```typescript
// User Interaction Events
interface UserEvent {
  type: 'user-interaction';
  action: string;
  timestamp: Date;
  metadata?: Record<string, unknown>;
}

// Examples
const addRelationshipEvent: UserEvent = {
  type: 'user-interaction',
  action: 'add-relationship',
  timestamp: new Date(),
  metadata: { name: 'Alice Johnson' },
};

const setTrustLevelEvent: UserEvent = {
  type: 'user-interaction',
  action: 'set-trust-level',
  timestamp: new Date(),
  metadata: { relationshipId: '123', level: 'high' },
};
```

**Note**: Events are not logged in v1.0 (privacy-first). Included here for future analytics.

---

## 8. External Dependencies

### 8.1 Third-Party Library APIs

**Note**: True Valence Mapper v1.0 uses third-party libraries but does not expose their APIs directly.

**Libraries Used**:
- React 19: Component library (internal API)
- Next.js 15: Build tool and routing (internal API)
- Radix UI: UI components (exposed via props)
- React Hook Form: Form management (exposed via hooks)
- Zod: Schema validation (internal API)
- jsPDF: PDF generation (internal API)
- html2canvas: DOM to canvas (internal API)
- Phosphor Icons: Icon library (exposed as JSX)

**No External APIs**: True Valence Mapper v1.0 does not call any external APIs (no fetch, no XMLHttpRequest, no third-party APIs).

---

## 9. Versioning and Deprecation

### 9.1 API Versioning

**Version**: 1.0.0

**Semantic Versioning**:
- Major (X.0.0): Breaking changes to props, hooks, or types
- Minor (0.X.0): New props, hooks, or types (backward compatible)
- Patch (0.0.X): Bug fixes, documentation updates

### 9.2 Deprecation Policy

**Deprecation Process**:
1. Mark API as deprecated in documentation
2. Add TypeScript deprecation comment
3. Provide migration guide
4. Maintain deprecated API for 1 major version

**Example**:
```typescript
/**
 * @deprecated Use `addRelationship` instead. Will be removed in v2.0.
 */
interface OldProps {
  onAddItem: (item: string) => void;
}
```

---

## 10. API Usage Examples

### 10.1 Complete Flow Example

```typescript
// Example: Complete session flow
function App() {
  const { relationships, addRelationship, setTrustLevel, setCurrentStep } = useSession();

  // Step 1: Add relationships
  const handleAddRelationship = (name: string) => {
    addRelationship(name);
  };

  // Step 2: Score trust levels
  const handleSetTrustLevel = (id: string, level: TrustLevel) => {
    setTrustLevel(id, level);
  };

  // Step 3: Navigate to canvas
  const handleViewCanvas = () => {
    setCurrentStep('canvas');
  };

  return (
    <Layout>
      {step === 'naming' && (
        <NamingScreen
          relationships={relationships}
          onAdd={handleAddRelationship}
          onNext={handleViewCanvas}
        />
      )}
      {/* Other screens... */}
    </Layout>
  );
}
```

### 10.2 PDF Export Example

```typescript
// Example: PDF export with custom options
function CanvasScreen() {
  const canvasRef = useRef<HTMLDivElement>(null);
  const { isExporting, exportPDF } = usePDFExport();

  const handleExport = async () => {
    try {
      await exportPDF(canvasRef);
      setCurrentStep('complete');
    } catch (err) {
      console.error('Export failed:', err);
    }
  };

  return (
    <div>
      <div ref={canvasRef}>
        {/* Canvas content */}
      </div>
      <button onClick={handleExport} disabled={isExporting}>
        Export PDF
      </button>
    </div>
  );
}
```

---

## 11. API Contract Summary

### 11.1 API Categories

| Category | Count | Purpose |
|----------|-------|---------|
| Components | 13 | UI rendering and interaction |
| Hooks | 3 | State management and reusable logic |
| Types | 10 | TypeScript interfaces and types |
| Validation Functions | 3 | Input and state validation |
| Error Types | 3 | Error handling and reporting |

### 11.2 Key APIs

**Core APIs (Must Implement)**:
- `SessionProvider` (global state)
- `useSession` hook (access state)
- `LandingScreen` (entry point)
- `NamingScreen` (add relationships)
- `ScoringScreen` (score trust levels)
- `CanvasScreen` (visual display)
- `TrustDefinitionsModal` (definitions)

**Helper APIs (Convenience)**:
- `useRelationshipForm` (form management)
- `usePDFExport` (PDF generation)
- Validation functions (input validation)

---

**API Contract Status**: Complete
**Dependencies**: PRD, Architecture Diagram, Tech Stack Decision
**Next Steps**: Create Phase 6 artifacts (Implementation Plan, QA Strategy, Rollback Plan)
