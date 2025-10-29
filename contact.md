---
layout: about
title: Contact Me
---

## Get In Touch

I'm always interested in hearing from fellow developers, potential collaborators, or anyone interested in discussing technology and web development. Whether you have a question, a project idea, or just want to connect, feel free to reach out!

---

## Contact Form

<form id="contact-form" class="space-y-6 max-w-2xl mx-auto" action="https://formspree.io/f/YOUR_FORM_ID" method="POST">
  <!-- Name Field -->
  <div>
    <label for="name" class="block text-sm font-semibold text-gray-900 mb-2">
      Name <span class="text-red-500">*</span>
    </label>
    <input
      type="text"
      id="name"
      name="name"
      required
      class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500 transition-colors"
      placeholder="Your full name"
      aria-required="true"
    />
  </div>

  <!-- Email Field -->
  <div>
    <label for="email" class="block text-sm font-semibold text-gray-900 mb-2">
      Email <span class="text-red-500">*</span>
    </label>
    <input
      type="email"
      id="email"
      name="_replyto"
      required
      class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500 transition-colors"
      placeholder="your.email@example.com"
      aria-required="true"
    />
  </div>

  <!-- Subject Field -->
  <div>
    <label for="subject" class="block text-sm font-semibold text-gray-900 mb-2">
      Subject <span class="text-red-500">*</span>
    </label>
    <input
      type="text"
      id="subject"
      name="_subject"
      required
      class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500 transition-colors"
      placeholder="What's this about?"
      aria-required="true"
    />
  </div>

  <!-- Message Field -->
  <div>
    <label for="message" class="block text-sm font-semibold text-gray-900 mb-2">
      Message <span class="text-red-500">*</span>
    </label>
    <textarea
      id="message"
      name="message"
      rows="6"
      required
      class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500 transition-colors resize-y"
      placeholder="Your message here..."
      aria-required="true"
    ></textarea>
  </div>

  <!-- Hidden Fields for Formspree -->
  <input type="hidden" name="_next" value="/contact.html?success=true" />
  <input type="text" name="_gotcha" style="display:none" />

  <!-- Submit Button -->
  <div>
    <button
      type="submit"
      class="w-full px-6 py-4 bg-gradient-to-r from-indigo-600 to-purple-600 text-white font-semibold rounded-lg shadow-lg hover:shadow-xl hover:from-indigo-700 hover:to-purple-700 focus:outline-none focus:ring-4 focus:ring-indigo-300 transition-all duration-300 transform hover:-translate-y-0.5"
    >
      <span class="inline-flex items-center justify-center">
        <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z" />
        </svg>
        Send Message
      </span>
    </button>
  </div>
</form>

<!-- Success Message -->
<div id="success-message" class="hidden max-w-2xl mx-auto mt-8 p-6 bg-green-50 border border-green-200 rounded-lg">
  <div class="flex items-center">
    <svg class="w-6 h-6 text-green-600 mr-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" />
    </svg>
    <p class="text-green-800 font-semibold">Thank you for your message! I'll get back to you soon.</p>
  </div>
</div>

<script>
  // Show success message if redirected with success parameter
  if (window.location.search.includes('success=true')) {
    document.getElementById('success-message').classList.remove('hidden');
    document.getElementById('contact-form').classList.add('hidden');
  }
</script>

---

## Other Ways to Connect

