# TreeKangaroo's Blog

A modern, performant Jekyll-based blog showcasing programming tutorials, insights, and projects. Built with Tailwind CSS and optimized for accessibility and user experience.

## 🌟 Features

- **Modern Homepage Design**: Hero section, featured posts, category navigation, and author bio
- **Responsive Navigation**: Mobile-first design with accessible navigation system
- **Performance Optimized**: Lazy loading, optimized assets, and efficient Liquid templates
- **Accessibility First**: WCAG 2.1 AA compliant with screen reader support
- **Smooth Animations**: Scroll-reveal animations with reduced-motion support
- **SEO Ready**: Jekyll SEO Tag, sitemap, and social media optimization

## 📁 Project Structure

```
yunjj92.github.io/
├── _config.yml                 # Jekyll configuration
├── _layouts/                   # Layout templates
│   ├── home-main.html         # Homepage layout (simple wrapper)
│   ├── post.html              # Blog post layout
│   ├── category.html          # Category page layout
│   ├── about.html             # About page layout
│   ├── project.html           # Project detail layout
│   └── portfolio-home.html    # Alternative portfolio layout
├── _includes/                  # Reusable components
│   ├── head.html              # HTML head (meta, SEO, styles)
│   ├── header.html            # Site header with branding
│   ├── navigation.html        # Navigation component
│   ├── footer.html            # Site footer
│   └── project-card.html      # Project card component
├── _posts/                     # Blog posts (markdown files)
├── _projects/                  # Project collection
├── _data/                      # Data files
│   └── navigation.yml         # Navigation menu items
├── assets/                     # Static assets
│   ├── css/
│   │   └── homepage-animations.css  # Animation styles
│   └── images/                # Image files
├── index.html                  # Homepage content
├── blog.html                   # Blog listing page
├── projects.html               # Projects listing page
├── about.html                  # About page
└── README.md                   # This file
```

## 🏗️ Architecture Overview

### Layout Inheritance Chain

The homepage uses a simple, clean layout structure:

```
index.html (content)
  ↓
home-main.html (layout wrapper)
  ├── head.html (meta tags, SEO, CSS)
  ├── header.html (branding + navigation)
  ├── content (homepage sections)
  └── footer.html (site footer)
```

**Key Design Decision**: The `home-main.html` layout is intentionally minimal, serving only as a wrapper. All homepage-specific content resides in `index.html` for easier maintenance and customization.

### Navigation System

**Decision Rationale**: The site uses a top navigation bar instead of a sidebar for several reasons:

1. **Mobile-First Responsive**: Better UX on mobile devices
2. **Accessibility**: Full ARIA label support and keyboard navigation
3. **Modern Design**: Aligns with contemporary web design patterns
4. **Maintainability**: Cleaner code structure and easier updates

**Navigation Components**:
- **Desktop**: Horizontal nav bar with active state indicators
- **Mobile**: Hamburger menu with overlay
- **Accessibility**: ARIA labels, keyboard shortcuts (ESC to close), focus management

### Homepage Sections

The homepage (`index.html`) consists of five main sections:

1. **Hero Section** (`lines 7-103`)
   - Animated gradient background with blob effects
   - Blog title, tagline, and introduction
   - Dual call-to-action buttons (Articles, Projects)
   - Feature highlights (3-column grid)

2. **Featured Posts Section** (`lines 105-245`)
   - Dynamically fetches recent non-draft posts
   - Responsive card grid (1-2-3 columns)
   - Post metadata: date, reading time, categories
   - Fallback for posts without images
   - Empty state handling

3. **Categories Overview** (`lines 247-397`)
   - Category cards with dynamic icons
   - Post count per category
   - Intelligent icon selection based on category name
   - Responsive grid layout

4. **About/Bio Section** (`lines 399-538`)
   - Author avatar with gradient border
   - Social media links (GitHub, LinkedIn, Email)
   - Skills badges
   - Dual CTAs (Profile, Projects)

5. **Animations** (`lines 540-585`)
   - Intersection Observer for scroll reveals
   - Accessibility: respects `prefers-reduced-motion`
   - Performance optimized with unobserve after reveal

## 🎨 Design System

### Color Palette

