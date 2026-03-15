#!/usr/bin/env python3

import re

# Read the original index.html
with open('/home/jarcadi/.openclaw/workspace/yoga-site/index.html', 'r') as f:
    content = f.read()

# Read the updated navigation menu content with inline styles
with open('/home/jarcadi/.openclaw/workspace/yoga-site/updated-nav-menu-inline.html', 'r') as f:
    updated_nav = f.read()

# Replace the navigation section using regex
updated_content = re.sub(r'<nav class="text-white sticky top-0 z-50 shadow-md"[^>]*>.*?</nav>', updated_nav, content, flags=re.DOTALL)

# Write the updated content back to index.html
with open('/home/jarcadi/.openclaw/workspace/yoga-site/index.html', 'w') as f:
    f.write(updated_content)

print('Navigation menu with inline styles updated successfully in index.html')