<div class="grid grid-cols-1 md:grid-cols-3 gap-6 max-w-4xl mx-auto my-12">
  <!-- GitHub Card -->
  <a href="https://github.com/yunjj92" target="_blank" rel="noopener noreferrer" class="block p-6 bg-white rounded-xl shadow-md hover:shadow-xl transition-all duration-300 border border-gray-200 hover:border-indigo-300 hover:-translate-y-1 group">
    <div class="flex flex-col items-center text-center">
      <div class="w-16 h-16 bg-gray-900 rounded-full flex items-center justify-center mb-4 group-hover:bg-indigo-600 transition-colors">
        <svg class="w-8 h-8 text-white" fill="currentColor" viewBox="0 0 24 24">
          <path fill-rule="evenodd" d="M12 2C6.477 2 2 6.484 2 12.017c0 4.425 2.865 8.18 6.839 9.504.5.092.682-.217.682-.483 0-.237-.008-.868-.013-1.703-2.782.605-3.369-1.343-3.369-1.343-.454-1.158-1.11-1.466-1.11-1.466-.908-.62.069-.608.069-.608 1.003.07 1.531 1.032 1.531 1.032.892 1.53 2.341 1.088 2.91.832.092-.647.35-1.088.636-1.338-2.22-.253-4.555-1.113-4.555-4.951 0-1.093.39-1.988 1.029-2.688-.103-.253-.446-1.272.098-2.65 0 0 .84-.27 2.75 1.026A9.564 9.564 0 0112 6.844c.85.004 1.705.115 2.504.337 1.909-1.296 2.747-1.027 2.747-1.027.546 1.379.202 2.398.1 2.651.64.7 1.028 1.595 1.028 2.688 0 3.848-2.339 4.695-4.566 4.943.359.309.678.92.678 1.855 0 1.338-.012 2.419-.012 2.747 0 .268.18.58.688.482A10.019 10.019 0 0022 12.017C22 6.484 17.522 2 12 2z" clip-rule="evenodd" />
        </svg>
      </div>
      <h3 class="text-lg font-bold text-gray-900 mb-2">GitHub</h3>
      <p class="text-sm text-gray-600">Check out my code and projects</p>
    </div>
  </a>

  <!-- LinkedIn Card -->
  <a href="https://linkedin.com/in/yunjj92" target="_blank" rel="noopener noreferrer" class="block p-6 bg-white rounded-xl shadow-md hover:shadow-xl transition-all duration-300 border border-gray-200 hover:border-indigo-300 hover:-translate-y-1 group">
    <div class="flex flex-col items-center text-center">
      <div class="w-16 h-16 bg-blue-600 rounded-full flex items-center justify-center mb-4 group-hover:bg-indigo-600 transition-colors">
        <svg class="w-8 h-8 text-white" fill="currentColor" viewBox="0 0 24 24">
          <path d="M20.447 20.452h-3.554v-5.569c0-1.328-.027-3.037-1.852-3.037-1.853 0-2.136 1.445-2.136 2.939v5.667H9.351V9h3.414v1.561h.046c.477-.9 1.637-1.85 3.37-1.85 3.601 0 4.267 2.37 4.267 5.455v6.286zM5.337 7.433c-1.144 0-2.063-.926-2.063-2.065 0-1.138.92-2.063 2.063-2.063 1.14 0 2.064.925 2.064 2.063 0 1.139-.925 2.065-2.064 2.065zm1.782 13.019H3.555V9h3.564v11.452zM22.225 0H1.771C.792 0 0 .774 0 1.729v20.542C0 23.227.792 24 1.771 24h20.451C23.2 24 24 23.227 24 22.271V1.729C24 .774 23.2 0 22.222 0h.003z" />
        </svg>
      </div>
      <h3 class="text-lg font-bold text-gray-900 mb-2">LinkedIn</h3>
      <p class="text-sm text-gray-600">Connect professionally</p>
    </div>
  </a>

  <!-- Email Card -->
  <a href="mailto:your.email@example.com" class="block p-6 bg-white rounded-xl shadow-md hover:shadow-xl transition-all duration-300 border border-gray-200 hover:border-indigo-300 hover:-translate-y-1 group">
    <div class="flex flex-col items-center text-center">
      <div class="w-16 h-16 bg-purple-600 rounded-full flex items-center justify-center mb-4 group-hover:bg-indigo-600 transition-colors">
        <svg class="w-8 h-8 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z" />
        </svg>
      </div>
      <h3 class="text-lg font-bold text-gray-900 mb-2">Email</h3>
      <p class="text-sm text-gray-600">Send me a direct email</p>
    </div>
  </a>
</div>

---

## Response Time

I typically respond to messages within 24-48 hours during business days. If you don't hear back from me within that timeframe, please feel free to send a follow-up message.

---

<div style="text-align: center; color: #6b7280; font-size: 0.875rem; margin-top: 3rem;">
  <p><em>Looking forward to connecting with you!</em></p>
</div>
