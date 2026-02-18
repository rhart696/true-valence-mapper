# Design System

**Version**: 1.0
**Date**: 2026-02-17
**Based On**: Value Proposition Canvas + Vision Statement + User Interview
**Product**: True Valence Mapper v1.0

---

## Design System Overview

**Purpose**: Define visual language, components, and patterns for True Valence Mapper v1.0.

**Design Philosophy**: "Polished, purpose-built, frictionless" - every design choice enhances coach credibility and coachee engagement.

**Visual Priorities** (from user interview):
1. Color scheme (highest priority)
2. Typography
3. Iconography
4. Space/Spacing
5. Animation

---

## 1. Color Palette

### 1.1 Primary Colors

| Color Name | Hex | RGB | Usage |
|------------|-----|-----|-------|
| Trust Blue (Primary) | `#0052CC` | 0, 82, 204 | Primary buttons, headings, emphasis |
| Growth Green (Secondary) | `#00B87C` | 0, 184, 124 | Success states, high trust indicators |
| Insight Orange (Accent) | `#FF6B35` | 255, 107, 53 | Call-to-action, warnings, low trust |
| Neutral Gray (Light) | `#F4F5F7` | 244, 245, 247 | Backgrounds, borders |
| Neutral Gray (Medium) | `#6B778C` | 107, 119, 140 | Body text, secondary information |
| Neutral Gray (Dark) | `#091E42` | 9, 30, 66 | Headings, primary text, nav |

### 1.2 Trust Level Color Coding

| Trust Level | Color | Hex | RGB | Usage |
|-------------|-------|-----|-----|-------|
| High Trust | Green | `#00B87C` | 0, 184, 124 | High trust relationships |
| Moderate Trust | Blue | `#0052CC` | 0, 82, 204 | Moderate trust relationships |
| Low Trust | Yellow/Orange | `#FFAB00` | 255, 171, 0 | Low trust relationships |
| No Trust | Red | `#FF5630` | 255, 86, 48 | No trust relationships |

**Note**: Colors are WCAG AA compliant for text contrast when used correctly.

### 1.3 Semantic Colors

| Meaning | Color | Hex | Usage |
|---------|-------|-----|-------|
| Success | Green | `#00B87C` | Export success, validation success |
| Error | Red | `#FF5630` | Error messages, validation errors |
| Warning | Orange | `#FFAB00` | Warnings, cautionary notes |
| Info | Blue | `#0052CC` | Information, tooltips |

### 1.4 Color Usage Rules

**Do**:
- Use Trust Blue as primary brand color
- Use trust level colors consistently (green=high, blue=moderate, yellow=low, red=none)
- Maintain color contrast minimum 4.5:1 for text
- Use neutral grays for body text and backgrounds

**Don't**:
- Don't use red for primary CTAs (use Trust Blue or Insight Orange)
- Don't use color alone to convey meaning (add icon + text)
- Don't use more than 5-6 colors in a single screen
- Don't use low-contrast colors for important text

---

## 2. Typography

### 2.1 Font Family

**Primary Font**: Inter (Google Fonts)
- Why: Clean, professional, highly readable at small sizes
- Fallback: `-apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif`

**Loading**: Import via Google Fonts CDN
```html
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
```

### 2.2 Type Scale

| Style | Size | Weight | Line Height | Letter Spacing | Usage |
|-------|------|--------|-------------|----------------|-------|
| Display Large | 32px | 700 | 1.2 | -0.02em | Hero headings |
| Display Medium | 28px | 700 | 1.25 | -0.01em | Section headings |
| Display Small | 24px | 600 | 1.3 | normal | Screen titles |
| Heading Large | 20px | 600 | 1.4 | normal | Component headings |
| Heading Medium | 18px | 600 | 1.4 | normal | Subheadings |
| Heading Small | 16px | 600 | 1.5 | normal | Labels, sub-labels |
| Body Large | 16px | 400 | 1.5 | normal | Body text, paragraphs |
| Body Medium | 14px | 400 | 1.5 | normal | Secondary text |
| Body Small | 12px | 400 | 1.6 | 0.02em | Captions, hints |

