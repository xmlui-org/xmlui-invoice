#!/bin/bash
set -e

# Remove quarantine attribute for Gatekeeper, if present
xattr -d com.apple.quarantine xmlui-test-server-macos-arm64 2>/dev/null || true

# Run
./xmlui-test-server-macos-arm64 -api api.json


