# Blog Post Creation Guide

This guide shows you 4 different ways to quickly create new blog posts with pre-filled frontmatter.

## Option 1: Jekyll Compose (Recommended) ⭐

**Best for**: Command-line users, most automated solution

### Setup:
1. Install the plugin:
```bash
bundle install
```

### Usage:
```bash
# Create a new post
bundle exec jekyll post "My Awesome Post Title"

# Create a draft
bundle exec jekyll draft "Work in Progress"

# Publish a draft
bundle exec jekyll publish _drafts/work-in-progress.md
```

### What it does:
- Automatically creates the file in `_posts/` with the correct date format
- Pre-fills frontmatter with layout, author, categories, tags, etc.
- Handles slug generation automatically

---

## Option 2: VS Code Snippets

**Best for**: VS Code users who prefer typing shortcuts

### Setup:
Already configured! The snippet file is at `.vscode/markdown.code-snippets`

### Usage:
1. Create a new file in `_posts/` (name it: `YYYY-MM-DD-title.md`)
2. Type one of these shortcuts and press `Tab`:
   - `post` → Full frontmatter template
   - `postmin` → Minimal frontmatter template
   - `draft` → Draft post template

### What it does:
- Automatically fills in current date
- Tab through fields to fill in title, categories, tags
- Placeholders guide you through each field

---

## Option 3: Shell Script

**Best for**: Quick post creation from terminal

### Setup:
Make the script executable:
```bash
chmod +x scripts/new-post.sh
```

### Usage:
```bash
# Create a new post
./scripts/new-post.sh "My Awesome Post Title"
```

### What it does:
- Creates the post file with date and slug
- Pre-fills frontmatter template
- Opens the file in your editor automatically
- Shows helpful next steps

---

## Option 4: Claude Code Slash Command

**Best for**: Claude Code users who want AI assistance

### Usage:
In Claude Code, type:
```
/new-post
```

Then follow the prompts to:
- Provide post title
- Get file created with frontmatter
- Receive guidance on next steps

### What it does:
- Interactive post creation
- AI-powered guidance
- Consistent with your workflow

---

## Special: English Expression Notes 📝

**Best for**: Taking notes on English vocabulary and expressions from technical materials

### Quick Start:
```bash
# Copy the template
cp _posts/english/.template.md _posts/english/$(date +%Y-%m-%d)-topic-name.md

# Or create manually
touch _posts/english/2024-11-14-algorithm-terms.md
```

### Template Structure:
The English notes template includes sections for:
- **Source information** (what you're reading)
- **New words & expressions** (with definitions and examples)
- **Grammar patterns** (sentence structures you noticed)
- **Technical terminology** (field-specific terms with Korean translations)
- **Review notes** (additional observations)

### Example Usage:
See `_posts/english/2024-11-14-sample-english-notes.md` for a complete example.

### Tips:
- Create one note per reading session or topic
- Include both the original context and your own examples
- Add Korean translations for technical terms when helpful
- Use tags to categorize by subject: `[vocabulary, mathematics]`, `[expressions, computer-science]`

---

## Frontmatter Reference

Here's what each field means:

```yaml
---
layout: post                    # Always "post" for blog posts
title: "Your Post Title"        # Main title (shows in hero)
date: 2025-01-11               # Publication date
author: TreeKangaroo           # Author name
categories: [Web, Tutorial]     # Categories (multiple allowed)
tags: [javascript, react]       # Tags (multiple allowed)
image: /assets/images/post.jpg  # Featured image (optional)
description: "Brief summary"    # SEO description (optional)
---
```

### For English Notes:
```yaml
---
layout: post
author: TreeKangaroo
categories: english             # Always "english" for language notes
tags: [vocabulary, mathematics] # Specific topics
date: 2024-11-14
title: "English Notes - Algorithm Analysis"
---
```

## Quick Tips

1. **Categories vs Tags**:
   - Categories: Broad topics (Web Development, Tutorial)
   - Tags: Specific keywords (javascript, react, css)

2. **Image Best Practices**:
   - Store in `/assets/images/posts/`
   - Use 1200x630px for optimal display
   - Formats: JPG, PNG, WebP

3. **Filename Format**:
   - Always: `YYYY-MM-DD-title-slug.md`
   - Example: `2025-01-11-my-first-post.md`

4. **Preview Your Post**:
   ```bash
   bundle exec jekyll serve
   # Visit: http://localhost:4000
   ```

## Recommended Workflow

1. Use **Jekyll Compose** to create the post:
   ```bash
   bundle exec jekyll post "My New Post"
   ```

2. Edit the file and add:
   - Categories and tags
   - Featured image
   - Description

3. Write your content using Markdown

4. Preview locally:
   ```bash
   bundle exec jekyll serve
   ```

5. Commit and push when ready!

---

## Need Help?

- [Jekyll Documentation](https://jekyllrb.com/docs/posts/)
- [Jekyll Compose Plugin](https://github.com/jekyll/jekyll-compose)
- [Markdown Guide](https://www.markdownguide.org/basic-syntax/)
