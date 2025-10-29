# Site Optimization Guide

This document provides comprehensive optimization recommendations for the TreeKangaroo portfolio site.

## Image Optimization

### Current Images to Optimize

1. **Logo/Icon Images**
   - `/assets/images/brain-circuit.png` - Used as favicon and logo
   - `/assets/images/about.png` - Used on about page
   - Consider converting to WebP format for better compression

### Image Optimization Recommendations

```bash
# Install imagemin for image optimization
npm install -g imagemin-cli imagemin-webp imagemin-pngquant imagemin-mozjpeg

# Optimize PNG images
imagemin assets/images/*.png --out-dir=assets/images/optimized --plugin=pngquant

# Convert to WebP
imagemin assets/images/*.{png,jpg,jpeg} --out-dir=assets/images/webp --plugin=webp

# Optimize JPEG images (if any)
imagemin assets/images/*.{jpg,jpeg} --out-dir=assets/images/optimized --plugin=mozjpeg
```

### Responsive Image Implementation

Use picture element for responsive images:

```html
<picture>
  <source srcset="/assets/images/webp/image.webp" type="image/webp">
  <source srcset="/assets/images/optimized/image.png" type="image/png">
  <img src="/assets/images/image.png" alt="Description" loading="lazy">
</picture>
```

### Lazy Loading

Add `loading="lazy"` attribute to images below the fold:

```html
<img src="image.jpg" alt="Description" loading="lazy">
```

## CSS Optimization

### Current CSS Structure
- Using Tailwind CSS CDN (good for development)
- Custom SCSS in `/assets/css/`

### Production Recommendations

1. **Use Tailwind CLI for Production Build**
   ```bash
   # Install Tailwind CLI
   npm install -D tailwindcss

   # Build optimized CSS
   npx tailwindcss -i ./assets/css/main.scss -o ./assets/css/main.min.css --minify
   ```

2. **Purge Unused CSS**
   - Configure Tailwind to purge unused styles
   - Reduce CSS file size by 90%+

3. **Critical CSS**
   - Inline critical above-the-fold CSS
   - Defer non-critical CSS loading

## JavaScript Optimization

### Recommendations

1. **Defer Non-Critical Scripts**
   ```html
   <script src="script.js" defer></script>
   ```

2. **Async Loading for Third-Party Scripts**
   ```html
   <script src="https://cdn.tailwindcss.com" async></script>
   ```

3. **Minimize JavaScript Dependencies**
   - Currently using Font Awesome (consider switching to SVG icons)
   - Evaluate if all JavaScript is necessary

## Performance Optimization

### Caching Strategy

Create `_headers` file for Netlify or `.htaccess` for Apache:

**.htaccess (Apache)**
```apache
# Enable GZIP compression
<IfModule mod_deflate.c>
  AddOutputFilterByType DEFLATE text/html text/plain text/xml text/css text/javascript application/javascript application/json
</IfModule>

# Leverage browser caching
<IfModule mod_expires.c>
  ExpiresActive On
  ExpiresByType image/jpg "access plus 1 year"
  ExpiresByType image/jpeg "access plus 1 year"
  ExpiresByType image/gif "access plus 1 year"
  ExpiresByType image/png "access plus 1 year"
  ExpiresByType image/webp "access plus 1 year"
  ExpiresByType text/css "access plus 1 month"
  ExpiresByType application/javascript "access plus 1 month"
  ExpiresByType application/pdf "access plus 1 month"
  ExpiresByType image/x-icon "access plus 1 year"
</IfModule>

# Security Headers
<IfModule mod_headers.c>
  Header set X-Content-Type-Options "nosniff"
  Header set X-Frame-Options "SAMEORIGIN"
  Header set X-XSS-Protection "1; mode=block"
  Header set Referrer-Policy "strict-origin-when-cross-origin"
</IfModule>
```

**_headers (Netlify)**
```
/*
  X-Frame-Options: SAMEORIGIN
  X-XSS-Protection: 1; mode=block
  X-Content-Type-Options: nosniff
  Referrer-Policy: strict-origin-when-cross-origin
  Cache-Control: public, max-age=31536000

/assets/*
  Cache-Control: public, max-age=31536000, immutable

/*.html
  Cache-Control: public, max-age=0, must-revalidate
```

### Content Delivery Network (CDN)

- Already using CDN for Tailwind CSS ✓
- Consider using CDN for Font Awesome
- GitHub Pages / Netlify provides built-in CDN

### Performance Metrics Targets

- **First Contentful Paint (FCP)**: < 1.8s
- **Largest Contentful Paint (LCP)**: < 2.5s
- **Time to Interactive (TTI)**: < 3.8s
- **Cumulative Layout Shift (CLS)**: < 0.1
- **First Input Delay (FID)**: < 100ms

## Accessibility (WCAG 2.1 AA Compliance)

### Current Accessibility Features ✓

1. **Semantic HTML**
   - Proper heading hierarchy
   - Article, section, nav elements
   - Form labels

