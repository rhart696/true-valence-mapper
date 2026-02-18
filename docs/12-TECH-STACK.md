# Tech Stack Decision

**Version**: 1.0
**Date**: 2026-02-17
**Based On**: NFR Spec + PRD + Strategic Brief
**Product**: True Valence Mapper v1.0

---

## Tech Stack Overview

**Purpose**: Define technology choices and rationale for v1.0 MVP.

**Strategy**: Build on existing Claude edition foundation (React/Next.js), leverage battle-tested libraries, minimize new dependencies.

**Timeline**: 1 day development requires proven, well-documented tools.

---

## 1. Frontend Framework

### Decision: React 19 + Next.js 15

**Selected**: React 19.0.0 + Next.js 15.0.3

**Rationale**:

**1. Existing Foundation**
- Claude edition is built on React/Next.js
- 2,346 lines of production-ready code
- Reduces development time (proven architecture)
- Eliminates migration risk

**2. Server Components (Next.js 15)**
- Improved performance (no client-side JavaScript for static content)
- Smaller bundle size (only interactive components sent to client)
- Better SEO (if needed in future)

**3. Developer Experience**
- Strong ecosystem (3.5M+ packages on npm)
- Excellent documentation
- Large community support
- TypeScript support (type safety)

**4. Performance**
- React 19: Faster rendering, improved concurrent features
- Next.js 15: Automatic code splitting, image optimization
- Vercel deployment: Edge network, automatic SSL

**Alternatives Considered and Rejected**:

| Alternative | Why Rejected |
|-------------|--------------|
| Vue.js 3 | Less familiar, no existing foundation |
| Angular 18 | Overkill for simple session workflow |
| Svelte 4 | Smaller ecosystem, no existing foundation |
| Vanilla JS | No component library, harder accessibility |

**Configuration**:
```json
{
  "dependencies": {
    "next": "15.0.3",
    "react": "19.0.0",
    "react-dom": "19.0.0"
  }
}
```

---

## 2. UI Component Library

### Decision: Radix UI + Tailwind CSS

**Selected**: Radix UI 1.0.0 + Tailwind CSS 3.4.1

**Rationale**:

**1. Radix UI (Component Primitives)**
- **Accessibility-first**: All components WCAG compliant
- **Unstyled**: Perfect for custom design system
- **Comprehensive**: Buttons, dialogs, dropdowns, forms, tooltips
- **TypeScript**: Full type safety
- **Keyboard support**: Built-in keyboard navigation

**2. Tailwind CSS (Utility-First)**
- **Rapid development**: No custom CSS needed
- **Consistent design**: Design tokens as utility classes
- **Responsive**: Built-in responsive modifiers
- **Small bundle**: Purge unused styles automatically
- **Claude edition compatibility**: Already using Tailwind

**Alternatives Considered and Rejected**:

| Alternative | Why Rejected |
|-------------|--------------|
| MUI (Material UI) | Heavy bundle, opinionated design |
| Chakra UI | Smaller ecosystem, less flexibility |
| Ant Design | Too opinionated, heavy |
| Styled Components | No utility classes, more CSS to maintain |

**Configuration**:
```json
{
  "dependencies": {
    "@radix-ui/react-dialog": "^1.0.0",
    "@radix-ui/react-dropdown-menu": "^2.0.0",
    "@radix-ui/react-slot": "^1.0.0",
    "@radix-ui/react-tooltip": "^1.0.0",
    "@radix-ui/react-select": "^2.0.0"
  },
  "devDependencies": {
    "tailwindcss": "^3.4.1",
    "autoprefixer": "^10.4.17",
    "postcss": "^8.4.35"
  }
}
```

**Tailwind Config** (custom design tokens):
```javascript
// tailwind.config.js
module.exports = {
  theme: {
    extend: {
      colors: {
        trust: {
          blue: '#0052CC',
          green: '#00B87C',
          orange: '#FFAB00',
          red: '#FF5630',
        },
        gray: {
          light: '#F4F5F7',
          medium: '#6B778C',
          dark: '#091E42',
        }
      },
      fontFamily: {
        sans: ['Inter', 'sans-serif'],
      },
      spacing: {
        '72': '18rem',
        '84': '21rem',
        '96': '24rem',
      }
    }
  }
}
```

