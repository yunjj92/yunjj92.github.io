# Maintenance Guide

Comprehensive instructions for maintaining, updating, and extending the TreeKangaroo blog.

## Table of Contents

1. [Adding New Content](#adding-new-content)
2. [Modifying Homepage Sections](#modifying-homepage-sections)
3. [Customizing Design](#customizing-design)
4. [Performance Maintenance](#performance-maintenance)
5. [Common Tasks](#common-tasks)
6. [Troubleshooting](#troubleshooting)

---

## Adding New Content

### Adding Blog Posts

#### Step 1: Create Post File

Create a new Markdown file in `_posts/` directory:

```bash
# Filename format: YYYY-MM-DD-title-with-dashes.md
touch _posts/2024-01-15-my-new-blog-post.md
```

#### Step 2: Add Front Matter

Add this at the top of your Markdown file:

```yaml
---
layout: post
title: "Your Compelling Post Title"
date: 2024-01-15
categories: [Web Development, JavaScript]
image: /assets/images/posts/my-post-image.jpg  # Optional but recommended
excerpt: "A brief 1-2 sentence summary that appears in post previews"
draft: false  # Set to true to hide from homepage while working
---
```

#### Step 3: Write Content

Write your post content in Markdown below the front matter:

```markdown
## Introduction

Your content here with **bold**, *italic*, and [links](https://example.com).

### Code Blocks

```javascript
function example() {
  console.log('Hello, world!');
}
``‌`

### Lists

- Bullet point 1
- Bullet point 2
- Bullet point 3

1. Numbered item 1
2. Numbered item 2
```

#### Step 4: Test Locally

```bash
bundle exec jekyll serve
# Visit http://localhost:4000
```

Your post will automatically appear on:
- Homepage (up to 6 most recent)
- Blog page (all posts)
- Appropriate category pages

---

### Adding Projects

#### Step 1: Create Project File

```bash
touch _projects/my-awesome-project.md
```

#### Step 2: Add Front Matter

```yaml
---
layout: project
title: "Project Name"
description: "Brief one-liner description"
image: /assets/images/projects/project-thumbnail.jpg
github: https://github.com/username/repo  # Optional
demo: https://demo-url.com  # Optional
technologies: [React, Node.js, MongoDB, Tailwind CSS]
featured: true  # Show on homepage featured projects section
status: completed  # completed, in-progress, or planned
duration: "3 months"
team_size: "Solo project"
role: "Full Stack Developer"
---
```

#### Step 3: Write Project Details

```markdown
## Overview

Detailed project description...

## Key Features

- Feature 1: Description
- Feature 2: Description
- Feature 3: Description

## Technical Implementation

### Architecture

Describe your technical architecture...

### Challenges & Solutions

**Challenge 1:** Description
**Solution:** How you solved it...

## Results & Impact

Quantifiable results and impact...
```

---

## Modifying Homepage Sections

### Hero Section

**Location**: `index.html` lines 7-103

**What You Can Modify**:

```html
<!-- Main Title -->
<h1 class="text-4xl sm:text-5xl lg:text-6xl font-bold text-gray-900 mb-6 leading-tight">
  Your Archive for
  <span class="bg-gradient-to-r from-blue-600 via-indigo-600 to-purple-600 bg-clip-text text-transparent gradient-animate">
    Programming Excellence  <!-- CHANGE THIS TEXT -->
  </span>
</h1>

<!-- Tagline -->
<p class="text-xl sm:text-2xl text-gray-600 font-medium mb-6">
  Exploring code, solving problems, and sharing knowledge  <!-- CHANGE THIS -->
</p>

<!-- Description -->
<p class="text-lg text-gray-600 mb-10">
  Dive into comprehensive tutorials...  <!-- CHANGE THIS DESCRIPTION -->
</p>
```

**Modifying Hero Features**:

```html
<!-- Feature 1 -->
<div class="flex flex-col items-center p-6 bg-white rounded-xl shadow-md">
  <div class="flex items-center justify-center w-12 h-12 bg-blue-100 rounded-lg mb-4">
    <!-- CHANGE ICON HERE -->
    <svg class="w-6 h-6 text-blue-600">...</svg>
  </div>
  <h3 class="text-lg font-semibold text-gray-900 mb-2">
    In-Depth Tutorials  <!-- CHANGE TITLE -->
  </h3>
  <p class="text-sm text-gray-600 text-center">
    Comprehensive guides...  <!-- CHANGE DESCRIPTION -->
  </p>
</div>
```

**Adding a New Feature Card**: Copy one of the existing feature divs (lines 68-77) and paste it as a 4th card. Update:
- Icon SVG path
- Title
- Description
- Background color class (`bg-blue-100` → `bg-green-100`)

---

### Featured Posts Section

**Location**: `index.html` lines 105-245

**Changing Number of Featured Posts**:

```liquid
{# Current: Shows 6 posts %}
{% assign recent_posts = site.posts | where_exp: "post", "post.draft != true" | slice: 0, 6 %}

{# To show 9 posts: %}
{% assign recent_posts = site.posts | where_exp: "post", "post.draft != true" | slice: 0, 9 %}
```

**Adjusting Grid Layout**:

```html
<!-- Current: 1 → 2 → 3 columns -->
<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">

<!-- To show 4 columns on large screens: -->
<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8">
```

**Modifying Section Header**:

```html
<h2 class="text-3xl sm:text-4xl font-bold text-gray-900 mb-4">
  Recent Articles  <!-- CHANGE TITLE -->
</h2>
<p class="text-lg text-gray-600 max-w-2xl mx-auto">
  Explore the latest tutorials...  <!-- CHANGE DESCRIPTION -->
</p>
```

---

### Categories Section

**Location**: `index.html` lines 247-397

**Changing Number of Displayed Categories**:

```liquid
{# Current: Shows 8 categories %}
{% for category in sorted_categories limit:8 %}

{# To show all categories: %}
{% for category in sorted_categories %}

{# To show 12 categories: %}
{% for category in sorted_categories limit:12 %}
```

**Adding New Category Icon**:

Find the icon selection logic (line 300+) and add your new category:

```liquid
{% elsif category_lower contains 'mobile' or category_lower contains 'ios' or category_lower contains 'android' %}
  <!-- Mobile Development Icon -->
  <svg class="w-16 h-16 text-purple-600 group-hover:scale-110 transition-transform duration-300"
       fill="none" stroke="currentColor" viewBox="0 0 24 24">
    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
          d="M12 18h.01M8 21h8a2 2 0 002-2V5a2 2 0 00-2-2H8a2 2 0 00-2 2v14a2 2 0 002 2z" />
  </svg>
```

**Icon Color Options**:
- `text-blue-600` - Blue
- `text-indigo-600` - Indigo
- `text-purple-600` - Purple
- `text-green-600` - Green
- `text-yellow-600` - Yellow
- `text-red-600` - Red
- `text-pink-600` - Pink
- `text-gray-600` - Gray

Get more icons from [Heroicons](https://heroicons.com/)

---

### About/Bio Section

**Location**: `index.html` lines 399-538

**Updating Personal Information**:

```html
<!-- Name -->
<h2 class="text-3xl sm:text-4xl font-bold text-gray-900 mb-2">
  TreeKangaroo  <!-- CHANGE YOUR NAME -->
</h2>

<!-- Title -->
<p class="text-xl text-blue-600 font-semibold">
  Full Stack Developer  <!-- CHANGE YOUR TITLE -->
</p>

<!-- Bio -->
<p class="text-lg text-gray-700 leading-relaxed">
  Passionate Full Stack Developer...  <!-- CHANGE YOUR BIO -->
</p>
```

**Updating Skills**:

```html
<!-- Add/Remove/Modify skill badges -->
<span class="px-4 py-2 bg-white text-blue-700 text-sm font-semibold rounded-lg shadow-sm
             border border-blue-200 hover:border-blue-400 hover:shadow-md transition-all">
  Java & Spring  <!-- CHANGE SKILL NAME -->
</span>

<!-- Change badge color by modifying text-* and border-* classes -->
```

**Updating Social Links**:

```html
<!-- GitHub -->
<a href="https://github.com/yunjj92"  <!-- CHANGE URL -->
   target="_blank"
   rel="noopener noreferrer">

<!-- LinkedIn -->
<a href="#"  <!-- ADD YOUR LINKEDIN URL -->

<!-- Email -->
<a href="mailto:your.email@example.com"  <!-- ADD YOUR EMAIL -->
```

**Changing Status Badge**:

```html
<!-- Current: Available (green) -->
<div class="px-4 py-1.5 bg-green-500 text-white">
  <span>Available</span>
</div>

<!-- To show "Busy" status (yellow): -->
<div class="px-4 py-1.5 bg-yellow-500 text-white">
  <span>Busy</span>
</div>

<!-- To show "Unavailable" (red): -->
<div class="px-4 py-1.5 bg-red-500 text-white">
  <span>Unavailable</span>
</div>
```

---

## Customizing Design

### Changing Colors

**Primary Brand Colors** (affects buttons, links, accents):

**Option 1: Find and Replace in index.html**

```bash
# Change blue to green throughout
# Before: from-blue-600 to-indigo-600
# After: from-green-600 to-emerald-600
```

**Option 2: Modify Specific Elements**

```html
<!-- Primary button -->
<a class="bg-gradient-to-r from-blue-600 to-indigo-600">
<!-- Change to: -->
<a class="bg-gradient-to-r from-green-600 to-emerald-600">

<!-- Badges -->
<span class="bg-blue-50 text-blue-700 border-blue-200">
<!-- Change to: -->
<span class="bg-green-50 text-green-700 border-green-200">
```

### Changing Typography

**Update Heading Sizes**:

```html
<!-- Make hero title larger -->
<!-- Before: -->
<h1 class="text-4xl sm:text-5xl lg:text-6xl">

<!-- After: -->
<h1 class="text-5xl sm:text-6xl lg:text-7xl">
```

**Change Font Weights**:

```html
<!-- Make text bolder -->
<!-- Before: -->
<p class="font-medium">

<!-- After: -->
<p class="font-semibold">
```

### Adjusting Spacing

**Section Spacing**:

```html
<!-- Reduce section padding -->
<!-- Before: -->
<section class="py-16 sm:py-20 lg:py-24">

<!-- After: -->
<section class="py-12 sm:py-16 lg:py-20">
```

**Component Spacing**:

```html
<!-- Increase card gap -->
<!-- Before: -->
<div class="grid gap-8">

<!-- After: -->
<div class="grid gap-10 lg:gap-12">
```

### Modifying Animations

**Disable Specific Animations**:

Remove animation classes from elements:

```html
<!-- Remove hover lift effect -->
<!-- Before: -->
<button class="btn-hover-lift">

<!-- After: -->
<button>
```

**Adjust Animation Speed** in `assets/css/homepage-animations.css`:

```css
/* Make animations faster */
.scroll-reveal {
  transition: opacity 0.4s ease-out, transform 0.4s ease-out;  /* was 0.8s */
}

/* Make animations slower */
.card-hover-scale {
  transition: all 0.6s cubic-bezier(0.4, 0, 0.2, 1);  /* was 0.4s */
}
```

---

## Performance Maintenance

### Optimizing Images

#### 1. Resize Images Before Upload

```bash
# Using ImageMagick
convert input.jpg -resize 1200x800 -quality 85 output.jpg

# Using sips (Mac)
sips -Z 1200 input.jpg --out output.jpg
```

#### 2. Convert to WebP (Future Optimization)

```bash
# Using cwebp
cwebp -q 80 input.jpg -o output.webp
```

Then use picture element:

```html
<picture>
  <source srcset="image.webp" type="image/webp">
  <img src="image.jpg" alt="Description" loading="lazy">
</picture>
```

### CSS Optimization

#### Purge Unused Tailwind Classes (Future)

1. Install Tailwind CLI:
```bash
npm install -D tailwindcss
```

2. Create `tailwind.config.js`:
```javascript
module.exports = {
  content: [
    "./_includes/**/*.html",
    "./_layouts/**/*.html",
    "./*.html",
  ],
  theme: {
    extend: {},
  },
}
```

3. Build optimized CSS:
```bash
npx tailwindcss -i ./src/input.css -o ./assets/css/tailwind.min.css --minify
```

### Monitoring Performance

#### Use Lighthouse

```bash
# Install Lighthouse CLI
npm install -g lighthouse

# Run audit
lighthouse http://localhost:4000 --view
```

**Target Scores**:
- Performance: > 90
- Accessibility: > 95
- Best Practices: > 90
- SEO: > 90

#### Check Core Web Vitals

**Target Metrics**:
- LCP (Largest Contentful Paint): < 2.5s
- FID (First Input Delay): < 100ms
- CLS (Cumulative Layout Shift): < 0.1

---

## Common Tasks

### Adding a New Homepage Section

#### Step 1: Choose Location

Decide where to add your section in `index.html` (between existing sections).

#### Step 2: Copy Section Template

```html
<!-- New Section Template -->
<section class="py-16 sm:py-20 lg:py-24 bg-white scroll-reveal">
  <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
    <!-- Section Header -->
    <div class="text-center mb-12">
      <h2 class="text-3xl sm:text-4xl font-bold text-gray-900 mb-4">
        Your Section Title
      </h2>
      <p class="text-lg text-gray-600 max-w-2xl mx-auto">
        Section description text
      </p>
    </div>

    <!-- Section Content -->
    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
      <!-- Add your content here -->
    </div>
  </div>
</section>
```

#### Step 3: Add Content

Fill in your content based on section purpose.

#### Step 4: Alternate Background Colors

```html
<!-- White background -->
<section class="bg-white">

<!-- Light gray background -->
<section class="bg-gray-50">

<!-- Gradient background -->
<section class="bg-gradient-to-br from-blue-50 to-indigo-50">
```

### Updating Navigation Menu

**Location**: `_data/navigation.yml`

```yaml
# Add new navigation item
- name: Home
  link: /

- name: Blog
  link: /blog.html

- name: Projects
  link: /projects.html

- name: About
  link: /about.html

# Add your new item:
- name: Portfolio
  link: /portfolio.html
```

Navigation will automatically update in header!

### Changing Site Logo

1. Add your logo to `assets/images/`:
```bash
cp your-logo.png assets/images/logo.png
```

2. Update `_config.yml`:
```yaml
logo: "/assets/images/logo.png"
logo-icon: "/assets/images/logo.png"
```

3. Logo appears in:
   - Header navigation
   - About/Bio section
   - Favicon (if configured)

### Customizing Footer

**Location**: `_includes/footer.html`

Add/modify footer content, social links, copyright text, etc.

---

## Troubleshooting

### Posts Not Appearing

**Issue**: New post doesn't show on homepage

**Solutions**:
1. Check filename format: `YYYY-MM-DD-title.md`
2. Verify `draft: false` in front matter
3. Ensure date is not in the future
4. Clear Jekyll cache:
```bash
bundle exec jekyll clean
bundle exec jekyll serve
```

### Images Not Loading

**Issue**: Images show broken link icon

**Solutions**:
1. Check path is correct (relative to site root):
   - ✅ `/assets/images/photo.jpg`
   - ❌ `assets/images/photo.jpg` (missing leading slash)
2. Verify image file exists in correct location
3. Check file extension matches (jpg vs jpeg)
4. Ensure image isn't too large (< 2MB recommended)

### Styles Not Applying

**Issue**: Tailwind classes not working

**Solutions**:
1. Check Tailwind CDN link in `_includes/head.html`
2. Verify class names are correct (no typos)
3. Clear browser cache (Ctrl+Shift+R / Cmd+Shift+R)
4. Check for conflicting CSS

### Navigation Not Working

**Issue**: Menu doesn't toggle on mobile

**Solutions**:
1. Check `_data/navigation.yml` exists and has correct format
2. Verify JavaScript in `_includes/navigation.html` is present
3. Check browser console for JavaScript errors
4. Ensure button ID matches script: `id="mobile-menu-button"`

### Animation Issues

**Issue**: Scroll animations not triggering

**Solutions**:
1. Verify elements have correct classes: `.scroll-reveal` or `.fade-in-up`
2. Check JavaScript at end of `index.html` is present
3. Ensure browser supports Intersection Observer (all modern browsers)
4. Check browser console for errors

### Build Failures

**Issue**: Jekyll build fails with error

**Solutions**:
1. Check error message for specific file/line
2. Verify all Liquid tags are properly closed: `{% if %}...{% endif %}`
3. Check for syntax errors in YAML front matter
4. Run with verbose flag:
```bash
bundle exec jekyll serve --verbose
```

---

## Maintenance Checklist

### Weekly

- [ ] Check all new content displays correctly
- [ ] Test responsive layout on mobile device
- [ ] Verify all links work (internal and external)
- [ ] Review and respond to comments (if enabled)

### Monthly

- [ ] Update Jekyll and dependencies:
```bash
bundle update
```
- [ ] Review Google Analytics (if configured)
- [ ] Optimize any new images
- [ ] Check for broken links with [broken-link-checker](https://github.com/stevenvachon/broken-link-checker)
- [ ] Review site speed with Lighthouse
- [ ] Backup site content and database

### Quarterly

- [ ] Review and update About page
- [ ] Update project portfolio
- [ ] Review and refresh old content
- [ ] Check SEO performance
- [ ] Review and update documentation
- [ ] Security audit for dependencies

### Annually

- [ ] Full content audit
- [ ] Design refresh evaluation
- [ ] Major version updates (Jekyll, Ruby, etc.)
- [ ] Review and update privacy policy
- [ ] Backup verification and disaster recovery test

---

## Getting Help

### Resources

- **Jekyll Documentation**: https://jekyllrb.com/docs/
- **Tailwind CSS Docs**: https://tailwindcss.com/docs
- **Liquid Template Language**: https://shopify.github.io/liquid/
- **Heroicons**: https://heroicons.com/

### Common Questions

**Q: How do I change the number of posts on the homepage?**
A: Edit line 123 in `index.html`, change `slice: 0, 6` to desired number.

**Q: Can I use custom fonts?**
A: Yes! Add font link in `_includes/head.html` and update Tailwind config.

**Q: How do I add comments to blog posts?**
A: Integrate a commenting system like Disqus, utterances, or giscus in `_layouts/post.html`.

**Q: Can I add a newsletter signup?**
A: Yes! Add a newsletter section in `index.html` with your email service provider's embed code.

**Q: How do I customize the category pages?**
A: Modify `_layouts/category.html` to change how category pages display.

---

**Last Updated**: 2025-11-07
**Maintainer**: TreeKangaroo
**Version**: 1.0.0
