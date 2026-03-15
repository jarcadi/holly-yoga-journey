#!/bin/bash
# Simple script to start the local server for yoga-site
# Run with: bash start-server.sh
# Updated: 2026-03-01 07:41 EST with aggressive kill and debug logging

PORT=8899
LOGFILE=/home/jarcadi/.openclaw/workspace/yoga-site/server.log

# Kill ALL existing server processes aggressively
pkill -9 -f "python3 -m http.server" 2>/dev/null
echo "Killed all existing server processes at $(date)" >> $LOGFILE
echo "Starting server on port $PORT at $(date)..."

# Start the server with nohup to persist after logout
cd /home/jarcadi/.openclaw/workspace/yoga-site
echo "Starting server in $(pwd) on port $PORT at $(date)" >> $LOGFILE
nohup python3 -m http.server $PORT >> $LOGFILE 2>&1 &

# Store the PID
echo $! > server.pid
echo "Server started with PID $(cat server.pid)"
echo "Access at http://localhost:$PORT"
echo "Logs at $LOGFILE"
echo "To stop, run: pkill -f 'python3 -m http.server'"

# Check if it's running
ps aux | grep "python3 -m http.server $PORT" | grep -v grep || echo "Warning: Server process not found after start"