---

## 3. PDF Export

### Decision: jsPDF + html2canvas

**Selected**: jsPDF 2.5.1 + html2canvas 1.4.1

**Rationale**:

**1. jsPDF (PDF Generation)**
- **Client-side only**: No server needed
- **Mature**: 10+ years in production
- **Widely used**: 1M+ weekly downloads
- **Flexible**: Add text, images, shapes programmatically
- **Lightweight**: ~200KB gzipped

**2. html2canvas (HTML to Canvas)**
- **Capture DOM**: Renders HTML to canvas image
- **Works with CSS**: Preserves styles, colors, layout
- **High quality**: Configurable scale for crisp output
- **Mature**: 5+ years in production
- **Widely used**: 500K+ weekly downloads

**3. Combined Approach**
- html2canvas captures the trust canvas
- jsPDF adds the image to PDF
- Allows custom PDF formatting (headers, footers)
- Preserves visual fidelity

**Alternatives Considered and Rejected**:

| Alternative | Why Rejected |
|-------------|--------------|
| React-PDF | Complex API, harder to implement in 1 day |
| Print to PDF | Requires user interaction, inconsistent across browsers |
| PDFKit (Node.js) | Requires server, adds complexity |
| Puppeteer | Requires headless browser, heavy dependency |

**Implementation**:
```javascript
import jsPDF from 'jspdf';
import html2canvas from 'html2canvas';

async function exportToPDF(canvasRef) {
  const canvas = await html2canvas(canvasRef, {
    scale: 2, // High quality
    backgroundColor: '#ffffff',
  });

  const pdf = new jsPDF('p', 'mm', 'a4');
  const imgData = canvas.toDataURL('image/png');

  const imgWidth = 210; // A4 width in mm
  const imgHeight = (canvas.height * imgWidth) / canvas.width;

  pdf.addImage(imgData, 'PNG', 0, 0, imgWidth, imgHeight);
  pdf.save('trust-map-2026-02-17.pdf');
}
```

---

## 4. State Management

### Decision: React Context + useState

**Selected**: Built-in React hooks (Context API + useState)

**Rationale**:

**1. Session-Only Workflow**
- No persistence required
- Simple state (relationships + trust levels)
- Single session, no complex data flow

**2. Sufficient for Scale**
- 25 relationships max
- 4 trust levels per relationship
- ~100 items total
- Context API handles this easily

**3. No Additional Dependencies**
- React built-in (no extra install)
- Type-safe with TypeScript
- Simple and predictable

**4. Performance**
- Minimal re-renders (small state)
- No selector overhead (Redux)
- No prop drilling (Context)

**Alternatives Considered and Rejected**:

| Alternative | Why Rejected |
|-------------|--------------|
| Redux Toolkit | Overkill for simple state |
| Zustand | Additional dependency, not needed |
| Recoil | Additional dependency, not needed |
| Jotai | Additional dependency, not needed |

**Implementation**:
```typescript
// Session context
interface SessionState {
  relationships: Relationship[];
  trustLevels: Record<string, TrustLevel>;
  currentStep: 'naming' | 'scoring' | 'canvas' | 'complete';
  addRelationship: (name: string) => void;
  removeRelationship: (id: string) => void;
  setTrustLevel: (id: string, level: TrustLevel) => void;
  setCurrentStep: (step: SessionState['currentStep']) => void;
}

const SessionContext = createContext<SessionState | undefined>(undefined);

export function SessionProvider({ children }: { children: React.ReactNode }) {
  const [relationships, setRelationships] = useState<Relationship[]>([]);
  const [trustLevels, setTrustLevels] = useState<Record<string, TrustLevel>>({});
  const [currentStep, setCurrentStep] = useState<SessionState['currentStep']>('naming');

  const addRelationship = useCallback((name: string) => {
    const id = crypto.randomUUID();
    setRelationships(prev => [...prev, { id, name }]);
  }, []);

  // ... other methods

  return (
    <SessionContext.Provider value={{ relationships, trustLevels, currentStep, addRelationship, removeRelationship, setTrustLevel, setCurrentStep }}>
      {children}
    </SessionContext.Provider>
  );
}
```

---

## 5. Styling

### Decision: Tailwind CSS + CSS Modules for Custom Components

