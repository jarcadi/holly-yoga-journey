#!/usr/bin/env python3

import re

# Read the original index.html
with open('/home/jarcadi/.openclaw/workspace/yoga-site/index.html', 'r') as f:
    content = f.read()

# Read the updated schedule content with calendar link
with open('/home/jarcadi/.openclaw/workspace/yoga-site/refined-schedule-with-calendar.html', 'r') as f:
    updated_schedule = f.read()

# Replace the schedule section using regex
updated_content = re.sub(r'<section id="schedule"[^>]*>.*?</section>', updated_schedule, content, flags=re.DOTALL)

# Write the updated content back to index.html
with open('/home/jarcadi/.openclaw/workspace/yoga-site/index.html', 'w') as f:
    f.write(updated_content)

print('Schedule with calendar link updated successfully in index.html')
