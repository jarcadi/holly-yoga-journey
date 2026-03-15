#!/usr/bin/env python3

import re

# Read the original index.html
with open('/home/jarcadi/.openclaw/workspace/yoga-site/index.html', 'r') as f:
    content = f.read()

# Read the updated script content for loading fix
with open('/home/jarcadi/.openclaw/workspace/yoga-site/fix-loading-issue.html', 'r') as f:
    updated_script = f.read()

# Replace the existing script section using regex
updated_content = re.sub(r'<script>.*?</script>', updated_script, content, flags=re.DOTALL)

# Write the updated content back to index.html
with open('/home/jarcadi/.openclaw/workspace/yoga-site/index.html', 'w') as f:
    f.write(updated_content)

print('Script updated successfully in index.html for loading issue debugging')