**Selected**: Tailwind CSS (primary) + CSS Modules (complex components)

**Rationale**:

**1. Tailwind CSS (Primary)**
- **Utility-first**: No custom CSS for 90% of styles
- **Consistent design**: Design tokens as utility classes
- **Responsive**: Built-in responsive modifiers
- **Small bundle**: Purge unused styles
- **Claude edition compatibility**: Already using Tailwind

**2. CSS Modules (Custom Components)**
- **Scoped styles**: No global style conflicts
- **Complex animations**: Easier than utility classes
- **Third-party components**: Override styles cleanly

**Alternatives Considered and Rejected**:

| Alternative | Why Rejected |
|-------------|--------------|
| Styled Components | More runtime overhead, no utility classes |
| Emotion | More runtime overhead, less familiar |
| SASS | Requires build step, no utility classes |
| Plain CSS | No design tokens, inconsistent |

**Implementation**:
```css
/* CustomButton.module.css */
.button {
  @apply px-6 py-3 rounded-lg font-medium transition-all duration-200;
}

.buttonPrimary {
  @apply bg-trust-blue text-white hover:bg-trust-blue-dark focus:outline-none focus:ring-2 focus:ring-trust-blue;
}

.buttonSecondary {
  @apply bg-transparent text-trust-blue border-2 border-trust-blue hover:bg-blue-50;
}
```

```tsx
import styles from './CustomButton.module.css';

<button className={`${styles.button} ${styles.buttonPrimary}`}>
  Start Session
</button>
```

---

## 6. Icons

### Decision: Phosphor Icons

**Selected**: @phosphor-icons/react 2.0.2

**Rationale**:

**1. Consistent Style**
- Outline style (professional, clean)
- Consistent stroke width (2px)
- Consistent corner radius (rounded)

**2. Comprehensive Set**
- 6,000+ icons
- All UI icons needed (play, chevron, download, trash, etc.)
- Trust level icons (shield variants)

**3. Modern Design**
- Designed in 2020s (feels current, not dated)
- Optimized for screens (not vector graphics converted)
- Multiple weights (regular, thin, light, bold)

**4. Tree-Shakable**
- Only import used icons
- Small bundle impact (~1KB per icon)

**Alternatives Considered and Rejected**:

| Alternative | Why Rejected |
|-------------|--------------|
| Heroicons | Fewer icons, inconsistent stroke width |
| Lucide Icons | Less comprehensive, smaller set |
| Font Awesome | Heavy bundle (all icons loaded) |
| Material Icons | Different design style (filled) |

**Implementation**:
```tsx
import { Play, ChevronRight, Download, Trash, ShieldCheck, Shield, ShieldWarning, ShieldX } from '@phosphor-icons/react';

<Play size={24} /> {/* Start button */}
<ChevronRight size={20} /> {/* Next button */}
<Download size={24} /> {/* Export PDF */}
<Trash size={20} /> {/* Remove relationship */}
<ShieldCheck size={24} color="#00B87C" /> {/* High trust */}
<Shield size={24} color="#0052CC" /> {/* Moderate trust */}
<ShieldWarning size={24} color="#FFAB00" /> {/* Low trust */}
<ShieldX size={24} color="#FF5630" /> {/* No trust */}
```

---

## 7. Typography

### Decision: Inter (Google Fonts)

**Selected**: Inter font family (Google Fonts)

**Rationale**:

**1. Professional Appearance**
- Designed for UI (screens, not print)
- Clean, modern, highly readable
- Used by many tech companies (Linear, Figma, Notion)

**2. Excellent Readability**
- Optimized for small sizes (12px, 14px)
- Clear distinction between weights
- Good letter spacing

**3. Comprehensive Set**
- 9 weights (100-900)
- Includes italic variants
- Supports Latin, Latin Extended

**4. Free CDN**
- No download needed
- No build step
- Fast CDN (Google Fonts)

**Alternatives Considered and Rejected**:

| Alternative | Why Rejected |
|-------------|--------------|
| System Fonts | Inconsistent across devices |
| Roboto | Designed for Android, less professional |
| Open Sans | Dated design (2011) |
| Lato | Not optimized for UI |

**Implementation**:
```html
<!-- In layout or _document.tsx -->
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet" />
```

