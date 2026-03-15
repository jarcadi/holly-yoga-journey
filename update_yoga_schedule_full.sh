#!/bin/bash

# Script to update Holly Arcadi's yoga schedule on her website from MindBodyOnline, including ICS and timestamp
# Run daily via cron job set by OpenClaw

# Set working directory
cd /home/jarcadi/.openclaw/workspace/yoga-site/

# Calculate dates for next week and the following week (MM/DD/YYYY format)
TODAY=$(date +%Y-%m-%d)
NEXT_WEEK_START=$(date -d "$TODAY + 1 day" +%m/%d/%Y)
FOLLOWING_WEEK_START=$(date -d "$TODAY + 8 days" +%m/%d/%Y)
NEXT_WEEK_RANGE=$(date -d "$TODAY + 1 day" +%B\ %-d)-$(date -d "$TODAY + 7 days" +%-d),\ %Y
FOLLOWING_WEEK_RANGE=$(date -d "$TODAY + 8 days" +%B\ %-d)-$(date -d "$TODAY + 14 days" +%-d),\ %Y

# URLs for MindBodyOnline schedules
NEXT_WEEK_URL="https://clients.mindbodyonline.com/classic/mainclass?studioid=2148&stype=-7&view=week&trn=100001042&date=$NEXT_WEEK_START"
FOLLOWING_WEEK_URL="https://clients.mindbodyonline.com/classic/mainclass?studioid=2148&stype=-7&view=week&trn=100001042&date=$FOLLOWING_WEEK_START"

# Temporary files for screenshots
NEXT_WEEK_IMG="/home/jarcadi/.openclaw/media/browser/next_week_$(date +%F_%H-%M-%S).png"
FOLLOWING_WEEK_IMG="/home/jarcadi/.openclaw/media/browser/following_week_$(date +%F_%H-%M-%S).png"

# Log file
LOG_FILE="/home/jarcadi/.openclaw/workspace/yoga-site/update_schedule.log"
echo "[$(date)] Starting schedule update for $NEXT_WEEK_RANGE and $FOLLOWING_WEEK_RANGE" >> $LOG_FILE

# Placeholder for browser screenshot (to be handled by agent in cron job)
echo "[$(date)] Would fetch screenshot for next week at $NEXT_WEEK_URL to $NEXT_WEEK_IMG" >> $LOG_FILE
echo "[$(date)] Would fetch screenshot for following week at $FOLLOWING_WEEK_URL to $FOLLOWING_WEEK_IMG" >> $LOG_FILE

# Since direct tool calls are handled by agent, note for agent to process
# Agent will update index.html with new schedule, ICS file, and timestamp

# Update last modified timestamp in index.html
echo "[$(date)] Updating last modified timestamp in index.html" >> $LOG_FILE
CURRENT_DATE_TIME=$(date +"%B %d, %Y %I:%M %p EDT")
sed -i "s/Last updated: <span id=\"last-modified\">[^<]*</Last updated: <span id=\"last-modified\">$CURRENT_DATE_TIME</g" /home/jarcadi/.openclaw/workspace/yoga-site/index.html

echo "[$(date)] Schedule, ICS, and timestamp update process initiated" >> $LOG_FILE
