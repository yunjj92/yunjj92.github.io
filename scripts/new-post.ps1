# New Jekyll Post Creator Script (PowerShell)
# Usage: .\scripts\new-post.ps1 "Your Post Title"

param(
    [Parameter(Mandatory=$true)]
    [string]$PostTitle
)

# Get current date in YYYY-MM-DD format
$CurrentDate = Get-Date -Format "yyyy-MM-dd"

# Create a slug from the title (lowercase, replace spaces with hyphens)
$Slug = $PostTitle.ToLower() -replace '[^a-z0-9\s-]', '' -replace '\s+', '-'

# Create the filename
$Filename = "_posts\$CurrentDate-$Slug.md"

# Check if file already exists
if (Test-Path $Filename) {
    Write-Host "❌ Error: Post already exists at $Filename" -ForegroundColor Red
    exit 1
}

# Create the post file with frontmatter
$Content = @"
---
layout: post
title: "$PostTitle"
date: $CurrentDate
author: TreeKangaroo
categories: []
tags: []
image:
description: ""
---

## Introduction

Write your post content here...

## Conclusion

"@

# Write the content to the file
$Content | Out-File -FilePath $Filename -Encoding UTF8

Write-Host "✅ Post created successfully: $Filename" -ForegroundColor Green
Write-Host ""
Write-Host "Next steps:" -ForegroundColor Cyan
Write-Host "1. Edit the file to add categories, tags, and content"
Write-Host "2. Add a featured image (optional)"
Write-Host "3. Run 'bundle exec jekyll serve' to preview"
Write-Host ""

# Open the file in VS Code if available, otherwise use default editor
if (Get-Command code -ErrorAction SilentlyContinue) {
    code $Filename
} else {
    Start-Process $Filename
}
