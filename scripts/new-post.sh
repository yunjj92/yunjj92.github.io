#!/bin/bash

# New Jekyll Post Creator Script
# Usage: ./scripts/new-post.sh "Your Post Title"

# Check if title is provided
if [ -z "$1" ]; then
    echo "Error: Please provide a post title"
    echo "Usage: ./scripts/new-post.sh \"Your Post Title\""
    exit 1
fi

# Get the post title from the first argument
POST_TITLE="$1"

# Get current date in YYYY-MM-DD format
CURRENT_DATE=$(date +"%Y-%m-%d")

# Create a slug from the title (lowercase, replace spaces with hyphens)
SLUG=$(echo "$POST_TITLE" | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g' | sed 's/[^a-z0-9-]//g')

# Create the filename
FILENAME="_posts/${CURRENT_DATE}-${SLUG}.md"

# Check if file already exists
if [ -f "$FILENAME" ]; then
    echo "Error: Post already exists at $FILENAME"
    exit 1
fi

# Create the post file with frontmatter
cat > "$FILENAME" << EOF
---
layout: post
title: "$POST_TITLE"
date: $CURRENT_DATE
author: TreeKangaroo
categories: []
tags: []
image:
description: ""
---

## Introduction

Write your post content here...

## Conclusion

EOF

echo "✅ Post created successfully: $FILENAME"
echo ""
echo "Next steps:"
echo "1. Edit the file to add categories, tags, and content"
echo "2. Add a featured image (optional)"
echo "3. Run 'bundle exec jekyll serve' to preview"

# Open the file in the default editor if EDITOR is set
if [ -n "$EDITOR" ]; then
    $EDITOR "$FILENAME"
elif command -v code &> /dev/null; then
    code "$FILENAME"
fi
