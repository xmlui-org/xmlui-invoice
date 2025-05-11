#!/bin/bash

# Make the binary executable
chmod +x xmlui-test-server

# On macOS, remove quarantine attribute if present
if [[ "$(uname)" == "Darwin" ]]; then
  xattr -d com.apple.quarantine xmlui-test-server 2>/dev/null || true
fi

osascript -e 'tell app "Terminal"
    do script "cd \"'"$(pwd)"'\" && ./xmlui-test-server -api sql/api.json -show-responses | tee server_log.txt"
end tell'


