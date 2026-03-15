#!/usr/bin/env python3

import re

# Read the original index.html
with open('/home/jarcadi/.openclaw/workspace/yoga-site/index.html', 'r') as f:
    content = f.read()

# Read the updated contact form content without email and phone
with open('/home/jarcadi/.openclaw/workspace/yoga-site/updated-contact-no-info.html', 'r') as f:
    updated_contact = f.read()

# Replace the contact section using regex
updated_content = re.sub(r'<section id="contact"[^>]*>.*?</section>', updated_contact, content, flags=re.DOTALL)

# Write the updated content back to index.html
with open('/home/jarcadi/.openclaw/workspace/yoga-site/index.html', 'w') as f:
    f.write(updated_content)

print('Contact section updated successfully in index.html without email and phone info')