```css
/* tailwind.config.js */
module.exports = {
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter', '-apple-system', 'BlinkMacSystemFont', 'Segoe UI', 'Roboto', 'sans-serif'],
      },
    }
  }
}
```

---

## 8. Forms & Validation

### Decision: React Hook Form + Zod

**Selected**: React Hook Form 7.50.0 + Zod 3.22.4

**Rationale**:

**1. React Hook Form (Form Management)**
- **Performance**: Minimal re-renders
- **Small bundle**: ~25KB gzipped
- **TypeScript**: Full type safety
- **Built-in validation**: Native HTML5 validation

**2. Zod (Schema Validation)**
- **TypeScript-first**: Type-safe schemas
- **Comprehensive**: All validation rules
- **Readable**: Schema as code
- **Error messages**: Customizable

**3. Combined Approach**
- React Hook Form manages state
- Zod validates inputs
- Type safety from schema to form

**Alternatives Considered and Rejected**:

| Alternative | Why Rejected |
|-------------|--------------|
| Formik | Heavier bundle, slower performance |
| Yup | Not TypeScript-first |
| Native validation | No type safety, inconsistent error messages |

**Implementation**:
```typescript
import { useForm } from 'react-hook-form';
import { zodResolver } from '@hookform/resolvers/zod';
import { z } from 'zod';

const relationshipSchema = z.object({
  name: z.string()
    .min(1, 'Please enter a relationship name')
    .max(50, 'Name must be 50 characters or less')
    .refine((name) => !existingNames.includes(name), 'This name is already in your list'),
});

type RelationshipFormData = z.infer<typeof relationshipSchema>;

export function RelationshipForm() {
  const { register, handleSubmit, formState: { errors } } = useForm<RelationshipFormData>({
    resolver: zodResolver(relationshipSchema),
  });

  const onSubmit = (data: RelationshipFormData) => {
    addRelationship(data.name);
  };

  return (
    <form onSubmit={handleSubmit(onSubmit)}>
      <input {...register('name')} placeholder="Enter relationship name" />
      {errors.name && <p className="error">{errors.name.message}</p>}
      <button type="submit">Add</button>
    </form>
  );
}
```

---

## 9. Build & Deployment

### Decision: Next.js Build + Vercel Deployment

**Selected**: Next.js 15.0.3 (static export) + Vercel (free tier)

**Rationale**:

**1. Next.js Build (Static Export)**
- **No server**: Client-side only (simpler deployment)
- **Fast builds**: Static generation (no SSR)
- **Small bundle**: Automatic code splitting
- **Image optimization**: Built-in image component

**2. Vercel Deployment**
- **Zero config**: Automatic builds from GitHub
- **Free tier**: Sufficient for v1.0 (no backend)
- **Edge network**: Fast global CDN
- **Automatic SSL**: HTTPS enforced
- **Preview deployments**: Test before production

**Alternatives Considered and Rejected**:

| Alternative | Why Rejected |
|-------------|--------------|
| Netlify | Less familiar, fewer Next.js optimizations |
| AWS Amplify | More complex, overkill |
| Docker | Adds complexity, not needed |
| Custom server | Not needed for client-side only |

**Implementation**:
```javascript
// next.config.js
/** @type {import('next').NextConfig} */
const nextConfig = {
  output: 'export', // Static export
  images: {
    unoptimized: true, // Static export compatibility
  },
};

module.exports = nextConfig;
```

```yaml
# vercel.json (if custom config needed)
{
  "buildCommand": "npm run build",
  "outputDirectory": "out",
  "framework": "nextjs"
}
```

---

## 10. Development Tools

### Decision: TypeScript + ESLint + Prettier

**Selected**: TypeScript 5.3.3 + ESLint 8.56.0 + Prettier 3.2.4

**Rationale**:

**1. TypeScript (Type Safety)**
- **Catch errors early**: Compile-time type checking
- **Better IDE**: Autocomplete, refactoring
- **Documentation**: Types as documentation
- **Claude edition**: Already using TypeScript

**2. ESLint (Code Quality)**
- **Consistent style**: Enforce best practices
- **Catch bugs**: Detect common errors
- **React-specific**: React hooks rules
- **Accessibility**: Accessibility linting

**3. Prettier (Code Formatting)**
- **Consistent formatting**: Automatic formatting
- **No debates**: No style arguments
- **Fast**: Format on save

