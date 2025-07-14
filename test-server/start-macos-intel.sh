#!/usr/bin/env bash
set -e

# Remove quarantine attribute for Gatekeeper, if present
xattr -d com.apple.quarantine xmlui-test-server-macos-intel 2>/dev/null || true

# Run
./xmlui-test-server-macos-intel -api api.json