**Primary Colors**:
- Blue: `from-blue-600 to-indigo-600` (primary actions)
- Indigo: `indigo-600` (secondary elements)
- Purple: `purple-600` (accents)

**Neutral Colors**:
- Gray Scale: `gray-50` to `gray-900`
- White: `#ffffff`
- Backgrounds: `blue-50`, `indigo-50`, `gray-50`

**Semantic Colors**:
- Success: `green-500`
- Info: `blue-600`
- Warning: `yellow-600`
- Error: `red-600`

### Typography

**Font Stack**: System font stack (Tailwind default)

**Heading Scale**:
- H1: `text-4xl sm:text-5xl lg:text-6xl` (Hero)
- H2: `text-3xl sm:text-4xl` (Section headers)
- H3: `text-xl` to `text-2xl` (Card titles)
- Body: `text-base` to `text-lg`

**Font Weights**:
- Regular: `font-normal` (400)
- Medium: `font-medium` (500)
- Semibold: `font-semibold` (600)
- Bold: `font-bold` (700)

### Spacing System

**Tailwind Spacing Scale**:
- Section Padding: `py-16 sm:py-20 lg:py-24` (vertical)
- Container: `max-w-7xl mx-auto px-4 sm:px-6 lg:px-8`
- Grid Gaps: `gap-4`, `gap-6`, `gap-8`
- Component Padding: `p-6`, `p-8`, `px-6 py-3`

### Component Patterns

**Cards**:
```html
<div class="bg-white rounded-xl shadow-md hover:shadow-xl border border-gray-100 hover:border-blue-200 card-hover-scale">
  <!-- Card content -->
</div>
```

**Buttons**:
```html
<!-- Primary -->
<a class="px-8 py-4 bg-gradient-to-r from-blue-600 to-indigo-600 text-white rounded-lg shadow-lg btn-hover-lift">

<!-- Secondary -->
<a class="px-8 py-4 bg-white text-gray-700 border-2 border-gray-300 rounded-lg shadow-md hover:border-blue-400 btn-hover-lift">
```

**Badges**:
```html
<span class="px-2.5 py-0.5 rounded-full text-xs font-medium bg-blue-50 text-blue-700 border border-blue-200">
```

## 🎭 Animations & Interactions

### Scroll Reveal Animations

**Implementation**: Intersection Observer API (`index.html` lines 541-585)

**Classes**:
- `.scroll-reveal`: Fade-in from below on scroll
- `.fade-in-up`: Staggered fade-in for grid items
- `.stagger-children`: Progressive delays for child elements

### Hover Effects

**Defined in**: `assets/css/homepage-animations.css`

- `.btn-hover-lift`: Elevate buttons on hover (-2px translateY)
- `.card-hover-scale`: Scale and lift cards (scale 1.02, translateY -4px)
- `.icon-bounce`: Gentle bounce animation on hover

### Hero Animations

- **Blob Animation**: Organic floating background shapes
- **Gradient Animation**: Shifting color gradient on hero text
- **Pulse Ring**: Status indicator animation on author bio

### Accessibility

All animations respect `prefers-reduced-motion`:
```css
@media (prefers-reduced-motion: reduce) {
  /* Disable all animations */
}
```

## 🔧 Configuration

### Jekyll Configuration (`_config.yml`)

**Key Settings**:
- **Logo**: `/assets/images/brain-circuit.png`
- **Port**: 4000
- **Host**: 127.0.0.1
- **Markdown**: kramdown with GFM input
- **Syntax Highlighting**: coderay with line numbers

**Collections**:
- `authors`: Output enabled
- `projects`: Output enabled with permalink `/projects/:name/`

**Plugins**:
- `jekyll-feed`: RSS feed generation
- `jekyll-sitemap`: Automatic sitemap
- `jekyll-seo-tag`: SEO optimization

**Performance**:
```yaml
liquid:
  error_mode: warn
  strict_filters: false
```

### Navigation Data (`_data/navigation.yml`)

Create this file to define navigation menu items:

```yaml
- name: Home
  link: /
- name: Blog
  link: /blog.html
- name: Projects
  link: /projects.html
- name: About
  link: /about.html
```

## 📝 Content Management

### Adding Blog Posts

