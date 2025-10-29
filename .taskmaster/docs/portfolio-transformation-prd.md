# Portfolio + Blog Transformation PRD

## Project Overview
Transform the existing Jekyll-based private archive site into a professional portfolio website with integrated blog/technical writing capabilities.

## Goals
1. Create a clean, professional portfolio showcase
2. Maintain blog functionality for technical writing and case studies
3. Simplify technical stack by removing unnecessary build tools
4. Ensure seamless GitHub Pages deployment
5. Create unified professional presence (portfolio + blog in one site)

## Technical Stack Simplification

### Remove
- Vite build tool and configuration
- Node.js dependencies (package.json, node_modules)
- Separate Tailwind build process
- src/ directory structure

### Keep & Optimize
- Jekyll static site generator
- Jekyll's native SCSS processing
- GitHub Pages automatic deployment
- Existing Jekyll collections and layouts

### Add
- Tailwind CSS via CDN (simple integration)
- Projects collection in Jekyll
- Modern portfolio layouts

## Site Structure

### Navigation
- Home (portfolio landing page)
- Projects (portfolio showcase)
- Blog (technical writing & case studies)
- About (skills, experience, background)
- Contact (social links, email)

### Pages to Create/Update

#### 1. Homepage (index.html)
- Hero section with name, title, brief introduction
- Featured projects showcase (2-3 highlighted projects)
- Recent blog posts preview (3-5 latest posts)
- Call-to-action section

#### 2. Projects Page
- Grid/card layout of portfolio projects
- Each project card includes:
  - Project name and description
  - Technologies/tech stack used
  - GitHub link (if applicable)
  - Live demo link (if applicable)
  - Screenshot or thumbnail
- Filter by technology/category (optional)

#### 3. Blog Page (existing blog.html - modernize)
- Clean blog listing layout
- Post categories/tags
- Search functionality (optional)
- Archive by date

#### 4. About Page
- Professional bio
- Skills & technologies section
- Work experience timeline (optional)
- Education (optional)
- Downloadable resume/CV link (optional)

#### 5. Contact Page/Section
- Email address
- GitHub profile
- LinkedIn profile
- Other social media links
- Contact form (optional, can use form service)

## Jekyll Configuration Updates

### Collections
Add projects collection to _config.yml:
```yaml
collections:
  projects:
    output: true
    permalink: /projects/:name/
```

### Data Structure for Projects
Create _data/projects.yml or individual files in _projects/:
- title
- description
- tech_stack (array)
- github_url
- demo_url
- image
- featured (boolean)
- date

## Design Requirements

### Visual Style
- Clean, minimal, professional
- Responsive design (mobile-first)
- Consistent color scheme
- Good typography
- Accessible (WCAG compliant)

### Components Needed
- Navigation bar (responsive)
- Footer with social links
- Project card component
- Blog post card component
- Hero section component

## Content Migration

### Existing Content
- Review existing blog posts in _posts/
- Decide which to keep, archive, or convert to project case studies
- Clean up author collection if not needed

### New Content Needed
- Portfolio project entries
- About page content
- Professional bio
- Skills list
- Contact information

## File Cleanup

### Files to Remove
- vite.config.js
- tailwind.config.js
- package.json
- package-lock.json
- node_modules/ (directory)
- src/ (directory)
- agnes-theme.gemspec (if not using as theme)

### Files to Keep
- _config.yml (update)
- _layouts/ (update and add new layouts)
- _includes/ (update navigation, add new components)
- _posts/ (review and clean)
- assets/ (organize images, css)
- Gemfile (keep Jekyll dependencies)

### New Files to Create
- _projects/ (directory for project collection)
- _layouts/project.html
- _layouts/portfolio-home.html
- projects.html (projects listing page)
- about.md
- contact.md (or add to footer)

## Implementation Phases

### Phase 1: Cleanup & Setup
- Remove Vite/Node.js dependencies
- Clean up unnecessary files
- Set up Tailwind CSS via CDN
- Update _config.yml with projects collection

### Phase 2: Layout & Components
- Create new portfolio-focused layouts
- Update navigation component
- Create footer component
- Set up base styles

### Phase 3: Homepage
- Design and implement hero section
- Add featured projects section
- Add recent blog posts preview
- Create call-to-action

### Phase 4: Projects Page
- Create projects collection structure
- Design project card component
- Build projects listing page
- Add sample/placeholder projects

### Phase 5: Content Pages
- Modernize blog layout
- Create about page
- Add contact section/page
- Review and organize existing posts

### Phase 6: Polish & Optimization
- Responsive design testing
- Cross-browser testing
- Performance optimization
- SEO optimization (meta tags, sitemap)
- Accessibility review

## Success Criteria
- Clean, professional portfolio presentation
- All pages responsive and accessible
- Blog functionality maintained
- GitHub Pages deployment successful
- Load time under 3 seconds
- Mobile-friendly navigation
- All links and images working

## Future Enhancements (Out of Scope)
- Dark mode toggle
- Advanced search functionality
- Comment system for blog
- Newsletter signup
- Analytics integration
