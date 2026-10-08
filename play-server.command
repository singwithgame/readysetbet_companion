#!/bin/bash
DIR="$(cd "$(dirname "$0")" && pwd)"
PROFILE_DIR="$DIR/browser-profile"
cd "$DIR"

PORT=8000
while [ $PORT -le 8010 ]; do
    if ! lsof -i :$PORT >/dev/null 2>&1; then
        break
    fi
    PORT=$((PORT+1))
done

if [ $PORT -gt 8010 ]; then
    echo "No available ports between 8000 and 8010."
    exit 1
fi

if command -v python3 >/dev/null 2>&1; then
    python3 -m http.server $PORT >/dev/null 2>&1 &
    SERVER_PID=$!
elif command -v ruby >/dev/null 2>&1; then
    ruby -run -e httpd . -p $PORT >/dev/null 2>&1 &
    SERVER_PID=$!
else
    echo "Python3 or Ruby not found! Please install one to run the local server."
    exit 1
fi

trap 'kill $SERVER_PID 2>/dev/null' EXIT

MAX_WAIT=5
WAIT_COUNT=0
while [ $WAIT_COUNT -lt $MAX_WAIT ]; do
    if curl -s -o /dev/null "http://localhost:$PORT/"; then
        break
    fi
    sleep 1
    WAIT_COUNT=$((WAIT_COUNT+1))
done

INDEX_URL="http://localhost:$PORT/index.html"

if [ -d "/Applications/Microsoft Edge.app" ]; then
    open -Wna "Microsoft Edge" --args --app="$INDEX_URL" --user-data-dir="$PROFILE_DIR" --ignore-gpu-blocklist --enable-gpu-rasterization
elif [ -d "/Applications/Google Chrome.app" ]; then
    open -Wna "Google Chrome" --args --app="$INDEX_URL" --user-data-dir="$PROFILE_DIR" --ignore-gpu-blocklist --enable-gpu-rasterization
else
    echo "Chrome or Edge not found!"
    exit 1
fi
