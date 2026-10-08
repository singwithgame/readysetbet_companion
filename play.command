#!/bin/bash
DIR="$(cd "$(dirname "$0")" && pwd)"
PROFILE_DIR="$DIR/browser-profile"
INDEX_URL="file://$DIR/index.html"

if [ -d "/Applications/Microsoft Edge.app" ]; then
    open -na "Microsoft Edge" --args --app="$INDEX_URL" --allow-file-access-from-files --user-data-dir="$PROFILE_DIR" --ignore-gpu-blocklist --enable-gpu-rasterization
elif [ -d "/Applications/Google Chrome.app" ]; then
    open -na "Google Chrome" --args --app="$INDEX_URL" --allow-file-access-from-files --user-data-dir="$PROFILE_DIR" --ignore-gpu-blocklist --enable-gpu-rasterization
else
    echo "Chrome or Edge not found! Please install Microsoft Edge or Google Chrome."
    exit 1
fi
