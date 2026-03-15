#!/usr/bin/env python3

import re

# Read the original index.html
with open('/home/jarcadi/.openclaw/workspace/yoga-site/index.html', 'r') as f:
    content = f.read()

# Read the updated refined schedule content
with open('/home/jarcadi/.openclaw/workspace/yoga-site/refined-schedule.html', 'r') as f:
    refined_schedule = f.read()

# Replace the schedule section using regex
updated_content = re.sub(r'<section id="schedule"[^>]*>.*?</section>', refined_schedule, content, flags=re.DOTALL)

# Write the updated content back to index.html
with open('/home/jarcadi/.openclaw/workspace/yoga-site/index.html', 'w') as f:
    f.write(updated_content)

print('Refined schedule updated successfully in index.html')
