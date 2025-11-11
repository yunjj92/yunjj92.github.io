# TreeKangaroo's Blog - Style Guide

A comprehensive guide to the design system, component patterns, and visual language of the blog.

## Table of Contents

1. [Design Principles](#design-principles)
2. [Color Palette](#color-palette)
3. [Typography](#typography)
4. [Spacing & Layout](#spacing--layout)
5. [Components](#components)
6. [Animations](#animations)
7. [Accessibility](#accessibility)
8. [Code Conventions](#code-conventions)

---

## Design Principles

### Core Values

1. **Clarity Over Cleverness**
   - Clean, readable layouts
   - Intuitive navigation
   - Clear visual hierarchy

2. **Performance First**
   - Optimized assets
   - Lazy loading
   - Efficient animations

3. **Accessibility Always**
   - WCAG 2.1 AA compliant
   - Keyboard navigation
   - Screen reader support

4. **Mobile-First Responsive**
   - Design for small screens first
   - Progressive enhancement
   - Touch-friendly interfaces

---

## Color Palette

### Primary Colors

The site uses a blue-indigo-purple gradient scheme for primary actions and accents.

#### Blue Scale
```css
/* Tailwind Classes */
bg-blue-50      /* #EFF6FF - Light backgrounds */
bg-blue-100     /* #DBEAFE - Badges, highlights */
bg-blue-200     /* #BFDBFE - Borders, dividers */
bg-blue-600     /* #2563EB - Primary actions */
bg-blue-700     /* #1D4ED8 - Hover states */

text-blue-600   /* Primary text */
text-blue-700   /* Badge text */
border-blue-200 /* Light borders */
border-blue-300 /* Hover borders */
border-blue-400 /* Active borders */
```

#### Indigo Scale
```css
bg-indigo-50    /* #EEF2FF - Gradient backgrounds */
bg-indigo-100   /* #E0E7FF - Feature cards */
bg-indigo-600   /* #4F46E5 - Gradient endpoints */
```

#### Purple Scale
```css
bg-purple-50    /* #FAF5FF - Accent backgrounds */
bg-purple-100   /* #F3E8FF - Feature highlights */
bg-purple-600   /* #9333EA - Accent elements */
```

### Neutral Colors

#### Gray Scale
```css
bg-gray-50      /* #F9FAFB - Page backgrounds */
bg-gray-100     /* #F3F4F6 - Card backgrounds */
bg-gray-200     /* #E5E7EB - Borders */
bg-gray-300     /* #D1D5DB - Dividers */
bg-gray-600     /* #4B5563 - Secondary text */
bg-gray-700     /* #374151 - Body text */
bg-gray-900     /* #111827 - Headings */

text-gray-500   /* Meta information */
text-gray-600   /* Descriptions, body */
text-gray-700   /* Primary text */
text-gray-900   /* Headings */
```

### Semantic Colors

```css
/* Success */
bg-green-500    /* #10B981 - Available status */
text-green-700  /* Success messages */

/* Warning */
bg-yellow-500   /* #F59E0B - Warnings */
text-yellow-700 /* Warning text */

/* Error */
bg-red-500      /* #EF4444 - Errors */
text-red-700    /* Error text */

/* Info */
bg-blue-600     /* #2563EB - Information */
text-blue-700   /* Info text */
```

### Gradient Combinations

```html
<!-- Primary gradient (buttons, CTAs) -->
<div class="bg-gradient-to-r from-blue-600 to-indigo-600">

<!-- Hero background -->
<div class="bg-gradient-to-br from-blue-50 via-indigo-50 to-purple-50">

<!-- Category cards -->
<div class="bg-gradient-to-br from-blue-100 via-indigo-100 to-purple-100">

<!-- Text gradient -->
<span class="bg-gradient-to-r from-blue-600 via-indigo-600 to-purple-600 bg-clip-text text-transparent">
```

### Color Usage Guidelines

**Do**:
- Use blue for primary actions and links
- Use gray for text hierarchy (900 → 700 → 600 → 500)
- Use gradients sparingly for emphasis
- Maintain consistent color meaning (green = success, red = error)

**Don't**:
- Mix too many accent colors in one section
- Use bright colors for large background areas
- Forget to check contrast ratios (WCAG AA minimum 4.5:1)

---

## Typography

### Font Family

```css
/* System font stack (Tailwind default) */
font-family: ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont,
             "Segoe UI", Roboto, "Helvetica Neue", Arial, "Noto Sans",
             sans-serif, "Apple Color Emoji", "Segoe UI Emoji";
```

### Type Scale

#### Headings

```html
<!-- H1 - Hero titles -->
<h1 class="text-4xl sm:text-5xl lg:text-6xl font-bold">
  Main Hero Title
</h1>

<!-- H2 - Section headers -->
<h2 class="text-3xl sm:text-4xl font-bold">
  Section Header
</h2>

<!-- H3 - Card titles, subsections -->
<h3 class="text-xl sm:text-2xl font-bold">
  Card Title
</h3>

<!-- H4 - Small card titles -->
<h4 class="text-lg font-semibold">
  Small Title
</h4>
```

#### Body Text

```html
<!-- Large body (introductions) -->
<p class="text-lg text-gray-600">
  Introduction paragraph
</p>

<!-- Regular body -->
<p class="text-base text-gray-700">
  Standard paragraph text
</p>

<!-- Small text (meta, captions) -->
<p class="text-sm text-gray-500">
  Meta information
</p>

<!-- Extra small (tags, labels) -->
<span class="text-xs text-gray-600">
  Label text
</span>
```

### Font Weights

```css
font-normal     /* 400 - Body text */
font-medium     /* 500 - Emphasized text, labels */
font-semibold   /* 600 - Subheadings, buttons */
font-bold       /* 700 - Headings, strong emphasis */
```

### Line Heights

```css
leading-tight    /* 1.25 - Headings */
leading-normal   /* 1.5 - Body text (default) */
leading-relaxed  /* 1.625 - Long-form content */
```

### Text Utilities

```html
<!-- Truncation -->
<p class="line-clamp-2">...</p>  <!-- 2 lines max -->
<p class="line-clamp-3">...</p>  <!-- 3 lines max -->
<p class="truncate">...</p>       <!-- Single line -->

<!-- Text alignment -->
<p class="text-left sm:text-center">
<p class="text-center">

<!-- Letter spacing -->
<span class="tracking-wide uppercase">Label</span>
```

### Typography Guidelines

**Do**:
- Use consistent heading hierarchy (H1 → H2 → H3)
- Maintain readability with proper line height
- Use font weights to create visual hierarchy
- Keep line length optimal (45-75 characters)

**Don't**:
- Use more than 2-3 font weights in one component
- Set line-height below 1.2 for body text
- Use ALL CAPS for long passages
- Mix multiple text sizes in close proximity

---

## Spacing & Layout

### Spacing Scale

The site uses Tailwind's 4px-based spacing scale:

```css
/* Padding/Margin values */
p-0     /* 0px */
p-1     /* 4px */
p-2     /* 8px */
p-3     /* 12px */
p-4     /* 16px */
p-6     /* 24px */
p-8     /* 32px */
p-10    /* 40px */
p-12    /* 48px */
p-16    /* 64px */
p-20    /* 80px */
p-24    /* 96px */
```

### Section Spacing

```html
<!-- Standard section padding -->
<section class="py-16 sm:py-20 lg:py-24">

<!-- Hero section (larger) -->
<section class="py-20 sm:py-28 lg:py-32">

<!-- Compact section -->
<section class="py-12 sm:py-16">
```

### Container Widths

```html
<!-- Full-width container with max-width -->
<div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">

<!-- Narrow container (content) -->
<div class="max-w-4xl mx-auto px-4">

<!-- Extra narrow (forms, single column) -->
<div class="max-w-2xl mx-auto px-4">
```

### Grid Gaps

```html
<!-- Standard card grid -->
<div class="grid gap-8">         /* 32px gap */

<!-- Compact grid -->
<div class="grid gap-6">         /* 24px gap */

<!-- Tight grid -->
<div class="grid gap-4">         /* 16px gap */

<!-- Loose grid -->
<div class="grid gap-10 lg:gap-12">  /* 40-48px gap */
```

### Component Spacing

```html
<!-- Card padding -->
<div class="p-6">                /* Standard: 24px */
<div class="p-8">                /* Large: 32px */

<!-- Button padding -->
<button class="px-6 py-3">      /* Standard button */
<button class="px-8 py-4">      /* Large CTA */

<!-- Badge padding -->
<span class="px-2.5 py-0.5">    /* Compact badge */
<span class="px-4 py-2">        /* Standard badge */
```

### Responsive Spacing Patterns

```html
<!-- Progressive spacing increase -->
<div class="py-12 sm:py-16 lg:py-20">
<div class="gap-4 sm:gap-6 lg:gap-8">
<div class="mb-4 sm:mb-6 lg:mb-8">

<!-- Responsive container padding -->
<div class="px-4 sm:px-6 lg:px-8">
```

---

## Components

### Buttons

#### Primary Button
```html
<a href="#"
   class="inline-flex items-center px-8 py-4 text-lg font-semibold
          text-white bg-gradient-to-r from-blue-600 to-indigo-600
          rounded-lg shadow-lg btn-hover-lift">
  <span>Button Text</span>
  <svg class="ml-2 w-5 h-5"><!-- Icon --></svg>
</a>
```

#### Secondary Button
```html
<a href="#"
   class="inline-flex items-center px-8 py-4 text-lg font-semibold
          text-gray-700 bg-white border-2 border-gray-300
          rounded-lg shadow-md hover:border-blue-400 btn-hover-lift">
  <span>Button Text</span>
</a>
```

#### Icon Button
```html
<button class="flex items-center justify-center w-12 h-12
               bg-white rounded-lg shadow-md hover:shadow-xl
               btn-hover-lift"
        aria-label="Descriptive label">
  <svg class="w-6 h-6"><!-- Icon --></svg>
</button>
```

### Cards

#### Post Card
```html
<article class="group bg-white rounded-xl shadow-md hover:shadow-xl
                overflow-hidden border border-gray-100 hover:border-blue-200
                card-hover-scale">
  <!-- Image -->
  <a href="#" class="block relative overflow-hidden aspect-video">
    <img src="..." class="w-full h-full object-cover
                         group-hover:scale-110 transition-transform duration-500">
  </a>

  <!-- Content -->
  <div class="p-6">
    <!-- Meta info -->
    <div class="flex items-center gap-4 text-sm text-gray-500 mb-3">
      <!-- Date, reading time, etc. -->
    </div>

    <!-- Title -->
    <h3 class="text-xl font-bold text-gray-900 mb-3
               group-hover:text-blue-600 transition-colors line-clamp-2">
      <a href="#" class="hover:underline">Card Title</a>
    </h3>

    <!-- Excerpt -->
    <p class="text-gray-600 mb-4 line-clamp-3">
      Card description text...
    </p>

    <!-- Action -->
    <a href="#" class="inline-flex items-center text-blue-600 font-semibold">
      <span>Read More</span>
      <svg class="ml-1 w-4 h-4"><!-- Arrow icon --></svg>
    </a>
  </div>
</article>
```

#### Category Card
```html
<a href="#"
   class="group block bg-white rounded-xl shadow-md hover:shadow-xl
          overflow-hidden border border-gray-100 hover:border-blue-300
          card-hover-scale">
  <!-- Icon area -->
  <div class="h-32 bg-gradient-to-br from-blue-100 via-indigo-100 to-purple-100
              flex items-center justify-center">
    <svg class="w-16 h-16 text-blue-600
                group-hover:scale-110 transition-transform duration-300">
      <!-- Icon -->
    </svg>
  </div>

  <!-- Info -->
  <div class="p-6">
    <h3 class="text-xl font-bold text-gray-900 mb-2
               group-hover:text-blue-600 transition-colors">
      Category Name
    </h3>
    <p class="text-sm text-gray-600">5 articles</p>
  </div>
</a>
```

### Badges

#### Category Badge
```html
<span class="inline-flex items-center px-2.5 py-0.5 rounded-full
             text-xs font-medium bg-blue-50 text-blue-700
             border border-blue-200 hover:bg-blue-100 transition-colors">
  Category Name
</span>
```

#### Status Badge
```html
<span class="inline-flex items-center px-4 py-1.5 rounded-full
             bg-green-500 text-white text-sm font-semibold
             shadow-lg pulse-ring">
  <span class="w-2 h-2 bg-white rounded-full animate-pulse mr-2"></span>
  Available
</span>
```

#### Skill Badge
```html
<span class="px-4 py-2 bg-white text-blue-700 text-sm font-semibold
             rounded-lg shadow-sm border border-blue-200
             hover:border-blue-400 hover:shadow-md transition-all">
  React & TypeScript
</span>
```

### Forms (Future Use)

```html
<!-- Input field -->
<input type="text"
       class="w-full px-4 py-3 border border-gray-300 rounded-lg
              focus:ring-2 focus:ring-blue-500 focus:border-blue-500
              transition-colors"
       placeholder="Enter text">

<!-- Textarea -->
<textarea
  class="w-full px-4 py-3 border border-gray-300 rounded-lg
         focus:ring-2 focus:ring-blue-500 focus:border-blue-500
         transition-colors"
  rows="4"></textarea>
```

### Icons

**Source**: Heroicons (inline SVG)

```html
<!-- Icon sizing -->
<svg class="w-4 h-4">  <!-- Small (16px) -->
<svg class="w-5 h-5">  <!-- Medium (20px) -->
<svg class="w-6 h-6">  <!-- Large (24px) -->
<svg class="w-10 h-10"> <!-- XL (40px) -->
<svg class="w-16 h-16"> <!-- 2XL (64px) -->

<!-- Icon colors -->
<svg class="text-blue-600">
<svg class="text-gray-500">
<svg class="text-current">  <!-- Inherits parent color -->
```

---

## Animations

### Animation Classes

Defined in `assets/css/homepage-animations.css`

#### Scroll Reveal
```html
<!-- Fade in from below on scroll -->
<section class="scroll-reveal">
  Content reveals as user scrolls
</section>

<!-- Staggered children animation -->
<div class="stagger-children">
  <div>Item 1</div>  <!-- Delay: 0.1s -->
  <div>Item 2</div>  <!-- Delay: 0.2s -->
  <div>Item 3</div>  <!-- Delay: 0.3s -->
</div>
```

#### Hover Effects
```html
<!-- Button lift -->
<button class="btn-hover-lift">
  Elevates -2px on hover
</button>

<!-- Card scale -->
<div class="card-hover-scale">
  Scales to 1.02 and lifts on hover
</div>

<!-- Icon bounce -->
<svg class="icon-bounce">
  Gentle bounce on hover
</svg>
```

#### Hero Animations
```html
<!-- Floating blob -->
<div class="animate-blob animation-delay-2000">
  Organic floating motion
</div>

<!-- Gradient shift -->
<span class="gradient-animate">
  Animated gradient text
</span>

<!-- Pulse ring -->
<div class="pulse-ring">
  Pulsing ring animation
</div>
```

### Animation Timing

```css
/* Transition durations */
duration-200    /* 200ms - Quick interactions */
duration-300    /* 300ms - Standard transitions */
duration-500    /* 500ms - Image zooms */
duration-1000   /* 1000ms - Slow reveals */

/* Easing functions */
ease-in         /* Accelerating */
ease-out        /* Decelerating */
ease-in-out     /* Both */
cubic-bezier(0.4, 0, 0.2, 1)  /* Custom easing */
```

### Performance Guidelines

**Do**:
- Use `transform` and `opacity` for animations (GPU accelerated)
- Implement `will-change` sparingly
- Unobserve Intersection Observer elements after reveal
- Respect `prefers-reduced-motion` setting

**Don't**:
- Animate `width`, `height`, or `position` properties
- Create animations longer than 1 second (except looping backgrounds)
- Forget to add transition classes to interactive elements

---

## Accessibility

### Semantic HTML

```html
<!-- Page structure -->
<header>Site header</header>
<nav>Navigation</nav>
<main>Main content</main>
<article>Blog post</article>
<section>Page section</section>
<aside>Sidebar</aside>
<footer>Site footer</footer>
```

### ARIA Labels

```html
<!-- Button labels -->
<button aria-label="Toggle navigation menu" aria-expanded="false">

<!-- Navigation -->
<nav role="navigation" aria-label="Main navigation">

<!-- Current page -->
<a href="/about" aria-current="page">About</a>

<!-- Hidden text for screen readers -->
<span class="sr-only">Open main menu</span>

<!-- Decorative images -->
<div aria-hidden="true">Decorative element</div>
```

### Focus States

```css
/* Default focus ring */
focus:outline-none focus:ring-2 focus:ring-blue-500 focus:ring-offset-2

/* Button focus */
focus:outline-none focus:ring-2 focus:ring-inset focus:ring-blue-500

/* Link focus */
focus:underline focus:outline-none
```

### Color Contrast

**Minimum Ratios** (WCAG 2.1 AA):
- Normal text: 4.5:1
- Large text (18pt+): 3:1
- UI components: 3:1

**Verified Combinations**:
- `text-gray-900` on `bg-white`: 17.4:1 ✅
- `text-gray-700` on `bg-white`: 10.6:1 ✅
- `text-blue-600` on `bg-white`: 7.4:1 ✅
- `text-white` on `bg-blue-600`: 7.4:1 ✅

### Keyboard Navigation

```javascript
// ESC key to close modals
document.addEventListener('keydown', (e) => {
  if (e.key === 'Escape') {
    closeModal();
  }
});

// Tab trapping in modals
// Focus management for dynamic content
```

---

## Code Conventions

### HTML/Liquid

```html
<!-- Use semantic elements -->
<article> over <div>

<!-- Responsive images -->
<img src="..."
     alt="Descriptive text"
     loading="lazy"
     decoding="async"
     class="w-full">

<!-- External links -->
<a href="..."
   target="_blank"
   rel="noopener noreferrer">

<!-- Conditional Liquid logic -->
{% if post.image %}
  <img src="{{ post.image }}" alt="{{ post.title }}">
{% else %}
  <!-- Fallback -->
{% endif %}
```

### CSS/Tailwind

```html
<!-- Order of classes -->
<!-- 1. Layout (flex, grid, position) -->
<!-- 2. Spacing (p-, m-, gap-) -->
<!-- 3. Sizing (w-, h-, max-w-) -->
<!-- 4. Typography (text-, font-) -->
<!-- 5. Colors (bg-, text-, border-) -->
<!-- 6. Borders & shadows (rounded-, shadow-) -->
<!-- 7. States (hover:, focus:, group-hover:) -->
<!-- 8. Transitions (transition-, duration-) -->

<div class="flex items-center gap-4 px-6 py-3 w-full
            text-lg font-semibold text-white bg-blue-600
            rounded-lg shadow-lg hover:bg-blue-700
            transition-colors duration-200">
```

### JavaScript

```javascript
// Use modern ES6+ syntax
// Check for element existence
const element = document.getElementById('mobile-menu');
if (element) {
  // Operate on element
}

// Prefer const over let
const config = { ... };

// Use descriptive variable names
const mobileMenuButton = document.getElementById('mobile-menu-button');
```

### Naming Conventions

```
Files:
- Layouts: kebab-case (home-main.html)
- Includes: kebab-case (navigation.html)
- CSS: kebab-case (homepage-animations.css)
- Posts: YYYY-MM-DD-title.md

CSS Classes:
- Utility: Tailwind classes
- Custom: kebab-case (btn-hover-lift, card-hover-scale)

IDs:
- JavaScript: kebab-case (mobile-menu, mobile-menu-button)

Liquid Variables:
- snake_case (recent_posts, category_name)
```

---

## Quick Reference

### Responsive Breakpoints
```
sm: 640px+
md: 768px+
lg: 1024px+
xl: 1280px+
2xl: 1536px+
```

### Common Patterns

**Centered Container**:
```html
<div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
```

**Responsive Grid**:
```html
<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
```

**Flex Center**:
```html
<div class="flex items-center justify-center">
```

**Hover State Group**:
```html
<div class="group">
  <h3 class="group-hover:text-blue-600">Hover parent to change this</h3>
</div>
```

---

**Last Updated**: 2025-11-07
**Version**: 1.0.0