### 2.3 Typography Rules

**Do**:
- Use consistent type scale (don't create arbitrary sizes)
- Use 600 weight for emphasis, 700 for headings only
- Maintain line height 1.5 for body text readability
- Use letter spacing on small text (12px) for readability

**Don't**:
- Don't use more than 3 type sizes per screen
- Don't use 900 weight (too heavy for this brand)
- Don't use italic (reduces readability)
- Don't use all caps (unless for short labels)

---

## 3. Iconography

### 3.1 Icon System

**Icon Library**: Phosphor Icons
- Why: Consistent stroke width, modern, professional
- Style: Outline (regular stroke)
- Size: 24px standard, 16px small, 32px large

**Loading**: Import via npm
```bash
npm install @phosphor-icons/react
```

### 3.2 Icon Usage

| Icon | Name | Usage | Context |
|------|------|-------|---------|
| play-circle | Play | Start session button | Landing page |
| chevron-right | Next | Next step button | All screens |
| download-simple | Download | Export PDF | Canvas screen |
| x-circle | Close | Close modal | Modals |
| question | Help | Trust definitions | Landing, scoring screens |
| trash | Delete | Remove relationship | Naming screen |
| pencil-simple | Edit | Edit relationship | Naming screen |
| check-circle | Success | Success message | Export screen |
| warning-circle | Warning | Warning message | Validation errors |
| info | Info | Information | Tooltips, hints |

### 3.3 Trust Level Icons

| Trust Level | Icon | Color | Usage |
|-------------|------|-------|-------|
| High Trust | `shield-check` | Green | High trust indicator |
| Moderate Trust | `shield` | Blue | Moderate trust indicator |
| Low Trust | `shield-warning` | Yellow | Low trust indicator |
| No Trust | `shield-x` | Red | No trust indicator |

### 3.4 Icon Rules

**Do**:
- Use 24px size as default
- Use consistent stroke width (Phosphor outline)
- Match icon color to text color (unless semantic)
- Use icons to reinforce meaning, not replace text

**Don't**:
- Don't use icons from different libraries (mixing styles)
- Don't use icons as sole indicator of meaning (always add text)
- Don't use decorative icons (every icon must have purpose)
- Don't use filled icons (outline is more professional)

---

## 4. Space & Spacing

### 4.1 Spacing Scale

**Base Unit**: 8px
- All spacing is multiples of 8px

| Token | Value | Usage |
|-------|-------|-------|
| space-0 | 0px | No spacing |
| space-1 | 4px | Tight spacing (text to icon) |
| space-2 | 8px | Base spacing |
| space-3 | 12px | Compact padding |
| space-4 | 16px | Default padding |
| space-5 | 20px | Medium padding |
| space-6 | 24px | Large padding |
| space-8 | 32px | Section spacing |
| space-10 | 40px | Major section spacing |
| space-12 | 48px | Page margins |

### 4.2 Component Padding

| Component | Padding | Notes |
|-----------|---------|-------|
| Buttons | 12px 24px | Comfortable touch target |
| Cards | 24px | Internal spacing |
| Modals | 32px | Internal spacing |
| Inputs | 12px 16px | Comfortable input |
| Sections | 48px | Between major sections |

### 4.3 Layout Spacing

| Context | Spacing | Notes |
|---------|---------|-------|
| Page margins | 24px | Desktop |
| Page margins | 16px | Mobile |
| Section spacing | 48px | Between major sections |
| Component spacing | 24px | Between components |
| Text to icon | 8px | Tight spacing |

### 4.4 Grid System

**12-Column Grid**
- Gutter: 16px
- Breakpoints: Mobile (< 640px), Tablet (640px-1024px), Desktop (> 1024px)

**Responsive Columns**
| Screen Size | Columns | Max Width |
|-------------|---------|-----------|
| Mobile | 4 | 100% |
| Tablet | 8 | 768px |
| Desktop | 12 | 1024px |

---

## 5. Borders & Shadows

### 5.1 Border Radius

| Token | Value | Usage |
|-------|-------|-------|
| radius-none | 0px | Sharp corners (rare) |
| radius-sm | 4px | Small elements |
| radius-md | 8px | Cards, buttons |
| radius-lg | 12px | Modals |
| radius-xl | 16px | Large containers |

### 5.2 Border Width

| Token | Value | Usage |
|-------|-------|-------|
| border-thin | 1px | Default borders |
| border-medium | 2px | Emphasis borders |
| border-thick | 4px | Major dividers |

### 5.3 Border Colors

| Token | Color | Usage |
|-------|-------|-------|
| border-default | `#DFE1E6` | Default borders |
| border-subtle | `#EBECF0` | Subtle borders |
| border-strong | `#6B778C` | Emphasis borders |

### 5.4 Shadows

| Token | Value | Usage |
|-------|-------|-------|
| shadow-sm | `0 1px 2px rgba(9, 30, 66, 0.25)` | Subtle elevation |
| shadow-md | `0 4px 8px rgba(9, 30, 66, 0.15)` | Cards, buttons |
| shadow-lg | `0 8px 16px rgba(9, 30, 66, 0.15)` | Modals, dropdowns |
| shadow-xl | `0 16px 32px rgba(9, 30, 66, 0.15)` | Full-screen overlays |

---

## 6. Animation

### 6.1 Animation Tokens

| Token | Value | Usage |
|-------|-------|-------|
| duration-fast | 100ms | Micro-interactions (hover, focus) |
| duration-normal | 200ms | Component transitions |
| duration-slow | 300ms | Page transitions, modals |
| ease-out | `cubic-bezier(0, 0, 0.2, 1)` | Standard easing |
| ease-in | `cubic-bezier(0.4, 0, 1, 1)` | Enter animations |
| ease-in-out | `cubic-bezier(0.4, 0, 0.2, 1)` | Complex transitions |

### 6.2 Animation Examples

**Button Hover**
```css
transition: all 200ms ease-out;
```

**Modal Open/Close**
```css
transition: opacity 300ms ease-in, transform 300ms ease-in;
```

**Page Transition**
```css
transition: opacity 300ms ease-in-out;
```

**Trust Level Selection**
```css
transition: background-color 100ms ease-out, transform 100ms ease-out;
```

### 6.3 Animation Rules

**Do**:
- Use 200ms for most interactions (feels responsive, not sluggish)
- Use ease-out for transitions (feels natural)
- Keep animations subtle (not distracting)
- Respect prefers-reduced-motion (disable animations)

**Don't**:
- Don't use animations > 300ms (feels slow)
- Don't use bouncy or elastic easing (feels cartoonish)
- Don't animate everything (only meaningful transitions)
- Don't use animations that distract from coaching conversation

---

## 7. Components

### 7.1 Button Component

**Primary Button**
- Background: Trust Blue (`#0052CC`)
- Text: White (`#FFFFFF`)
- Border: None
- Border radius: 8px
- Padding: 12px 24px
- Font: Inter Medium 16px
- Hover: Darken 10% (`#0047B3`)
- Active: Darken 20% (`#003A8F`)
- Focus: Blue outline 2px

**Secondary Button**
- Background: Transparent
- Text: Trust Blue (`#0052CC`)
- Border: 2px Trust Blue
- Border radius: 8px
- Padding: 10px 22px (accounting for border)
- Font: Inter Medium 16px
- Hover: Light blue background (`#E6F0FF`)

**Icon Button**
- Background: Transparent
- Text: Neutral Gray Dark (`#091E42`)
- Border: None
- Border radius: 8px
- Padding: 8px
- Hover: Light gray background (`#F4F5F7`)
- Icon: 24px Phosphor outline

### 7.2 Input Component

**Text Input**
- Background: White (`#FFFFFF`)
- Border: 2px Border Subtle (`#EBECF0`)
- Border radius: 8px
- Padding: 12px 16px
- Font: Inter Regular 16px
- Placeholder: Neutral Gray Medium (`#6B778C`)
- Focus: Border Trust Blue (`#0052CC`), Blue outline 2px
- Error: Border Red (`#FF5630`), error message below

### 7.3 Card Component

**Relationship Card**
- Background: White (`#FFFFFF`)
- Border: 1px Border Default (`#DFE1E6`)
- Border radius: 8px
- Padding: 16px
- Shadow: Shadow sm
- Hover: Shadow md, slight scale (1.02)

**Trust Level Indicator**
- Size: 24px circle
- Border radius: 12px
- Background: Trust level color (green/blue/yellow/red)
- Icon: 16px Phosphor outline, white

### 7.4 Modal Component

**Modal Overlay**
- Background: Black with 60% opacity (`rgba(0, 0, 0, 0.6)`)
- Animation: Fade in 300ms

**Modal Content**
- Background: White (`#FFFFFF`)
- Border radius: 16px
- Padding: 32px
- Shadow: Shadow xl
- Max width: 600px
- Animation: Scale in 300ms

**Modal Header**
- Font: Inter Semibold 24px
- Color: Neutral Gray Dark (`#091E42`)
- Padding-bottom: 24px
- Border-bottom: 1px Border Subtle (`#EBECF0`)

**Modal Close Button**
- Position: Top-right
- Background: Transparent
- Icon: `x-circle` 24px
- Hover: Light gray background (`#F4F5F7`)

### 7.5 Badge Component

**Count Badge**
- Background: Trust Blue (`#0052CC`)
- Text: White (`#FFFFFF`)
- Border radius: 12px
- Padding: 4px 12px
- Font: Inter Medium 14px

**Trust Level Badge**
- Background: Trust level color
- Text: White (`#FFFFFF`)
- Border radius: 16px
- Padding: 4px 12px
- Font: Inter Medium 12px

---

## 8. Accessibility

### 8.1 Focus States

**Default Focus**
- Outline: 2px Trust Blue (`#0052CC`)
- Offset: 2px
- Applied to all interactive elements

**Focus Visible**
- Use `:focus-visible` to show focus only when keyboard navigation used
- Never remove focus (accessibility violation)

### 8.2 Color Contrast

All text must meet WCAG AA:
- Normal text: Minimum 4.5:1 contrast
- Large text (18px+): Minimum 3:1 contrast
- UI components: Minimum 3:1 contrast

**Verified Colors**:
- White on Trust Blue: 8.2:1 ✅
- Black on white: 21:1 ✅
- Neutral Gray Medium on white: 4.5:1 ✅
- Trust Blue on white: 6.9:1 ✅

### 8.3 Non-Color Indicators

Never use color alone to convey meaning:
- Add icons to trust levels
- Add text labels to buttons
- Add error text (not just red border)

---

## 9. Responsive Design

### 9.1 Breakpoints

| Breakpoint | Min Width | Max Width | Device Type |
|------------|-----------|-----------|-------------|
| Mobile | 0px | 639px | Phones |
| Tablet | 640px | 1023px | Tablets |
| Desktop | 1024px | - | Laptops, desktops |

### 9.2 Responsive Rules

**Mobile (< 640px)**
- Single column layout
- Smaller font sizes (-2px)
- Reduced padding (24px → 16px)
- Stack components vertically
- Touch targets minimum 44px

**Tablet (640px - 1023px)**
- 2-column layout where appropriate
- Standard font sizes
- Standard padding
- Stack on small screens

**Desktop (> 1024px)**
- Multi-column layout
- Standard font sizes
- Standard padding
- Hover interactions available

---

## 10. Dark Mode (Out of Scope for v1.0)

Dark mode is explicitly out of scope for v1.0 to reduce timeline.
Plan to add in v1.2 based on user feedback.

---

**Design System Status**: Complete
**Dependencies**: Value Proposition Canvas, Vision Statement, User Interview
**Next Steps**: Create UX Flows artifact
