---
layout: project
title: "Personal Portfolio Website"
description: "Responsive portfolio website built with Jekyll, featuring project showcase and blog"
featured: true
date: 2024-08-15
category: Frontend
tech_stack:
  - Jekyll
  - Tailwind CSS
  - JavaScript
  - GitHub Pages
  - Liquid
github_url: https://github.com/yourusername/portfolio
demo_url: https://yourname.github.io
image: /assets/images/projects/portfolio-website.jpg
status: in-progress
duration: 1 month
team_size: 1
role: Frontend Developer & Designer
highlights:
  - Static site generation with Jekyll
  - Deployed on GitHub Pages with custom domain
  - Responsive design with Tailwind CSS
  - SEO optimized with meta tags and sitemap
---

## Project Overview

A personal portfolio website built with Jekyll static site generator. Showcases projects, blog posts, and professional experience with a clean, modern design. Deployed on GitHub Pages for free hosting with automatic deployments.

## Key Features

### Homepage
- **Hero Section**: Introduction with name, title, and CTA
- **Featured Projects**: Showcase of top 3-4 projects
- **Recent Blog Posts**: Latest blog entries preview
- **Skills Section**: Technology stack and expertise
- **Contact Section**: Get in touch form and social links

### Project Portfolio
- **Project Cards**: Grid layout with project thumbnails
- **Filtering**: Filter projects by technology or category
- **Project Pages**: Detailed project case studies
- **Live Demos**: Links to live projects and source code

### Blog
- **Blog Listing**: Paginated list of blog posts
- **Blog Posts**: Markdown-based blog content
- **Categories & Tags**: Organized content taxonomy
- **Code Syntax Highlighting**: Beautiful code blocks
- **Reading Time**: Estimated reading time for posts

### Additional Pages
- **About Page**: Professional background and bio
- **Resume**: Downloadable resume/CV
- **Contact**: Contact form with email integration

## Technical Implementation

### Static Site Generation
- **Jekyll**: Ruby-based static site generator
- **Liquid Templates**: Templating language for layouts
- **Collections**: Separate collections for projects and posts
- **Front Matter**: YAML-based metadata for content

### Styling & Design
- **Tailwind CSS**: Utility-first CSS framework (via CDN)
- **Custom SCSS**: Portfolio-specific variables and components
- **Responsive Design**: Mobile-first approach
- **Typography**: Inter font for modern look

### Features & Functionality
- **Syntax Highlighting**: Rouge with Coderay theme
- **SEO**: Jekyll SEO Tag plugin
- **Sitemap**: Automatic sitemap generation
- **RSS Feed**: Jekyll Feed plugin for blog
- **Analytics**: Google Analytics integration (optional)

### Deployment
- **GitHub Pages**: Free hosting with SSL
- **Custom Domain**: Configured custom domain (optional)
- **Automatic Builds**: Push to deploy workflow
- **Version Control**: Git for source control

## Challenges & Solutions

### Challenge 1: Tailwind Without Build Process
**Problem**: Needed Tailwind but wanted to avoid Node.js build
**Solution**: Used Tailwind CDN for development, custom SCSS for production styles

### Challenge 2: Project Showcase Layout
**Problem**: Creating an attractive project grid that's also responsive
**Solution**: Implemented CSS Grid with Tailwind utilities and custom breakpoints

### Challenge 3: Blog Post Excerpts
**Problem**: Automatically generating compelling blog post previews
**Solution**: Used Jekyll's excerpt feature with custom separator and fallback logic

## What I Learned

- Static site generation with Jekyll
- Liquid templating language
- GitHub Pages deployment and configuration
- Responsive web design principles
- Typography and visual hierarchy
- Writing technical blog posts in Markdown
- SEO best practices for static sites

## Design Decisions

### Color Scheme
- Primary: Indigo (#6366f1) - Professional and modern
- Secondary: Purple (#8b5cf6) - Accent for highlights
- Accent: Pink (#ec4899) - Call-to-action elements
- Neutral: Gray scale for text and backgrounds

### Typography
- Headings: Inter (sans-serif) - Clean and readable
- Body: System fonts - Fast loading and familiar
- Code: Fira Code - Developer-friendly monospace

### Layout
- Max width: 1280px for readability
- Grid system: 12-column responsive grid
- Spacing: Consistent 8px spacing scale
- Components: Reusable card and section patterns

## Performance Metrics

- **Lighthouse Score**: 95+ across all metrics
- **Page Load**: < 2 seconds on 3G
- **Image Optimization**: WebP format with fallbacks
- **Minimal JavaScript**: Vanilla JS for interactions
- **CSS Size**: < 50KB after minification

## Future Enhancements

- [ ] Add dark mode toggle
- [ ] Implement blog search functionality
- [ ] Add newsletter subscription
- [ ] Create case study template for projects
- [ ] Add animations with GSAP or Framer Motion
- [ ] Implement comments system (maybe Disqus or Utterances)
- [ ] Add project tags filtering
- [ ] Create custom 404 page

## Lessons Learned

### What Went Well
✓ Jekyll's simplicity made development fast
✓ GitHub Pages deployment is seamless
✓ Tailwind CSS accelerated UI development
✓ Markdown makes content management easy

### What Could Be Improved
⚠ Jekyll build time increases with content
⚠ Limited dynamic functionality without JavaScript
⚠ Learning curve for Liquid templating
⚠ CDN Tailwind has larger bundle size

## Code Highlights

### Project Collection Loop
```liquid
{% assign featured_projects = site.projects | where: "featured", true %}
{% for project in featured_projects limit:4 %}
  <div class="project-card">
    <h3>{{ project.title }}</h3>
    <p>{{ project.description }}</p>
    <a href="{{ project.url }}">View Project</a>
  </div>
{% endfor %}
```

### Responsive Navigation
```html
<nav class="flex items-center justify-between px-6 py-4">
  <a href="/" class="text-2xl font-bold">Your Name</a>
  <div class="hidden md:flex space-x-6">
    <a href="/projects">Projects</a>
    <a href="/blog">Blog</a>
    <a href="/about">About</a>
    <a href="/contact">Contact</a>
  </div>
</nav>
```

## Screenshots

_Screenshots would be displayed here in the actual portfolio_
