#!/bin/bash

# Make the binary executable
chmod +x xmlui-test-server

# On macOS, remove quarantine attribute if present
if [[ "$(uname)" == "Darwin" ]]; then
  xattr -d com.apple.quarantine xmlui-test-server 2>/dev/null || true
fi

./xmlui-test-server -api api.json