2. **ARIA Labels**
   - Navigation links have aria-labels
   - Icon buttons have descriptive labels
   - Hidden decorative elements marked with aria-hidden="true"

3. **Keyboard Navigation**
   - All interactive elements are keyboard accessible
   - Focus states are visible
   - Tab order is logical

4. **Color Contrast**
   - Text meets WCAG AA standards (4.5:1 for normal text)
   - Interactive elements have sufficient contrast

### Additional Accessibility Enhancements

1. **Skip Navigation Link**
   ```html
   <a href="#main-content" class="sr-only focus:not-sr-only">Skip to main content</a>
   ```

2. **Screen Reader Utilities**
   ```css
   .sr-only {
     position: absolute;
     width: 1px;
     height: 1px;
     padding: 0;
     margin: -1px;
     overflow: hidden;
     clip: rect(0, 0, 0, 0);
     white-space: nowrap;
     border-width: 0;
   }

   .sr-only:focus {
     position: static;
     width: auto;
     height: auto;
     padding: inherit;
     margin: inherit;
     overflow: visible;
     clip: auto;
     white-space: normal;
   }
   ```

3. **Form Accessibility**
   - All forms have labels ✓
   - Required fields marked with aria-required ✓
   - Error messages associated with inputs
   - Success/error states announced to screen readers

4. **Focus Management**
   ```css
   /* Visible focus indicators */
   *:focus {
     outline: 2px solid #6366f1;
     outline-offset: 2px;
   }

   /* Don't remove focus for keyboard users */
   *:focus:not(:focus-visible) {
     outline: none;
   }

   *:focus-visible {
     outline: 2px solid #6366f1;
     outline-offset: 2px;
   }
   ```

## Mobile Optimization

### Viewport Configuration ✓
```html
<meta name="viewport" content="width=device-width, initial-scale=1.0, viewport-fit=cover">
```

### Touch Targets
- Minimum size: 44x44px (currently implemented) ✓
- Adequate spacing between interactive elements ✓

### Mobile Performance
- Use smaller images on mobile devices
- Implement responsive images with srcset
- Avoid large JavaScript bundles

## SEO Optimization ✓

### Meta Tags (Implemented)
- Title tags with proper hierarchy ✓
- Meta descriptions ✓
- Open Graph tags ✓
- Twitter Card tags ✓
- Canonical URLs ✓
- Structured data (JSON-LD) ✓

### Additional SEO Recommendations

1. **Sitemap.xml**
   - Already generated by jekyll-sitemap plugin ✓

2. **Robots.txt**
   ```
   User-agent: *
   Allow: /
   Sitemap: https://yourdomain.com/sitemap.xml
   ```

3. **Internal Linking**
   - Link between related pages ✓
   - Use descriptive anchor text ✓

## Testing Checklist

### Performance Testing Tools
- [ ] Google PageSpeed Insights
- [ ] Lighthouse (Chrome DevTools)
- [ ] WebPageTest
- [ ] GTmetrix

### Accessibility Testing Tools
- [ ] WAVE (Web Accessibility Evaluation Tool)
- [ ] axe DevTools
- [ ] Screen reader testing (NVDA/JAWS/VoiceOver)
- [ ] Keyboard-only navigation testing

### Cross-Browser Testing
- [ ] Chrome (latest)
- [ ] Firefox (latest)
- [ ] Safari (latest)
- [ ] Edge (latest)
- [ ] Mobile browsers (iOS Safari, Chrome Mobile)

### Responsive Testing
- [ ] Mobile (320px - 480px)
- [ ] Tablet (768px - 1024px)
- [ ] Desktop (1280px+)
- [ ] Large screens (1920px+)

## Implementation Priority

### High Priority (Do First)
1. ✓ SEO meta tags
2. ✓ Accessibility basics (ARIA labels, semantic HTML)
3. Image optimization (WebP conversion, lazy loading)
4. Caching headers

### Medium Priority
1. CSS purging and minification
2. Critical CSS inline
3. Advanced accessibility features
4. Performance monitoring

### Low Priority (Nice to Have)
1. Service worker for offline support
2. Progressive Web App features
3. Advanced analytics
4. A/B testing

## Monitoring and Maintenance

### Regular Checks
- Monthly performance audits with Lighthouse
- Quarterly accessibility reviews
- Monitor Core Web Vitals in Google Search Console
- Review analytics for user experience issues

### Tools Setup
```bash
# Install Lighthouse CI
npm install -g @lhci/cli

# Run Lighthouse audit
lhci autorun --collect.url=https://yoursite.com
```

---

## Quick Reference Commands

```bash
# Jekyll build for production
JEKYLL_ENV=production bundle exec jekyll build

# Test site locally
bundle exec jekyll serve

# Check for broken links
bundle exec htmlproofer ./_site --disable-external

# Performance audit
lighthouse https://yoursite.com --view

# Accessibility audit
pa11y https://yoursite.com
```

---

**Last Updated:** {{ "now" | date: "%B %d, %Y" }}
