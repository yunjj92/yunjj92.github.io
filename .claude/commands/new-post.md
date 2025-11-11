# Create New Blog Post

Create a new Jekyll blog post with frontmatter template.

## Steps:

1. Ask the user for the post title
2. Get the current date in YYYY-MM-DD format
3. Create a slug from the title (lowercase, hyphens instead of spaces)
4. Create the filename as `_posts/YYYY-MM-DD-slug.md`
5. Create the file with the following frontmatter template:

```yaml
---
layout: post
title: "[Title from user]"
date: [Current date]
author: TreeKangaroo
categories: []
tags: []
image:
description: ""
---

## Introduction

[Placeholder for introduction]

## Main Content

[Placeholder for main content]

## Conclusion

[Placeholder for conclusion]
```

6. Confirm the file was created successfully
7. Provide the next steps:
   - Add categories and tags
   - Add featured image (optional)
   - Write the post content
   - Preview with `bundle exec jekyll serve`