**Alternatives Considered and Rejected**:

| Alternative | Why Rejected |
|-------------|--------------|
| Flow (type checking) | Less popular, smaller ecosystem |
| Standard.js | Less flexible, no TypeScript |
| None (no linting) | Inconsistent code, more bugs |

**Configuration**:
```json
{
  "scripts": {
    "dev": "next dev",
    "build": "next build",
    "start": "next start",
    "lint": "next lint",
    "format": "prettier --write \"**/*.{ts,tsx,js,jsx,json,md}\"",
    "type-check": "tsc --noEmit"
  }
}
```

---

## 11. Full Tech Stack Summary

| Category | Technology | Version | Rationale |
|----------|-----------|---------|-----------|
| Frontend Framework | React + Next.js | 19.0.0 + 15.0.3 | Existing foundation, proven, performant |
| UI Components | Radix UI | 1.0.0 | Accessibility-first, unstyled |
| Styling | Tailwind CSS | 3.4.1 | Utility-first, consistent design |
| PDF Export | jsPDF + html2canvas | 2.5.1 + 1.4.1 | Client-side, mature, widely used |
| State Management | React Context | Built-in | Sufficient for simple state |
| Forms | React Hook Form | 7.50.0 | Performance, type safety |
| Validation | Zod | 3.22.4 | TypeScript-first, comprehensive |
| Icons | Phosphor Icons | 2.0.2 | Professional, comprehensive |
| Typography | Inter (Google Fonts) | Latest | Professional, readable |
| Build Tool | Next.js Build | 15.0.3 | Static export, fast builds |
| Deployment | Vercel | Latest | Zero config, free tier |
| Type Checking | TypeScript | 5.3.3 | Type safety, better IDE |
| Linting | ESLint + Prettier | 8.56.0 + 3.2.4 | Consistent code, quality |

---

## 12. Dependencies Summary

### Production Dependencies

```json
{
  "dependencies": {
    "next": "15.0.3",
    "react": "19.0.0",
    "react-dom": "19.0.0",
    "@radix-ui/react-dialog": "^1.0.0",
    "@radix-ui/react-dropdown-menu": "^2.0.0",
    "@radix-ui/react-slot": "^1.0.0",
    "@radix-ui/react-tooltip": "^1.0.0",
    "@phosphor-icons/react": "^2.0.2",
    "react-hook-form": "^7.50.0",
    "zod": "^3.22.4",
    "@hookform/resolvers": "^3.3.4",
    "jspdf": "^2.5.1",
    "html2canvas": "^1.4.1",
    "clsx": "^2.1.0",
    "tailwind-merge": "^2.2.1"
  }
}
```

**Total gzipped size**: ~150KB (excluding React/Next.js)

### Development Dependencies

```json
{
  "devDependencies": {
    "typescript": "^5.3.3",
    "@types/react": "^18.2.48",
    "@types/react-dom": "^18.2.18",
    "eslint": "^8.56.0",
    "eslint-config-next": "15.0.3",
    "prettier": "^3.2.4",
    "tailwindcss": "^3.4.1",
    "autoprefixer": "^10.4.17",
    "postcss": "^8.4.35"
  }
}
```

---

## 13. Technical Constraints

### What We're NOT Using

**Backend/Database**:
- ❌ No Node.js server
- ❌ No database (PostgreSQL, MongoDB, etc.)
- ❌ No API endpoints
- ❌ No authentication (NextAuth, Auth0, etc.)

**Reason**: Client-side only, session-only workflow, no persistence required

**Complex State Management**:
- ❌ No Redux
- ❌ No Zustand
- ❌ No Recoil

**Reason**: React Context + useState is sufficient for 25 items

**Analytics/Tracking**:
- ❌ No Google Analytics
- ❌ No Mixpanel
- ❌ No Sentry

**Reason**: Privacy-first, no user data collection

**Complex Build Tools**:
- ❌ No Webpack config (using Next.js default)
- ❌ No Babel config (using Next.js default)

**Reason**: Zero config deployment, faster builds

---

**Tech Stack Decision Status**: Complete
**Dependencies**: NFR Spec, PRD, Strategic Brief
**Next Steps**: Create Architecture Diagram artifact
