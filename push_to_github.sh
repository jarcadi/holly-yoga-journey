#!/bin/bash

# Script to push updates to GitHub repository for Holly's Yoga Journey
# To be run after updates to website files

cd /home/jarcadi/.openclaw/workspace/yoga-site/

# Check if there are changes to commit
if git status --porcelain | grep .; then
    git add .
    git commit -m "Automated update: $(date +%Y-%m-%d) - Schedule and content refresh"
    
    # Read GitHub token from file (ensure it's set)
    if [ -f "/home/jarcadi/.openclaw/workspace/github-token.txt" ]; then
        GITHUB_TOKEN=$(cat /home/jarcadi/.openclaw/workspace/github-token.txt)
        git push https://$GITHUB_TOKEN@github.com/yourusername/holly-yoga-journey.git main
        echo "Pushed updates to GitHub"
    else
        echo "GitHub token not found. Please set up token at /home/jarcadi/.openclaw/workspace/github-token.txt"
        echo "Changes committed locally but not pushed."
    fi
else
    echo "No changes to commit."
fi