1. Create new file in `_posts/` with naming: `YYYY-MM-DD-title.md`
2. Add front matter:
```yaml
---
layout: post
title: "Your Post Title"
date: 2024-01-01
categories: [Web Development, JavaScript]
image: /assets/images/post-image.jpg  # Optional
draft: false  # Set to true to exclude from homepage
---
```
3. Write content in Markdown
4. Posts automatically appear on homepage and blog page

### Adding Projects

1. Create new file in `_projects/` with naming: `project-name.md`
2. Add front matter:
```yaml
---
layout: project
title: "Project Name"
description: "Brief description"
image: /assets/images/project.jpg
github: https://github.com/username/repo  # Optional
demo: https://demo-url.com  # Optional
technologies: [React, Node.js, MongoDB]
---
```
3. Write project details in Markdown

### Adding Categories

Categories are automatically generated from post front matter. To add a new category:

1. Add category to post front matter: `categories: [New Category]`
2. Category will appear automatically in categories section
3. Icon is intelligently selected based on category name keywords

## 🚀 Development

### Local Development

```bash
# Install dependencies
bundle install

# Start development server
bundle exec jekyll serve

# Server runs at http://localhost:4000
```

### Build for Production

```bash
# Generate production build
bundle exec jekyll build

# Output in _site/ directory
```

### Performance Optimization

**Implemented Optimizations**:
- Lazy loading images with `loading="lazy"`
- Extracted CSS from inline styles
- Efficient Liquid template logic
- Intersection Observer for scroll animations
- Resource hints for critical assets

**Future Optimizations** (see task 28):
- Convert images to WebP format
- Implement local Tailwind build with purging
- Add resource preloading for critical assets

## ♿ Accessibility Features

### Compliance

- **WCAG 2.1 AA Standard**: Met all requirements
- **Screen Reader Support**: Semantic HTML and ARIA labels
- **Keyboard Navigation**: Full keyboard accessibility
- **Color Contrast**: All text meets contrast requirements

### Implementation Details

**Semantic HTML**:
- `<article>` for posts
- `<nav>` for navigation
- `<section>` for page sections
- `<header>`, `<footer>`, `<main>` for structure

**ARIA Labels**:
```html
<button aria-label="Toggle navigation menu" aria-expanded="false">
<nav role="navigation" aria-label="Main navigation">
<img alt="Descriptive alt text">
```

**Keyboard Support**:
- Tab navigation through interactive elements
- ESC key closes mobile menu
- Focus indicators visible
- Skip links (can be added for further enhancement)

## 📱 Responsive Design

### Breakpoints (Tailwind)

- **Mobile**: < 640px (sm)
- **Tablet**: 640px - 768px (md)
- **Desktop**: 768px - 1024px (lg)
- **Large Desktop**: > 1024px (xl)

### Grid Layouts

**Featured Posts**: 1 → 2 → 3 columns
```html
<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
```

**Categories**: 1 → 2 → 3 → 4 columns
```html
<div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6">
```

**About Section**: 1 column → 3 columns (photo + bio)
```html
<div class="grid grid-cols-1 lg:grid-cols-3 gap-8">
```

## 🐛 Troubleshooting

### Common Issues

**Issue**: Posts not appearing on homepage
- **Solution**: Check `draft: false` in post front matter
- **Solution**: Ensure filename follows `YYYY-MM-DD-title.md` pattern

**Issue**: Navigation not working
- **Solution**: Verify `_data/navigation.yml` exists with correct format
- **Solution**: Check that links match actual file paths

**Issue**: Images not loading
- **Solution**: Verify image paths are correct (relative to site root)
- **Solution**: Check `_config.yml` for correct `baseurl` setting

**Issue**: Styles not applying
- **Solution**: Clear Jekyll cache: `bundle exec jekyll clean`
- **Solution**: Check Tailwind CDN link in `head.html`

## 📄 License

This theme is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## 🤝 Contributing

Contributions, issues, and feature requests are welcome! Feel free to check the issues page.

## 📧 Contact

**TreeKangaroo** - Full Stack Developer
- GitHub: [@yunjj92](https://github.com/yunjj92)
- Email: your.email@example.com

---

**Last Updated**: 2025-11-07
**Jekyll Version**: 4.x
**Ruby Version**: 2.7+
