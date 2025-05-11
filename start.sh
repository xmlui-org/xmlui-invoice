#!/bin/bash

# Make the binary executable
chmod +x xmlui-test-server

# On macOS, remove quarantine attribute if present
if [[ "$(uname)" == "Darwin" ]]; then
  xattr -d com.apple.quarantine xmlui-test-server 2>/dev/null || true
fi

# Start the server with logging
./xmlui-test-server -api sql/api.json -show-responses 2>&1 | tee server_log.txt
